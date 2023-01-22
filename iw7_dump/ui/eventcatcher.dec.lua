local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = hashset( {
	"togglescores",
	"game_message",
	"obituary",
	"weapon_change",
	"playerstate_client_changed",
	"camera_client_changed",
	"refresh_options_button",
	"update_mlg_prev_next",
	"spectate_team_change",
	"update_crm_data",
	"level_load",
	"prep_bootup",
	"bootup_hud"
} )
function isDirectDispatchEventType( f1_arg0 )
	return f0_local0[f1_arg0]
end

function new()
	local f2_local0 = {}
	setmetatable( f2_local0, {
		__index = _M
	} )
	f2_local0.direct_dispatch = {}
	f2_local0.omnvar_update = {}
	return f2_local0
end

function setupRoot( f3_arg0, f3_arg1 )
	f3_arg1:registerEventHandler( "omnvar_update", omnvarUpdateDispatcher )
	for f3_local3, f3_local4 in pairs( f0_local0 ) do
		f3_arg1:registerEventHandler( f3_local3, directDispatcher )
	end
end

function registerOmnvarHandler( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	assert( type( f4_arg1 ) == "userdata" )
	assert( type( f4_arg2 ) == "string" )
	assert( type( f4_arg3 ) == "function" )
	local f4_local0 = f4_arg0.omnvar_update
	local f4_local1 = f4_arg0.omnvar_update[f4_arg2]
	if not f4_local1 then
		f4_local1 = setmetatable( {}, {
			__mode = "k"
		} )
	end
	f4_local0[f4_arg2] = f4_local1
	f4_arg0.omnvar_update[f4_arg2][f4_arg1] = f4_arg3
end

function omnvarUpdateDispatcher( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg0.eventCatcher.omnvar_update[f5_arg1.omnvar]
	if f5_local0 then
		for f5_local4, f5_local5 in pairs( f5_local0 ) do
			if not f5_local4:IsClosed() then
				f5_local5( f5_local4, f5_arg1 )
			end
		end
	end
	return true
end

function registerDirectDispatchHandler( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	assert( type( f6_arg1 ) == "userdata" )
	assert( type( f6_arg2 ) == "string" )
	assert( type( f6_arg3 ) == "function" )
	local f6_local0 = f6_arg0.direct_dispatch
	local f6_local1 = f6_arg0.direct_dispatch[f6_arg2]
	if not f6_local1 then
		f6_local1 = setmetatable( {}, {
			__mode = "k"
		} )
	end
	f6_local0[f6_arg2] = f6_local1
	f6_arg0.direct_dispatch[f6_arg2][f6_arg1] = f6_arg3
end

function directDispatcher( f7_arg0, f7_arg1 )
	local f7_local0 = f7_arg0.eventCatcher.direct_dispatch[f7_arg1.name]
	if f7_local0 then
		for f7_local4, f7_local5 in pairs( f7_local0 ) do
			if not f7_local4:IsClosed() then
				assert( f7_local4.m_eventHandlers[f7_arg1.name] == f7_local5 )
				f7_local5( f7_local4, f7_arg1 )
			end
		end
	end
	return true
end

LockTable( _M )
