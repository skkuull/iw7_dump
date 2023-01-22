local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RightPanel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 521 * _1080p, 0, 715 * _1080p )
	self.id = "RightPanel"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ListBlurCopy0 = nil
	
	ListBlurCopy0 = LUI.UIBlur.new()
	ListBlurCopy0.id = "ListBlurCopy0"
	ListBlurCopy0:SetBlurStrength( 1.5, 0 )
	self:addElement( ListBlurCopy0 )
	self.ListBlurCopy0 = ListBlurCopy0
	
	local GradientBackgroundInGameOnlyCopy0 = nil
	
	GradientBackgroundInGameOnlyCopy0 = LUI.UIImage.new()
	GradientBackgroundInGameOnlyCopy0.id = "GradientBackgroundInGameOnlyCopy0"
	GradientBackgroundInGameOnlyCopy0:SetRGBFromInt( 0, 0 )
	GradientBackgroundInGameOnlyCopy0:SetAlpha( 0.4, 0 )
	self:addElement( GradientBackgroundInGameOnlyCopy0 )
	self.GradientBackgroundInGameOnlyCopy0 = GradientBackgroundInGameOnlyCopy0
	
	local TicBRCopy5 = nil
	
	TicBRCopy5 = LUI.UIImage.new()
	TicBRCopy5.id = "TicBRCopy5"
	TicBRCopy5:SetAlpha( 0.8, 0 )
	TicBRCopy5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 15, _1080p * 1.5, _1080p * 4.5 )
	self:addElement( TicBRCopy5 )
	self.TicBRCopy5 = TicBRCopy5
	
	local TicBRCopy6 = nil
	
	TicBRCopy6 = LUI.UIImage.new()
	TicBRCopy6.id = "TicBRCopy6"
	TicBRCopy6:SetAlpha( 0.8, 0 )
	TicBRCopy6:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -15, _1080p * -1, _1080p * 1.5, _1080p * 4.5 )
	self:addElement( TicBRCopy6 )
	self.TicBRCopy6 = TicBRCopy6
	
	local TicBRCopy7 = nil
	
	TicBRCopy7 = LUI.UIImage.new()
	TicBRCopy7.id = "TicBRCopy7"
	TicBRCopy7:SetAlpha( 0.8, 0 )
	TicBRCopy7:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1, _1080p * 15, _1080p * -5, _1080p * -2 )
	self:addElement( TicBRCopy7 )
	self.TicBRCopy7 = TicBRCopy7
	
	local TicBRCopy8 = nil
	
	TicBRCopy8 = LUI.UIImage.new()
	TicBRCopy8.id = "TicBRCopy8"
	TicBRCopy8:SetAlpha( 0.8, 0 )
	TicBRCopy8:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -15, _1080p * -1, _1080p * -5, _1080p * -2 )
	self:addElement( TicBRCopy8 )
	self.TicBRCopy8 = TicBRCopy8
	
	return self
end

MenuBuilder.registerType( "RightPanel", RightPanel )
LockTable( _M )
