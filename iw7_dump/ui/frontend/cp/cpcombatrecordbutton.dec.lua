local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.GenericButton:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f1_arg0:GetDataSource()
		assert( f2_local0 )
		if f2_local0.menuRef ~= nil then
			LUI.FlowManager.RequestAddMenu( f2_local0.menuRef, true, f1_arg1, false )
		end
		return false
	end )
	f1_arg0.GenericButton:addEventHandler( "button_over", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f1_arg0:GetDataSource()
		assert( f3_local0 )
		assert( f3_local0.highlightFunc )
		f3_local0.highlightFunc()
		if f3_local0.menuRef == nil then
			f1_arg0.GenericButton:SetButtonDisabled( true )
		end
		f3_local0.highlightFunc()
		return false
	end )
end

function CPCombatRecordButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "CPCombatRecordButton"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local GenericButton = nil
	
	GenericButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f4_local1
	} )
	GenericButton.id = "GenericButton"
	GenericButton:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 )
	GenericButton:SubscribeToModelThroughElement( self, "disabled", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.disabled:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			GenericButton:SetButtonDisabled( f5_local0 )
		end
	end )
	GenericButton:SubscribeToModelThroughElement( self, "name", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.name:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			GenericButton.Text:setText( ToUpperCase( LocalizeString( f6_local0 ) ), 0 )
		end
	end )
	self:addElement( GenericButton )
	self.GenericButton = GenericButton
	
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "CPCombatRecordButton", CPCombatRecordButton )
LockTable( _M )
