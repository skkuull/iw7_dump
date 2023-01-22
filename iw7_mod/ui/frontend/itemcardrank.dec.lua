local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ItemCardRank( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "ItemCardRank"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Level = nil
	
	Level = LUI.UIText.new()
	Level.id = "Level"
	Level:SetFontSize( 12 * _1080p )
	Level:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Level:SetAlignment( LUI.Alignment.Center )
	Level:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 8, _1080p * 20 )
	Level:SubscribeToModelThroughElement( self, "textA", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.textA:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Level:setText( ToUpperCase( f2_local0 ), 0 )
		end
	end )
	self:addElement( Level )
	self.Level = Level
	
	local Rank = nil
	
	Rank = LUI.UIText.new()
	Rank.id = "Rank"
	Rank:SetAlpha( 0, 0 )
	Rank:SetFontSize( 12 * _1080p )
	Rank:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Rank:SetAlignment( LUI.Alignment.Center )
	Rank:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -20, _1080p * -8 )
	Rank:SubscribeToModelThroughElement( self, "textC", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.textC:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Rank:setText( ToUpperCase( LocalizeString( f3_local0 ) ), 0 )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local RankIcon = nil
	
	RankIcon = LUI.UIImage.new()
	RankIcon.id = "RankIcon"
	RankIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, 0, _1080p * -16, _1080p * 16 )
	RankIcon:SubscribeToModelThroughElement( self, "image", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.image:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			RankIcon:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local RankNumber = nil
	
	RankNumber = LUI.UIText.new()
	RankNumber.id = "RankNumber"
	RankNumber:SetFontSize( 26 * _1080p )
	RankNumber:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RankNumber:SetAlignment( LUI.Alignment.Left )
	RankNumber:SetOptOutRightToLeftAlignmentFlip( true )
	RankNumber:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 4, _1080p * 43, _1080p * -13, _1080p * 13 )
	RankNumber:SubscribeToModelThroughElement( self, "textB", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.textB:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			RankNumber:setText( f5_local0, 0 )
		end
	end )
	self:addElement( RankNumber )
	self.RankNumber = RankNumber
	
	return self
end

MenuBuilder.registerType( "ItemCardRank", ItemCardRank )
LockTable( _M )
