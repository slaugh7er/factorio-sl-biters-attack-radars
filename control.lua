do end

local DelayInSeconds = settings.startup["sl-bar-attackcycletime"].value

script.on_nth_tick( 60*DelayInSeconds, function()
	local surface = game.surfaces[1]
	local radars = surface.find_entities_filtered{ 
		-- position = position,
		-- radius = chunk_distance,
		-- name = "radar",
		type = "radar",
	}
	
	-- only include active/ powered radars
	local _t = {}
	for _, e in pairs( radars or {} ) do
		if e.active and e.energy>0 then 
			table.insert( _t, e )
		end
	end
	radars = _t
	
	-- select a radar or if non return
	local target_radar = (radars and #radars>0 and radars[math.random(1,#radars)] or nil)
	if target_radar == nil then return end
	
	-- generate a random chance and if inrange attack the 'target_radar'
	local num_of_radars = radars and #radars or 0
	local M_biters = settings.startup["sl-bar-attackbiters-max"].value
	local num_of_biters = math.min( 2*num_of_radars, M_biters )
	local M = settings.startup["sl-bar-radaramount-max"].value
	local i = math.random( 1, M )
	if i<num_of_radars then 
		surface.build_enemy_base( target_radar.position, num_of_biters ) 
		-- game.players[1].print( "attack inbound on (" .. target_radar.position.x .. " : " .. target_radar.position.y .. ")" )
	end
end )
