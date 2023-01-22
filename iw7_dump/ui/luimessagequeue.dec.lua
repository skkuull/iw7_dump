LUI.UIMessageQueue = LUI.Class( LUI.UIElement )
LUI.UIMessageQueue.MessageType = {
	StartInfo = {
		key = "StartInfo",
		priority = 0,
		displayTime = 2000,
		maxWaitTime = 5000
	},
	LevelUp = {
		key = "LevelUp",
		priority = 10,
		displayTime = 2000,
		maxWaitTime = 5000
	},
	Accolades = {
		key = "Accolades",
		priority = 20,
		displayTime = 2000,
		maxWaitTime = 5000
	},
	Killstreaks = {
		key = "Killstreaks",
		priority = 30,
		displayTime = 2000,
		maxWaitTime = 5000
	},
	ObjectiveUpdate = {
		key = "ObjectiveUpdate",
		priority = 40,
		displayTime = 2000,
		maxWaitTime = 5000
	},
	LocalPlayerSplash = {
		key = "LocalPlayerSplash",
		priority = 10,
		displayTime = 1500,
		maxWaitTime = -1
	},
	GlobalPlayerSplash = {
		key = "GlobalPlayerSplash",
		priority = 10,
		displayTime = 2250,
		maxWaitTime = -1
	},
	PlayerAwards = {
		key = "PlayerAwards",
		priority = 20,
		displayTime = 1000,
		maxWaitTime = -1,
		isStackable = true
	},
	MiscMessages = {
		key = "MiscMessages",
		priority = 20,
		displayTime = 1250,
		maxWaitTime = -1
	},
	JackalWarning = {
		key = "JackalWarning",
		priority = 45,
		displayTime = 1000,
		maxWaitTime = 5000
	},
	JackalFlightMode = {
		key = "JackalFlightMode",
		priority = 30,
		displayTime = 1000,
		maxWaitTime = 500
	},
	JackalAutopilot = {
		key = "JackalAutopilot",
		priority = 40,
		displayTime = 1500,
		maxWaitTime = 1000
	},
	JackalBoosterState = {
		key = "JackalBoosterState",
		priority = 50,
		displayTime = 2000,
		maxWaitTime = 5000
	},
	JackalMissileWarning = {
		key = "JackalMissileWarning",
		priority = 100,
		displayTime = 3000,
		maxWaitTime = 5000
	},
	JackalLeavingWarning = {
		key = "JackalLeavingWarning",
		priority = 110,
		displayTime = 3000,
		maxWaitTime = 3000
	},
	JackalOverheatWarning = {
		key = "JackalOverheatWarning",
		priority = 90,
		displayTime = 3000,
		maxWaitTime = 3000
	},
	JackalFlaresWarning = {
		key = "JackalFlaresWarning",
		priority = 85,
		displayTime = 3000,
		maxWaitTime = 1000
	},
	LocalPlayerZombieSplash = {
		key = "LocalPlayerZombieSplash",
		priority = 80,
		displayTime = 2500,
		maxWaitTime = 5000
	},
	LocalPlayerZombieSplashDLC1 = {
		key = "LocalPlayerZombieSplashDLC1",
		priority = 80,
		displayTime = 2500,
		maxWaitTime = 5000
	},
	LocalPlayerZombieSplashDLC2 = {
		key = "LocalPlayerZombieSplashDLC2",
		priority = 80,
		displayTime = 2500,
		maxWaitTime = 5000
	},
	LocalPlayerZombieSplashDLC3 = {
		key = "LocalPlayerZombieSplashDLC3",
		priority = 80,
		displayTime = 2700,
		maxWaitTime = 5000
	},
	LocalPlayerZombieSplashDLC4 = {
		key = "LocalPlayerZombieSplashDLC4",
		priority = 80,
		displayTime = 2700,
		maxWaitTime = 5000
	},
	WaveNumberSplash = {
		key = "WaveNumberSplash",
		priority = 50,
		displayTime = 2000,
		maxWaitTime = 10000
	},
	TicketMachine = {
		key = "TicketMachine",
		priority = 70,
		displayTime = 2500,
		maxWaitTime = 5000
	},
	PowerupActivated = {
		key = "PowerupActivated",
		priority = 90,
		displayTime = 670,
		maxWaitTime = 2000
	},
	ChallengeSplash = {
		key = "ChallengeSplash",
		priority = 20,
		displayTime = 2400,
		maxWaitTime = 5000
	}
}
LUI.UIMessageQueue.init = function ( f1_arg0, f1_arg1, f1_arg2 )
	LUI.UIMessageQueue.super.init( f1_arg0, f1_arg1, f1_arg2 )
	assert( type( f1_arg2 ) == "table" )
	assert( f1_arg2.controller )
	f1_arg0.messageQueue = {}
	f1_arg0.widgetMap = {}
	f1_arg0.currentMessage = nil
	f1_arg0.controller = f1_arg2.controller
	f1_arg0.nextMessageDelay = f1_arg2.nextMessageDelay or 500
	f1_arg0:registerEventHandler( "level_load", function ()
		f1_arg0.currentMessage = nil
		f1_arg0.messageQueue = {}
	end )
