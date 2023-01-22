local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function Spectating_bg( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 177 * _1080p )
	self.id = "Spectating_bg"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetRGBFromInt( 11776947, 0 )
	ListBlur:SetBlurStrength( 1, 0 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local GradientBackgroundInGameOnly = nil
	
	GradientBackgroundInGameOnly = LUI.UIImage.new()
	GradientBackgroundInGameOnly.id = "GradientBackgroundInGameOnly"
	GradientBackgroundInGameOnly:SetRGBFromInt( 0, 0 )
	GradientBackgroundInGameOnly:SetAlpha( 0.4, 0 )
	self:addElement( GradientBackgroundInGameOnly )
	self.GradientBackgroundInGameOnly = GradientBackgroundInGameOnly
	
	local TicBR = nil
	
	TicBR = LUI.UIImage.new()
	TicBR.id = "TicBR"
	TicBR:SetAlpha( 0.8, 0 )
	TicBR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -15, _1080p * -1, _1080p * 1, _1080p * 4 )
	self:addElement( TicBR )
	self.TicBR = TicBR
	
	local TicBRCopy0 = nil
	
	TicBRCopy0 = LUI.UIImage.new()
	TicBRCopy0.id = "TicBRCopy0"
	TicBRCopy0:SetAlpha( 0.8, 0 )
	TicBRCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 15, _1080p * 1, _1080p * 4 )
	self:addElement( TicBRCopy0 )
	self.TicBRCopy0 = TicBRCopy0
	
	local TicBRCopy1 = nil
	
	TicBRCopy1 = LUI.UIImage.new()
	TicBRCopy1.id = "TicBRCopy1"
	TicBRCopy1:SetAlpha( 0.8, 0 )
	TicBRCopy1:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -15, _1080p * -1, _1080p * -4, _1080p * -1 )
	self:addElement( TicBRCopy1 )
	self.TicBRCopy1 = TicBRCopy1
	
	local TicBRCopy2 = nil
	
	TicBRCopy2 = LUI.UIImage.new()
	TicBRCopy2.id = "TicBRCopy2"
	TicBRCopy2:SetAlpha( 0.8, 0 )
	TicBRCopy2:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1, _1080p * 15, _1080p * -4, _1080p * -1 )
	self:addElement( TicBRCopy2 )
	self.TicBRCopy2 = TicBRCopy2
	
	return self
end

MenuBuilder.registerType( "Spectating_bg", Spectating_bg )
LockTable( _M )
