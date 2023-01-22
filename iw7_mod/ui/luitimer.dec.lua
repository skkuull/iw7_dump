LUI.UITimer = LUI.Class( LUI.UIElement )
local f0_local0 = {}
LUI.UITimer.priority = 10000
Queue = {
	new = function ()
		local f1_local0 = {
			first = 0,
			last = -1
		}
		setmetatable( f1_local0, Queue )
		Queue.__index = Queue
		return f1_local0
	end,
	push = function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg0.last + 1
		f2_arg0.last = f2_local0
		f2_arg0[f2_local0] = f2_arg1
	end,
	pop = function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg0.first
		if f3_arg0.last < f3_local0 then
			return nil
		else
			local f3_local1 = f3_arg0[f3_local0]
			f3_arg0[f3_local0] = nil
			f3_arg0.first = f3_local0 + 1
			return f3_local1
		end
	end
}
LUI.UITimer.build = function ( f4_arg0, f4_arg1 )
	assert( f4_arg1.interval, "No property for interval set for timer" )
	assert( f4_arg1.event, "No property for event set for timer" )
	return LUI.UITimer.new( nil, f4_arg1 )
end

LUI.UITimer.init = function ( f5_arg0, f5_arg1, f5_arg2 )
	if not f5_arg1 then
		f5_arg1 = {
			left = 0,
			top = 0,
			right = 1,
			bottom = 1,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = false
		}
	end
	LUI.UIElement.init( f5_arg0, f5_arg1 )
	f5_arg0.id = "LUITimer"
	f5_arg0:setPriority( LUI.UITimer.priority )
	if not f5_arg2 then
		f5_arg2 = {}
	end
	f5_arg0.reset = LUI.UITimer.Reset
	f5_arg0.interval = math.max( 1, f5_arg2.interval )
	f5_arg0.disposable = f5_arg2.disposable
	f5_arg0.broadcastToRoot = f5_arg2.broadcastToRoot
	if type( f5_arg2.event ) == "string" then
		f5_arg0.timerEvent = {
			name = f5_arg2.event,
			timer = f5_arg0
		}
	else
		f5_arg2.event.timer = f5_arg0
		f5_arg0.timerEvent = f5_arg2.event
	end
	f5_arg0.timerEventTarget = f5_arg2.eventTarget
	f5_arg0.timerGroup = f5_arg2.timerGroup
	local f5_local0 = "TE_" .. (f5_arg0.timerGroup and f5_arg0.timerGroup .. "_" or "") .. f5_arg0.timerEvent.name
	f5_arg0.profileID = profile.lookupusereventid( f5_local0 ) or profile.createuserevent( f5_local0, "duration" )
	if not f5_arg2.stopped then
		f5_arg0:reset()
	end
end

LUI.UITimer.Reset = function ( f6_arg0 )
	f6_arg0:registerEventHandler( "transition_complete_default", nil )
	f6_arg0:animateToState( "default", f6_arg0.interval )
	f6_arg0:registerEventHandler( "transition_complete_default", LUI.UITimer.Tick )
end

LUI.UITimer.Stop = function ( f7_arg0 )
	f7_arg0:registerEventHandler( "transition_complete_default", nil )
	f7_arg0:animateToState( "default", 0 )
end

LUI.UITimer.Tick = function ( f8_arg0, f8_arg1 )
	local f8_local0 = nil
	if f8_arg0.timerEventTarget ~= nil then
		f8_local0 = f8_arg0.timerEventTarget
	else
		f8_local0 = f8_arg0:getParent()
	end
	local f8_local1 = f8_arg0.timerEvent
	f8_local1.timeElapsed = f8_arg0.interval + f8_arg1.lateness
	if f8_arg0.timerGroup then
		f8_local1.target = f8_local0
		local f8_local2 = f8_arg0:getRootParent()
		local f8_local3 = f8_arg0.timerGroup
		if not f8_local2.timerGroupQueues[f8_local3] then
			f8_local2.timerGroupQueues[f8_local3] = Queue.new()
		end
		f8_local2.timerGroupQueues[f8_local3]:push( f8_local1 )
	else
		if not f8_arg0.broadcastToRoot then
			profile.beginuserevent( f8_arg0.profileID )
			f8_local0:processEvent( f8_local1 )
			profile.enduserevent( f8_arg0.profileID )
		else
			f8_local1.target = f8_local0
			f8_arg0:dispatchEventToRoot( f8_local1 )
		end
		if f8_arg0.disposable then
			f8_arg0:close()
		else
			f8_arg0:reset()
		end
	end
end

LUI.UITimer.DispatchEventsFromQueue = function ( f9_arg0 )
	for f9_local4, f9_local5 in pairs( f9_arg0.timerGroupQueues ) do
		local f9_local6 = f9_local5:pop()
		if f9_local6 then
			profile.beginuserevent( f9_local6.timer.profileID )
			f9_local6.target:processEvent( f9_local6 )
			profile.enduserevent( f9_local6.timer.profileID )
			local f9_local3 = f9_local6.timer
			if f9_local3.disposable then
				f9_local3:close()
			else
				f9_local3:reset()
			end
		end
	end
end

