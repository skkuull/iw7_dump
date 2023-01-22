local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericReticleBrackets( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "GenericReticleBrackets"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BottomRightBracketHorzLine = nil
	
	BottomRightBracketHorzLine = LUI.UIImage.new()
	BottomRightBracketHorzLine.id = "BottomRightBracketHorzLine"
	BottomRightBracketHorzLine:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -10, _1080p * -2, _1080p * -2, 0 )
	self:addElement( BottomRightBracketHorzLine )
	self.BottomRightBracketHorzLine = BottomRightBracketHorzLine
	
	local BottomRightBracketVertLine = nil
	
	BottomRightBracketVertLine = LUI.UIImage.new()
	BottomRightBracketVertLine.id = "BottomRightBracketVertLine"
	BottomRightBracketVertLine:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -2, 0, _1080p * -10, 0 )
	self:addElement( BottomRightBracketVertLine )
	self.BottomRightBracketVertLine = BottomRightBracketVertLine
	
	local BottomLeftBracketHorzLine = nil
	
	BottomLeftBracketHorzLine = LUI.UIImage.new()
	BottomLeftBracketHorzLine.id = "BottomLeftBracketHorzLine"
	BottomLeftBracketHorzLine:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 2, _1080p * 10, _1080p * -2, 0 )
	self:addElement( BottomLeftBracketHorzLine )
	self.BottomLeftBracketHorzLine = BottomLeftBracketHorzLine
	
	local BottomLeftBracketVertLine = nil
	
	BottomLeftBracketVertLine = LUI.UIImage.new()
	BottomLeftBracketVertLine.id = "BottomLeftBracketVertLine"
	BottomLeftBracketVertLine:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 2, _1080p * -10, 0 )
	self:addElement( BottomLeftBracketVertLine )
	self.BottomLeftBracketVertLine = BottomLeftBracketVertLine
	
	local TopRightBracketHorzLine = nil
	
	TopRightBracketHorzLine = LUI.UIImage.new()
	TopRightBracketHorzLine.id = "TopRightBracketHorzLine"
	TopRightBracketHorzLine:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -10, _1080p * -2, 0, _1080p * 2 )
	self:addElement( TopRightBracketHorzLine )
	self.TopRightBracketHorzLine = TopRightBracketHorzLine
	
	local TopRightBracketVertLine = nil
	
	TopRightBracketVertLine = LUI.UIImage.new()
	TopRightBracketVertLine.id = "TopRightBracketVertLine"
	TopRightBracketVertLine:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -2, 0, 0, _1080p * 10 )
	self:addElement( TopRightBracketVertLine )
	self.TopRightBracketVertLine = TopRightBracketVertLine
	
	local TopLeftBracketHorzLine = nil
	
	TopLeftBracketHorzLine = LUI.UIImage.new()
	TopLeftBracketHorzLine.id = "TopLeftBracketHorzLine"
	TopLeftBracketHorzLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 10, 0, _1080p * 2 )
	self:addElement( TopLeftBracketHorzLine )
	self.TopLeftBracketHorzLine = TopLeftBracketHorzLine
	
	local TopLeftBracketVertLine = nil
	
	TopLeftBracketVertLine = LUI.UIImage.new()
	TopLeftBracketVertLine.id = "TopLeftBracketVertLine"
	TopLeftBracketVertLine:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 2, 0, _1080p * 10 )
	self:addElement( TopLeftBracketVertLine )
	self.TopLeftBracketVertLine = TopLeftBracketVertLine
	
	return self
end

MenuBuilder.registerType( "GenericReticleBrackets", GenericReticleBrackets )
LockTable( _M )
