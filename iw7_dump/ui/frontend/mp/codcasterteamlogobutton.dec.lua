local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CodCasterTeamLogoButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 350 * _1080p )
	self.id = "CodCasterTeamLogoButton"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TeamLogo = nil
	
	TeamLogo = LUI.UIImage.new()
	TeamLogo.id = "TeamLogo"
	TeamLogo:setImage( RegisterMaterial( "icon_faction_unsa_color" ), 0 )
	TeamLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 330, _1080p * 20, _1080p * 330 )
	self:addElement( TeamLogo )
	self.TeamLogo = TeamLogo
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f1_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 350, 0, _1080p * 350 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	return self
end

MenuBuilder.registerType( "CodCasterTeamLogoButton", CodCasterTeamLogoButton )
LockTable( _M )
