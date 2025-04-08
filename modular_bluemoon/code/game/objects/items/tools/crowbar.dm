// Buffs
/obj/item/crowbar/red
	desc = "A crowbar with blood-red coloring. It looks pretty robust and seems to have sharper edges than regular crowbar."
	toolspeed = 0.9

// Fix of sprite change
/obj/item/crowbar/power/syndicate/attack_self(mob/user)
	playsound(get_turf(user), 'sound/items/change_jaws.ogg', 50, 1)
	var/obj/item/wirecutters/power/syndicate/cutjaws = new /obj/item/wirecutters/power/syndicate(drop_location())
	cutjaws.name = name
	to_chat(user, "<span class='notice'>You attach the cutting jaws to [src].</span>")
	qdel(src)
	user.put_in_active_hand(cutjaws)
