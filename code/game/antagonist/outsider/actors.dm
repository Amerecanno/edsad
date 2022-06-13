GLOBAL_DATUM_INIT(actor, /datum/antagonist/actor, new)

/datum/antagonist/actor
	id = MODE_ACTOR
	role_text = "Foolish Actor"
	role_text_plural = "Foolish Actors"
	welcome_text = "You've been hired to entertain people through the power of television!"
	landmark_id = "ActorSpawn"
	id_type = /obj/item/weapon/card/id/syndicate

	flags = ANTAG_OVERRIDE_JOB | ANTAG_CHOOSE_NAME | ANTAG_RANDOM_EXCEPTED

	hard_cap = 7
	hard_cap_round = 10
	initial_spawn_req = 1
	initial_spawn_target = 1
	show_objectives_on_creation = 0 //actors are not antagonists and do not need the antagonist greet text

/datum/antagonist/actor/greet(var/datum/mind/player)
	if(!..())
		return

	player.current.show_message("You work for [GLOB.using_map.company_name], tasked with the production and broadcasting of entertainment to all of its assets.")
	player.current.show_message("Entertain the crew! Try not to disrupt them from their work too much and remind them how great [GLOB.using_map.company_name] is!")

/datum/antagonist/actor/equip(var/mob/living/carbon/human/player)
	player.equip_to_slot_or_del(new /obj/item/clothing/under/chameleon(src), slot_w_uniform)
	player.equip_to_slot_or_del(new /obj/item/clothing/shoes/chameleon(src), slot_shoes)
	player.equip_to_slot_or_del(new /obj/item/device/radio/headset/entertainment(src), slot_l_ear)
	var/obj/item/weapon/card/id/centcom/ERT/C = new(player.loc)
	C.assignment = "Actor"
	player.set_id_info(C)
	player.equip_to_slot_or_del(C,slot_wear_id)
	player.generate_stats(STAT_DX)
	player.generate_skills("melee")

	return 1