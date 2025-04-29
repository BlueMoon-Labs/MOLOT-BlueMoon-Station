//Гига кровати
/obj/structure/bed/gaint //corner
	name = "gaint bed"
	icon_state = "bed_corner"
	icon = 'modular_bluemoon/icons/obj/gaint_bed.dmi'

/obj/structure/bed/gaint/side
	icon_state = "bed_side"

/obj/structure/bed/gaint/middle
	icon_state = "bed_middle"

/obj/structure/bed/gaint/pillow //corner
	icon_state = "bed_corner_pillow"

/obj/structure/bed/gaint/pillow/side
	icon_state = "bed_side_pillow"

//Копипаст из code\game\objects\structures\beds_chairs\chair.dm dont look on me
/obj/structure/bed/gaint/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/simple_rotation, ROTATION_ALTCLICK | ROTATION_CLOCKWISE, CALLBACK(src, PROC_REF(can_user_rotate)), CALLBACK(src, PROC_REF(can_be_rotated)), null)

/obj/structure/bed/gaint/proc/can_be_rotated(mob/user)
	return TRUE

/obj/structure/bed/gaint/proc/can_user_rotate(mob/user)
	var/mob/living/L = user
	if(istype(L))
		if(!user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
			return FALSE
		else
			return TRUE
	return FALSE
//Копипаст закончен
