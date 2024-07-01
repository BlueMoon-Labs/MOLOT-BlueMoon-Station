/datum/language/old_codes
	name = "Old fast codes"
	desc = "Old military codes used on Earth hundreds of years ago. Now they are almost forgotten and replaced by more advanced referral systems, but someone still uses them. (Используйте русскую букву для префикса)"
	key = "е"
	flags = LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD
	space_chance = 100
	icon_state = "inteq"
	default_priority = 91
	restricted = TRUE

/datum/language/old_codes/scramble(var/input)
	var/fastcode = ""
	while(length_char(fastcode) < length_char(input))
		fastcode += pickweight(list( "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "red", "green", "yellow", "white", "black", "-", " "))
	input = fastcode // bluemoon change end
	. = input



/obj/item/fastcodes_guide
	name = "Dirty Fast codes guide"
	desc = "Пыльный мануал. В нём собраны коды, шифровки, позывные и ответы на любую ситуацию. Хоть сейчас все эти шифры выглядят архаично и слишком сложными, но прекрасно выполняют свою работу."
	icon = 'modular_bluemoon/Ren/Icons/Obj/infiltrator.dmi'
	icon_state = "guide"
	var/charges = 1

/obj/item/fastcodes_guide/attack_self(mob/living/user)
	if(!isliving(user))
		return

	if(user.has_language(/datum/language/old_codes))
		to_chat(user, "<span class='boldannounce'>You start skimming through [src], but you already know Fast codes.</span>")
		return

	to_chat(user, "<span class='boldannounce'>You start skimming through [src], and suddenly your mind is filled with codewords and responses.</span>")
	user.grant_language(/datum/language/old_codes, TRUE, TRUE, LANGUAGE_MIND)

	use_charge(user)

/obj/item/fastcodes_guide/attack(mob/living/M, mob/living/user)
	if(!istype(M) || !istype(user))
		return
	if(M == user)
		attack_self(user)
		return

	playsound(loc, "punch", 25, 1, -1)

	if(M.stat == DEAD)
		M.visible_message("<span class='danger'>[user] smacks [M]'s lifeless corpse with [src].</span>", "<span class='userdanger'>[user] smacks your lifeless corpse with [src].</span>", "<span class='italics'>You hear smacking.</span>")
	else if(M.has_language(/datum/language/old_codes))
		M.visible_message("<span class='danger'>[user] beats [M] over the head with [src]!</span>", "<span class='userdanger'>[user] beats you over the head with [src]!</span>", "<span class='italics'>You hear smacking.</span>")
	else
		M.visible_message("<span class='notice'>[user] teaches [M] by beating [M.ru_na()] over the head with [src]!</span>", "<span class='boldnotice'>As [user] hits you with [src], codewords and responses flow through your mind.</span>", "<span class='italics'>You hear smacking.</span>")
		M.grant_language(/datum/language/old_codes, TRUE, TRUE, LANGUAGE_MIND)
		use_charge(user)

/obj/item/fastcodes_guide/proc/use_charge(mob/user)
	charges--
	if(!charges)
		var/turf/T = get_turf(src)
		T.visible_message("<span class='warning'>The cover and contents of [src] start shifting and changing!</span>")

		qdel(src)
		var/obj/item/book/manual/random/book = new(T)
		user.put_in_active_hand(book)

/obj/item/fastcodes_guide/inf
	name = "Fast codes guide"
	charges = INFINITY
