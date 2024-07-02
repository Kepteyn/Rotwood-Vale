/obj/item/organ/penis
	name = "penis"
	icon_state = "severedtail" //placeholder
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_PENIS
	organ_dna_type = /datum/organ_dna/penis
	accessory_type = /datum/sprite_accessory/penis/human
	var/penis_size = DEFAULT_PENIS_SIZE
	var/penis_arousal = 0

/obj/item/organ/vagina
	name = "vagina"
	icon_state = "severedtail" //placeholder
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_VAGINA
	accessory_type = /datum/sprite_accessory/vagina/human

/obj/item/organ/breasts
	name = "breasts"
	icon_state = "severedtail" //placeholder
	visible_organ = TRUE
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_BREASTS
	organ_dna_type = /datum/organ_dna/breasts
	accessory_type = /datum/sprite_accessory/breasts/pair
	var/breast_size = DEFAULT_BREASTS_SIZE

/obj/item/organ/testicles
	name = "testicles"
	icon_state = "severedtail" //placeholder
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_TESTICLES
	organ_dna_type = /datum/organ_dna/testicles
	accessory_type = /datum/sprite_accessory/testicles/pair
	var/ball_size = DEFAULT_TESTICLES_SIZE

/obj/item/organ/testicles/internal
	name = "internal testicles"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/*

/mob/living/carbon/human/verb/toggle_arousal()
	set category = "IC"
	set name = "Toggle Arousal"
	set desc = "Allows you to toggle how aroused your private parts are."

	if(stat != CONSCIOUS)
		to_chat(usr, span_warning("You can't toggle arousal right now..."))
		return
		

	var/list/genital_list = list()
	for(var/obj/item/organ/external/genital/genital in organs)
		if(!genital.aroused == AROUSAL_CANT)
			genital_list += genital
	if(!genital_list.len) //There is nothing to expose
		return
	//Full list of exposable genitals created
	var/obj/item/organ/external/genital/picked_organ
	picked_organ = input(src, "Choose which genitalia to change arousal", "Expose/Hide genitals") as null|anything in genital_list
	if(picked_organ && (picked_organ in organs))
		var/list/gen_arous_trans = list(
			"Not aroused" = AROUSAL_NONE,
			"Partly aroused" = AROUSAL_PARTIAL,
			"Very aroused" = AROUSAL_FULL,
		)
		var/picked_arousal = input(src, "Choose arousal", "Toggle Arousal") as null|anything in gen_arous_trans
		if(picked_arousal && picked_organ && (picked_organ in organs))
			picked_organ.aroused = gen_arous_trans[picked_arousal]
			picked_organ.update_sprite_suffix()
			update_body()
	return

*/

/mob/living/carbon/human/verb/arousal()
	set name = "Toggle Hardness"
	set category = "Emotes"

	if(!getorgan(/obj/item/organ/penis))
		return
	
	if(var/penis_arousal == 0)
		var/penis_arousal = 1
	
	else if(var/penis_arousal == 1)
		var/penis_arousal = 0
