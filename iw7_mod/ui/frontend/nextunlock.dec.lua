local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function NextUnlock( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 111 * _1080p, 0, 111 * _1080p )
	self.id = "NextUnlock"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local UnlockImage = nil
	
	UnlockImage = LUI.UIImage.new()
	UnlockImage.id = "UnlockImage"
	UnlockImage:SubscribeToModelThroughElement( self, "alpha", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.alpha:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			UnlockImage:SetAlpha( f2_local0, 0 )
		end
	end )
	UnlockImage:SubscribeToModelThroughElement( self, "image", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.image:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			UnlockImage:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( UnlockImage )
	self.UnlockImage = UnlockImage
	
	return self
end

MenuBuilder.registerType( "NextUnlock", NextUnlock )
LockTable( _M )
