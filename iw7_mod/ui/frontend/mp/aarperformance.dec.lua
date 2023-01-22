local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.AAR.performance"
f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = DataSources.frontEnd.AAR.performance.gamesPlayed:GetValue( f1_arg2 )
	local f1_local1 = 5
	local f1_local2 = LUI.DataSourceFromList.new( f1_local1 )
	f1_local2.MakeDataSourceAtIndex = function ( f2_arg0, f2_arg1, f2_arg2 )
		local f2_local0 = f1_arg0 .. "." .. f2_arg1
		local f2_local1 = function ( f3_arg0 )
			if f1_arg1 then
				return string.format( "%.2f", f3_arg0 )
			else
				return string.format( "%d", f3_arg0 )
			end
		end
		
		local f2_local2 = f1_local1 - f1_local0
		local f2_local3 = function ( f4_arg0 )
			return f2_local2 <= f2_arg1
		end
		
		local f2_local4 = GetIntForColor( SWATCHES.AAR.InfoHighlight )
		if f2_arg1 < f1_local1 - 1 then
			f2_local4 = GetIntForColor( SWATCHES.AAR.InfoNormal )
		end
		local f2_local5 = LUI.DataSourceInControllerModel.new( f2_local0 .. ".value", 0 )
		return {
			value = f2_local5,
			maxValue = LUI.DataSourceInControllerModel.new( f1_arg0 .. ".maxValue", 0 ),
			barColor = LUI.DataSourceInControllerModel.new( f2_local0 .. ".barColor", f2_local4 ),
			valueText = f2_local5:Filter( "valueText", f2_local1 ),
			valid = DataSources.frontEnd.AAR.performance.gamesPlayed:FilterTo( f2_local5, "valid", f2_local3 )
		}
	end
	
	return f1_local2
end

f0_local2 = function ( f5_arg0, f5_arg1, f5_arg2 )
	assert( f5_arg0.KDRatioBarGraph )
	assert( f5_arg0.AARWinLossBar )
	assert( f5_arg0.SPMRatioBarGraph )
	assert( f5_arg0.AARKDStatsGroup )
	assert( f5_arg0.PersonalStatsButton )
	assert( f5_arg0.MatchStatsButton )
	f5_arg0.KDRatioBarGraph:SetGraphDataSource( f0_local1( f0_local0 .. ".kdHistory", true, f5_arg1 ), DataSources.frontEnd.AAR.performance.kdHistory, f5_arg1, true )
	f5_arg0.KDRatioBarGraph:SetDataSource( DataSources.frontEnd.AAR.performance.kdHistory, f5_arg1 )
	f5_arg0.SPMRatioBarGraph:SetGraphDataSource( f0_local1( f0_local0 .. ".spmHistory", false, f5_arg1 ), DataSources.frontEnd.AAR.performance.spmHistory, f5_arg1, false )
	f5_arg0.SPMRatioBarGraph:SetDataSource( DataSources.frontEnd.AAR.performance.spmHistory, f5_arg1 )
	f5_arg0.AARWinLossBar:SetDataSource( DataSources.frontEnd.AAR.performance, f5_arg1 )
	f5_arg0.AARKDStatsGroup:SetDataSource( DataSources.frontEnd.AAR.performance, f5_arg1 )
	f5_arg0.PersonalStatsButton:addEventHandler( "button_over", function ( f6_arg0, f6_arg1 )
		assert( f6_arg0:getParent() )
		local f6_local0 = assert
		local f6_local1 = f6_arg0:getParent()
		f6_local0( f6_local1.AARMinimapElement )
		f6_local0 = f6_arg0:getParent()
		f6_local0.AARMinimapElement:ShowPlayerOnlyAARMinimap( true )
	end )
	f5_arg0.MatchStatsButton:addEventHandler( "button_over", function ( f7_arg0, f7_arg1 )
		local f7_local0 = f7_arg0:getParent()
		f7_local0.AARMinimapElement:ShowPlayerOnlyAARMinimap( false )
	end )
	ACTIONS.GainFocus( f5_arg0, "PersonalStatsButton", f5_arg1 )
end

