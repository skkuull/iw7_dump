PostGameFanfare = {
	states = {
		AAR_SUMMARY = 0
	}
}
local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0._state = f1_arg1
	if f1_arg0._state == PostGameFanfare.states.AAR_SUMMARY then
		OpenAfterActionReport( f1_arg0._controllerIndex, false, true )
	end
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	if f2_arg0._state == PostGameFanfare.states.AAR_SUMMARY then
		LUI.FlowManager.RequestLeaveMenuByName( "AARMain", true )
	end
	f2_arg0._state = nil
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	if f3_arg1 == nil then
		f0_local1( f3_arg0, f3_arg0._state )
	end
	f0_local0( f3_arg0, f3_arg1 )
end

PostGameFanfare.start = function ( f4_arg0 )
	f0_local2( f4_arg0, nil )
	f4_arg0._controllerIndex = Engine.GetFirstActiveController()
	InitAARDataSources( f4_arg0._controllerIndex )
	f4_arg0:advance()
end

PostGameFanfare.advance = function ( f5_arg0 )
	assert( f5_arg0._controllerIndex )
	local f5_local0 = f5_arg0._controllerIndex == Engine.GetFirstActiveController()
	if f5_arg0._state == nil then
		f0_local2( f5_arg0, PostGameFanfare.states.AAR_SUMMARY )
		return 
	elseif f5_arg0._state < PostGameFanfare.states.AAR_SUMMARY then
		f0_local2( f5_arg0, PostGameFanfare.states.AAR_SUMMARY )
		return 
	end
	local f5_local1 = f5_arg0._controllerIndex
	local f5_local2 = Engine.GetMaxControllerCount() - 1
	for f5_local3 = f5_arg0._controllerIndex + 1, f5_local2, 1 do
		if Engine.HasActiveLocalClient( f5_local3 ) then
			f5_arg0._controllerIndex = f5_local3
			break
		end
	end
	f0_local2( f5_arg0, nil )
	if f5_arg0._controllerIndex ~= f5_local1 then
		return f5_arg0:advance()
	end
end

