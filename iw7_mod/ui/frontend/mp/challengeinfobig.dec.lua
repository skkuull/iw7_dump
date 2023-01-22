local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = assert
	local f1_local1 = f1_arg0.ChallengeInfoBigProgress0
	if f1_local1 then
		f1_local1 = f1_arg0.ChallengeInfoBigProgress0.ChallengesTiers
	end
	f1_local0( f1_local1 )
	if CONDITIONS.IsThirdGameMode( f1_arg0 ) then
		f1_arg0.CPScreen:SetMask( f1_arg0.CPScreenMask )
		if IsLanguageArabic() then
			f1_arg0.NameHeaderLeftBarCP:SetAlpha( 0, 0 )
			f1_arg0.DescLeftBarCP:SetAlpha( 0, 0 )
		end
	end
	f1_arg0:addEventHandler( "selection_changed", function ( f2_arg0, f2_arg1 )
		assert( f2_arg1.newSelection )
		f1_arg0:SetDataSource( f2_arg1.newSelection:GetDataSource( f1_arg1 ), f1_arg1 )
	end )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "isCompleted", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		if not f3_local0.isCompleted:GetValue( f1_arg1 ) then
			ACTIONS.AnimateSequence( f1_arg0, "Locked" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "DefaultSequence" )
		end
		local f3_local1 = f1_arg0:GetDataSource()
		f3_local1 = f3_local1.isHiddenChallenge:GetValue( f1_arg1 )
		if f3_local1 and f3_local1 ~= nil then
			ACTIONS.AnimateSequence( f1_arg0, "Hidden" )
		end
	end )
	f1_local1 = Engine.Localize( "LUA_MENU_UNLOCK_MAX_TIER" )
	f1_arg0.LockStatusLabel:setText( f1_local1, 0 )
	local f1_local2 = f1_arg0.LockStatusLabel:GetCurrentFont()
	local f1_local3, f1_local4, f1_local5, f1_local6 = f1_arg0.LockStatusLabel:getLocalRect()
	local f1_local7, f1_local8, f1_local9, f1_local10 = GetTextDimensions( f1_local1, f1_local2, math.abs( f1_local4 - f1_local6 ) )
	local f1_local11 = (f1_local9 - f1_local7 + 36) / 2
	f1_arg0.LockStatusLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 304.5 - f1_local11, _1080p * 505, _1080p * 99.5, _1080p * 119.5 )
	f1_arg0.Padlock:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 260.5 - f1_local11, _1080p * 296.5 - f1_local11, _1080p * -266.5, _1080p * -230.5 )
end

