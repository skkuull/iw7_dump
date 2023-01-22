local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	assert( f1_arg0.Players )
	assert( f1_arg0.PartySize )
	f1_arg0:SubscribeToDataSourceThroughElement( f1_arg0, nil, function ()
		local f2_local0 = f1_arg0:GetDataSource()
		if f2_local0 then
			f1_arg0.Players:setText( Engine.Localize( "LUA_MENU_MP_PLAYLIST_PLAYERS", f2_local0.minPlayerSize:GetValue( f1_arg1 ), f2_local0.maxPlayerSize:GetValue( f1_arg1 ) ) )
			f1_arg0.PartySize:setText( Engine.Localize( "LUA_MENU_MP_PARTY_SIZE", f2_local0.minPartySize:GetValue( f1_arg1 ), f2_local0.maxPartySize:GetValue( f1_arg1 ) ) )
		end
	end )
end

function PlaylistInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 900 * _1080p, 0, 470 * _1080p )
	self.id = "PlaylistInfo"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local GradientDown = nil
	
	GradientDown = LUI.UIImage.new()
	GradientDown.id = "GradientDown"
	GradientDown:SetRGBFromInt( 0, 0 )
	GradientDown:SetAlpha( 0.3, 0 )
	GradientDown:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	GradientDown:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 477.73, _1080p * 547.73 )
	self:addElement( GradientDown )
	self.GradientDown = GradientDown
	
	local Players = nil
	
	Players = LUI.UIText.new()
	Players.id = "Players"
	Players:setText( Engine.Localize( "LUA_MENU_MP_PLAYLIST_PLAYERS" ), 0 )
	Players:SetFontSize( 19 * _1080p )
	Players:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Players:SetAlignment( LUI.Alignment.Left )
	Players:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 15, _1080p * -81, _1080p * 514.23, _1080p * 533.23 )
	self:addElement( Players )
	self.Players = Players
	
	local ItemDescDropShadow = nil
	
	ItemDescDropShadow = LUI.UIImage.new()
	ItemDescDropShadow.id = "ItemDescDropShadow"
	ItemDescDropShadow:SetRGBFromInt( 0, 0 )
	ItemDescDropShadow:SetAlpha( 0.3, 0 )
	ItemDescDropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	ItemDescDropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( ItemDescDropShadow )
	self.ItemDescDropShadow = ItemDescDropShadow
	
	local ModeDetails = nil
	
	ModeDetails = MenuBuilder.BuildRegisteredType( "ModeDetails", {
		controllerIndex = f3_local1
	} )
	ModeDetails.id = "ModeDetails"
	ModeDetails:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 470 )
	ModeDetails:SubscribeToModelThroughElement( self, "desc", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.desc:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			ModeDetails.GenericItemInfo.BodyText:setText( f4_local0, 0 )
		end
	end )
	ModeDetails:SubscribeToModelThroughElement( self, "name", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.name:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			ModeDetails.GenericItemInfo.HeaderText:setText( ToUpperCase( f5_local0 ), 0 )
		end
	end )
	ModeDetails:SubscribeToModelThroughElement( self, "image", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.image:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			ModeDetails.Icon:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( ModeDetails )
	self.ModeDetails = ModeDetails
	
	local PartySize = nil
	
	PartySize = LUI.UIText.new()
	PartySize.id = "PartySize"
	PartySize:setText( Engine.Localize( "LUA_MENU_MP_PARTY_SIZE" ), 0 )
	PartySize:SetFontSize( 19 * _1080p )
	PartySize:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PartySize:SetAlignment( LUI.Alignment.Left )
	PartySize:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 15, _1080p * -81, _1080p * 488, _1080p * 507 )
	self:addElement( PartySize )
	self.PartySize = PartySize
	
	self:SubscribeToModelThroughElement( self, "image", function ()
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "ModeDetails",
			sequenceName = "Update",
			elementPath = "ModeDetails"
		} )
	end )
	self:SubscribeToModelThroughElement( self, "isCompetitive", function ()
		local f8_local0 = self:GetDataSource()
		if f8_local0.isCompetitive:GetValue( f3_local1 ) ~= nil then
			f8_local0 = self:GetDataSource()
			if f8_local0.isCompetitive:GetValue( f3_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "ModeDetails",
					sequenceName = "ShowWipeWarning",
					elementPath = "ModeDetails"
				} )
			end
		end
		f8_local0 = self:GetDataSource()
		if f8_local0.isCompetitive:GetValue( f3_local1 ) ~= nil then
			f8_local0 = self:GetDataSource()
			if f8_local0.isCompetitive:GetValue( f3_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "ModeDetails",
					sequenceName = "HideWipeWarning",
					elementPath = "ModeDetails"
				} )
			end
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "PlaylistInfo", PlaylistInfo )
LockTable( _M )
