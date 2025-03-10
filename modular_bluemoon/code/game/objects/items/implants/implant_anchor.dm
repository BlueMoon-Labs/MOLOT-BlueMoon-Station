/obj/item/implant/anchor
	name = "anchor implant"
	desc = "Prevents you from leaving local sector, guarded by you."
	removable = FALSE
	var/list/allowed_z_levels


/obj/item/implant/anchor/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Employee Anchor Implant<BR>
				<b>Implant Details:</b> Prevents implanted from leaving local sector, guarded by you.<BR>"}
	return dat

/obj/item/implanter/anchor
	name = "Implanter (anchor)"
	imp_type = /obj/item/implant/anchor

/obj/item/implantcase/anchor
	name = "implant case - 'anchor'"
	desc = "A glass case containing an anchor implant."
	imp_type = /obj/item/implant/anchor

/obj/item/implant/anchor/implant(mob/living/target, mob/user, silent, force)
	. = ..()
	allowed_z_levels += SSmapping.levels_by_trait(ZTRAIT_CENTCOM)// цк
	allowed_z_levels += SSmapping.levels_by_all_trait(ZTRAITS_LAVALAND_JUNGLE)// ксено межшатолье
	allowed_z_levels += SSmapping.levels_by_trait(ZTRAIT_RESERVED)// инфдормы
	if(GLOB.master_mode == "Extended")
		allowed_z_levels += SSmapping.levels_by_trait(ZTRAIT_STATION)// станция
		allowed_z_levels += SSmapping.levels_by_all_trait(ZTRAITS_LAVALAND)// шахта
	if(!(target in allowed_z_levels))
		allowed_z_levels += target.z

	RegisterSignal(imp_in, COMSIG_LIVING_LIFE, PROC_REF(on_life))
	ADD_TRAIT(target, TRAIT_ANCHOR, "implant")
	target.sec_hud_set_implants()
	return TRUE

/obj/item/implant/anchor/proc/on_life(mob/living/owner)
//	to_chat(owner, "<span class='rose'>allowed_z_levels [allowed_z_levels], owner.z [owner.z] </span>")
//	to_chat(owner, "<span class='rose'>Tick</span>")
	var/area/my_area = get_area(owner)
	if(istype(my_area, /area/ruin/space/has_grav/bluemoon) || istype(my_area, /area/shuttle/sbc_corvette))
		return
	var/turf/my_location = get_turf(owner)
	if(!(my_location.z in allowed_z_levels))
		to_chat(owner, "<span class='warning'>Больно!</span>")
		owner.adjustBruteLoss(5, FALSE) //Provides slow harassing for both brute and burn damage.
		owner.adjustFireLoss(5, FALSE)
		owner.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10) // BLUEMOON ADD ебём мозг гостролькам любителям лутать космос и ходить на станцию
		to_chat(owner, "<span class='warning'>Мне становится плохо при отдалении от своего родного сектора....</span>")
