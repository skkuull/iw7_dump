local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = nil
	if f1_arg2 and 0 < #f1_arg2 then
		f1_local0 = Engine.Localize( f1_arg1, f1_arg2 )
	else
		f1_local0 = Engine.Localize( f1_arg1 )
	end
	f1_arg0.UnlockDesc:setText( f1_local0 )
	f1_arg0._unlockString = f1_arg1
	f1_arg0._unlockStringParam = f1_arg2
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0.TitleText:setText( f2_arg1 )
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	assert( f3_arg0.Quality )
	assert( f3_arg0.LootQualityBackground )
	assert( f3_arg0.MPStrip )
	f3_arg0.QualityIcon:SetDisplayQuality( f3_arg1 )
	local f3_local0 = Cac.GetLootQualityColor( f3_arg1 )
	f3_arg0.Quality:SetRGBFromInt( f3_local0, 0 )
	f3_arg0.LootQualityBackground:SetRGBFromInt( f3_local0, 0 )
	f3_arg0.MPStrip:SetRGBFromInt( f3_local0, 0 )
	local f3_local1 = Cac.GetLootQualityImage( f3_arg1 )
	f3_arg0.Quality:setText( ToUpperCase( Cac.GetLootQualityString( f3_arg1 ) ) )
	if f3_arg1 > Cac.LowestQuality then
		ACTIONS.AnimateSequence( f3_arg0, "ShowQuality" )
	else
		ACTIONS.AnimateSequence( f3_arg0, "HideQuality" )
	end
end

local f0_local3 = function ( f4_arg0, f4_arg1, f4_arg2 )
	assert( f4_arg0.UnlockDesc and f4_arg0.TitleText )
	f4_arg0.TitleText:SetFontSize( 50 * _1080p )
	f4_arg0.SetName = f0_local1
	f4_arg0.SetDescription = f0_local0
	f4_arg0.SetQuality = f0_local2
	f4_arg0.UnlockDesc:SubscribeToModelThroughElement( f4_arg0, "ref", function ()
		local f5_local0 = f4_arg0:GetDataSource()
		local f5_local1 = f5_local0.customUnlockString:GetValue( f4_arg1 )
		if f5_local1 ~= nil then
			f4_arg0:SetDescription( f5_local1, f5_local0.unlockTextParam )
		end
	end )
	f4_arg0:registerEventHandler( "refresh_button_helper", function ( element, event )
		if element._unlockString then
			element:SetDescription( element._unlockString, element._unlockStringParam )
		end
	end )
	f4_arg0.UpdateRarityInfo = function ( f7_arg0, f7_arg1 )
		f7_arg0:SetQuality( f7_arg1.quality:GetValue( f4_arg1 ) )
	end
	
end

function RigCustomizationAppearenceDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 950 * _1080p, 0, 140 * _1080p )
	self.id = "RigCustomizationAppearenceDetails"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local ChallengeDescriptionBackground = nil
	
	ChallengeDescriptionBackground = LUI.UIImage.new()
	ChallengeDescriptionBackground.id = "ChallengeDescriptionBackground"
	ChallengeDescriptionBackground:SetRGBFromTable( SWATCHES.genericMenu.blackBackground, 0 )
	ChallengeDescriptionBackground:SetAlpha( 0.4, 0 )
	ChallengeDescriptionBackground:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 932, _1080p * 60, _1080p * 140 )
	self:addElement( ChallengeDescriptionBackground )
	self.ChallengeDescriptionBackground = ChallengeDescriptionBackground
	
	local RequirementsHeaderBackground = nil
	
	RequirementsHeaderBackground = LUI.UIImage.new()
	RequirementsHeaderBackground.id = "RequirementsHeaderBackground"
	RequirementsHeaderBackground:SetRGBFromInt( 0, 0 )
	RequirementsHeaderBackground:SetAlpha( 0.8, 0 )
	RequirementsHeaderBackground:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 932, 0, _1080p * 60 )
	self:addElement( RequirementsHeaderBackground )
	self.RequirementsHeaderBackground = RequirementsHeaderBackground
	
	local LootQualityBackground = nil
	
	LootQualityBackground = LUI.UIImage.new()
	LootQualityBackground.id = "LootQualityBackground"
	LootQualityBackground:SetAlpha( 0.35, 0 )
	LootQualityBackground:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 932, 0, _1080p * 60 )
	self:addElement( LootQualityBackground )
	self.LootQualityBackground = LootQualityBackground
	
	local TitleText = nil
	
	TitleText = LUI.UIText.new()
	TitleText.id = "TitleText"
	TitleText:SetScale( 0.88, 0 )
	TitleText:setText( "", 0 )
	TitleText:SetFontSize( 22 * _1080p )
	TitleText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TitleText:SetAlignment( LUI.Alignment.Left )
	TitleText:SetOptOutRightToLeftAlignmentFlip( true )
	TitleText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 279, _1080p * 872, _1080p * 18, _1080p * 40 )
	self:addElement( TitleText )
	self.TitleText = TitleText
	
	local UnlockDesc = nil
	
	UnlockDesc = LUI.UIText.new()
	UnlockDesc.id = "UnlockDesc"
	UnlockDesc:setText( "", 0 )
	UnlockDesc:SetFontSize( 24 * _1080p )
	UnlockDesc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	UnlockDesc:SetAlignment( LUI.Alignment.Left )
	UnlockDesc:SetOptOutRightToLeftAlignmentFlip( true )
	UnlockDesc:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32, _1080p * 575, _1080p * 72, _1080p * 96 )
	self:addElement( UnlockDesc )
	self.UnlockDesc = UnlockDesc
	
	local f8_local8 = nil
	if Engine.IsMultiplayer() then
		f8_local8 = MenuBuilder.BuildRegisteredType( "QualityIcon", {
			controllerIndex = f8_local1
		} )
		f8_local8.id = "QualityIcon"
		f8_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 886, _1080p * 918, _1080p * 15, _1080p * 47 )
		self:addElement( f8_local8 )
		self.QualityIcon = f8_local8
	end
	local f8_local9 = nil
	if Engine.IsMultiplayer() then
		f8_local9 = LUI.UIStyledText.new()
		f8_local9.id = "Quality"
		f8_local9:setText( ToUpperCase( "" ), 0 )
		f8_local9:SetFontSize( 32 * _1080p )
		f8_local9:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f8_local9:SetAlignment( LUI.Alignment.Right )
		f8_local9:SetDecodeLetterLength( 20 )
		f8_local9:SetDecodeMaxRandChars( 6 )
		f8_local9:SetDecodeUpdatesPerLetter( 4 )
		f8_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 515, _1080p * 875, _1080p * 15, _1080p * 47 )
		self:addElement( f8_local9 )
		self.Quality = f8_local9
	end
	local f8_local10 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
		f8_local10 = LUI.UIImage.new()
		f8_local10.id = "MPStrip"
		f8_local10:SetRGBFromInt( 6908265, 0 )
		f8_local10:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 11, 0, 0 )
		self:addElement( f8_local10 )
		self.MPStrip = f8_local10
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
			f8_local8:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f8_local9:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.Quality:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
			f8_local10:RegisterAnimationSequence( "DefaultSequence", {
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
				f8_local8:AnimateSequence( "DefaultSequence" )
			end
			if Engine.IsMultiplayer() then
				f8_local9:AnimateSequence( "DefaultSequence" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
				f8_local10:AnimateSequence( "DefaultSequence" )
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
			f8_local8:RegisterAnimationSequence( "ShowQuality", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f8_local9:RegisterAnimationSequence( "ShowQuality", {
				{
					function ()
						return self.Quality:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
			f8_local10:RegisterAnimationSequence( "ShowQuality", {
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
				f8_local8:AnimateSequence( "ShowQuality" )
			end
			if Engine.IsMultiplayer() then
				f8_local9:AnimateSequence( "ShowQuality" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
				f8_local10:AnimateSequence( "ShowQuality" )
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
			f8_local8:RegisterAnimationSequence( "HideQuality", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f8_local9:RegisterAnimationSequence( "HideQuality", {
				{
					function ()
						return self.Quality:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
			f8_local10:RegisterAnimationSequence( "HideQuality", {
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
				f8_local8:AnimateSequence( "HideQuality" )
			end
			if Engine.IsMultiplayer() then
				f8_local9:AnimateSequence( "HideQuality" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
				f8_local10:AnimateSequence( "HideQuality" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local3( self, f8_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "RigCustomizationAppearenceDetails", RigCustomizationAppearenceDetails )
LockTable( _M )
