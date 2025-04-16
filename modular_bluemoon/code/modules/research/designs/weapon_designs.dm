//////////////////
//Bulldog design//
//////////////////

/obj/item/disk/design_disk/adv/ammo/bulldog
	name = "Bulldog ammo desine disk"
	desc = "Вставьте в автолат, что бы изготовить магазины для вашего оружия"

/obj/item/disk/design_disk/adv/ammo/bulldog/Initialize(mapload)
	. = ..()
	var/datum/design/ammo_bulldog/B = new
	var/datum/design/ammo_bulldog_slug/S = new
	blueprints[1] = B
	blueprints[2] = S

/datum/design/ammo_bulldog
	name = "shotgun magazine (12g buckshot)"
	desc = "A drum magazine."
	id = "ammo_bulldog"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 20000)
	build_path = /obj/item/ammo_box/magazine/m12g
	category = list("Imported")

/datum/design/ammo_bulldog_slug
	name = "shotgun magazine (12g slugs)"
	desc = "A drum magazine. Now with slug shots"
	id = "ammo_bulldog_slug"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 25000)
	build_path = /obj/item/ammo_box/magazine/m12g/slug
	category = list("Imported")

//////////////////
// M90GL design	//
//////////////////

/obj/item/disk/design_disk/ammo/m90
	name = "M90GL ammo desine disk"
	desc = "Вставьте в автолат, что бы изготовить магазины для вашего оружия"

/obj/item/disk/design_disk/ammo/m90/Initialize(mapload)
	. = ..()
	var/datum/design/ammo_m90/M = new
	blueprints[1] = M

/datum/design/ammo_m90
	name = "toploader magazine (5.56mm)"
	desc = "A toploader magazine containing 30 shots of 5.56 ammo."
	id = "ammo_m90"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 25000)
	build_path = /obj/item/ammo_box/magazine/m556
	category = list("Imported")

//////////////////
//ACR5m30 design//
//////////////////

/datum/design/mag_acr5
	name = "ACR-5 Rifle Magazine (5.8mm)"
	desc = "A standart 26 shot magazine for 5.8 mm ACR-5m30 rifle, loaded."
	id = "mag_acr5"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 20000, /datum/material/titanium = 500)
	build_path = /obj/item/ammo_box/magazine/acr5m30
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_RED

/datum/design/mag_acr5/empty
	name = "ACR-5 Rifle Magazine (Empty)"
	desc = "A standart 26 shot magazine for 5.8 mm ACR-5m30 rifle."
	id = "mag_acr5_empty"
	materials = list(/datum/material/iron = 6500)
	build_path = /obj/item/ammo_box/magazine/acr5m30/empty

////////////////// BOXES //////////////////

/datum/design/box_acr5/ap
	name = "Ammo Box (5.8x40mm Armour Piercing)"
	desc = "A box of 5.8x40 mm  armour piercing titanium bullets. 30 cartridges total."
	id = "box_acr5_ap"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 24000, /datum/material/titanium = 1000, /datum/material/silver = 500)
	build_path = /obj/item/ammo_box/magazine/acr5m30/ap
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/box_acr5/hp
	name = "Ammo Box (5.8x40mm Hollow Pointed)"
	desc = "A box of 5.8x40 mm expancive hollow pointed ammo. 30 cartridges total."
	id = "box_acr5_hp"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 24000, /datum/material/silver = 1000)
	build_path = /obj/item/ammo_box/a58mm/hp
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/box_acr5/hs
	name = "Ammo Box (5.8x40mm HOTSHOT)"
	desc = "A box of 5.8x40 mm incendiary plasma-phosphorus ammo. 30 cartridges total."
	id = "box_acr5_hs"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 20000, /datum/material/plasma = 1500)
	build_path = /obj/item/ammo_box/a58mm/hs
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
