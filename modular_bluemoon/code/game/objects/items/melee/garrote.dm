/*
 * Contains:
 * 	Traitor garrotes
 * 	Improvised fiber wire
 *  Писалось с нуля
 */

/obj/item/garrote // 6TC traitor item //  12TC Bluemoon edition
	name = "Garrote"
	desc = "A length of razor-thin wire with an elegant wooden handle on either end.<br>You suspect you'd have to be behind the target to use this weapon effectively."
	icon = 'modular_bluemoon/icons/obj/items_and_weapons.dmi'
	icon_state = "garrot_wrap"
	w_class = WEIGHT_CLASS_TINY
	var/mob/living/carbon/human/strangling
	var/mob/living/carbon/human/strangler
	var/improvised = 0
	var/wielded = FALSE
	var/oxydamage = 6

	var/list/obj/item/garrote/garroted_by = list()


/obj/item/garrote/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, PROC_REF(on_wield))
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, PROC_REF(on_unwield))

/obj/item/garrote/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed,icon_wielded="garrot_unwrap")

/obj/item/garrote/improvised/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, icon_wielded="garrot_I_unwrap")

/// triggered on wield of two handed item
/obj/item/garrote/proc/on_wield(obj/item/source, mob/user)
	wielded = TRUE

/// triggered on unwield of two handed item
/obj/item/garrote/proc/on_unwield(obj/item/source, mob/user,mob/strangling)
	wielded = FALSE

/obj/item/garrote/update_icon_state()
	//.=..()

	icon_state = "garrot_wrap"
	//return
	//icon_state = "garrot_[wielded ? "un" : ""]wrap"

/obj/item/garrote/improvised // Made via tablecrafting
	//.=..()
	name = "fiber wire"
	desc = "A length of cable with a shoddily-carved wooden handle tied to either end.<br>You suspect you'd have to be behind the target to use this weapon effectively."
	icon = 'modular_bluemoon/icons/obj/items_and_weapons.dmi'
	icon_state = "garrot_I_wrap"
	improvised = 1

/obj/item/garrote/improvised/ComponentInitialize()
	.=..()
	AddComponent(/datum/component/two_handed)

/obj/item/garrote/improvised/update_icon_state()

	icon_state = "garrot_I_wrap"



/obj/item/garrote/attack(mob/living/carbon/M, mob/user)


	if(!wielded)
		to_chat(user, "<span class = 'warning'>You must unwield the garrote to start straggling [M]!</span>")
		return

	if(!istype(user, /mob/living/carbon/human)) // spap_hand is a proc of /mob/living, user is simply /mob
		return

	var/mob/living/carbon/human/U = user
	var/victimdir = M.dir
	if((!istype(M, /mob/living/carbon)) || M.mob_weight > MOB_WEIGHT_HEAVY && U.mob_weight < MOB_WEIGHT_HEAVY_SUPER)
		to_chat(user, "<span class = 'warning'>You don't think that garroting [M] would be very effective...</span>")
		return

	if(M == U)
		U.suicide() // This will display a prompt for confirmation first.
		return

	if(M.dir != U.dir && !M.lying)
		to_chat(user, "<span class='warning'>You cannot use [src] on [M] from that angle!</span>")
		return

	if(improvised && ((M.head && (M.head.flags_cover & HEADCOVERSMOUTH)))) // Improvised garrotes are blocked by mouth-covering items.
		to_chat(user, "<span class = 'warning'>[M]'s neck is blocked by something [M.p_theyre()] wearing!</span>")
		return


	if(!(strangling) && !(user.pulling))
		strangling = M
		strangler = U
		ADD_TRAIT(strangling, TRAIT_GARROTED,"garroted")

		if(improvised) // Not a trash anymore :[
			U.grab_state = GRAB_AGGRESSIVE
			M.grabbedby(U, 1)
			M.dir = victimdir
			U.setGrabState(GRAB_AGGRESSIVE)
		else
			U.grab_state = GRAB_KILL
			M.grabbedby(U, 1)
			M.dir = victimdir
			M.AdjustSilence(6 SECONDS)
			M.drop_all_held_items()
			U.setGrabState(GRAB_KILL)

		playsound(src.loc, 'sound/weapons/cablecuff.ogg', 15, 1, -1)
		M.visible_message("<span class='danger'>[U] comes from behind and begins garroting [M] with the [src]!</span>", \
					"<span class='userdanger'>[U] begins garroting you with the [src]![improvised ? "" : " You are unable to speak!"]</span>", \
					"You hear struggling and wire strain against flesh!")
		START_PROCESSING(SSobj, src)

		return

	return

/obj/item/garrote/process()

	if(!istype(strangler, /mob/living/carbon/human)) // умер
		strangling.visible_message("<span class='info'>[strangler] removes the [src] from [strangling]'s neck.</span>")
		if(HAS_TRAIT(strangling, TRAIT_GARROTED))
			REMOVE_TRAIT(strangling, TRAIT_GARROTED, "garroted")
		strangling = null
		strangler.stop_pulling()
		STOP_PROCESSING(SSobj, src)


	if(strangling && !src.wielded) // свернул гарроту
		strangling.visible_message("<span class='info'>[strangler] removes the [src] from [strangling]'s neck.</span>")
		if(HAS_TRAIT(strangling, TRAIT_GARROTED))
			REMOVE_TRAIT(strangling, TRAIT_GARROTED, "garroted")
		strangling = null
		strangler.stop_pulling()
		STOP_PROCESSING(SSobj, src)


	if(!strangler.pulling) // отпустил
		strangling.visible_message("<span class='info'>[strangler] removes the [src] from [strangling]'s neck.</span>")
		if(HAS_TRAIT(strangling, TRAIT_GARROTED))
			REMOVE_TRAIT(strangling, TRAIT_GARROTED, "garroted")
		strangling = null
		strangler.stop_pulling()
		STOP_PROCESSING(SSobj, src)


	if(improvised)
		strangling.adjustOxyLoss(oxydamage)

	else
		strangling.Silence(6 SECONDS) // Non-improvised effects
		strangling.adjustOxyLoss(oxydamage*3)


/obj/item/garrote/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is wrapping the [src] around [user.p_their()] neck and pulling the handles! It looks like [user.p_theyre()] trying to commit suicide.</span>")
	playsound(src.loc, 'sound/weapons/cablecuff.ogg', 15, 1, -1)
	return OXYLOSS
