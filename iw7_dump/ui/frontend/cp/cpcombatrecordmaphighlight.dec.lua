local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = ZombiesUtils.CombatRecordMenuModelPath .. ".maps"
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.MapPreview )
	assert( f1_arg0.AKillsStat )
	assert( f1_arg0.ADownsStat )
	local f1_local0 = ZombiesUtils.GetMapsDataSources( f0_local0, f1_arg1 )
	local f1_local1 = f1_local0:GetDataSourceAtIndex( 0 )
	local f1_local2 = f1_local1.image:GetValue( f1_arg1 )
	local f1_local3 = f1_local1.name:GetValue( f1_arg1 )
	assert( f1_local2 )
	assert( f1_local3 )
	f1_arg0.MapPreview:setImage( RegisterMaterial( f1_local2 ), 0 )
	f1_arg0.MapNameTitle:setText( ToUpperCase( f1_local3 ), 0 )
	local f1_local4 = Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Coop, "coopCareerStats", "gamesPlayed" )
	local f1_local5 = 0
	local f1_local6 = 0
	if f1_local4 > 0 then
		f1_local5 = math.floor( DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Kills:GetValue( f1_arg1 ) / f1_local4 )
		f1_local6 = math.floor( Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Coop, "coopCareerStats", "Downs" ) / f1_local4 )
	end
	f1_arg0.ADownsStat.AmountLabel:setText( tostring( f1_local6 ), 0 )
	f1_arg0.AKillsStat.AmountLabel:setText( tostring( f1_local5 ), 0 )
end

