LUI.HudManager = LUI.Class( LUI.UIElement )
LUI.HudManager.GetInstance = function ( f1_arg0 )
	local f1_local0 = Engine.GetLuiRoot()
	assert( f1_local0 )
	local f1_local1 = f1_local0.hudManager
	assert( f1_local1 )
	return f1_local1
end

LUI.HudManager.init = function ( f2_arg0, f2_arg1, f2_arg2 )
	if not f2_arg1 then
		f2_arg1 = {
			left = 0,
			right = 0,
			top = 0,
			bottom = 0,
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true
		}
	end
	LUI.UIElement.init( f2_arg0, f2_arg1 )
	f2_arg0.id = "HudManager"
	f2_arg0.root = f2_arg2.root
	f2_arg0._controllerIndex = f2_arg0.root:GetControllerIndex()
	local f2_local0 = function ()
		require( "requires.inGame.SPJackalInteriorScreens" )
		local f3_local0 = Engine.TableLookup( CSV.levels.file, CSV.levels.cols.name, Game.GetMapName(), CSV.levels.cols.isShipCrib )
		if f3_local0 == "0" or f3_local0 == "" then
			require( "requires.inGame.SPJackal" )
		end
	end
	
	local f2_local1 = function ( f4_arg0, f4_arg1 )
		if f4_arg1.value == true then
			f2_local0()
		end
	end
	
	if Engine.IsSingleplayer() then
		if true == Game.GetOmnvar( "ui_jackal_load_ui" ) then
			f2_local0()
		else
			f2_arg0:registerOmnvarHandler( "ui_jackal_load_ui", f2_local1 )
		end
	end
end

LUI.HudManager.ShouldBeVisible = function ( f5_arg0 )
	local f5_local0 = Engine.InFrontend()
	local f5_local1 = Game.IsInitialized()
	local f5_local2 = LUI.PostGameManager.IsPostGame()
	local f5_local3 = Engine.IsCoreMode()
	if f5_local3 then
		f5_local3 = Game.GetOmnvar( "ui_mapshot_camera" )
	end
	local f5_local4 = Engine.IsRunningTransitionSettleFrames()
	local f5_local5 = f5_local1
	local f5_local6
	if not f5_local0 and not f5_local2 and not f5_local3 then
		f5_local6 = not f5_local4
	else
		f5_local6 = false
	end
	return f5_local6
end

LUI.HudManager.CloseHud = function ( f6_arg0 )
	if f6_arg0.hud then
		f6_arg0.hud:closeTree()
		f6_arg0.hud = nil
	end
end

LUI.HudManager.CreateHud = function ( f7_arg0 )
	f7_arg0:CloseHud()
	profile.beginuserevent( "hud_create" )
	local self = LUI.UIElement.new()
	self.id = "letterbox"
	if not CONDITIONS.IsSplitscreen() then
		self:setupLetterboxElement( true )
	end
	if Engine.IsAliensMode() and Engine.GetDvarString( "ui_mapname" ) == "cp_rave" then
		f7_arg0.activeHud = LUI.ZMHUDDLC1.new( f7_arg0._controllerIndex )
	elseif Engine.IsAliensMode() and Engine.GetDvarString( "ui_mapname" ) == "cp_disco" then
		f7_arg0.activeHud = LUI.ZMHUDDLC2.new( f7_arg0._controllerIndex )
	elseif Engine.IsAliensMode() and Engine.GetDvarString( "ui_mapname" ) == "cp_town" then
		f7_arg0.activeHud = LUI.ZMHUDDLC3.new( f7_arg0._controllerIndex )
	elseif Engine.IsAliensMode() and Engine.GetDvarString( "ui_mapname" ) == "cp_final" then
		f7_arg0.activeHud = LUI.ZMHUDDLC4.new( f7_arg0._controllerIndex )
	elseif Engine.IsAliensMode() then
		f7_arg0.activeHud = LUI.ZMHUD.new( f7_arg0._controllerIndex )
	elseif Engine.IsMultiplayer() then
		f7_arg0.activeHud = LUI.MPHUD.new( f7_arg0._controllerIndex )
	else
		local f7_local1 = Engine.TableLookup( CSV.levels.file, CSV.levels.cols.name, Engine.GetDvarString( "ui_mapname" ), CSV.levels.cols.isShipCrib ) == "1"
		local f7_local2 = DataSources.inGame.SP.activeHUD:GetValue( f7_arg0._controllerIndex )
		if f7_local2 == "jackal" then
			if LUI.JackalHUD == nil then
				if f7_local1 then
					require( "requires.inGame.SPJackalShipCrib" )
				else
					require( "requires.inGame.SPJackal" )
				end
			end
			f7_arg0.activeHud = LUI.JackalHUD.new( f7_arg0._controllerIndex )
		elseif f7_local2 == "infantry" then
			f7_arg0.activeHud = LUI.SPHUD.new( f7_arg0._controllerIndex )
		end
	end
	if f7_arg0.activeHud ~= nil then
		f7_arg0.activeHud.initialized = true
		self:addElement( f7_arg0.activeHud )
	end
	f7_arg0.hud = self
	profile.enduserevent( "hud_create" )
	if f7_arg0.hud then
		f7_arg0.hud:SetUseGameClock( true )
		f7_arg0.hud:processEvent( {
			name = "menu_create",
			dispatchChildren = true
		} )
		f7_arg0:addElement( f7_arg0.hud )
	end
end

LUI.HudManager.InitLayer = function ( f8_arg0 )
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self:setHudElemLayer()
	f8_arg0:addElement( self )
	if Engine.IsMultiplayer() then
		f8_arg0:CreateHud()
	else
		f8_arg0:SubscribeToModel( DataSources.inGame.SP.activeHUD:GetModel( f8_arg0._controllerIndex ), function ()
			f8_arg0:CreateHud()
		end )
	end
end

LUI.HudManager.ClearLayer = function ( f10_arg0, f10_arg1 )
	f10_arg0:CloseHud()
	f10_arg0:closeChildren()
end

