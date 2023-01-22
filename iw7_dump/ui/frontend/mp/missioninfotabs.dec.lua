local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.missionInfoTabs"
f0_local1 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local2 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.MissionText )
	local f2_local0 = f2_arg1:GetDataSourceAtIndex( f2_arg0.currentIndex - 1, f2_arg2 )
	if f2_arg0.currentMissionSubscription then
		f2_arg0.MissionText:UnsubscribeFromModel( f2_arg0.currentMissionSubscription )
	end
	f2_arg0.currentMissionSubscription = f2_arg0.MissionText:SubscribeToModel( f2_local0.nameDetailed:GetModel( f2_arg2 ), function ()
		local f3_local0 = f2_local0.nameDetailed:GetValue( f2_arg2 )
		if f3_local0 ~= f2_arg0.MissionText:getText() then
			ACTIONS.AnimateSequence( f2_arg0, "Update" )
			f2_arg0.MissionText:setText( f3_local0, 0 )
		end
	end )
end

local f0_local3 = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	MissionDirector.SetActiveMissionSlot( f4_arg3, f4_arg1, f4_arg0.currentIndex - 1 )
end

local f0_local4 = function ( f5_arg0, f5_arg1, f5_arg2 )
	if f5_arg0.min < f5_arg0.max then
		ACTIONS.AnimateSequence( f5_arg0, "ShowTabs" )
	else
		ACTIONS.AnimateSequence( f5_arg0, "HideTabs" )
	end
end

local f0_local5 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg0:GetCurrentMenu()
	if f6_local0 then
		assert( f6_local0.MissionTeamInfo )
		local f6_local1 = MissionDirector.GetActiveMissionTeam( f6_arg1 )
		f6_local0.MissionTeamInfo:SetupMissionTeam( f6_arg1 )
		f6_arg0:SetDataSource( {
			teamID = LUI.DataSourceInControllerModel.new( f6_local0.menuModelPath .. ".missionInfoTabs." .. f6_local1, f6_local1 )
		}, f6_arg1 )
		local f6_local2 = MissionDirector.GetMissionTeamColor( f6_local1 )
		f6_arg0.HeaderBackground:SetRGBFromInt( f6_local2 )
		f6_arg0.MissionBackground:SetRGBFromInt( f6_local2 )
		f6_arg0.MissionBackgroundNotch:SetRGBFromInt( f6_local2 )
		f6_arg0.Border:SetRGBFromInt( f6_local2 )
		if f6_local1 == 3 then
			f6_arg0.HeaderText:SetRGBFromTable( SWATCHES.CAC.MissionInfoTabBorder, 0 )
		else
			f6_arg0.HeaderText:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
		end
		f6_arg0.Gamertag:setText( Engine.GetLocalClientFullGamertag( f6_arg1 ), 0 )
		f6_arg0.Gamertag:SetAlpha( 1, 0 )
	end
end

local f0_local6 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = f7_arg0:GetDataSource()
	f7_local0 = f7_local0.teamID:GetValue( f7_arg1 )
	local f7_local1 = MissionDirector.GetMissionDataSourcesForTeam( f0_local0, f7_local0, f7_arg1 )
	f7_arg0.currentIndex = math.min( f7_arg0.currentIndex, f7_arg0.max )
	f7_arg0.currentIndex = math.max( f7_arg0.currentIndex, f7_arg0.min )
	f7_arg0.Pips:UpdateScrolling()
	f0_local3( f7_arg0, f7_local0, f7_local1, f7_arg1 )
	f0_local2( f7_arg0, f7_local1, f7_arg1 )
end

