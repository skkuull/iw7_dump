local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function EmblemBoxLine( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 69 * _1080p, 0, 1 * _1080p )
	self.id = "EmblemBoxLine"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TicBRCopy2 = nil
	
	TicBRCopy2 = LUI.UIImage.new()
	TicBRCopy2.id = "TicBRCopy2"
	TicBRCopy2:SetAlpha( 0.25, 0 )
	TicBRCopy2:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 1 )
	self:addElement( TicBRCopy2 )
	self.TicBRCopy2 = TicBRCopy2
	
	local TicBRCopy1 = nil
	
	TicBRCopy1 = LUI.UIImage.new()
	TicBRCopy1.id = "TicBRCopy1"
	TicBRCopy1:SetAlpha( 0.8, 0 )
	TicBRCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 8, 0, _1080p * 1 )
	self:addElement( TicBRCopy1 )
	self.TicBRCopy1 = TicBRCopy1
	
	local TicBR = nil
	
	TicBR = LUI.UIImage.new()
	TicBR.id = "TicBR"
	TicBR:SetAlpha( 0.8, 0 )
	TicBR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -8, 0, 0, _1080p * 1 )
	self:addElement( TicBR )
	self.TicBR = TicBR
	
	return self
end

MenuBuilder.registerType( "EmblemBoxLine", EmblemBoxLine )
LockTable( _M )
