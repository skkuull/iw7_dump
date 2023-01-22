local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0 )
	f1_arg0.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	f1_arg0:SetAlignment( LUI.Alignment.Middle )
	f1_arg0:SetAdjustSizeToContent( true )
	f1_arg0:SetIgnoreStretchingChildren( true )
end

function MissionPopupRewardsWrapper( menu, controller )
	local self = LUI.UIVerticalStackedLayout.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 450 * _1080p, 0, 156 * _1080p )
	self.id = "MissionPopupRewardsWrapper"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	self:SetSpacing( 4 * _1080p )
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 3355443, 0 )
	Background:setImage( RegisterMaterial( "ops_map_scr_gradient_1" ), 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 160 )
	self:addElement( Background )
	self.Background = Background
	
	local RewardsTitle = nil
	
	RewardsTitle = LUI.UIText.new()
	RewardsTitle.id = "RewardsTitle"
	RewardsTitle:SetRGBFromTable( SWATCHES.OpsMap.subtitle, 0 )
	RewardsTitle:setText( Engine.Localize( "MENU_SP_REWARDS" ), 0 )
	RewardsTitle:SetFontSize( 22 * _1080p )
	RewardsTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RewardsTitle:SetAlignment( LUI.Alignment.Left )
	RewardsTitle:SetOptOutRightToLeftAlignmentFlip( true )
	RewardsTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 164, _1080p * 186 )
	self:addElement( RewardsTitle )
	self.RewardsTitle = RewardsTitle
	
	local RewardsTitleSpacer = nil
	
	RewardsTitleSpacer = LUI.UIImage.new()
	RewardsTitleSpacer.id = "RewardsTitleSpacer"
	RewardsTitleSpacer:SetAlpha( 0, 0 )
	RewardsTitleSpacer:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 190, _1080p * 194 )
	self:addElement( RewardsTitleSpacer )
	self.RewardsTitleSpacer = RewardsTitleSpacer
	
	local Rewards = nil
	
	Rewards = MenuBuilder.BuildRegisteredType( "MissionPopupRewards", {
		controllerIndex = f2_local1
	} )
	Rewards.id = "Rewards"
	Rewards:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 198, _1080p * 330 )
	self:addElement( Rewards )
	self.Rewards = Rewards
	
	local SpacerAuthorize = nil
	
	SpacerAuthorize = LUI.UIImage.new()
	SpacerAuthorize.id = "SpacerAuthorize"
	SpacerAuthorize:SetAlpha( 0, 0 )
	SpacerAuthorize:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 334, _1080p * 344 )
	self:addElement( SpacerAuthorize )
	self.SpacerAuthorize = SpacerAuthorize
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "MissionPopupRewardsWrapper", MissionPopupRewardsWrapper )
LockTable( _M )
