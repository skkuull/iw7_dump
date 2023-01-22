local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PrestigeReward( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 650 * _1080p, 0, 25 * _1080p )
	self.id = "PrestigeReward"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local RewardText = nil
	
	RewardText = LUI.UIText.new()
	RewardText.id = "RewardText"
	RewardText:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	RewardText:SetFontSize( 22 * _1080p )
	RewardText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RewardText:SetAlignment( LUI.Alignment.Left )
	RewardText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 18, 0, _1080p * 2, _1080p * 24 )
	RewardText:SubscribeToModelThroughElement( self, "name", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.name:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			RewardText:setText( f2_local0, 0 )
		end
	end )
	self:addElement( RewardText )
	self.RewardText = RewardText
	
	local Caret = nil
	
	Caret = LUI.UIText.new()
	Caret.id = "Caret"
	Caret:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	Caret:setText( "1", 0 )
	Caret:SetFontSize( 22 * _1080p )
	Caret:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Caret:SetAlignment( LUI.Alignment.Left )
	Caret:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 14, _1080p * 2, _1080p * 24 )
	self:addElement( Caret )
	self.Caret = Caret
	
	return self
end

MenuBuilder.registerType( "PrestigeReward", PrestigeReward )
LockTable( _M )
