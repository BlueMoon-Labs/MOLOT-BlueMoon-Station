/obj/effect/mob_spawn/qareen/attack_ghost(mob/user, latejoinercalling)
	if(GLOB.master_mode == "Extended")
		return . = ..()
	else
		return to_chat(user, "<span class='warning'>Игра за ЕРП-антагонистов допускается лишь в Режим Extended!</span>")

/obj/effect/mob_spawn/qareen //not grief antag u little shits
	name = "Qareen - The Horny Spirit"
	desc = "An ancient tomb designed for long-term stasis. This one has the word HORNY scratched all over the surface!"
	mob_name = "Qaaren"
	mob_type = 	/mob/living/simple_animal/qareen
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_s"
	short_desc = "Вы Карен!"
	flavour_text = "Вы Карен! Дух похоти! Для общения с другими Карен используйте :q. Ваш прежде мирской дух был запитан инопланетной энергией и преобразован в qareen. Вы не являетесь ни живым, ни мёртвым, а чем-то посередине. Вы способны взаимодействовать с обоими мирами. Вы неуязвимы и невидимы для живых, но не для призраков."
	important_info = "НЕ ГРИФЕРИТЬ, ИНАЧЕ ВАС ЗАБАНЯТ!!"
	death = FALSE
	roundstart = FALSE
	random = FALSE
	uses = 1
	category = "special"

/obj/effect/mob_spawn/qareen/wendigo //not grief antag u little shits
	name = "Woman Wendigo - The Horny Creature"
	short_desc = "Вы Вендиго!"
	desc = "Вендиго. Озабоченный монстр-женщина."
	icon_state = "sleeper_clockwork"
	mob_name = "Wendigo-Woman"
	mob_type = /mob/living/carbon/wendigo
	flavour_text = "Вы Вендиго-Женщина."

/obj/effect/mob_spawn/qareen/wendigo_man //not grief antag u little shits
	name = "Man Werefox - The Horny Creature"
	short_desc = "Вы Лисоборотень!"
	desc = "Озабоченный монстр-мужчина."
	icon_state = "sleeper_clockwork"
	mob_name = "Wendigo-Man"
	mob_type = /mob/living/carbon/wendigo/man
	flavour_text = "Вы Вендиго-Мужчина."

/obj/effect/mob_spawn/qareen/wendigo_lore //not grief antag u little shits
	name = "Wendigo - The Horny Creature"
	short_desc = "Вы таинственное нечто необъятных размеров, редкие свидетели прозвали вас Вендиго!"
	desc = "Вендиго. Огромный, рогатый, четвероногий, озабоченный монстр."
	icon_state = "sleeper_clockwork"
	mob_name = "Wendigo"
	mob_type = /mob/living/simple_animal/wendigo
	flavour_text = "Вы Вендиго. Огромный, рогатый, четвероногий, озабоченный монстр."

/obj/effect/mob_spawn/human/changeling_extended //not grief antag u little shits
	name = "Changeling - The Horny Creature"
	short_desc = "Вы таинственное нечто и абсолютно идеальный организм, который питается возбуждением своих жертв!"
	desc = "Генокрад."
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_clockwork"
	mob_name = "Changeling"
	flavour_text = "Вы Генокрад."
	roundstart = FALSE
	death = FALSE
	random = TRUE
	can_load_appearance = TRUE
	loadout_enabled = TRUE
	use_outfit_name = TRUE
	outfit = /datum/outfit/job/stowaway/syndicate
	category = "special"

/obj/effect/mob_spawn/human/changeling_extended/attack_ghost(mob/user, latejoinercalling)
	if(GLOB.master_mode == "Extended")
		return . = ..()
	else
		return to_chat(user, "<span class='warning'>Игра за ЕРП-антагонистов допускается лишь в Режим Extended!</span>")

/obj/effect/mob_spawn/human/changeling_extended/special(mob/living/new_spawn)
	. = ..()
	var/mob/living/carbon/human/H = new_spawn
	H.mind.make_XenoChangeling()
