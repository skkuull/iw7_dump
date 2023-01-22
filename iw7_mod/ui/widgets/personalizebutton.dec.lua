local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PersonalizeButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 240 * _1080p )
	self.id = "PersonalizeButton"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CaCButtonBaseImage = nil
	CaCButtonBaseImage = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f1_local1
	} )
	CaCButtonBaseImage.id = "CaCButtonBaseImage"
	CaCButtonBaseImage.Name:setText( "Personalize", 0 )
	CaCButtonBaseImage.Name:SetAlignment( LUI.Alignment.Left )
	CaCButtonBaseImage.Image:SetLeft( _1080p * -150, 0 )
	CaCButtonBaseImage.Image:SetRight( _1080p * 150, 0 )
	CaCButtonBaseImage.Image:SetTop( _1080p * -180, 0 )
	CaCButtonBaseImage.Image:SetBottom( _1080p * -30, 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		CaCButtonBaseImage.LevelBacker:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		CaCButtonBaseImage.LevelFrame:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		CaCButtonBaseImage.Level:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		CaCButtonBaseImage.Level:setText( "Level: 3", 0 )
	end
	CaCButtonBaseImage:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( CaCButtonBaseImage )
	self.CaCButtonBaseImage = CaCButtonBaseImage
	
	return self
end

MenuBuilder.registerType( "PersonalizeButton", PersonalizeButton )
LockTable( _M )
