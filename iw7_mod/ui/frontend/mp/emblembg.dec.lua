local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function Emblembg( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 500 * _1080p )
	self.id = "Emblembg"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetRGBFromTable( SWATCHES.CAC.BarracksBlurDark, 0 )
	ListBlur:SetBlurStrength( 2.75, 0 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local f1_local4 = nil
	if Engine.InFrontend() then
		f1_local4 = LUI.UIImage.new()
		f1_local4.id = "DropShadow"
		f1_local4:SetRGBFromInt( 0, 0 )
		f1_local4:SetAlpha( 0.3, 0 )
		f1_local4:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f1_local4:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f1_local4 )
		self.DropShadow = f1_local4
	end
	return self
end

MenuBuilder.registerType( "Emblembg", Emblembg )
LockTable( _M )
