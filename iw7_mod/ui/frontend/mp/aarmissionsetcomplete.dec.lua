local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.MissionLevelVar:setText( tostring( MissionDirector.GetMissionTeamLevel( f1_arg1, MissionDirector.GetActiveMissionTeam( f1_arg1 ) ) + 1 ), 0 )
	local f1_local0 = Rewards.GetMissionRewards( f1_arg1 )
	f1_arg0.MissionCrateItem:setText( LOOT.GetItemText( f1_local0.set_items ), 0 )
end

function AARMissionSetComplete( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "AARMissionSetComplete"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	self:playSound( "menu_open" )
	local f2_local2 = self
	local Title = nil
	
	Title = MenuBuilder.BuildRegisteredType( "GenericTitleBar", {
		controllerIndex = f2_local1
	} )
	Title.id = "Title"
	Title.Title:setText( "Mission Team Level Up", 0 )
	Title.Title:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 170 )
	self:addElement( Title )
	self.Title = Title
	
	local BGImage = nil
	
	BGImage = LUI.UIImage.new()
	BGImage.id = "BGImage"
	BGImage:SetRGBFromTable( SWATCHES.genericMenu.bg, 0 )
	BGImage:SetAlpha( 0.75, 0 )
	BGImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 660, _1080p * 1260, _1080p * 170, _1080p * 940 )
	self:addElement( BGImage )
	self.BGImage = BGImage
	
	local MissionTeamSetHeading = nil
	
	MissionTeamSetHeading = LUI.UIStyledText.new()
	MissionTeamSetHeading.id = "MissionTeamSetHeading"
	MissionTeamSetHeading:setText( "Congratulations", 0 )
	MissionTeamSetHeading:SetFontSize( 45 * _1080p )
	MissionTeamSetHeading:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionTeamSetHeading:SetAlignment( LUI.Alignment.Center )
	MissionTeamSetHeading:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 220, _1080p * 265 )
	self:addElement( MissionTeamSetHeading )
	self.MissionTeamSetHeading = MissionTeamSetHeading
	
	local MissionLevelHeading = nil
	
	MissionLevelHeading = LUI.UIStyledText.new()
	MissionLevelHeading.id = "MissionLevelHeading"
	MissionLevelHeading:setText( "You are now level", 0 )
	MissionLevelHeading:SetFontSize( 36 * _1080p )
	MissionLevelHeading:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionLevelHeading:SetAlignment( LUI.Alignment.Center )
	MissionLevelHeading:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 322.92, _1080p * 358.92 )
	self:addElement( MissionLevelHeading )
	self.MissionLevelHeading = MissionLevelHeading
	
	local MissionLevelVar = nil
	
	MissionLevelVar = LUI.UIStyledText.new()
	MissionLevelVar.id = "MissionLevelVar"
	MissionLevelVar:setText( "1", 0 )
	MissionLevelVar:SetFontSize( 55 * _1080p )
	MissionLevelVar:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionLevelVar:SetAlignment( LUI.Alignment.Center )
	MissionLevelVar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 358.92, _1080p * 413.92 )
	self:addElement( MissionLevelVar )
	self.MissionLevelVar = MissionLevelVar
	
	local MissionCrateHeading = nil
	
	MissionCrateHeading = LUI.UIStyledText.new()
	MissionCrateHeading.id = "MissionCrateHeading"
	MissionCrateHeading:setText( "Team Crate Unlocked", 0 )
	MissionCrateHeading:SetFontSize( 36 * _1080p )
	MissionCrateHeading:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionCrateHeading:SetAlignment( LUI.Alignment.Center )
	MissionCrateHeading:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 504.08, _1080p * 540.08 )
	self:addElement( MissionCrateHeading )
	self.MissionCrateHeading = MissionCrateHeading
	
	local MissionCrateItem = nil
	
	MissionCrateItem = LUI.UIStyledText.new()
	MissionCrateItem.id = "MissionCrateItem"
	MissionCrateItem:setText( "Item 1", 0 )
	MissionCrateItem:SetFontSize( 36 * _1080p )
	MissionCrateItem:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionCrateItem:SetAlignment( LUI.Alignment.Center )
	MissionCrateItem:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 555, _1080p * 591 )
	self:addElement( MissionCrateItem )
	self.MissionCrateItem = MissionCrateItem
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_primary", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg1.controller or f2_local1
		ACTIONS.AdvancePostGame( self )
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "AARMissionSetComplete", AARMissionSetComplete )
LockTable( _M )
