/obj/structure/toilet/golden_toilet
	name = "Золотой унитаз"
	desc = "Поговаривают, что 7 веков назад у каждого арабского шейха был такой унитаз. Им явно кто-то пользовался..."
	icon = 'modular_bluemoon/icons/obj/watercloset.dmi'
	icon_state = "gold_toilet00"

/obj/structure/toilet/golden_toilet/update_icon_state()
	. = ..()
	icon_state = "gold_toilet[open][cistern]"

/obj/structure/toilet/golden_toilet/bfl_goal
	name = "\[NT REDACTED\]"
	anchored = FALSE
