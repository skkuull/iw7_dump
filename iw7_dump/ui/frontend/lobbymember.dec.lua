local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 16
f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if not Engine.IsCoreMode() then
		return 
	end
	local f1_local0 = f1_arg0:GetCurrentMenu()
	local f1_local1 = f1_arg0:GetDataSource()
	if f1_local0 and f1_local0.SlideToLobbyMembers and f1_arg2 then
		f1_local0:SlideToLobbyMembers()
	end
	if f1_local1 then
		if f1_local0 and f1_local0.LobbyMemberDetails then
			f1_local0.LobbyMemberDetails:SetAlpha( 1 )
			f1_local0.LobbyMemberDetails.PlayerCard:SetDataSource( f1_local1, f1_arg1 )
			local f1_local2 = Lobby.GetLobbyMemberStats( f1_local1.xuid:GetValue( f1_arg1 ) )
			f1_local0.LobbyMemberDetails.Stats:SetData( f1_local2 )
			f1_local0.LobbyMemberDetails.KDHistory:SetData( f1_local2 )
		end
		local f1_local3 = f1_local1.body:GetValue( f1_arg1 )
		local f1_local2 = f1_local1.head:GetValue( f1_arg1 )
		local f1_local4 = f1_local1.rigIndex:GetValue( f1_arg1 ) - 1
		assert( f1_local4 >= 0 )
		if f1_local4 >= 0 then
			local f1_local5 = Cac.GetRigRefFromIndex( f1_local4 )
			assert( f1_local5 )
			local f1_local6 = Cac.GetRigFrontEndLobbyMemberAnim( f1_local5 )
			FrontEndScene.SetCharacterModelsByIndex( FrontEndScene.ClientCharacters.LobbyMember, f1_local3, f1_local2 )
			ClientCharacter.SetCharacterVisible( FrontEndScene.ClientCharacters.LobbyMember, true, f1_arg1 )
			ClientCharacter.SetCharacterWeapons( FrontEndScene.ClientCharacters.LobbyMember, nil )
			ClientCharacter.PlayCharacterAnim( FrontEndScene.ClientCharacters.LobbyMember, f1_local6 )
			ClientCharacter.SetCharacterOffset( FrontEndScene.ClientCharacters.LobbyMember, 0, 0, 0 )
		else
			ClientCharacter.SetCharacterVisible( FrontEndScene.ClientCharacters.LobbyMember, false, f1_arg1 )
		end
	end
end

