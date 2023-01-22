LUI.ScoreboardLayer = LUI.Class( LUI.UIElement )
local f0_local0 = function ( f1_arg0 )
	if f1_arg0._scoreboard then
		f1_arg0:addElement( f1_arg0._scoreboard )
		f1_arg0._scoreboard:processEvent( {
			name = "open_scoreboard"
		} )
		f1_arg0._scoreboard:SetAlpha( 1 )
		DataModel.SetModelValue( f1_arg0._isScoreboardOpenModel, true )
	end
end

LUI.ScoreboardLayer.CloseScoreboard = function ( f2_arg0 )
	if f2_arg0._scoreboard then
		f2_arg0._scoreboard:processEvent( {
			name = "close_scoreboard"
		} )
		f2_arg0._scoreboard:SetAlpha( 0 )
		DataModel.SetModelValue( f2_arg0._isScoreboardOpenModel, false )
		if f2_arg0 == f2_arg0._scoreboard:getParent() then
			f2_arg0:removeElement( f2_arg0._scoreboard )
		end
	end
end

LUI.ScoreboardLayer.init = function ( f3_arg0, f3_arg1 )
	LUI.ScoreboardLayer.super.init( f3_arg0 )
	f3_arg0.id = "ScoreboardLayer"
	f3_arg0._controllerIndex = f3_arg1
	f3_arg0._visibilityOverride = nil
end

LUI.ScoreboardLayer.GetInstance = function ()
	local f4_local0 = Engine.GetLuiRoot()
	assert( f4_local0 )
	local f4_local1 = f4_local0.scoreboardLayer
	assert( f4_local1 )
	return f4_local1
end

LUI.ScoreboardLayer.IsShowingScoreboard = function ( f5_arg0 )
	return f5_arg0._isScoreboardOpenModel and DataModel.GetModelValue( f5_arg0._isScoreboardOpenModel )
end

LUI.ScoreboardLayer.ShouldBeVisible = function ( f6_arg0 )
	return Game.IsInitialized()
end

LUI.ScoreboardLayer.SetVisibilityOverride = function ( f7_arg0, f7_arg1 )
	if f7_arg0._scoreboard then
		local f7_local0 = f7_arg0:IsShowingScoreboard()
		if f7_local0 and f7_arg1 == false then
			f7_arg0:CloseScoreboard()
		elseif f7_arg1 == true and not f7_local0 then
			f0_local0( f7_arg0 )
		end
	end
	f7_arg0._visibilityOverride = f7_arg1
end

LUI.ScoreboardLayer.InitLayer = function ( f8_arg0 )
	local f8_local0 = Game.GetGameType()
	local f8_local1 = nil
	if Engine.IsAliensMode() then
		f8_local1 = "Inventory"
		if Engine.GetDvarString( "ui_mapname" ) == "cp_rave" then
			f8_local1 = "InventoryDLC1"
		end
		if Engine.GetDvarString( "ui_mapname" ) == "cp_disco" then
			f8_local1 = "InventoryDLC2"
		end
		if Engine.GetDvarString( "ui_mapname" ) == "cp_town" then
			f8_local1 = "InventoryDLC3"
		end
		if Engine.GetDvarString( "ui_mapname" ) == "cp_final" then
			f8_local1 = "InventoryDLC4"
		end
	else
		if GameX.gameModeIsFFA( f8_local0 ) then
			local f8_local2 = "FFAScoreboard"
		end
		f8_local1 = f8_local2 or "TeamScoreboard"
	end
	f8_arg0._scoreboard = MenuBuilder.BuildRegisteredType( f8_local1, {
		controllerIndex = f8_arg0._controllerIndex
	} )
	f8_arg0._isScoreboardOpenModel = DataSources.inGame.HUD.isScoreboardOpen:GetModel( f8_arg0._controllerIndex )
	DataModel.SetModelValue( f8_arg0._isScoreboardOpenModel, false )
	f8_arg0._scoreboard:SetAlpha( 0 )
	f8_arg0:SetVisibilityOverride( f8_arg0._visibilityOverride )
	f8_arg0:registerEventHandler( "togglescores", function ( element, event )
		if element._visibilityOverride ~= nil then
			return 
		elseif element:IsShowingScoreboard() then
			element:CloseScoreboard()
		else
			f0_local0( element )
		end
	end )
	f8_arg0:registerEventHandler( "empty_menu_stack", function ( element )
		element:SetAlpha( 1 )
	end )
	f8_arg0:registerEventHandler( "non_empty_menu_stack", function ( element )
		element:SetAlpha( 0 )
	end )
	if Engine.IsCoreMode() then
		f8_arg0:SubscribeToModel( DataSources.inGame.MP.match.postGameState:GetModel( f8_arg0._controllerIndex ), function ( f12_arg0 )
			if DataModel.GetModelValue( f12_arg0 ) == PostGameState.SCOREBOARD then
				f8_arg0:SetVisibilityOverride( true )
			else
				f8_arg0:SetVisibilityOverride( nil )
			end
		end )
	end
end

LUI.ScoreboardLayer.ClearLayer = function ( f13_arg0, f13_arg1 )
	f13_arg0:closeChildren()
	f13_arg0._scoreboard = nil
	DataModel.SetModelValue( f13_arg0._isScoreboardOpenModel, false )
end

LUI.ScoreboardLayer.TrapsInput = function ( f14_arg0, f14_arg1 )
	local f14_local0
	if f14_arg1.qualifier ~= "dpad" and f14_arg1.button ~= "primary" and f14_arg1.button ~= "start" and f14_arg1.button ~= "alt1" then
		f14_local0 = false
	else
		f14_local0 = true
	end
	local f14_local1
	if Engine.IsConsoleGame() or f14_arg1.qualifier ~= "keyboard" or f14_arg1.button ~= "up" and f14_arg1.button ~= "down" and f14_arg1.button ~= "left" and f14_arg1.button ~= "right" then
		f14_local1 = false
	else
		f14_local1 = true
	end
	local f14_local2
	if f14_arg1.qualifier ~= "keyboard" or f14_arg1.button ~= "primary" then
		f14_local2 = false
	else
		f14_local2 = true
	end
	local f14_local3 = f14_arg0:IsShowingScoreboard()
	if f14_local3 then
		if not f14_local0 then
			local f14_local4 = f14_local1
		end
		f14_local3 = f14_local4 and not f14_local2
	end
	return f14_local3
end

LUI.ScoreboardLayer.ProcessInputEvent = function ( f15_arg0, f15_arg1 )
	local f15_local0 = false
	local f15_local1 = f15_arg0.m_eventHandlers[f15_arg1.name]
	if f15_local1 then
		f15_local0 = f15_local1( f15_arg0, f15_arg1 )
	end
	if f15_arg0:TrapsInput( f15_arg1 ) and not f15_local0 then
		f15_local0 = LUI.ScoreboardLayer.super.processEvent( f15_arg0, f15_arg1 )
	end
	return f15_local0
end

LUI.ScoreboardLayer.processEvent = function ( f16_arg0, f16_arg1 )
	if f16_arg1.name == "gamepad_button" and not f16_arg1.down then
		return 
	elseif IsInputEvent( f16_arg1.name ) then
		return f16_arg0:ProcessInputEvent( f16_arg1 )
	else
		return LUI.ScoreboardLayer.super.processEvent( f16_arg0, f16_arg1 )
	end
end

