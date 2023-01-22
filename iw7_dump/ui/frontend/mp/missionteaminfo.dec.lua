local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PreLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	InitCoreMPRankedDataSources()
end

f0_local0 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Loot.IsOwned( f2_arg1, LOOT.DoubleXPTokenID )
	if f2_local0 > 0 then
		f2_arg0.DoubleXPTokenValue:setText( f2_local0 )
		if not f2_arg0.doubleXPTokenShown then
			f2_arg0.DoubleXPTokenValue:SetShadowVOffset( -0 )
			ACTIONS.AnimateSequence( f2_arg0, "DoubleXPTokenAvailable" )
			f2_arg0.doubleXPTokenShown = true
		end
	end
end

f0_local1 = function ( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.MissionTeamBacker )
	assert( f3_arg0.Icon )
	assert( f3_arg0.TeamRank )
	assert( f3_arg0.TeamName )
	local f3_local0 = f3_arg2 or MissionDirector.GetActiveMissionTeam( f3_arg1 )
	local f3_local1 = CSV.ReadRow( CSV.missionTeams, Engine.TableLookupGetRowNum( CSV.missionTeams.file, CSV.missionTeams.cols.index, f3_local0 ) )
	local f3_local2 = SWATCHES.MissionTeams[f3_local1.color]
	local f3_local3 = 1 + MissionDirector.GetMissionTeamLevel( f3_arg1, f3_local0 )
	f3_arg0.MissionTeamBacker:SetRGBFromTable( f3_local2, 0 )
	f3_arg0.Icon:setImage( RegisterMaterial( f3_local1.image ), 0 )
	f3_arg0.TeamRank:setText( f3_local3, 0 )
	f3_arg0.TeamName:setText( ToUpperCase( Engine.Localize( f3_local1.name ) ), 0 )
	if f3_local3 > 49 then
		f3_arg0.TeamRank:SetRGBFromTable( SWATCHES.AAR.CommanderRankProgress, 0 )
	else
		f3_arg0.TeamRank:SetRGBFromTable( COLORS.white, 0 )
	end
end

function PostLoadFunc( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg0.UpdateDoubleXPTokens = f0_local0
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f4_arg0.TeamName:SetShadowVOffset( -0 )
		f4_arg0.TeamRank:SetShadowVOffset( -0 )
		if IsLanguageOversizedFont() or IsLanguageItalian() then
			f4_arg0.TeamName:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 10, _1080p * -360, _1080p * 8, _1080p * 35 )
		end
		f0_local0( f4_arg0, f4_arg1 )
	end
	f4_arg0.KeysValue:SetShadowVOffset( -0 )
	f4_arg0.PartsValue:SetShadowVOffset( -0 )
	if f4_arg0.CODPointsValue then
		f4_arg0.CODPointsValue:SetShadowVOffset( -0 )
	end
	f4_arg0.SetupMissionTeam = f0_local1
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f0_local1( f4_arg0, f4_arg1 )
	end
end

