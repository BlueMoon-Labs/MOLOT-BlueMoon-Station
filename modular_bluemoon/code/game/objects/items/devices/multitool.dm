/obj/item/small_delivery/silo_multitool
	name = "Cargonia gift"
	desc = "Special gift from Cargot to Head of Scientific Shenanigans."
	w_class = WEIGHT_CLASS_SMALL
	var/unwrap_count = 0 //просто небольшая шутка
	var/times_to_unwrap = 1 //количество раз нужное для разматывания подарка

/obj/item/small_delivery/silo_multitool/attack_self(mob/user)
	to_chat(user, "<span class='notice'>You start to unwrap the package...</span>")
	if(!do_after(user, 15, target = user))
		return
	if(times_to_unwrap > 1)
		times_to_unwrap--
		unwrap_count++
		switch(unwrap_count)
			if(5)
				to_chat(user, "<span class='notice'>It's starts annoy you...</span>")
			if(10)
				to_chat(user, "<span class='warning'>It's just infuriating...</span>")
			if(15)
				new /datum/hallucination/oh_yeah(user, TRUE)
				to_chat(user, "<span class='danger'>MURDER MURDER MURDER MURDER</span>")
		playsound(src.loc, 'sound/items/poster_ripped.ogg', 50, 1)
		new /obj/effect/decal/cleanable/wrapping(get_turf(user))
		return
	user.temporarilyRemoveItemFromInventory(src, TRUE)
	unwrap_contents()
	for(var/X in contents)
		var/atom/movable/AM = X
		user.put_in_hands(AM)
	playsound(src.loc, 'sound/items/poster_ripped.ogg', 50, 1)
	new /obj/effect/decal/cleanable/wrapping(get_turf(user))
	qdel(src)

/obj/item/small_delivery/silo_multitool/Initialize(mapload)
	. = ..()
	var/obj/item/multitool/silo/S = new /obj/item/multitool/silo(get_turf(loc))
	if(prob(5))
		times_to_unwrap = rand(5,20)
	S.forceMove(src)

/obj/item/multitool/silo
	name = "multitool"
	desc = "Used for pulsing wires to test which to cut. Not recommended by doctors. /br It is exactly a unique gift of Cargonia with a pre-installed buffer with station silo"

/obj/item/multitool/silo/Initialize(mapload)
	. = ..()
	buffer = GLOB.ore_silo_default
	update_icon()
