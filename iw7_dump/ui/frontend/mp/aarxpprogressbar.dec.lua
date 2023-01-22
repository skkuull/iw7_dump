local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARXpProgressBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 760 * _1080p, 0, 40 * _1080p )
	self.id = "AARXpProgressBar"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local bonusXpFill = nil
	
	bonusXpFill = LUI.UIImage.new()
	bonusXpFill.id = "bonusXpFill"
	bonusXpFill:SetRGBFromInt( 6265751, 0 )
	bonusXpFill:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, 0, 0 )
	self:addElement( bonusXpFill )
	self.bonusXpFill = bonusXpFill
	
	local matchBonusXpFill = nil
	
	matchBonusXpFill = LUI.UIImage.new()
	matchBonusXpFill.id = "matchBonusXpFill"
	matchBonusXpFill:SetRGBFromInt( 9148422, 0 )
	matchBonusXpFill:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, 0, 0 )
	self:addElement( matchBonusXpFill )
	self.matchBonusXpFill = matchBonusXpFill
	
	local fieldOrderXpFill = nil
	
	fieldOrderXpFill = LUI.UIImage.new()
	fieldOrderXpFill.id = "fieldOrderXpFill"
	fieldOrderXpFill:SetRGBFromInt( 8543830, 0 )
	fieldOrderXpFill:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, 0, 0 )
	self:addElement( fieldOrderXpFill )
	self.fieldOrderXpFill = fieldOrderXpFill
	
	local challengeXpFill = nil
	
	challengeXpFill = LUI.UIImage.new()
	challengeXpFill.id = "challengeXpFill"
	challengeXpFill:SetRGBFromInt( 9134610, 0 )
	challengeXpFill:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, 0, 0 )
	self:addElement( challengeXpFill )
	self.challengeXpFill = challengeXpFill
	
	local matchXpFill = nil
	
	matchXpFill = LUI.UIImage.new()
	matchXpFill.id = "matchXpFill"
	matchXpFill:SetRGBFromInt( 15113540, 0 )
	matchXpFill:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, 0, 0 )
	self:addElement( matchXpFill )
	self.matchXpFill = matchXpFill
	
	local previousXpFill = nil
	
	previousXpFill = LUI.UIImage.new()
	previousXpFill.id = "previousXpFill"
	previousXpFill:SetRGBFromInt( 16161177, 0 )
	previousXpFill:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, _1080p * 1, _1080p * -1 )
	self:addElement( previousXpFill )
	self.previousXpFill = previousXpFill
	
	local Frame = nil
	
	Frame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Frame.id = "Frame"
	self:addElement( Frame )
	self.Frame = Frame
	
	return self
end

MenuBuilder.registerType( "AARXpProgressBar", AARXpProgressBar )
LockTable( _M )
