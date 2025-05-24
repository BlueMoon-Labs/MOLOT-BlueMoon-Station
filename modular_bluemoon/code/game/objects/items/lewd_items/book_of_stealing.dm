#define TARGET_CHEST	1
#define TARGET_PANTIES	2
#define TARGET_SOCKS	3
#define WHATIS(A)	A == 1 ? "лифчик" : A == 2 ? "трусики" : "носки"

/obj/item/clothing/accessory/ring/return_ring
	name = "piece of thread"
	desc = "A tiny thread woven into a ring"
	icon = 'modular_bluemoon/icons/obj/ring.dmi'
	icon_state = "return_ring"
	item_state = null
	var/obj/item/return_item
	var/owner						// Владелец книги и кольца, даётся при активации книги
	var/cooldown_time = 5 SECONDS	// Кд между попытками использовать кольцо
	var/use_cooldown				// Время когда использовали кольцо в последний раз

/obj/item/clothing/accessory/ring/return_ring/Initialize(mapload, new_owner)
	. = ..()
	if(istype(loc, /obj/item/storage/book_of_stealing))
		return_item  = loc
		owner = new_owner

/obj/item/clothing/accessory/ring/return_ring/attack_self(mob/user)
	if(user != owner)
		return

	if(cooldown_time + use_cooldown >= world.time)
		to_chat(user, "<span class='warning'>Время ещё не пришло...</span>")
		return
	cooldown_time = world.time
	user.visible_message("<span class='notice'><b>[user]</b> вздёргивает руку и в ней появляется [return_item]</span>.")
	return_item.visible_message("<span class='notice'>[return_item] схлопывается и затягивается сама в себя</span>.")
	user.transferItemToLoc(src, return_item)
	user.put_in_hands(return_item)

/obj/item/storage/book_of_stealing
	name = "Book of reveal"
	desc = "Книга переполненная текстом, однако вечно плывущим и изменяющимся."
	icon = 'icons/obj/library.dmi'
	icon_state = "spellbook_page"
	usesound = "sound/effects/curse3.ogg"
	var/stealth = FALSE				// Скрытное использование книги
	var/target_slot = TARGET_CHEST	// То, куда нацелена книга
	var/owner						// Владелец книги, выбирается по тому, кто первый её использует
	var/cooldown_time = 5 SECONDS	// Кд между попытками использовать книгку
	var/use_cooldown				// Время когда использовали книгу последний раз (для кд)
	var/cast_time = 10 SECONDS		// Время каста заклинания
	var/use_items_from_book = FALSE	// Использование вещей из книги для замены

/obj/item/storage/book_of_stealing/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 20
	STR.can_hold = typecacheof(list(/obj/item/clothing/underwear, /obj/item/clothing/accessory/ring/return_ring))

/obj/item/storage/book_of_stealing/examine(mob/user)
	. = ..()
	if(user == owner)
		. += span_notice("Сейчас книга нацелена на [WHATIS(target_slot)]. \
						Работает [stealth ? "скрытно" : "громко"]. \
						[use_items_from_book ? "подменяет по возможности" : "ворует"] вещи.")
		. += span_notice("Alt + Click для смены режима подмены и просто кражи.")
		. += span_notice("Ctrl + Click для смены нацеленности книги.")
		. += span_notice("Ctrl + Shift + Click для режима скрытности у книги.")

/obj/item/storage/book_of_stealing/AltClick(mob/user)
	. = ..()
	if(!owner_check(user))
		return
	use_items_from_book = !use_items_from_book
	to_chat(user, "<span class='notice'>Теперь книга [use_items_from_book ? "подменяет вещи" : "лишь забирает вещи"].</span>")

/obj/item/storage/book_of_stealing/CtrlClick(mob/user)
	. = ..()
	if(!owner_check(user))
		return
	target_slot++
	if(target_slot > TARGET_SOCKS)
		target_slot = TARGET_CHEST
	to_chat(user, "<span class='notice'>Теперь книга нацелена на [WHATIS(target_slot)]</span>")

/obj/item/storage/book_of_stealing/CtrlShiftClick(mob/user)
	. = ..()
	if(!owner_check(user))
		return
	stealth = !stealth
	to_chat(user, "<span class='notice'>Теперь книга работает [stealth ? "скрытно" : "громко"]</span>")

