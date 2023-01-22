local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.PercentCompleteValue )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "currentProgressPercent", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = math.floor( f2_local0.currentProgressPercent:GetValue( f1_arg1 ) * 1000 ) / 10
		if f2_local0 - math.floor( f2_local0 ) == 0 then
			f1_arg0.PercentCompleteValue:setText( f2_local0 .. "%" )
		else
			f1_arg0.PercentCompleteValue:setText( string.format( "%.1f", f2_local0 ) .. "%" )
		end
	end )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "currentProgress", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		f3_local0 = f3_local0.currentProgress:GetValue( f1_arg1 )
		local f3_local1 = f1_arg0:GetDataSource()
		REG3.setText( CONDITIONS.IsThirdGameMode( f1_arg0 ) and f1_arg0.ChallengeScoreLabelCP or f1_arg0.ChallengeScoreLabel, Engine.Localize( "LUA_MENU_X_OF_Y", tostring( f3_local0 ), tostring( f3_local1.currentTierMax:GetValue( f1_arg1 ) ) ), 0 )
	end )
end

function MasterChallenge( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1219 * _1080p, 0, 142 * _1080p )
	self.id = "MasterChallenge"
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
	local GradientBackgroundInGameOnly = nil
	
	GradientBackgroundInGameOnly = LUI.UIImage.new()
	GradientBackgroundInGameOnly.id = "GradientBackgroundInGameOnly"
	GradientBackgroundInGameOnly:SetRGBFromInt( 0, 0 )
	GradientBackgroundInGameOnly:SetAlpha( 0.6, 0 )
	self:addElement( GradientBackgroundInGameOnly )
	self.GradientBackgroundInGameOnly = GradientBackgroundInGameOnly
	
	local f4_local5 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local5 = LUI.UIImage.new()
		f4_local5.id = "TicBRCopy1"
		f4_local5:SetAlpha( 0.8, 0 )
		f4_local5:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -15, _1080p * -1, _1080p * -4, _1080p * -1 )
		self:addElement( f4_local5 )
		self.TicBRCopy1 = f4_local5
	end
	local f4_local6 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local6 = LUI.UIImage.new()
		f4_local6.id = "TicBRCopy2"
		f4_local6:SetAlpha( 0.8, 0 )
		f4_local6:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -15, _1080p * -1, _1080p * 1, _1080p * 4 )
		self:addElement( f4_local6 )
		self.TicBRCopy2 = f4_local6
	end
	local f4_local7 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local7 = LUI.UIImage.new()
		f4_local7.id = "TicBRCopy3"
		f4_local7:SetAlpha( 0.8, 0 )
		f4_local7:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1, _1080p * 15, _1080p * -4, _1080p * -1 )
		self:addElement( f4_local7 )
		self.TicBRCopy3 = f4_local7
	end
	local f4_local8 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local8 = LUI.UIImage.new()
		f4_local8.id = "TicBRCopy4"
		f4_local8:SetAlpha( 0.8, 0 )
		f4_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 15, _1080p * 1, _1080p * 4 )
		self:addElement( f4_local8 )
		self.TicBRCopy4 = f4_local8
	end
	local f4_local9 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local9 = LUI.UIImage.new()
		f4_local9.id = "black"
		f4_local9:SetRGBFromInt( 0, 0 )
		f4_local9:SetAlpha( 0.5, 0 )
		f4_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 819.66, _1080p * 1144.2, _1080p * 16.5, _1080p * 42.5 )
		self:addElement( f4_local9 )
		self.black = f4_local9
	end
	local GradientBackgroundInGameOnlyCopy0 = nil
	
	GradientBackgroundInGameOnlyCopy0 = LUI.UIImage.new()
	GradientBackgroundInGameOnlyCopy0.id = "GradientBackgroundInGameOnlyCopy0"
	GradientBackgroundInGameOnlyCopy0:SetRGBFromInt( 0, 0 )
	GradientBackgroundInGameOnlyCopy0:SetAlpha( 0.5, 0 )
	GradientBackgroundInGameOnlyCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 516, _1080p * 807, _1080p * 16, _1080p * 133.5 )
	self:addElement( GradientBackgroundInGameOnlyCopy0 )
	self.GradientBackgroundInGameOnlyCopy0 = GradientBackgroundInGameOnlyCopy0
	
	local GraphBG = nil
	
	GraphBG = LUI.UIImage.new()
	GraphBG.id = "GraphBG"
	GraphBG:setImage( RegisterMaterial( "challenges_progress_circle_bg" ), 0 )
	GraphBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1074.13, _1080p * 1218.13, _1080p * 4, _1080p * 148 )
	self:addElement( GraphBG )
	self.GraphBG = GraphBG
	
	local PercentCompleteValue = nil
	
	PercentCompleteValue = LUI.UIText.new()
	PercentCompleteValue.id = "PercentCompleteValue"
	PercentCompleteValue:setText( "xx.x%", 0 )
	PercentCompleteValue:SetFontSize( 19 * _1080p )
	PercentCompleteValue:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PercentCompleteValue:SetAlignment( LUI.Alignment.Center )
	PercentCompleteValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1084.26, _1080p * 1204.13, _1080p * 65.5, _1080p * 84.5 )
	self:addElement( PercentCompleteValue )
	self.PercentCompleteValue = PercentCompleteValue
	
	local f4_local13 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local13 = LUI.UIText.new()
		f4_local13.id = "MasterChallengeLabel"
		f4_local13:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MASTER_CHALLENGE" ) ), 0 )
		f4_local13:SetFontSize( 34 * _1080p )
		f4_local13:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f4_local13:SetAlignment( LUI.Alignment.Center )
		f4_local13:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19.13, _1080p * 502.13, _1080p * 30, _1080p * 64 )
		self:addElement( f4_local13 )
		self.MasterChallengeLabel = f4_local13
	end
	local f4_local14 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local14 = LUI.UIText.new()
		f4_local14.id = "MasterChallengeLabelCP"
		f4_local14:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
		f4_local14:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MASTER_CHALLENGE" ) ), 0 )
		f4_local14:SetFontSize( 30 * _1080p )
		f4_local14:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f4_local14:SetAlignment( LUI.Alignment.Left )
		f4_local14:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 430, _1080p * 17, _1080p * 47 )
		self:addElement( f4_local14 )
		self.MasterChallengeLabelCP = f4_local14
	end
	local f4_local15 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local15 = LUI.UIText.new()
		f4_local15.id = "MasterChallengeDescription"
		f4_local15:SetRGBFromInt( 12171705, 0 )
		f4_local15:SetFontSize( 20 * _1080p )
		f4_local15:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f4_local15:SetAlignment( LUI.Alignment.Center )
		f4_local15:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19.13, _1080p * 502.13, _1080p * 72, _1080p * 92 )
		f4_local15:SubscribeToModelThroughElement( self, "desc", function ()
			local f5_local0 = self:GetDataSource()
			f5_local0 = f5_local0.desc:GetValue( f4_local1 )
			if f5_local0 ~= nil then
				f4_local15:setText( f5_local0, 0 )
			end
		end )
		self:addElement( f4_local15 )
		self.MasterChallengeDescription = f4_local15
	end
	local f4_local16 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local16 = LUI.UIText.new()
		f4_local16.id = "MasterChallengeDescriptionCP"
		f4_local16:SetFontSize( 28 * _1080p )
		f4_local16:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f4_local16:SetAlignment( LUI.Alignment.Left )
		f4_local16:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 430, _1080p * 50, _1080p * 78 )
		f4_local16:SubscribeToModelThroughElement( self, "desc", function ()
			local f6_local0 = self:GetDataSource()
			f6_local0 = f6_local0.desc:GetValue( f4_local1 )
			if f6_local0 ~= nil then
				f4_local16:setText( ToUpperCase( f6_local0 ), 0 )
			end
		end )
		self:addElement( f4_local16 )
		self.MasterChallengeDescriptionCP = f4_local16
	end
	local f4_local17 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local17 = LUI.UIText.new()
		f4_local17.id = "ChallengeScoreDescription"
		f4_local17:setText( ToUpperCase( Engine.Localize( "CHALLENGE_PROGRESS_TITLE" ) ), 0 )
		f4_local17:SetFontSize( 20 * _1080p )
		f4_local17:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f4_local17:SetAlignment( LUI.Alignment.Left )
		f4_local17:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 831.13, _1080p * 1079, _1080p * 20, _1080p * 40 )
		self:addElement( f4_local17 )
		self.ChallengeScoreDescription = f4_local17
	end
	local f4_local18 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local18 = LUI.UIText.new()
		f4_local18.id = "ChallengeScoreDescriptionCP"
		f4_local18:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
		f4_local18:setText( ToUpperCase( Engine.Localize( "CHALLENGE_PROGRESS_TITLE" ) ), 0 )
		f4_local18:SetFontSize( 30 * _1080p )
		f4_local18:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f4_local18:SetAlignment( LUI.Alignment.Left )
		f4_local18:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 770, _1080p * 1080, _1080p * 17, _1080p * 47 )
		self:addElement( f4_local18 )
		self.ChallengeScoreDescriptionCP = f4_local18
	end
	local f4_local19 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local19 = LUI.UIText.new()
		f4_local19.id = "ChallengeScoreLabel"
		f4_local19:setText( "XXX/XXX", 0 )
		f4_local19:SetFontSize( 30 * _1080p )
		f4_local19:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f4_local19:SetAlignment( LUI.Alignment.Center )
		f4_local19:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 831.13, _1080p * 1079, _1080p * 67, _1080p * 97 )
		self:addElement( f4_local19 )
		self.ChallengeScoreLabel = f4_local19
	end
	local f4_local20 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local20 = LUI.UIText.new()
		f4_local20.id = "ChallengeScoreLabelCP"
		f4_local20:setText( "XXX/XXX", 0 )
		f4_local20:SetFontSize( 28 * _1080p )
		f4_local20:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f4_local20:SetAlignment( LUI.Alignment.Left )
		f4_local20:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 770, _1080p * 1080, _1080p * 50, _1080p * 78 )
		self:addElement( f4_local20 )
		self.ChallengeScoreLabelCP = f4_local20
	end
	local Reward = nil
	
	Reward = LUI.UIImage.new()
	Reward.id = "Reward"
	Reward:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 516, _1080p * 807, _1080p * 16, _1080p * 134 )
	Reward:SubscribeToModelThroughElement( self, "image", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.image:GetValue( f4_local1 )
		if f7_local0 ~= nil then
			Reward:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	self:addElement( Reward )
	self.Reward = Reward
	
	local f4_local22 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local22 = LUI.UIImage.new()
		f4_local22.id = "LockedRewardOverlayCP"
		f4_local22:SetRGBFromInt( 0, 0 )
		f4_local22:SetAlpha( 0.5, 0 )
		f4_local22:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 456, _1080p * 747, _1080p * 13, _1080p * 130 )
		self:addElement( f4_local22 )
		self.LockedRewardOverlayCP = f4_local22
	end
	local f4_local23 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local23 = LUI.UIImage.new()
		f4_local23.id = "RewardLineVertCP"
		f4_local23:SetAlpha( 0.2, 0 )
		f4_local23:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 440, _1080p * 445, _1080p * 13, _1080p * 130 )
		self:addElement( f4_local23 )
		self.RewardLineVertCP = f4_local23
	end
	local f4_local24 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local24 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
			controllerIndex = f4_local1
		} )
		f4_local24.id = "Line"
		f4_local24:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 516, _1080p * 807, _1080p * 15, _1080p * 16 )
		self:addElement( f4_local24 )
		self.Line = f4_local24
	end
	local RectrictionOverlay = nil
	
	RectrictionOverlay = MenuBuilder.BuildRegisteredType( "CaCButtonRectrictionOverlay", {
		controllerIndex = f4_local1
	} )
	RectrictionOverlay.id = "RectrictionOverlay"
	RectrictionOverlay:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 807, _1080p * 516, _1080p * 133, _1080p * 16.5 )
	self:addElement( RectrictionOverlay )
	self.RectrictionOverlay = RectrictionOverlay
	
	local f4_local26 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local26 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
			controllerIndex = f4_local1
		} )
		f4_local26.id = "Line2"
		f4_local26:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 516, _1080p * 807, _1080p * 133, _1080p * 134 )
		self:addElement( f4_local26 )
		self.Line2 = f4_local26
	end
	local ProgressBar = nil
	
	ProgressBar = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 2,
		segmentMaterial = "challenges_progress_circle_segment",
		maskMaterial = "wdg_circle_progressbar_back_rim",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f4_local1
	} )
	ProgressBar.id = "ProgressBar"
	ProgressBar:setImage( RegisterMaterial( "challenges_progress_circle_segment" ), 0 )
	ProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1072.2, _1080p * 1216.2, _1080p * 4, _1080p * 148 )
	ProgressBar:SubscribeToModelThroughElement( self, "currentProgressPercent", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.currentProgressPercent:GetValue( f4_local1 )
		if f8_local0 ~= nil then
			ProgressBar:SetProgress( f8_local0 )
		end
	end )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	self._animationSets.DefaultAnimationSet = function ()
		Reward:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Reward:SetAlpha( 1, 0 )
				end
			}
		} )
		RectrictionOverlay:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.RectrictionOverlay:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Reward:AnimateSequence( "DefaultSequence" )
			RectrictionOverlay:AnimateSequence( "DefaultSequence" )
		end
		
		Reward:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Reward:SetAlpha( 0, 0 )
				end
			}
		} )
		RectrictionOverlay:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.RectrictionOverlay:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Reward:AnimateSequence( "Locked" )
			RectrictionOverlay:AnimateSequence( "Locked" )
		end
		
	end
	
	self._animationSets.CP = function ()
		GradientBackgroundInGameOnly:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.GradientBackgroundInGameOnly:SetAlpha( 1, 0 )
				end
			}
		} )
		if not CONDITIONS.IsThirdGameMode( self ) then
			f4_local9:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.black:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		GraphBG:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.GraphBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1074.13, _1080p * 1218.13, _1080p * 1, _1080p * 145, 0 )
				end
			}
		} )
		PercentCompleteValue:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.PercentCompleteValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1090.26, _1080p * 1210.13, _1080p * 53, _1080p * 89, 0 )
				end
			}
		} )
		Reward:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Reward:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Reward:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 456, _1080p * 747, _1080p * 13, _1080p * 130, 0 )
				end
			}
		} )
		if CONDITIONS.IsThirdGameMode( self ) then
			f4_local22:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.LockedRewardOverlayCP:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		RectrictionOverlay:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.RectrictionOverlay:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.RectrictionOverlay:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 747, _1080p * 456, _1080p * 130, _1080p * 13.5, 0 )
				end
			}
		} )
		ProgressBar:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1072.2, _1080p * 1216.2, _1080p * 1, _1080p * 145, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			GradientBackgroundInGameOnly:AnimateSequence( "DefaultSequence" )
			if not CONDITIONS.IsThirdGameMode( self ) then
				f4_local9:AnimateSequence( "DefaultSequence" )
			end
			GraphBG:AnimateSequence( "DefaultSequence" )
			PercentCompleteValue:AnimateSequence( "DefaultSequence" )
			Reward:AnimateSequence( "DefaultSequence" )
			if CONDITIONS.IsThirdGameMode( self ) then
				f4_local22:AnimateSequence( "DefaultSequence" )
			end
			RectrictionOverlay:AnimateSequence( "DefaultSequence" )
			ProgressBar:AnimateSequence( "DefaultSequence" )
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f4_local22:RegisterAnimationSequence( "Locked", {
				{
					function ()
						return self.LockedRewardOverlayCP:SetAlpha( 0.7, 0 )
					end
				}
			} )
		end
		RectrictionOverlay:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.RectrictionOverlay:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f4_local22:AnimateSequence( "Locked" )
			end
			RectrictionOverlay:AnimateSequence( "Locked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f4_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "CP" )
	end
	return self
end

MenuBuilder.registerType( "MasterChallenge", MasterChallenge )
LockTable( _M )
