local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "options.buttonLayout"
f0_local1 = SWATCHES.layouts.oldLayout
f0_local2 = SWATCHES.layouts.newLayout
local f0_local3 = function ()
	WipeControllerModelsAtPath( f0_local0 )
end

local f0_local4 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.IsSingleplayer()
	local f2_local1 = f2_arg0.name
	local f2_local2
	if f2_local0 then
		f2_local2 = f2_arg0.leftTriggerSP
		if not f2_local2 then
		
		else
			local f2_local3
			if f2_local0 then
				f2_local3 = f2_arg0.leftShoulderSP
				if not f2_local3 then
				
				else
					local f2_local4
					if f2_local0 then
						f2_local4 = f2_arg0.rightTriggerSP
						if not f2_local4 then
						
						else
							local f2_local5
							if f2_local0 then
								f2_local5 = f2_arg0.rightShoulderSP
								if not f2_local5 then
								
								else
									local f2_local6 = f2_arg0.cfg
									if f2_arg1 then
										local f2_local7 = f2_local2
										f2_local2 = f2_local3
										f2_local3 = f2_local7
										f2_local7 = f2_local4
										f2_local4 = f2_local5
										f2_local5 = f2_local7
										f2_local1 = f2_local1 .. "_alt"
										f2_local6 = f2_local6 .. "_alt"
									end
									return {
										cfg = f2_local6,
										layoutName = f2_local1,
										leftTrigger = f2_local2,
										leftShoulder = f2_local3,
										rightTrigger = f2_local4,
										rightShoulder = f2_local5
									}
								end
							end
							f2_local5 = f2_arg0.rightShoulder
						end
					end
					f2_local4 = f2_arg0.rightTrigger
				end
			end
			f2_local3 = f2_arg0.leftShoulder
		end
	end
	f2_local2 = f2_arg0.leftTrigger
end

local f0_local5 = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = f3_arg0.ButtonLayouts:GetGridDataSource()
	local f3_local1 = f3_local0:GetCountValue( f3_arg1 ) - 1
	for f3_local2 = 0, f3_local1, 1 do
		local f3_local5 = CSV.ReadRow( CSV.buttonLayouts, f3_local2 )
		local f3_local6 = f3_local0:GetDataSourceAtIndex( f3_local2 )
		local f3_local7 = f0_local4( f3_local5, f3_arg2 )
		f3_local6.ref:SetValue( f3_arg1, f3_local7.cfg )
		f3_local6.name:SetValue( f3_arg1, Engine.Localize( f3_local7.layoutName ) )
		f3_local6.leftTrigger:SetValue( f3_arg1, Engine.Localize( f3_local7.leftTrigger ) )
		f3_local6.rightTrigger:SetValue( f3_arg1, Engine.Localize( f3_local7.rightTrigger ) )
		f3_local6.leftShoulder:SetValue( f3_arg1, Engine.Localize( f3_local7.leftShoulder ) )
		f3_local6.rightShoulder:SetValue( f3_arg1, Engine.Localize( f3_local7.rightShoulder ) )
	end
end

