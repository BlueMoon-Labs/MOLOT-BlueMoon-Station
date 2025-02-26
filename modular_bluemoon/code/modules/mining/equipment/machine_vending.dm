/obj/machinery/mineral/equipment_vendor/Initialize(mapload)
	. = ..()
	prize_list += list(//General suggestion to anybody that will use this: keep the lines somewhat same with tabs, not spaces. THANK YOU.
			new /datum/data/mining_equipment("Pill Shelter",						/obj/item/survivalcapsule/luxury/pill,		400), //The smallest of them all! Same as usual capsule to prevent abusing them
			new /datum/data/mining_equipment("Arena Shelter",						/obj/item/survivalcapsule/luxury/arena,		10000), //What do you expect in the first place?
			new /datum/data/mining_equipment("Supreme Shelter",						/obj/item/survivalcapsule/luxury/greatest,	100000), //https://youtu.be/97lKspTB3u0?si=bsdh-3VRzvV7wkIG | Yes it will cost a lot, but look at the design!(it sucks lmao)
			new /datum/data/mining_equipment("Nanotrasen MRE Ration Kit Menu 1",		/obj/item/storage/box/mre/menu1,		2000), //On other forks miners at least can buy themselves some food, at affordable price.
			new /datum/data/mining_equipment("Nanotrasen MRE Ration Kit Menu 2",		/obj/item/storage/box/mre/menu2,		2000),
			new /datum/data/mining_equipment("Nanotrasen MRE Ration Kit Menu 3",		/obj/item/storage/box/mre/menu3,		2000),
			new /datum/data/mining_equipment("Nanotrasen MRE Ration Kit Menu 4",		/obj/item/storage/box/mre/menu4,		2000),
			)
