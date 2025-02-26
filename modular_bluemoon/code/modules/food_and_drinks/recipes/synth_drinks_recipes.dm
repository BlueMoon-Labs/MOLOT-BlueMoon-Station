/datum/chemical_reaction/synthdrink
	name = "Positronic Oil"
	id = /datum/reagent/consumable/synthdrink
	results = list(/datum/reagent/consumable/synthdrink = 15)
	required_reagents = list(/datum/reagent/oil = 5, /datum/reagent/lube = 5, /datum/reagent/acetone = 5)

/datum/chemical_reaction/synthcoffee
	name = "Robotic Coffee"
	id = /datum/reagent/consumable/synthdrink/synthcoffee
	results = list(/datum/reagent/consumable/synthdrink/synthcoffee = 10)
	required_reagents = list(/datum/reagent/consumable/synthdrink = 5, /datum/reagent/consumable/coffee = 5)
	mix_message = "Смесь в стакане испускает что-то похожее на уставшее жужжание"

/datum/chemical_reaction/synthanol
	name = "Synthanol"
	id = /datum/reagent/consumable/synthdrink/synthanol
	results = list(/datum/reagent/consumable/synthdrink/synthanol = 10)
	required_reagents = list(/datum/reagent/consumable/synthdrink = 5, /datum/reagent/consumable/ethanol = 5)
	mix_message = "Смесь испускает несколько искр, неожиданно принимая голубоватый цвет"

/datum/chemical_reaction/synthanol_without_ethanol // До улучшения раздатчика количество этанола сильно ограничено у бармена
	name = "Liquor Synthanol"
	id = /datum/reagent/consumable/synthdrink/synthanol
	results = list(/datum/reagent/consumable/synthdrink/synthanol = 10)
	required_reagents = list(/datum/reagent/consumable/synthdrink = 5, /datum/reagent/consumable/ethanol/vodka = 5, /datum/reagent/consumable/ethanol/rum = 5, /datum/reagent/consumable/ethanol/tequila = 5)
	mix_message = "Внезапно большая часть ликёров испаряется из ёмкости, оставляя в ней смесь спирта и масел, приобретающую ярко-синий цвет..."

/datum/chemical_reaction/synthnsoda
	name = "Synth 'n Soda"
	id = /datum/reagent/consumable/synthdrink/synthanol/synthnsoda
	results = list(/datum/reagent/consumable/synthdrink/synthanol/synthnsoda = 10)
	required_reagents = list(/datum/reagent/consumable/synthdrink/synthanol = 5, /datum/reagent/consumable/ethanol/whiskeysoda = 5)

/datum/chemical_reaction/robottears
	name = "Robot Tears"
	id = /datum/reagent/consumable/synthdrink/synthanol/robottears
	results = list(/datum/reagent/consumable/synthdrink/synthanol/robottears = 15)
	required_reagents = list(/datum/reagent/consumable/synthdrink/synthanol = 5, /datum/reagent/consumable/tea = 5, /datum/reagent/consumable/milk = 5)
	mix_message = "Вам кажется, что вы слышите отдалённый скрипучий всхлип..."

/datum/chemical_reaction/trinary
	name = "Trinary"
	id = /datum/reagent/consumable/synthdrink/synthanol/trinary
	results = list(/datum/reagent/consumable/synthdrink/synthanol/trinary = 20)
	required_reagents = list(/datum/reagent/consumable/synthdrink/synthanol = 5, /datum/reagent/consumable/applejuice = 5, /datum/reagent/consumable/lemonjuice = 5, /datum/reagent/consumable/limejuice = 5)
	mix_message = "Смесь в стакане, кажется, издаёт тихое попискивание"

/datum/chemical_reaction/uplink
	name = "Uplink"
	id = /datum/reagent/consumable/synthdrink/synthanol/uplink
	results = list(/datum/reagent/consumable/synthdrink/synthanol/uplink = 15)
	required_reagents = list(/datum/reagent/consumable/synthdrink/synthanol = 5, /datum/reagent/consumable/ethanol/syndicatebomb = 5, /datum/reagent/consumable/nuka_cola = 5)
	mix_message = "Виски. Эхо. Виски. Лима. Альфа. Дельта."

/datum/chemical_reaction/liquid_emp
	name = "Luqid EMP"
	id = /datum/reagent/consumable/synthdrink/synthanol/liquid_emp
	results = list(/datum/reagent/consumable/synthdrink/synthanol/liquid_emp = 30)
	required_reagents = list(/datum/reagent/consumable/synthdrink/synthanol/robottears = 5, /datum/reagent/consumable/synthdrink/synthanol = 10, /datum/reagent/consumable/ethanol/irishcarbomb = 5, /datum/reagent/consumable/ethanol/liz_fizz = 5, /datum/reagent/hydrogen = 5)
	mix_message = "Кажется, от ёмкости исходит лёгкий электромагнитный заряд"

/datum/chemical_reaction/restart
	name = "Restart"
	id = /datum/reagent/consumable/synthdrink/synthanol/restart
	results = list(/datum/reagent/consumable/synthdrink/synthanol/restart = 20)
	required_reagents = list(/datum/reagent/consumable/synthdrink/synthanol/trinary = 5, /datum/reagent/consumable/synthdrink/synthanol/synthignon = 5, /datum/reagent/consumable/synthdrink/synthcoffee = 5, /datum/reagent/consumable/synthdrink/synthanol/synthnsoda = 5)
	mix_message = "Смесь в ёмкости начинает вращаться как колёсико перезагрузки"

/datum/chemical_reaction/restarthard
	name = "Hard Restart"
	id = /datum/reagent/consumable/synthdrink/synthanol/restart/hard
	results = list(/datum/reagent/consumable/synthdrink/synthanol/restart/hard = 10)
	required_reagents = list(/datum/reagent/consumable/synthdrink/synthanol/restart = 20, /datum/reagent/iron = 5)
	mix_message = "Смесь в ёмкости начинает вращаться как колёсико перезагрузки... оооочеень медленно..."

/datum/chemical_reaction/synthignon
	name = "Synthignon"
	id = /datum/reagent/consumable/synthdrink/synthanol/synthignon
	results = list(/datum/reagent/consumable/synthdrink/synthanol/synthignon = 10)
	required_reagents = list(/datum/reagent/consumable/synthdrink/synthanol = 5, /datum/reagent/consumable/ethanol/wine = 5)

/datum/chemical_reaction/ultralube
	name = "Ultra Lube"
	id = /datum/reagent/consumable/synthdrink/synthanol/ultralube
	results = list(/datum/reagent/consumable/synthdrink/synthanol/ultralube = 15)
	required_reagents = list(/datum/reagent/consumable/synthdrink/synthanol/synthignon = 5, /datum/reagent/drug/aphrodisiac = 5, /datum/reagent/lube = 5)
	mix_message = "Жидкость в стакане начинает яростно бурлить, поблёскивая розоватыми брызгами..."

/datum/chemical_reaction/database_dropper
	name = "Database Dropper"
	id = /datum/reagent/consumable/synthdrink/synthanol/database_dropper
	results = list(/datum/reagent/consumable/synthdrink/synthanol/database_dropper = 15)
	required_reagents = list(/datum/reagent/consumable/synthdrink/synthanol = 5, /datum/reagent/consumable/synthdrink/synthanol/ultralube = 5, /datum/reagent/copper = 5)
	mix_message = "Вы слышите тихий <', DROP TABLE> из ёмкости для смешивания..."
