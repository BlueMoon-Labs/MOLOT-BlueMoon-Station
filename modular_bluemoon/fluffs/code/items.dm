/obj/item/lighter/donator/bm/militaryzippo
	name = "military zippo"
	desc = "Army styled zippo with graved \"Dmitry Strelnikov\" on backside. Has a much hotter flame than normal."
	icon = 'modular_bluemoon/fluffs/icons/obj/items.dmi'
	icon_state = "mzippo"
	heat = 2000
	light_color = LIGHT_COLOR_FIRE
	overlay_state = "mzippo"
	grind_results = list(/datum/reagent/iron = 1, /datum/reagent/fuel = 5, /datum/reagent/oil = 5)

/obj/item/reagent_containers/glass/beaker/elf_bottle
	name = "potion bottle"
	desc = "Фиолетовая бутылка, что выглядет очень старой. \
		Она выглядет так буд-то её используют для хранения зелий.  \
		На этикетке написано 'Зелье снятия одежды'."
	icon = 'modular_bluemoon/fluffs/icons/obj/items.dmi'
	icon_state = "elf_bottle"
	volume = 150
	possible_transfer_amounts = list(1,2,3,5,10,25,50,100,150)
	container_flags = APTFT_ALTCLICK|APTFT_VERB
	list_reagents = list(/datum/reagent/consumable/ethanol/panty_dropper = 50)
	container_HP = 10
