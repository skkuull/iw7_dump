local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WeaponStatsProgressBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 10 * _1080p )
	self.id = "WeaponStatsProgressBar"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BaseFill = nil
	
	BaseFill = LUI.UIImage.new()
	BaseFill.id = "BaseFill"
	BaseFill:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	BaseFill:SetBlendMode( BLEND_MODE.blend )
	BaseFill:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, _1080p * 2, _1080p * -2 )
	self:addElement( BaseFill )
	self.BaseFill = BaseFill
	
	local AttachmentsFill = nil
	
	AttachmentsFill = LUI.UIImage.new()
	AttachmentsFill.id = "AttachmentsFill"
	AttachmentsFill:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
	AttachmentsFill:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, _1080p * 2, _1080p * -2 )
	self:addElement( AttachmentsFill )
	self.AttachmentsFill = AttachmentsFill
	
	local Frame = nil
	
	Frame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Frame.id = "Frame"
	Frame:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 2, _1080p * -2 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local ArrowStub = nil
	
	ArrowStub = LUI.UIImage.new()
	ArrowStub.id = "ArrowStub"
	ArrowStub:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	ArrowStub:SetUseAA( true )
	ArrowStub:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 5, _1080p * -6, _1080p * 4 )
	self:addElement( ArrowStub )
	self.ArrowStub = ArrowStub
	
	return self
end

MenuBuilder.registerType( "WeaponStatsProgressBar", WeaponStatsProgressBar )
LockTable( _M )
