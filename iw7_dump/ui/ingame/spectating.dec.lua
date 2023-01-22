local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = CONDITIONS.IsSplitscreen( f1_arg0 )
	if f1_local0 then
		assert( f1_arg0.PreviousPlayer )
		assert( f1_arg0.NextPlayer )
		assert( f1_arg0.NextMode )
		f1_arg0:SetScale( -0.33, 0 )
		f1_arg0.PreviousPlayer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, _1080p * 1013, _1080p * 1043 )
		f1_arg0.NextPlayer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 150, _1080p * 450, _1080p * 1013, _1080p * 1043 )
		f1_arg0.NextMode:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -450, _1080p * -150, _1080p * 1013, _1080p * 1043 )
	end
	local f1_local1 = function ()
		local f2_local0 = DataSources.inGame.MP.spectating.nextViewModeText:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			if Engine.IsGamepadEnabled() == 1 and Engine.IsPC() and f2_local0 ~= "" then
				f1_arg0.NextMode:setText( ToUpperCase( Engine.Localize( f2_local0 .. "_GAMEPAD" ) ), 0 )
			else
				f1_arg0.NextMode:setText( ToUpperCase( Engine.Localize( f2_local0 ) ), 0 )
			end
		end
	end
	
	f1_arg0.NextMode:SubscribeToModel( DataSources.inGame.MP.spectating.nextViewModeText:GetModel( f1_arg1 ), f1_local1 )
	if Engine.IsPC() then
		local f1_local2 = function ()
			if Engine.IsGamepadEnabled() == 1 then
				f1_arg0.NextPlayer:setText( ToUpperCase( Engine.Localize( "PLATFORM_FOLLOWNEXTPLAYER_GAMEPAD" ) ), 0 )
				f1_arg0.PreviousPlayer:setText( ToUpperCase( Engine.Localize( "PLATFORM_FOLLOWPREVPLAYER_GAMEPAD" ) ), 0 )
				if Engine.IsAliensMode() then
					f1_arg0.Exit:setText( ToUpperCase( Engine.Localize( "CP_ZOMBIE_EXIT_SPECTATE" ) ), 0 )
				end
			else
				f1_arg0.NextPlayer:setText( ToUpperCase( Engine.Localize( "PLATFORM_FOLLOWNEXTPLAYER", "KEY_MOUSE1" ) ), 0 )
				f1_arg0.PreviousPlayer:setText( ToUpperCase( Engine.Localize( "PLATFORM_FOLLOWPREVPLAYER", "KEY_MOUSE2" ) ), 0 )
				if Engine.IsAliensMode() then
					f1_arg0.Exit:setText( ToUpperCase( Engine.Localize( "CP_ZOMBIE_EXIT_SPECTATE" ) ), 0 )
				end
			end
			f1_local1()
		end
		
		f1_local2()
		f1_arg0:registerEventHandler( "empty_menu_stack", f1_local2 )
	end
	if not Engine.GetDvarBool( "camera_allow3rdspectate" ) or f1_local0 then
		f1_arg0.NextMode:closeChildren()
		f1_arg0.NextMode:close()
	end
end

