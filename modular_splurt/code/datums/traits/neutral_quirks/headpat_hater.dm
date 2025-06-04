/datum/quirk/headpat_hater
	name = "Отстраненность"
	desc = "Вам нет дела до ласки со стороны других. Будь то вследствие сдержанности или самоконтроля, получаемые поглаживания не заставят вилять хвостом, если таковой есть, ласка может даже разгневать."
	mob_trait = TRAIT_DISTANT
	value = 0
	gain_text = span_notice("Чужие прикосновения раздражают вас...")
	lose_text = span_notice("Теперь поглаживания не кажутся настолько уж плохими...")
	medical_record_text = "Пациента мало заботят или раздражают чужие прикосновения."

/datum/quirk/headpat_hater/add()

	var/mob/living/carbon/human/quirk_mob = quirk_holder

	var/datum/action/cooldown/toggle_distant/act_toggle = new
	act_toggle.Grant(quirk_mob)

/datum/quirk/headpat_hater/remove()

	var/mob/living/carbon/human/quirk_mob = quirk_holder
	// BLUEMOON EDIT START - sanity check
	if(!quirk_mob)
		return
	// BLUEMOON EDIT END
	var/datum/action/cooldown/toggle_distant/act_toggle = locate() in quirk_mob.actions
	if(act_toggle)
		act_toggle.Remove(quirk_mob)

/datum/action/cooldown/toggle_distant
	name = "Toggle Distant"
	desc = "Allows you to let your headpat-guard down, or put it back up."
	icon_icon = 'modular_splurt/icons/mob/actions/lewd_actions/lewd_icons.dmi'
	button_icon_state = "pain_max"

/datum/action/cooldown/toggle_distant/Activate()
	var/mob/living/carbon/human/action_owner = owner

	if(HAS_TRAIT(action_owner, TRAIT_DISTANT))
		REMOVE_TRAIT(action_owner, TRAIT_DISTANT, ROUNDSTART_TRAIT)
		to_chat(action_owner, span_notice("You let your headpat-guard down!"))
		button_icon_state = "pain_medium" // BLUEMOON ADD
	else
		ADD_TRAIT(action_owner, TRAIT_DISTANT, ROUNDSTART_TRAIT)
		to_chat(action_owner, span_warning("You let your headpat-guard up!"))
		button_icon_state = "pain_max" // BLUEMOON ADD

	UpdateButtons() // BLUEMOON ADD
