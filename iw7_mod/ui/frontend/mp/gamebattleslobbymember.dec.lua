local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg1.controller
		assert( f2_local0 )
		local f2_local1 = f2_arg0:GetDataSource()
		local f2_local2 = Lobby.GetActivePartyMemberXUID( f2_local1.memberIndex:GetValue( f2_local0 ) )
		assert( f2_local2 )
		if not Lobby.IsLocalPlayer( f2_local2 ) then
			LUI.FlowManager.RequestPopupMenu( nil, "LobbyMemberActions", true, f2_local0, false, {
				xuid = f2_local2
			} )
		end
	end )
	f1_arg0.bindButton:addEventHandler( "button_alt1", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg0:getParent()
		if #f3_local0:getAllFocusedChildren() <= 0 then
			f3_local0 = f3_arg0:getParent()
			if f3_local0:isInFocus() then
				f3_local0 = f1_arg0:GetDataSource()
				local f3_local1 = Lobby.GetActivePartyMemberXUID( f3_local0.memberIndex:GetValue( f1_arg1 ) )
				assert( f3_local1 )
				if not Lobby.IsLocalPlayer( f3_local1 ) then
					Lobby.ToggleMute( f1_arg1, f3_local1 )
				end
				return true
			end
			return false
		end
		f3_local0 = f1_arg0:GetDataSource()
		local f3_local1 = Lobby.GetActivePartyMemberXUID( f3_local0.memberIndex:GetValue( f1_arg1 ) )
		assert( f3_local1 )
		if not Lobby.IsLocalPlayer( f3_local1 ) then
			Lobby.ToggleMute( f1_arg1, f3_local1 )
		end
		return true
	end )
	f1_arg0.Gamertag:SubscribeToModelThroughElement( f1_arg0, "gamertag", function ()
		local f4_local0 = f1_arg0:GetDataSource()
		f4_local0 = f4_local0.gamertag:GetValue( f1_arg1 )
		if f4_local0 ~= nil then
			f1_arg0.Gamertag:setText( f4_local0, 0 )
		end
		local f4_local1 = f1_arg0:GetDataSource()
		if f4_local1.missingGamertag:GetValue( f1_arg1 ) then
			f1_arg0.RankIcon:SetAlpha( 0 )
			f1_arg0.Rank:SetAlpha( 0 )
		else
			f1_arg0.RankIcon:SetAlpha( 1 )
			f1_arg0.Rank:SetAlpha( 1 )
		end
	end )
	f1_arg0.CommitReadyIcon:SubscribeToModelThroughElement( f1_arg0, "commitReady", function ()
		local f5_local0 = f1_arg0:GetDataSource()
		f5_local0 = f5_local0.commitReady:GetValue( f1_arg1 )
		local f5_local1 = f1_arg0.CommitReadyIcon
		local f5_local2 = f5_local1
		f5_local1 = f5_local1.SetAlpha
		local f5_local3
		if f5_local0 then
			f5_local3 = 1
			if not f5_local3 then
			
			else
				f5_local1( f5_local2, f5_local3 )
			end
		end
		f5_local3 = 0
	end )
	ACTIONS.AnimateSequence( f1_arg0, "ButtonUp" )
end

