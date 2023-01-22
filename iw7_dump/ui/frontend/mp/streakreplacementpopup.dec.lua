local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetDataSource( f1_arg2.streakToEquipButton:GetDataSource(), f1_arg1 )
	local f1_local0 = {
		f1_arg0.StreakReplaceButton1,
		f1_arg0.StreakReplaceButton2,
		f1_arg0.StreakReplaceButton3
	}
	local f1_local1 = f1_arg2.streakToEquipButton:GetCurrentMenu()
	local f1_local2 = f1_local1.statsGroupDataSource.streaks
	for f1_local6, f1_local7 in pairs( f1_local0 ) do
		f1_local7.index = f1_local6 - 1
		f1_local7.streakToEquipButton = f1_arg2.streakToEquipButton
		f1_local7:SetDataSource( f1_local2:GetDataSourceAtIndex( f1_local6 - 1, f1_arg1 ), f1_arg1 )
		if f1_arg2.onStreakEquippedFunc then
			f1_local7.onStreakEquippedFunc = f1_arg2.onStreakEquippedFunc
		end
	end
end

function StreakReplacementPopup( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "StreakReplacementPopup"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local PopupFrame = nil
	
	PopupFrame = MenuBuilder.BuildRegisteredType( "PopupFrame", {
		controllerIndex = f2_local1
	} )
	PopupFrame.id = "PopupFrame"
	PopupFrame.Darkener:SetAlpha( 0.88, 0 )
	PopupFrame.Title:setText( Engine.Localize( "LUA_MENU_EQUIP" ), 0 )
	PopupFrame:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 672, _1080p * 1250, _1080p * 340, _1080p * 645 )
	self:addElement( PopupFrame )
	self.PopupFrame = PopupFrame
	
	local ReplaceStreakDescription = nil
	
	ReplaceStreakDescription = LUI.UIText.new()
	ReplaceStreakDescription.id = "ReplaceStreakDescription"
	ReplaceStreakDescription:SetFontSize( 24 * _1080p )
	ReplaceStreakDescription:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ReplaceStreakDescription:SetAlignment( LUI.Alignment.Left )
	ReplaceStreakDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 680.9, _1080p * 1239.9, _1080p * 350.54, _1080p * 374.54 )
	ReplaceStreakDescription:SubscribeToModelThroughElement( self, "streak.name", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.streak.name:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			ReplaceStreakDescription:setText( LocalizeIntoString( f3_local0, "LUA_MENU_REPLACE_STREAK_WITH" ), 0 )
		end
	end )
	self:addElement( ReplaceStreakDescription )
	self.ReplaceStreakDescription = ReplaceStreakDescription
	
	local StreakReplaceButton1 = nil
	
	StreakReplaceButton1 = MenuBuilder.BuildRegisteredType( "StreakReplaceButton", {
		controllerIndex = f2_local1
	} )
	StreakReplaceButton1.id = "StreakReplaceButton1"
	StreakReplaceButton1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 702.9, _1080p * 852.9, _1080p * 465, _1080p * 615 )
	self:addElement( StreakReplaceButton1 )
	self.StreakReplaceButton1 = StreakReplaceButton1
	
	local StreakReplaceButton2 = nil
	
	StreakReplaceButton2 = MenuBuilder.BuildRegisteredType( "StreakReplaceButton", {
		controllerIndex = f2_local1
	} )
	StreakReplaceButton2.id = "StreakReplaceButton2"
	StreakReplaceButton2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 885, _1080p * 1035, _1080p * 465, _1080p * 615 )
	self:addElement( StreakReplaceButton2 )
	self.StreakReplaceButton2 = StreakReplaceButton2
	
	local StreakReplaceButton3 = nil
	
	StreakReplaceButton3 = MenuBuilder.BuildRegisteredType( "StreakReplaceButton", {
		controllerIndex = f2_local1
	} )
	StreakReplaceButton3.id = "StreakReplaceButton3"
	StreakReplaceButton3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1067.9, _1080p * 1217.9, _1080p * 465, _1080p * 615 )
	self:addElement( StreakReplaceButton3 )
	self.StreakReplaceButton3 = StreakReplaceButton3
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f2_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar.Background:SetAlpha( 0, 0 )
	ButtonHelperBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 605, _1080p * 1325, _1080p * 661.19, _1080p * 733.19 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	StreakReplaceButton1.navigation = {
		right = StreakReplaceButton2
	}
	StreakReplaceButton2.navigation = {
		left = StreakReplaceButton1,
		right = StreakReplaceButton3
	}
	StreakReplaceButton3.navigation = {
		left = StreakReplaceButton2
	}
	self.addButtonHelperFunction = function ( f4_arg0, f4_arg1 )
		f4_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f4_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_MP_CONFIRM" ),
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "StreakReplacementPopup", StreakReplacementPopup )
LockTable( _M )
