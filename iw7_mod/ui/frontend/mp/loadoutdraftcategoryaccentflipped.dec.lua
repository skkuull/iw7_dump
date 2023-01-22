local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Label:SetWordWrap( false )
end

function LoadoutDraftCategoryAccentFlipped( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 20 * _1080p, 0, 100 * _1080p )
	self.id = "LoadoutDraftCategoryAccentFlipped"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	Border.id = "Border"
	Border:SetRGBFromInt( 0, 0 )
	Border:SetBorderThicknessLeft( _1080p * 2, 0 )
	Border:SetBorderThicknessRight( _1080p * 0, 0 )
	Border:SetBorderThicknessTop( _1080p * 2, 0 )
	Border:SetBorderThicknessBottom( _1080p * 2, 0 )
	Border:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 12, 0, 0, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local Block = nil
	
	Block = LUI.UIImage.new()
	Block.id = "Block"
	Block:SetRGBFromInt( 5592405, 0 )
	Block:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 8, 0, _1080p * 26 )
	self:addElement( Block )
	self.Block = Block
	
	local Label = nil
	
	Label = LUI.UIText.new()
	Label.id = "Label"
	Label:SetRGBFromInt( 0, 0 )
	Label:SetAlpha( 0, 0 )
	Label:SetZRotation( 90, 0 )
	Label:setText( "", 0 )
	Label:SetFontSize( 16 * _1080p )
	Label:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Label:SetAlignment( LUI.Alignment.Right )
	Label:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -4, _1080p * 8, _1080p * 30, _1080p * 46 )
	self:addElement( Label )
	self.Label = Label
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "LoadoutDraftCategoryAccentFlipped", LoadoutDraftCategoryAccentFlipped )
LockTable( _M )
