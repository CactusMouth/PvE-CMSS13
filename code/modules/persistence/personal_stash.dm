/obj/structure/personal_stash
	name = "ColMarTech Personal Stash Access Point"
	desc = "A jury-rigged ColMarTech vendor which pulls from the mostly-empty bowels of the ship. It can be used to save various objects for use between operations."
	icon = 'icons/obj/structures/machinery/vending.dmi'
	icon_state = "prep"
	density = TRUE

	light_range = 4
	light_power = 2
	light_color = "#ebf7fe"  //white blue

	var/json_file
	var/unique_id
	var/list/stored_items = list()
	var/logged_in = FALSE

	var/max_storage = 100

// ↓ only the crap we care about saving. The code should be versitile enough to be able to just add most things on
	var/list/allowed_vars = list(
	"contents", "name", "desc", "accessories", "attachments", "current_mag", "pockets", "current_rounds",
	"uses_left", "amount", "hold", "target", "max_storage_space", "holstered_guns", "loaded_grenades", "stored_item", "black_market_value", "worth",
	"storage_slots", "bullet_amount", "gun_type", "caliber", "default_ammo", "has_mount", "health", "rounds", "in_chamber"
	)
// vars to always save for jank technical reasons
	var/list/important_vars = list(
	"current_mag", "contents"
	)

/////////////
//UI SYSTEM//
/////////////

/obj/structure/personal_stash/Initialize(mapload)
	. = ..()
	empty_list()

/obj/structure/personal_stash/proc/empty_list()
	var/list[max_storage][0]
	stored_items = list

/obj/structure/personal_stash/attack_hand(mob/user)
 	tgui_interact(user)


/obj/structure/personal_stash/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ItemStash")
		ui.open()

/obj/structure/personal_stash/ui_data(mob/user)
	var/list/data = list()

	if(unique_id)
		data["unique_id"] = unique_id
	data["logged_in"] = logged_in
	data["contents"] = stored_items

	return data

/obj/structure/personal_stash/ui_act(action, params, datum/tgui/ui)
	. = ..()
	if(.)
		return

	switch(action)
		if("ItemClick")
			var/ui_index = params["SlotKey"]
			if(stored_items[ui_index]["item"])
				stash_remove_item(ui_index)
				playsound(src.loc, 'sound/handling/click_2.ogg', 10, 1)
				return TRUE

			if(usr.get_active_hand())
				var/obj/item/I = usr.get_active_hand()
				stash_insert_item(I, ui_index, usr)
				return TRUE

		if("Login")
			if(!logged_in && load_stash(usr))
				logged_in = TRUE
				playsound(src.loc, 'sound/machines/terminal_button01.ogg', 25, 1)
				load_storage_ui()
				return TRUE

		if("Logout")
			if(logged_in)
				logged_in = FALSE
				playsound(src.loc, 'sound/machines/terminal_button01.ogg', 25, 1)
				unload_stash()
				return TRUE

/obj/structure/personal_stash/attackby(obj/item/I, mob/living/user)
	if(!stash_insert_item(I, user = user))
		return ..()
	to_chat(user, SPAN_NOTICE("you stash \the [I.name] into \the [src.name]"))


/obj/structure/personal_stash/proc/stash_insert_item(obj/item/item, index, mob/user)
	if(!logged_in)
		return FALSE
	if(contents.len > max_storage)
		return FALSE
	if(!index)
		index = get_free_index()
		if(!index)
			to_chat(usr, SPAN_WARNING("No empty slots left in [src.name]"))
			return FALSE

	if(user)
		user.drop_held_item(item, src)
	item.forceMove(src)

	stored_items[index] = list()

	stored_items[index]["item"] = item
	stored_items[index]["name"] = item.name
	stored_items[index]["icon"] = item::icon
	stored_items[index]["icon_state"] = item::icon_state
	stored_items[index]["index"] = index

	return TRUE

/obj/structure/personal_stash/proc/stash_remove_item(ui_index)
	var/obj/item/removed_item = stored_items[ui_index]["item"]
	removed_item.update_icon()
	if(!usr.equip_to_appropriate_slot(removed_item))
		usr.put_in_hands(removed_item)
	var/list/L = list()
	L = stored_items[ui_index]
	L.Cut()

/obj/structure/personal_stash/proc/get_free_index()
	for(var/index in 1 to max_storage)
		var/list/L = stored_items[index]
		if(!L.len)
			return index


/obj/structure/personal_stash/proc/load_storage_ui()
	for(var/I in contents)
		stash_insert_item(I)

///////////////
//SAVE SYSTEM//
///////////////

/obj/structure/personal_stash/proc/load_stash(mob/user)

	unique_id = user.ckey

	if(GLOB.accessed_stashes.Find(unique_id))
		to_chat(usr, SPAN_WARNING("You already have a stash open!"))
		unique_id = null
		return
	GLOB.accessed_stashes += unique_id

	json_file = file("data/player_saves/[copytext(unique_id,1,2)]/[unique_id]/stash.json")

	if(fexists(json_file))
		json_file = file2text(json_file)
		var/list/json = json_decode(json_file)

		for(var/item_index in 1 to json.len)
			var/list/loaded_item = json[json[item_index]]
			recreate_item(loaded_item, src)

	return TRUE


