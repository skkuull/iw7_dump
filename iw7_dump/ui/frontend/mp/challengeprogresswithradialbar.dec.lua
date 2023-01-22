local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if Cac.IsBaseWeaponUnlockedMode( f1_arg1, f1_arg2 ) then
		f1_arg0:SetAlpha( 0, 0 )
		return false
	else
		local f1_local0 = Challenge.GetWeaponUnlockChallengeData( f1_arg1, f1_arg2 )
		if f1_local0 and f1_local0.ref then
			f1_arg0:SetAlpha( 1, 0 )
			ACTIONS.AnimateSequence( f1_arg0, "WeaponUnlockSetup" )
			local f1_local1 = tonumber( f1_local0.challengeProgress )
			local f1_local2 = tonumber( f1_local0.target )
			if f1_local1 and f1_local2 then
				assert( f1_local2 ~= 0 )
				local f1_local3 = Engine.Localize( "LUA_MENU_X_OF_Y", f1_local1, f1_local2 )
				if f1_local2 < f1_local1 then
					f1_local3 = Engine.Localize( "LUA_MENU_X_OF_Y", f1_local2, f1_local2 )
				end
				f1_arg0.ChallengeProgress:setText( f1_local3 )
				local f1_local4 = math.min( f1_local1 / f1_local2, 1 )
				f1_arg0.ChallengeProgressBar:SetProgress( f1_local4 )
				f1_local4 = math.floor( f1_local4 * 1000 ) / 10
				if f1_local4 - math.floor( f1_local4 ) == 0 then
					f1_arg0.PercentCompleteLabel:setText( f1_local4 .. "%" )
				else
					f1_arg0.PercentCompleteLabel:setText( string.format( "%.1f", f1_local4 ) .. "%" )
				end
				f1_arg0.ChallengeDescription:setText( f1_local0.localizedDesc )
				return true
			else
				f1_arg0.ChallengeProgress:setText( "", 0 )
			end
		else
			f1_arg0:SetAlpha( 0, 0 )
			return 
		end
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	f2_arg2 = tonumber( f2_arg2 )
	f2_arg3 = tonumber( f2_arg3 )
	if not f2_arg1 then
		ACTIONS.AnimateSequence( f2_arg0, "HideChallengeProgress" )
		f2_arg0:SetDescription( Cac.LowestQuality )
		return 
	end
	ACTIONS.AnimateSequence( f2_arg0, "ShowChallengeProgress" )
	local f2_local0 = CallingCardUtils.GetChallengeEntry( f2_arg1, f2_arg0._controllerIndex, nil, f2_arg2 )
	local f2_local1 = Engine.Localize( "LUA_MENU_X_OF_Y", f2_local0.currentProgress, f2_arg3 )
	if f2_arg3 < tonumber( f2_local0.currentProgress ) then
		f2_local1 = Engine.Localize( "LUA_MENU_X_OF_Y", f2_arg3, f2_arg3 )
	end
	f2_arg0.ChallengeProgress:setText( f2_local1 )
	local f2_local2 = math.min( tonumber( f2_local0.currentProgressPercent ), 1 )
	f2_arg0.ChallengeProgressBar:SetProgress( f2_local2 )
	local f2_local3 = math.floor( f2_local2 * 1000 ) / 10
	local f2_local4 = f2_local3
	if f2_local3 - math.floor( f2_local3 ) ~= 0 then
		f2_local4 = string.format( "%.1f", f2_local3 )
	end
	f2_arg0.PercentCompleteLabel:setText( f2_local4 .. "%" )
	local f2_local5 = nil
	if f2_local0.isUnlocked then
		f2_arg0.PercentCompleteLabel:SetAlpha( 1 )
		f2_arg0.ChallengeProgress:SetAlpha( 1 )
		f2_arg0.ChallengeProgressBar:SetAlpha( 1 )
		f2_arg0.ProgressBarBackground:SetAlpha( 1 )
	else
		f2_arg0.PercentCompleteLabel:SetAlpha( 0 )
		f2_arg0.ChallengeProgress:SetAlpha( 0 )
		f2_arg0.ChallengeProgressBar:SetAlpha( 0 )
		f2_arg0.ProgressBarBackground:SetAlpha( 0 )
	end
	f2_arg0:SetDescription( f2_local0.desc )
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	f3_arg0.ChallengeDescription:setText( f3_arg1 )
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	f4_arg0.RequirementsHeader:setText( f4_arg1 )
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	assert( f5_arg0.Quality )
	assert( f5_arg0.LootQualityBackground )
	if Engine.IsCoreMode() then
		assert( f5_arg0.MPStrip )
	end
	f5_arg0.QualityIcon:SetDisplayQuality( f5_arg1 )
	local f5_local0 = Cac.GetLootQualityColor( f5_arg1 )
	f5_arg0.Quality:SetRGBFromInt( f5_local0, 0 )
	f5_arg0.LootQualityBackground:SetRGBFromInt( f5_local0, 0 )
	if Engine.IsCoreMode() then
		f5_arg0.MPStrip:SetRGBFromInt( f5_local0, 0 )
	end
	local f5_local1 = Cac.GetLootQualityImage( f5_arg1 )
	f5_arg0.Quality:setText( ToUpperCase( Cac.GetLootQualityString( f5_arg1 ) ) )
	if f5_arg1 > Cac.LowestQuality then
		ACTIONS.AnimateSequence( f5_arg0, "ShowQuality" )
	else
		ACTIONS.AnimateSequence( f5_arg0, "HideQuality" )
	end
