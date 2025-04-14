/obj/item/crowbar/freeman
	name = "blood soaked crowbar"
	desc = "A heavy handed crowbar, it drips with blood."
	icon = 'modular_bluemoon/icons/obj/items_and_weapons.dmi'
	icon_state = "freeman_crowbar"
	force = 35
	throwforce = 45
	toolspeed = 0.1
	wound_bonus = 10
	hitsound = 'modular_bluemoon/sound/weapons/mesa/crowbar2.ogg'
	mob_throw_hit_sound = 'modular_bluemoon/sound/weapons/mesa/crowbar2.ogg'
	can_force_powered = TRUE

/obj/item/crowbar/freeman/ultimate
	name = "\improper Freeman's crowbar"
	desc = "A weapon wielded by an ancient physicist, the blood of hundreds seeps through this rod of iron and malice."
	force = 45

/obj/item/crowbar/freeman/ultimate/Initialize(mapload)
	. = ..()
	add_filter("rad_glow", 2, list("type" = "outline", "color" = "#fbff1479", "size" = 2))

/obj/item/wrench/shepard
	name = "Old wrench"
	desc = "Этот гаечный ключ довольно увесист и излучает... Своеобразную ауру.."
	icon = 'modular_bluemoon/icons/obj/items_and_weapons.dmi'
	icon_state = "shepard_wrench"
	item_state = "wrench_caravan"
	force = 40
	attack_speed = 20
	throwforce = 45
	toolspeed = 0.1
	wound_bonus = 10
	w_class = WEIGHT_CLASS_NORMAL
	hitsound = 'modular_bluemoon/sound/weapons/mesa/wrenchhit.ogg'
