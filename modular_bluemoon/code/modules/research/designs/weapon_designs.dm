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
