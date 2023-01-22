local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ScoreboardGridBoarder( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 858 * _1080p, 0, 40 * _1080p )
	self.id = "ScoreboardGridBoarder"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local GridLines = nil
	
	GridLines = LUI.UIImage.new()
	GridLines.id = "GridLines"
	GridLines:SetRGBFromTable( SWATCHES.genericMenu.frame, 0 )
	GridLines:SetAlpha( 0.6, 0 )
	GridLines:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 78, _1080p * 79, _1080p * 1, _1080p * -1 )
	self:addElement( GridLines )
	self.GridLines = GridLines
	
	local GridBorder = nil
	
	GridBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	GridBorder.id = "GridBorder"
	GridBorder:SetRGBFromTable( SWATCHES.genericMenu.frame, 0 )
	GridBorder:SetAlpha( 0.6, 0 )
	self:addElement( GridBorder )
	self.GridBorder = GridBorder
	
	return self
end

MenuBuilder.registerType( "ScoreboardGridBoarder", ScoreboardGridBoarder )
LockTable( _M )
