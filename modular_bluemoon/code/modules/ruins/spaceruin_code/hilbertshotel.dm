// Train appartment stuff
/obj/projector
	name = "fake window projector"
	icon = 'icons/turf/decals.dmi'
	icon_state = "arrows_red"
	invisibility = 100 // показывваем только избранным
	flags_1 = NO_SCREENTIPS_1
	var/image/projection
	var/moving = FALSE
	var/list/viewers = list()
	var/projection_pixel_y_offset = 0
	var/projection_pixel_x_offset = 0

/obj/projector/Initialize(mapload)
	if(istype(get_area(src), /area/hilbertshotel))
		var/area/hilbertshotel/HILBERT = get_area(src)
		HILBERT.projectors += src
	update_icon(UPDATE_OVERLAYS)
	return ..()

/obj/projector/update_overlays()
	. = ..()
	projection = image('modular_bluemoon/icons/screen/grass.dmi', src, "grass_[moving ? "moving" : "stand"]", ABOVE_MOB_LAYER)
	projection.plane =	EMISSIVE_BLOCKER_PLANE
	projection.color = color
	projection.mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	switch(dir)
		if(NORTH)
			projection.pixel_y = 64
			projection.pixel_x = -353
		if(SOUTH)
			projection.pixel_y = -224
			projection.pixel_x = -353
	projection.pixel_y += projection_pixel_y_offset
	projection.pixel_x += projection_pixel_x_offset
	. += projection

/area/hilbertshotel
	var/list/projectors = list()

///Makes the mind able to see this effect
/obj/projector/proc/AddProjection(mob/viewer)
	viewers |= viewer
	if(viewer.client)
		viewer.client.images |= projection

///Makes the mind not able to see this effect
/obj/projector/proc/RemoveProjection(mob/viewer)
	viewers -= viewer
	if(viewer.client)
		viewer.client.images -= projection

/obj/projector/Destroy()
	for(var/mob/M in viewers)
		RemoveProjection(M)

	viewers = null
	projection = null

/area/hilbertshotel/Entered(atom/movable/M, atom/OldLoc)
	. = ..()
	if(projectors.len && isliving(M))
		var/mob/living/L = M
		if(!L.mind)
			return
		for(var/obj/projector/P in projectors)
			P.AddProjection(L)

/area/hilbertshotel/Exited(atom/movable/M)
	. = ..()
	if(projectors.len && isliving(M))
		var/mob/living/L = M
		if(!L.mind)
			return
		for(var/obj/projector/P in projectors)
			P.RemoveProjection(L)


// Indestructible away mission ladders which link based on a mapped ID and height value rather than X/Y/Z.
/obj/hotel_things/train/fake_door
	name = "door"
	desc = "An extremely sturdy metal ladder."
	icon = 'modular_bluemoon/smiley/aesthetics/airlock/icons/airlocks/hatch/centcom.dmi'
	icon_state = "closed"
	resistance_flags = INDESTRUCTIBLE
	var/teleport_x = 0
	var/teleport_y = 0

/obj/hotel_things/train/fake_door/proc/travel(mob/user, is_ghost)
	var/turf/T = locate(src.x + teleport_x, src.y + teleport_y, src.z)
	if(!istype(T))
		return
	if(!is_ghost)
		user.visible_message("[user] goes through the [src].","<span class='notice'>You coming through the [src].</span>")
	var/atom/movable/AM
	if(user.pulling)
		AM = user.pulling
		AM.forceMove(T)
	user.forceMove(T)
	if(AM)
		user.start_pulling(AM)

/obj/hotel_things/train/fake_door/proc/use(mob/user, is_ghost=FALSE)
	if(!is_ghost && !in_range(src, user))
		return

	travel(user, is_ghost)

/obj/hotel_things/train/fake_door/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	use(user)

/obj/hotel_things/train/fake_door/attack_paw(mob/user)
	return use(user)

/obj/hotel_things/train/fake_door/attackby(obj/item/W, mob/user, params)
	return use(user)

/obj/hotel_things/train/fake_door/attack_robot(mob/living/silicon/robot/R)
	if(R.Adjacent(src))
		return use(R)

//ATTACK GHOST IGNORING PARENT RETURN VALUE
/obj/hotel_things/train/fake_door/attack_ghost(mob/dead/observer/user)
	use(user, TRUE)
	return ..()