local f0_local6 = function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = Engine.GetProfileData( "gpadSticksConfig", f4_arg1 )
	local f4_local1 = Engine.GetProfileData( "gpadButtonsConfig" )
	local f4_local2 = Engine.TableLookup( CSV.stickLayouts.file, CSV.stickLayouts.cols.cfg, f4_local0, CSV.stickLayouts.cols.swapStickButtons ) == "1"
	local f4_local3 = string.match( f4_local1, "_alt$" ) ~= nil
	assert( f4_arg0.bindButton )
	if not Engine.InFrontend() then
		f4_arg0:addEventHandler( "menu_create", function ()
			f4_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_DISMISS_MENU" ),
				button_ref = "button_start",
				side = "left",
				priority = 20,
				clickable = true
			} )
		end )
		f4_arg0.bindButton:addEventHandler( "button_start", function ( f6_arg0, f6_arg1 )
			if Engine.IsSingleplayer() then
				ACTIONS.ResumeGame( f6_arg0 )
			end
			LUI.FlowManager.RequestCloseAllMenus()
			return true
		end )
	end
	assert( f4_arg0.ButtonLayouts )
	local f4_local4 = LUI.DataSourceFromList.new( Engine.TableGetRowCount( CSV.buttonLayouts.file ) )
	f4_local4.MakeDataSourceAtIndex = function ( f7_arg0, f7_arg1, f7_arg2 )
		local f7_local0 = CSV.ReadRow( CSV.buttonLayouts, f7_arg1 )
		local f7_local1 = CSV.ReadRow( CSV.buttonLayouts, 0 )
		local f7_local2 = f0_local0 .. "." .. f7_arg1
		local f7_local3 = Engine.IsSingleplayer()
		local f7_local4 = Engine.IsAliensMode()
		local f7_local5 = f7_local0.select
		if f7_local3 then
			f7_local5 = f7_local0.selectSP
		elseif f7_local4 then
			f7_local5 = f7_local0.selectCP
		end
		local f7_local6 = f7_local0.leftStick
		local f7_local7 = f7_local0.rightStick
		if f4_local2 then
			f7_local6 = f7_local0.rightStick
			f7_local7 = f7_local0.leftStick
		end
		local f7_local8 = f0_local4( f7_local0, f4_local3 )
		local f7_local9 = GetIntForColor( f0_local1 )
		local f7_local10 = GetIntForColor( f0_local2 )
		local f7_local11 = function ( f8_arg0 )
			return function ()
				local f9_local0 = f0_local4( f7_local0, f4_local3 )
				if f7_local1[f8_arg0] == f9_local0[f8_arg0] then
					return f7_local9
				else
					return f7_local10
				end
			end
			
		end
		
		local f7_local12 = LUI.DataSourceInControllerModel.new( f7_local2 .. ".leftTrigger", Engine.Localize( f7_local8.leftTrigger ) )
		local f7_local13 = LUI.DataSourceInControllerModel.new( f7_local2 .. ".leftShoulder", Engine.Localize( f7_local8.leftShoulder ) )
		local f7_local14 = LUI.DataSourceInControllerModel.new( f7_local2 .. ".rightTrigger", Engine.Localize( f7_local8.rightTrigger ) )
		local f7_local15 = LUI.DataSourceInControllerModel.new( f7_local2 .. ".rightShoulder", Engine.Localize( f7_local8.rightShoulder ) )
		local f7_local16 = {
			ref = LUI.DataSourceInControllerModel.new( f7_local2 .. ".ref", f7_local8.cfg ),
			name = LUI.DataSourceInControllerModel.new( f7_local2 .. ".name", Engine.Localize( f7_local8.layoutName ) ),
			leftStick = LUI.DataSourceInControllerModel.new( f7_local2 .. ".leftStick", Engine.Localize( f7_local6 ) )
		}
		local f7_local17 = LUI.DataSourceInControllerModel.new
		local f7_local18 = f7_local2 .. ".leftStickColor"
		if f7_local1.leftStick == f7_local0.leftStick then
			local f7_local19 = f7_local9
		end
		f7_local16.leftStickColor = f7_local17( f7_local18, f7_local19 or f7_local10 )
		f7_local16.rightStick = LUI.DataSourceInControllerModel.new( f7_local2 .. ".rightStick", Engine.Localize( f7_local7 ) )
		f7_local17 = LUI.DataSourceInControllerModel.new
		f7_local18 = f7_local2 .. ".rightStickColor"
		if f7_local1.rightStick == f7_local0.rightStick then
			local f7_local20 = f7_local9
		end
		f7_local16.rightStickColor = f7_local17( f7_local18, f7_local20 or f7_local10 )
		f7_local16.leftTrigger = f7_local12
		f7_local16.leftTriggerColor = f7_local12:Filter( "leftTriggerColor", f7_local11( "leftTrigger" ) )
		f7_local16.rightTrigger = f7_local14
		f7_local16.rightTriggerColor = f7_local14:Filter( "rightTriggerColor", f7_local11( "rightTrigger" ) )
		f7_local16.leftShoulder = f7_local13
		f7_local16.leftShoulderColor = f7_local13:Filter( "leftShoulderColor", f7_local11( "leftShoulder" ) )
		f7_local16.rightShoulder = f7_local15
		f7_local16.rightShoulderColor = f7_local15:Filter( "rightShoulderColor", f7_local11( "rightShoulder" ) )
		f7_local16.primary = LUI.DataSourceInControllerModel.new( f7_local2 .. ".primary", Engine.Localize( f7_local0.primary ) )
		f7_local17 = LUI.DataSourceInControllerModel.new
		f7_local18 = f7_local2 .. ".primaryColor"
		if f7_local1.primary == f7_local0.primary then
			local f7_local21 = f7_local9
		end
		f7_local16.primaryColor = f7_local17( f7_local18, f7_local21 or f7_local10 )
		f7_local16.secondary = LUI.DataSourceInControllerModel.new( f7_local2 .. ".secondary", Engine.Localize( f7_local0.secondary ) )
		f7_local17 = LUI.DataSourceInControllerModel.new
		f7_local18 = f7_local2 .. ".secondaryColor"
		if f7_local1.secondary == f7_local0.secondary then
			local f7_local22 = f7_local9
		end
		f7_local16.secondaryColor = f7_local17( f7_local18, f7_local22 or f7_local10 )
		f7_local16.altOne = LUI.DataSourceInControllerModel.new( f7_local2 .. ".altOne", Engine.Localize( f7_local0.altOne ) )
		f7_local17 = LUI.DataSourceInControllerModel.new
		f7_local18 = f7_local2 .. ".altOneColor"
		if f7_local1.altOne == f7_local0.altOne then
			local f7_local23 = f7_local9
		end
		f7_local16.altOneColor = f7_local17( f7_local18, f7_local23 or f7_local10 )
		f7_local16.altTwo = LUI.DataSourceInControllerModel.new( f7_local2 .. ".altTwo", Engine.Localize( f7_local0.altTwo ) )
		f7_local17 = LUI.DataSourceInControllerModel.new
		f7_local18 = f7_local2 .. ".altTwoColor"
		if f7_local1.altTwo == f7_local0.altTwo then
			local f7_local24 = f7_local9
		end
		f7_local16.altTwoColor = f7_local17( f7_local18, f7_local24 or f7_local10 )
		f7_local16.dPad = LUI.DataSourceInControllerModel.new( f7_local2 .. ".dPad", Engine.Localize( f7_local0.dPad ) )
		f7_local17 = LUI.DataSourceInControllerModel.new
		f7_local18 = f7_local2 .. ".dPadColor"
		if f7_local1.dPad == f7_local0.dPad then
			local f7_local25 = f7_local9
		end
		f7_local16.dPadColor = f7_local17( f7_local18, f7_local25 or f7_local10 )
		f7_local17 = LUI.DataSourceInControllerModel.new
		f7_local18 = f7_local2 .. ".start"
		local f7_local26
		if f7_local4 then
			f7_local26 = Engine.Localize( f7_local0.startCP )
			if not f7_local26 then
			
			else
				f7_local16.start = f7_local17( f7_local18, f7_local26 )
				f7_local17 = LUI.DataSourceInControllerModel.new
				f7_local18 = f7_local2 .. ".startColor"
				if f7_local1.start == f7_local0.start then
					local f7_local27 = f7_local9
				end
				f7_local16.startColor = f7_local17( f7_local18, f7_local27 or f7_local10 )
				f7_local16.select = LUI.DataSourceInControllerModel.new( f7_local2 .. ".select", Engine.Localize( f7_local5 ) )
				f7_local17 = LUI.DataSourceInControllerModel.new
				f7_local18 = f7_local2 .. ".selectColor"
				if f7_local1.select == f7_local0.select then
					local f7_local28 = f7_local9
				end
				f7_local16.selectColor = f7_local17( f7_local18, f7_local28 or f7_local10 )
				return f7_local16
			end
		end
		f7_local26 = Engine.Localize( f7_local0.start )
	end
	
	f4_local4.GetDefaultFocusIndex = function ()
		for f10_local0 = 0, f4_local4:GetCountValue( f4_arg1 ), 1 do
			local f10_local3 = f4_local4:GetDataSourceAtIndex( f10_local0 )
			f10_local3 = f10_local3.ref:GetValue( f4_arg1 )
			if f4_local1 == f10_local3 or f4_local1 == f10_local3 .. "_alt" then
				return f10_local0
			end
		end
	end
	
	f4_arg0.ButtonLayouts:SetGridDataSource( f4_local4, f4_arg1 )
	if Engine.IsPS4() then
		assert( f4_arg0.PS4Layout )
		assert( f4_arg0.PS4VitaLayout )
		if Engine.IsGamepadVita( f4_arg1 ) then
			f4_arg0:removeElement( f4_arg0.PS4Layout )
			f4_arg0.controlLayout = f4_arg0.PS4VitaLayout
		else
			f4_arg0:removeElement( f4_arg0.PS4VitaLayout )
			f4_arg0.controlLayout = f4_arg0.PS4Layout
		end
	elseif Engine.IsXB3() then
		assert( f4_arg0.XB3Layout )
		f4_arg0.controlLayout = f4_arg0.XB3Layout
	elseif not Engine.IsConsoleGame() then
		assert( f4_arg0.PCLayout )
		f4_arg0.controlLayout = f4_arg0.PCLayout
	end
	if f4_arg0.controlLayout then
		f4_arg0.controlLayout:SetDataSourceThroughElement( f4_arg0.ButtonLayouts, nil )
	end
	f4_arg0.bindButton:addEventHandler( "button_alt1", function ( f11_arg0, f11_arg1 )
		if f4_local3 then
			f4_local3 = false
		else
			f4_local3 = true
		end
		f0_local5( f4_arg0, f4_arg1, f4_local3 )
		Engine.PlaySound( CoD.SFX.MouseClick )
	end )
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f4_arg0:addElement( self )
end

