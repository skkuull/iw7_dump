LUI.Fence = LUI.Class()
LUI.Fence.fenceTypes = {}
LUI.Fence.STATE = {
	pass = 0,
	block = 1,
	fail = 2
}
LUI.Fence.Register = function ( f1_arg0, f1_arg1 )
	assert( type( f1_arg1.UpdateState ) == "function" )
	assert( not LUI.Fence.fenceTypes[f1_arg0] )
	LUI.Fence.fenceTypes[f1_arg0] = f1_arg1
end

LUI.Fence.Instantiate = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	local f2_local0 = LUI.Fence.fenceTypes[f2_arg0]
	assert( f2_local0 )
	return f2_local0.new( f2_arg1, f2_arg2, f2_arg3 )
end

LUI.Fence.init = function ( f3_arg0 )
	f3_arg0._state = LUI.Fence.STATE.block
end

LUI.Fence.Start = function ( f4_arg0 )
	
end

LUI.Fence.Frame = function ( f5_arg0 )
	
end

LUI.Fence.Stop = function ( f6_arg0 )
	
end

LUI.Fence.State = function ( f7_arg0 )
	assert( f7_arg0._state )
	return f7_arg0._state
end

LUI.FenceGroup = LUI.Class()
LUI.FenceGroup.STATE = {
	pass = 0,
	block = 1,
	fail = 2,
	abort = 3
}
LUI.FenceGroup.init = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
	assert( #f8_arg1 > 0 )
	f8_arg0._fences = {}
	f8_arg0._state = nil
	for f8_local3, f8_local4 in ipairs( f8_arg1 ) do
		table.insert( f8_arg0._fences, LUI.Fence.Instantiate( f8_local4, f8_arg0, f8_arg2, f8_arg3 ) )
	end
	f8_arg0._activeFenceIndex = 0
end

LUI.FenceGroup.Reset = function ( f9_arg0 )
	local f9_local0 = f9_arg0._fences[f9_arg0._activeFenceIndex]
	if f9_local0 then
		f9_local0:Stop()
	end
	f9_arg0._state = nil
	f9_arg0._activeFenceIndex = 0
end

LUI.FenceGroup.Frame = function ( f10_arg0 )
	if f10_arg0._busy then
		return 
	end
	f10_arg0._busy = true
	assert( f10_arg0._state ~= LUI.FenceGroup.STATE.fail )
	assert( f10_arg0._state ~= LUI.FenceGroup.STATE.abort )
	assert( f10_arg0._activeFenceIndex )
	if f10_arg0._activeFenceIndex < 1 then
		f10_arg0._activeFenceIndex = 1
		f10_arg0._fences[f10_arg0._activeFenceIndex]:Start()
	end
	local f10_local0 = f10_arg0._state
	local f10_local1 = LUI.FenceGroup.STATE.pass
	for f10_local5, f10_local6 in ipairs( f10_arg0._fences ) do
		if f10_local6:State() == LUI.Fence.STATE.fail then
			f10_local1 = LUI.FenceGroup.STATE.fail
			break
		elseif f10_arg0._activeFenceIndex <= f10_local5 then
			break
		end
	end
	if f10_local1 ~= LUI.FenceGroup.STATE.fail then
		for f10_local5, f10_local6 in ipairs( f10_arg0._fences ) do
			assert( f10_local5 <= f10_arg0._activeFenceIndex )
			local f10_local7 = f10_local6:State()
			if f10_local7 ~= LUI.Fence.STATE.fail then
				f10_local6:UpdateState()
				f10_local6:Frame()
				f10_local7 = f10_local6:State()
			end
			if f10_local7 == LUI.Fence.STATE.pass then
				if f10_local5 == f10_arg0._activeFenceIndex then
					f10_arg0._fences[f10_arg0._activeFenceIndex]:Stop()
					f10_arg0._activeFenceIndex = f10_arg0._activeFenceIndex + 1
					if f10_arg0._activeFenceIndex <= #f10_arg0._fences then
						f10_arg0._fences[f10_arg0._activeFenceIndex]:Start()
					end
				end
			end
			if f10_local7 == LUI.Fence.STATE.block then
				f10_local1 = LUI.FenceGroup.STATE.block
				if f10_local5 < f10_arg0._activeFenceIndex then
					if f10_arg0._activeFenceIndex <= #f10_arg0._fences then
					
					else
						f10_arg0._activeFenceIndex = f10_local5
						f10_arg0._fences[f10_arg0._activeFenceIndex]:Start()
						break
					end
					f10_arg0._fences[f10_arg0._activeFenceIndex]:Stop()
				end
			elseif f10_local7 == LUI.Fence.STATE.fail then
				if f10_local5 == f10_arg0._activeFenceIndex then
				
				else
					f10_local1 = LUI.FenceGroup.STATE.fail
					break
				end
				f10_arg0._fences[f10_arg0._activeFenceIndex]:Stop()
				f10_arg0._activeFenceIndex = nil
			end
			assert( false, "Unexpected fence state" )
		end
	end
	assert( f10_arg0._state == f10_local0 )
	if f10_local1 ~= f10_arg0._state then
		f10_arg0._state = f10_local1
		if f10_arg0._state == LUI.FenceGroup.STATE.pass then
			f10_arg0:OnPass()
		elseif f10_arg0._state == LUI.FenceGroup.STATE.block then
			f10_arg0:OnBlock()
		elseif f10_arg0._state == LUI.FenceGroup.STATE.fail then
			f10_arg0:BackOut()
			f10_arg0:Fail()
		end
	end
	f10_arg0._busy = false
end

LUI.FenceGroup.Abort = function ( f11_arg0 )
	if f11_arg0._fences[f11_arg0._activeFenceIndex] then
		f11_arg0._fences[f11_arg0._activeFenceIndex]:Stop()
	end
	f11_arg0._state = LUI.FenceGroup.STATE.abort
	f11_arg0._activeFenceIndex = nil
end

LUI.FenceGroup.BackOut = function ( f12_arg0 )
	for f12_local0 = 1, #f12_arg0._fences, 1 do
		local f12_local3 = f12_arg0._fences[#f12_arg0._fences - f12_local0 + 1]
		if f12_local3.OnBackOut then
			f12_local3:OnBackOut()
		end
	end
end

LUI.FenceGroup.Fail = function ( f13_arg0 )
	f13_arg0:OnFail()
	for f13_local0 = 1, #f13_arg0._fences, 1 do
		local f13_local3 = f13_arg0._fences[#f13_arg0._fences - f13_local0 + 1]
		if f13_local3.PostFail then
			f13_local3:PostFail()
		end
	end
end

LUI.FenceGroup.OnPass = function ( f14_arg0 )
	DebugPrint( "Fence passes" )
end

LUI.FenceGroup.OnBlock = function ( f15_arg0 )
	DebugPrint( "Fence blocks" )
end

LUI.FenceGroup.OnFail = function ( f16_arg0 )
	DebugPrint( "Fence failed" )
end

LUI.FenceGroup.Passes = function ( f17_arg0 )
	return f17_arg0._state == LUI.FenceGroup.STATE.pass
end

