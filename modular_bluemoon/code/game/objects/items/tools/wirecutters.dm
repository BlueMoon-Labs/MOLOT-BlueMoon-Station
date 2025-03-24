/obj/item/wirecutters/power/syndicate/attack_self(mob/user) // BLUEMOON FIX of sprite change
	playsound(get_turf(user), 'sound/items/change_jaws.ogg', 50, 1)
	var/obj/item/crowbar/power/syndicate/pryjaws = new /obj/item/crowbar/power/syndicate(drop_location())
	pryjaws.name = name
	to_chat(user, "<span class='notice'>You attach the pry jaws to [src].</span>")
	qdel(src)
	user.put_in_active_hand(pryjaws)
