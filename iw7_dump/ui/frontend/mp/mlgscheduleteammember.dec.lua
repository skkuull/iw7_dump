local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.Name:SubscribeToModelThroughElement( f1_arg0, "name", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.name:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			f1_arg0.Name:setText( f2_local0, 0 )
		end
	end )
end

function MLGScheduleTeamMember( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 550 * _1080p, 0, 32 * _1080p )
	self.id = "MLGScheduleTeamMember"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Name = nil
	
	Name = LUI.UIText.new()
	Name.id = "Name"
	Name:SetRGBFromTable( SWATCHES.Lobby.memberText, 0 )
	Name:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Name:SetFontSize( 24 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	Name:SetAlignment( LUI.Alignment.Left )
	Name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 550, _1080p * 3, _1080p * 27 )
	self:addElement( Name )
	self.Name = Name
	
	local Divider = nil
	
	Divider = LUI.UIImage.new()
	Divider.id = "Divider"
	Divider:SetRGBFromTable( SWATCHES.Lobby.memberClanText, 0 )
	Divider:SetAlpha( 0.6, 0 )
	Divider:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 4, 0, 0, _1080p * -1 )
	self:addElement( Divider )
	self.Divider = Divider
	
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "MLGScheduleTeamMember", MLGScheduleTeamMember )
LockTable( _M )
