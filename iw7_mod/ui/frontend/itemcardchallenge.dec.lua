local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ItemCardChallenge( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "ItemCardChallenge"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ChallengeImage = nil
	
	ChallengeImage = LUI.UIImage.new()
	ChallengeImage.id = "ChallengeImage"
	ChallengeImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	ChallengeImage:SubscribeToModelThroughElement( self, "image", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.image:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ChallengeImage:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( ChallengeImage )
	self.ChallengeImage = ChallengeImage
	
	return self
end

MenuBuilder.registerType( "ItemCardChallenge", ItemCardChallenge )
LockTable( _M )
