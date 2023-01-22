local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LoadoutDraftHeader( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 550 * _1080p, 0, 70 * _1080p )
	self.id = "LoadoutDraftHeader"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local AccentLine = nil
	
	AccentLine = LUI.UIImage.new()
	AccentLine.id = "AccentLine"
	AccentLine:setImage( RegisterMaterial( "inventory_framing_digital_line" ), 0 )
	AccentLine:SetUseAA( true )
	AccentLine:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -512, 0, _1080p * 5, _1080p * 37 )
	self:addElement( AccentLine )
	self.AccentLine = AccentLine
	
	local GameMode = nil
	
	GameMode = LUI.UIStyledText.new()
	GameMode.id = "GameMode"
	GameMode:SetRGBFromInt( 0, 0 )
	GameMode:SetFontSize( 50 * _1080p )
	GameMode:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	GameMode:SetAlignment( LUI.Alignment.Center )
	GameMode:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -550, 0, _1080p * 20, _1080p * 70 )
	GameMode:SubscribeToModel( DataSources.frontEnd.lobby.gameTypeName:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.frontEnd.lobby.gameTypeName:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			GameMode:setText( ToUpperCase( f2_local0 ), 0 )
		end
	end )
	self:addElement( GameMode )
	self.GameMode = GameMode
	
	local MapName = nil
	
	MapName = LUI.UIStyledText.new()
	MapName.id = "MapName"
	MapName:SetRGBFromInt( 0, 0 )
	MapName:SetFontSize( 18 * _1080p )
	MapName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MapName:SetAlignment( LUI.Alignment.Right )
	MapName:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -500, _1080p * -35, 0, _1080p * 18 )
	MapName:SubscribeToModel( DataSources.frontEnd.lobby.mapName:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.frontEnd.lobby.mapName:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			MapName:setText( ToUpperCase( f3_local0 ), 0 )
		end
	end )
	self:addElement( MapName )
	self.MapName = MapName
	
	return self
end

MenuBuilder.registerType( "LoadoutDraftHeader", LoadoutDraftHeader )
LockTable( _M )
