local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "options.stickLayout"
f0_local1 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local2 = function ( f2_arg0, f2_arg1, f2_arg2 )
	if not Engine.InFrontend() then
		f2_arg0:addEventHandler( "menu_create", function ()
			f2_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_DISMISS_MENU" ),
				button_ref = "button_start",
				side = "left",
				priority = 20,
				clickable = true
			} )
		end )
		f2_arg0.bindButton:addEventHandler( "button_start", function ( f4_arg0, f4_arg1 )
			if Engine.IsSingleplayer() then
				ACTIONS.ResumeGame( f4_arg0 )
			end
			LUI.FlowManager.RequestCloseAllMenus()
			return true
		end )
	end
	assert( f2_arg0.StickLayouts )
	local f2_local0 = LUI.DataSourceFromList.new( Engine.TableGetRowCount( CSV.stickLayouts.file ) )
	local f2_local1 = CSV.ReadRow( CSV.stickLayouts, 0 )
	local f2_local2 = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".oldColor", GetIntForColor( SWATCHES.layouts.oldLayout ) )
	local f2_local3 = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".newColor", GetIntForColor( SWATCHES.layouts.newLayout ) )
	local f2_local4 = function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg0[f5_arg1]
		local f5_local1 = f2_local1[f5_arg1]
		return REG4 and f2_local2 or f2_local3
	end
	
	f2_local0.MakeDataSourceAtIndex = function ( f6_arg0, f6_arg1, f6_arg2 )
		local f6_local0 = CSV.ReadRow( CSV.stickLayouts, f6_arg1 )
		local f6_local1 = f0_local0 .. "." .. f6_arg1
		return {
			ref = LUI.DataSourceInGlobalModel.new( f6_local1 .. ".ref", f6_local0.cfg ),
			name = LUI.DataSourceInGlobalModel.new( f6_local1 .. ".name", Engine.Localize( f6_local0.name ) ),
			left = {
				up = LUI.DataSourceInGlobalModel.new( f6_local1 .. ".left.up", Engine.Localize( f6_local0.leftUp ) ),
				upColor = f2_local4( f6_local0, "leftUp" ),
				down = LUI.DataSourceInGlobalModel.new( f6_local1 .. ".left.down", Engine.Localize( f6_local0.leftDown ) ),
				downColor = f2_local4( f6_local0, "leftDown" ),
				left = LUI.DataSourceInGlobalModel.new( f6_local1 .. ".left.left", Engine.Localize( f6_local0.leftLeft ) ),
				leftColor = f2_local4( f6_local0, "leftLeft" ),
				right = LUI.DataSourceInGlobalModel.new( f6_local1 .. ".left.right", Engine.Localize( f6_local0.leftRight ) ),
				rightColor = f2_local4( f6_local0, "leftRight" ),
				button = LUI.DataSourceInGlobalModel.new( f6_local1 .. ".left.button", Engine.Localize( f6_local0.leftButton ) ),
				buttonColor = f2_local4( f6_local0, "leftButton" )
			},
			right = {
				up = LUI.DataSourceInGlobalModel.new( f6_local1 .. ".right.up", Engine.Localize( f6_local0.rightUp ) ),
				upColor = f2_local4( f6_local0, "rightUp" ),
				down = LUI.DataSourceInGlobalModel.new( f6_local1 .. ".right.down", Engine.Localize( f6_local0.rightDown ) ),
				downColor = f2_local4( f6_local0, "rightDown" ),
				left = LUI.DataSourceInGlobalModel.new( f6_local1 .. ".right.left", Engine.Localize( f6_local0.rightLeft ) ),
				leftColor = f2_local4( f6_local0, "rightLeft" ),
				right = LUI.DataSourceInGlobalModel.new( f6_local1 .. ".right.right", Engine.Localize( f6_local0.rightRight ) ),
				rightColor = f2_local4( f6_local0, "rightRight" ),
				button = LUI.DataSourceInGlobalModel.new( f6_local1 .. ".right.button", Engine.Localize( f6_local0.rightButton ) ),
				buttonColor = f2_local4( f6_local0, "rightButton" )
			}
		}
	end
	
	f2_local0.GetDefaultFocusIndex = function ()
		local f7_local0 = Engine.GetProfileData( "gpadSticksConfig" )
		for f7_local1 = 0, f2_local0:GetCountValue( f2_arg1 ), 1 do
			local f7_local4 = f2_local0:GetDataSourceAtIndex( f7_local1 )
			if f7_local0 == f7_local4.ref:GetValue( f2_arg1 ) then
				return f7_local1
			end
		end
	end
	
	f2_arg0.StickLayouts:SetGridDataSource( f2_local0, f2_arg1 )
	if Engine.IsPS4() then
		assert( f2_arg0.PS4Layout )
		assert( f2_arg0.PS4VitaLayout )
		if Engine.IsGamepadVita( f2_arg1 ) then
			f2_arg0:removeElement( f2_arg0.PS4Layout )
			f2_arg0.PS4VitaLayout:SetDataSourceThroughElement( f2_arg0.StickLayouts, nil )
		else
			f2_arg0:removeElement( f2_arg0.PS4VitaLayout )
			f2_arg0.PS4Layout:SetDataSourceThroughElement( f2_arg0.StickLayouts, nil )
		end
	elseif Engine.IsXB3() then
		assert( f2_arg0.XB3Layout )
		f2_arg0.XB3Layout:SetDataSourceThroughElement( f2_arg0.StickLayouts, nil )
	elseif not Engine.IsConsoleGame() then
		assert( f2_arg0.PCLayout )
		f2_arg0.PCLayout:SetDataSourceThroughElement( f2_arg0.StickLayouts, nil )
	end
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f2_arg0:addElement( self )
end

