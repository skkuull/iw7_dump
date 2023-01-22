local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.RecruitPlayerButton )
	assert( f1_arg0.VeteranPlayerButton )
	if f1_arg2.rookieAction then
		f1_arg0.RecruitPlayerButton:addEventHandler( "button_action", f1_arg2.rookieAction )
	end
	if f1_arg2.veteranAction then
		f1_arg0.VeteranPlayerButton:addEventHandler( "button_action", f1_arg2.veteranAction )
	end
end

function MPTutorialLevelSelectionPopup( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, -215.5 * _1080p, 215.5 * _1080p, -126.5 * _1080p, 126.5 * _1080p )
	self.id = "MPTutorialLevelSelectionPopup"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	self:playSound( "menu_open" )
	local f2_local2 = self
	local GenericPopup = nil
	
	GenericPopup = MenuBuilder.BuildRegisteredType( "GenericPopup", {
		controllerIndex = f2_local1
	} )
	GenericPopup.id = "GenericPopup"
	GenericPopup:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -150, _1080p * 150 )
	self:addElement( GenericPopup )
	self.GenericPopup = GenericPopup
	
	local PointsFull = nil
	
	PointsFull = LUI.UIText.new()
	PointsFull.id = "PointsFull"
	PointsFull:setText( "Choose your level", 0 )
	PointsFull:SetFontSize( 36 * _1080p )
	PointsFull:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PointsFull:SetAlignment( LUI.Alignment.Left )
	PointsFull:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -183.5, _1080p * 183.5, _1080p * -80, _1080p * -44 )
	self:addElement( PointsFull )
	self.PointsFull = PointsFull
	
	local RecruitPlayerButton = nil
	
	RecruitPlayerButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f2_local1
	} )
	RecruitPlayerButton.id = "RecruitPlayerButton"
	RecruitPlayerButton.Text:setText( "Recruit", 0 )
	RecruitPlayerButton:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * -35.5, _1080p * -20.25, _1080p * 106.25 )
	self:addElement( RecruitPlayerButton )
	self.RecruitPlayerButton = RecruitPlayerButton
	
	local VeteranPlayerButton = nil
	
	VeteranPlayerButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f2_local1
	} )
	VeteranPlayerButton.id = "VeteranPlayerButton"
	VeteranPlayerButton.Text:setText( "Veteran", 0 )
	VeteranPlayerButton:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 40.5, _1080p * 215.5, _1080p * -20.25, _1080p * 106.25 )
	self:addElement( VeteranPlayerButton )
	self.VeteranPlayerButton = VeteranPlayerButton
	
	RecruitPlayerButton:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	VeteranPlayerButton:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	self.addButtonHelperFunction = function ( f5_arg0, f5_arg1 )
		f5_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f6_arg0, f6_arg1 )
		local f6_local0 = f6_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "MPTutorialLevelSelectionPopup", MPTutorialLevelSelectionPopup )
LockTable( _M )
