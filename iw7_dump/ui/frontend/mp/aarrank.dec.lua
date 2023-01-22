local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARRank( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 60 * _1080p, 0, 30 * _1080p )
	self.id = "AARRank"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local levelLabel = nil
	
	levelLabel = LUI.UIText.new()
	levelLabel.id = "levelLabel"
	levelLabel:SetFontSize( 30 * _1080p )
	levelLabel:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	levelLabel:SetAlignment( LUI.Alignment.Left )
	levelLabel:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 30, _1080p * 60, _1080p * -15, _1080p * 15 )
	levelLabel:SubscribeToModelThroughElement( self, "rankDisplay", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.rankDisplay:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			levelLabel:setText( f2_local0, 0 )
		end
	end )
	self:addElement( levelLabel )
	self.levelLabel = levelLabel
	
	local levelIcon = nil
	
	levelIcon = LUI.UIImage.new()
	levelIcon.id = "levelIcon"
	levelIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 30, _1080p * -15, _1080p * 15 )
	levelIcon:SubscribeToModelThroughElement( self, "rankIcon", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.rankIcon:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			levelIcon:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( levelIcon )
	self.levelIcon = levelIcon
	
	return self
end

MenuBuilder.registerType( "AARRank", AARRank )
LockTable( _M )
