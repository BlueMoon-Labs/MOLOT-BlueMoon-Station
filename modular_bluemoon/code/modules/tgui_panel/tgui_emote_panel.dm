#define TGUI_PANEL_MAX_EMOTES 30

/datum/tgui_panel
	var/static/list/all_emotes

//to include only "key" property into the list
/datum/tgui_panel/proc/populate_all_emotes_list()
	all_emotes = list()
	for(var/path in subtypesof(/datum/emote))
		var/datum/emote/E = new path()
		if(E.key)
			all_emotes[E.key] = E

/datum/tgui_panel/New(client/client)
	. = ..()
	populate_all_emotes_list()

/datum/tgui_panel/on_message(type, payload)
	. = ..()

	if (!client?.prefs)
		return

	if (. && type == "ready") // Добавляем прикол сверху, дап
		emotes_send_list()

	if (.)
		return


	switch (type)
		if ("emotes/execute")
			if (!islist(payload))
				return

			var/emote_key = payload["key"]
			if (!emote_key || !istext(emote_key) || !length(emote_key))
				return

			// Я не уверен что нужно ограничивать юзера панелькой,
			// но те кто знают JavaScript, смогут спамить эмоциями
			// даже теми, которых в панели нет, если не будет этой
			// проверки здесь
			if (isnull(client.prefs.custom_emote_panel[emote_key]))
				to_chat(client, span_warning("Эмоции [emote_key] нет в вашей панели!"))
				return FALSE

			if (isliving(client?.mob))
				var/mob/living/L = client.mob
				L.emote(emote_key)

			return TRUE

		if ("emotes/create")
			if (length(client.prefs.custom_emote_panel) > TGUI_PANEL_MAX_EMOTES)
				to_chat(client, span_warning("Добавлен максимум эмоций: [TGUI_PANEL_MAX_EMOTES]."))
				return

			var/emote_key = tgui_input_list(client.mob, "Какую эмоцию добавить в панель?", "Выбор эмоции", all_emotes - client.prefs.custom_emote_panel)
			if (!emote_key)
				to_chat(client, span_warning("Добавление эмоции отменено."))
				return

			if (!(emote_key in all_emotes))
				to_chat(client, span_warning("Эмоция [emote_key] не существует!"))
				return

			var/emote_name = tgui_input_text(client.mob, "Какое название эмоции [emote_key] будет в панели?", "Название эмоции", emote_key, 32)
			if (!emote_name)
				to_chat(client, span_warning("Название [emote_name] не подходит!"))
				return

			client.prefs.custom_emote_panel[emote_key] = emote_name
			client.prefs.save_character(TRUE) //custom emote panel is attached to the character
			emotes_send_list()

			return TRUE

		if ("emotes/contextAction")
			if (!islist(payload))
				return

			var/emote_key = payload["key"]
			if (!emote_key || !istext(emote_key) || !length(emote_key))
				return

			var/old_emote_name = client.prefs.custom_emote_panel[emote_key]
			if (isnull(old_emote_name))
				to_chat(client, span_warning("Эмоции [emote_key] нет в вашей панели!"))
				return FALSE

			var/action = tgui_alert(client.mob, "Что вы хотите сделать с эмоцией \"[old_emote_name]\" ([emote_key])?", "Выбор действия", list("Редактировать", "Удалить"))

			switch (action)
				if ("Удалить")
					if (emotes_remove(emote_key, old_emote_name))
						client.prefs.save_character(TRUE)
						emotes_send_list()
				if ("Редактировать")
					if (emotes_rename(emote_key, old_emote_name))
						client.prefs.save_character(TRUE)
						emotes_send_list()

			return TRUE


/datum/tgui_panel/proc/emotes_rename(emote_key, old_emote_name)
	var/key = GLOB.emote_list
	if (!(emote_key in key))
		to_chat(client, span_warning("Эмоция [emote_key] не существует!"))
		return FALSE

	var/emote_name = tgui_input_text(client.mob, "Выберите новое название эмоции [emote_key]:", "Название эмоции", old_emote_name, 32)
	if (!emote_name)
		return FALSE

	client.prefs.custom_emote_panel[emote_key] = emote_name

	return TRUE

/datum/tgui_panel/proc/emotes_remove(emote_key, old_emote_name)
	var/confirmation = tgui_alert(client.mob, "Вы уверены что хотите удалить эмоцию \"[old_emote_name]\" ([emote_key]) из панели?", "Подтверждение", list("Удалить", "Отмена"))
	if (confirmation != "Удалить")
		return

	client.prefs.custom_emote_panel.Remove(emote_key)

	return TRUE

/datum/tgui_panel/proc/emotes_send_list()
	var/list/payload = client.prefs.custom_emote_panel
	window.send_message("emotes/setList", payload)

#undef TGUI_PANEL_MAX_EMOTES
