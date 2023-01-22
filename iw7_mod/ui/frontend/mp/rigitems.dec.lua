local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	local f1_local0 = f1_arg0:getAllFocusedChildren()
	if #f1_local0 <= 0 then
		return false
	end
	local f1_local1 = false
	for f1_local2 = 1, #f1_local0, 1 do
		if not f1_local0[f1_local2]:IsDisabled() then
			f1_local1 = true
		end
	end
	return f1_local1
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	local f2_local0 = f2_arg0:GetCurrentMenu()
	f2_local0.decoratedRigs.__serializable = false
	f2_local0.rigDataSource.__serializable = false
	f2_local0.squadMemberDataSource.__serializable = false
	LUI.FlowManager.RequestAddMenu( "RigEditMenu", true, f2_arg1, nil, {
		decoratedRigs = f2_local0.decoratedRigs,
		rigDataSource = f2_local0.rigDataSource,
		squadMemberDataSource = f2_local0.squadMemberDataSource,
		XUID = f2_local0.XUID
	}, true )
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.RigSelect )
	assert( f3_arg0.RigSuper )
	assert( f3_arg0.RigPerk )
	f3_arg0.RigSelect.navigation = {}
	f3_arg0.RigSelect.navigation.down = f3_arg0.RigSuper
	f3_arg0.RigSuper.navigation = {}
	f3_arg0.RigSuper.navigation.up = f3_arg0.RigSelect
	f3_arg0.RigSuper.navigation.right = f3_arg0.RigPerk
	f3_arg0.RigPerk.navigation = {}
	f3_arg0.RigPerk.navigation.up = f3_arg0.RigSelect
	f3_arg0.RigPerk.navigation.left = f3_arg0.RigSuper
	f3_arg0.RigSelect:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		if CONDITIONS.IsCoreFrontendPC() then
			if not f0_local0( f4_arg0 ) then
				f0_local1( f3_arg0, f3_arg1, f4_arg0, f4_arg1 )
			end
			return true
		else
			f0_local1( f3_arg0, f3_arg1, f4_arg0, f4_arg1 )
		end
	end )
	f3_arg0.RigSuper:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f3_arg0:GetCurrentMenu()
		f5_local0.selectedRig.__serializable = false
		f5_local0.rigDataSource.__serializable = false
		f5_local0.squadMemberDataSource.__serializable = false
		LUI.FlowManager.RequestAddMenu( "RigSuperSelect", true, f3_arg1, nil, {
			selectedRig = f5_local0.selectedRig,
			rigDataSource = f5_local0.rigDataSource,
			squadMemberDataSource = f5_local0.squadMemberDataSource
		}, true )
	end )
	f3_arg0.RigPerk:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
		local f6_local0 = f3_arg0:GetCurrentMenu()
		f6_local0.selectedRig.__serializable = false
		f6_local0.rigDataSource.__serializable = false
		f6_local0.squadMemberDataSource.__serializable = false
		LUI.FlowManager.RequestAddMenu( "RigTraitSelect", true, f3_arg1, nil, {
			selectedRig = f6_local0.selectedRig,
			rigDataSource = f6_local0.rigDataSource,
			squadMemberDataSource = f6_local0.squadMemberDataSource
		}, true )
	end )
	if CONDITIONS.IsDraftEnabled() then
		f3_arg0:SubscribeToModelThroughElement( f3_arg0, "rigRef", function ()
			if f3_arg0.XUID then
				local f7_local0 = f3_arg0.XUID
				if f7_local0 then
					local f7_local1 = LoadoutDrafting.GetRigDraftInfoForPlayer( f7_local0 )
					if f7_local1.rigIndex == Cac.noDraftedRigIndex then
						f3_arg0.RigSuper:SetButtonDisabled( true )
						f3_arg0.RigPerk:SetButtonDisabled( true )
					else
						f3_arg0.RigSuper:SetButtonDisabled( false )
						f3_arg0.RigPerk:SetButtonDisabled( false )
					end
				end
			end
		end )
	end
end

function RigItems( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 426 * _1080p, 0, 354 * _1080p )
	self.id = "RigItems"
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local f8_local3 = nil
	if Engine.InFrontend() then
		f8_local3 = LUI.UIBlur.new()
		f8_local3.id = "Blur"
		f8_local3:SetBlurStrength( 2.75, 0 )
		self:addElement( f8_local3 )
		self.Blur = f8_local3
	end
	local RigSelect = nil
	
	RigSelect = MenuBuilder.BuildRegisteredType( "RigEditButton", {
		controllerIndex = f8_local1
	} )
	RigSelect.id = "RigSelect"
	RigSelect:SetDataSourceThroughElement( self, nil )
	RigSelect.buttonDescription = Engine.Localize( "LUA_MENU_MP_RIG_SELECT_RIG" )
	RigSelect:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 174 )
	self:addElement( RigSelect )
	self.RigSelect = RigSelect
	
	local RigSuper = nil
	
	RigSuper = MenuBuilder.BuildRegisteredType( "RigSuperEditButton", {
		controllerIndex = f8_local1
	} )
	RigSuper.id = "RigSuper"
	RigSuper:SetDataSourceThroughElement( self, nil )
	RigSuper.buttonDescription = Engine.Localize( "LUA_MENU_MP_RIG_SELECT_PAYLOADS" )
	RigSuper:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 210, _1080p * -174, 0 )
	self:addElement( RigSuper )
	self.RigSuper = RigSuper
	
	local RigPerk = nil
	
	RigPerk = MenuBuilder.BuildRegisteredType( "RigPerkEditButton", {
		controllerIndex = f8_local1
	} )
	RigPerk.id = "RigPerk"
	RigPerk:SetDataSourceThroughElement( self, nil )
	RigPerk.buttonDescription = Engine.Localize( "LUA_MENU_MP_RIG_SELECT_TRAITS" )
	RigPerk:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -210, 0, _1080p * -174, 0 )
	self:addElement( RigPerk )
	self.RigPerk = RigPerk
	
	local ButtonDescription = nil
	
	ButtonDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f8_local1
	} )
	ButtonDescription.id = "ButtonDescription"
	ButtonDescription.Description:SetRight( _1080p * 415, 0 )
	ButtonDescription:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 515, _1080p * 366, _1080p * 466 )
	self:addElement( ButtonDescription )
	self.ButtonDescription = ButtonDescription
	
	RigSelect:SetDataSourceThroughElement( self, nil )
	RigSuper:SetDataSourceThroughElement( self, nil )
	RigPerk:SetDataSourceThroughElement( self, nil )
	f0_local2( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "RigItems", RigItems )
LockTable( _M )
