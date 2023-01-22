local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericReticleDiagonalDotLines( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 200 * _1080p )
	self.id = "GenericReticleDiagonalDotLines"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local DiagonalLineTL = nil
	
	DiagonalLineTL = LUI.UIImage.new()
	DiagonalLineTL.id = "DiagonalLineTL"
	DiagonalLineTL:setImage( RegisterMaterial( "hud_jackal_reticule_piece_ads_diagonal_line" ), 0 )
	DiagonalLineTL:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 64, 0, _1080p * 64 )
	self:addElement( DiagonalLineTL )
	self.DiagonalLineTL = DiagonalLineTL
	
	local DiagonalLineTR = nil
	
	DiagonalLineTR = LUI.UIImage.new()
	DiagonalLineTR.id = "DiagonalLineTR"
	DiagonalLineTR:setImage( RegisterMaterial( "hud_jackal_reticule_piece_ads_diagonal_line" ), 0 )
	DiagonalLineTR:SetAnchorsAndPosition( 1, 0, 0, 1, 0, _1080p * -64, 0, _1080p * 64 )
	self:addElement( DiagonalLineTR )
	self.DiagonalLineTR = DiagonalLineTR
	
	local DiagonalLineBL = nil
	
	DiagonalLineBL = LUI.UIImage.new()
	DiagonalLineBL.id = "DiagonalLineBL"
	DiagonalLineBL:setImage( RegisterMaterial( "hud_jackal_reticule_piece_ads_diagonal_line" ), 0 )
	DiagonalLineBL:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 64, 0, _1080p * -64 )
	self:addElement( DiagonalLineBL )
	self.DiagonalLineBL = DiagonalLineBL
	
	local DiagonalLineBR = nil
	
	DiagonalLineBR = LUI.UIImage.new()
	DiagonalLineBR.id = "DiagonalLineBR"
	DiagonalLineBR:setImage( RegisterMaterial( "hud_jackal_reticule_piece_ads_diagonal_line" ), 0 )
	DiagonalLineBR:SetAnchorsAndPosition( 1, 0, 1, 0, 0, _1080p * -64, 0, _1080p * -64 )
	self:addElement( DiagonalLineBR )
	self.DiagonalLineBR = DiagonalLineBR
	
	return self
end

MenuBuilder.registerType( "GenericReticleDiagonalDotLines", GenericReticleDiagonalDotLines )
LockTable( _M )
