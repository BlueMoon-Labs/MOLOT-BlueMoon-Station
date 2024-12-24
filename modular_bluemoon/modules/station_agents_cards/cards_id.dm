/obj/item/card/id/syndicate
	var/uses = 10 // Даём гражданской Синди-Карте одно использование вместо десяти.

/obj/item/card/id/syndicate/civilian
	name = "civilian agent card"
	desc = "A card used to provide ID and determine access across the station. It has a small graved in label, marking it as \"One-Use Electromagnetic Access Copier Device\". \
	<span class='danger'>The technology is well known and illegal to use in almost all nations and private organizations, but seems like the Pact sells them as souvenirs at its territory.</span>"
	uses = 1
	anyone = TRUE // все могут изменять характеристики

/obj/item/card/id/syndicate/civilian/vending // для раздатчиков
	desc = "A card used to provide ID and determine access across the station. It has a small graved in label, marking it as \"Appearence Changing ID\". \
	<span class='danger'>The technology is well known and illegal to use in almost all nations and private organizations, but seems like the Pact sells them as souvenirs at its territory.</span>"
	uses = 0

/obj/item/card/id/syndicate/civilian/vending/loadout // для лодаута, сохраняем описание карты из автомата
	var/registred = FALSE

// Используется именно такая функция, т.к. при выдаче через лодаут карта помещается в рюкзак
/obj/item/card/id/syndicate/civilian/vending/loadout/on_enter_storage()
	if(!registred)
		var/mob/living/carbon/human/my_owner = null

		if(ishuman(loc.loc)) // Если карта появляется в сумке
			my_owner = loc.loc
		if(ishuman(loc)) // Если карта в кармане или где угодно, но на персонаже
			my_owner = loc

		if(my_owner) // копирование свойств старой карты и её замена
			var/obj/item/card/id/id_card = my_owner.get_item_by_slot(ITEM_SLOT_ID)

			if(istype(id_card, /obj/item/card/id/inteq) || istype(id_card, /obj/item/card/id/syndicate) || istype(id_card, /obj/item/card/id/prisoner))
				to_chat(my_owner, span_warning("Ваша карта уже обладает свойствами, доступными гражданской карте синдиката или принадлежит заключенному! Лишняя была удалена."))
				qdel(src)
				return

			if(id_card?.access.len)
				access |= id_card.access
				assignment = id_card.assignment
				registered_account = id_card.registered_account
				rank = id_card.rank
				registered_name = id_card.registered_name
				name = id_card.name
				update_icon()

				qdel(id_card)
				my_owner.equip_to_slot_if_possible(src, ITEM_SLOT_ID, disable_warning = TRUE, bypass_equip_delay_self = TRUE)

		registred = TRUE

		if(src != my_owner?.get_item_by_slot(ITEM_SLOT_ID)) // Если в будущем что-то переделают и карта будет спавниться в отдельной коробке или вроде того
			visible_message(span_warning("ID карта из лодаута не нашла цель для копирования доступа, сообщите разработчикам."))
	. = ..()
