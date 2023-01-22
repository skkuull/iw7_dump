local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	if Engine.IsDevelopmentBuild() then
		if not f1_arg2.rigRef then
			DebugPrint( "WARNING: Missing \"rigRef\" option for RigCustomizationActionSelection menu. Only OK after a MyChanges." )
			f1_arg2.rigRef = "archetype_assault"
		end
		if not f1_arg2.squadMemberDataSource then
			DebugPrint( "WARNING: Missing \"squadMemberDataSource\" option for RigCustomizationActionSelection menu. Only OK after a MyChanges." )
			f1_arg2.squadMemberDataSource = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers
		end
	end
	assert( f1_arg2.squadMemberDataSource )
	assert( f1_arg2.rigRef )
	local f1_local0 = Cac.GetPreferencesForRig( f1_arg2.squadMemberDataSource.archetypePreferences, f1_arg2.rigRef, f1_arg1 )
	for f1_local1 = 1, 4, 1 do
		local f1_local4 = f1_local1
		local f1_local5 = f1_arg0.Slots["Slot" .. f1_local4]
		assert( f1_local5 )
		local f1_local6 = f1_local4
		if Engine.IsGamepadEnabled() ~= 1 then
			f1_local6 = f1_local4 + 2
		end
		local f1_local7 = Engine.Localize( "LUA_MENU_MP_TAUNT_SLOT", "[{+actionslot " .. f1_local6 .. "}]" )
		local f1_local8 = Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.ref, f1_local0.taunts[f1_local4 - 1]:GetValue( f1_arg1 ), CSV.taunts.cols.name )
		f1_local5.Text:setText( f1_local7 )
		f1_local5.DynamicText:setText( Engine.Localize( f1_local8 ) )
		f1_local5:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
			LUI.FlowManager.RequestAddMenu( "RigCustomizationActionSelection", true, f1_arg1, nil, {
				squadMemberDataSource = f1_arg2.squadMemberDataSource,
				rigRef = f1_arg2.rigRef,
				tauntSlot = f1_local4 - 1
			}, true )
		end )
	end
	f1_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumbCreateAClass(), 0 )
	f1_arg0.MenuTitle.MenuTitle:setText( Engine.Localize( "MP_FRONTEND_ONLY_WINNERS_CIRCLE_TAUNT", ToUpperCase( Cac.GetRigName( f1_arg2.rigRef ) ) ), 0 )
	FrontEndScene.SetScene( "rig_select" )
	ClientCharacter.SetCharacterRotation( FrontEndScene.ClientCharacters.Customization, 0, 0, 0 )
end

function RigCustomizationTauntSlots( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "RigCustomizationTauntSlots"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self:playSound( "menu_open" )
	local f3_local2 = self
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f3_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( "", 0 )
	MenuTitle.MenuBreadcrumbs:setText( "", 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 96, _1080p * 96, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local Slots = nil
	
	Slots = MenuBuilder.BuildRegisteredType( "RigCustomizationTauntSlotsList", {
		controllerIndex = f3_local1
	} )
	Slots.id = "Slots"
	Slots:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 765, _1080p * 216, _1080p * 357 )
	self:addElement( Slots )
	self.Slots = Slots
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f3_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f3_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local f3_local7 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f3_local7 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f3_local1
		} )
		f3_local7.id = "CRMMain"
		f3_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 939 )
		self:addElement( f3_local7 )
		self.CRMMain = f3_local7
	end
	self.addButtonHelperFunction = function ( f4_arg0, f4_arg1 )
		f4_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f4_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg1.controller or f3_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "RigCustomizationTauntSlots", RigCustomizationTauntSlots )
LockTable( _M )
