// Kvass itself
/datum/reagent/consumable/kvass
	name = "Kvass"
	description = "A traditional russian beer made from fermenting rye or barley and having a dark color and sour taste."
	color = "#522510"
	nutriment_factor = 1 * REAGENTS_METABOLISM
	taste_description = "bittersweet yeast"
	glass_icon = 'modular_bluemoon/icons/obj/drinks.dmi'
	glass_icon_state = "kvassglass"
	glass_name = "glass of kvass"
	glass_desc = "A cooling mug of kvass."
	hydration = 3

/datum/reagent/consumable/kvass/on_mob_add(mob/living/carbon/M)
	. = ..()
	if(HAS_TRAIT(M, TRAIT_RUSSIAN))
		SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "fav_food", /datum/mood_event/quality_fantastic)
		to_chat(M, "<span class='notice'>Этот квас просто великолепен!</span>")

/datum/reagent/consumable/kvass/on_mob_life(mob/living/carbon/M)
	. = ..()
	M.drowsyness = max(0, M.drowsyness - 5)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)

/datum/reagent/consumable/kvass/on_hydroponics_apply(obj/item/seeds/myseed, datum/reagents/chems, obj/machinery/hydroponics/mytray, mob/user)
	. = ..()
	if(chems.has_reagent(src, 1))
		mytray.adjustHealth(-round(chems.get_reagent_amount(src.type) * 0.05))
		mytray.adjustWater(round(chems.get_reagent_amount(src.type) * 0.7))

/datum/reagent/consumable/icelatte
	name = "Iced Latte"
	description = "Latte and ice, refreshing and cool."
	color = "#102838" // rgb: 16, 40, 56
	nutriment_factor = 0
	taste_description = "bitter cream with coldness"
	glass_icon_state = "iced_latte"
	glass_name = "glass of iced latte"
	glass_desc = "A drink to perk you up and refresh you!"
	quality = DRINK_NICE
	hydration = 3

/datum/reagent/consumable/icelatte/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-65)
	M.drowsyness = max(0,M.drowsyness-4)
	M.SetSleeping(-45, FALSE)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
	..()
	. = 1

/datum/reagent/consumable/raf
	name = "Raf"
	description = "Sweet and milky coffee drink"
	color = "#102838" // rgb: 16, 40, 56
	nutriment_factor = 0
	taste_description = "milk and sugar"
	glass_icon_state = "raf"
	glass_name = "glass of raf"
	glass_desc = "A drink to perk you up and refresh you!"
	quality = DRINK_NICE
	hydration = 3

/datum/reagent/consumable/raf/on_mob_life(mob/living/carbon/M)
	if(M.getToxLoss() && prob(40))
		M.adjustToxLoss(-1, 0, TRUE)
	M.dizziness = max(0,M.dizziness-6)
	M.drowsyness = max(0,M.drowsyness-4)
	M.jitteriness = max(0,M.jitteriness-4)
	M.SetSleeping(-45, FALSE)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
	..()
	. = 1

/datum/reagent/consumable/iceraf
	name = "Iced Raf"
	description = "Sweet and milky coffee drink with a bit of ice"
	color = "#102838" // rgb: 16, 40, 56
	nutriment_factor = 0
	taste_description = "milk, sweetness and coldness"
	glass_icon_state = "iced_raf"
	glass_name = "glass of iced raf"
	glass_desc = "A drink to perk you up and refresh you!"
	quality = DRINK_NICE
	hydration = 3

/datum/reagent/consumable/iceraf/on_mob_life(mob/living/carbon/M)
	if(M.getToxLoss() && prob(40))
		M.adjustToxLoss(-1, 0, TRUE)
	M.dizziness = max(0,M.dizziness-7)
	M.drowsyness = max(0,M.drowsyness-5)
	M.jitteriness = max(0,M.jitteriness-5)
	M.SetSleeping(-50, FALSE)
	M.adjust_bodytemperature(-4 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
	..()
	. = 1

/datum/reagent/consumable/americano
	name = "Americano"
	description = "A drink prepared by diluting regular coffee with hot water"
	color = "#482000" // rgb: 72, 32, 0
	nutriment_factor = 0
	taste_description = "hot coffee"
	glass_icon_state = "americano"
	glass_name = "glass of americano"
	glass_desc = "Don't drop it, or you'll send scalding liquid and glass shards everywhere."
	hydration = 3

/datum/reagent/consumable/americano/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-10)
	M.drowsyness = max(0,M.drowsyness-8)
	M.AdjustSleeping(-60, FALSE)
	M.adjust_bodytemperature(40 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	if(holder.has_reagent(/datum/reagent/consumable/frostoil))
		holder.remove_reagent(/datum/reagent/consumable/frostoil, 5)
	..()
	. = 1

/datum/reagent/consumable/iceamericano
	name = "Iced Americano"
	description = "A mix of americano and ice."
	color = "#482000" // rgb: 72, 32, 0
	nutriment_factor = 0
	taste_description = "bitterness and coldness"
	glass_icon_state = "iced_americano"
	glass_name = "glass of americano"
	glass_desc = "Don't drop it, or you'll send scalding liquid and glass shards everywhere."
	hydration = 3

/datum/reagent/consumable/iceamericano/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-10)
	M.drowsyness = max(0,M.drowsyness-8)
	M.AdjustSleeping(-60, FALSE)
	//M.adjust_bodytemperature(40 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = 1
