local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CodCasterTeamIdentityInformation( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 183 * _1080p )
	self.id = "CodCasterTeamIdentityInformation"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TeamNameBackground = nil
	
	TeamNameBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f1_local1
	} )
	TeamNameBackground.id = "TeamNameBackground"
	TeamNameBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 208, _1080p * 550, _1080p * 54.5, _1080p * 105.5 )
	self:addElement( TeamNameBackground )
	self.TeamNameBackground = TeamNameBackground
	
	local TeamColorImage = nil
	
	TeamColorImage = LUI.UIImage.new()
	TeamColorImage.id = "TeamColorImage"
	TeamColorImage:SetRGBFromTable( SWATCHES.HUD.friendlyTeam, 0 )
	TeamColorImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 205, _1080p * 219.93, _1080p * 54.5, _1080p * 105.5 )
	self:addElement( TeamColorImage )
	self.TeamColorImage = TeamColorImage
	
	local TeamNameText = nil
	
	TeamNameText = LUI.UIText.new()
	TeamNameText.id = "TeamNameText"
	TeamNameText:setText( Engine.Localize( "MENU_FACTION_UNSA_SHORT" ), 0 )
	TeamNameText:SetFontSize( 36 * _1080p )
	TeamNameText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TeamNameText:SetAlignment( LUI.Alignment.Left )
	TeamNameText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 227, _1080p * 552, _1080p * 62, _1080p * 98 )
	self:addElement( TeamNameText )
	self.TeamNameText = TeamNameText
	
	local TeamNameTitle = nil
	
	TeamNameTitle = LUI.UIText.new()
	TeamNameTitle.id = "TeamNameTitle"
	TeamNameTitle:SetAlpha( 0, 0 )
	TeamNameTitle:setText( Engine.Localize( "CODCASTER_TEAM1_NAME" ), 0 )
	TeamNameTitle:SetFontSize( 20 * _1080p )
	TeamNameTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TeamNameTitle:SetAlignment( LUI.Alignment.Left )
	TeamNameTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 208, _1080p * 407.93, _1080p * 54.5, _1080p * 74.5 )
	self:addElement( TeamNameTitle )
	self.TeamNameTitle = TeamNameTitle
	
	local TeamLogoImage = nil
	
	TeamLogoImage = LUI.UIImage.new()
	TeamLogoImage.id = "TeamLogoImage"
	TeamLogoImage:setImage( RegisterMaterial( "icon_faction_unsa_color" ), 0 )
	TeamLogoImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 34, _1080p * 185.5, _1080p * 15.75, _1080p * 167.25 )
	self:addElement( TeamLogoImage )
	self.TeamLogoImage = TeamLogoImage
	
	local TeamColorTitle = nil
	
	TeamColorTitle = LUI.UIText.new()
	TeamColorTitle.id = "TeamColorTitle"
	TeamColorTitle:SetAlpha( 0, 0 )
	TeamColorTitle:setText( Engine.Localize( "CODCASTER_TEAM1_COLOR" ), 0 )
	TeamColorTitle:SetFontSize( 20 * _1080p )
	TeamColorTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TeamColorTitle:SetAlignment( LUI.Alignment.Left )
	TeamColorTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 230, _1080p * 510, _1080p * 87.5, _1080p * 107.5 )
	self:addElement( TeamColorTitle )
	self.TeamColorTitle = TeamColorTitle
	
	local TeamLogoTitle = nil
	
	TeamLogoTitle = LUI.UIText.new()
	TeamLogoTitle.id = "TeamLogoTitle"
	TeamLogoTitle:SetAlpha( 0, 0 )
	TeamLogoTitle:setText( Engine.Localize( "CODCASTER_TEAM1_LOGO" ), 0 )
	TeamLogoTitle:SetFontSize( 20 * _1080p )
	TeamLogoTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TeamLogoTitle:SetAlignment( LUI.Alignment.Left )
	TeamLogoTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 286, _1080p * 13.5, _1080p * 33.5 )
	self:addElement( TeamLogoTitle )
	self.TeamLogoTitle = TeamLogoTitle
	
	return self
end

MenuBuilder.registerType( "CodCasterTeamIdentityInformation", CodCasterTeamIdentityInformation )
LockTable( _M )