/obj/item/storage/book_of_stealing/proc/owner_check(mob/user) // Привязка книги и запрет на использование кем-либо другим
	if(!owner)
		if(!ishuman(user))
			return FALSE
		owner = user
		to_chat(user, "<span class='notice'>Текст в книге собирается в слова, а на сбоку появляется пара ниток.</span>")
		new /obj/item/clothing/accessory/ring/return_ring(src, owner)
	else if(owner != user)
		to_chat(user, "<span class='warning'>Книга выглядит странно, а текст в ней попросту плывёт.</span>")
		return FALSE
	return TRUE

/obj/item/storage/book_of_stealing/attack_self(mob/user)
	// Привязка книги и запрет на использование кем-либо другим
	if(!owner_check(user))
		return

	// КД чтобы не спамить
	if(cooldown_time + use_cooldown >= world.time)
		to_chat(user, "<span class='warning'>Время ещё не пришло...</span>")
		return
	use_cooldown = world.time

	// Выбор цели
	if(stealth)
		user.whisper("Spatium, materia et tempus...")
	else
		user.say("Spatium, materia et tempus!")

	var/list/valid_target = list()
	for(var/mob/living/carbon/human/C in oview(4, user))
		if(C.stat == CONSCIOUS)
			valid_target += C
	if(!valid_target.len)
		to_chat(user, "<span class='notice'>Целей нет</span>")
		return
	var/mob/living/carbon/human/target = input("Select target for stealing!", "Select", null, null) as null|anything in valid_target
	if(!target)
		user.emote("sneeze")
		return
	if(stealth)
		user.visible_message("<span class='notice'><b>[user]</b> приподнимает книгу [src] в своей руке и смотрит на <b>[target]</b>.")
	else
		user.visible_message("<span class='warning'><b>[user]</b> резко вздымает [src] в своей руке и смотрит на <b>[target]</b>.")

	// Да, это можно сделать лучше, но впрочем не страшно
	var/obj/item/target_item
	switch(target_slot)
		if(TARGET_CHEST)
			target_item = target.w_shirt
		if(TARGET_PANTIES)
			target_item = target.w_underwear
		if(TARGET_SOCKS)
			target_item = target.w_socks

	var/obj/item/clothing/underwear/item_from_book
	if(contents.len && use_items_from_book)
		for(var/obj/item/clothing/underwear/UW in contents)
			switch(target_slot)
				if(TARGET_CHEST)
					if(UW.slot_flags & ITEM_SLOT_SHIRT)
						item_from_book = UW
						break
				if(TARGET_PANTIES)
					if(UW.slot_flags & ITEM_SLOT_UNDERWEAR)
						item_from_book = UW
						break
				if(TARGET_SOCKS)
					if(UW.slot_flags & ITEM_SLOT_SOCKS)
						item_from_book = UW
						break

	if(!target_item && !item_from_book)
		to_chat(user, "<span class='notice'>У цели отсутсвует [WHATIS(target_slot)][use_items_from_book ? " и в книге нет ничего подходящего" : ""]!</span>")
		if(!stealth)
			user.emote("Mew")
		return

	if(!target.canUnEquip(target_item, FALSE))
		user.visible_message("<span class='notice'>[src] дрожит в руках <b>[user]</b>, а после, замерев, выпускает из себя пар.")
		to_chat(user, "<span class='notice'>[WHATIS(target_slot)] цели похоже не желают покидать его владельца.</span>")
		if(!stealth)
			user.emote("malf")
		return

	use_cooldown = world.time + (stealth ? 5 SECONDS : 0)
	if(!use_tool(target, user, cast_time * (stealth ? 1 : 0.5), 0, stealth ? 25 : 50))
		to_chat(user, "<span class='notice'>Рука [user] дрогнула и из [src] вышло несколько искр.</span>")
		do_fake_sparks(3, FALSE, user)
		return

	if(!stealth)
		user.say("Furtum!")
	else
		user.whisper("Furtum...")
	use_cooldown = world.time
	target.transferItemToLoc(target_item, src, force = TRUE, silent = TRUE)
	if(item_from_book)
		target.equip_to_slot_if_possible(item_from_book, target_slot == 1 ? ITEM_SLOT_SHIRT : target_slot == 2 ? ITEM_SLOT_UNDERWEAR : ITEM_SLOT_SOCKS)

#undef TARGET_CHEST
#undef TARGET_PANTIES
#undef TARGET_SOCKS
#undef WHATIS
