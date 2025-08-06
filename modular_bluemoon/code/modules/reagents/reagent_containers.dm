/obj/item/reagent_containers
	var/tape_connection = FALSE //возможность объединить с "липкой" банкй (обмотанную скотчем например

/obj/item/reagent_containers/glass/bucket
	tape_connection = TRUE

/obj/item/reagent_containers/food/drinks/shaker
	tape_connection = TRUE

/obj/item/reagent_containers/food/drinks/flask
	tape_connection = TRUE

/obj/item/reagent_containers/examine(mob/user)
	. = ..()
	if(tape_connection)
		. += "<span class='notice'>It can be improved by using a (sticky) taped beaker with a HARMfull force..</span>"

/obj/item/reagent_containers/attackby(obj/item/I, mob/user, params)
	var/hotness = I.get_temperature()
	if(hotness && reagents)
		reagents.expose_temperature(hotness)
		to_chat(user, "<span class='notice'>You heat [name] with [I]!</span>")
	if(tape_connection && user.a_intent == INTENT_HARM && istype(I, /obj/item/reagent_containers/glass) && I.embedding) // время размазать банку об банку ради великой цели
		var/obj/item/reagent_containers/glass/G = I
		if(G.reagents.total_volume)
			to_chat(user, "<span class='notice'>It's worth emptying the [G] first.</span>")
		else if(reagents.maximum_volume >= G.reagents.maximum_volume)
			to_chat(user, "<span class='notice'>It looks like [G] won't help improve maximum capacity of [src].</span>")
		else
			user.visible_message("<span class='notice'>[user] break [G] on [src] connecting them together.</span>",
								"<span class='notice'>You break [G] on [src] connecting them together.</span>")
			reagents.maximum_volume = G.reagents.maximum_volume
			volume = G.volume
			possible_transfer_amounts = G.possible_transfer_amounts
			qdel(G)
			return
	..()
