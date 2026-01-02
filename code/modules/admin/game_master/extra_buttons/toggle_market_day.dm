/client/proc/toggle_market_day()
	set name = "Toggle Market Day"
	set category = "Game Master.Extras"

	if(!check_rights(R_ADMIN))
		return

	if(!GLOB.supply_controller)
		return

	var/state = GLOB.supply_controller.toggle_market_day()

	message_admins("[key_name_admin(usr)] toggled Market Day to [state ? "ON" : "OFF"].")
