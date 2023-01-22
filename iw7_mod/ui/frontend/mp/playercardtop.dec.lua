local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function playercardtop( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 352 * _1080p, 0, 99 * _1080p )
	self.id = "playercardtop"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local EmblemPreview = nil
	
	EmblemPreview = LUI.UIImage.new()
	EmblemPreview.id = "EmblemPreview"
	EmblemPreview:SetAlpha( 0.68, 0 )
	EmblemPreview:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 99.35, _1080p * -0.35, _1080p * 99 )
	self:addElement( EmblemPreview )
	self.EmblemPreview = EmblemPreview
	
	local CallingCard = nil
	
	CallingCard = LUI.UIImage.new()
	CallingCard.id = "CallingCard"
	CallingCard:SetAlpha( 0.74, 0 )
	CallingCard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100.35, _1080p * 352.35, _1080p * -0.35, _1080p * 99 )
	self:addElement( CallingCard )
	self.CallingCard = CallingCard
	
	local Line2Copy1 = nil
	
	Line2Copy1 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f1_local1
	} )
	Line2Copy1.id = "Line2Copy1"
	Line2Copy1:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * 0.35, _1080p * -1, _1080p * 3 )
	self:addElement( Line2Copy1 )
	self.Line2Copy1 = Line2Copy1
	
	local Line2Copy2 = nil
	
	Line2Copy2 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f1_local1
	} )
	Line2Copy2.id = "Line2Copy2"
	Line2Copy2:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * 0.35, _1080p * -1, _1080p * 3.5 )
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

MenuBuilder.registerType( "playercardtop", playercardtop )
LockTable( _M )
