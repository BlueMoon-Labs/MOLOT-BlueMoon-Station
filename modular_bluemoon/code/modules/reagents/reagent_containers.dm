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

/obj/item/reagent_containers/attackby(obj/item/reagent_containers/glass/I, mob/user, params)
	if(tape_connection && user.a_intent == INTENT_HARM && istype(I) && I.embedding) // время размазать банку об банку ради великой цели
		if(I.reagents.total_volume)
			to_chat(user, "<span class='notice'>It's worth emptying the [I] first.</span>")
		else if(reagents.maximum_volume >= I.reagents.maximum_volume)
			to_chat(user, "<span class='notice'>It looks like [I] won't help improve maximum copacity of [src].</span>")
		else
			user.visible_message("<span class='notice'>[user] break [I] on [src] connecting them together.</span>",
								"<span class='notice'>You break [I] on [src] connecting them together.</span>")
			reagents.maximum_volume = I.reagents.maximum_volume
			volume = I.volume
			possible_transfer_amounts = I.possible_transfer_amounts
			qdel(I)
			return
	..()
