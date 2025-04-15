/obj/item/modkit/shigu_kit
	name = "Butcher Knife Kit"
	desc = "A modkit for making a Butcher Knife into a Shigu Knife."
	product = /obj/item/kitchen/knife/butcher/shigu_knife
	fromitem = list(/obj/item/kitchen/knife/butcher)

/obj/item/kitchen/knife/butcher/shigu_knife
	name = "Shigu Butcher Knife"
	desc = "A ultra-sharp butcher knife. Maybe his seemingly glaring surface can scare!"
	icon_state = "Shigu_Knife"

//////////////////////////////////////////////////

/obj/item/modkit/impactbaton_kit
	name = "Impact Baton Kit"
	desc = "A modkit for making a police baton into a jitte baton."
	product = /obj/item/melee/classic_baton/impactbaton_jitte
	fromitem = list(/obj/item/melee/classic_baton)

/obj/item/melee/classic_baton/impactbaton_jitte
	name = "Impact Baton 1/62-H"
	desc = "Impact Baton model 1, year 62th \"Hardlight\". Standard carbon fiber baton of Yernela catcrin law enforcements with hardlight technology sword-cutter."
	icon = 'modular_bluemoon/fluffs/icons/obj/melee.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/belt.dmi'
	icon_state = "impactbaton"
	item_state = "impact_baton"
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/melee_righthand.dmi'

/obj/item/modkit/catcrinbaton_kit
	name = "3/51-H Telescopic Baton Kit"
	desc = "A modkit for making a telescopic baton into an impact baton."
	product = /obj/item/melee/classic_baton/telescopic/catcrin
	fromitem = list(/obj/item/melee/classic_baton/telescopic)

/obj/item/melee/classic_baton/telescopic/catcrin
	name = "Impact Baton 3/51-H"
	desc = "Impact Baton model 3, year 51th \"Hardlight\". Easy conсealable telescopic baton of hight-position catcrins with paralitic hardlight elements on the tip and as handguard."
	icon = 'modular_bluemoon/fluffs/icons/obj/melee.dmi'
	icon_state = "hardlightbaton_0"
	item_state = "hardlightbaton_0"
	on_icon_state = "hardlightbaton_1"
	off_icon_state = "hardlightbaton_0"
	on_item_state = "hardlightbaton_1"
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/melee_righthand.dmi'
