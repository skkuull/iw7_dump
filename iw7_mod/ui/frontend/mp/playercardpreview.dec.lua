local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function playercardpreview( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 441 * _1080p, 0, 127 * _1080p )
	self.id = "playercardpreview"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local EmblemPreview = nil
	
	EmblemPreview = LUI.UIImage.new()
	EmblemPreview.id = "EmblemPreview"
	EmblemPreview:SetAlpha( 0.25, 0 )
	EmblemPreview:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 124, _1080p * 2, _1080p * 125 )
	self:addElement( EmblemPreview )
	self.EmblemPreview = EmblemPreview
	
	local EmblemPreviewCopy0 = nil
	
	EmblemPreviewCopy0 = LUI.UIImage.new()
	EmblemPreviewCopy0.id = "EmblemPreviewCopy0"
	EmblemPreviewCopy0:SetAlpha( 0.25, 0 )
	EmblemPreviewCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 126, _1080p * 438, _1080p * 2, _1080p * 125 )
	EmblemPreviewCopy0:SubscribeToModel( DataSources.frontEnd.headquarters.cardBackgroundTexture:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.frontEnd.headquarters.cardBackgroundTexture:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			EmblemPreviewCopy0:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( EmblemPreviewCopy0 )
	self.EmblemPreviewCopy0 = EmblemPreviewCopy0
	
	local Line2Copy1 = nil
	
	Line2Copy1 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f1_local1
	} )
	Line2Copy1.id = "Line2Copy1"
	Line2Copy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 438, _1080p * 125, _1080p * 129 )
	self:addElement( Line2Copy1 )
	self.Line2Copy1 = Line2Copy1
	
	local Line2Copy2 = nil
	
	Line2Copy2 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f1_local1
	} )
	Line2Copy2.id = "Line2Copy2"
	Line2Copy2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 438, _1080p * 1, _1080p * 5.5 )
	self:addElement( Line2Copy2 )
	self.Line2Copy2 = Line2Copy2
	
	Line2Copy1.navigation = {
		up = Line2Copy2
	}
	Line2Copy2.navigation = {
		down = Line2Copy1
	}
	return self
end

MenuBuilder.registerType( "playercardpreview", playercardpreview )
LockTable( _M )
