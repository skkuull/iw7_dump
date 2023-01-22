local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = {
	TEAM_FREE = 0,
	TEAM_AXIS = 1,
	TEAM_ALLIES = 2,
	TEAM_SPECTATOR = 3
}
f0_local1 = {
	"LUA_MENU_AUTOASSIGN_CAPS",
	"MENU_FACTION_SDF_SHORT",
	"MENU_FACTION_UNSA_SHORT",
	"CODCASTER_CAPS"
}
f0_local2 = function ( f1_arg0 )
	if f1_arg0.isMLGSpectator then
		f1_arg0.TextToChange:setText( Engine.Localize( "CODCASTER_CAPS" ), 0 )
	else
		f1_arg0.TextToChange:setText( Engine.Localize( "LUA_MENU_AUTOASSIGN_CAPS" ), 0 )
	end
end

local f0_local3 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	local f2_local0 = f2_arg1:GetDataSource()
	local f2_local1 = false
	local f2_local2 = f2_arg0:GetCurrentMenu()
	local f2_local3 = f2_local2.LobbyMembers.canChooseRole
	local f2_local4 = Lobby.IsTeamAssignmentEnabled()
	local f2_local5 = f2_arg0:getParent()
	f2_local5 = f2_local5:GetDataSource()
	local f2_local6 = f2_local5.team:GetValue( f2_arg3 )
	if f2_local6 ~= nil and f2_arg0.team ~= f2_local6 then
		f2_arg0.team = f2_local6
	end
	if f2_local0 and f2_local3 and f2_local0.controllerIndex:GetValue( f2_arg3 ) == f2_arg3 then
		if Engine.InLobby() then
			if f2_local4 then
				local f2_local7 = f2_arg0.team + f2_arg2
				if f2_local7 == Teams.spectator and not CODCASTER.CanCODCast() then
					f2_local7 = f2_local7 + 1
				end
				if f2_local7 > Teams.spectator then
					f2_local7 = Teams.free
				end
				if f2_local7 < Teams.free then
					f2_local7 = Teams.spectator
					if not CODCASTER.CanCODCast() then
						f2_local7 = f2_local7 - 1
					end
				end
				f2_arg0.team = f2_local7
				if f2_local7 == Teams.free and CONDITIONS.IsCWLDraftLobby() then
					f2_arg0.TextToChange:setText( Engine.Localize( "MP_FRONTEND_ONLY_NO_TEAM" ), 0 )
				else
					f2_arg0.TextToChange:setText( Engine.Localize( f0_local1[f2_local7 + 1] ), 0 )
				end
				if f2_local7 < Teams.spectator then
					LobbyMember.SelectedMember_SetLocalMemberMLGSpectator( false, f2_arg3 )
					f2_arg0.isMLGSpectator = false
				else
					LobbyMember.SelectedMember_SetLocalMemberMLGSpectator( true, f2_arg3 )
					f2_arg0.isMLGSpectator = true
				end
				Lobby.SetDesiredLobbyTeamSelection( f2_arg3, f2_local7 )
				ACTIONS.AnimateSequence( f2_arg0:getParent(), "Show" )
			elseif CODCASTER.CanCODCast() then
				f2_arg0.isMLGSpectator = not f2_arg0.isMLGSpectator
				LobbyMember.SelectedMember_SetLocalMemberMLGSpectator( f2_arg0.isMLGSpectator, f2_arg3 )
				f0_local2( f2_arg0 )
				ACTIONS.AnimateSequence( f2_arg0:getParent(), "Show" )
			end
		end
		f2_local1 = true
		f2_arg0:dispatchEventToRoot( {
			name = "update_codcaster_status",
			immediate = true,
			isCODCaster = f2_arg0.isMLGSpectator,
			memberIndex = f2_local5.memberIndex:GetValue( f2_arg3 )
		} )
	end
	return f2_local1
end

local f0_local4 = function ( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.LeftBump )
	assert( f3_arg0.RightBump )
	
	local BindButton = LUI.UIBindButton.new()
	BindButton.id = "fakeButton"
	BindButton.TextToChange = f3_arg0.RoleName
	BindButton.isMLGSpectator = Lobby.IsMemberMLGSpectator( 0, f3_arg1 )
	BindButton.team = Teams.free
	BindButton.HandleButtonPress = f0_local3
	BindButton.PlayerRole = f3_arg0
	f3_arg0:addElement( BindButton )
	f3_arg0.BindButton = BindButton
	
	BindButton:registerEventHandler( "button_shoulderr", function ( element, event )
		local f4_local0 = event.controller
		assert( f4_local0 )
		return element:HandleButtonPress( element.PlayerRole, 1, f4_local0 )
	end )
	BindButton:registerEventHandler( "button_shoulderl", function ( element, event )
		local f5_local0 = event.controller
		assert( f5_local0 )
		return element:HandleButtonPress( element.PlayerRole, -1, f5_local0 )
	end )
	f0_local2( BindButton )
	if Engine.IsPC() and not CONDITIONS.IsGamepadEnabled( f3_arg0 ) then
		f3_arg0.LeftBump:closeTree()
		f3_arg0.RightBump:closeTree()
		f3_arg0.RoleName:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -75, _1080p * 75, _1080p * -11, _1080p * 11 )
	end
	f3_arg0.isMLGSpectator = false
