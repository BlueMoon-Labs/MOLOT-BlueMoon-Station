/obj/item/gun/ballistic/automatic/pistol/hl9mm
	name = "9mm pistol"
	desc = " пистолет Beretta 92FS или же 9mm pistol является довольно распространённым пистолетом у охранников комплекса чёрной мезы... Выглядит невероятно старомодно "
	icon = 'modular_bluemoon/olgachan/blackmesafromnova/icons/guns/hlguns.dmi'
	icon_state = "hl9mmpistol"
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/pistolm9mm
	can_suppress = FALSE
	burst_size = 1
	fire_delay = 0
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC)
	automatic_burst_overlay = FALSE
	fire_sound = 'modular_bluemoon/olgachan/blackmesafromnova/sound/weapons/9mmhl.ogg'

/obj/item/gun/ballistic/automatic/pistol/hl9mm/update_icon_state()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"

/obj/item/gun/ballistic/automatic/sniper_rifle/m4oa1
	name = "m40a1 sniper rifle"
	desc = "Довольно старая, но верная и мощная снайперская винтовка прямиком из далёкого прошлого"
	icon = 'modular_bluemoon/olgachan/blackmesafromnova/icons/guns/hlguns.dmi'
	lefthand_file = 'modular_bluemoon/olgachan/blackmesafromnova/icons/guns/hllefthand.dmi'
	righthand_file = 'modular_bluemoon/olgachan/blackmesafromnova/icons/guns/hlrighthand.dmi'
	icon_state = "m4oa1"
	item_state = "m4oa1"
	fire_sound = 'modular_bluemoon/olgachan/blackmesafromnova/sound/weapons/sniper_fire.ogg'
	recoil = 1
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/sniper_rounds/m4oa1
	fire_delay = 30
	burst_size = 1
	can_unsuppress = TRUE
	can_suppress = TRUE
	w_class = WEIGHT_CLASS_NORMAL
	inaccuracy_modifier = 0.5
	zoomable = TRUE
	zoom_amt = 7
	zoom_out_amt = 5
	slot_flags = ITEM_SLOT_BACK
	automatic_burst_overlay = FALSE
	actions_types = list()

/obj/item/gun/ballistic/automatic/sniper_rifle/m4oa1/update_icon_state()
	if(magazine)
		icon_state = "m4oa1"
	else
		icon_state = "m4oa1_mag"

/obj/item/ammo_box/magazine/sniper_rounds/m4oa1
	name = "m4oa1 magazine"
	icon = 'modular_bluemoon/olgachan/blackmesafromnova/icons/guns/ammo_boxes.dmi'
	icon_state = "m4oa1"
	ammo_type = /obj/item/ammo_casing/p50
	max_ammo = 8
	caliber = ".50"

/obj/item/ammo_box/magazine/sniper_rounds/m4oa1/update_icon()
	. = ..()
	if(ammo_count())
		icon_state = "[initial(icon_state)]-ammo"
	else
		icon_state = "[initial(icon_state)]"

/obj/item/gun/ballistic/automatic/mp5
	name = "MP5 machinegun"
	desc = "Heckler Koch Mp5 является хоть и устаревшим, но невероятно сильным оружием в виду своей скорострельности. Какой идиот вообще подумал, что будет отличной идеей отобрать его у морпеха Хеку?"
	icon = 'modular_bluemoon/olgachan/blackmesafromnova/icons/guns/hlguns.dmi'
	lefthand_file = 'modular_bluemoon/olgachan/blackmesafromnova/icons/guns/hllefthand.dmi'
	righthand_file = 'modular_bluemoon/olgachan/blackmesafromnova/icons/guns/hlrighthand.dmi'
	icon_state = "mp5"
	item_state = "mp5"
	fire_sound = 'modular_bluemoon/olgachan/blackmesafromnova/sound/weapons/mp5.ogg'
	mag_type = /obj/item/ammo_box/magazine/mp5
	can_suppress = FALSE
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_BULKY
	burst_size = 2
	burst_shot_delay = 1
	fire_delay = 2.0 ///Это пиздец
	can_bayonet = FALSE
	automatic_burst_overlay = FALSE

/obj/item/gun/ballistic/automatic/mp5/update_icon_state()
	if(magazine)
		icon_state = "mp5"
	else
		icon_state = "mp5nomag"

/obj/item/ammo_box/magazine/mp5
	name = "MP5 magazine (10mm Auto)"
	desc = "Magazines taking 10mm ammunition; it fits in the MP5."
	icon = 'modular_bluemoon/olgachan/blackmesafromnova/icons/guns/ammo_boxes.dmi'
	icon_state = "mp5"
	ammo_type = /obj/item/ammo_casing/c10mm
	max_ammo = 30

/obj/item/ammo_box/magazine/mp5/update_icon()
	. = ..()
	if(ammo_count())
		icon_state = "[initial(icon_state)]-ammo"
	else
		icon_state = "[initial(icon_state)]"

/obj/item/gun/ballistic/shotgun/spas
	name = "SPAS 12 shotgun"
	desc = "Этот невероятно старый и брутальный дробовик заставляет вас надеть балаклаву с горнолыжными очками."
	lefthand_file = 'modular_bluemoon/olgachan/blackmesafromnova/icons/guns/hllefthand.dmi'
	righthand_file = 'modular_bluemoon/olgachan/blackmesafromnova/icons/guns/hlrighthand.dmi'
	icon =  'modular_bluemoon/olgachan/blackmesafromnova/icons/guns/hlguns.dmi'
	icon_state = "spas"
	item_state = "spas"
	fire_sound = 'modular_bluemoon/olgachan/blackmesafromnova/sound/weapons/shotgun.ogg'
	w_class = WEIGHT_CLASS_BULKY
	recoil = 5
	force = 35
	fire_delay = 20
	mag_type = /obj/item/ammo_box/magazine/internal/shot/spas
	pumpsound = 'modular_bluemoon/olgachan/blackmesafromnova/sound/weapons/shotgun_rack.ogg'
	weapon_weight = WEAPON_HEAVY

/obj/item/ammo_box/magazine/internal/shot/spas
	name = "shotgun internal magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	caliber = "shotgun"
	max_ammo = 8