function ButtonLayout( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "ButtonLayout"
	self._animationSets = {}
	self._sequences = {}
	local f12_local1 = controller and controller.controllerIndex
	if not f12_local1 and not Engine.InFrontend() then
		f12_local1 = self:getRootController()
	end
	assert( f12_local1 )
	self:playSound( "menu_open" )
	local f12_local2 = self
	local f12_local3 = nil
	if not Engine.InFrontend() then
		f12_local3 = LUI.UIImage.new()
		f12_local3.id = "Background"
		f12_local3:SetRGBFromInt( 0, 0 )
		f12_local3:SetAlpha( 0.5, 0 )
		self:addElement( f12_local3 )
		self.Background = f12_local3
	end
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f12_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "MENU_BUTTON_LAYOUT_CAPS" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -10, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 80, 0 )
	MenuTitle.Icon:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 796, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f12_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local f12_local6 = nil
	if not CONDITIONS.IsSingleplayer( self ) then
		f12_local6 = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
			controllerIndex = f12_local1
		} )
		f12_local6.id = "FriendsElement"
		f12_local6:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
		f12_local6:SetAlignment( LUI.Alignment.Left )
		f12_local6:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1401.97, _1080p * 1901.97, _1080p * -57, _1080p * -12 )
		self:addElement( f12_local6 )
		self.FriendsElement = f12_local6
	end
	local ButtonLayouts = nil
	
	ButtonLayouts = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = SubtractForSplitscreen( 13, 6 ),
		controllerIndex = f12_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ButtonLayoutButton", {
				controllerIndex = f12_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 530,
		rowHeight = _1080p * 30,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	ButtonLayouts.id = "ButtonLayouts"
	ButtonLayouts:setUseStencil( false )
	ButtonLayouts:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 152.21, _1080p * 682.21, _1080p * 222.94, _1080p * 732.94 )
	self:addElement( ButtonLayouts )
	self.ButtonLayouts = ButtonLayouts
	
	local f12_local8 = nil
	if Engine.IsPS4() then
		f12_local8 = MenuBuilder.BuildRegisteredType( "PS4VitaLayout", {
			controllerIndex = f12_local1
		} )
		f12_local8.id = "PS4VitaLayout"
		f12_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 937, _1080p * 1449, _1080p * 247, _1080p * 759 )
		self:addElement( f12_local8 )
		self.PS4VitaLayout = f12_local8
	end
	local HelperText = nil
	
	HelperText = LUI.UIStyledText.new()
	HelperText.id = "HelperText"
	HelperText:setText( ToUpperCase( Engine.Localize( "MENU_COLOR_INDICATOR_DESC" ) ), 0 )
	HelperText:SetFontSize( 19 * _1080p )
	HelperText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	HelperText:SetAlignment( LUI.Alignment.Left )
	HelperText:SetOptOutRightToLeftAlignmentFlip( true )
	HelperText:SetShadowMinDistance( -0.8, 0 )
	HelperText:SetShadowMaxDistance( 0.8, 0 )
	HelperText:SetShadowRGBFromInt( 0, 0 )
	HelperText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 152.21, _1080p * 585.21, _1080p * 781, _1080p * 800 )
	self:addElement( HelperText )
	self.HelperText = HelperText
	
	local f12_local10 = nil
	if Engine.IsPS4() then
		f12_local10 = MenuBuilder.BuildRegisteredType( "PS4Layout", {
			controllerIndex = f12_local1
		} )
		f12_local10.id = "PS4Layout"
		f12_local10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 937, _1080p * 1449, _1080p * 236, _1080p * 748 )
		self:addElement( f12_local10 )
		self.PS4Layout = f12_local10
	end
	local f12_local11 = nil
	if Engine.IsXB3() then
		f12_local11 = MenuBuilder.BuildRegisteredType( "XB3Layout", {
			controllerIndex = f12_local1
		} )
		f12_local11.id = "XB3Layout"
		f12_local11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 937.32, _1080p * 1449.32, _1080p * 236.1, _1080p * 748.1 )
		self:addElement( f12_local11 )
		self.XB3Layout = f12_local11
	end
	local f12_local12 = nil
	if not Engine.IsConsoleGame() then
		f12_local12 = MenuBuilder.BuildRegisteredType( "XB3Layout", {
			controllerIndex = f12_local1
		} )
		f12_local12.id = "PCLayout"
		f12_local12:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 937.32, _1080p * 1449.32, _1080p * 236.1, _1080p * 748.1 )
		self:addElement( f12_local12 )
		self.PCLayout = f12_local12
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if Engine.IsPS4() then
			f12_local8:RegisterAnimationSequence( "Splitscreen", {
				{
					function ()
						return self.PS4VitaLayout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 944, _1080p * 1456, _1080p * 96.5, _1080p * 608.5, 0 )
					end
				}
			} )
		end
		HelperText:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.HelperText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 152.21, _1080p * 585.21, _1080p * 510, _1080p * 529, 0 )
				end
			}
		} )
		if Engine.IsPS4() then
			f12_local10:RegisterAnimationSequence( "Splitscreen", {
				{
					function ()
						return self.PS4Layout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 944, _1080p * 1456, _1080p * 85.5, _1080p * 597.5, 0 )
					end
				}
			} )
		end
		if Engine.IsXB3() then
			f12_local11:RegisterAnimationSequence( "Splitscreen", {
				{
					function ()
						return self.XB3Layout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 944.32, _1080p * 1456.32, _1080p * 85.6, _1080p * 597.6, 0 )
					end
				}
			} )
		end
		if not Engine.IsConsoleGame() then
			f12_local12:RegisterAnimationSequence( "Splitscreen", {
				{
					function ()
						return self.PCLayout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 944.32, _1080p * 1456.32, _1080p * 85.6, _1080p * 597.6, 0 )
					end
				}
			} )
		end
		self._sequences.Splitscreen = function ()
			if Engine.IsPS4() then
				f12_local8:AnimateSequence( "Splitscreen" )
			end
			HelperText:AnimateSequence( "Splitscreen" )
			if Engine.IsPS4() then
				f12_local10:AnimateSequence( "Splitscreen" )
			end
			if Engine.IsXB3() then
				f12_local11:AnimateSequence( "Splitscreen" )
			end
			if not Engine.IsConsoleGame() then
				f12_local12:AnimateSequence( "Splitscreen" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f22_arg0, f22_arg1 )
		f22_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f22_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f22_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_TOGGLE_FLIP" ),
			button_ref = "button_alt1",
			side = "left",
			priority = 2,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f23_arg0, f23_arg1 )
		local f23_local0 = f23_arg1.controller or f12_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local6( self, f12_local1, controller )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "ButtonLayout", ButtonLayout )
LUI.FlowManager.RegisterStackPopBehaviour( "ButtonLayout", f0_local3 )
LockTable( _M )
