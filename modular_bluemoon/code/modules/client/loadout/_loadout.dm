// Эффекты при спавне, например прописи владельца
/datum/gear/proc/on_spawn(mob/user, obj/item/I)
	return

/datum/gear/neck/syntech/pendant/on_spawn(mob/user, obj/item/clothing/neck/syntech/I)
	I.owner = user

/datum/gear/neck/syntech/choker/on_spawn(mob/user, obj/item/clothing/neck/syntech/choker/I)
	I.owner = user

/datum/gear/neck/syntech/collar/on_spawn(mob/user, obj/item/clothing/neck/syntech/collar/I)
	I.owner = user

/datum/gear/gloves/syntech/ring/on_spawn(mob/user, obj/item/clothing/accessory/ring/syntech/I)
	I.owner = user

/datum/gear/wrists/syntech/band/on_spawn(mob/user, obj/item/clothing/wrists/syntech/I)
	I.owner = user
