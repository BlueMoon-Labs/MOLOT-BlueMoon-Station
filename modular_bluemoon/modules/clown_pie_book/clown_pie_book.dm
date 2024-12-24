/datum/uplink_item/role_restricted/pie_book
	name = "Book: Summon Pie"
	desc = "A book which grants its user ability to summon a pie. It would be a perfect combo with silly jokes with others."
	item = /obj/item/book/granter/spell/summon_pie
	cost = 1 // возможность засрать ими бар и ывзвать у СБ проблемы с закидывающими их ассистентами
	restricted_roles = list("Clown", "Mime")
