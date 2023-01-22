local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CPCombatRecordCardValueButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 560 * _1080p, 0, 30 * _1080p )
	self.id = "CPCombatRecordCardValueButton"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local GenericDualLabelButton = nil
	
	GenericDualLabelButton = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f1_local1
	} )
	GenericDualLabelButton.id = "GenericDualLabelButton"
	GenericDualLabelButton:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 )
	GenericDualLabelButton:SubscribeToModelThroughElement( self, "name", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.name:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			GenericDualLabelButton.Text:setText( ToUpperCase( LocalizeString( f2_local0 ) ), 0 )
		end
	end )
	GenericDualLabelButton:SubscribeToModelThroughElement( self, "timesUsed", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.timesUsed:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			GenericDualLabelButton.DynamicText:setText( f3_local0, 0 )
		end
	end )
	self:addElement( GenericDualLabelButton )
	self.GenericDualLabelButton = GenericDualLabelButton
	
	return self
end

MenuBuilder.registerType( "CPCombatRecordCardValueButton", CPCombatRecordCardValueButton )
LockTable( _M )
