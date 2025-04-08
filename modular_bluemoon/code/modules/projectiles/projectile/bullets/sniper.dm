//Crocine .50 bullet
/obj/item/projectile/bullet/p50/lewd
	name =".50 lewd bullet"
	damage = 5
	knockdown = 100
	dismemberment = 0
	breakthings = FALSE
	wound_bonus = 0
	bare_wound_bonus = 1

/obj/item/projectile/bullet/p50/lewd/on_hit(atom/target, blocked = 0)
	var/mob/living/carbon/victim = target
	if(victim.client && victim.client?.prefs.erppref == "Yes" && CHECK_BITFIELD(victim.client?.prefs.toggles, VERB_CONSENT) && victim.client?.prefs.nonconpref == "Yes")
		if(iscarbon(target))
			victim.reagents.add_reagent(/datum/reagent/drug/aphrodisiac, 50)
		if(isrobotic(target))
			victim.reagents.add_reagent(/datum/reagent/consumable/synthdrink/synthanol/ultralube, 20)
		else
			return
		victim.emote("moan")
	if((victim.client.prefs.erppref == "No" || !victim.client.prefs.arousable || (victim.client.prefs.cit_toggles & NO_APHRO)))
		var/mob/living/shooter = firer
		shooter.apply_damage(100, stamina)
		shooter.visible_message(span_redtext("Мне стоило внимательнее смотреть, в кого я целюсь!!!"))
	return ..()
