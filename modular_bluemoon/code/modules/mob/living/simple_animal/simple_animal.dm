/* отключен по [причина], вопрос баланса допустим
/mob/living/simple_animal/verb/toggle_name()
	set name = "Set Name"
	set desc = "Allows you to change your name."
	set category = "IC"
	change_name()

/mob/living/proc/change_name()
	var/choice = input("What was your name?") as text
	src.name = choice
*/
