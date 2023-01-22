local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PermanentUnlockPowerItem( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "PermanentUnlockPowerItem"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local PowerImage = nil
	
	PowerImage = LUI.UIImage.new()
	PowerImage.id = "PowerImage"
	PowerImage:SubscribeToModelThroughElement( self, "power.fullImage", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.power.fullImage:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			PowerImage:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( PowerImage )
	self.PowerImage = PowerImage
	
	return self
end

MenuBuilder.registerType( "PermanentUnlockPowerItem", PermanentUnlockPowerItem )
LockTable( _M )
