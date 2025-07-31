/obj/item/storage/dice/d6
	name = "d6 dice set"
	desc = "Contains five classic d6 dice."

/obj/item/storage/dice/d6/PopulateContents()
	for(var/i = 1, i<=5, i++)
		new /obj/item/dice/d6(src)