f0_local2 = function ( f2_arg0, f2_arg1 )
	assert( f2_arg0.PartyStripe )
	if not (IsPublicMatch() and f2_arg1) then
		f2_arg0.PartyStripe:SetAlpha( 0 )
		return 
	else
		f2_arg0.PartyStripe:SetAlpha( 1 )
		local f2_local0 = {
			COLORS.paleEarth,
			COLORS.orange,
			COLORS.marshGreen,
			COLORS.periwinkle,
			COLORS.blue,
			COLORS.lightCyan,
			COLORS.coralPink,
			COLORS.whaleBlue,
			COLORS.purple,
			COLORS.darkModerateViolet
		}
		local f2_local1 = f2_local0[1 + f2_arg1 % #f2_local0]
		assert( f2_local1 )
		f2_arg0.PartyStripe:SetRGBFromTable( f2_local1 )
	end
end

local f0_local3 = function ( f3_arg0, f3_arg1 )
	assert( f3_arg0.HostIcon )
	local f3_local0 = f3_arg0.HostIcon
	local f3_local1 = f3_local0
	f3_local0 = f3_local0.SetAlpha
	local f3_local2
	if f3_arg1 then
		f3_local2 = 1
		if not f3_local2 then
		
		else
			f3_local0( f3_local1, f3_local2 )
		end
	end
	f3_local2 = 0
end

local f0_local4 = function ( f4_arg0, f4_arg1 )
	assert( Teams.axis < Teams.allies )
	local f4_local0 = GetIntForColor( SWATCHES.genericMenu.blackBackground )
	if f4_arg0 == Teams.axis or f4_arg0 == Teams.allies then
		f4_local0 = CODCASTER.GetTeamDarkColor( f4_arg1, Mirror( f4_arg0, Teams.axis, Teams.allies ) )
	end
	return f4_local0
end

local f0_local5 = function ( f5_arg0 )
	local f5_local0 = GetIntForColor( SWATCHES.genericMenu.blackBackground )
	if f5_arg0 == Teams.allies then
		f5_local0 = GetIntForColor( SWATCHES.HUD.friendlyTeam )
	elseif f5_arg0 == Teams.axis then
		f5_local0 = GetIntForColor( SWATCHES.HUD.enemyTeam )
	end
	return f5_local0
end

function PostLoadFunc( f6_arg0, f6_arg1 )
	if Engine.IsGamepadEnabled() == 1 then
		f6_arg0.addButtonHelperFunction = function ( f7_arg0, f7_arg1 )
			if #f7_arg0:getAllFocusedChildren() > 0 or f7_arg0:isInFocus() then
				f7_arg0:AddButtonHelperText( {
					helper_text = Engine.Localize( "XBOXLIVE_PLAYER_MUTE" ),
					button_ref = "button_alt1",
					side = "left",
					priority = 100,
					clickable = true
				} )
			end
		end
		
		f6_arg0:addEventHandler( "menu_create", f6_arg0.addButtonHelperFunction )
		
		local bindButton = LUI.UIBindButton.new()
		bindButton.id = "selfBindButton"
		f6_arg0:addElement( bindButton )
		f6_arg0.bindButton = bindButton
		
		f6_arg0:addEventHandler( "gain_focus", function ( f8_arg0, f8_arg1 )
			local f8_local0 = f8_arg1.controller or f6_arg1
			f8_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "XBOXLIVE_PLAYER_MUTE" ),
				button_ref = "button_alt1",
				side = "left",
				priority = 100,
				clickable = true
			} )
		end )
		f6_arg0:addEventHandler( "lose_focus", function ( f9_arg0, f9_arg1 )
			local f9_local0 = f9_arg1.controller or f6_arg1
			f9_arg0:RemoveButtonHelperText( "button_alt1", "left" )
			local f9_local1 = f9_arg0:getParent()
			while f9_local1 and not f9_local1.addButtonHelperFunction and f9_local1.id ~= f6_arg0.id do
				f9_local1 = f9_local1:getParent()
			end
			if f9_local1 and f9_local1.addButtonHelperFunction then
				f9_local1.addButtonHelperFunction( f9_arg0, f9_arg1 )
			end
		end )
		f6_arg0.bindButton:addEventHandler( "button_alt1", function ( f10_arg0, f10_arg1 )
			local f10_local0 = f10_arg0:getParent()
			if #f10_local0:getAllFocusedChildren() <= 0 then
				f10_local0 = f10_arg0:getParent()
				if f10_local0:isInFocus() then
					f10_local0 = f6_arg0:GetDataSource()
					local f10_local1 = Lobby.GetActivePartyMemberXUID( f10_local0.memberIndex:GetValue( f6_arg1 ) )
					assert( f10_local1 )
					if not Lobby.IsLocalPlayer( f10_local1 ) then
						Lobby.ToggleMute( f6_arg1, f10_local1 )
					end
					return true
				end
				return false
			end
			f10_local0 = f6_arg0:GetDataSource()
			local f10_local1 = Lobby.GetActivePartyMemberXUID( f10_local0.memberIndex:GetValue( f6_arg1 ) )
			assert( f10_local1 )
			if not Lobby.IsLocalPlayer( f10_local1 ) then
				Lobby.ToggleMute( f6_arg1, f10_local1 )
			end
			return true
		end )
	end
	f6_arg0:addEventHandler( "button_action", function ( f11_arg0, f11_arg1 )
		local f11_local0 = f11_arg1.controller
		assert( f11_local0 )
		local f11_local1 = f11_arg0:GetDataSource()
		local f11_local2 = Lobby.GetActivePartyMemberXUID( f11_local1.memberIndex:GetValue( f11_local0 ) )
		assert( f11_local2 )
		if Engine.IsXB3() or Engine.IsPCApp() or not Lobby.IsLocalPlayer( f11_local2 ) then
			LUI.FlowManager.RequestPopupMenu( nil, "LobbyMemberActions", true, f11_local0, false, {
				xuid = f11_local2
			} )
		end
	end )
	f6_arg0.Gamertag:SubscribeToModelThroughElement( f6_arg0, "gamertag", function ()
		local f12_local0 = f6_arg0:GetDataSource()
		f12_local0 = f12_local0.gamertag:GetValue( f6_arg1 )
		if f12_local0 ~= nil then
			if Engine.IsPC() then
				f6_arg0.Gamertag:setText( Engine.TruncateToGlyphCount( f12_local0, f0_local0 ), 0 )
			else
				f6_arg0.Gamertag:setText( f12_local0, 0 )
			end
		end
		local f12_local1 = f6_arg0:GetDataSource()
		f12_local1 = f12_local1.missingGamertag:GetValue( f6_arg1 )
		if Engine.IsAliensMode() then
			if f12_local1 or CONDITIONS.IsSystemLink() then
				f6_arg0.RankIcon:SetAlpha( 0 )
				f6_arg0.Rank:SetAlpha( 0 )
			else
				f6_arg0.RankIcon:SetAlpha( 1 )
				f6_arg0.Rank:SetAlpha( 1 )
			end
		elseif f12_local1 or CONDITIONS.IsSystemLink() or not CONDITIONS.IsPublicMatch() then
			f6_arg0.RankIcon:SetAlpha( 0 )
			f6_arg0.Rank:SetAlpha( 0 )
		else
			f6_arg0.RankIcon:SetAlpha( 1 )
			f6_arg0.Rank:SetAlpha( 1 )
		end
	end )
	local f6_local1 = LUI.DataSourceInGlobalModel.new( "frontEnd.lobby.teamsVisible" )
	local f6_local2 = function ()
		local f13_local0 = f6_arg0:GetDataSource()
		if not f13_local0 then
			return 
		end
		local f13_local1 = f13_local0.team:GetValue( f6_arg1 )
		local f13_local2 = GetIntForColor( SWATCHES.genericMenu.blackBackground )
		if f13_local1 then
			if f6_arg0.isCODCaster == nil then
				f6_arg0.isCODCaster = Lobby.IsLocalMemberMLGSpectator( f6_arg1 )
			end
			if f6_arg0.isCODCaster then
				f13_local2 = f0_local4( f13_local1, f6_arg1 )
			elseif IsPrivateMatch() or IsSystemLink() then
				f13_local2 = f0_local5( f13_local1 )
			elseif CONDITIONS.IsTeamBasedGameType() and f6_local1:GetValue( f6_arg1 ) then
				local f13_local3 = Engine.GetTeamForLocalClient()
				if f13_local3 == Teams.allies or f13_local3 == Teams.axis then
					if f13_local1 == f13_local3 then
						f13_local2 = GetIntForColor( SWATCHES.HUD.friendlyTeam )
					else
						f13_local2 = GetIntForColor( SWATCHES.HUD.enemyTeam )
					end
				end
			end
		end
		f6_arg0.Background:SetRGBFromInt( f13_local2 )
	end
	
	f6_arg0.Background:SubscribeToModel( f6_local1:GetModel( f6_arg1 ), f6_local2 )
	f6_arg0.Background:SubscribeToModelThroughElement( f6_arg0, "team", f6_local2 )
	f6_arg0:addEventHandler( "button_over", function ( f14_arg0, f14_arg1 )
		f0_local1( f6_arg0, f6_arg1, f14_arg1.focusType ~= FocusType.MouseOver )
	end )
	f6_arg0:SubscribeToModelThroughElement( f6_arg0, "gamertag", function ()
		if f6_arg0:isInFocus() then
			f0_local1( f6_arg0, f6_arg1, false )
		end
	end )
	f6_arg0:SubscribeToModelThroughElement( f6_arg0, "subparty", function ( f16_arg0 )
		local f16_local0 = DataModel.GetModelValue( f16_arg0 )
		if f16_local0 == -1 then
			f16_local0 = nil
		end
		f0_local2( f6_arg0, f16_local0 )
	end )
	f6_arg0:SubscribeToModelThroughElement( f6_arg0, "isPrivatePartyHost", function ( f17_arg0 )
		f0_local3( f6_arg0, DataModel.GetModelValue( f17_arg0 ) == true )
	end )
	if not Engine.IsAliensMode() then
		ACTIONS.AnimateSequence( f6_arg0, "ButtonUp" )
	end
	f6_arg0.Rank:SetWordWrap( false )
	f6_arg0:registerEventHandler( "update_codcaster_status", function ( element, event )
		assert( event.memberIndex )
		if event.isCODCaster ~= f6_arg0.isCODCaster then
			local f18_local0 = GetIntForColor( SWATCHES.genericMenu.blackBackground )
			local f18_local1 = f6_arg0:GetDataSource()
			local f18_local2 = f18_local1.team:GetValue( f6_arg1 )
			local f18_local3 = f18_local1.memberIndex:GetValue( f6_arg1 )
			if event.isCODCaster then
				if event.memberIndex ~= f18_local3 then
					f18_local0 = f0_local4( f18_local2, f6_arg1 )
				end
			else
				f18_local0 = f0_local5( f18_local2 )
			end
			f6_arg0.Background:SetRGBFromInt( f18_local0 )
			f6_arg0.isCODCaster = event.isCODCaster
		end
	end )