function CPCombatRecordMapHighlight( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1200 * _1080p, 0, 825 * _1080p )
	self.id = "CPCombatRecordMapHighlight"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local MapPreview = nil
	
	MapPreview = LUI.UIImage.new()
	MapPreview.id = "MapPreview"
	MapPreview:SetScale( -0.27, 0 )
	MapPreview:setImage( RegisterMaterial( "zm_theater_poster_rave" ), 0 )
	MapPreview:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -7.16, _1080p * 675.5, _1080p * -88.24, _1080p * 935.76 )
	self:addElement( MapPreview )
	self.MapPreview = MapPreview
	
	local CardNameBacking = nil
	
	CardNameBacking = LUI.UIImage.new()
	CardNameBacking.id = "CardNameBacking"
	CardNameBacking:SetRGBFromInt( 0, 0 )
	CardNameBacking:SetAlpha( 0.5, 0 )
	CardNameBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 93, _1080p * 627, _1080p * 50, _1080p * 150 )
	self:addElement( CardNameBacking )
	self.CardNameBacking = CardNameBacking
	
	local CardNameBackingLeftBar = nil
	
	CardNameBackingLeftBar = LUI.UIImage.new()
	CardNameBackingLeftBar.id = "CardNameBackingLeftBar"
	CardNameBackingLeftBar:SetAlpha( 0, 0 )
	CardNameBackingLeftBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 85, _1080p * 93, _1080p * 50, _1080p * 150 )
	self:addElement( CardNameBackingLeftBar )
	self.CardNameBackingLeftBar = CardNameBackingLeftBar
	
	local TitleBacking = nil
	
	TitleBacking = LUI.UIImage.new()
	TitleBacking.id = "TitleBacking"
	TitleBacking:SetRGBFromTable( SWATCHES.genericMenu.breadcrumbs, 0 )
	TitleBacking:SetAlpha( 0, 0 )
	TitleBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 85, _1080p * 1051, _1080p * 15, _1080p * 50 )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local HighestRoundsSurvived = nil
	
	HighestRoundsSurvived = LUI.UIStyledText.new()
	HighestRoundsSurvived.id = "HighestRoundsSurvived"
	HighestRoundsSurvived:SetAlpha( 0, 0 )
	HighestRoundsSurvived:setText( Engine.Localize( "LUA_MENU_ZM_HIGHEST_ROUNDS_SURVIVED" ), 0 )
	HighestRoundsSurvived:SetFontSize( 34 * _1080p )
	HighestRoundsSurvived:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	HighestRoundsSurvived:SetAlignment( LUI.Alignment.Left )
	HighestRoundsSurvived:SetOptOutRightToLeftAlignmentFlip( true )
	HighestRoundsSurvived:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 600, _1080p * 1191, _1080p * 16, _1080p * 50 )
	self:addElement( HighestRoundsSurvived )
	self.HighestRoundsSurvived = HighestRoundsSurvived
	
	local MapNameTitle = nil
	
	MapNameTitle = LUI.UIStyledText.new()
	MapNameTitle.id = "MapNameTitle"
	MapNameTitle:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	MapNameTitle:setText( "MAP NAME", 0 )
	MapNameTitle:SetFontSize( 60 * _1080p )
	MapNameTitle:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	MapNameTitle:SetAlignment( LUI.Alignment.Left )
	MapNameTitle:SetOptOutRightToLeftAlignmentFlip( true )
	MapNameTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 600, _1080p * -9, _1080p * 70, _1080p * 130 )
	self:addElement( MapNameTitle )
	self.MapNameTitle = MapNameTitle
	
	local HRoundStat = nil
	
	HRoundStat = MenuBuilder.BuildRegisteredType( "CPCombatRecordStat", {
		controllerIndex = f2_local1
	} )
	HRoundStat.id = "HRoundStat"
	HRoundStat.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_HIGHEST_ROUNDS" ) ), 0 )
	HRoundStat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 679, _1080p * 879, _1080p * 179.5, _1080p * 279.5 )
	HRoundStat:SubscribeToModel( DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Highest_Wave:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.alwaysLoaded.playerData.CP.coopCareerStats.Highest_Wave:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			HRoundStat.AmountLabel:setText( f3_local0, 0 )
		end
	end )
	self:addElement( HRoundStat )
	self.HRoundStat = HRoundStat
	
	local ARoundStat = nil
	
	ARoundStat = MenuBuilder.BuildRegisteredType( "CPCombatRecordStat", {
		controllerIndex = f2_local1
	} )
	ARoundStat.id = "ARoundStat"
	ARoundStat.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_AVERAGE_ROUNDS" ) ), 0 )
	ARoundStat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 679, _1080p * 879, _1080p * 304.5, _1080p * 404.5 )
	ARoundStat:SubscribeToModel( DataSources.frontEnd.CP.avgWavesFilter:GetModel( f2_local1 ), function ()
		local f4_local0 = DataSources.frontEnd.CP.avgWavesFilter:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			ARoundStat.AmountLabel:setText( f4_local0, 0 )
		end
	end )
	self:addElement( ARoundStat )
	self.ARoundStat = ARoundStat
	
	local AKillsStat = nil
	
	AKillsStat = MenuBuilder.BuildRegisteredType( "CPCombatRecordStat", {
		controllerIndex = f2_local1
	} )
	AKillsStat.id = "AKillsStat"
	AKillsStat.AmountLabel:setText( "0", 0 )
	AKillsStat.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_AVERAGE_KILLS" ) ), 0 )
	AKillsStat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 679, _1080p * 879, _1080p * 429.5, _1080p * 529.5 )
	self:addElement( AKillsStat )
	self.AKillsStat = AKillsStat
	
	local ADownsStat = nil
	
	ADownsStat = MenuBuilder.BuildRegisteredType( "CPCombatRecordStat", {
		controllerIndex = f2_local1
	} )
	ADownsStat.id = "ADownsStat"
	ADownsStat.AmountLabel:setText( "0", 0 )
	ADownsStat.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_AVERAGE_DOWNS" ) ), 0 )
	ADownsStat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 679, _1080p * 879, _1080p * 554.5, _1080p * 654.5 )
	self:addElement( ADownsStat )
	self.ADownsStat = ADownsStat
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MapPreview:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.MapPreview:SetAlpha( 0, 0 )
				end
			}
		} )
		CardNameBacking:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.CardNameBacking:SetAlpha( 0, 0 )
				end
			}
		} )
		CardNameBackingLeftBar:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.CardNameBackingLeftBar:SetAlpha( 0, 0 )
				end
			}
		} )
		HighestRoundsSurvived:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.HighestRoundsSurvived:SetAlpha( 0, 0 )
				end
			}
		} )
		MapNameTitle:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.MapNameTitle:SetAlpha( 0, 0 )
				end
			}
		} )
		HRoundStat:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.HRoundStat:SetAlpha( 0, 0 )
				end
			}
		} )
		ARoundStat:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.ARoundStat:SetAlpha( 0, 0 )
				end
			}
		} )
		AKillsStat:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.AKillsStat:SetAlpha( 0, 0 )
				end
			}
		} )
		ADownsStat:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.ADownsStat:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NoStats = function ()
			MapPreview:AnimateSequence( "NoStats" )
			CardNameBacking:AnimateSequence( "NoStats" )
			CardNameBackingLeftBar:AnimateSequence( "NoStats" )
			HighestRoundsSurvived:AnimateSequence( "NoStats" )
			MapNameTitle:AnimateSequence( "NoStats" )
			HRoundStat:AnimateSequence( "NoStats" )
			ARoundStat:AnimateSequence( "NoStats" )
			AKillsStat:AnimateSequence( "NoStats" )
			ADownsStat:AnimateSequence( "NoStats" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "HRoundStat",
		sequenceName = "Condensed",
		elementPath = "HRoundStat"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ARoundStat",
		sequenceName = "Condensed",
		elementPath = "ARoundStat"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "AKillsStat",
		sequenceName = "Condensed",
		elementPath = "AKillsStat"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ADownsStat",
		sequenceName = "Condensed",
		elementPath = "ADownsStat"
	} )
	return self
end

MenuBuilder.registerType( "CPCombatRecordMapHighlight", CPCombatRecordMapHighlight )
LockTable( _M )
