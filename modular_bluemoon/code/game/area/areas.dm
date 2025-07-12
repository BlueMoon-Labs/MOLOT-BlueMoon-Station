/area
	var/jukebox_restrain = FALSE // Сдерживание музыки джукбокса от слышимости в других зонах
	var/jukebox_silent = FALSE // Может-ли музыка джукбоксов играть в данной зоне
	var/jukebox_privatized_by = null // Приватизация зоны стационарным джукбоксом

/area/hilbertshotel
	jukebox_restrain = TRUE

/area/start
	jukebox_silent = TRUE
