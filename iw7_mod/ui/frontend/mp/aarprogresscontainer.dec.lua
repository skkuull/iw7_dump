local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARProgressContainer( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1633 * _1080p, 0, 53 * _1080p )
	self.id = "AARProgressContainer"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ProgressiveBar = nil
	
	ProgressiveBar = LUI.UIImage.new()
	ProgressiveBar.id = "ProgressiveBar"
	ProgressiveBar:SetRGBFromInt( 0, 0 )
	ProgressiveBar:SetAlpha( 0.36, 0 )
	ProgressiveBar:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 2, 0, 0 )
	self:addElement( ProgressiveBar )
	self.ProgressiveBar = ProgressiveBar
	
	local Line = nil
	
	Line = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f1_local1
	} )
	Line.id = "Line"
	Line:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 1.5 )
	self:addElement( Line )
	self.Line = Line
	
	local LineCopy0 = nil
	
	LineCopy0 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f1_local1
	} )
	LineCopy0.id = "LineCopy0"
	LineCopy0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 52, _1080p * 53.5 )
	self:addElement( LineCopy0 )
	self.LineCopy0 = LineCopy0
	
	local AARProgressBar = nil
	
	AARProgressBar = MenuBuilder.BuildRegisteredType( "AARProgressBar", {
		controllerIndex = f1_local1
	} )
	AARProgressBar.id = "AARProgressBar"
	AARProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 81.43, _1080p * 1538, _1080p * 3.5, _1080p * 39.5 )
	self:addElement( AARProgressBar )
	self.AARProgressBar = AARProgressBar
	
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:setImage( RegisterMaterial( "challenges_progress_hori_center" ), 0 )
	Fill:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 97.43, _1080p * -109, _1080p * 4.5, _1080p * 40.5 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local XpEared = nil
	
	XpEared = LUI.UIText.new()
	XpEared.id = "XpEared"
	XpEared:setText( "MENU_XP_EARED: &&1", 0 )
	XpEared:SetFontSize( 16 * _1080p )
	XpEared:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	XpEared:SetAlignment( LUI.Alignment.Left )
	XpEared:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 97.43, _1080p * 326.43, _1080p * 31, _1080p * 47 )
	self:addElement( XpEared )
	self.XpEared = XpEared
	
	local XpRequired = nil
	
	XpRequired = LUI.UIText.new()
	XpRequired.id = "XpRequired"
	XpRequired:setText( "MENU_XP_REQUIRED: &&1", 0 )
	XpRequired:SetFontSize( 16 * _1080p )
	XpRequired:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	XpRequired:SetAlignment( LUI.Alignment.Right )
	XpRequired:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -338, _1080p * -109, _1080p * 31, _1080p * 47 )
	self:addElement( XpRequired )
	self.XpRequired = XpRequired
	
	local RankInfo0 = nil
	
	RankInfo0 = MenuBuilder.BuildRegisteredType( "RankInfo", {
		controllerIndex = f1_local1
	} )
	RankInfo0.id = "RankInfo0"
	RankInfo0.Rank:SetFontSize( 38 * _1080p )
	RankInfo0.Rank:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RankInfo0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6.43, _1080p * 100.43, _1080p * 4.5, _1080p * 48.5 )
	self:addElement( RankInfo0 )
	self.RankInfo0 = RankInfo0
	
	local RankInfo0Copy0 = nil
	
	RankInfo0Copy0 = MenuBuilder.BuildRegisteredType( "RankInfo", {
		controllerIndex = f1_local1
	} )
	RankInfo0Copy0.id = "RankInfo0Copy0"
	RankInfo0Copy0.Rank:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RankInfo0Copy0:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -98, _1080p * -4, _1080p * 4.5, _1080p * 48.5 )
	self:addElement( RankInfo0Copy0 )
	self.RankInfo0Copy0 = RankInfo0Copy0
	
	return self
end

MenuBuilder.registerType( "AARProgressContainer", AARProgressContainer )
LockTable( _M )
