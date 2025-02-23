/**
 *
 * СЕМЕЙНЫЕ
 *
 */

/datum/mail_pattern/family/babushka_cookies
	name = "Печенья от бабули"
	description = "Пять печенек. С шансом 10% одна из печенек будет от InteQ"

	envelope_type = MAIL_TYPE_PACKAGE

	weight = MAIL_WEIGHT_DEFAULT

	letter_title = "Записка от бабули"
	letter_html = {"
		%->Дорогой внучок | Дорогая внучка%-,<br>
		Надеюсь, что это письмо найдет тебя в здравии и хорошем настроении.<br>
		Я знаю, что ты очень занят%%А%% на космической станции, но я все равно нашла время испечь для тебя твои любимые печенья. Ведь как же без них, правда?<br>
		Я помню, как ты всегда любил%%А%% мои печенья, поэтому я не могла упустить возможность порадовать тебя этим вкусным угощением. Надеюсь, что они поднимут тебе настроение и добавят тебе энергии в твоей нелегкой работе.<br>
		Не забывай, что даже на космической станции важно помнить о семье и близких. Желаю тебе успехов во всех твоих начинаниях и не забывай, что я всегда думаю о тебе.
	"}
	sender = MAIL_SENDER_RANDOM_FEMALE
	letter_sign = "С любовью и теплом, %%подпись%%"

	blacklisted_species = MAIL_RECIPIENT_SYNTH

	initial_contents = list(
		/obj/item/reagent_containers/food/snacks/cookie,
		/obj/item/reagent_containers/food/snacks/cookie,
		/obj/item/reagent_containers/food/snacks/cookie,
		/obj/item/reagent_containers/food/snacks/cookie
	)

/datum/mail_pattern/family/babushka_cookies/apply(mob/living/carbon/human/recipient)
	sender = "[random_unique_name(FEMALE)]"
	if(prob(10))
		initial_contents += /obj/item/reagent_containers/food/snacks/intecookies
	else
		initial_contents += /obj/item/reagent_containers/food/snacks/sugarcookie
	. = ..()

/datum/mail_pattern/family/samogon_ot_deda
	name = "Самогон от деда"
	description = "Случайный алкоголь из небольшого списка, подписанный как самогон от деда."

	envelope_type = MAIL_TYPE_PACKAGE

	weight = MAIL_WEIGHT_DEFAULT

	letter_title = "Малява от дедули"
	letter_html = {"
		Привет, %->внучок | внученька%-.<br>
		Прихворал под твой день рождения. Прости, что пропустил.<br>
		Отлил тебе самогону сколько в коробку влезло.<br>
		За твоё здоровье выпили, и ты выпей. Все вместе с этой стопкой чокались! Считай пьёшь с нами.
	"}
	sender = MAIL_SENDER_RANDOM_MALE
	letter_sign = "С приветом, %%подпись%%"

	bad_feeling = "От посылки невероятно сильно несёт спиртом. Вы уверены?"

	blacklisted_species = MAIL_RECIPIENT_SYNTH

	initial_contents = list(
		/obj/item/reagent_containers/food/drinks/drinkingglass/shotglass
	)

/datum/mail_pattern/family/samogon_ot_deda/apply(mob/living/carbon/human/recipient)
	var/obj/item/reagent_containers/food/drinks/bottle/absinthe/samogon = new(parent)
	samogon.name = "Самогон"
	samogon.desc = "Странно пахнущая бутылка из-под алкоголя, наполненная прозрачной субстанцией. На небрежно намалёванной приклееной бумажке, заменяющей этикетку, изображена странная машина с припиской снизу: \"Без каких нибудь особенных затрат - Создан этот самогонный аппарат - А приносит он, друзья, доход - Между прочим, круглый год!\""
	. = ..()

/datum/mail_pattern/family/samogon_ot_deda/on_mail_open(mob/living/carbon/human/recipient)
	. = ..()
	if(!HAS_TRAIT(recipient, TRAIT_AGEUSIA))
		to_chat(recipient, span_warning("Вас обдаёт запахом старого спирта, аж голова немного кружится..."))
		recipient.adjustStaminaLoss(30, TRUE)

/datum/mail_pattern/family/nado_pokushat
	name = "Заботливое письмо от мамы"
	description = "Не забудь покушать!"

	weight = MAIL_WEIGHT_DEFAULT

	letter_title = "Записка от мамы"
	letter_desc = "Аккуратненькая карточка, чёрный элегантный текст которой очень осторожно выведен от руки."
	letter_html = "<img src='https://i.ibb.co/tK92fft/remember-to-eat.jpg'>"
	sender = MAIL_SENDER_RANDOM_FEMALE
	letter_sign = "- Мама"

	blacklisted_quirks = list(
		/datum/quirk/bloodfledge,
		/datum/quirk/succubus,
		/datum/quirk/incubus
	)

	blacklisted_species = MAIL_RECIPIENT_SYNTH

	initial_contents = list()