local f0_local7 = function ( f8_arg0, f8_arg1 )
	return function ()
		if f8_arg0.currentMissionTeamInfoOwner ~= f8_arg1 then
			f8_arg0.currentMissionTeamInfoOwner = f8_arg1
			local f9_local0 = MissionDirector.GetActiveMissionTeam( f8_arg1 )
			local f9_local1 = MissionDirector.GetMissionDataSourcesForTeam( f0_local0, f9_local0, f8_arg1 )
			local f9_local2 = MissionDirector.GetActiveMission( f8_arg1, f9_local0 )
			for f9_local3 = 0, f9_local1:GetCountValue( f8_arg1 ) - 1, 1 do
				local f9_local6 = f9_local1:GetDataSourceAtIndex( f9_local3, f8_arg1 )
				if f9_local2 == f9_local6.index:GetValue( f8_arg1 ) then
					f8_arg0.currentIndex = f9_local3 + 1
				end
			end
			f8_arg0.min = 1
			f8_arg0.max = f9_local1:GetCountValue( f8_arg1 )
			f8_arg0.currentIndex = f8_arg0.currentIndex or 1
			f0_local4( f8_arg0, f9_local1, f8_arg1 )
			if 1 < Engine.GetNumActiveLocalClients() then
				f0_local5( f8_arg0, f8_arg1 )
			end
		end
		f0_local6( f8_arg0, f8_arg1 )
	end
	
end

function PostLoadFunc( f10_arg0, f10_arg1, f10_arg2 )
	f10_arg0.GetContentSize = function ( f11_arg0, f11_arg1 )
		return f11_arg0.max or 0
	end
	
	f10_arg0.GetFocusPosition = function ( f12_arg0 )
		if f12_arg0.currentIndex ~= nil then
			return f12_arg0.currentIndex - 1
		else
			return 0
		end
	end
	
	f10_arg0.GetDefaultPosition = function ( f13_arg0, f13_arg1 )
		return 0
	end
	
	f10_arg0.Pips:LinkTo( f10_arg0 )
	local f10_local0 = f10_arg0:SubscribeToDataSourceThroughElement( f10_arg0, "teamID", f0_local7( f10_arg0, f10_arg1 ) )
	f10_local0.unlinkOnCallback = true
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	f10_arg0:addElement( bindButton )
	f10_arg0.bindButton = bindButton
	
	f10_arg0.bindButton:addEventHandler( "button_shoulderr", function ( f14_arg0, f14_arg1 )
		if DataSources.frontEnd.lobby.timeRemaining:GetValue( f10_arg1 ) == 0 then
			return true
		else
			f10_arg0.currentIndex = f10_arg0.currentIndex + 1
			local f14_local0 = f0_local7( f10_arg0, f14_arg1.controller )
			f14_local0()
			return true
		end
	end )
	f10_arg0.bindButton:addEventHandler( "button_shoulderl", function ( f15_arg0, f15_arg1 )
		if DataSources.frontEnd.lobby.timeRemaining:GetValue( f10_arg1 ) == 0 then
			return true
		else
			f10_arg0.currentIndex = f10_arg0.currentIndex - 1
			local f15_local0 = f0_local7( f10_arg0, f15_arg1.controller )
			f15_local0()
			return true
		end
	end )
	f10_arg0.bindButton:addEventHandler( "pip_mouse_select", function ( f16_arg0, f16_arg1 )
		assert( f16_arg1.pip )
		if f16_arg1.pip:isDescendentOf( f10_arg0 ) then
			f10_arg0.currentIndex = f16_arg1.index + 1
			f0_local6( f10_arg0, f10_arg1 )
		end
	end )
	f10_arg0.modelPath = f0_local0
	f10_arg0.Border:SetBlendMode( BLEND_MODE.addWithAlpha )
	if MissionDirector.GetActiveMissionTeam( f10_arg1 ) == 3 then
		f10_arg0.HeaderText:SetRGBFromTable( SWATCHES.CAC.MissionInfoTabBorder, 0 )
	end
	if Engine.GetNumActiveLocalClients() > 1 then
		f10_arg0.Gamertag:setText( Engine.GetLocalClientFullGamertag( f10_arg1 ), 0 )
		f10_arg0.Gamertag:SetAlpha( 1, 0 )
	else
		f10_arg0.Gamertag:setText( "", 0 )
		f10_arg0.Gamertag:SetAlpha( 0, 0 )
	end
end

