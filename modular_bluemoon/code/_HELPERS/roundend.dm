#define FUNNY_VIDEOS_FILE_NAME "config/bluemoon/discord_videos.json"

/proc/init_discord_videos()
	if (!fexists(FUNNY_VIDEOS_FILE_NAME))
		return null
	var/list/videos_json = json_decode(file2text(FUNNY_VIDEOS_FILE_NAME))
	if (!length(videos_json))
		return null

	var/list/contents = list()
	for (var/entry in videos_json)
		if (entry["content"])
			contents += entry["content"]

	return contents

/proc/LoadTGSBotConfig()
	return list(
		"name" = CONFIG_GET(string/bot_name),
		"icon" = CONFIG_GET(string/bot_icon)
	)

/proc/CreateAuthor()
	var/list/config = LoadTGSBotConfig()  // Loading config

	var/name = config["name"] || "Цунода вещает"
	var/icon = config["icon"] || "https://cdn.discordapp.com/attachments/1049298549550100480/1287452387660791900/browser_UtXYhWxGEZ.png?ex=673c15b8&is=673ac438&hm=17d75b172b3da57164549e1523d4f20ad5ffb494643f0b6ee3cc8c71b1706a09&format=webp&"

	// Create Object => Constructor
	var/datum/tgs_chat_embed/provider/author/new_author = new /datum/tgs_chat_embed/provider/author(name)
	new_author.icon_url = icon
	return new_author


/datum/controller/subsystem/ticker/proc/send_roundend_stats_tgs_message(popcount)
	if (!CONFIG_GET(string/roundend_status_enabled))
		return
	var/num_survivors = popcount[POPCOUNT_SURVIVORS]
	var/num_deads = popcount[POPCOUNT_DEADS]
	var/num_escapees = popcount[POPCOUNT_ESCAPEES]
	var/num_shuttle_escapees = popcount[POPCOUNT_SHUTTLE_ESCAPEES]
	var/num_another_escapees = popcount[POPCOUNT_ANOTHER_ESCAPEES]
	var/station_integrity = popcount["station_integrity"]
	var/channel_tag = CONFIG_GET(string/chat_roundend_notice_tag)

	var/datum/tgs_message_content/message = new("Итоги раунда:")
	var/datum/tgs_chat_embed/structure/embed = new()
	message.embed = embed
	embed.author = CreateAuthor()
	embed.title = "Статистика окончания раунда"
	//embed.description = ":mending_heart:"
	embed.colour = "#34a5c2"

	var/embed_text = ""
	embed_text += ":people_holding_hands: Выжившие:                         [num_survivors]\n"
	embed_text += ":skull: Погибшие:                         [num_deads]\n"
	embed_text += ":door: Эвакуировавшиеся:                 [num_escapees]\n"
	embed_text += ":rocket: Эвакуировались на шаттле:         [num_shuttle_escapees]\n"
	embed_text += ":ambulance: Эвакуировались другими способами: [num_another_escapees]\n"
	embed_text += ":bar_chart: Состояние станции:                [station_integrity]%"

	embed.description = embed_text
	send2chat(message, channel_tag)

	if (CONFIG_GET(string/roundend_chat_command_enabled))
		var/list/random_links = init_discord_videos()
		if (!random_links || !length(random_links))
			send2chat("Ошибка: не удалось загрузить ссылки из FUNNY_VIDEOS_FILE_NAME", channel_tag)
			return

		var/random_link = pick(random_links)
		var/message_for_video = pick(CONFIG_GET(str_list/randomizing_message_for_video))
		var/last_roundend_message = "[message_for_video]\n [random_link]"
		var/datum/tgs_message_content/random_message = new(last_roundend_message)
		spawn(5)
			send2chat(random_message, channel_tag)

#undef FUNNY_VIDEOS_FILE_NAME
