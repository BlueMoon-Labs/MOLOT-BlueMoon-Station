/**
 *
 * ДЕНЕЖКИ
 *
 */


/datum/mail_pattern/money/misterious_money
	name = "Случайные деньги"
	description = "Случайное небольшое число кредитов от неизвестного доброжелателя"

	weight = MAIL_WEIGHT_FREQUENT

	envelope_type = MAIL_TYPE_ENVELOPE

	letter_title = "..."
	letter_html = "Ты знаешь, за что."
	sender = "НЕИЗВЕСТЕН"
	letter_sign = null

	initial_contents = list()

/datum/mail_pattern/money/misterious_money/apply(mob/living/carbon/human/recipient)
	initial_contents += pick(
		/obj/item/stack/spacecash/c100,
		/obj/item/stack/spacecash/c100,
		/obj/item/stack/spacecash/c1000,
		/obj/item/storage/bag/money/c5000,
	)
	. = ..()

/datum/mail_pattern/money/taxes
	name = "Налоговая"
	description = "Уведомление от налоговой"

	weight = MAIL_WEIGHT_FREQUENT

	envelope_type = MAIL_TYPE_ENVELOPE

	sender = "Налоговая служба Нанотрейзен"

	letter_title = "Уведомление от налоговой"
	letter_html = {"Уведомляем вас, что на ваше имя составлено дело об административном правонарушении в связи с неуплатой налогов.
					 По прибытию на Центральное Командование вы будете заключены под стражу."}

	initial_contents = list()

/datum/mail_pattern/money/bogdanoff
	name = "Телефон от Богданова"
	description = "Тот самый телефон."

	weight = MAIL_WEIGHT_EXTREMELY_RARE

	envelope_type = MAIL_TYPE_ENVELOPE

	sender = "Богданов"

	letter_title = "..."
	letter_html = "Ты знаешь, что делать."
	letter_sign = "Твой босс, %%подпись%%"

	initial_contents = list()

/datum/mail_pattern/money/bogdanoff/apply(mob/living/carbon/human/recipient)
	. = ..()
	if(prob(10))
		initial_contents += /obj/item/suspiciousphone