function ChallengeInfoBig( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 521 * _1080p, 0, 716 * _1080p )
	self.id = "ChallengeInfoBig"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local f4_local3 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local3 = LUI.UIBlur.new()
		f4_local3.id = "ListBlur"
		f4_local3:SetBlurStrength( 1.5, 0 )
		self:addElement( f4_local3 )
		self.ListBlur = f4_local3
	end
	local f4_local4 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local4 = LUI.UIImage.new()
		f4_local4.id = "GradientBackgroundInGameOnly"
		f4_local4:SetRGBFromInt( 0, 0 )
		f4_local4:SetAlpha( 0.4, 0 )
		self:addElement( f4_local4 )
		self.GradientBackgroundInGameOnly = f4_local4
	end
	local GradBackroundCP = nil
	
	GradBackroundCP = LUI.UIImage.new()
	GradBackroundCP.id = "GradBackroundCP"
	GradBackroundCP:SetRGBFromInt( 0, 0 )
	GradBackroundCP:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	self:addElement( GradBackroundCP )
	self.GradBackroundCP = GradBackroundCP
	
	local f4_local6 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local6 = LUI.UIImage.new()
		f4_local6.id = "CPScreen"
		f4_local6:SetAlpha( 0.6, 0 )
		f4_local6:setImage( RegisterMaterial( "cp_faf_card_screen_backing_grad" ), 0 )
		f4_local6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -188, _1080p * 818, _1080p * 445, _1080p * 681 )
		self:addElement( f4_local6 )
		self.CPScreen = f4_local6
	end
	local f4_local7 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local7 = LUI.UIImage.new()
		f4_local7.id = "CPScreenMask"
		f4_local7:setImage( RegisterMaterial( "widg_gradient_bottom_to_top_opaque_dark" ), 0 )
		f4_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -188, _1080p * 818, _1080p * 445, _1080p * 681 )
		self:addElement( f4_local7 )
		self.CPScreenMask = f4_local7
	end
	local TicBRCopy1 = nil
	
	TicBRCopy1 = LUI.UIImage.new()
	TicBRCopy1.id = "TicBRCopy1"
	TicBRCopy1:SetAlpha( 0.8, 0 )
	TicBRCopy1:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -15, _1080p * -1, _1080p * -4, _1080p * -1 )
	self:addElement( TicBRCopy1 )
	self.TicBRCopy1 = TicBRCopy1
	
	local TicBRCopy2 = nil
	
	TicBRCopy2 = LUI.UIImage.new()
	TicBRCopy2.id = "TicBRCopy2"
	TicBRCopy2:SetAlpha( 0.8, 0 )
	TicBRCopy2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -15, _1080p * -1, _1080p * 1, _1080p * 4 )
	self:addElement( TicBRCopy2 )
	self.TicBRCopy2 = TicBRCopy2
	
	local TicBRCopy3 = nil
	
	TicBRCopy3 = LUI.UIImage.new()
	TicBRCopy3.id = "TicBRCopy3"
	TicBRCopy3:SetAlpha( 0.8, 0 )
	TicBRCopy3:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1, _1080p * 15, _1080p * -4, _1080p * -1 )
	self:addElement( TicBRCopy3 )
	self.TicBRCopy3 = TicBRCopy3
	
	local TicBRCopy4 = nil
	
	TicBRCopy4 = LUI.UIImage.new()
	TicBRCopy4.id = "TicBRCopy4"
	TicBRCopy4:SetAlpha( 0.8, 0 )
	TicBRCopy4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 15, _1080p * 1, _1080p * 4 )
	self:addElement( TicBRCopy4 )
	self.TicBRCopy4 = TicBRCopy4
	
	local blackCopy0 = nil
	
	blackCopy0 = LUI.UIImage.new()
	blackCopy0.id = "blackCopy0"
	blackCopy0:SetRGBFromInt( 0, 0 )
	blackCopy0:SetAlpha( 0.5, 0 )
	blackCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 504, _1080p * 218, _1080p * 257 )
	self:addElement( blackCopy0 )
	self.blackCopy0 = blackCopy0
	
	local f4_local13 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local13 = LUI.UIStyledText.new()
		f4_local13.id = "Name"
		f4_local13:SetFontSize( 32 * _1080p )
		f4_local13:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f4_local13:SetAlignment( LUI.Alignment.Left )
		f4_local13:SetStartupDelay( 1000 )
		f4_local13:SetLineHoldTime( 400 )
		f4_local13:SetAnimMoveTime( 150 )
		f4_local13:SetEndDelay( 1000 )
		f4_local13:SetCrossfadeTime( 400 )
		f4_local13:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
		f4_local13:SetMaxVisibleLines( 1 )
		f4_local13:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21.35, _1080p * 499, _1080p * 221, _1080p * 253 )
		f4_local13:SubscribeToModelThroughElement( self, "name", function ()
			local f5_local0 = self:GetDataSource()
			f5_local0 = f5_local0.name:GetValue( f4_local1 )
			if f5_local0 ~= nil then
				f4_local13:setText( LocalizeString( f5_local0 ), 0 )
			end
		end )
		self:addElement( f4_local13 )
		self.Name = f4_local13
	end
	local f4_local14 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local14 = LUI.UIStyledText.new()
		f4_local14.id = "NameCP"
		f4_local14:SetFontSize( 50 * _1080p )
		f4_local14:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
		f4_local14:SetAlignment( LUI.Alignment.Left )
		f4_local14:SetStartupDelay( 1000 )
		f4_local14:SetLineHoldTime( 400 )
		f4_local14:SetAnimMoveTime( 150 )
		f4_local14:SetEndDelay( 1000 )
		f4_local14:SetCrossfadeTime( 400 )
		f4_local14:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
		f4_local14:SetMaxVisibleLines( 1 )
		f4_local14:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21.35, _1080p * 499, _1080p * 221, _1080p * 271 )
		f4_local14:SubscribeToModelThroughElement( self, "name", function ()
			local f6_local0 = self:GetDataSource()
			f6_local0 = f6_local0.name:GetValue( f4_local1 )
			if f6_local0 ~= nil then
				f4_local14:setText( ToUpperCase( LocalizeString( f6_local0 ) ), 0 )
			end
		end )
		self:addElement( f4_local14 )
		self.NameCP = f4_local14
	end
	local f4_local15 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local15 = LUI.UIImage.new()
		f4_local15.id = "NameHeaderLeftBarCP"
		f4_local15:SetAlpha( 0.3, 0 )
		f4_local15:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 22, _1080p * 218, _1080p * 280 )
		self:addElement( f4_local15 )
		self.NameHeaderLeftBarCP = f4_local15
	end
	local GradientBackgroundInGameOnlyCopy0 = nil
	
	GradientBackgroundInGameOnlyCopy0 = LUI.UIImage.new()
	GradientBackgroundInGameOnlyCopy0.id = "GradientBackgroundInGameOnlyCopy0"
	GradientBackgroundInGameOnlyCopy0:SetRGBFromInt( 0, 0 )
	GradientBackgroundInGameOnlyCopy0:SetAlpha( 0, 0 )
	GradientBackgroundInGameOnlyCopy0:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * -16, _1080p * 14, _1080p * 205 )
	self:addElement( GradientBackgroundInGameOnlyCopy0 )
	self.GradientBackgroundInGameOnlyCopy0 = GradientBackgroundInGameOnlyCopy0
	
	local Reward = nil
	
	Reward = LUI.UIImage.new()
	Reward.id = "Reward"
	Reward:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 505, _1080p * 14, _1080p * 205 )
	Reward:SubscribeToModelThroughElement( self, "image", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.image:GetValue( f4_local1 )
		if f7_local0 ~= nil then
			Reward:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	self:addElement( Reward )
	self.Reward = Reward
	
	local Darkening = nil
	
	Darkening = LUI.UIImage.new()
	Darkening.id = "Darkening"
	Darkening:SetRGBFromInt( 0, 0 )
	Darkening:SetAlpha( 0, 0 )
	Darkening:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 505, _1080p * 14, _1080p * 205 )
	self:addElement( Darkening )
	self.Darkening = Darkening
	
	local ButtonDescriptionText = nil
	
	ButtonDescriptionText = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f4_local1
	} )
	ButtonDescriptionText.id = "ButtonDescriptionText"
	ButtonDescriptionText.Description:SetRight( _1080p * 470, 0 )
	ButtonDescriptionText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21.35, _1080p * 480.35, _1080p * 266, _1080p * 298 )
	self:addElement( ButtonDescriptionText )
	self.ButtonDescriptionText = ButtonDescriptionText
	
	local f4_local20 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local20 = LUI.UIImage.new()
		f4_local20.id = "DescLeftBarCP"
		f4_local20:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 22, _1080p * 297, _1080p * 307 )
		self:addElement( f4_local20 )
		self.DescLeftBarCP = f4_local20
	end
	local blackCopy1 = nil
	
	blackCopy1 = LUI.UIImage.new()
	blackCopy1.id = "blackCopy1"
	blackCopy1:SetRGBFromInt( 0, 0 )
	blackCopy1:SetAlpha( 0, 0 )
	blackCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 505, _1080p * 89.5, _1080p * 128.5 )
	self:addElement( blackCopy1 )
	self.blackCopy1 = blackCopy1
	
	local LockStatusLabel = nil
	
	LockStatusLabel = LUI.UIText.new()
	LockStatusLabel.id = "LockStatusLabel"
	LockStatusLabel:setText( "Set in User Code", 0 )
	LockStatusLabel:SetFontSize( 20 * _1080p )
	LockStatusLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LockStatusLabel:SetAlignment( LUI.Alignment.Left )
	LockStatusLabel:SetOptOutRightToLeftAlignmentFlip( true )
	LockStatusLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 304.5, _1080p * 502, _1080p * 99.5, _1080p * 119.5 )
	self:addElement( LockStatusLabel )
	self.LockStatusLabel = LockStatusLabel
	
	local Padlock = nil
	
	Padlock = LUI.UIImage.new()
	Padlock.id = "Padlock"
	Padlock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Padlock:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 260.5, _1080p * 296.5, _1080p * -266.5, _1080p * -230.5 )
	self:addElement( Padlock )
	self.Padlock = Padlock
	
	local PlayerCardEarnedInfo = nil
	
	PlayerCardEarnedInfo = LUI.UIText.new()
	PlayerCardEarnedInfo.id = "PlayerCardEarnedInfo"
	PlayerCardEarnedInfo:SetRGBFromInt( 12566463, 0 )
	PlayerCardEarnedInfo:SetAlpha( Subtract( 0.5, 0.5 ), 0 )
	PlayerCardEarnedInfo:setText( Engine.Localize( "LUA_MENU_PLAYER_CARD_EARNED" ), 0 )
	PlayerCardEarnedInfo:SetFontSize( 18 * _1080p )
	PlayerCardEarnedInfo:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	PlayerCardEarnedInfo:SetAlignment( LUI.Alignment.Right )
	PlayerCardEarnedInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.48, _1080p * 489.48, _1080p * 668, _1080p * 686 )
	self:addElement( PlayerCardEarnedInfo )
	self.PlayerCardEarnedInfo = PlayerCardEarnedInfo
	
	local LineCopy1 = nil
	
	LineCopy1 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f4_local1
	} )
	LineCopy1.id = "LineCopy1"
	LineCopy1:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * -16, _1080p * 205, _1080p * 206 )
	self:addElement( LineCopy1 )
	self.LineCopy1 = LineCopy1
	
	local LineCopy2 = nil
	
	LineCopy2 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f4_local1
	} )
	LineCopy2.id = "LineCopy2"
	LineCopy2:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * -16, _1080p * 13, _1080p * 14 )
	self:addElement( LineCopy2 )
	self.LineCopy2 = LineCopy2
	
	local ChallengeInfoBigProgress0 = nil
	
	ChallengeInfoBigProgress0 = MenuBuilder.BuildRegisteredType( "ChallengeInfoBigProgress", {
		controllerIndex = f4_local1
	} )
	ChallengeInfoBigProgress0.id = "ChallengeInfoBigProgress0"
	ChallengeInfoBigProgress0:SetDataSourceThroughElement( self, nil )
	ChallengeInfoBigProgress0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 0, 0, 0 )
	self:addElement( ChallengeInfoBigProgress0 )
	self.ChallengeInfoBigProgress0 = ChallengeInfoBigProgress0
	
	self._animationSets.DefaultAnimationSet = function ()
		GradientBackgroundInGameOnlyCopy0:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.GradientBackgroundInGameOnlyCopy0:SetAlpha( 0, 0 )
				end
			}
		} )
		Darkening:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Darkening:SetAlpha( 0, 0 )
				end
			}
		} )
		blackCopy1:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.blackCopy1:SetAlpha( 0, 0 )
				end
			}
		} )
		LockStatusLabel:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LockStatusLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		Padlock:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Padlock:SetAlpha( 0, 0 )
				end
			}
		} )
		ChallengeInfoBigProgress0:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ChallengeInfoBigProgress0:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			GradientBackgroundInGameOnlyCopy0:AnimateSequence( "DefaultSequence" )
			Darkening:AnimateSequence( "DefaultSequence" )
			blackCopy1:AnimateSequence( "DefaultSequence" )
			LockStatusLabel:AnimateSequence( "DefaultSequence" )
			Padlock:AnimateSequence( "DefaultSequence" )
			ChallengeInfoBigProgress0:AnimateSequence( "DefaultSequence" )
		end
		
		GradientBackgroundInGameOnlyCopy0:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.GradientBackgroundInGameOnlyCopy0:SetAlpha( 0.5, 0 )
				end
			},
			{
				function ()
					return self.GradientBackgroundInGameOnlyCopy0:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * -16, _1080p * 14, _1080p * 205, 0 )
				end
			}
		} )
		Darkening:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Darkening:SetAlpha( 0.4, 0 )
				end
			}
		} )
		blackCopy1:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.blackCopy1:SetAlpha( 0.5, 0 )
				end
			}
		} )
		LockStatusLabel:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.LockStatusLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		Padlock:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Padlock:SetAlpha( 1, 0 )
				end
			}
		} )
		ChallengeInfoBigProgress0:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.ChallengeInfoBigProgress0:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			GradientBackgroundInGameOnlyCopy0:AnimateSequence( "Locked" )
			Darkening:AnimateSequence( "Locked" )
			blackCopy1:AnimateSequence( "Locked" )
			LockStatusLabel:AnimateSequence( "Locked" )
			Padlock:AnimateSequence( "Locked" )
			ChallengeInfoBigProgress0:AnimateSequence( "Locked" )
		end
		
		TicBRCopy1:RegisterAnimationSequence( "DefaultCP", {
			{
				function ()
					return self.TicBRCopy1:SetAlpha( 0, 0 )
				end
			}
		} )
		TicBRCopy2:RegisterAnimationSequence( "DefaultCP", {
			{
				function ()
					return self.TicBRCopy2:SetAlpha( 0, 0 )
				end
			}
		} )
		TicBRCopy3:RegisterAnimationSequence( "DefaultCP", {
			{
				function ()
					return self.TicBRCopy3:SetAlpha( 0, 0 )
				end
			}
		} )
		TicBRCopy4:RegisterAnimationSequence( "DefaultCP", {
			{
				function ()
					return self.TicBRCopy4:SetAlpha( 0, 0 )
				end
			}
		} )
		blackCopy0:RegisterAnimationSequence( "DefaultCP", {
			{
				function ()
					return self.blackCopy0:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.blackCopy0:SetAlpha( 0.1, 0 )
				end
			},
			{
				function ()
					return self.blackCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 521, _1080p * 218, _1080p * 280, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f4_local14:RegisterAnimationSequence( "DefaultCP", {
				{
					function ()
						return self.NameCP:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32, _1080p * 500, _1080p * 229, _1080p * 279, 0 )
					end
				}
			} )
		end
		ButtonDescriptionText:RegisterAnimationSequence( "DefaultCP", {
			{
				function ()
					return self.ButtonDescriptionText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32, _1080p * 500, _1080p * 286, _1080p * 318, 0 )
				end
			}
		} )
		self._sequences.DefaultCP = function ()
			TicBRCopy1:AnimateSequence( "DefaultCP" )
			TicBRCopy2:AnimateSequence( "DefaultCP" )
			TicBRCopy3:AnimateSequence( "DefaultCP" )
			TicBRCopy4:AnimateSequence( "DefaultCP" )
			blackCopy0:AnimateSequence( "DefaultCP" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f4_local14:AnimateSequence( "DefaultCP" )
			end
			ButtonDescriptionText:AnimateSequence( "DefaultCP" )
		end
		
		ChallengeInfoBigProgress0:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.ChallengeInfoBigProgress0:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hidden = function ()
			ChallengeInfoBigProgress0:AnimateSequence( "Hidden" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ChallengeInfoBigProgress0:SetDataSourceThroughElement( self, nil )
	PostLoadFunc( self, f4_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "DefaultCP" )
	end
	return self
end

MenuBuilder.registerType( "ChallengeInfoBig", ChallengeInfoBig )
LockTable( _M )
