#define ORGAN_SLOT_EYES_LENSES "lenses"//This is an utter shitcode. I *really* should just add a verb from binos instead of giving 'em, but it will break so many thing the god will not be merciful.

/obj/item/organ/cyberimp/arm/lenses //Yes, technically this is an arm implant, but let us believe.
	name = "binocular lenses"
	desc = "A pair of binocular lenses, that can be attached to the eyes."
	contents = newlist(/obj/item/binoculars/strong)
	icon = 'modular_bluemoon/icons/obj/surgery.dmi'
	icon_state = "binolenses" //Codespriting is a thing, yes. We should pay some artist to look it better in some future. Or not.
	slot = ORGAN_SLOT_EYES_LENSES//See? IT IS NOT AN ARM!!!!!!
	zone = BODY_ZONE_PRECISE_EYES
	w_class = WEIGHT_CLASS_TINY

/obj/item/organ/cyberimp/arm/lenses/SetSlotFromZone() //We override this so the game won't set any arm slots - there is no arms.
	return

/obj/item/organ/cyberimp/arm/lenses/screwdriver_act(mob/living/user, obj/item/I) //We prevent any interaction with the screwdriver - no, you can't do anything to it.
	return

/obj/item/organ/cyberimp/arm/lenses/examine(mob/user) //We removing this atrocity so the game won't tell irrevelant data.
	. = ..()
	. -= "<span class='info'>[src] is assembled in the [zone == BODY_ZONE_R_ARM ? "right" : "left"] arm configuration. You can use a screwdriver to reassemble it.</span>"

/obj/item/binoculars/strong
	name = "advanced binoculars" //A mere rename since we don't want to jinx the code once more.
	zoom_out_amt = 6
	zoom_amt = 13 //I  C A N  S E E
