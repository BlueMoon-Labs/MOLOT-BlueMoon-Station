/obj/item/wirecutters/red
	desc = "A pair of wirecutters with extra sharp blades..."
	icon_state = "cutters_map"
	force = 9
	toolspeed = 0.9
	random_color = FALSE

// Fix of sprite change
/obj/item/wirecutters/power/syndicate/attack_self(mob/user)
	playsound(get_turf(user), 'sound/items/change_jaws.ogg', 50, 1)
	var/obj/item/crowbar/power/syndicate/pryjaws = new /obj/item/crowbar/power/syndicate(drop_location())
	pryjaws.name = name
	to_chat(user, "<span class='notice'>You attach the pry jaws to [src].</span>")
	qdel(src)
	user.put_in_active_hand(pryjaws)