function AARPerformance( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, -960 * _1080p, 960 * _1080p, -386.5 * _1080p, 386.5 * _1080p )
	self.id = "AARPerformance"
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	self:playSound( "menu_open" )
	local f8_local2 = self
	local MainBG = nil
	
	MainBG = LUI.UIImage.new()
	MainBG.id = "MainBG"
	MainBG:SetAlpha( 0.3, 0 )
	MainBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -827, _1080p * 818, _1080p * -361.54, _1080p * 302.46 )
	self:addElement( MainBG )
	self.MainBG = MainBG
	
	local GradientBackgroundInGameOnly = nil
	
	GradientBackgroundInGameOnly = LUI.UIImage.new()
	GradientBackgroundInGameOnly.id = "GradientBackgroundInGameOnly"
	GradientBackgroundInGameOnly:SetRGBFromInt( 0, 0 )
	GradientBackgroundInGameOnly:SetAlpha( 0.5, 0 )
	GradientBackgroundInGameOnly:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -337, _1080p * 490, _1080p * 28, _1080p * 685.5 )
	self:addElement( GradientBackgroundInGameOnly )
	self.GradientBackgroundInGameOnly = GradientBackgroundInGameOnly
	
	local AARKDStatsGroup = nil
	
	AARKDStatsGroup = MenuBuilder.BuildRegisteredType( "AARKDStatsGroup", {
		controllerIndex = f8_local1
	} )
	AARKDStatsGroup.id = "AARKDStatsGroup"
	AARKDStatsGroup:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1477, _1080p * 1773, _1080p * 28, _1080p * 681 )
	self:addElement( AARKDStatsGroup )
	self.AARKDStatsGroup = AARKDStatsGroup
	
	local KDRatioBarGraph = nil
	
	KDRatioBarGraph = MenuBuilder.BuildRegisteredType( "AARBarGraph", {
		controllerIndex = f8_local1
	} )
	KDRatioBarGraph.id = "KDRatioBarGraph"
	KDRatioBarGraph.SubHeader:setText( Engine.Localize( "LUA_MENU_MP_AAR_LAST_5_GAMES" ), 0 )
	KDRatioBarGraph.Global.StatTitle:setText( Engine.Localize( "LUA_MENU_MP_AAR_GLOBAL_KD" ), 0 )
	KDRatioBarGraph.PeronalBest.StatTitle:setText( Engine.Localize( "LUA_MENU_MP_AAR_PERSONAL_BEST_KD" ), 0 )
	KDRatioBarGraph.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_KD_RATIO" ) ), 0 )
	KDRatioBarGraph:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1782, _1080p * -1325, _1080p * 401, _1080p * 685.5 )
	self:addElement( KDRatioBarGraph )
	self.KDRatioBarGraph = KDRatioBarGraph
	
	local AARMinimapElement = nil
	
	AARMinimapElement = MenuBuilder.BuildRegisteredType( "AARMinimap", {
		markerMaterial = "icon_slot_buy",
		controllerIndex = f8_local1
	} )
	AARMinimapElement.id = "AARMinimapElement"
	AARMinimapElement:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 713.26, _1080p * 1359.74, _1080p * 28, _1080p * 603.43 )
	self:addElement( AARMinimapElement )
	self.AARMinimapElement = AARMinimapElement
	
	local AARWinLossBar = nil
	
	AARWinLossBar = MenuBuilder.BuildRegisteredType( "AARWinLossBar", {
		controllerIndex = f8_local1
	} )
	AARWinLossBar.id = "AARWinLossBar"
	AARWinLossBar:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -337, _1080p * 490, _1080p * -166, _1080p * -87.5 )
	self:addElement( AARWinLossBar )
	self.AARWinLossBar = AARWinLossBar
	
	local PersonalStatsButton = nil
	
	PersonalStatsButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f8_local1
	} )
	PersonalStatsButton.id = "PersonalStatsButton"
	PersonalStatsButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_AAR_PERSONAL_MAP" ) ), 0 )
	PersonalStatsButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 138, _1080p * 524, _1080p * 28, _1080p * 59 )
	self:addElement( PersonalStatsButton )
	self.PersonalStatsButton = PersonalStatsButton
	
	local MatchStatsButton = nil
	
	MatchStatsButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f8_local1
	} )
	MatchStatsButton.id = "MatchStatsButton"
	MatchStatsButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_AAR_MATCH_MAP" ) ), 0 )
	MatchStatsButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 138, _1080p * 524, _1080p * 63, _1080p * 94 )
	self:addElement( MatchStatsButton )
	self.MatchStatsButton = MatchStatsButton
	
	local AARProgressContainer = nil
	
	AARProgressContainer = MenuBuilder.BuildRegisteredType( "AARProgressContainer", {
		controllerIndex = f8_local1
	} )
	AARProgressContainer.id = "AARProgressContainer"
	AARProgressContainer:SetAlpha( 0, 0 )
	AARProgressContainer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 138, _1080p * 1773, _1080p * 698.43, _1080p * 761 )
	self:addElement( AARProgressContainer )
	self.AARProgressContainer = AARProgressContainer
	
	local SPMRatioBarGraph = nil
	
	SPMRatioBarGraph = MenuBuilder.BuildRegisteredType( "AARBarGraph", {
		controllerIndex = f8_local1
	} )
	SPMRatioBarGraph.id = "SPMRatioBarGraph"
	SPMRatioBarGraph.SubHeader:setText( Engine.Localize( "LUA_MENU_MP_AAR_LAST_5_GAMES" ), 0 )
	SPMRatioBarGraph.Global.StatTitle:setText( Engine.Localize( "LUA_MENU_MP_AAR_GLOBAL_SPM" ), 0 )
	SPMRatioBarGraph.PeronalBest.StatTitle:setText( Engine.Localize( "LUA_MENU_MP_AAR_PERSONAL_BEST_SPM" ), 0 )
	SPMRatioBarGraph.Title:setText( Engine.Localize( "LUA_MENU_MP_AAR_SCORE_PER_MINUTE" ), 0 )
	SPMRatioBarGraph:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 138, _1080p * 595, _1080p * 106, _1080p * 389.5 )
	self:addElement( SPMRatioBarGraph )
	self.SPMRatioBarGraph = SPMRatioBarGraph
	
	f0_local2( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "AARPerformance", AARPerformance )
LockTable( _M )
