/**
 *
 * РАЗНОЕ
 *
 */


/datum/mail_pattern/misc/kinky_handcuffs
	name = "Подарок от друга"
	description = "Розовые наручники в подарок от анонимного товарища."

	weight = MAIL_WEIGHT_DEFAULT

	letter_title = "Записка"
	letter_html = "Привет. Вот реквизит с пранка о котором я тебе писал. Мне не пригодятся, а тебя то я знаю, найдёшь им применение."
	sender = "Сам%%А%% знаешь кто"
	letter_sign = null

	initial_contents = list(
		/obj/item/restraints/handcuffs/kinky
	)

/datum/mail_pattern/misc/heart_normal
	name = "Сердечко"
	description = "Просто <3"

	weight = MAIL_WEIGHT_DEFAULT

	letter_title = "Записка из письма"
	letter_html = "<center><span style='font-size: 80px; color: #ba346e;'>&lt;3</span></center>"
	sender = "???"
	letter_sign = null

	letter_icon = 'icons/obj/toy.dmi'
	letter_icon_state = "sc_Ace of Hearts_syndicate"

	bad_feeling = "Письмо пахнет дешёвыми духами. Это чтобы что-то скрыть?"

	initial_contents = list()

/datum/mail_pattern/misc/heart_spooky
	name = "Сердечко (реальное)"
	description = "<3 + реальное сердце"

	weight = MAIL_WEIGHT_RARE

	letter_title = "Записка из письма"
	letter_desc = "На этой бумажке несколько капель крови..."
	letter_html = "<center><span style='font-size: 80px; color: #ff0000;'>&lt;3</span></center>"
	sender = "???"
	letter_sign = null

	letter_icon = 'icons/obj/toy.dmi'
	letter_icon_state = "sc_Ace of Hearts_syndicate"

	bad_feeling = "Письмо пахнет дешёвыми духами. Это чтобы что-то скрыть?"

	initial_contents = list(
		/obj/item/organ/heart
	)

/datum/mail_pattern/misc/heart_spooky/on_mail_open(mob/living/carbon/human/recipient)
	. = ..()
	recipient.emote("chill")

/datum/mail_pattern/misc/mistress_reward
	name = "Награда от госпожи"
	description = "Теннисный мячик. Хорошим девочкам и мальчикам полагается награда."

	weight = MAIL_WEIGHT_RARE

	letter_title = "Карточка с текстом"
	letter_desc = "Аккуратненькая карточка, чёрный элегантный текст которой очень осторожно выведен от руки."
	letter_html = {"<center><h3>Мо%%ЕМУ%% хорош%%ЕМУ%% %->мальчику | девочке%-</h3></center><br>
					Привет, милашка. За твоё хорошее поведение ты заслужил%%А%% подарочек!<br><br>
					Наслаждайся им :з (Только не отвлекай коллег~).<br><br>
					Жду не дождусь увидеть и пожмонькать тебя!<br><br>
					(⁠*⁠＾⁠3⁠＾⁠)⁠/⁠～⁠♡"}
	sender = "*****"
	letter_sign = null

	letter_icon = 'icons/obj/toy.dmi'
	letter_icon_state = "sc_Ace of Hearts_syndicate"

	whitelisted_quirks = list(
		/datum/quirk/well_trained
	)

	initial_contents = list(
		/obj/item/toy/fluff/tennis_poly
	)

/datum/mail_pattern/misc/mistress_reward/on_mail_open(mob/living/carbon/human/recipient)
	. = ..()
	SEND_SIGNAL(recipient, COMSIG_ADD_MOOD_EVENT, QMOOD_WELL_TRAINED, /datum/mood_event/dominant/good_boy)