end

function LobbyMember( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 32 * _1080p )
	self.id = "LobbyMember"
	self._animationSets = {}
	self._sequences = {}
	local f19_local1 = controller and controller.controllerIndex
	if not f19_local1 and not Engine.InFrontend() then
		f19_local1 = self:getRootController()
	end
	assert( f19_local1 )
	local f19_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.7, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f19_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local Accent = nil
	
	Accent = LUI.UIImage.new()
	Accent.id = "Accent"
	Accent:SetRGBFromTable( SWATCHES.Lobby.memberClanText, 0 )
	Accent:SetAlpha( 0.6, 0 )
	Accent:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -1, 0 )
	self:addElement( Accent )
	self.Accent = Accent
	
	local Gamertag = nil
	
	Gamertag = LUI.UIText.new()
	Gamertag.id = "Gamertag"
	Gamertag:SetRGBFromInt( 14277081, 0 )
	Gamertag:setText( "WWWWWWWWWWWWWWWW", 0 )
	Gamertag:SetFontSize( 24 * _1080p )
	Gamertag:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	Gamertag:SetAlignment( LUI.Alignment.Left )
	Gamertag:SetOptOutRightToLeftAlignmentFlip( true )
	Gamertag:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 210, _1080p * -32, _1080p * -13, _1080p * 11 )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local ClanTag = nil
	
	ClanTag = LUI.UIText.new()
	ClanTag.id = "ClanTag"
	ClanTag:SetRGBFromInt( 14277081, 0 )
	ClanTag:SetFontSize( 24 * _1080p )
	ClanTag:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	ClanTag:SetAlignment( LUI.Alignment.Left )
	ClanTag:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 110, _1080p * 200, _1080p * -13, _1080p * 11 )
	ClanTag:SubscribeToModelThroughElement( self, "clanTag", function ()
		local f20_local0 = self:GetDataSource()
		f20_local0 = f20_local0.clanTag:GetValue( f19_local1 )
		if f20_local0 ~= nil then
			ClanTag:setText( f20_local0, 0 )
		end
	end )
	self:addElement( ClanTag )
	self.ClanTag = ClanTag
	
	local RankIcon = nil
	
	RankIcon = LUI.UIImage.new()
	RankIcon.id = "RankIcon"
	RankIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 14, _1080p * 44, _1080p * -16, _1080p * 14 )
	RankIcon:SubscribeToModelThroughElement( self, "rankIcon", function ()
		local f21_local0 = self:GetDataSource()
		f21_local0 = f21_local0.rankIcon:GetValue( f19_local1 )
		if f21_local0 ~= nil then
			RankIcon:setImage( RegisterMaterial( f21_local0 ), 0 )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local Rank = nil
	
	Rank = LUI.UIText.new()
	Rank.id = "Rank"
	Rank:SetRGBFromInt( 14277081, 0 )
	Rank:SetFontSize( 24 * _1080p )
	Rank:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Rank:SetAlignment( LUI.Alignment.Left )
	Rank:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 53, _1080p * 108, _1080p * -13, _1080p * 11 )
	Rank:SubscribeToModelThroughElement( self, "displayRank", function ()
		local f22_local0 = self:GetDataSource()
		f22_local0 = f22_local0.displayRank:GetValue( f19_local1 )
		if f22_local0 ~= nil then
			Rank:setText( f22_local0, 0 )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local MicIcon = nil
	
	MicIcon = LUI.UIImage.new()
	MicIcon.id = "MicIcon"
	MicIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -2, _1080p * -34, _1080p * -16, _1080p * 16 )
	MicIcon:SubscribeToModelThroughElement( self, "microphoneAlpha", function ()
		local f23_local0 = self:GetDataSource()
		f23_local0 = f23_local0.microphoneAlpha:GetValue( f19_local1 )
		if f23_local0 ~= nil then
			MicIcon:SetAlpha( f23_local0, 0 )
		end
	end )
	MicIcon:SubscribeToModelThroughElement( self, "microphoneIcon", function ()
		local f24_local0 = self:GetDataSource()
		f24_local0 = f24_local0.microphoneIcon:GetValue( f19_local1 )
		if f24_local0 ~= nil then
			MicIcon:setImage( RegisterMaterial( f24_local0 ), 0 )
		end
	end )
	self:addElement( MicIcon )
	self.MicIcon = MicIcon
	
	local f19_local11 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and not CONDITIONS.IsPublicMatch( self ) then
		f19_local11 = MenuBuilder.BuildRegisteredType( "MPPlayerRole", {
			controllerIndex = f19_local1
		} )
		f19_local11.id = "MPPlayerRole"
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and not CONDITIONS.IsPublicMatch( self ) then
			f19_local11:SetDataSourceThroughElement( self, nil )
		end
		f19_local11:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 336, _1080p * -32, 0, _1080p * 31 )
		self:addElement( f19_local11 )
		self.MPPlayerRole = f19_local11
	end
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local PartyStripe = nil
	
	PartyStripe = LUI.UIImage.new()
	PartyStripe.id = "PartyStripe"
	PartyStripe:SetRGBFromInt( 14954125, 0 )
	PartyStripe:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -8, 0, 0, 0 )
	self:addElement( PartyStripe )
	self.PartyStripe = PartyStripe
	
	local HostIcon = nil
	
	HostIcon = LUI.UIImage.new()
	HostIcon.id = "HostIcon"
	HostIcon:setImage( RegisterMaterial( "icon_party_leader_crown" ), 0 )
	HostIcon:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -30, _1080p * -11, _1080p * 8, _1080p * -8 )
	self:addElement( HostIcon )
	self.HostIcon = HostIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Background:SetAlpha( 0.7, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Background:AnimateSequence( "ButtonUp" )
		end
		
		Background:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Background:SetAlpha( 0.95, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Background:AnimateSequence( "ButtonOver" )
		end
		
		Gamertag:RegisterAnimationSequence( "ShowRank", {
			{
				function ()
					return self.Gamertag:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 210, _1080p * -13, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		ClanTag:RegisterAnimationSequence( "ShowRank", {
			{
				function ()
					return self.ClanTag:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 110, _1080p * 200, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		self._sequences.ShowRank = function ()
			Gamertag:AnimateSequence( "ShowRank" )
			ClanTag:AnimateSequence( "ShowRank" )
		end
		
		Gamertag:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.Gamertag:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 127, _1080p * -21, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		ClanTag:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.ClanTag:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 27, _1080p * 117, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		self._sequences.HideRank = function ()
			Gamertag:AnimateSequence( "HideRank" )
			ClanTag:AnimateSequence( "HideRank" )
		end
		
		Rank:RegisterAnimationSequence( "MasterPrestige", {
			{
				function ()
					return self.Rank:SetRGBFromTable( SWATCHES.Scoreboard.masterPrestige, 0 )
				end
			}
		} )
		self._sequences.MasterPrestige = function ()
			Rank:AnimateSequence( "MasterPrestige" )
		end
		
		Rank:RegisterAnimationSequence( "NormalPrestige", {
			{
				function ()
					return self.Rank:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		self._sequences.NormalPrestige = function ()
			Rank:AnimateSequence( "NormalPrestige" )
		end
		
	end
	
	self._animationSets.ThirdGameModeAnimationSet = function ()
		Background:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -192, 0, 0, 0 )
				end
			}
		} )
		Accent:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Accent:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 4, _1080p * -192, _1080p * -1, 0, 0 )
				end
			}
		} )
		Gamertag:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Gamertag:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 210, _1080p * -192, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		DropShadow:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * -192, 0, _1080p * 4, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Background:AnimateSequence( "DefaultSequence" )
			Accent:AnimateSequence( "DefaultSequence" )
			Gamertag:AnimateSequence( "DefaultSequence" )
			DropShadow:AnimateSequence( "DefaultSequence" )
		end
		
		Background:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Background:SetAlpha( 0.7, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Background:AnimateSequence( "ButtonUp" )
		end
		
		Background:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Background:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 0.95, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Background:AnimateSequence( "ButtonOver" )
		end
		
		Background:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -280, 0, 0, 0 )
				end
			}
		} )
		GenericButtonSelection:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.GenericButtonSelection:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 420, 0, _1080p * 32, 0 )
				end
			}
		} )
		Accent:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.Accent:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 4, _1080p * -280, _1080p * -1, 0, 0 )
				end
			}
		} )
		Gamertag:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.Gamertag:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 116, _1080p * -104, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		ClanTag:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.ClanTag:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 6, _1080p * 96, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		RankIcon:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.RankIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		Rank:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.Rank:SetAlpha( 0, 0 )
				end
			}
		} )
		DropShadow:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * -280, 0, _1080p * 4, 0 )
				end
			}
		} )
		self._sequences.HideRank = function ()
			Background:AnimateSequence( "HideRank" )
			GenericButtonSelection:AnimateSequence( "HideRank" )
			Accent:AnimateSequence( "HideRank" )
			Gamertag:AnimateSequence( "HideRank" )
			ClanTag:AnimateSequence( "HideRank" )
			RankIcon:AnimateSequence( "HideRank" )
			Rank:AnimateSequence( "HideRank" )
			DropShadow:AnimateSequence( "HideRank" )
		end
		
		Background:RegisterAnimationSequence( "ButtonOverLAN", {
			{
				function ()
					return self.Background:SetAlpha( 0.95, 0 )
				end
			}
		} )
		Gamertag:RegisterAnimationSequence( "ButtonOverLAN", {
			{
				function ()
					return self.Gamertag:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 116, _1080p * -104, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		ClanTag:RegisterAnimationSequence( "ButtonOverLAN", {
			{
				function ()
					return self.ClanTag:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 6, _1080p * 96, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		RankIcon:RegisterAnimationSequence( "ButtonOverLAN", {
			{
				function ()
					return self.RankIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		Rank:RegisterAnimationSequence( "ButtonOverLAN", {
			{
				function ()
					return self.Rank:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOverLAN = function ()
			Background:AnimateSequence( "ButtonOverLAN" )
			Gamertag:AnimateSequence( "ButtonOverLAN" )
			ClanTag:AnimateSequence( "ButtonOverLAN" )
			RankIcon:AnimateSequence( "ButtonOverLAN" )
			Rank:AnimateSequence( "ButtonOverLAN" )
		end
		
		Background:RegisterAnimationSequence( "ButtonUpLAN", {
			{
				function ()
					return self.Background:SetAlpha( 0.7, 0 )
				end
			}
		} )
		Gamertag:RegisterAnimationSequence( "ButtonUpLAN", {
			{
				function ()
					return self.Gamertag:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 116, _1080p * -104, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		ClanTag:RegisterAnimationSequence( "ButtonUpLAN", {
			{
				function ()
					return self.ClanTag:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 6, _1080p * 96, _1080p * -13, _1080p * 11, 0 )
				end
			}
		} )
		RankIcon:RegisterAnimationSequence( "ButtonUpLAN", {
			{
				function ()
					return self.RankIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		Rank:RegisterAnimationSequence( "ButtonUpLAN", {
			{
				function ()
					return self.Rank:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonUpLAN = function ()
			Background:AnimateSequence( "ButtonUpLAN" )
			Gamertag:AnimateSequence( "ButtonUpLAN" )
			ClanTag:AnimateSequence( "ButtonUpLAN" )
			RankIcon:AnimateSequence( "ButtonUpLAN" )
			Rank:AnimateSequence( "ButtonUpLAN" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and not CONDITIONS.IsPublicMatch( self ) then
		f19_local11:SetDataSourceThroughElement( self, nil )
	end
	self:addEventHandler( "button_over", function ( f73_arg0, f73_arg1 )
		local f73_local0 = f73_arg1.controller or f19_local1
		if CONDITIONS.IsCoreMultiplayer( self ) then
			ACTIONS.AnimateSequence( self, "ButtonOver" )
		end
	end )
	self:addEventHandler( "button_up", function ( f74_arg0, f74_arg1 )
		local f74_local0 = f74_arg1.controller or f19_local1
		if CONDITIONS.IsCoreMultiplayer( self ) then
			ACTIONS.AnimateSequence( self, "ButtonUp" )
		end
	end )
	self:SubscribeToModelThroughElement( self, "isMasterPrestige", function ()
		local f75_local0 = self:GetDataSource()
		if f75_local0.isMasterPrestige:GetValue( f19_local1 ) ~= nil then
			f75_local0 = self:GetDataSource()
			if f75_local0.isMasterPrestige:GetValue( f19_local1 ) == true then
				ACTIONS.AnimateSequence( self, "MasterPrestige" )
			end
		end
		f75_local0 = self:GetDataSource()
		if f75_local0.isMasterPrestige:GetValue( f19_local1 ) ~= nil then
			f75_local0 = self:GetDataSource()
			if f75_local0.isMasterPrestige:GetValue( f19_local1 ) == false then
				ACTIONS.AnimateSequence( self, "NormalPrestige" )
			end
		end
	end )
	PostLoadFunc( self, f19_local1, controller )
	if (not CONDITIONS.IsPublicMatch( self ) or CONDITIONS.IsSystemLink( self )) and not CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "HideRank" )
	end
	if CONDITIONS.IsThirdGameMode( self ) and CONDITIONS.IsSystemLink( self ) then
		ACTIONS.AnimateSequence( self, "HideRank" )
	end
	return self
end

MenuBuilder.registerType( "LobbyMember", LobbyMember )
LockTable( _M )