function StickLayout( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "StickLayout"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	self:playSound( "menu_open" )
	local f8_local2 = self
	local f8_local3 = nil
	if not Engine.InFrontend() then
		f8_local3 = LUI.UIImage.new()
		f8_local3.id = "Background"
		f8_local3:SetRGBFromInt( 0, 0 )
		f8_local3:SetAlpha( 0.5, 0 )
		self:addElement( f8_local3 )
		self.Background = f8_local3
	end
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f8_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "MENU_THUMBSTICK_LAYOUT_CAPS" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -10, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 80, 0 )
	MenuTitle.Icon:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 796, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f8_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local f8_local6 = nil
	if not CONDITIONS.IsSingleplayer( self ) then
		f8_local6 = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
			controllerIndex = f8_local1
		} )
		f8_local6.id = "FriendsElement"
		f8_local6:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
		f8_local6:SetAlignment( LUI.Alignment.Left )
		f8_local6:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1401.97, _1080p * 1901.97, _1080p * -57, _1080p * -12 )
		self:addElement( f8_local6 )
		self.FriendsElement = f8_local6
	end
	local StickLayouts = nil
	
	StickLayouts = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 7,
		controllerIndex = f8_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "StickLayoutButton", {
				controllerIndex = f8_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 30,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	StickLayouts.id = "StickLayouts"
	StickLayouts:setUseStencil( false )
	StickLayouts:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 152.21, _1080p * 652.21, _1080p * 222.94, _1080p * 492.94 )
	self:addElement( StickLayouts )
	self.StickLayouts = StickLayouts
	
	local f8_local8 = nil
	if Engine.IsPS4() then
		f8_local8 = MenuBuilder.BuildRegisteredType( "PS4VitaStickLayout", {
			controllerIndex = f8_local1
		} )
		f8_local8.id = "PS4VitaLayout"
		f8_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 937, _1080p * 1449, _1080p * 236, _1080p * 748 )
		self:addElement( f8_local8 )
		self.PS4VitaLayout = f8_local8
	end
	local f8_local9 = nil
	if Engine.IsPS4() then
		f8_local9 = MenuBuilder.BuildRegisteredType( "PS4StickLayout", {
			controllerIndex = f8_local1
		} )
		f8_local9.id = "PS4Layout"
		f8_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 937, _1080p * 1449, _1080p * 236, _1080p * 748 )
		self:addElement( f8_local9 )
		self.PS4Layout = f8_local9
	end
	local f8_local10 = nil
	if Engine.IsXB3() then
		f8_local10 = MenuBuilder.BuildRegisteredType( "XB3StickLayout", {
			controllerIndex = f8_local1
		} )
		f8_local10.id = "XB3Layout"
		f8_local10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 960, _1080p * 1472, _1080p * 261.94, _1080p * 773.94 )
		self:addElement( f8_local10 )
		self.XB3Layout = f8_local10
	end
	local f8_local11 = nil
	if not Engine.IsConsoleGame() then
		f8_local11 = MenuBuilder.BuildRegisteredType( "XB3StickLayout", {
			controllerIndex = f8_local1
		} )
		f8_local11.id = "PCLayout"
		f8_local11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 960, _1080p * 1472, _1080p * 261.94, _1080p * 773.94 )
		self:addElement( f8_local11 )
		self.PCLayout = f8_local11
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
	HelperText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 152.21, _1080p * 652.21, _1080p * 498.94, _1080p * 517.94 )
	self:addElement( HelperText )
	self.HelperText = HelperText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if Engine.IsPS4() then
			f8_local8:RegisterAnimationSequence( "Splitscreen", {
				{
					function ()
						return self.PS4VitaLayout:SetScale( -0.2, 0 )
					end
				},
				{
					function ()
						return self.PS4VitaLayout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 999, _1080p * 1511, _1080p * 2.06, _1080p * 514.06, 0 )
					end
				}
			} )
		end
		if Engine.IsPS4() then
			f8_local9:RegisterAnimationSequence( "Splitscreen", {
				{
					function ()
						return self.PS4Layout:SetScale( -0.2, 0 )
					end
				},
				{
					function ()
						return self.PS4Layout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 999, _1080p * 1511, _1080p * 2.06, _1080p * 514.06, 0 )
					end
				}
			} )
		end
		if Engine.IsXB3() then
			f8_local10:RegisterAnimationSequence( "Splitscreen", {
				{
					function ()
						return self.XB3Layout:SetScale( -0.2, 0 )
					end
				},
				{
					function ()
						return self.XB3Layout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1022, _1080p * 1534, _1080p * 28, _1080p * 540, 0 )
					end
				}
			} )
		end
		if not Engine.IsConsoleGame() then
			f8_local11:RegisterAnimationSequence( "Splitscreen", {
				{
					function ()
						return self.PCLayout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1022, _1080p * 1534, _1080p * 28, _1080p * 540, 0 )
					end
				}
			} )
		end
		HelperText:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.HelperText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 152.21, _1080p * 652.21, _1080p * 500, _1080p * 519, 0 )
				end
			}
		} )
		self._sequences.Splitscreen = function ()
			if Engine.IsPS4() then
				f8_local8:AnimateSequence( "Splitscreen" )
			end
			if Engine.IsPS4() then
				f8_local9:AnimateSequence( "Splitscreen" )
			end
			if Engine.IsXB3() then
				f8_local10:AnimateSequence( "Splitscreen" )
			end
			if not Engine.IsConsoleGame() then
				f8_local11:AnimateSequence( "Splitscreen" )
			end
			HelperText:AnimateSequence( "Splitscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f21_arg0, f21_arg1 )
		f21_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f21_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f22_arg0, f22_arg1 )
		local f22_local0 = f22_arg1.controller or f8_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local2( self, f8_local1, controller )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "StickLayout", StickLayout )
LUI.FlowManager.RegisterStackPopBehaviour( "StickLayout", f0_local1 )
LockTable( _M )
