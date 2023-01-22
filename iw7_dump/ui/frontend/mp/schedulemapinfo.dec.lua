local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.MapName:SubscribeToModelThroughElement( f1_arg0, "name", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.name:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			f1_arg0.MapName:setText( f2_local0, 0 )
		end
	end )
	f1_arg0.MapImage:SubscribeToModelThroughElement( f1_arg0, "image", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		f3_local0 = f3_local0.image:GetValue( f1_arg1 )
		if f3_local0 ~= nil then
			f1_arg0.MapImage:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	f1_arg0.GameType:SubscribeToModelThroughElement( f1_arg0, "gametypeName", function ()
		local f4_local0 = f1_arg0:GetDataSource()
		f4_local0 = f4_local0.gametypeName:GetValue( f1_arg1 )
		if f4_local0 ~= nil then
			f1_arg0.GameType:setText( f4_local0, 0 )
		end
	end )
	f1_arg0.MapImage:SubscribeToModelThroughElement( f1_arg0, "gametypeIcon", function ()
		local f5_local0 = f1_arg0:GetDataSource()
		f5_local0 = f5_local0.gametypeIcon:GetValue( f1_arg1 )
		if f5_local0 ~= nil then
			f1_arg0.GametypeIcon:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
end

function ScheduleMapInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 266 * _1080p, 0, 175 * _1080p )
	self.id = "ScheduleMapInfo"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 657930, 0 )
	Background:SetAlpha( 0.75, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local MapImage = nil
	
	MapImage = LUI.UIImage.new()
	MapImage.id = "MapImage"
	MapImage:setImage( RegisterMaterial( "image_mp_map_frontier" ), 0 )
	MapImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 261, _1080p * 20, _1080p * 170 )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local GametypeBG = nil
	
	GametypeBG = LUI.UIImage.new()
	GametypeBG.id = "GametypeBG"
	GametypeBG:SetRGBFromInt( 65536, 0 )
	GametypeBG:SetAlpha( 0.5, 0 )
	GametypeBG:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * -30 )
	self:addElement( GametypeBG )
	self.GametypeBG = GametypeBG
	
	local GametypeIcon = nil
	
	GametypeIcon = LUI.UIImage.new()
	GametypeIcon.id = "GametypeIcon"
	GametypeIcon:setImage( RegisterMaterial( "gamemode_domination" ), 0 )
	GametypeIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3, _1080p * 67, _1080p * 103.5, _1080p * 167.5 )
	self:addElement( GametypeIcon )
	self.GametypeIcon = GametypeIcon
	
	local GameType = nil
	
	GameType = LUI.UIText.new()
	GameType.id = "GameType"
	GameType:setText( "", 0 )
	GameType:SetFontSize( 20 * _1080p )
	GameType:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	GameType:SetAlignment( LUI.Alignment.Left )
	GameType:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 55, _1080p * 261, _1080p * 147.5, _1080p * 167.5 )
	self:addElement( GameType )
	self.GameType = GameType
	
	local MapName = nil
	
	MapName = LUI.UIText.new()
	MapName.id = "MapName"
	MapName:setText( "", 0 )
	MapName:SetFontSize( 19 * _1080p )
	MapName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MapName:SetAlignment( LUI.Alignment.Left )
	MapName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12.5, _1080p * 250.5, 0, _1080p * 19 )
	self:addElement( MapName )
	self.MapName = MapName
	
	local Dot = nil
	
	Dot = LUI.UIImage.new()
	Dot.id = "Dot"
	Dot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3, _1080p * 8, _1080p * 7, _1080p * 12 )
	self:addElement( Dot )
	self.Dot = Dot
	
	PostLoadFunc( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "ScheduleMapInfo", ScheduleMapInfo )
LockTable( _M )
