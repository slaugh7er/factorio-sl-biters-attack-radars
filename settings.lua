data:extend({
	-- STARTUP
	{
		type = "int-setting",
		name = "sl-bar-radaramount-max",
		setting_type = "startup",
		minimum_value = 1,
		default_value = 100,
		order = "a-a",
	},
	
	{
		type = "int-setting",
		name = "sl-bar-attackcycletime",
		setting_type = "startup",
		minimum_value = 1,
		default_value = 30,
		order = "b-a",
	},
	
	{
		type = "int-setting",
		name = "sl-bar-attackbiters-max",
		setting_type = "startup",
		minimum_value = 1,
		default_value = 64,
		order = "c-a",
	},
	
	
	
	-- STARTUP END
})