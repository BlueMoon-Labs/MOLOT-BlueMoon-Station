/datum/supply_pack/emergency/vox
	name = "Nitrogen Supply Kit"
	desc = "Комплект баллонов с азотом для поддержания жизни существ, дыщащих азотом."
	cost = 1500
	contains = list(/obj/item/tank/internals/emergency_nitrogen_ext,
					/obj/item/tank/internals/emergency_nitrogen_ext,
					/obj/item/tank/internals/emergency_nitrogen,
					/obj/item/tank/internals/emergency_nitrogen)
	crate_name = "vox supply kit"

/datum/supply_pack/emergency/vox_double
	name = "Double Nitogen Supply Kit"
	desc = "Комплект спаренных баллонов для поддержания жизни существ, дыщащих азотом."
	cost = 3000
	contains = list(/obj/item/tank/internals/emergency_nitrogen/double,
					/obj/item/tank/internals/emergency_nitrogen/double,
					/obj/item/tank/internals/emergency_nitrogen/double)
	crate_name = "double vox supply kit"