function Spectating( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "Spectating"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Spectatingbg = nil
	
	Spectatingbg = MenuBuilder.BuildRegisteredType( "Spectating_bg", {
		controllerIndex = f4_local1
	} )
	Spectatingbg.id = "Spectatingbg"
	Spectatingbg:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -254, _1080p * 245, _1080p * -259.5, _1080p * -82.5 )
	self:addElement( Spectatingbg )
	self.Spectatingbg = Spectatingbg
	
	local PlayerCard = nil
	
	PlayerCard = MenuBuilder.BuildRegisteredType( "SmallPlayerCard", {
		controllerIndex = f4_local1
	} )
	PlayerCard.id = "PlayerCard"
	PlayerCard:SetScale( 0.19, 0 )
	PlayerCard:SetDataSource( DataSources.inGame.MP.spectating.playerCard, f4_local1 )
	PlayerCard:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -213.29, _1080p * 204.71, _1080p * -214.2, _1080p * -95.2 )
	self:addElement( PlayerCard )
	self.PlayerCard = PlayerCard
	
	local Spectating = nil
	
	Spectating = LUI.UIText.new()
	Spectating.id = "Spectating"
	Spectating:SetRGBFromInt( 12237498, 0 )
	Spectating:setText( ToUpperCase( Engine.Localize( "CGAME_FOLLOWING" ) ), 0 )
	Spectating:SetFontSize( 26 * _1080p )
	Spectating:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Spectating:SetAlignment( LUI.Alignment.Center )
	Spectating:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -252.29, _1080p * 243.71, _1080p * -255.5, _1080p * -229.5 )
	self:addElement( Spectating )
	self.Spectating = Spectating
	
	local NextMode = nil
	
	NextMode = LUI.UIText.new()
	NextMode.id = "NextMode"
	NextMode:setText( ToUpperCase( LocalizeString( "" ) ), 0 )
	NextMode:SetFontSize( 26 * _1080p )
	NextMode:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	NextMode:setTextStyle( CoD.TextStyle.Shadowed )
	NextMode:SetAlignment( LUI.Alignment.Center )
	NextMode:SetOptOutRightToLeftAlignmentFlip( true )
	NextMode:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -450, _1080p * -150, _1080p * 1013, _1080p * 1039 )
	self:addElement( NextMode )
	self.NextMode = NextMode
	
	local NextPlayer = nil
	
	NextPlayer = LUI.UIText.new()
	NextPlayer.id = "NextPlayer"
	NextPlayer:setText( ToUpperCase( Engine.Localize( "PLATFORM_FOLLOWNEXTPLAYER" ) ), 0 )
	NextPlayer:SetFontSize( 26 * _1080p )
	NextPlayer:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	NextPlayer:setTextStyle( CoD.TextStyle.Shadowed )
	NextPlayer:SetAlignment( LUI.Alignment.Center )
	NextPlayer:SetOptOutRightToLeftAlignmentFlip( true )
	NextPlayer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 150, _1080p * 450, _1080p * 1013, _1080p * 1039 )
	self:addElement( NextPlayer )
	self.NextPlayer = NextPlayer
	
	local PreviousPlayer = nil
	
	PreviousPlayer = LUI.UIText.new()
	PreviousPlayer.id = "PreviousPlayer"
	PreviousPlayer:setText( ToUpperCase( Engine.Localize( "PLATFORM_FOLLOWPREVPLAYER" ) ), 0 )
	PreviousPlayer:SetFontSize( 26 * _1080p )
	PreviousPlayer:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PreviousPlayer:setTextStyle( CoD.TextStyle.Shadowed )
	PreviousPlayer:SetAlignment( LUI.Alignment.Center )
	PreviousPlayer:SetOptOutRightToLeftAlignmentFlip( true )
	PreviousPlayer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, _1080p * 1013, _1080p * 1039 )
	self:addElement( PreviousPlayer )
	self.PreviousPlayer = PreviousPlayer
	
	local f4_local9 = nil
	if Engine.IsAliensMode() then
		f4_local9 = LUI.UIText.new()
		f4_local9.id = "Exit"
		f4_local9:setText( ToUpperCase( Engine.Localize( "CP_ZOMBIE_EXIT_SPECTATE" ) ), 0 )
		f4_local9:SetFontSize( 26 * _1080p )
		f4_local9:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f4_local9:setTextStyle( CoD.TextStyle.Shadowed )
		f4_local9:SetAlignment( LUI.Alignment.Center )
		f4_local9:SetOptOutRightToLeftAlignmentFlip( true )
		f4_local9:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -450, _1080p * -150, _1080p * 1013, _1080p * 1039 )
		self:addElement( f4_local9 )
		self.Exit = f4_local9
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Spectatingbg:RegisterAnimationSequence( "LoadingPlayer", {
			{
				function ()
					return self.Spectatingbg:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -253, _1080p * 245, _1080p * -259.5, _1080p * -82.5, 0 )
				end
			}
		} )
		PlayerCard:RegisterAnimationSequence( "LoadingPlayer", {
			{
				function ()
					return self.PlayerCard:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.PlayerCard:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -213.29, _1080p * 204.71, _1080p * -212.2, _1080p * -93.2, 0 )
				end
			}
		} )
		Spectating:RegisterAnimationSequence( "LoadingPlayer", {
			{
				function ()
					return self.Spectating:setText( ToUpperCase( Engine.Localize( "PLATFORM_FOLLOW_LOADING" ) ), 0 )
				end
			},
			{
				function ()
					return self.Spectating:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -252, _1080p * 244, _1080p * -255.5, _1080p * -227.5, 0 )
				end
			}
		} )
		self._sequences.LoadingPlayer = function ()
			Spectatingbg:AnimateSequence( "LoadingPlayer" )
			PlayerCard:AnimateSequence( "LoadingPlayer" )
			Spectating:AnimateSequence( "LoadingPlayer" )
		end
		
		Spectatingbg:RegisterAnimationSequence( "NotLoadingPlayer", {
			{
				function ()
					return self.Spectatingbg:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -253, _1080p * 245, _1080p * -259.5, _1080p * -82.5, 0 )
				end
			}
		} )
		PlayerCard:RegisterAnimationSequence( "NotLoadingPlayer", {
			{
				function ()
					return self.PlayerCard:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.PlayerCard:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -213.29, _1080p * 204.71, _1080p * -212.2, _1080p * -93.2, 0 )
				end
			}
		} )
		Spectating:RegisterAnimationSequence( "NotLoadingPlayer", {
			{
				function ()
					return self.Spectating:setText( ToUpperCase( Engine.Localize( "CGAME_FOLLOWING" ) ), 0 )
				end
			},
			{
				function ()
					return self.Spectating:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -252, _1080p * 244, _1080p * -255.5, _1080p * -227.5, 0 )
				end
			}
		} )
		self._sequences.NotLoadingPlayer = function ()
			Spectatingbg:AnimateSequence( "NotLoadingPlayer" )
			PlayerCard:AnimateSequence( "NotLoadingPlayer" )
			Spectating:AnimateSequence( "NotLoadingPlayer" )
		end
		
		Spectatingbg:RegisterAnimationSequence( "Following", {
			{
				function ()
					return self.Spectatingbg:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -253, _1080p * 245, _1080p * -259.5, _1080p * -82, 0 )
				end
			}
		} )
		PlayerCard:RegisterAnimationSequence( "Following", {
			{
				function ()
					return self.PlayerCard:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.PlayerCard:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -213.29, _1080p * 204.71, _1080p * -212.2, _1080p * -93.2, 0 )
				end
			}
		} )
		Spectating:RegisterAnimationSequence( "Following", {
			{
				function ()
					return self.Spectating:setText( ToUpperCase( Engine.Localize( "CGAME_FOLLOWING" ) ), 0 )
				end
			},
			{
				function ()
					return self.Spectating:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -253, _1080p * 245, _1080p * -255.5, _1080p * -227.5, 0 )
				end
			}
		} )
		self._sequences.Following = function ()
			Spectatingbg:AnimateSequence( "Following" )
			PlayerCard:AnimateSequence( "Following" )
			Spectating:AnimateSequence( "Following" )
		end
		
		Spectatingbg:RegisterAnimationSequence( "NotFollowing", {
			{
				function ()
					return self.Spectatingbg:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Spectatingbg:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -249, _1080p * 249, _1080p * -127, _1080p * -88, 0 )
				end
			}
		} )
		PlayerCard:RegisterAnimationSequence( "NotFollowing", {
			{
				function ()
					return self.PlayerCard:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.PlayerCard:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -213.29, _1080p * 204.71, _1080p * -174.2, _1080p * -55.2, 0 )
				end
			}
		} )
		Spectating:RegisterAnimationSequence( "NotFollowing", {
			{
				function ()
					return self.Spectating:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Spectating:setText( ToUpperCase( Engine.Localize( "CGAME_FOLLOWING" ) ), 0 )
				end
			},
			{
				function ()
					return self.Spectating:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -247, _1080p * 249, _1080p * -121, _1080p * -93, 0 )
				end
			}
		} )
		self._sequences.NotFollowing = function ()
			Spectatingbg:AnimateSequence( "NotFollowing" )
			PlayerCard:AnimateSequence( "NotFollowing" )
			Spectating:AnimateSequence( "NotFollowing" )
		end
		
		NextMode:RegisterAnimationSequence( "PCLayout", {
			{
				function ()
					return self.NextMode:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -450, _1080p * -150, _1080p * 1015, _1080p * 1041, 0 )
				end
			}
		} )
		NextPlayer:RegisterAnimationSequence( "PCLayout", {
			{
				function ()
					return self.NextPlayer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 150, _1080p * 450, _1080p * 1015, _1080p * 1041, 0 )
				end
			}
		} )
		PreviousPlayer:RegisterAnimationSequence( "PCLayout", {
			{
				function ()
					return self.PreviousPlayer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, _1080p * 1015, _1080p * 1041, 0 )
				end
			}
		} )
		if Engine.IsAliensMode() then
			f4_local9:RegisterAnimationSequence( "PCLayout", {
				{
					function ()
						return self.Exit:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -450, _1080p * -150, _1080p * 1015, _1080p * 1041, 0 )
					end
				}
			} )
		end
		self._sequences.PCLayout = function ()
			NextMode:AnimateSequence( "PCLayout" )
			NextPlayer:AnimateSequence( "PCLayout" )
			PreviousPlayer:AnimateSequence( "PCLayout" )
			if Engine.IsAliensMode() then
				f4_local9:AnimateSequence( "PCLayout" )
			end
		end
		
		NextPlayer:RegisterAnimationSequence( "CPLayout", {
			{
				function ()
					return self.NextPlayer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 150, _1080p * 450, _1080p * 1015, _1080p * 1041, 0 )
				end
			}
		} )
		PreviousPlayer:RegisterAnimationSequence( "CPLayout", {
			{
				function ()
					return self.PreviousPlayer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, _1080p * 1015, _1080p * 1041, 0 )
				end
			}
		} )
		if Engine.IsAliensMode() then
			f4_local9:RegisterAnimationSequence( "CPLayout", {
				{
					function ()
						return self.Exit:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -450, _1080p * -150, _1080p * 1015, _1080p * 1041, 0 )
					end
				}
			} )
		end
		self._sequences.CPLayout = function ()
			NextPlayer:AnimateSequence( "CPLayout" )
			PreviousPlayer:AnimateSequence( "CPLayout" )
			if Engine.IsAliensMode() then
				f4_local9:AnimateSequence( "CPLayout" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PlayerCard:SetDataSource( DataSources.inGame.MP.spectating.playerCard, f4_local1 )
	self:SubscribeToModel( DataSources.inGame.MP.spectating.isSwitchingPlayer:GetModel( f4_local1 ), function ()
		if DataSources.inGame.MP.spectating.isSwitchingPlayer:GetValue( f4_local1 ) ~= nil and DataSources.inGame.MP.spectating.isSwitchingPlayer:GetValue( f4_local1 ) == true then
			ACTIONS.AnimateSequence( self, "LoadingPlayer" )
		end
		if DataSources.inGame.MP.spectating.isSwitchingPlayer:GetValue( f4_local1 ) ~= nil and DataSources.inGame.MP.spectating.isSwitchingPlayer:GetValue( f4_local1 ) == false then
			ACTIONS.AnimateSequence( self, "NotLoadingPlayer" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.MP.spectating.isFollowingPlayer:GetModel( f4_local1 ), function ()
		if DataSources.inGame.MP.spectating.isFollowingPlayer:GetValue( f4_local1 ) ~= nil and DataSources.inGame.MP.spectating.isFollowingPlayer:GetValue( f4_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Following" )
		end
		if DataSources.inGame.MP.spectating.isFollowingPlayer:GetValue( f4_local1 ) ~= nil and DataSources.inGame.MP.spectating.isFollowingPlayer:GetValue( f4_local1 ) == false then
			ACTIONS.AnimateSequence( self, "NotFollowing" )
		end
	end )
	PostLoadFunc( self, f4_local1, controller )
	if CONDITIONS.IsPC( self ) then
		ACTIONS.AnimateSequence( self, "PCLayout" )
	end
	if not CONDITIONS.IsPC( self ) and CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPLayout" )
	end
	return self
end

MenuBuilder.registerType( "Spectating", Spectating )
LockTable( _M )
