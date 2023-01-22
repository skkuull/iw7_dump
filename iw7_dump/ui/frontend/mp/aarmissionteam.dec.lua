local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = MissionDirector.GetActiveMissionTeam( f1_arg1 )
	local f1_local1 = CSV.ReadRow( CSV.missionTeams, f1_local0 )
	f1_arg0.MissionTeamName:setText( f1_local1.name, 0 )
	f1_arg0.MissionLevelVar:setText( tostring( MissionDirector.GetMissionTeamLevel( f1_arg1, f1_local0 ) + 1 ), 0 )
	f1_arg0.MissionCompletionVar:setText( tostring( MissionDirector.GetMissionXP( f1_arg1, f1_local0 ) ) .. "/" .. tostring( MissionDirector.GetMissionXPToNextLevel( f1_arg1, f1_local0 ) ), 0 )
	f1_arg0.MissionNextVar:setText( Engine.Localize( Engine.TableLookup( CSV.intelChallenges.file, CSV.intelChallenges.cols.id, MissionDirector.GetActiveMission( f1_arg1, f1_local0 ), CSV.intelChallenges.cols.uidesc ) ), 0 )
end

function AARMissionTeam( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "AARMissionTeam"
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
	Title.Title:setText( "Mission Team", 0 )
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
	
	local MissionTeamName = nil
	
	MissionTeamName = LUI.UIStyledText.new()
	MissionTeamName.id = "MissionTeamName"
	MissionTeamName:setText( "Mission Team Name", 0 )
	MissionTeamName:SetFontSize( 48 * _1080p )
	MissionTeamName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionTeamName:SetAlignment( LUI.Alignment.Center )
	MissionTeamName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 190.92, _1080p * 238.92 )
	self:addElement( MissionTeamName )
	self.MissionTeamName = MissionTeamName
	
	local MissionLevelHeading = nil
	
	MissionLevelHeading = LUI.UIStyledText.new()
	MissionLevelHeading.id = "MissionLevelHeading"
	MissionLevelHeading:setText( "Level", 0 )
	MissionLevelHeading:SetFontSize( 36 * _1080p )
	MissionLevelHeading:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionLevelHeading:SetAlignment( LUI.Alignment.Center )
	MissionLevelHeading:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 291.92, _1080p * 327.92 )
	self:addElement( MissionLevelHeading )
	self.MissionLevelHeading = MissionLevelHeading
	
	local MissionLevelVar = nil
	
	MissionLevelVar = LUI.UIStyledText.new()
	MissionLevelVar.id = "MissionLevelVar"
	MissionLevelVar:setText( "1", 0 )
	MissionLevelVar:SetFontSize( 36 * _1080p )
	MissionLevelVar:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionLevelVar:SetAlignment( LUI.Alignment.Center )
	MissionLevelVar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 327.92, _1080p * 363.92 )
	self:addElement( MissionLevelVar )
	self.MissionLevelVar = MissionLevelVar
	
	local MissionCompletionHeading = nil
	
	MissionCompletionHeading = LUI.UIStyledText.new()
	MissionCompletionHeading.id = "MissionCompletionHeading"
	MissionCompletionHeading:setText( "Missions Completed", 0 )
	MissionCompletionHeading:SetFontSize( 36 * _1080p )
	MissionCompletionHeading:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionCompletionHeading:SetAlignment( LUI.Alignment.Center )
	MissionCompletionHeading:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 426.92, _1080p * 462.92 )
	self:addElement( MissionCompletionHeading )
	self.MissionCompletionHeading = MissionCompletionHeading
	
	local MissionCompletionVar = nil
	
	MissionCompletionVar = LUI.UIStyledText.new()
	MissionCompletionVar.id = "MissionCompletionVar"
	MissionCompletionVar:setText( "1/10", 0 )
	MissionCompletionVar:SetFontSize( 36 * _1080p )
	MissionCompletionVar:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionCompletionVar:SetAlignment( LUI.Alignment.Center )
	MissionCompletionVar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 462.92, _1080p * 498.92 )
	self:addElement( MissionCompletionVar )
	self.MissionCompletionVar = MissionCompletionVar
	
	local MissionNextHeading = nil
	
	MissionNextHeading = LUI.UIStyledText.new()
	MissionNextHeading.id = "MissionNextHeading"
	MissionNextHeading:setText( "Next Mission", 0 )
	MissionNextHeading:SetFontSize( 36 * _1080p )
	MissionNextHeading:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionNextHeading:SetAlignment( LUI.Alignment.Center )
	MissionNextHeading:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 573.92, _1080p * 609.92 )
	self:addElement( MissionNextHeading )
	self.MissionNextHeading = MissionNextHeading
	
	local MissionNextVar = nil
	
	MissionNextVar = LUI.UIStyledText.new()
	MissionNextVar.id = "MissionNextVar"
	MissionNextVar:setText( "Name", 0 )
	MissionNextVar:SetFontSize( 36 * _1080p )
	MissionNextVar:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionNextVar:SetAlignment( LUI.Alignment.Center )
	MissionNextVar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 609.92, _1080p * 645.92 )
	self:addElement( MissionNextVar )
	self.MissionNextVar = MissionNextVar
	
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

MenuBuilder.registerType( "AARMissionTeam", AARMissionTeam )
LockTable( _M )
