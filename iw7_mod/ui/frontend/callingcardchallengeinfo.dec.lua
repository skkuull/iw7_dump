local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard"
f0_local1 = function ( f1_arg0, f1_arg1 )
	f1_arg0.SmallPlayerCard:SetDataSource( PlayercardUtils.GetFrontendDataSources( f0_local0, f1_arg1 ), f1_arg1 )
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.SmallPlayerCard )
	assert( f2_arg0.LootItemHeader )
	f0_local1( f2_arg0, f2_arg1 )
	if CONDITIONS.IsThirdGameMode( f2_arg0 ) then
		f2_arg0.CPScreen:SetMask( f2_arg0.CPScreenMask )
		if IsLanguageArabic() then
			f2_arg0.NameHeaderLeftBarCP:SetAlpha( 0, 0 )
			f2_arg0.VerticalBar:SetAlpha( 0, 0 )
		end
	end
	f2_arg0.LootItemHeader:SubscribeToModelThroughElement( f2_arg0, "quality", function ()
		local f3_local0 = f2_arg0:GetDataSource()
		f2_arg0.LootItemHeader:UpdateRarityInfo( f3_local0 )
		if f3_local0.quality:GetValue( f2_arg1 ) > Cac.LowestQuality then
			f2_arg0.LootItemHeader:SetAlpha( 1, 0 )
			if CONDITIONS.IsThirdGameMode( f2_arg0 ) then
				f2_arg0.ItemNameCP:SetAlpha( 0, 0 )
				f2_arg0.NameHeaderLeftBarCP:SetAlpha( 0, 0 )
			end
		else
			f2_arg0.LootItemHeader:SetAlpha( 0, 0 )
			if CONDITIONS.IsThirdGameMode( f2_arg0 ) then
				f2_arg0.ItemNameCP:SetAlpha( 1, 0 )
				f2_arg0.NameHeaderLeftBarCP:SetAlpha( 1, 0 )
			end
		end
	end )
end

function CallingCardChallengeInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 521 * _1080p, 0, 716 * _1080p )
	self.id = "CallingCardChallengeInfo"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local ListBlurCopy0 = nil
	
	ListBlurCopy0 = LUI.UIBlur.new()
	ListBlurCopy0.id = "ListBlurCopy0"
	ListBlurCopy0:SetBlurStrength( 1.5, 0 )
	ListBlurCopy0:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 524, 0 )
	self:addElement( ListBlurCopy0 )
	self.ListBlurCopy0 = ListBlurCopy0
	
	local GradientBackgroundInGameOnlyCopy0 = nil
	
	GradientBackgroundInGameOnlyCopy0 = LUI.UIImage.new()
	GradientBackgroundInGameOnlyCopy0.id = "GradientBackgroundInGameOnlyCopy0"
	GradientBackgroundInGameOnlyCopy0:SetRGBFromInt( 0, 0 )
	GradientBackgroundInGameOnlyCopy0:SetAlpha( 0.4, 0 )
	GradientBackgroundInGameOnlyCopy0:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 524, 0 )
	self:addElement( GradientBackgroundInGameOnlyCopy0 )
	self.GradientBackgroundInGameOnlyCopy0 = GradientBackgroundInGameOnlyCopy0
	
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetBlurStrength( 1.5, 0 )
	ListBlur:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -203 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local GradientBackgroundInGameOnly = nil
	
	GradientBackgroundInGameOnly = LUI.UIImage.new()
	GradientBackgroundInGameOnly.id = "GradientBackgroundInGameOnly"
	GradientBackgroundInGameOnly:SetRGBFromInt( 0, 0 )
	GradientBackgroundInGameOnly:SetAlpha( 0.4, 0 )
	GradientBackgroundInGameOnly:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -203 )
	self:addElement( GradientBackgroundInGameOnly )
	self.GradientBackgroundInGameOnly = GradientBackgroundInGameOnly
	
	local f4_local7 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local7 = LUI.UIImage.new()
		f4_local7.id = "GradBackroundCP"
		f4_local7:SetRGBFromInt( 0, 0 )
		f4_local7:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
		self:addElement( f4_local7 )
		self.GradBackroundCP = f4_local7
	end
	local f4_local8 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local8 = LUI.UIImage.new()
		f4_local8.id = "CPScreen"
		f4_local8:SetAlpha( 0.6, 0 )
		f4_local8:setImage( RegisterMaterial( "cp_faf_card_screen_backing_grad" ), 0 )
		f4_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -188, _1080p * 818, _1080p * 285, _1080p * 521 )
		self:addElement( f4_local8 )
		self.CPScreen = f4_local8
	end
	local f4_local9 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local9 = LUI.UIImage.new()
		f4_local9.id = "CPScreenMask"
		f4_local9:setImage( RegisterMaterial( "widg_gradient_bottom_to_top_opaque_dark" ), 0 )
		f4_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -188, _1080p * 818, _1080p * 285, _1080p * 521 )
		self:addElement( f4_local9 )
		self.CPScreenMask = f4_local9
	end
	local TicBRCopy4 = nil
	
	TicBRCopy4 = LUI.UIImage.new()
	TicBRCopy4.id = "TicBRCopy4"
	TicBRCopy4:SetAlpha( 0.8, 0 )
	TicBRCopy4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 15, _1080p * 1, _1080p * 4 )
	self:addElement( TicBRCopy4 )
	self.TicBRCopy4 = TicBRCopy4
	
	local TicBRCopy3 = nil
	
	TicBRCopy3 = LUI.UIImage.new()
	TicBRCopy3.id = "TicBRCopy3"
	TicBRCopy3:SetAlpha( 0.8, 0 )
	TicBRCopy3:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1, _1080p * 15, _1080p * -207.5, _1080p * -204.5 )
	self:addElement( TicBRCopy3 )
	self.TicBRCopy3 = TicBRCopy3
	
	local TicBRCopy2 = nil
	
	TicBRCopy2 = LUI.UIImage.new()
	TicBRCopy2.id = "TicBRCopy2"
	TicBRCopy2:SetAlpha( 0.8, 0 )
	TicBRCopy2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -15, _1080p * -1, _1080p * 1, _1080p * 4 )
	self:addElement( TicBRCopy2 )
	self.TicBRCopy2 = TicBRCopy2
	
	local TicBRCopy1 = nil
	
	TicBRCopy1 = LUI.UIImage.new()
	TicBRCopy1.id = "TicBRCopy1"
	TicBRCopy1:SetAlpha( 0.8, 0 )
	TicBRCopy1:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -15, _1080p * -1, _1080p * -207.5, _1080p * -204.5 )
	self:addElement( TicBRCopy1 )
	self.TicBRCopy1 = TicBRCopy1
	
	local ProgressBar = nil
	
	ProgressBar = MenuBuilder.BuildRegisteredType( "ChallengeInfoProgressBar", {
		controllerIndex = f4_local1
	} )
	ProgressBar.id = "ProgressBar"
	ProgressBar:SetDataSourceThroughElement( self, "challengeInfo" )
	ProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 27, _1080p * 487, _1080p * 366, _1080p * 393 )
	ProgressBar:SubscribeToModelThroughElement( self, "challengeInfoAlpha", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.challengeInfoAlpha:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			ProgressBar:SetAlpha( f5_local0, 0 )
		end
	end )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local blackCopy0 = nil
	
	blackCopy0 = LUI.UIImage.new()
	blackCopy0.id = "blackCopy0"
	blackCopy0:SetRGBFromInt( 0, 0 )
	blackCopy0:SetAlpha( 0.5, 0 )
	blackCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 504, _1080p * 212, _1080p * 251 )
	self:addElement( blackCopy0 )
	self.blackCopy0 = blackCopy0
	
	local Description = nil
	
	Description = LUI.UIStyledText.new()
	Description.id = "Description"
	Description:SetFontSize( 20 * _1080p )
	Description:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Description:SetAlignment( LUI.Alignment.Left )
	Description:SetDecodeLetterLength( 5 )
	Description:SetDecodeMaxRandChars( 3 )
	Description:SetDecodeUpdatesPerLetter( 4 )
	Description:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 38, _1080p * 492, _1080p * 259, _1080p * 279 )
	Description:SubscribeToModelThroughElement( self, "challengeInfoAlpha", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.challengeInfoAlpha:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			Description:SetAlpha( f6_local0, 0 )
		end
	end )
	Description:SubscribeToModelThroughElement( self, "challengeInfo.desc", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.challengeInfo.desc:GetValue( f4_local1 )
		if f7_local0 ~= nil then
			Description:setText( f7_local0, 0 )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local TierLabel = nil
	
	TierLabel = LUI.UIText.new()
	TierLabel.id = "TierLabel"
	TierLabel:SetFontSize( 20 * _1080p )
	TierLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TierLabel:SetAlignment( LUI.Alignment.Left )
	TierLabel:SetOptOutRightToLeftAlignmentFlip( true )
	TierLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 37, _1080p * 491, _1080p * 414, _1080p * 434 )
	TierLabel:SubscribeToModelThroughElement( self, "challengeInfoAlpha", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.challengeInfoAlpha:GetValue( f4_local1 )
		if f8_local0 ~= nil then
			TierLabel:SetAlpha( f8_local0, 0 )
		end
	end )
	TierLabel:SubscribeToModelThroughElement( self, "challengeInfo.currentTierLabel", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.challengeInfo.currentTierLabel:GetValue( f4_local1 )
		if f9_local0 ~= nil then
			TierLabel:setText( f9_local0, 0 )
		end
	end )
	self:addElement( TierLabel )
	self.TierLabel = TierLabel
	
	local ProgressNumber = nil
	
	ProgressNumber = LUI.UIText.new()
	ProgressNumber.id = "ProgressNumber"
	ProgressNumber:SetFontSize( 24 * _1080p )
	ProgressNumber:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ProgressNumber:SetAlignment( LUI.Alignment.Right )
	ProgressNumber:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 27, _1080p * 239.5, _1080p * 395, _1080p * 419 )
	ProgressNumber:SubscribeToModelThroughElement( self, "challengeInfoAlpha", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.challengeInfoAlpha:GetValue( f4_local1 )
		if f10_local0 ~= nil then
			ProgressNumber:SetAlpha( f10_local0, 0 )
		end
	end )
	ProgressNumber:SubscribeToModelThroughElement( self, "challengeInfo.currentProgress", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.challengeInfo.currentProgress:GetValue( f4_local1 )
		if f11_local0 ~= nil then
			ProgressNumber:setText( f11_local0, 0 )
		end
	end )
	self:addElement( ProgressNumber )
	self.ProgressNumber = ProgressNumber
	
	local ProgressMax = nil
	
	ProgressMax = LUI.UIText.new()
	ProgressMax.id = "ProgressMax"
	ProgressMax:SetRGBFromInt( 12566463, 0 )
	ProgressMax:SetFontSize( 24 * _1080p )
	ProgressMax:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	ProgressMax:SetAlignment( LUI.Alignment.Left )
	ProgressMax:SetOptOutRightToLeftAlignmentFlip( true )
	ProgressMax:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.5, _1080p * 487, _1080p * 395, _1080p * 419 )
	ProgressMax:SubscribeToModelThroughElement( self, "challengeInfoAlpha", function ()
		local f12_local0 = self:GetDataSource()
		f12_local0 = f12_local0.challengeInfoAlpha:GetValue( f4_local1 )
		if f12_local0 ~= nil then
			ProgressMax:SetAlpha( f12_local0, 0 )
		end
	end )
	ProgressMax:SubscribeToModelThroughElement( self, "challengeInfo.currentTierMax", function ()
		local f13_local0 = self:GetDataSource()
		f13_local0 = f13_local0.challengeInfo.currentTierMax:GetValue( f4_local1 )
		if f13_local0 ~= nil then
			ProgressMax:setText( f13_local0, 0 )
		end
	end )
	self:addElement( ProgressMax )
	self.ProgressMax = ProgressMax
	
	local ProgressDivider = nil
	
	ProgressDivider = LUI.UIText.new()
	ProgressDivider.id = "ProgressDivider"
	ProgressDivider:SetRGBFromInt( 12566463, 0 )
	ProgressDivider:setText( "/", 0 )
	ProgressDivider:SetFontSize( 24 * _1080p )
	ProgressDivider:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	ProgressDivider:SetAlignment( LUI.Alignment.Center )
	ProgressDivider:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 234.5, _1080p * 270.5, _1080p * 395, _1080p * 419 )
	ProgressDivider:SubscribeToModelThroughElement( self, "challengeInfoAlpha", function ()
		local f14_local0 = self:GetDataSource()
		f14_local0 = f14_local0.challengeInfoAlpha:GetValue( f4_local1 )
		if f14_local0 ~= nil then
			ProgressDivider:SetAlpha( f14_local0, 0 )
		end
	end )
	self:addElement( ProgressDivider )
	self.ProgressDivider = ProgressDivider
	
	local RewardValue = nil
	
	RewardValue = LUI.UIText.new()
	RewardValue.id = "RewardValue"
	RewardValue:SetFontSize( 20 * _1080p )
	RewardValue:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RewardValue:SetAlignment( LUI.Alignment.Right )
	RewardValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.5, _1080p * 240.5, _1080p * 336, _1080p * 356 )
	RewardValue:SubscribeToModelThroughElement( self, "challengeInfoAlpha", function ()
		local f15_local0 = self:GetDataSource()
		f15_local0 = f15_local0.challengeInfoAlpha:GetValue( f4_local1 )
		if f15_local0 ~= nil then
			RewardValue:SetAlpha( f15_local0, 0 )
		end
	end )
	RewardValue:SubscribeToModelThroughElement( self, "challengeInfo.currentTierXP", function ()
		local f16_local0 = self:GetDataSource()
		f16_local0 = f16_local0.challengeInfo.currentTierXP:GetValue( f4_local1 )
		if f16_local0 ~= nil then
			RewardValue:setText( f16_local0, 0 )
		end
	end )
	self:addElement( RewardValue )
	self.RewardValue = RewardValue
	
	local RewardLabel = nil
	
	RewardLabel = LUI.UIText.new()
	RewardLabel.id = "RewardLabel"
	RewardLabel:SetRGBFromInt( 13816530, 0 )
	RewardLabel:setText( Engine.Localize( "MENU_XP_REWARD" ), 0 )
	RewardLabel:SetFontSize( 20 * _1080p )
	RewardLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RewardLabel:SetAlignment( LUI.Alignment.Left )
	RewardLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 38, _1080p * 174.5, _1080p * 336, _1080p * 356 )
	RewardLabel:SubscribeToModelThroughElement( self, "challengeInfoAlpha", function ()
		local f17_local0 = self:GetDataSource()
		f17_local0 = f17_local0.challengeInfoAlpha:GetValue( f4_local1 )
		if f17_local0 ~= nil then
			RewardLabel:SetAlpha( f17_local0, 0 )
		end
	end )
	self:addElement( RewardLabel )
	self.RewardLabel = RewardLabel
	
	local ScoreValue = nil
	
	ScoreValue = LUI.UIText.new()
	ScoreValue.id = "ScoreValue"
	ScoreValue:SetFontSize( 20 * _1080p )
	ScoreValue:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ScoreValue:SetAlignment( LUI.Alignment.Right )
	ScoreValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 396, _1080p * 478, _1080p * 336, _1080p * 356 )
	ScoreValue:SubscribeToModelThroughElement( self, "challengeInfoAlpha", function ()
		local f18_local0 = self:GetDataSource()
		f18_local0 = f18_local0.challengeInfoAlpha:GetValue( f4_local1 )
		if f18_local0 ~= nil then
			ScoreValue:SetAlpha( f18_local0, 0 )
		end
	end )
	ScoreValue:SubscribeToModelThroughElement( self, "challengeInfo.currentTierScore", function ()
		local f19_local0 = self:GetDataSource()
		f19_local0 = f19_local0.challengeInfo.currentTierScore:GetValue( f4_local1 )
		if f19_local0 ~= nil then
			ScoreValue:setText( f19_local0, 0 )
		end
	end )
	self:addElement( ScoreValue )
	self.ScoreValue = ScoreValue
	
	local ScoreLabel = nil
	
	ScoreLabel = LUI.UIStyledText.new()
	ScoreLabel.id = "ScoreLabel"
	ScoreLabel:SetRGBFromInt( 13816530, 0 )
	ScoreLabel:setText( Engine.Localize( "LUA_MENU_CHALLENGE_SCORE" ), 0 )
	ScoreLabel:SetFontSize( 20 * _1080p )
	ScoreLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ScoreLabel:SetAlignment( LUI.Alignment.Left )
	ScoreLabel:SetStartupDelay( 1000 )
	ScoreLabel:SetLineHoldTime( 500 )
	ScoreLabel:SetAnimMoveTime( 300 )
	ScoreLabel:SetEndDelay( 1000 )
	ScoreLabel:SetCrossfadeTime( 400 )
	ScoreLabel:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	ScoreLabel:SetMaxVisibleLines( 1 )
	ScoreLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 264.01, _1080p * 429, _1080p * 336, _1080p * 356 )
	ScoreLabel:SubscribeToModelThroughElement( self, "challengeInfoAlpha", function ()
		local f20_local0 = self:GetDataSource()
		f20_local0 = f20_local0.challengeInfoAlpha:GetValue( f4_local1 )
		if f20_local0 ~= nil then
			ScoreLabel:SetAlpha( f20_local0, 0 )
		end
	end )
	self:addElement( ScoreLabel )
	self.ScoreLabel = ScoreLabel
	
	local PlayerCardEarnedInfo = nil
	
	PlayerCardEarnedInfo = LUI.UIText.new()
	PlayerCardEarnedInfo.id = "PlayerCardEarnedInfo"
	PlayerCardEarnedInfo:SetRGBFromInt( 13816530, 0 )
	PlayerCardEarnedInfo:setText( Engine.Localize( "LUA_MENU_PLAYER_CARD_EARNED" ), 0 )
	PlayerCardEarnedInfo:SetFontSize( 18 * _1080p )
	PlayerCardEarnedInfo:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	PlayerCardEarnedInfo:SetAlignment( LUI.Alignment.Right )
	PlayerCardEarnedInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 22, _1080p * 487, _1080p * 490, _1080p * 508 )
	PlayerCardEarnedInfo:SubscribeToModelThroughElement( self, "challengeInfoAlpha", function ()
		local f21_local0 = self:GetDataSource()
		f21_local0 = f21_local0.challengeInfoAlpha:GetValue( f4_local1 )
		if f21_local0 ~= nil then
			PlayerCardEarnedInfo:SetAlpha( f21_local0, 0 )
		end
	end )
	self:addElement( PlayerCardEarnedInfo )
	self.PlayerCardEarnedInfo = PlayerCardEarnedInfo
	
	local HighlightedCallingCard = nil
	
	HighlightedCallingCard = MenuBuilder.BuildRegisteredType( "CallingCardImage", {
		controllerIndex = f4_local1
	} )
	HighlightedCallingCard.id = "HighlightedCallingCard"
	HighlightedCallingCard:SetDataSourceThroughElement( self, nil )
	HighlightedCallingCard:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * -16, _1080p * 14, _1080p * 205 )
	HighlightedCallingCard:SubscribeToModelThroughElement( self, "texture", function ()
		local f22_local0 = self:GetDataSource()
		f22_local0 = f22_local0.texture:GetValue( f4_local1 )
		if f22_local0 ~= nil then
			HighlightedCallingCard.CallingCardTexture:setImage( RegisterMaterial( f22_local0 ), 0 )
		end
	end )
	self:addElement( HighlightedCallingCard )
	self.HighlightedCallingCard = HighlightedCallingCard
	
	local f4_local27 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local27 = LUI.UIStyledText.new()
		f4_local27.id = "ItemName"
		f4_local27:SetAlpha( 0.8, 0 )
		f4_local27:SetFontSize( 34 * _1080p )
		f4_local27:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f4_local27:SetAlignment( LUI.Alignment.Left )
		f4_local27:SetStartupDelay( 1250 )
		f4_local27:SetLineHoldTime( 500 )
		f4_local27:SetAnimMoveTime( 500 )
		f4_local27:SetEndDelay( 1000 )
		f4_local27:SetCrossfadeTime( 500 )
		f4_local27:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
		f4_local27:SetMaxVisibleLines( 1 )
		f4_local27:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 27, _1080p * 499, _1080p * 215, _1080p * 249 )
		f4_local27:SubscribeToModelThroughElement( self, "challengeInfo.name", function ()
			local f23_local0 = self:GetDataSource()
			f23_local0 = f23_local0.challengeInfo.name:GetValue( f4_local1 )
			if f23_local0 ~= nil then
				f4_local27:setText( LocalizeString( f23_local0 ), 0 )
			end
		end )
		self:addElement( f4_local27 )
		self.ItemName = f4_local27
	end
	local f4_local28 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local28 = LUI.UIImage.new()
		f4_local28.id = "NameHeaderLeftBarCP"
		f4_local28:SetAlpha( 0.3, 0 )
		f4_local28:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 22, _1080p * 218, _1080p * 280 )
		self:addElement( f4_local28 )
		self.NameHeaderLeftBarCP = f4_local28
	end
	local f4_local29 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local29 = LUI.UIStyledText.new()
		f4_local29.id = "ItemNameCP"
		f4_local29:SetFontSize( 50 * _1080p )
		f4_local29:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
		f4_local29:SetAlignment( LUI.Alignment.Left )
		f4_local29:SetStartupDelay( 1250 )
		f4_local29:SetLineHoldTime( 500 )
		f4_local29:SetAnimMoveTime( 500 )
		f4_local29:SetEndDelay( 1000 )
		f4_local29:SetCrossfadeTime( 500 )
		f4_local29:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
		f4_local29:SetMaxVisibleLines( 1 )
		f4_local29:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32, _1080p * 500, _1080p * 229, _1080p * 279 )
		f4_local29:SubscribeToModelThroughElement( self, "challengeInfo.name", function ()
			local f24_local0 = self:GetDataSource()
			f24_local0 = f24_local0.challengeInfo.name:GetValue( f4_local1 )
			if f24_local0 ~= nil then
				f4_local29:setText( ToUpperCase( LocalizeString( f24_local0 ) ), 0 )
			end
		end )
		self:addElement( f4_local29 )
		self.ItemNameCP = f4_local29
	end
	local CurrentCard = nil
	
	CurrentCard = LUI.UIStyledText.new()
	CurrentCard.id = "CurrentCard"
	CurrentCard:setText( Engine.Localize( "LUA_MENU_MP_CURRENT_PLAYERCARD" ), 0 )
	CurrentCard:SetFontSize( 20 * _1080p )
	CurrentCard:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CurrentCard:SetAlignment( LUI.Alignment.Left )
	CurrentCard:SetOptOutRightToLeftAlignmentFlip( true )
	CurrentCard:SetShadowMinDistance( -0.2, 0 )
	CurrentCard:SetShadowMaxDistance( 0.2, 0 )
	CurrentCard:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 38, _1080p * 491, _1080p * -177.5, _1080p * -157.5 )
	self:addElement( CurrentCard )
	self.CurrentCard = CurrentCard
	
	local VerticalBar = nil
	
	VerticalBar = LUI.UIImage.new()
	VerticalBar.id = "VerticalBar"
	VerticalBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 27, _1080p * 31, _1080p * 257, _1080p * 279 )
	VerticalBar:SubscribeToModelThroughElement( self, "challengeInfoAlpha", function ()
		local f25_local0 = self:GetDataSource()
		f25_local0 = f25_local0.challengeInfoAlpha:GetValue( f4_local1 )
		if f25_local0 ~= nil then
			VerticalBar:SetAlpha( f25_local0, 0 )
		end
	end )
	self:addElement( VerticalBar )
	self.VerticalBar = VerticalBar
	
	local VerticalBarCopy0 = nil
	
	VerticalBarCopy0 = LUI.UIImage.new()
	VerticalBarCopy0.id = "VerticalBarCopy0"
	VerticalBarCopy0:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 27, _1080p * 31, _1080p * -178.5, _1080p * -156.5 )
	self:addElement( VerticalBarCopy0 )
	self.VerticalBarCopy0 = VerticalBarCopy0
	
	local ChallengesTiers = nil
	
	ChallengesTiers = MenuBuilder.BuildRegisteredType( "ChallengesTiers", {
		controllerIndex = f4_local1
	} )
	ChallengesTiers.id = "ChallengesTiers"
	ChallengesTiers:SetDataSourceThroughElement( self, "challengeInfo" )
	ChallengesTiers:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5.64, _1080p * 506, _1080p * 421, _1080p * 505 )
	ChallengesTiers:SubscribeToModelThroughElement( self, "challengeInfoAlpha", function ()
		local f26_local0 = self:GetDataSource()
		f26_local0 = f26_local0.challengeInfoAlpha:GetValue( f4_local1 )
		if f26_local0 ~= nil then
			ChallengesTiers:SetAlpha( f26_local0, 0 )
		end
	end )
	self:addElement( ChallengesTiers )
	self.ChallengesTiers = ChallengesTiers
	
	local TicBRCopy5 = nil
	
	TicBRCopy5 = LUI.UIImage.new()
	TicBRCopy5.id = "TicBRCopy5"
	TicBRCopy5:SetAlpha( 0.8, 0 )
	TicBRCopy5:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1, _1080p * 15, _1080p * -190.5, _1080p * -187.5 )
	self:addElement( TicBRCopy5 )
	self.TicBRCopy5 = TicBRCopy5
	
	local TicBRCopy6 = nil
	
	TicBRCopy6 = LUI.UIImage.new()
	TicBRCopy6.id = "TicBRCopy6"
	TicBRCopy6:SetAlpha( 0.8, 0 )
	TicBRCopy6:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -15, _1080p * -1, _1080p * -190.5, _1080p * -187.5 )
	self:addElement( TicBRCopy6 )
	self.TicBRCopy6 = TicBRCopy6
	
	local TicBRCopy7 = nil
	
	TicBRCopy7 = LUI.UIImage.new()
	TicBRCopy7.id = "TicBRCopy7"
	TicBRCopy7:SetAlpha( 0.8, 0 )
	TicBRCopy7:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1, _1080p * 15, _1080p * -4.5, _1080p * -1.5 )
	self:addElement( TicBRCopy7 )
	self.TicBRCopy7 = TicBRCopy7
	
	local TicBRCopy8 = nil
	
	TicBRCopy8 = LUI.UIImage.new()
	TicBRCopy8.id = "TicBRCopy8"
	TicBRCopy8:SetAlpha( 0.8, 0 )
	TicBRCopy8:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -15, _1080p * -1, _1080p * -4.5, _1080p * -1.5 )
	self:addElement( TicBRCopy8 )
	self.TicBRCopy8 = TicBRCopy8
	
	local line = nil
	
	line = LUI.UIImage.new()
	line.id = "line"
	line:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 252.18, _1080p * 253.18, _1080p * 336, _1080p * 356 )
	line:SubscribeToModelThroughElement( self, "challengeInfoAlpha", function ()
		local f27_local0 = self:GetDataSource()
		f27_local0 = f27_local0.challengeInfoAlpha:GetValue( f4_local1 )
		if f27_local0 ~= nil then
			line:SetAlpha( f27_local0, 0 )
		end
	end )
	self:addElement( line )
	self.line = line
	
	local CompletedLabelBg = nil
	
	CompletedLabelBg = LUI.UIImage.new()
	CompletedLabelBg.id = "CompletedLabelBg"
	CompletedLabelBg:SetRGBFromInt( 0, 0 )
	CompletedLabelBg:SetAlpha( 0, 0 )
	CompletedLabelBg:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	CompletedLabelBg:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 506, _1080p * 177, _1080p * 205 )
	self:addElement( CompletedLabelBg )
	self.CompletedLabelBg = CompletedLabelBg
	
	local CompletedLabel = nil
	
	CompletedLabel = LUI.UIText.new()
	CompletedLabel.id = "CompletedLabel"
	CompletedLabel:SetRGBFromTable( SWATCHES.Reticles.Highlight, 0 )
	CompletedLabel:SetAlpha( 0, 0 )
	CompletedLabel:setText( Engine.Localize( "MENU_UNLOCKED" ), 0 )
	CompletedLabel:SetFontSize( 20 * _1080p )
	CompletedLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CompletedLabel:SetAlignment( LUI.Alignment.Left )
	CompletedLabel:SetOptOutRightToLeftAlignmentFlip( true )
	CompletedLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 27, _1080p * 482, _1080p * 181, _1080p * 201 )
	self:addElement( CompletedLabel )
	self.CompletedLabel = CompletedLabel
	
	local SmallPlayerCard = nil
	
	SmallPlayerCard = MenuBuilder.BuildRegisteredType( "SmallPlayerCard", {
		controllerIndex = f4_local1
	} )
	SmallPlayerCard.id = "SmallPlayerCard"
	SmallPlayerCard:SetScale( 0.12, 0 )
	SmallPlayerCard:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -209.5, _1080p * 208.5, _1080p * -144, _1080p * -25 )
	self:addElement( SmallPlayerCard )
	self.SmallPlayerCard = SmallPlayerCard
	
	local LootItemHeader = nil
	
	LootItemHeader = MenuBuilder.BuildRegisteredType( "CACSmallItemHeader", {
		controllerIndex = f4_local1
	} )
	LootItemHeader.id = "LootItemHeader"
	LootItemHeader.ItemName:setText( Engine.Localize( "MENU_NEW" ), 0 )
	LootItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LootItemHeader:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 520, _1080p * 210, _1080p * 310 )
	self:addElement( LootItemHeader )
	self.LootItemHeader = LootItemHeader
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CompletedLabelBg:RegisterAnimationSequence( "ShowCompletedStatus", {
			{
				function ()
					return self.CompletedLabelBg:SetAlpha( 0, 0 )
				end
			}
		} )
		CompletedLabel:RegisterAnimationSequence( "ShowCompletedStatus", {
			{
				function ()
					return self.CompletedLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ShowCompletedStatus = function ()
			CompletedLabelBg:AnimateSequence( "ShowCompletedStatus" )
			CompletedLabel:AnimateSequence( "ShowCompletedStatus" )
		end
		
		ListBlurCopy0:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.ListBlurCopy0:SetAlpha( 0, 0 )
				end
			}
		} )
		GradientBackgroundInGameOnlyCopy0:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.GradientBackgroundInGameOnlyCopy0:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.GradientBackgroundInGameOnlyCopy0:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.GradientBackgroundInGameOnlyCopy0:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 534, 0, 0 )
				end
			}
		} )
		ListBlur:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.ListBlur:SetAlpha( 0, 0 )
				end
			}
		} )
		GradientBackgroundInGameOnly:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.GradientBackgroundInGameOnly:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.GradientBackgroundInGameOnly:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.GradientBackgroundInGameOnly:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -193, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f4_local7:RegisterAnimationSequence( "CPDefault", {
				{
					function ()
						return self.GradBackroundCP:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
					end
				}
			} )
		end
		TicBRCopy4:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.TicBRCopy4:SetAlpha( 0, 0 )
				end
			}
		} )
		TicBRCopy3:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.TicBRCopy3:SetAlpha( 0, 0 )
				end
			}
		} )
		TicBRCopy2:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.TicBRCopy2:SetAlpha( 0, 0 )
				end
			}
		} )
		TicBRCopy1:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.TicBRCopy1:SetAlpha( 0, 0 )
				end
			}
		} )
		ProgressBar:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.ProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 27, _1080p * 487, _1080p * 385, _1080p * 412, 0 )
				end
			}
		} )
		blackCopy0:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.blackCopy0:SetAlpha( 0.1, 0 )
				end
			},
			{
				function ()
					return self.blackCopy0:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.blackCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 521, _1080p * 218, _1080p * 280, 0 )
				end
			}
		} )
		Description:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.Description:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 33, _1080p * 504, _1080p * 288, _1080p * 308, 0 )
				end
			}
		} )
		TierLabel:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.TierLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 37, _1080p * 491, _1080p * 429, _1080p * 449, 0 )
				end
			}
		} )
		ProgressNumber:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.ProgressNumber:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 27, _1080p * 239.5, _1080p * 414, _1080p * 438, 0 )
				end
			}
		} )
		ProgressMax:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.ProgressMax:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.5, _1080p * 487, _1080p * 414, _1080p * 438, 0 )
				end
			}
		} )
		ProgressDivider:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.ProgressDivider:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 226.5, _1080p * 278.5, _1080p * 414, _1080p * 438, 0 )
				end
			}
		} )
		RewardValue:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.RewardValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.5, _1080p * 240.5, _1080p * 360, _1080p * 380, 0 )
				end
			}
		} )
		RewardLabel:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.RewardLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 38, _1080p * 174.5, _1080p * 360, _1080p * 380, 0 )
				end
			}
		} )
		ScoreValue:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.ScoreValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 396, _1080p * 478, _1080p * 360, _1080p * 380, 0 )
				end
			}
		} )
		ScoreLabel:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.ScoreLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 264.01, _1080p * 429, _1080p * 360, _1080p * 380, 0 )
				end
			}
		} )
		PlayerCardEarnedInfo:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.PlayerCardEarnedInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 22, _1080p * 487, _1080p * 500, _1080p * 518, 0 )
				end
			}
		} )
		VerticalBar:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.VerticalBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 21, _1080p * 291, _1080p * 305, 0 )
				end
			}
		} )
		ChallengesTiers:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.ChallengesTiers:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5.64, _1080p * 506, _1080p * 436, _1080p * 520, 0 )
				end
			}
		} )
		TicBRCopy5:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.TicBRCopy5:SetAlpha( 0, 0 )
				end
			}
		} )
		TicBRCopy6:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.TicBRCopy6:SetAlpha( 0, 0 )
				end
			}
		} )
		TicBRCopy7:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.TicBRCopy7:SetAlpha( 0, 0 )
				end
			}
		} )
		TicBRCopy8:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.TicBRCopy8:SetAlpha( 0, 0 )
				end
			}
		} )
		line:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.line:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 252.18, _1080p * 253.18, _1080p * 355, _1080p * 375, 0 )
				end
			}
		} )
		SmallPlayerCard:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.SmallPlayerCard:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -209.5, _1080p * 208.5, _1080p * -140, _1080p * -21, 0 )
				end
			}
		} )
		self._sequences.CPDefault = function ()
			ListBlurCopy0:AnimateSequence( "CPDefault" )
			GradientBackgroundInGameOnlyCopy0:AnimateSequence( "CPDefault" )
			ListBlur:AnimateSequence( "CPDefault" )
			GradientBackgroundInGameOnly:AnimateSequence( "CPDefault" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f4_local7:AnimateSequence( "CPDefault" )
			end
			TicBRCopy4:AnimateSequence( "CPDefault" )
			TicBRCopy3:AnimateSequence( "CPDefault" )
			TicBRCopy2:AnimateSequence( "CPDefault" )
			TicBRCopy1:AnimateSequence( "CPDefault" )
			ProgressBar:AnimateSequence( "CPDefault" )
			blackCopy0:AnimateSequence( "CPDefault" )
			Description:AnimateSequence( "CPDefault" )
			TierLabel:AnimateSequence( "CPDefault" )
			ProgressNumber:AnimateSequence( "CPDefault" )
			ProgressMax:AnimateSequence( "CPDefault" )
			ProgressDivider:AnimateSequence( "CPDefault" )
			RewardValue:AnimateSequence( "CPDefault" )
			RewardLabel:AnimateSequence( "CPDefault" )
			ScoreValue:AnimateSequence( "CPDefault" )
			ScoreLabel:AnimateSequence( "CPDefault" )
			PlayerCardEarnedInfo:AnimateSequence( "CPDefault" )
			VerticalBar:AnimateSequence( "CPDefault" )
			ChallengesTiers:AnimateSequence( "CPDefault" )
			TicBRCopy5:AnimateSequence( "CPDefault" )
			TicBRCopy6:AnimateSequence( "CPDefault" )
			TicBRCopy7:AnimateSequence( "CPDefault" )
			TicBRCopy8:AnimateSequence( "CPDefault" )
			line:AnimateSequence( "CPDefault" )
			SmallPlayerCard:AnimateSequence( "CPDefault" )
		end
		
		CompletedLabelBg:RegisterAnimationSequence( "HideCompletedStatus", {
			{
				function ()
					return self.CompletedLabelBg:SetAlpha( 0, 0 )
				end
			}
		} )
		CompletedLabel:RegisterAnimationSequence( "HideCompletedStatus", {
			{
				function ()
					return self.CompletedLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideCompletedStatus = function ()
			CompletedLabelBg:AnimateSequence( "HideCompletedStatus" )
			CompletedLabel:AnimateSequence( "HideCompletedStatus" )
		end
		
		RewardValue:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.RewardValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 27, _1080p * 87, _1080p * 336, _1080p * 356, 0 )
				end
			}
		} )
		RewardLabel:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.RewardLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 98, _1080p * 234.5, _1080p * 336, _1080p * 356, 0 )
				end
			}
		} )
		ScoreValue:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.ScoreValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 264.01, _1080p * 346.01, _1080p * 336, _1080p * 356, 0 )
				end
			}
		} )
		ScoreLabel:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.ScoreLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 348.01, _1080p * 487, _1080p * 336, _1080p * 356, 0 )
				end
			}
		} )
		self._sequences.RightToLeft = function ()
			RewardValue:AnimateSequence( "RightToLeft" )
			RewardLabel:AnimateSequence( "RightToLeft" )
			ScoreValue:AnimateSequence( "RightToLeft" )
			ScoreLabel:AnimateSequence( "RightToLeft" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ProgressBar:SetDataSourceThroughElement( self, "challengeInfo" )
	HighlightedCallingCard:SetDataSourceThroughElement( self, nil )
	ChallengesTiers:SetDataSourceThroughElement( self, "challengeInfo" )
	local f4_local43 = function ()
		local f77_local0 = self:GetDataSource()
		if f77_local0.challengeInfo.isCompletedAlpha:GetValue( f4_local1 ) ~= nil then
			f77_local0 = self:GetDataSource()
			if f77_local0.challengeInfo.isCompletedAlpha:GetValue( f4_local1 ) > 0 then
				ACTIONS.AnimateSequence( self, "ShowCompletedStatus" )
			end
		end
		f77_local0 = self:GetDataSource()
		if f77_local0.challengeInfo.isCompletedAlpha:GetValue( f4_local1 ) ~= nil then
			f77_local0 = self:GetDataSource()
			if f77_local0.challengeInfo.isCompletedAlpha:GetValue( f4_local1 ) == 0 then
				ACTIONS.AnimateSequence( self, "HideCompletedStatus" )
			end
		end
	end
	
	self:SubscribeToModelThroughElement( self, "challengeInfo.isCompletedAlpha", f4_local43 )
	self:SubscribeToModelThroughElement( self, "challengeInfo.name", f4_local43 )
	PostLoadFunc( self, f4_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPDefault" )
	end
	if CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "RightToLeft" )
	end
	return self
end

MenuBuilder.registerType( "CallingCardChallengeInfo", CallingCardChallengeInfo )
LockTable( _M )