end

function MPPlayerRole( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 270 * _1080p, 0, 31 * _1080p )
	self.id = "MPPlayerRole"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local Fader = nil
	
	Fader = LUI.UIImage.new()
	Fader.id = "Fader"
	Fader:SetRGBFromInt( 0, 0 )
	Fader:SetAlpha( 0, 0 )
	Fader:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	Fader:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -75, _1080p * 75, _1080p * -0.5, _1080p * -0.5 )
	self:addElement( Fader )
	self.Fader = Fader
	
	local RightBump = nil
	
	RightBump = LUI.UIText.new()
	RightBump.id = "RightBump"
	RightBump:SetAlpha( 0, 0 )
	RightBump:setText( Engine.Localize( "LUA_MENU_PAD_RIGHT_SHOULDER_BUTTON" ), 0 )
	RightBump:SetFontSize( 30 * _1080p )
	RightBump:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	RightBump:SetAlignment( LUI.Alignment.Right )
	RightBump:SetOptOutRightToLeftAlignmentFlip( true )
	RightBump:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -16, 0, _1080p * -15, _1080p * 15 )
	self:addElement( RightBump )
	self.RightBump = RightBump
	
	local LeftBump = nil
	
	LeftBump = LUI.UIText.new()
	LeftBump.id = "LeftBump"
	LeftBump:SetAlpha( 0, 0 )
	LeftBump:setText( Engine.Localize( "LUA_MENU_PAD_LEFT_SHOULDER_BUTTON" ), 0 )
	LeftBump:SetFontSize( 30 * _1080p )
	LeftBump:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	LeftBump:SetAlignment( LUI.Alignment.Left )
	LeftBump:SetOptOutRightToLeftAlignmentFlip( true )
	LeftBump:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 16, _1080p * -15, _1080p * 15 )
	self:addElement( LeftBump )
	self.LeftBump = LeftBump
	
	local RoleName = nil
	
	RoleName = LUI.UIStyledText.new()
	RoleName.id = "RoleName"
	RoleName:SetAlpha( 0, 0 )
	RoleName:setText( Engine.Localize( "CODCASTER_CAPS" ), 0 )
	RoleName:SetFontSize( 22 * _1080p )
	RoleName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RoleName:SetAlignment( LUI.Alignment.Center )
	RoleName:SetOptOutRightToLeftAlignmentFlip( true )
	RoleName:SetStartupDelay( 1000 )
	RoleName:SetLineHoldTime( 400 )
	RoleName:SetAnimMoveTime( 150 )
	RoleName:SetEndDelay( 1000 )
	RoleName:SetCrossfadeTime( 400 )
	RoleName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	RoleName:SetMaxVisibleLines( 1 )
	RoleName:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -11, _1080p * 11 )
	self:addElement( RoleName )
	self.RoleName = RoleName
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Fader:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Fader:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.Fader:SetAlpha( 0.6, 1300 )
				end,
				function ()
					return self.Fader:SetAlpha( 0, 400 )
				end
			}
		} )
		RightBump:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.RightBump:SetAlpha( 1, 0 )
				end,
				function ()
					return self.RightBump:SetAlpha( 1, 1300 )
				end,
				function ()
					return self.RightBump:SetAlpha( 0, 400 )
				end
			}
		} )
		LeftBump:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.LeftBump:SetAlpha( 1, 0 )
				end,
				function ()
					return self.LeftBump:SetAlpha( 1, 1300 )
				end,
				function ()
					return self.LeftBump:SetAlpha( 0, 400 )
				end
			}
		} )
		RoleName:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.RoleName:SetAlpha( 1, 0 )
				end,
				function ()
					return self.RoleName:SetAlpha( 1, 1300 )
				end,
				function ()
					return self.RoleName:SetAlpha( 0, 400 )
				end
			}
		} )
		self._sequences.Show = function ()
			Fader:AnimateSequence( "Show" )
			RightBump:AnimateSequence( "Show" )
			LeftBump:AnimateSequence( "Show" )
			RoleName:AnimateSequence( "Show" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local4( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "MPPlayerRole", MPPlayerRole )
LockTable( _M )
