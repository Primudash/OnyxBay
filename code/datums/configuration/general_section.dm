/datum/configuration_section/general
	name = "general"

	var/server_name = null
	var/subserver_name = null
	var/server_id = "onyxbay"
	var/server_suffix = FALSE
	var/server_port = null
	var/hosted_by = null
	var/player_limit = 0
	var/hard_player_limit = 0
	var/ticklag = 0.625
	var/client_fps = 65
	var/fps = 20
	var/aggressive_changelog = FALSE
	var/tick_limit_mc_init = TICK_LIMIT_MC_INIT_DEFAULT
	var/minute_topic_limit = null
	var/second_topic_limit = null
	var/wait_for_sigusr1 = FALSE

	var/client_min_major_version = 515
	var/client_min_minor_version = 1609
	var/client_recommended_minor_version = 1630
	var/list/client_blacklisted_minor_versions = list(1631, 1632)
	var/prometheus_port = null

/datum/configuration_section/general/load_data(list/data)
	CONFIG_LOAD_STR(server_name, data["server_name"])
	CONFIG_LOAD_STR(subserver_name, data["subserver_name"])
	CONFIG_LOAD_STR(server_id, data["server_id"])
	CONFIG_LOAD_BOOL(server_suffix, data["server_suffix"])
	CONFIG_LOAD_NUM(server_port, data["server_port"])
	CONFIG_LOAD_STR(hosted_by, data["hosted_by"])
	CONFIG_LOAD_NUM(player_limit, data["player_limit"])
	CONFIG_LOAD_NUM(hard_player_limit, data["hard_player_limit"])
	CONFIG_LOAD_NUM(ticklag, data["ticklag"])

	CONFIG_LOAD_NUM(client_min_major_version, data["client_min_major_version"])
	CONFIG_LOAD_NUM(client_min_minor_version, data["client_min_minor_version"])
	CONFIG_LOAD_NUM(client_recommended_minor_version, data["client_recommended_minor_version"])
	CONFIG_LOAD_LIST(client_blacklisted_minor_versions, data["blacklisted_builds"])

	if(ticklag)
		fps = 10 / ticklag

	CONFIG_LOAD_NUM(client_fps, data["client_fps"])

	if(fps <= 0)
		fps = initial(fps)

	CONFIG_LOAD_BOOL(aggressive_changelog, data["aggressive_changelog"])
	CONFIG_LOAD_NUM(tick_limit_mc_init, data["tick_limit_mc_init"])
	CONFIG_LOAD_NUM(minute_topic_limit, data["minute_topic_limit"])
	CONFIG_LOAD_NUM(second_topic_limit, data["second_topic_limit"])
	CONFIG_LOAD_BOOL(wait_for_sigusr1, data["wait_for_sigusr1"])
	CONFIG_LOAD_STR(prometheus_port, data["prometheus_port"])
