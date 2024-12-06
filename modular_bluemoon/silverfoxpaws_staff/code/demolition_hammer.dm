/obj/item/demolition_hammer	// https://en.wikipedia.org/wiki/Demolition_Hammer
	name = "Demolition Hammer"
	desc = "Chief Engineer's sledgehammer. The finest choice for tasks of demolishing something... or someone."
	icon = 'modular_bluemoon/silverfoxpaws_staff/icons/obj/items_and_weapons.dmi'
	lefthand_file = 'modular_bluemoon/silverfoxpaws_staff/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'modular_bluemoon/silverfoxpaws_staff/icons/mob/inhands/items_righthand.dmi'
	icon_state = "dmolotred_0"
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 100)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	w_class = WEIGHT_CLASS_BULKY
	sharpness = SHARP_NONE	// Blunt damage exclusive.
	slot_flags = NONE		// Doesn't have on_back sprites...
	force = 5
	throwforce = 15
	armour_penetration = 40
	wound_bonus = 8
	bare_wound_bonus = 14
	max_integrity = 200
	attack_verb = list("crushed", "big ironed", "smashed", "destroyed", "demolished", "nailed")
	hitsound = 'modular_bluemoon/fluffs/sound/weapon/stab_hammer.ogg'
	usesound = 'sound/weapons/sonic_jackhammer.ogg'

	/// Track wielded status on item.
	var/wielded = FALSE


/obj/item/demolition_hammer/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, PROC_REF(on_wield))
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, PROC_REF(on_unwield))


/obj/item/demolition_hammer/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded = 5, force_wielded = 22, icon_wielded = "dmolotred_1")


/obj/item/demolition_hammer/update_icon_state()
	icon_state = "dmolotred_0"


/obj/item/demolition_hammer/afterattack(atom/A, mob/living/user, proximity)
	. = ..()

	if(!proximity || !wielded || IS_STAMCRIT(user))
		return

	if(istype(A, /obj/structure/window/reinforced))	// Works better with unarmored windows.
		var/obj/structure/window/reinforced = A
		reinforced.take_damage(5, BRUTE, MELEE, FALSE)
		user.visible_message(span_warning("The sledge's head bounced off the glass!"))

	else if(istype(A, /obj/structure/window))
		var/obj/structure/window/window = A
		window.take_damage(200, BRUTE, MELEE, FALSE)


/// Triggered on wield of two handed item.
/obj/item/demolition_hammer/proc/on_wield(obj/item/source, mob/user)
	wielded = TRUE


/// Triggered on unwield of two handed item.
/obj/item/demolition_hammer/proc/on_unwield(obj/item/source, mob/user)
	wielded = FALSE


/turf/closed/wall/try_destroy(obj/item/I, mob/user, turf/T)
	if(!istype(I, /obj/item/demolition_hammer))
		return ..()

	var/initial_wall_type = src.type
	to_chat(user, span_notice("You begin to crush though [src]..."))

	if(!do_after(user, 5 SECONDS, target = src))
		return FALSE

	if(src.type != initial_wall_type)
		return FALSE

	if(user.loc != T)
		return FALSE

	I.play_tool_sound(src)
	visible_message(span_warning("[user] crushes through [src] with [I]!"), "<i>You hear the grinding of metal.</i>")
	dismantle_wall()
	return TRUE


/turf/closed/wall/r_wall/try_destroy(obj/item/I, mob/user, turf/T)
	if(!istype(I, /obj/item/demolition_hammer))
		return ..()

	var/initial_wall_type = src.type
	to_chat(user, span_notice("You begin to crush though [src]..."))

	if(!do_after(user, 12 SECONDS, target = src))
		return FALSE

	if(src.type != initial_wall_type)
		return FALSE

	if(user.loc != T)
		return FALSE

	I.play_tool_sound(src)
	visible_message(span_warning("[user] crushes through [src] with [I]!"), "<i>You hear the grinding of metal.</i>")
	dismantle_wall()
	return TRUE