function MissionTeamInfo( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 700 * _1080p, 0, 88 * _1080p )
	self.id = "MissionTeamInfo"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	PreLoadFunc( self, f5_local1, controller )
	local f5_local2 = self
	local CurrencyBacker = nil
	
	CurrencyBacker = LUI.UIBlur.new()
	CurrencyBacker.id = "CurrencyBacker"
	CurrencyBacker:SetRGBFromInt( 11776947, 0 )
	CurrencyBacker:SetBlurStrength( 1.5, 0 )
	CurrencyBacker:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -40, 0 )
	self:addElement( CurrencyBacker )
	self.CurrencyBacker = CurrencyBacker
	
	local CurrencyBackerDark = nil
	
	CurrencyBackerDark = LUI.UIImage.new()
	CurrencyBackerDark.id = "CurrencyBackerDark"
	CurrencyBackerDark:SetRGBFromInt( 0, 0 )
	CurrencyBackerDark:SetAlpha( 0.6, 0 )
	CurrencyBackerDark:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -350, 0, _1080p * -40, 0 )
	self:addElement( CurrencyBackerDark )
	self.CurrencyBackerDark = CurrencyBackerDark
	
	local CurrencyBackerGradient = nil
	
	CurrencyBackerGradient = LUI.UIImage.new()
	CurrencyBackerGradient.id = "CurrencyBackerGradient"
	CurrencyBackerGradient:SetRGBFromInt( 0, 0 )
	CurrencyBackerGradient:SetAlpha( 0.2, 0 )
	CurrencyBackerGradient:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	CurrencyBackerGradient:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -30, 0 )
	self:addElement( CurrencyBackerGradient )
	self.CurrencyBackerGradient = CurrencyBackerGradient
	
	local MissionTeamBacker = nil
	
	MissionTeamBacker = LUI.UIBlur.new()
	MissionTeamBacker.id = "MissionTeamBacker"
	MissionTeamBacker:SetBlurStrength( 1.5, 0 )
	MissionTeamBacker:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, 0, _1080p * 40 )
	self:addElement( MissionTeamBacker )
	self.MissionTeamBacker = MissionTeamBacker
	
	local MissionTeamBackerDark = nil
	
	MissionTeamBackerDark = LUI.UIImage.new()
	MissionTeamBackerDark.id = "MissionTeamBackerDark"
	MissionTeamBackerDark:SetRGBFromInt( 0, 0 )
	MissionTeamBackerDark:SetAlpha( 0.6, 0 )
	MissionTeamBackerDark:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -350, 0, 0, _1080p * 40 )
	self:addElement( MissionTeamBackerDark )
	self.MissionTeamBackerDark = MissionTeamBackerDark
	
	local MissionTeamBackerGradient = nil
	
	MissionTeamBackerGradient = LUI.UIImage.new()
	MissionTeamBackerGradient.id = "MissionTeamBackerGradient"
	MissionTeamBackerGradient:SetRGBFromInt( 0, 0 )
	MissionTeamBackerGradient:SetAlpha( 0.3, 0 )
	MissionTeamBackerGradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	MissionTeamBackerGradient:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, 0, _1080p * 30 )
	self:addElement( MissionTeamBackerGradient )
	self.MissionTeamBackerGradient = MissionTeamBackerGradient
	
	local Divider = nil
	
	Divider = LUI.UIImage.new()
	Divider.id = "Divider"
	Divider:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -1, _1080p * 1 )
	self:addElement( Divider )
	self.Divider = Divider
	
	local f5_local10 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f5_local10 = LUI.UIImage.new()
		f5_local10.id = "Icon"
		f5_local10:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -264, _1080p * -39, _1080p * -44.5, _1080p * 180.5 )
		self:addElement( f5_local10 )
		self.Icon = f5_local10
	end
	local f5_local11 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f5_local11 = MenuBuilder.BuildRegisteredType( "RankInfo", {
			controllerIndex = f5_local1
		} )
		f5_local11.id = "RankInfo"
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f5_local11:SetDataSource( DataSources.alwaysLoaded.MP.ranked.progression, f5_local1 )
		end
		f5_local11.Rank:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f5_local11:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -335, _1080p * -241, _1080p * -43, _1080p * 1 )
		self:addElement( f5_local11 )
		self.RankInfo = f5_local11
	end
	local f5_local12 = nil
	if CONDITIONS.IsAliensOnline( self ) then
		f5_local12 = MenuBuilder.BuildRegisteredType( "CPRankinfo", {
			controllerIndex = f5_local1
		} )
		f5_local12.id = "CPRankinfo"
		if CONDITIONS.IsAliensOnline( self ) then
			f5_local12:SetDataSource( DataSources.alwaysLoaded.CP.ranked.progression, f5_local1 )
		end
		f5_local12.Rank:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f5_local12:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 365, _1080p * 459, _1080p * 1, _1080p * 45 )
		self:addElement( f5_local12 )
		self.CPRankinfo = f5_local12
	end
	local f5_local13 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f5_local13 = LUI.UIStyledText.new()
		f5_local13.id = "TeamRank"
		f5_local13:setText( "99", 0 )
		f5_local13:SetFontSize( 36 * _1080p )
		f5_local13:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f5_local13:SetAlignment( LUI.Alignment.Center )
		f5_local13:SetShadowMinDistance( -0.2, 0 )
		f5_local13:SetShadowMaxDistance( 0.2, 0 )
		f5_local13:SetShadowRGBFromInt( 0, 0 )
		f5_local13:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -329, _1080p * -265, _1080p * 3, _1080p * 39 )
		self:addElement( f5_local13 )
		self.TeamRank = f5_local13
	end
	local f5_local14 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f5_local14 = LUI.UIStyledText.new()
		f5_local14.id = "TeamName"
		f5_local14:setText( "", 0 )
		f5_local14:SetFontSize( 32 * _1080p )
		f5_local14:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f5_local14:SetAlignment( LUI.Alignment.Right )
		f5_local14:SetStartupDelay( 1000 )
		f5_local14:SetLineHoldTime( 400 )
		f5_local14:SetAnimMoveTime( 150 )
		f5_local14:SetEndDelay( 1000 )
		f5_local14:SetCrossfadeTime( 400 )
		f5_local14:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
		f5_local14:SetMaxVisibleLines( 1 )
		f5_local14:SetShadowMinDistance( -0.2, 0 )
		f5_local14:SetShadowMaxDistance( 0.2, 0 )
		f5_local14:SetShadowRGBFromInt( 0, 0 )
		f5_local14:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 10, _1080p * -374, _1080p * 4, _1080p * 36 )
		self:addElement( f5_local14 )
		self.TeamName = f5_local14
	end
	local PartsIcon = nil
	
	PartsIcon = LUI.UIImage.new()
	PartsIcon.id = "PartsIcon"
	PartsIcon:setImage( RegisterMaterial( "currency_parts_icon" ), 0 )
	PartsIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 119, _1080p * 155, _1080p * -39.5, _1080p * -3.5 )
	self:addElement( PartsIcon )
	self.PartsIcon = PartsIcon
	
	local KeysIcon = nil
	
	KeysIcon = LUI.UIImage.new()
	KeysIcon.id = "KeysIcon"
	KeysIcon:setImage( RegisterMaterial( "currency_keys_icon" ), 0 )
	KeysIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 234, _1080p * 270, _1080p * -39.5, _1080p * -3.5 )
	self:addElement( KeysIcon )
	self.KeysIcon = KeysIcon
	
	local f5_local17 = nil
	if CONDITIONS.AreCODPointsEnabled( self ) then
		f5_local17 = LUI.UIImage.new()
		f5_local17.id = "CODPointsIcon"
		f5_local17:setImage( RegisterMaterial( "currency_cod_points_icon" ), 0 )
		f5_local17:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 4, _1080p * 40, _1080p * -39.5, _1080p * -3.5 )
		self:addElement( f5_local17 )
		self.CODPointsIcon = f5_local17
	end
	local PartsValue = nil
	
	PartsValue = LUI.UIStyledText.new()
	PartsValue.id = "PartsValue"
	PartsValue:SetFontSize( 24 * _1080p )
	PartsValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PartsValue:SetAlignment( LUI.Alignment.Left )
	PartsValue:SetOptOutRightToLeftAlignmentFlip( true )
	PartsValue:SetStartupDelay( 1250 )
	PartsValue:SetLineHoldTime( 400 )
	PartsValue:SetAnimMoveTime( 300 )
	PartsValue:SetEndDelay( 1000 )
	PartsValue:SetCrossfadeTime( 500 )
	PartsValue:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	PartsValue:SetMaxVisibleLines( 1 )
	PartsValue:SetShadowMinDistance( -0.2, 0 )
	PartsValue:SetShadowMaxDistance( 0.2, 0 )
	PartsValue:SetShadowRGBFromInt( 0, 0 )
	PartsValue:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 153, _1080p * 225, _1080p * -33, _1080p * -9 )
	PartsValue:SubscribeToModel( DataSources.frontEnd.MP.commerce.craftingCurrency:GetModel( f5_local1 ), function ()
		local f6_local0 = DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			PartsValue:setText( f6_local0, 0 )
		end
	end )
	self:addElement( PartsValue )
	self.PartsValue = PartsValue
	
	local KeysValue = nil
	
	KeysValue = LUI.UIStyledText.new()
	KeysValue.id = "KeysValue"
	KeysValue:SetFontSize( 24 * _1080p )
	KeysValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KeysValue:SetAlignment( LUI.Alignment.Left )
	KeysValue:SetOptOutRightToLeftAlignmentFlip( true )
	KeysValue:SetStartupDelay( 1250 )
	KeysValue:SetLineHoldTime( 400 )
	KeysValue:SetAnimMoveTime( 300 )
	KeysValue:SetEndDelay( 1000 )
	KeysValue:SetCrossfadeTime( 500 )
	KeysValue:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	KeysValue:SetMaxVisibleLines( 1 )
	KeysValue:SetShadowMinDistance( -0.2, 0 )
	KeysValue:SetShadowMaxDistance( 0.2, 0 )
	KeysValue:SetShadowRGBFromInt( 0, 0 )
	KeysValue:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 274, _1080p * 346, _1080p * -33.5, _1080p * -9.5 )
	KeysValue:SubscribeToModel( DataSources.frontEnd.MP.commerce.inGameCurrency:GetModel( f5_local1 ), function ()
		local f7_local0 = DataSources.frontEnd.MP.commerce.inGameCurrency:GetValue( f5_local1 )
		if f7_local0 ~= nil then
			KeysValue:setText( f7_local0, 0 )
		end
	end )
	self:addElement( KeysValue )
	self.KeysValue = KeysValue
	
	local f5_local20 = nil
	if CONDITIONS.AreCODPointsEnabled( self ) then
		f5_local20 = LUI.UIStyledText.new()
		f5_local20.id = "CODPointsValue"
		f5_local20:SetFontSize( 24 * _1080p )
		f5_local20:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f5_local20:SetAlignment( LUI.Alignment.Left )
		f5_local20:SetOptOutRightToLeftAlignmentFlip( true )
		f5_local20:SetStartupDelay( 1250 )
		f5_local20:SetLineHoldTime( 400 )
		f5_local20:SetAnimMoveTime( 300 )
		f5_local20:SetEndDelay( 1000 )
		f5_local20:SetCrossfadeTime( 500 )
		f5_local20:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
		f5_local20:SetMaxVisibleLines( 1 )
		f5_local20:SetShadowMinDistance( -0.2, 0 )
		f5_local20:SetShadowMaxDistance( 0.2, 0 )
		f5_local20:SetShadowRGBFromInt( 0, 0 )
		f5_local20:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 41, _1080p * 113, _1080p * -33.5, _1080p * -9.5 )
		f5_local20:SubscribeToModel( DataSources.frontEnd.MP.commerce.premiumCurrency:GetModel( f5_local1 ), function ()
			local f8_local0 = DataSources.frontEnd.MP.commerce.premiumCurrency:GetValue( f5_local1 )
			if f8_local0 ~= nil then
				f5_local20:setText( f8_local0, 0 )
			end
		end )
		self:addElement( f5_local20 )
		self.CODPointsValue = f5_local20
	end
	local DoubleXPTokenIcon = nil
	
	DoubleXPTokenIcon = LUI.UIImage.new()
	DoubleXPTokenIcon.id = "DoubleXPTokenIcon"
	DoubleXPTokenIcon:SetAlpha( 0, 0 )
	DoubleXPTokenIcon:setImage( RegisterMaterial( "icon_iw7_xp_token" ), 0 )
	DoubleXPTokenIcon:SetUseAA( true )
	DoubleXPTokenIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -95, _1080p * -59, _1080p * -39, _1080p * -3 )
	self:addElement( DoubleXPTokenIcon )
	self.DoubleXPTokenIcon = DoubleXPTokenIcon
	
	local f5_local22 = nil
	if CONDITIONS.AreCODPointsEnabled( self ) then
		f5_local22 = LUI.UIStyledText.new()
		f5_local22.id = "DoubleXPTokenValue"
		f5_local22:SetAlpha( 0, 0 )
		f5_local22:setText( "00", 0 )
		f5_local22:SetFontSize( 24 * _1080p )
		f5_local22:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f5_local22:SetAlignment( LUI.Alignment.Left )
		f5_local22:SetOptOutRightToLeftAlignmentFlip( true )
		f5_local22:SetStartupDelay( 1250 )
		f5_local22:SetLineHoldTime( 400 )
		f5_local22:SetAnimMoveTime( 300 )
		f5_local22:SetEndDelay( 1000 )
		f5_local22:SetCrossfadeTime( 500 )
		f5_local22:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
		f5_local22:SetMaxVisibleLines( 1 )
		f5_local22:SetShadowMinDistance( -0.2, 0 )
		f5_local22:SetShadowMaxDistance( 0.2, 0 )
		f5_local22:SetShadowRGBFromInt( 0, 0 )
		f5_local22:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -58, _1080p * -3, _1080p * -33.5, _1080p * -9.5 )
		self:addElement( f5_local22 )
		self.DoubleXPTokenValue = f5_local22
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CurrencyBacker:RegisterAnimationSequence( "CPInit", {
			{
				function ()
					return self.CurrencyBacker:SetAlpha( 0, 0 )
				end
			}
		} )
		CurrencyBackerDark:RegisterAnimationSequence( "CPInit", {
			{
				function ()
					return self.CurrencyBackerDark:SetAlpha( 0.5, 0 )
				end
			},
			{
				function ()
					return self.CurrencyBackerDark:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -700, 0, _1080p * -40, 0, 0 )
				end
			}
		} )
		CurrencyBackerGradient:RegisterAnimationSequence( "CPInit", {
			{
				function ()
					return self.CurrencyBackerGradient:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.CurrencyBackerGradient:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -43, 0, 0 )
				end
			}
		} )
		MissionTeamBacker:RegisterAnimationSequence( "CPInit", {
			{
				function ()
					return self.MissionTeamBacker:SetAlpha( 0, 0 )
				end
			}
		} )
		MissionTeamBackerDark:RegisterAnimationSequence( "CPInit", {
			{
				function ()
					return self.MissionTeamBackerDark:SetAlpha( 0, 0 )
				end
			}
		} )
		MissionTeamBackerGradient:RegisterAnimationSequence( "CPInit", {
			{
				function ()
					return self.MissionTeamBackerGradient:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.CPInit = function ()
			CurrencyBacker:AnimateSequence( "CPInit" )
			CurrencyBackerDark:AnimateSequence( "CPInit" )
			CurrencyBackerGradient:AnimateSequence( "CPInit" )
			MissionTeamBacker:AnimateSequence( "CPInit" )
			MissionTeamBackerDark:AnimateSequence( "CPInit" )
			MissionTeamBackerGradient:AnimateSequence( "CPInit" )
		end
		
		PartsIcon:RegisterAnimationSequence( "CoDPointsDisabled", {
			{
				function ()
					return self.PartsIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 74, _1080p * 110, _1080p * -39.5, _1080p * -3.5, 0 )
				end
			}
		} )
		KeysIcon:RegisterAnimationSequence( "CoDPointsDisabled", {
			{
				function ()
					return self.KeysIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 189, _1080p * 225, _1080p * -39.5, _1080p * -3.5, 0 )
				end
			}
		} )
		PartsValue:RegisterAnimationSequence( "CoDPointsDisabled", {
			{
				function ()
					return self.PartsValue:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 108, _1080p * 180, _1080p * -33, _1080p * -9, 0 )
				end
			}
		} )
		KeysValue:RegisterAnimationSequence( "CoDPointsDisabled", {
			{
				function ()
					return self.KeysValue:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 229, _1080p * 301, _1080p * -33.5, _1080p * -9.5, 0 )
				end
			}
		} )
		self._sequences.CoDPointsDisabled = function ()
			PartsIcon:AnimateSequence( "CoDPointsDisabled" )
			KeysIcon:AnimateSequence( "CoDPointsDisabled" )
			PartsValue:AnimateSequence( "CoDPointsDisabled" )
			KeysValue:AnimateSequence( "CoDPointsDisabled" )
		end
		
		CurrencyBacker:RegisterAnimationSequence( "DoubleXPTokenAvailable", {
			{
				function ()
					return self.CurrencyBacker:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * -100, 0, _1080p * -40, 0, 0 )
				end
			}
		} )
		CurrencyBackerGradient:RegisterAnimationSequence( "DoubleXPTokenAvailable", {
			{
				function ()
					return self.CurrencyBackerGradient:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * -100, 0, _1080p * -30, 0, 0 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "DoubleXPTokenAvailable", {
			{
				function ()
					return self.Divider:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * -100, 0, _1080p * -1, _1080p * 1, 0 )
				end
			}
		} )
		DoubleXPTokenIcon:RegisterAnimationSequence( "DoubleXPTokenAvailable", {
			{
				function ()
					return self.DoubleXPTokenIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		if CONDITIONS.AreCODPointsEnabled( self ) then
			f5_local22:RegisterAnimationSequence( "DoubleXPTokenAvailable", {
				{
					function ()
						return self.DoubleXPTokenValue:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.DoubleXPTokenAvailable = function ()
			CurrencyBacker:AnimateSequence( "DoubleXPTokenAvailable" )
			CurrencyBackerGradient:AnimateSequence( "DoubleXPTokenAvailable" )
			Divider:AnimateSequence( "DoubleXPTokenAvailable" )
			DoubleXPTokenIcon:AnimateSequence( "DoubleXPTokenAvailable" )
			if CONDITIONS.AreCODPointsEnabled( self ) then
				f5_local22:AnimateSequence( "DoubleXPTokenAvailable" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f5_local11:SetDataSource( DataSources.alwaysLoaded.MP.ranked.progression, f5_local1 )
	end
	if CONDITIONS.IsAliensOnline( self ) then
		f5_local12:SetDataSource( DataSources.alwaysLoaded.CP.ranked.progression, f5_local1 )
	end
	PostLoadFunc( self, f5_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPInit" )
	end
	if not CONDITIONS.AreCODPointsEnabled( self ) then
		ACTIONS.AnimateSequence( self, "CoDPointsDisabled" )
	end
	return self
end

MenuBuilder.registerType( "MissionTeamInfo", MissionTeamInfo )
LockTable( _M )
