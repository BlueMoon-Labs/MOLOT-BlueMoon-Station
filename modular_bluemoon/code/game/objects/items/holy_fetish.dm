// перегруз. отказ от ренейминга и перекраса.
/obj/item/slimecross/stabilized/fetish/Initialize(mapload)
	. = ..()
	name = initial(name)
	add_atom_colour("#ffffff", FIXED_COLOUR_PRIORITY)
//	return ..()



////////////
/obj/item/slimecross/stabilized/fetish
	icon = 'modular_bluemoon/icons/obj/holy_fetish.dmi'

/obj/item/slimecross/stabilized/fetish/grey
	name = "Cтуденистый куб"
	desc = "Объект обожания среди своих сородичей."
	icon_state = "grey"
	colour = "grey"

/obj/item/slimecross/stabilized/fetish/orange
	name = "Нерушимый монолит"
	desc = "О нем слагают легенды. Его материал, не меняет своей температуры."
	icon_state = "orange"
	colour = "orange"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF | FREEZE_PROOF

/obj/item/slimecross/stabilized/fetish/silver
	name = "Чаша изгоя"
	desc = "На вид очень древняя. С ней проще пережидать часы голода."
	icon_state = "silver"
	colour = "silver"

/obj/item/slimecross/stabilized/fetish/blue
	name = "Манэки-нэко"
	desc = "Фигурка из фарфора. Считается, что она приносит удачу."
	icon_state = "blue"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	item_state = "stick"
	colour = "blue"

/obj/item/slimecross/stabilized/fetish/yellow
	name = "Погасший осколок"
	desc = "При касании ощущается лишь лёгкое покалывание."
	icon_state = "yellow"
	colour = "yellow"

/obj/item/slimecross/stabilized/fetish/darkpurple
	name = "Заводной куб жара"
	desc = "Латунный куб из множества шестерней. Веет теплом прямо в руки."
	icon_state = "darkpurple"
	colour = "dark purple"

/obj/item/slimecross/stabilized/fetish/darkblue
	name = "Ангел хранитель"
	desc = "Сделан из мрамора, влажный. На пьедестале надпись:'Exi ignis'."
	icon_state = "darkblue"
	colour = "dark blue"

/obj/item/slimecross/stabilized/fetish/sepia
	name = "Камень голубых лун"
	desc = "Оказывает необычное гравитационное воздействие на владельца."
	icon_state = "sepia"
	colour = "sepia"

/obj/item/slimecross/stabilized/fetish/gold
	name = "Запретный бестиарий"
	desc = "Тайные знания о фантастичных тварях. Восстановленное издание призывающее существ."
	icon_state = "gold"
	colour = "gold"
	var/mob_type
	var/datum/mind/saved_mind
	var/mob_name = "Familiar"

/obj/item/slimecross/stabilized/fetish/gold/proc/generate_mobtype()
	var/static/list/mob_spawn_pets = list()
	if(mob_spawn_pets.len <= 0)
		for(var/T in typesof(/mob/living/simple_animal))
			var/mob/living/simple_animal/SA = T
			switch(initial(SA.gold_core_spawnable))
				if(FRIENDLY_SPAWN)
					mob_spawn_pets += T
	mob_type = pick(mob_spawn_pets)

/obj/item/slimecross/stabilized/fetish/gold/Initialize(mapload)
	. = ..()
	generate_mobtype()

/obj/item/slimecross/stabilized/fetish/gold/attack_self(mob/user)
	var/choice = input(user, "Which do you want to reset?", "Familiar Adjustment") as null|anything in list("Familiar Location", "Familiar Species", "Familiar Sentience", "Familiar Name")
	if(!user.canUseTopic(src, BE_CLOSE))
		return
	if(isliving(user))
		var/mob/living/L = user
		if(L.has_status_effect(/datum/status_effect/stabilized/gold))
			L.remove_status_effect(/datum/status_effect/stabilized/gold)
	if(choice == "Familiar Location")
		to_chat(user, "<span class='notice'>You prod [src], and it shudders slightly.</span>")
		START_PROCESSING(SSobj, src)
	if(choice == "Familiar Species")
		to_chat(user, "<span class='notice'>You squeeze [src], and a shape seems to shift around inside.</span>")
		generate_mobtype()
		START_PROCESSING(SSobj, src)
	if(choice == "Familiar Sentience")
		to_chat(user, "<span class='notice'>You poke [src], and it lets out a glowing pulse.</span>")
		saved_mind = null
		START_PROCESSING(SSobj, src)
	if(choice == "Familiar Name")
		var/newname = reject_bad_name(stripped_input(user, "Would you like to change the name of [mob_name]", "Name change", mob_name, MAX_NAME_LEN), TRUE)
		if(newname)
			mob_name = newname
		to_chat(user, "<span class='notice'>You speak softly into [src], and it shakes slightly in response.</span>")
		START_PROCESSING(SSobj, src)

/obj/item/slimecross/stabilized/fetish/pyrite
	name = "СЛОВОХОНКОМАТЕРИ™"
	desc = "В начале было Слово, и Слово было HONK!"
	icon_state = "pyrite"
	colour = "pyrite"


/obj/item/slimecross/stabilized/fetish/green
	name = "Череп демона"
	desc = "Кажется неестественным для этого мира. Искажает тела касающихся до неузноваемости."
	icon_state = "green"
	colour = "green"

/obj/item/slimecross/stabilized/fetish/pink
	name = "Винтажный порно журнал «Запретный плод»"
	desc = "Страницы слиплись, открыть не получается. Ощутимая похоть заставлет выбросить всю агрессию из головы."
	icon_state = "pink"
	colour = "pink"

/obj/item/slimecross/stabilized/fetish/oil
	name = "Боеголовка «Отец»"
	desc = "Гравировка гласит: `Сильные душой - достигают небес`."
	icon_state = "oil"
	colour = "oil"

//////

/obj/item/choice_beacon/box/fetish
	name = "choice box (fetish)"
	desc = "Contains 13 of a selected relics inside!"

/obj/item/choice_beacon/box/fetish/generate_display_names()
	var/static/list/fetish_list = list()
	if(!length(fetish_list))
		var/list/fetish_list_temp = subtypesof(/obj/item/slimecross/stabilized/fetish)
		for(var/V in fetish_list_temp) // отображение читаемых имён вместо /obj/gavno/zalupa
			var/atom/A = V
			fetish_list[initial(A.name)] = A
	return fetish_list

/obj/item/choice_beacon/box/fetish/spawn_option(choice,mob/user)
	user.put_in_hands(new choice)
	qdel(src)