/obj/structure/personal_stash/proc/recreate_item(list/item_template, atom/location)
	var/obj/loaded_item = text2path(item_template[item_template[1]])
	loaded_item = new loaded_item(location)

	var/list/vars2load = list()
	vars2load = (allowed_vars & loaded_item.vars)

	for(var/key in vars2load)

		if(islist(item_template[key]))

			if(key == "attachments")
				var/obj/item/weapon/gun/gun = loaded_item
				for(var/I in 1 to gun.attachments.len)
					var/obj/item/attachable/attachment = gun.attachments[gun.attachments[I]]
					attachment.Detach(null, gun, drop_attachment = FALSE)
			else
				loaded_item.vars[key] = list() //wipes the list on the freshly initialized object


			var/list/list_var_template = item_template[key]
			if(!list_var_template.len)
				continue

			for(var/index in 1 to list_var_template.len)
				var/reconstructed_item	= list_var_template[list_var_template[index]]

				switch(key)
					if("contents") //we don't care about exactly recreating items anywhere but in the contents (attachments are in contents AND their own var)
						recreate_item(reconstructed_item, loaded_item)

					if("accessories")
						var/obj/item/clothing/accessory = locate_item(loaded_item, text2path(list_var_template[list_var_template[index]]))
						var/obj/item/clothing/clothing = loaded_item
						clothing.attach_accessory(null, accessory, TRUE)

					if("attachments")
						var/obj/item/attachable/attachment = locate_item(loaded_item, text2path(list_var_template[list_var_template[index]]))
						var/obj/item/weapon/gun/gun = loaded_item
						attachment.Attach(loaded_item)
						gun.update_attachables()

					if("holstered_guns")
						var/obj/item/weapon/gun/holstered = locate_item(loaded_item, text2path(list_var_template[list_var_template[index]]))
						var/obj/item/storage/belt/gun/belt = loaded_item
						belt.vars[key] += holstered
						belt.holster_slots["1"]["gun"] = holstered

					else
						if(text2path(list_var_template[list_var_template[index]]))
							loaded_item.vars[key] += locate_item(loaded_item, text2path(list_var_template[list_var_template[index]]))
							continue
						loaded_item.vars[key] = list_var_template[list_var_template[index]]

		else if(key == "current_mag")
			if(isnull(item_template[key]) || !(loaded_item.vars[key] = locate_item(loaded_item, text2path(item_template[key]))))
				loaded_item.vars[key] = null
			var/obj/item/weapon/gun/gun = loaded_item
			gun.replace_ammo(null, gun.current_mag)


		else if(key == "stored_item")
			if(!(loaded_item.vars[key] = locate_item(loaded_item, text2path(item_template[key]))))
				loaded_item.vars[key] = null


		else if(!isnull(item_template[key]))
			if(text2path(item_template[key]))
				var/L = locate_item(loaded_item, text2path(item_template[key]))
				if(L)
					loaded_item.vars[key] = L
					continue
				loaded_item.vars[key] = text2path(item_template[key])
			else
				loaded_item.vars[key] = item_template[key]

	return loaded_item

/obj/structure/personal_stash/proc/unload_stash()
	if(!unique_id)
		return

	GLOB.accessed_stashes -= unique_id

	json_file = file("data/player_saves/[copytext(unique_id,1,2)]/[unique_id]/stash.json")

	unique_id = null

	var/list/data2save = list()

	for(var/i in 1 to contents.len)
		data2save["[contents[i]]_[i]"] = get_vars(contents[i])
	update_file(data2save)
	clear_contents()

/obj/structure/personal_stash/proc/clear_contents()
	for(var/item in contents)
		qdel(item)
	empty_list()

/obj/structure/personal_stash/proc/update_file(data)
	fdel(json_file)
	WRITE_FILE(json_file, json_encode(data))

/obj/structure/personal_stash/proc/get_vars(obj/item/item, iteration)
	if(!item.vars)
		return

	var/list/item_entry = list()
	item_entry["item"] = item.type

	var/atom/control = DuplicateObject(item, FALSE, TRUE) //makes a 'control' item with default vars to compare to, since initial() is too strict

	var/list/vars2save = list()
	vars2save = (allowed_vars & item.vars)

	for(var/V in vars2save)
		if(islist(item.vars[V]))
			var/list/list_var = item.vars[V]
			item_entry["[V]"] = save_list(list_var, iteration, V)
			iteration++

		else
			if(important_vars.Find(V) || item.vars[V] != control.vars[V])
				if(istype(item.vars[V], /datum))
					var/datum/T = item.vars[V]
					item_entry["[V]"] = T.type
				else
					item_entry["[V]"] = item.vars[V]

	qdel(control)
	return item_entry

/obj/structure/personal_stash/proc/save_list(list/list2save, iteration, var_name)
	var/list/contents_list = list()

	if(iteration > 8)
		message_admins("[var_name] exceeded iteration limits")
		return
	iteration++

	for(var/index in 1 to list2save.len)

		if(important_vars.Find(var_name))
			contents_list["[var_name]_[index]"] = get_vars(list2save[index], iteration)

		else if(istype(list2save[index], /datum))
			var/datum/T = list2save[index]
			contents_list["[var_name]_[index]"] = T.type

		else if(istext(list2save[index]))
			if(istype(list2save[list2save[index]], /datum))
				var/datum/T = list2save[list2save[index]]
				contents_list["[list2save[index]]"] = T.type
			else if(list2save[list2save[index]])
				contents_list["[list2save[index]]"] = save_list(list2save[list2save[index]], iteration, var_name)

		else if(islist(list2save[index]))
			contents_list["[list2save[index]]"] = save_list(list2save[index], iteration, var_name)

	return contents_list

/obj/structure/personal_stash/proc/locate_item(obj/container, path)

	for(var/index in 1 to container.contents.len)
		var/obj/item = container.contents[index]
		if(item.type == path)
			return item