end

local f0_local5 = function ( f6_arg0, f6_arg1, f6_arg2 )
	f6_arg0._controllerIndex = f6_arg1
	f6_arg0.RequirementsHeader:SetFontSize( 50 * _1080p )
	f6_arg0.SetupWeaponChallenge = f0_local0
	f6_arg0.SetupChallenge = f0_local1
	f6_arg0.SetQuality = f0_local4
	f6_arg0.SetDescription = f0_local2
	f6_arg0.SetTitle = f0_local3
	local f6_local0 = function ()
		local f7_local0 = f6_arg0:GetDataSource()
		f7_local0 = f7_local0.ref:GetValue( f6_arg1 )
		local f7_local1 = f6_arg0:GetDataSource()
		f7_local1 = f7_local1.tierIndex:GetValue( f6_arg1 )
		local f7_local2 = f6_arg0:GetDataSource()
		f7_local2 = f7_local2.currentTierMax:GetValue( f6_arg1 )
		if f7_local0 and f7_local1 and f7_local2 and #f7_local0 > 0 then
			f6_arg0:SetupChallenge( f7_local0, f7_local1, f7_local2 )
		end
	end
	
	f6_arg0:SubscribeToModelThroughElement( f6_arg0, "ref", f6_local0 )
	f6_arg0:SubscribeToModelThroughElement( f6_arg0, "tierIndex", f6_local0 )
	f6_arg0:SubscribeToModelThroughElement( f6_arg0, "currentTierMax", f6_local0 )
	f6_arg0.UpdateRarityInfo = function ( f8_arg0, f8_arg1 )
		if Engine.IsMultiplayer() then
			f0_local4( f8_arg1.quality:GetValue( f6_arg1 ) )
		end
	end
	
end

function ChallengeProgressWithRadialBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1150 * _1080p, 0, 200 * _1080p )
	self.id = "ChallengeProgressWithRadialBar"
	self._animationSets = {}
	self._sequences = {}
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	local f9_local2 = self
	local RequirementsHeaderBackground = nil
	
	RequirementsHeaderBackground = LUI.UIImage.new()
	RequirementsHeaderBackground.id = "RequirementsHeaderBackground"
	RequirementsHeaderBackground:SetRGBFromInt( 0, 0 )
	RequirementsHeaderBackground:SetAlpha( 0.8, 0 )
	RequirementsHeaderBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -218, _1080p * 15.49, _1080p * 74.01 )
	self:addElement( RequirementsHeaderBackground )
	self.RequirementsHeaderBackground = RequirementsHeaderBackground
	
	local LootQualityBackground = nil
	
	LootQualityBackground = LUI.UIImage.new()
	LootQualityBackground.id = "LootQualityBackground"
	LootQualityBackground:SetAlpha( 0.8, 0 )
	LootQualityBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -218, _1080p * 15.49, _1080p * 74.01 )
	self:addElement( LootQualityBackground )
	self.LootQualityBackground = LootQualityBackground
	
	local RequirementsHeader = nil
	
	RequirementsHeader = LUI.UIText.new()
	RequirementsHeader.id = "RequirementsHeader"
	RequirementsHeader:setText( Engine.Localize( "CHALLENGE_CHALLENGE_REQUIREMENT_CAPS" ), 0 )
	RequirementsHeader:SetFontSize( 22 * _1080p )
	RequirementsHeader:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RequirementsHeader:SetAlignment( LUI.Alignment.Left )
	RequirementsHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 14, _1080p * 600, _1080p * 45, _1080p * 67 )
	self:addElement( RequirementsHeader )
	self.RequirementsHeader = RequirementsHeader
	
	local ChallengeDescriptionBackground = nil
	
	ChallengeDescriptionBackground = LUI.UIImage.new()
	ChallengeDescriptionBackground.id = "ChallengeDescriptionBackground"
	ChallengeDescriptionBackground:SetRGBFromTable( SWATCHES.genericMenu.blackBackground, 0 )
	ChallengeDescriptionBackground:SetAlpha( 0.4, 0 )
	ChallengeDescriptionBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -218, _1080p * 74, _1080p * 150 )
	self:addElement( ChallengeDescriptionBackground )
	self.ChallengeDescriptionBackground = ChallengeDescriptionBackground
	
	local ChallengeDescription = nil
	
	ChallengeDescription = LUI.UIText.new()
	ChallengeDescription.id = "ChallengeDescription"
	ChallengeDescription:SetFontSize( 24 * _1080p )
	ChallengeDescription:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ChallengeDescription:SetAlignment( LUI.Alignment.Left )
	ChallengeDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32, _1080p * 575, _1080p * 86, _1080p * 110 )
	ChallengeDescription:SubscribeToModelThroughElement( self, "desc", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.desc:GetValue( f9_local1 )
		if f10_local0 ~= nil then
			ChallengeDescription:setText( f10_local0, 0 )
		end
	end )
	self:addElement( ChallengeDescription )
	self.ChallengeDescription = ChallengeDescription
	
	local ChallengeProgress = nil
	
	ChallengeProgress = LUI.UIText.new()
	ChallengeProgress.id = "ChallengeProgress"
	ChallengeProgress:setText( "xxx/xxx", 0 )
	ChallengeProgress:SetFontSize( 20 * _1080p )
	ChallengeProgress:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ChallengeProgress:SetAlignment( LUI.Alignment.Left )
	ChallengeProgress:SetOptOutRightToLeftAlignmentFlip( true )
	ChallengeProgress:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 680, _1080p * 861, _1080p * 86, _1080p * 106 )
	self:addElement( ChallengeProgress )
	self.ChallengeProgress = ChallengeProgress
	
	local ProgressBarBackground = nil
	
	ProgressBarBackground = LUI.UIImage.new()
	ProgressBarBackground.id = "ProgressBarBackground"
	ProgressBarBackground:setImage( RegisterMaterial( "challenges_progress_circle_bg" ), 0 )
	ProgressBarBackground:SetUseAA( true )
	ProgressBarBackground:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -303.09, _1080p * -130.09, 0, _1080p * 173 )
	self:addElement( ProgressBarBackground )
	self.ProgressBarBackground = ProgressBarBackground
	
	local ChallengeProgressBar = nil
	
	ChallengeProgressBar = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 2,
		segmentMaterial = "challenges_progress_circle_segment",
		maskMaterial = "wdg_circle_progressbar_back_rim",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f9_local1
	} )
	ChallengeProgressBar.id = "ChallengeProgressBar"
	ChallengeProgressBar:setImage( RegisterMaterial( "challenges_progress_circle_segment" ), 0 )
	ChallengeProgressBar:SetProgress( 0 )
	ChallengeProgressBar:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -304.09, _1080p * -131.09, 0, _1080p * 173 )
	self:addElement( ChallengeProgressBar )
	self.ChallengeProgressBar = ChallengeProgressBar
	
	local PercentCompleteLabel = nil
	
	PercentCompleteLabel = LUI.UIText.new()
	PercentCompleteLabel.id = "PercentCompleteLabel"
	PercentCompleteLabel:setText( "xx.x%", 0 )
	PercentCompleteLabel:SetFontSize( 16 * _1080p )
	PercentCompleteLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PercentCompleteLabel:SetAlignment( LUI.Alignment.Center )
	PercentCompleteLabel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -285.59, _1080p * -149.59, _1080p * 75.15, _1080p * 98.36 )
	self:addElement( PercentCompleteLabel )
	self.PercentCompleteLabel = PercentCompleteLabel
	
	local f9_local12 = nil
	if Engine.IsMultiplayer() then
		f9_local12 = MenuBuilder.BuildRegisteredType( "QualityIcon", {
			controllerIndex = f9_local1
		} )
		f9_local12.id = "QualityIcon"
		f9_local12:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 886, _1080p * 918, _1080p * 29, _1080p * 61 )
		self:addElement( f9_local12 )
		self.QualityIcon = f9_local12
	end
	local f9_local13 = nil
	if Engine.IsMultiplayer() then
		f9_local13 = LUI.UIStyledText.new()
		f9_local13.id = "Quality"
		f9_local13:setText( ToUpperCase( "" ), 0 )
		f9_local13:SetFontSize( 32 * _1080p )
		f9_local13:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f9_local13:SetAlignment( LUI.Alignment.Right )
		f9_local13:SetDecodeLetterLength( 20 )
		f9_local13:SetDecodeMaxRandChars( 6 )
		f9_local13:SetDecodeUpdatesPerLetter( 4 )
		f9_local13:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 515, _1080p * -275, _1080p * 29, _1080p * 61 )
		self:addElement( f9_local13 )
		self.Quality = f9_local13
	end
	local f9_local14 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
		f9_local14 = LUI.UIImage.new()
		f9_local14.id = "MPStrip"
		f9_local14:SetRGBFromInt( 6908265, 0 )
		f9_local14:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, _1080p * 39.49, _1080p * 156.41 )
		self:addElement( f9_local14 )
		self.MPStrip = f9_local14
	end
	self._animationSets.DefaultAnimationSet = function ()
		LootQualityBackground:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LootQualityBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		if Engine.IsMultiplayer() then
			f9_local12:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f9_local13:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.Quality:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
			f9_local14:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.MPStrip:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.DefaultSequence = function ()
			LootQualityBackground:AnimateSequence( "DefaultSequence" )
			if Engine.IsMultiplayer() then
				f9_local12:AnimateSequence( "DefaultSequence" )
			end
			if Engine.IsMultiplayer() then
				f9_local13:AnimateSequence( "DefaultSequence" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
				f9_local14:AnimateSequence( "DefaultSequence" )
			end
		end
		
		ChallengeProgress:RegisterAnimationSequence( "HideChallengeProgress", {
			{
				function ()
					return self.ChallengeProgress:SetAlpha( 0, 0 )
				end
			}
		} )
		ProgressBarBackground:RegisterAnimationSequence( "HideChallengeProgress", {
			{
				function ()
					return self.ProgressBarBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		ChallengeProgressBar:RegisterAnimationSequence( "HideChallengeProgress", {
			{
				function ()
					return self.ChallengeProgressBar:SetAlpha( 0, 0 )
				end
			}
		} )
		PercentCompleteLabel:RegisterAnimationSequence( "HideChallengeProgress", {
			{
				function ()
					return self.PercentCompleteLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideChallengeProgress = function ()
			ChallengeProgress:AnimateSequence( "HideChallengeProgress" )
			ProgressBarBackground:AnimateSequence( "HideChallengeProgress" )
			ChallengeProgressBar:AnimateSequence( "HideChallengeProgress" )
			PercentCompleteLabel:AnimateSequence( "HideChallengeProgress" )
		end
		
		ChallengeProgress:RegisterAnimationSequence( "ShowChallengeProgress", {
			{
				function ()
					return self.ChallengeProgress:SetAlpha( 1, 0 )
				end
			}
		} )
		ProgressBarBackground:RegisterAnimationSequence( "ShowChallengeProgress", {
			{
				function ()
					return self.ProgressBarBackground:SetAlpha( 1, 0 )
				end
			}
		} )
		ChallengeProgressBar:RegisterAnimationSequence( "ShowChallengeProgress", {
			{
				function ()
					return self.ChallengeProgressBar:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ChallengeProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 845.91, _1080p * 1018.91, 0, _1080p * 173, 0 )
				end
			}
		} )
		PercentCompleteLabel:RegisterAnimationSequence( "ShowChallengeProgress", {
			{
				function ()
					return self.PercentCompleteLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowChallengeProgress = function ()
			ChallengeProgress:AnimateSequence( "ShowChallengeProgress" )
			ProgressBarBackground:AnimateSequence( "ShowChallengeProgress" )
			ChallengeProgressBar:AnimateSequence( "ShowChallengeProgress" )
			PercentCompleteLabel:AnimateSequence( "ShowChallengeProgress" )
		end
		
		RequirementsHeaderBackground:RegisterAnimationSequence( "LargeHeader", {
			{
				function ()
					return self.RequirementsHeaderBackground:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 932, _1080p * 15.49, _1080p * 74.01, 0 )
				end
			}
		} )
		LootQualityBackground:RegisterAnimationSequence( "LargeHeader", {
			{
				function ()
					return self.LootQualityBackground:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 932, _1080p * 15.49, _1080p * 74.01, 0 )
				end
			}
		} )
		RequirementsHeader:RegisterAnimationSequence( "LargeHeader", {
			{
				function ()
					return self.RequirementsHeader:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.RequirementsHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15, _1080p * 600, _1080p * 19, _1080p * 69, 0 )
				end
			}
		} )
		if Engine.IsMultiplayer() then
			f9_local12:RegisterAnimationSequence( "LargeHeader", {
				{
					function ()
						return self.QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 891, _1080p * 923, _1080p * 28, _1080p * 60, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f9_local13:RegisterAnimationSequence( "LargeHeader", {
				{
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 518, _1080p * -272, _1080p * 26, _1080p * 58, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
			f9_local14:RegisterAnimationSequence( "LargeHeader", {
				{
					function ()
						return self.MPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, _1080p * 15.49, _1080p * 156.41, 0 )
					end
				}
			} )
		end
		self._sequences.LargeHeader = function ()
			RequirementsHeaderBackground:AnimateSequence( "LargeHeader" )
			LootQualityBackground:AnimateSequence( "LargeHeader" )
			RequirementsHeader:AnimateSequence( "LargeHeader" )
			if Engine.IsMultiplayer() then
				f9_local12:AnimateSequence( "LargeHeader" )
			end
			if Engine.IsMultiplayer() then
				f9_local13:AnimateSequence( "LargeHeader" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
				f9_local14:AnimateSequence( "LargeHeader" )
			end
		end
		
		LootQualityBackground:RegisterAnimationSequence( "ShowQuality", {
			{
				function ()
					return self.LootQualityBackground:SetAlpha( 0.35, 0 )
				end
			}
		} )
		if Engine.IsMultiplayer() then
			f9_local12:RegisterAnimationSequence( "ShowQuality", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f9_local13:RegisterAnimationSequence( "ShowQuality", {
				{
					function ()
						return self.Quality:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
			f9_local14:RegisterAnimationSequence( "ShowQuality", {
				{
					function ()
						return self.MPStrip:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.ShowQuality = function ()
			LootQualityBackground:AnimateSequence( "ShowQuality" )
			if Engine.IsMultiplayer() then
				f9_local12:AnimateSequence( "ShowQuality" )
			end
			if Engine.IsMultiplayer() then
				f9_local13:AnimateSequence( "ShowQuality" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
				f9_local14:AnimateSequence( "ShowQuality" )
			end
		end
		
		LootQualityBackground:RegisterAnimationSequence( "HideQuality", {
			{
				function ()
					return self.LootQualityBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		if Engine.IsMultiplayer() then
			f9_local12:RegisterAnimationSequence( "HideQuality", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f9_local13:RegisterAnimationSequence( "HideQuality", {
				{
					function ()
						return self.Quality:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
			f9_local14:RegisterAnimationSequence( "HideQuality", {
				{
					function ()
						return self.MPStrip:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideQuality = function ()
			LootQualityBackground:AnimateSequence( "HideQuality" )
			if Engine.IsMultiplayer() then
				f9_local12:AnimateSequence( "HideQuality" )
			end
			if Engine.IsMultiplayer() then
				f9_local13:AnimateSequence( "HideQuality" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
				f9_local14:AnimateSequence( "HideQuality" )
			end
		end
		
		RequirementsHeaderBackground:RegisterAnimationSequence( "WeaponUnlockSetup", {
			{
				function ()
					return self.RequirementsHeaderBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * 250, _1080p * 39.49, _1080p * 74.01, 0 )
				end
			}
		} )
		LootQualityBackground:RegisterAnimationSequence( "WeaponUnlockSetup", {
			{
				function ()
					return self.LootQualityBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * 250, _1080p * 40, _1080p * 74, 0 )
				end
			}
		} )
		ChallengeDescriptionBackground:RegisterAnimationSequence( "WeaponUnlockSetup", {
			{
				function ()
					return self.ChallengeDescriptionBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * 250, _1080p * 74, _1080p * 147, 0 )
				end
			}
		} )
		ChallengeDescription:RegisterAnimationSequence( "WeaponUnlockSetup", {
			{
				function ()
					return self.ChallengeDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 14, _1080p * 575, _1080p * 86, _1080p * 106, 0 )
				end
			}
		} )
		ChallengeProgress:RegisterAnimationSequence( "WeaponUnlockSetup", {
			{
				function ()
					return self.ChallengeProgress:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -470, _1080p * -289, _1080p * 86, _1080p * 106, 0 )
				end
			}
		} )
		ProgressBarBackground:RegisterAnimationSequence( "WeaponUnlockSetup", {
			{
				function ()
					return self.ProgressBarBackground:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.ProgressBarBackground:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -303, _1080p * -130, _1080p * 9, _1080p * 182, 0 )
				end
			}
		} )
		ChallengeProgressBar:RegisterAnimationSequence( "WeaponUnlockSetup", {
			{
				function ()
					return self.ChallengeProgressBar:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.ChallengeProgressBar:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -304, _1080p * -131, _1080p * 9, _1080p * 182, 0 )
				end
			}
		} )
		PercentCompleteLabel:RegisterAnimationSequence( "WeaponUnlockSetup", {
			{
				function ()
					return self.PercentCompleteLabel:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.PercentCompleteLabel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -285.59, _1080p * -149.59, _1080p * 84.15, _1080p * 107.36, 0 )
				end
			}
		} )
		if Engine.IsMultiplayer() then
			f9_local12:RegisterAnimationSequence( "WeaponUnlockSetup", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f9_local13:RegisterAnimationSequence( "WeaponUnlockSetup", {
				{
					function ()
						return self.Quality:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
			f9_local14:RegisterAnimationSequence( "WeaponUnlockSetup", {
				{
					function ()
						return self.MPStrip:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.WeaponUnlockSetup = function ()
			RequirementsHeaderBackground:AnimateSequence( "WeaponUnlockSetup" )
			LootQualityBackground:AnimateSequence( "WeaponUnlockSetup" )
			ChallengeDescriptionBackground:AnimateSequence( "WeaponUnlockSetup" )
			ChallengeDescription:AnimateSequence( "WeaponUnlockSetup" )
			ChallengeProgress:AnimateSequence( "WeaponUnlockSetup" )
			ProgressBarBackground:AnimateSequence( "WeaponUnlockSetup" )
			ChallengeProgressBar:AnimateSequence( "WeaponUnlockSetup" )
			PercentCompleteLabel:AnimateSequence( "WeaponUnlockSetup" )
			if Engine.IsMultiplayer() then
				f9_local12:AnimateSequence( "WeaponUnlockSetup" )
			end
			if Engine.IsMultiplayer() then
				f9_local13:AnimateSequence( "WeaponUnlockSetup" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
				f9_local14:AnimateSequence( "WeaponUnlockSetup" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local5( self, f9_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "ChallengeProgressWithRadialBar", ChallengeProgressWithRadialBar )
LockTable( _M )
