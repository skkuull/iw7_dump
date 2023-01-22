local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ChallengeInfoBigProgress( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 521 * _1080p, 0, 716 * _1080p )
	self.id = "ChallengeInfoBigProgress"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TierLabel = nil
	
	TierLabel = LUI.UIText.new()
	TierLabel.id = "TierLabel"
	TierLabel:SetFontSize( 20 * _1080p )
	TierLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TierLabel:SetAlignment( LUI.Alignment.Left )
	TierLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 38, _1080p * 485.35, _1080p * 597.64, _1080p * 617.64 )
	TierLabel:SubscribeToModelThroughElement( self, "currentTierLabel", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.currentTierLabel:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			TierLabel:setText( f2_local0, 0 )
		end
	end )
	self:addElement( TierLabel )
	self.TierLabel = TierLabel
	
	local ProgressNumber = nil
	
	ProgressNumber = LUI.UIText.new()
	ProgressNumber.id = "ProgressNumber"
	ProgressNumber:SetFontSize( 26 * _1080p )
	ProgressNumber:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ProgressNumber:SetAlignment( LUI.Alignment.Right )
	ProgressNumber:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30, _1080p * 242.52, _1080p * 536, _1080p * 562 )
	ProgressNumber:SubscribeToModelThroughElement( self, "currentProgress", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.currentProgress:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			ProgressNumber:setText( f3_local0, 0 )
		end
	end )
	self:addElement( ProgressNumber )
	self.ProgressNumber = ProgressNumber
	
	local ProgressMax = nil
	
	ProgressMax = LUI.UIText.new()
	ProgressMax.id = "ProgressMax"
	ProgressMax:SetFontSize( 26 * _1080p )
	ProgressMax:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ProgressMax:SetAlignment( LUI.Alignment.Left )
	ProgressMax:SetOptOutRightToLeftAlignmentFlip( true )
	ProgressMax:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 263.52, _1080p * 489.48, _1080p * 536, _1080p * 562 )
	ProgressMax:SubscribeToModelThroughElement( self, "currentTierMax", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.currentTierMax:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			ProgressMax:setText( f4_local0, 0 )
		end
	end )
	self:addElement( ProgressMax )
	self.ProgressMax = ProgressMax
	
	local ProgressDivider = nil
	
	ProgressDivider = LUI.UIText.new()
	ProgressDivider.id = "ProgressDivider"
	ProgressDivider:SetRGBFromInt( 12566463, 0 )
	ProgressDivider:setText( "/", 0 )
	ProgressDivider:SetFontSize( 26 * _1080p )
	ProgressDivider:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ProgressDivider:SetAlignment( LUI.Alignment.Center )
	ProgressDivider:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 237.52, _1080p * 270.52, _1080p * 536, _1080p * 562 )
	self:addElement( ProgressDivider )
	self.ProgressDivider = ProgressDivider
	
	local RewardLabel = nil
	
	RewardLabel = LUI.UIStyledText.new()
	RewardLabel.id = "RewardLabel"
	RewardLabel:setText( Engine.Localize( "MENU_XP_REWARD" ), 0 )
	RewardLabel:SetFontSize( 20 * _1080p )
	RewardLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RewardLabel:SetAlignment( LUI.Alignment.Left )
	RewardLabel:SetStartupDelay( 1000 )
	RewardLabel:SetLineHoldTime( 500 )
	RewardLabel:SetAnimMoveTime( 500 )
	RewardLabel:SetEndDelay( 1000 )
	RewardLabel:SetCrossfadeTime( 500 )
	RewardLabel:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	RewardLabel:SetMaxVisibleLines( 1 )
	RewardLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 38, _1080p * 180, _1080p * 470, _1080p * 490 )
	self:addElement( RewardLabel )
	self.RewardLabel = RewardLabel
	
	local RewardValue = nil
	
	RewardValue = LUI.UIText.new()
	RewardValue.id = "RewardValue"
	RewardValue:SetFontSize( 20 * _1080p )
	RewardValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RewardValue:SetAlignment( LUI.Alignment.Right )
	RewardValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 156.71, _1080p * 231.69, _1080p * 470, _1080p * 490 )
	RewardValue:SubscribeToModelThroughElement( self, "currentTierXP", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.currentTierXP:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			RewardValue:setText( f5_local0, 0 )
		end
	end )
	self:addElement( RewardValue )
	self.RewardValue = RewardValue
	
	local ProgressBar = nil
	
	ProgressBar = MenuBuilder.BuildRegisteredType( "ChallengeInfoProgressBar", {
		controllerIndex = f1_local1
	} )
	ProgressBar.id = "ProgressBar"
	ProgressBar:SetDataSourceThroughElement( self, nil )
	ProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30, _1080p * 489.48, _1080p * 512, _1080p * 539.5 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local ChallengesTiers = nil
	
	ChallengesTiers = MenuBuilder.BuildRegisteredType( "ChallengesTiers", {
		controllerIndex = f1_local1
	} )
	ChallengesTiers.id = "ChallengesTiers"
	ChallengesTiers:SetDataSourceThroughElement( self, nil )
	ChallengesTiers:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1.65, _1080p * 509.99, _1080p * 607.64, _1080p * 691.64 )
	self:addElement( ChallengesTiers )
	self.ChallengesTiers = ChallengesTiers
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RewardLabel:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.RewardLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 113.98, _1080p * 242.52, _1080p * 470, _1080p * 490, 0 )
				end
			}
		} )
		RewardValue:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.RewardValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30, _1080p * 104.98, _1080p * 470, _1080p * 490, 0 )
				end
			}
		} )
		self._sequences.RightToLeft = function ()
			RewardLabel:AnimateSequence( "RightToLeft" )
			RewardValue:AnimateSequence( "RightToLeft" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ProgressBar:SetDataSourceThroughElement( self, nil )
	ChallengesTiers:SetDataSourceThroughElement( self, nil )
	if CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "RightToLeft" )
	end
	return self
end

MenuBuilder.registerType( "ChallengeInfoBigProgress", ChallengeInfoBigProgress )
LockTable( _M )
