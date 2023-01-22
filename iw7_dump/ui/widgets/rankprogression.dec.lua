local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RankProgression( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 150 * _1080p, 0, 150 * _1080p )
	self.id = "RankProgression"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BackgroundRing = nil
	
	BackgroundRing = LUI.UIImage.new()
	BackgroundRing.id = "BackgroundRing"
	BackgroundRing:SetRGBFromInt( 0, 0 )
	BackgroundRing:SetAlpha( 0.6, 0 )
	BackgroundRing:setImage( RegisterMaterial( "wdg_circle_progressbar_back" ), 0 )
	BackgroundRing:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -65, _1080p * 65, _1080p * -65, _1080p * 65 )
	self:addElement( BackgroundRing )
	self.BackgroundRing = BackgroundRing
	
	local ThickRing = nil
	
	ThickRing = LUI.UIImage.new()
	ThickRing.id = "ThickRing"
	ThickRing:SetAlpha( 0.2, 0 )
	ThickRing:setImage( RegisterMaterial( "wdg_rewards_progressbar_whole" ), 0 )
	ThickRing:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 60, _1080p * -60, _1080p * 60 )
	self:addElement( ThickRing )
	self.ThickRing = ThickRing
	
	local ThinRing = nil
	
	ThinRing = LUI.UIImage.new()
	ThinRing.id = "ThinRing"
	ThinRing:SetAlpha( 0.4, 0 )
	ThinRing:setImage( RegisterMaterial( "wdg_circle_progressbar_back_center" ), 0 )
	ThinRing:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -65, _1080p * 65, _1080p * -65, _1080p * 65 )
	self:addElement( ThinRing )
	self.ThinRing = ThinRing
	
	local ProgressBar = nil
	
	ProgressBar = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 2,
		segmentMaterial = "challenges_progress_circle_segment",
		maskMaterial = "dpad_circle_mask",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f1_local1
	} )
	ProgressBar.id = "ProgressBar"
	ProgressBar:setImage( RegisterMaterial( "challenges_progress_circle_segment" ), 0 )
	ProgressBar:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -72, _1080p * 72, _1080p * -72, _1080p * 72 )
	ProgressBar:SubscribeToModelThroughElement( self, "rankPercentage", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.rankPercentage:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ProgressBar:SetProgress( f2_local0 )
		end
	end )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local Node = nil
	
	Node = LUI.UIImage.new()
	Node.id = "Node"
	Node:SetAlpha( 0.8, 0 )
	Node:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1, _1080p * 1, _1080p * -64, _1080p * -56 )
	self:addElement( Node )
	self.Node = Node
	
	local RankIcon = nil
	
	RankIcon = LUI.UIImage.new()
	RankIcon.id = "RankIcon"
	RankIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * 24, _1080p * -43, _1080p * 5 )
	RankIcon:SubscribeToModelThroughElement( self, "rankIcon", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.rankIcon:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			RankIcon:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local RankNumber = nil
	
	RankNumber = LUI.UIText.new()
	RankNumber.id = "RankNumber"
	RankNumber:SetFontSize( 28 * _1080p )
	RankNumber:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RankNumber:SetAlignment( LUI.Alignment.Center )
	RankNumber:SetOptOutRightToLeftAlignmentFlip( true )
	RankNumber:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -3, _1080p * 25 )
	RankNumber:SubscribeToModelThroughElement( self, "rankDisplay", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.rankDisplay:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			RankNumber:setText( f4_local0, 0 )
		end
	end )
	self:addElement( RankNumber )
	self.RankNumber = RankNumber
	
	local RankXPValue = nil
	
	RankXPValue = LUI.UIStyledText.new()
	RankXPValue.id = "RankXPValue"
	RankXPValue:SetFontSize( 36 * _1080p )
	RankXPValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RankXPValue:SetAlignment( LUI.Alignment.Left )
	RankXPValue:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 200, 0, _1080p * 36 )
	RankXPValue:SubscribeToModelThroughElement( self, "rankXPRequired", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.rankXPRequired:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			RankXPValue:setText( f5_local0, 0 )
		end
	end )
	self:addElement( RankXPValue )
	self.RankXPValue = RankXPValue
	
	local RankXPLabel = nil
	
	RankXPLabel = LUI.UIStyledText.new()
	RankXPLabel.id = "RankXPLabel"
	RankXPLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_AAR_XP_NEEDED" ) ), 0 )
	RankXPLabel:SetFontSize( 18 * _1080p )
	RankXPLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RankXPLabel:SetAlignment( LUI.Alignment.Left )
	RankXPLabel:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 200, _1080p * -18, 0 )
	self:addElement( RankXPLabel )
	self.RankXPLabel = RankXPLabel
	
	return self
end

MenuBuilder.registerType( "RankProgression", RankProgression )
LockTable( _M )
