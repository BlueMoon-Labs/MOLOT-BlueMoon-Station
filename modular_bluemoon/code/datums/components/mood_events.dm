/datum/mood_event/inteq_habar
	//description = "<span class='warning'>У меня возникнут проблемы, если меня увидят в этом!</span>\n"
	mood_change = -12
	//timeout = 2 MINUTES

/datum/mood_event/inteq_habar/add_effects(habar)
	description = "<span class='warning'>У меня возникнут проблемы, если на мне увидят [habar]!</span>\n"

/datum/mood_event/inteq_drop
	mood_change = 0

/* Всё это лишь вредит. Одежду интекью носят только интекью, а другие физически не могут этого сделать. Это сто процентный способ вычисления антага что не круто

// шея
/obj/item/bedsheet/inteq/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_NECK)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_neck", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_neck", /datum/mood_event/inteq_drop)

// глаза
/obj/item/clothing/glasses/hud/security/sunglasses/inteq/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_EYES)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_eyes", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_eyes", /datum/mood_event/inteq_drop)



// перчи
/obj/item/clothing/gloves/combat/maid/inteq/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_GLOVES)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_gloves", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_gloves", /datum/mood_event/inteq_drop)

/obj/item/clothing/gloves/tackler/combat/insulated/infiltrator/inteq/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_GLOVES)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_gloves", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_gloves", /datum/mood_event/inteq_drop)

// голова
/obj/item/clothing/head/helmet/infiltrator/inteq/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_HEAD)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_head", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_head", /datum/mood_event/inteq_drop)

/obj/item/clothing/head/helmet/space/syndicate/darktemplar/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_HEAD)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_head", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_head", /datum/mood_event/inteq_drop)

/obj/item/clothing/head/helmet/space/syndicate/inteq/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_HEAD)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_head", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_head", /datum/mood_event/inteq_drop)

/obj/item/clothing/head/helmet/swat/inteq/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_HEAD)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_head", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_head", /datum/mood_event/inteq_drop)

/obj/item/clothing/head/maid/syndicate/inteq/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_HEAD)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_head", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_head", /datum/mood_event/inteq_drop)

/obj/item/clothing/head/soft/inteq/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_HEAD)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_head", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_head", /datum/mood_event/inteq_drop)

/obj/item/clothing/head/HoS/inteq_vanguard/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_HEAD)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_head", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_head", /datum/mood_event/inteq_drop)

// ухо
/obj/item/radio/headset/inteq/equipped(mob/user, slot)
	..()
	if((slot == ITEM_SLOT_EARS_LEFT) && (slot == ITEM_SLOT_EARS_RIGHT))
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_ear", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_ear", /datum/mood_event/inteq_drop)

// лицо
/obj/item/clothing/mask/balaclava/breath/inteq/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_MASK)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_face", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_face", /datum/mood_event/inteq_drop)

/obj/item/clothing/mask/gas/sechailer/angrymarin/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_MASK)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_face", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_face", /datum/mood_event/inteq_drop)

/obj/item/clothing/mask/infiltrator/inteq/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_MASK)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_face", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_face", /datum/mood_event/inteq_drop)

// верхняя одежда
/obj/item/clothing/suit/space/syndicate/darktemplar/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_OCLOTHING)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_upon", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_upon", /datum/mood_event/inteq_drop)

/obj/item/clothing/suit/space/syndicate/inteq/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_OCLOTHING)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_upon", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_upon", /datum/mood_event/inteq_drop)

/obj/item/clothing/suit/armor/inteq/equipped(mob/user, slot) // inteq/labcoat там же
	..()
	if(slot == ITEM_SLOT_OCLOTHING)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_upon", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_upon", /datum/mood_event/inteq_drop)

/obj/item/clothing/suit/hooded/wintercoat/syndicate/inteq/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_OCLOTHING)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_upon", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_upon", /datum/mood_event/inteq_drop)

/obj/item/clothing/suit/armor/vest/infiltrator/inteq/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_OCLOTHING)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_upon", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_upon", /datum/mood_event/inteq_drop)

// обувь
/obj/item/clothing/shoes/combat/sneakboots/inteq/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_FEET)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_feet", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_feet", /datum/mood_event/inteq_drop)

// комбез
/obj/item/clothing/under/inteq/equipped(mob/user, slot) // gorka там же
	..()
	if(slot == ITEM_SLOT_ICLOTHING)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_under", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_under", /datum/mood_event/inteq_drop)


// рюкзаки
/obj/item/storage/backpack/duffelbag/syndie/inteq/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_BACK)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_back", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_back", /datum/mood_event/inteq_drop)

/obj/item/storage/backpack/satchel/inteq/equipped(mob/user, slot) // ftu добавить
	..()
	if(slot == ITEM_SLOT_BACK)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_back", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_back", /datum/mood_event/inteq_drop)

/obj/item/storage/backpack/security/inteq/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_BACK)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_back", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_back", /datum/mood_event/inteq_drop)
// пояс
/obj/item/storage/belt/military/inteq/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_BELT)
		if((!IS_INTEQ(user)) && (user.client))
			if(!HAS_TRAIT(user, TRAIT_FEARLESS))
				SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_belt", /datum/mood_event/inteq_habar, src.name)
	else
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "anxiety_belt", /datum/mood_event/inteq_drop)
		*/