end

LUI.UIMessageQueue.AddWidget = function ( f3_arg0, f3_arg1, f3_arg2 )
	assert( type( f3_arg2 ) == "table" )
	assert( f3_arg2.messageType )
	assert( not LUI.IsItemInArray( f3_arg0.widgetMap, f3_arg2.messageType ) )
	f3_arg0.widgetMap[f3_arg2.messageType.key] = f3_arg1
	f3_arg0:SubscribeToModel( f3_arg2.dataSourcesFrom.push:GetModel( f3_arg0.controller ), function ()
		if f3_arg2.dataSourcesFrom.push:GetValue( f3_arg0.controller ) then
			local f4_local0 = {}
			for f4_local4, f4_local5 in pairs( f3_arg2.dataSourcesFrom ) do
				f4_local0[f4_local4] = f4_local5:GetValue( f3_arg0.controller )
			end
			DataModel.SetModelValue( f3_arg2.dataSourcesFrom.push:GetModel( f3_arg0.controller ), false )
			f3_arg0:AddMessage( f3_arg2.messageType, f4_local0, f3_arg2.dataSourcesTo )
		end
	end, true )
	if f3_arg2.dataSourcesFrom.clear then
		f3_arg0:SubscribeToModel( f3_arg2.dataSourcesFrom.clear:GetModel( f3_arg0.controller ), function ()
			if f3_arg2.dataSourcesFrom.clear:GetValue( f3_arg0.controller ) then
				f3_arg0:RemoveMessagesOfType( f3_arg2.messageType, true, true )
				DataModel.SetModelValue( f3_arg2.dataSourcesFrom.clear:GetModel( f3_arg0.controller ), false )
			end
		end, true )
	end
end

