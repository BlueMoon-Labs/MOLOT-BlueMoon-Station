/datum/quirk/pharmacokinesis //Supposed to prevent unwanted organ additions. But i don't think it's really working rn
	name = "Острый Печеночный Фармакокинез" //copypasting dumbo
	desc = "У вас генетическое заболевание, которое заставляет печень усваивать семя инкуба и молоко суккуба при попадании их в организм."
	value = 0
	mob_trait = TRAIT_PHARMA
	flavor_quirk = TRUE
	lose_text = span_notice("Ваша печень ощущается... по-иному.")
	var/active = FALSE
	var/power = 0
	var/cachedmoveCalc = 1