function MissionInfoTabs( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 700 * _1080p, 0, 113 * _1080p )
	self.id = "MissionInfoTabs"
	self._animationSets = {}
	self._sequences = {}
	local f17_local1 = controller and controller.controllerIndex
	if not f17_local1 and not Engine.InFrontend() then
		f17_local1 = self:getRootController()
	end
	assert( f17_local1 )
	local f17_local2 = self
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local HeaderBackground = nil
	
	HeaderBackground = LUI.UIBlur.new()
	HeaderBackground.id = "HeaderBackground"
	HeaderBackground:SetRGBFromInt( 5066061, 0 )
	HeaderBackground:SetBlurStrength( 1.5, 0 )
	HeaderBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 113 )
	self:addElement( HeaderBackground )
	self.HeaderBackground = HeaderBackground
	
	local MissionBackground = nil
	
	MissionBackground = LUI.UIImage.new()
	MissionBackground.id = "MissionBackground"
	MissionBackground:SetRGBFromTable( SWATCHES.CAC.MissionInfoTabBorder, 0 )
	MissionBackground:SetAlpha( 0.6, 0 )
	MissionBackground:SetBlendMode( BLEND_MODE.addWithAlpha )
	MissionBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 328, _1080p * 2, _1080p * 24 )
	self:addElement( MissionBackground )
	self.MissionBackground = MissionBackground
	
	local Notify = nil
	
	Notify = LUI.UIImage.new()
	Notify.id = "Notify"
	Notify:SetAlpha( 0, 0 )
	Notify:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	Notify:SetBlendMode( BLEND_MODE.addWithAlpha )
	Notify:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -700, 0, 0, 0 )
	self:addElement( Notify )
	self.Notify = Notify
	
	local HeaderText = nil
	
	HeaderText = LUI.UIStyledText.new()
	HeaderText.id = "HeaderText"
	HeaderText:setText( ToUpperCase( Engine.Localize( "MPUI_ACTIVE_MISSION" ) ), 0 )
	HeaderText:SetFontSize( 19 * _1080p )
	HeaderText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	HeaderText:SetAlignment( LUI.Alignment.Left )
	HeaderText:SetOptOutRightToLeftAlignmentFlip( true )
	HeaderText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, _1080p * -7, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( HeaderText )
	self.HeaderText = HeaderText
	
	local f17_local8 = nil
	if CONDITIONS.IsGamepadEnabled( self ) then
		f17_local8 = LUI.UIImage.new()
		f17_local8.id = "L1Button"
		f17_local8:setImage( RegisterMaterial( "button_shoulder_left" ), 0 )
		f17_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 9, _1080p * 45.56, _1080p * 84.75, _1080p * 107.25 )
		self:addElement( f17_local8 )
		self.L1Button = f17_local8
	end
	local f17_local9 = nil
	if CONDITIONS.IsGamepadEnabled( self ) then
		f17_local9 = LUI.UIImage.new()
		f17_local9.id = "R1Button"
		f17_local9:setImage( RegisterMaterial( "button_shoulder_right" ), 0 )
		f17_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 282, _1080p * 318.56, _1080p * 84.75, _1080p * 107.25 )
		self:addElement( f17_local9 )
		self.R1Button = f17_local9
	end
	local f17_local10 = nil
	if not CONDITIONS.IsGamepadEnabled( self ) then
		f17_local10 = MenuBuilder.BuildRegisteredType( "ArrowRightClick", {
			controllerIndex = f17_local1
		} )
		f17_local10.id = "ArrowRightClick"
		f17_local10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 290, _1080p * 315, _1080p * 74, _1080p * 118 )
		self:addElement( f17_local10 )
		self.ArrowRightClick = f17_local10
	end
	local f17_local11 = nil
	if not CONDITIONS.IsGamepadEnabled( self ) then
		f17_local11 = MenuBuilder.BuildRegisteredType( "ArrowLeftClick", {
			controllerIndex = f17_local1
		} )
		f17_local11.id = "ArrowLeftClick"
		f17_local11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15, _1080p * 40, _1080p * 74, _1080p * 118 )
		self:addElement( f17_local11 )
		self.ArrowLeftClick = f17_local11
	end
	local MissionText = nil
	
	MissionText = LUI.UIStyledText.new()
	MissionText.id = "MissionText"
	MissionText:setText( Engine.Localize( "MENU_NEW" ), 0 )
	MissionText:SetFontSize( 22 * _1080p )
	MissionText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionText:SetAlignment( LUI.Alignment.Left )
	MissionText:SetOptOutRightToLeftAlignmentFlip( true )
	MissionText:SetShadowMinDistance( -0.2, 0 )
	MissionText:SetShadowMaxDistance( 0.2, 0 )
	MissionText:SetDecodeLetterLength( 12 )
	MissionText:SetDecodeMaxRandChars( 3 )
	MissionText:SetDecodeUpdatesPerLetter( 4 )
	MissionText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 9, _1080p * 467, _1080p * 30, _1080p * 52 )
	self:addElement( MissionText )
	self.MissionText = MissionText
	
	local Pips = nil
	
	Pips = LUI.Pips.new( {
		spacing = _1080p * 11,
		direction = LUI.DIRECTION.horizontal,
		alignment = LUI.Alignment.Center,
		buildPip = function ()
			return MenuBuilder.BuildRegisteredType( "MissionInfoTab", {
				controllerIndex = f17_local1
			} )
		end,
		controllerIndex = f17_local1
	} )
	Pips.id = "Pips"
	Pips:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 111, _1080p * 205, _1080p * 89.5, _1080p * 99.5 )
	self:addElement( Pips )
	self.Pips = Pips
	
	local MissionBackgroundNotch = nil
	
	MissionBackgroundNotch = LUI.UIImage.new()
	MissionBackgroundNotch.id = "MissionBackgroundNotch"
	MissionBackgroundNotch:SetRGBFromTable( SWATCHES.CAC.MissionInfoTabBorder, 0 )
	MissionBackgroundNotch:SetAlpha( 0.6, 0 )
	MissionBackgroundNotch:setImage( RegisterMaterial( "wdg_slot_cut_out_1" ), 0 )
	MissionBackgroundNotch:SetBlendMode( BLEND_MODE.addWithAlpha )
	MissionBackgroundNotch:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 328, _1080p * 350, _1080p * 2, _1080p * 24 )
	self:addElement( MissionBackgroundNotch )
	self.MissionBackgroundNotch = MissionBackgroundNotch
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	Border.id = "Border"
	Border:SetRGBFromTable( SWATCHES.CAC.MissionInfoTabBorder, 0 )
	Border:SetAlpha( 0.6, 0 )
	Border:SetBorderThicknessLeft( _1080p * 2, 0 )
	Border:SetBorderThicknessRight( _1080p * 2, 0 )
	Border:SetBorderThicknessTop( _1080p * 2, 0 )
	Border:SetBorderThicknessBottom( _1080p * 2, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local Gamertag = nil
	
	Gamertag = LUI.UIText.new()
	Gamertag.id = "Gamertag"
	Gamertag:setText( "", 0 )
	Gamertag:SetFontSize( 16 * _1080p )
	Gamertag:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Gamertag:SetAlignment( LUI.Alignment.Right )
	Gamertag:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 330, _1080p * -100, _1080p * -24, _1080p * -8 )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DropShadow:RegisterAnimationSequence( "ShowTabs", {
			{
				function ()
					return self.DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4, 0 )
				end
			}
		} )
		HeaderBackground:RegisterAnimationSequence( "ShowTabs", {
			{
				function ()
					return self.HeaderBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 113, 0 )
				end
			}
		} )
		Notify:RegisterAnimationSequence( "ShowTabs", {
			{
				function ()
					return self.Notify:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -700, _1080p * -349, 0, 0, 0 )
				end
			}
		} )
		HeaderText:RegisterAnimationSequence( "ShowTabs", {
			{
				function ()
					return self.HeaderText:setText( ToUpperCase( Engine.Localize( "MPUI_ACTIVE_MISSION_CHOOSE" ) ), 0 )
				end
			}
		} )
		if CONDITIONS.IsGamepadEnabled( self ) then
			f17_local8:RegisterAnimationSequence( "ShowTabs", {
				{
					function ()
						return self.L1Button:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsGamepadEnabled( self ) then
			f17_local9:RegisterAnimationSequence( "ShowTabs", {
				{
					function ()
						return self.R1Button:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if not CONDITIONS.IsGamepadEnabled( self ) then
			f17_local10:RegisterAnimationSequence( "ShowTabs", {
				{
					function ()
						return self.ArrowRightClick:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if not CONDITIONS.IsGamepadEnabled( self ) then
			f17_local11:RegisterAnimationSequence( "ShowTabs", {
				{
					function ()
						return self.ArrowLeftClick:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		Pips:RegisterAnimationSequence( "ShowTabs", {
			{
				function ()
					return self.Pips:SetAlpha( 1, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "ShowTabs", {
			{
				function ()
					return self.Border:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end
			}
		} )
		self._sequences.ShowTabs = function ()
			DropShadow:AnimateSequence( "ShowTabs" )
			HeaderBackground:AnimateSequence( "ShowTabs" )
			Notify:AnimateSequence( "ShowTabs" )
			HeaderText:AnimateSequence( "ShowTabs" )
			if CONDITIONS.IsGamepadEnabled( self ) then
				f17_local8:AnimateSequence( "ShowTabs" )
			end
			if CONDITIONS.IsGamepadEnabled( self ) then
				f17_local9:AnimateSequence( "ShowTabs" )
			end
			if not CONDITIONS.IsGamepadEnabled( self ) then
				f17_local10:AnimateSequence( "ShowTabs" )
			end
			if not CONDITIONS.IsGamepadEnabled( self ) then
				f17_local11:AnimateSequence( "ShowTabs" )
			end
			Pips:AnimateSequence( "ShowTabs" )
			Border:AnimateSequence( "ShowTabs" )
		end
		
		Notify:RegisterAnimationSequence( "HideTabs", {
			{
				function ()
					return self.Notify:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -700, 0, 0, 0, 0 )
				end
			}
		} )
		HeaderText:RegisterAnimationSequence( "HideTabs", {
			{
				function ()
					return self.HeaderText:setText( ToUpperCase( Engine.Localize( "MPUI_ACTIVE_MISSION" ) ), 0 )
				end
			}
		} )
		if CONDITIONS.IsGamepadEnabled( self ) then
			f17_local8:RegisterAnimationSequence( "HideTabs", {
				{
					function ()
						return self.L1Button:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsGamepadEnabled( self ) then
			f17_local9:RegisterAnimationSequence( "HideTabs", {
				{
					function ()
						return self.R1Button:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if not CONDITIONS.IsGamepadEnabled( self ) then
			f17_local10:RegisterAnimationSequence( "HideTabs", {
				{
					function ()
						return self.ArrowRightClick:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if not CONDITIONS.IsGamepadEnabled( self ) then
			f17_local11:RegisterAnimationSequence( "HideTabs", {
				{
					function ()
						return self.ArrowLeftClick:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		Pips:RegisterAnimationSequence( "HideTabs", {
			{
				function ()
					return self.Pips:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideTabs = function ()
			Notify:AnimateSequence( "HideTabs" )
			HeaderText:AnimateSequence( "HideTabs" )
			if CONDITIONS.IsGamepadEnabled( self ) then
				f17_local8:AnimateSequence( "HideTabs" )
			end
			if CONDITIONS.IsGamepadEnabled( self ) then
				f17_local9:AnimateSequence( "HideTabs" )
			end
			if not CONDITIONS.IsGamepadEnabled( self ) then
				f17_local10:AnimateSequence( "HideTabs" )
			end
			if not CONDITIONS.IsGamepadEnabled( self ) then
				f17_local11:AnimateSequence( "HideTabs" )
			end
			Pips:AnimateSequence( "HideTabs" )
		end
		
		Notify:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.Notify:SetBlendMode( BLEND_MODE.addWithAlpha )
				end
			},
			{
				function ()
					return self.Notify:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Notify:SetAlpha( 0.4, 150, LUI.EASING.inBack )
				end,
				function ()
					return self.Notify:SetAlpha( 0, 600, LUI.EASING.outSine )
				end
			},
			{
				function ()
					return self.Notify:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -700, _1080p * -350, 0, 0, 0 )
				end,
				function ()
					return self.Notify:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -700, _1080p * -156, 0, 0, 150, LUI.EASING.inBack )
				end,
				function ()
					return self.Notify:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -700, _1080p * -350, 0, 0, 599, LUI.EASING.outSine )
				end
			}
		} )
		self._sequences.Update = function ()
			Notify:AnimateSequence( "Update" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f17_local1, controller )
	return self
end

MenuBuilder.registerType( "MissionInfoTabs", MissionInfoTabs )
LUI.FlowManager.RegisterStackPopBehaviour( "MissionInfoTabs", f0_local1 )
LockTable( _M )
