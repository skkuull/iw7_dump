local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function InteractiveObjectIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 256 * _1080p, 0, 128 * _1080p )
	self.id = "InteractiveObjectIcon"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	Icon:SubscribeToModel( DataSources.inGame.HUD.hints.interactiveObject.popup.material:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.HUD.hints.interactiveObject.popup.material:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Icon:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	return self
end

MenuBuilder.registerType( "InteractiveObjectIcon", InteractiveObjectIcon )
LockTable( _M )
