local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PlayerName( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 286 * _1080p, 0, 22 * _1080p )
	self.id = "PlayerName"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Name = nil
	
	Name = LUI.UIText.new()
	Name.id = "Name"
	Name:SetRGBFromTable( SWATCHES.HUD.friendlyTeam, 0 )
	Name:SetFontSize( 22 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Name:setTextStyle( CoD.TextStyle.Shadowed )
	Name:SetAlignment( LUI.Alignment.Center )
	Name:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 286, 0, _1080p * 22 )
	Name:SubscribeToModelThroughElement( self, "name", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.name:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Name:setText( f2_local0, 0 )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	return self
end

MenuBuilder.registerType( "PlayerName", PlayerName )
LockTable( _M )
