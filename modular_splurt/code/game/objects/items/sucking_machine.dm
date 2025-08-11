/obj/item/sucking_machine
	icon = 'modular_splurt/icons/obj/sucking_machine.dmi'
	name = "sucking machine"
	icon_state = "Off"
	item_state = "Off"
	desc = "A pocket sized pump and tubing assembly designed to collect and store products from mammary glands."

	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_POCKETS

	var/on = FALSE
	var/obj/item/reagent_containers/inserted_item = null

	var/milking_speed = 50
	var/engine_sound = 'sound/vehicles/carrev.ogg'
	var/target_organ  = ORGAN_SLOT_BREASTS // What organ we are transfering from
	var/inuse = FALSE

/obj/item/sucking_machine/Destroy()
	inserted_item?.forceMove(loc) //edge case of being inside another object which i don't care about
	inserted_item = null //null your refs
	. = ..()

/obj/item/sucking_machine/examine(mob/user)
	. = ..()
	to_chat(user, span_notice("[src] is currently [on ? "on" : "off"]."))
	if (inserted_item)
		to_chat(user, span_notice("[inserted_item] contains [inserted_item.reagents.total_volume]/[inserted_item.reagents.maximum_volume] units."))

/obj/item/sucking_machine/attackby(obj/item/wielded, mob/user, params)
	add_fingerprint(user)
	if(!istype(wielded, /obj/item/reagent_containers)) //the slash at the end was bugging me so hard.
		return ..()

	if(inserted_item)
		to_chat(user, span_warning("There's already a [inserted_item] inside \the [src]!"))
		return

	if(!user.transferItemToLoc(wielded, src))
		to_chat(user, span_warning("\The [wielded] is stuck to your hand!"))
		return

	inserted_item = wielded
	update_icon_state() //this is a proc that exists, you know

/obj/item/sucking_machine/interact(mob/user)
	. = ..() //call parent
	if(issilicon(user))
		return //use early returns
	if(!inserted_item)
		to_chat(user, span_warning("There's no container inside!")) //give the player feedback
		return
	on = !on
	to_chat(user, span_notice("You turn \the [src] [on ? "on" : "off"].")) //text ternaries are good (if not in excess amounts)
	update_icon_state()

/obj/item/sucking_machine/update_icon_state()
	. = ..()
	icon_state = "[on ? "On" : "Off"][inserted_item ? "Beaker" : ""]" //hardcoding icon states isn't particularly good
	item_state = icon_state //but i'll leave it since i don't want to fuck with icons

/obj/item/sucking_machine/AltClick(mob/living/user)
	add_fingerprint(user)
	user.put_in_hands(inserted_item)
	inserted_item = null
	on = FALSE
	update_icon_state()

/obj/item/sucking_machine/penis
	name = "cock milker"
	icon_state = "PenisOff"
	item_state = "PenisOff"
	desc = "A pocket sized pump and tubing assembly designed to collect and store products from the penis."
	target_organ = ORGAN_SLOT_PENIS

/obj/item/sucking_machine/penis/update_icon_state()
	. = ..()
	icon_state = "Penis[icon_state]" //for the record, i'm not doing icon states any better than sand.
	item_state = icon_state

/obj/item/sucking_machine/afterattack(mob/living/carbon/human/victim, mob/living/user) //use clear argument names, "H" is quite unclear
	if(!istype(victim) || !istype(user)) //check if we actually have the type we're expecting
		return ..()

	. = TRUE //returning true nukes afterattack, no need for nobludgeon
	if(!on)
		to_chat(user, span_notice("You can't use \the [src] while it's off."))
		return

	var/obj/item/organ/genital/genital = victim.getorganslot(target_organ)
	if(!genital)
		return
	if(inuse) //existance comparison is enough for booleans
		return

	if(!genital?.is_exposed()) //early returns are better
		to_chat(user, span_notice("You don't see anywhere to use this on."))
		return

	inuse = TRUE
	if(victim != user) //!(x == y) equals x != y except the latter is clearer
		victim.visible_message(span_love("[user] pumps [victim]'s [genital.name] using [user.ru_ego()] [src.name]."), //ironically enough we don't need \ at the ends
			span_userlove("[user] pumps your [genital.name] with [user.ru_ego()] [src.name]."), //dunno why cit is insistent on doing that
			span_userlove("Someone is pumping your [genital.name].")
		)
	else
		user.visible_message(span_love("[user] sets [src] to suck on [user.ru_ego()] [genital.name]."), //ru_ego refered to the milker, not the user
			span_userlove("You pump your [genital.name] using \the [src]."),
			span_userlove("You pump your [genital.name] into the machine.")
		)
	playsound(src, 'sound/vehicles/carrev.ogg', 30, 1, -1) //we're not changing the sound anywhere, storing the sound in a var is pointless
	if(!do_mob(user, victim, 3 SECONDS))
		inuse = FALSE
		return
	playsound(src, 'modular_sand/sound/lewd/slaps.ogg', 20, 1, -1)
	if(prob(30))
		victim.emote("moan")

	victim.add_lust(20 + rand(0, 50))
	if(victim.get_lust() >= (victim.get_climax_threshold())) //checked before + if a human doesn't have dna something is seriously wrong // BLUEMOON EDIT
		victim.mob_fill_container(genital, inserted_item, milking_speed, src) //why is this a mob proc
		victim.do_jitter_animation()

	inuse = FALSE //one set-to-false is enough