LUI.UIMessageQueue.AddMessage = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	local f6_local0 = {
		messageType = f6_arg1,
		values = f6_arg2,
		dataSourcesTo = f6_arg3,
		insertTime = Engine.GetMilliseconds(),
		maxWaitTime = f6_arg1.maxWaitTime,
		displayTime = f6_arg1.displayTime
	}
	if f6_arg2.priorityOverride then
		f6_local0.priorityOverride = f6_arg2.priorityOverride:GetValue( f6_arg0.controller )
	end
	if f6_arg1.displayTime < 0 then
		DebugPrint( "Adding new non-expiring message of type " .. f6_arg1.key .. ". Removing any previous ones." )
		f6_arg0:RemoveMessagesOfType( f6_arg1, true, false )
	end
	f6_arg0.messageQueue[#f6_arg0.messageQueue + 1] = f6_local0
	if not f6_arg0.currentMessage then
		f6_arg0:ExecuteNextMessage()
	end
end

LUI.UIMessageQueue.RemoveMessagesOfType = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
	for f7_local0 = #f7_arg0.messageQueue, 1, -1 do
		if f7_arg0.messageQueue[f7_local0].messageType == f7_arg1 then
			table.remove( f7_arg0.messageQueue, f7_local0 )
		end
	end
	if f7_arg0.currentMessage and f7_arg0.currentMessage.messageType == f7_arg1 then
		if f7_arg2 and f7_arg0.currentMessage.messageType.displayTime > -1 then
			f7_arg0:OnMessageComplete()
		elseif f7_arg3 then
			f7_arg0:OnMessageDisplayFinished()
		else
			f7_arg0:ExecuteNextMessage()
		end
	elseif f7_arg3 then
		f7_arg0.widgetMap[f7_arg1.key]:processEvent( {
			name = "message_queue_hide"
		} )
	end
end

LUI.UIMessageQueue.GetHighestPriorityIndex = function ( f8_arg0 )
	assert( #f8_arg0.messageQueue > 0 )
	local f8_local0 = 0
	local f8_local1 = -1
	for f8_local2 = 1, #f8_arg0.messageQueue, 1 do
		local f8_local5 = f8_arg0.messageQueue[f8_local2]
		local f8_local6 = f8_local5.priorityOverride and f8_local5.priorityOverride or f8_local5.messageType.priority
		if f8_local1 < f8_local6 then
			f8_local0 = f8_local2
			f8_local1 = f8_local6
		end
	end
	return f8_local0
end

LUI.UIMessageQueue.ExecuteMessage = function ( f9_arg0, f9_arg1 )
	local f9_local0 = table.remove( f9_arg0.messageQueue, f9_arg1 )
	local f9_local1 = f9_arg0.currentMessage
	local f9_local2 = f9_local1
	local f9_local3 = f9_local1.messageType.isStackable
	if f9_local3 then
		f9_local3 = f9_local2 and f9_local1.messageType == f9_local0.messageType
	end
	f9_arg0.currentMessage = f9_local0
	if f9_local0.dataSourcesTo then
		local f9_local4 = "push"
		for f9_local8, f9_local9 in pairs( f9_local0.dataSourcesTo ) do
			if f9_local8 ~= f9_local4 then
				DataModel.SetModelValue( f9_local9:GetModel( f9_arg0.controller ), f9_local0.values[f9_local8] )
			end
		end
		if f9_local0.dataSourcesTo[f9_local4] ~= nil then
			DataModel.SetModelValue( f9_local0.dataSourcesTo[f9_local4]:GetModel( f9_arg0.controller ), f9_local0.values[f9_local4] )
		end
	end
	if f9_arg0.widgetMap[f9_local0.messageType.key] then
		if not f9_local3 then
			f9_arg0.widgetMap[f9_local0.messageType.key]:processEvent( {
				name = "message_queue_show",
				messageType = f9_local0.messageType
			} )
		end
	else
		DebugPrint( "WARNING: No widget set to handle message of type " .. f9_local0.messageType.key )
	end
	if f9_local0.displayTime > -1 then
		local f9_local4 = f9_arg0:Wait( f9_local0.displayTime )
		f9_local4.onComplete = function ()
			if f9_arg0.currentMessage and f9_arg0.currentMessage == f9_local0 then
				f9_arg0:OnMessageDisplayFinished()
			end
		end
		
	end
end

LUI.UIMessageQueue.ExecuteNextMessage = function ( f11_arg0 )
	if #f11_arg0.messageQueue > 0 then
		f11_arg0:RemoveExpiredMessages()
		if #f11_arg0.messageQueue > 0 then
			local f11_local0 = f11_arg0:GetHighestPriorityIndex()
			assert( f11_local0 > 0 )
			f11_arg0:ExecuteMessage( f11_local0 )
		end
	end
end

LUI.UIMessageQueue.OnMessageComplete = function ( f12_arg0 )
	if f12_arg0.currentMessage then
		f12_arg0.currentMessage = nil
		f12_arg0:ExecuteNextMessage()
	end
end

LUI.UIMessageQueue.OnMessageDisplayFinished = function ( f13_arg0 )
	local f13_local0 = f13_arg0:IsNextMessageStackable()
	if f13_arg0.currentMessage and f13_arg0.widgetMap[f13_arg0.currentMessage.messageType.key] and not f13_local0 then
		f13_arg0.widgetMap[f13_arg0.currentMessage.messageType.key]:processEvent( {
			name = "message_queue_hide"
		} )
	end
	if f13_local0 then
		f13_arg0:OnMessageComplete()
	else
		local f13_local1 = f13_arg0:Wait( f13_arg0.nextMessageDelay )
		f13_local1.onComplete = function ()
			f13_arg0:OnMessageComplete()
		end
		
	end
end

LUI.UIMessageQueue.RemoveExpiredMessages = function ( f15_arg0 )
	local f15_local0 = Engine.GetMilliseconds()
	for f15_local1 = #f15_arg0.messageQueue, 1, -1 do
		local f15_local4 = f15_arg0.messageQueue[f15_local1]
		if f15_local4.maxWaitTime > -1 and f15_local4.maxWaitTime <= f15_local0 - f15_local4.insertTime then
			table.remove( f15_arg0.messageQueue, f15_local1 )
		end
	end
end

LUI.UIMessageQueue.IsNextMessageStackable = function ( f16_arg0 )
	if not f16_arg0.currentMessage or not f16_arg0.currentMessage.messageType.isStackable or #f16_arg0.messageQueue < 1 then
		return false
	else
		local f16_local0 = f16_arg0:GetHighestPriorityIndex()
		assert( f16_local0 > 0 )
		return f16_arg0.currentMessage.messageType == f16_arg0.messageQueue[f16_local0].messageType
	end
end