function GameBattlesLobbyMember( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 32 * _1080p )
	self.id = "GameBattlesLobbyMember"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.7, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f6_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 700, 0, _1080p * 32 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local Accent = nil
	
	Accent = LUI.UIImage.new()
	Accent.id = "Accent"
	Accent:SetRGBFromTable( SWATCHES.Lobby.memberClanText, 0 )
	Accent:SetAlpha( 0.6, 0 )
	Accent:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 4, 0, _1080p * -1, 0 )
	self:addElement( Accent )
	self.Accent = Accent
	
	local Gamertag = nil
	
	Gamertag = LUI.UIText.new()
	Gamertag.id = "Gamertag"
	Gamertag:SetRGBFromTable( SWATCHES.Lobby.memberText, 0 )
	Gamertag:setText( "WWWWWWWWWWWWWWWW", 0 )
	Gamertag:SetFontSize( 24 * _1080p )
	Gamertag:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	Gamertag:SetAlignment( LUI.Alignment.Left )
	Gamertag:SetOptOutRightToLeftAlignmentFlip( true )
	Gamertag:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 210, _1080p * -10, _1080p * -13, _1080p * 11 )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local ClanTag = nil
	
	ClanTag = LUI.UIText.new()
	ClanTag.id = "ClanTag"
	ClanTag:SetFontSize( 24 * _1080p )
	ClanTag:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	ClanTag:SetAlignment( LUI.Alignment.Left )
	ClanTag:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 110, _1080p * 200, _1080p * -13, _1080p * 11 )
	ClanTag:SubscribeToModelThroughElement( self, "clanTag", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.clanTag:GetValue( f6_local1 )
		if f7_local0 ~= nil then
			ClanTag:setText( f7_local0, 0 )
		end
	end )
	self:addElement( ClanTag )
	self.ClanTag = ClanTag
	
	local RankIcon = nil
	
	RankIcon = LUI.UIImage.new()
	RankIcon.id = "RankIcon"
	RankIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 14, _1080p * 44, _1080p * -16, _1080p * 14 )
	RankIcon:SubscribeToModelThroughElement( self, "rankIcon", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.rankIcon:GetValue( f6_local1 )
		if f8_local0 ~= nil then
			RankIcon:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local Rank = nil
	
	Rank = LUI.UIText.new()
	Rank.id = "Rank"
	Rank:SetRGBFromTable( SWATCHES.Lobby.memberClanText, 0 )
	Rank:SetFontSize( 24 * _1080p )
	Rank:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Rank:SetAlignment( LUI.Alignment.Left )
	Rank:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 53, _1080p * 108, _1080p * -13, _1080p * 11 )
	Rank:SubscribeToModelThroughElement( self, "displayRank", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.displayRank:GetValue( f6_local1 )
		if f9_local0 ~= nil then
			Rank:setText( f9_local0, 0 )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local MicIcon = nil
	
	MicIcon = LUI.UIImage.new()
	MicIcon.id = "MicIcon"
	MicIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -2, _1080p * -34, _1080p * -16, _1080p * 16 )
	MicIcon:SubscribeToModelThroughElement( self, "microphoneAlpha", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.microphoneAlpha:GetValue( f6_local1 )
		if f10_local0 ~= nil then
			MicIcon:SetAlpha( f10_local0, 0 )
		end
	end )
	MicIcon:SubscribeToModelThroughElement( self, "microphoneIcon", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.microphoneIcon:GetValue( f6_local1 )
		if f11_local0 ~= nil then
			MicIcon:setImage( RegisterMaterial( f11_local0 ), 0 )
		end
	end )
	self:addElement( MicIcon )
	self.MicIcon = MicIcon
	
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local CommitReadyIcon = nil
	
	CommitReadyIcon = LUI.UIImage.new()
	CommitReadyIcon.id = "CommitReadyIcon"
	CommitReadyIcon:setImage( RegisterMaterial( "icon_perks_ready_up" ), 0 )
	CommitReadyIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -77, _1080p * -34, _1080p * -24, _1080p * 24 )
	self:addElement( CommitReadyIcon )
	self.CommitReadyIcon = CommitReadyIcon
	
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
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f19_arg0, f19_arg1 )
		if #f19_arg0:getAllFocusedChildren() > 0 or f19_arg0:isInFocus() then
			f19_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "XBOXLIVE_PLAYER_MUTE" ),
				button_ref = "button_alt1",
				side = "left",
				priority = 100,
				clickable = true
			} )
		end
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:addEventHandler( "button_over", function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f21_arg0, f21_arg1 )
		local f21_local0 = f21_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "gain_focus", function ( f22_arg0, f22_arg1 )
		local f22_local0 = f22_arg1.controller or f6_local1
		f22_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "XBOXLIVE_PLAYER_MUTE" ),
			button_ref = "button_alt1",
			side = "left",
			priority = 100,
			clickable = true
		} )
	end )
	self:addEventHandler( "lose_focus", function ( f23_arg0, f23_arg1 )
		local f23_local0 = f23_arg1.controller or f6_local1
		f23_arg0:RemoveButtonHelperText( "button_alt1", "left" )
		local f23_local1 = f23_arg0:getParent()
		while f23_local1 and not f23_local1.addButtonHelperFunction and f23_local1.id ~= f6_local2.id do
			f23_local1 = f23_local1:getParent()
		end
		if f23_local1 and f23_local1.addButtonHelperFunction then
			f23_local1.addButtonHelperFunction( f23_arg0, f23_arg1 )
		end
	end )
	PostLoadFunc( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "GameBattlesLobbyMember", GameBattlesLobbyMember )
LockTable( _M )
