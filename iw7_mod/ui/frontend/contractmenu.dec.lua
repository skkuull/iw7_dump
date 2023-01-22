local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	assert( f1_arg0.ContractLeft )
	assert( f1_arg0.ContractRight )
	local f1_local0 = {
		f1_arg0.ContractLeft,
		f1_arg0.ContractRight
	}
	for f1_local1 = 0, #f1_local0 - 1, 1 do
		Contracts.SetupContract( f1_arg0, f1_local0, f1_local1, f1_arg1 )
	end
	for f1_local1 = 0, 1, 1 do
		if not Contracts.HasSeenContract( f1_arg1, f1_local1 ) then
			Contracts.SetHasSeenContract( f1_arg1, f1_local1, true )
		end
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f0_local0( f2_arg0, f2_arg1 )
	f2_arg0:addEventHandler( "update_contracts", function ( f3_arg0, f3_arg1 )
		f0_local0( f3_arg0, f2_arg1 )
	end )
	if Engine.IsCoreMode() then
		f2_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ) ), 0 )
	end
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f2_arg0:addElement( self )
end

function ContractMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "ContractMenu"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	self:playSound( "menu_open" )
	local f4_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f4_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, _1080p * -4 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local f4_local4 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f4_local4 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f4_local1
		} )
		f4_local4.id = "MenuTitle"
		f4_local4.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_CONTRACTS" ) ), 0 )
		f4_local4.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
		f4_local4.Icon:SetTop( _1080p * -28.5, 0 )
		f4_local4.Icon:SetBottom( _1080p * 61.5, 0 )
		f4_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f4_local4 )
		self.MenuTitle = f4_local4
	end
	local f4_local5 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local5 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f4_local1
		} )
		f4_local5.id = "CPMenuTitle"
		f4_local5.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_BOUNTIES" ) ), 0 )
		f4_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f4_local5 )
		self.CPMenuTitle = f4_local5
	end
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f4_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetGlitchEnabled( true )
	MissionTeamInfo:SetGlitchAmount( 0, 0 )
	MissionTeamInfo:SetGlitchBlockWidth( 50, 0 )
	MissionTeamInfo:SetGlitchBlockHeight( 50, 0 )
	MissionTeamInfo:SetGlitchDistortionRange( 16, 0 )
	MissionTeamInfo:SetGlitchScanlinePitch( 1, 0 )
	MissionTeamInfo:SetGlitchMaskPitch( 1, 0 )
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 141 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local ContractLeft = nil
	
	ContractLeft = MenuBuilder.BuildRegisteredType( "Contract", {
		controllerIndex = f4_local1
	} )
	ContractLeft.id = "ContractLeft"
	ContractLeft:SetDotPitchEnabled( true )
	ContractLeft:SetDotPitchX( 0, 0 )
	ContractLeft:SetDotPitchY( 0, 0 )
	ContractLeft:SetDotPitchContrast( 0, 0 )
	ContractLeft:SetDotPitchMode( 0 )
	ContractLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 220, _1080p * 920, _1080p * 270, _1080p * 890 )
	self:addElement( ContractLeft )
	self.ContractLeft = ContractLeft
	
	local ContractRight = nil
	
	ContractRight = MenuBuilder.BuildRegisteredType( "Contract", {
		controllerIndex = f4_local1
	} )
	ContractRight.id = "ContractRight"
	ContractRight:SetDotPitchEnabled( true )
	ContractRight:SetDotPitchX( 0, 0 )
	ContractRight:SetDotPitchY( 0, 0 )
	ContractRight:SetDotPitchContrast( 0, 0 )
	ContractRight:SetDotPitchMode( 0 )
	ContractRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -920, _1080p * -220, _1080p * 270, _1080p * 890 )
	self:addElement( ContractRight )
	self.ContractRight = ContractRight
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f4_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local f4_local10 = nil
	if not CONDITIONS.IsSystemLink( self ) then
		f4_local10 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f4_local1
		} )
		f4_local10.id = "CRMMain"
		f4_local10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f4_local10 )
		self.CRMMain = f4_local10
	end
	local ContractTimer = nil
	
	ContractTimer = MenuBuilder.BuildRegisteredType( "ContractTimer", {
		controllerIndex = f4_local1
	} )
	ContractTimer.id = "ContractTimer"
	ContractTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 220, _1080p * 700, _1080p * 185, _1080p * 225 )
	self:addElement( ContractTimer )
	self.ContractTimer = ContractTimer
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ContractLeft:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.ContractLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ContractLeft:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.ContractLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 260, _1080p * 960, _1080p * 270, _1080p * 890, 0 )
				end,
				function ()
					return self.ContractLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 220, _1080p * 920, _1080p * 270, _1080p * 890, 250, LUI.EASING.outCubic )
				end
			}
		} )
		ContractRight:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.ContractRight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ContractRight:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.ContractRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -960, _1080p * -260, _1080p * 270, _1080p * 890, 0 )
				end,
				function ()
					return self.ContractRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -920, _1080p * -220, _1080p * 270, _1080p * 890, 250, LUI.EASING.outCubic )
				end
			}
		} )
		ContractTimer:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.ContractTimer:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ContractTimer:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.ContractTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 260, _1080p * 740, _1080p * 185, _1080p * 225, 0 )
				end,
				function ()
					return self.ContractTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 220, _1080p * 700, _1080p * 185, _1080p * 225, 250, LUI.EASING.outCubic )
				end
			}
		} )
		self._sequences.MenuOpen = function ()
			ContractLeft:AnimateSequence( "MenuOpen" )
			ContractRight:AnimateSequence( "MenuOpen" )
			ContractTimer:AnimateSequence( "MenuOpen" )
		end
		
		self._sequences.MenuClose = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f21_arg0, f21_arg1 )
		f21_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
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
		local f22_local0 = f22_arg1.controller or f4_local1
		ACTIONS.LeaveMenu( self )
	end )
	self:addEventHandler( "menu_create", function ( f23_arg0, f23_arg1 )
		local f23_local0 = f23_arg1.controller or f4_local1
		ACTIONS.AnimateSequence( self, "MenuOpen" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end )
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "ContractMenu", ContractMenu )
LockTable( _M )
