/mob/living/carbon/human/verb/self_gulp_size()
	set name = "Set Drink Amount"
	set category = "IC"
	set waitfor = FALSE
	var/N = input("Amount self drink per gulp (1-10):","Self Drinking Control") as null|num
	if(N)
		N = floor(N)
		N = clamp(N, 1, 10)
		self_gulp_size = N
		to_chat(usr, "<span class='notice'>Amount self drink per gulp is now [self_gulp_size] units.</span>")

/obj/item/reagent_containers/food/drinks/verb/self_gulp_size()
	set src in view(1)
	set category = "Object"
	set name = "Set Drink Amount"

	if(ishuman(usr))
		var/mob/living/carbon/human/H = usr
		H.self_gulp_size()

/obj/item/reagent_containers/food/drinks/CtrlShiftClick(mob/user)
	..()
	if(Adjacent(user))
		self_gulp_size()

/obj/item/reagent_containers/food/drinks/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Ctrl-Shift-click to set own gulp size amount.</span>"
