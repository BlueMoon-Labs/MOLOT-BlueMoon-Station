/obj/item/hilbertshotel
	var/rooms_can_be_locked = FALSE

/obj/item/hilbertshotel/ghostdojo
	name = "infinite dormitories"
	anchored = TRUE

/obj/item/hilbertshotel/ghostdojo/ghostcafe
	rooms_can_be_locked = TRUE

/obj/item/hilbertshotel/ghostdojo/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return
	if(((GLOB.master_mode != "Extended"))&&(user.mind?.antag_datums))
		if(user.mind?.has_antag_datum(/datum/antagonist/ghost_role))
			return promptAndCheckIn(user, user)
		if(user.mind?.has_antag_datum(/datum/antagonist/ashwalker))
			return promptAndCheckIn(user, user)
		else
			to_chat(user, "<span class='warning'>Your special role doesn't allow you to enter infinity dormitory.</span>")
			return //you can't enter infinity dormitories if you are a role
	return promptAndCheckIn(user, user)

/turf/closed/indestructible/hoteldoor/CtrlClick(mob/user)
	. = ..()
	var/area/hilbertshotel/HB = get_area(src)
	var/roomnumber = "[HB.roomnumber]"
	if(!parentSphere)
		return
	if(!parentSphere.rooms_can_be_locked)
		return
	if(!parentSphere.mob_dorms[user] || !parentSphere.mob_dorms[user].Find(HB.roomnumber))
		return
	if(get_dist(get_turf(src), get_turf(user)) > 1)
		return

	if(parentSphere.lockedRooms[roomnumber])
		parentSphere.lockedRooms -= roomnumber
		playsound(src, 'sound/machines/locker_open.ogg', 50, 1)
	else
		parentSphere.lockedRooms[roomnumber] = TRUE
		playsound(src, 'sound/machines/locker_close.ogg', 50, 1)

	to_chat(user, "<span class='notice'>You [parentSphere.lockedRooms[roomnumber] ? "locked" : "unlocked"] room...</span>")

/turf/closed/indestructible/hoteldoor/examine(mob/user)
	. = ..()
	if(!isliving(user))
		return
	. += "The placard reads 'Room [roomnumber]'."
	. += "<span class='info'>Alt-Click to look through the peephole.</span>"
	if(parentSphere && parentSphere.rooms_can_be_locked)
		. += "<span class='info'>Ctrl-Click to lock door if you owner of the room.</span>"

/datum/map_template/hilbertshotel/apartment
	name = "Apartment"
	mappath = '_maps/templates/apartment.dmm'

/datum/map_template/hilbertshotel/apartment/one
	name = "Apartment_1"
	mappath = '_maps/templates/apartment_1.dmm'

/datum/map_template/hilbertshotel/apartment/two
	name = "Apartment_2"
	mappath = '_maps/templates/apartment_2.dmm'

/datum/map_template/hilbertshotel/apartment/three
	name = "Apartment_3"
	mappath = '_maps/templates/apartment_3.dmm'

/datum/map_template/hilbertshotel/apartment/bar
	name = "Apartment_bar"
	mappath = '_maps/templates/apartment_bar.dmm'

/datum/map_template/hilbertshotel/apartment/syndi
	name = "Apartment_syndi"
	mappath = '_maps/templates/apartment_syndi.dmm'

/datum/map_template/hilbertshotel/apartment/dojo
	name = "Apartment_dojo"
	mappath = '_maps/templates/apartment_dojo.dmm'

/datum/map_template/hilbertshotel/apartment/sauna
	name = "Apartment_sauna"
	mappath = '_maps/templates/apartment_sauna.dmm'

/datum/map_template/hilbertshotel/apartment/beach
	name = "Apartment_beach"
	mappath = '_maps/templates/apartment_beach.dmm'

/datum/map_template/hilbertshotel/apartment/forest
	name = "Apartment_forest"
	mappath = '_maps/templates/apartment_forest.dmm'

/datum/map_template/hilbertshotel/apartment/jungle
	name = "Apartment_jungle"
	mappath = '_maps/templates/apartment_jungle.dmm'

/datum/map_template/hilbertshotel/apartment/prison
	name = "Apartment_prison"
	mappath = '_maps/templates/apartment_prison.dmm'

/datum/map_template/hilbertshotel/apartment/winter
	name = "Apartment_winter"
	mappath = '_maps/templates/apartment_winter.dmm'

/datum/map_template/hilbertshotel/apartment/sport
	name = "Apartment_GYM"
	mappath = '_maps/templates/apartment_sportzone.dmm'

/datum/map_template/hilbertshotel/apartment/capsule
	name = "Apartment_winter"
	mappath = '_maps/templates/apartment_capsule.dmm'
