local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.AAR.scoreboard"
f0_local1 = 38
f0_local2 = 32
function GetTextWidth( f1_arg0 )
	local f1_local0, f1_local1, f1_local2, f1_local3 = GetTextDimensions( f1_arg0, FONTS.GetFont( FONTS.MainCondensed.File ), f0_local1 )
	return f1_local2
end

local f0_local3 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = 32
	local f2_local1 = 95
	local f2_local2 = 45
	local f2_local3 = 111
	local f2_local4 = -111
	local f2_local5 = f2_arg1 * f2_local0 + f2_local1 + 22
	if f2_arg0.BackgroundBlur then
		f2_arg0.BackgroundBlur:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * f2_local3, _1080p * f2_local4, _1080p * f2_local2, _1080p * f2_local5 )
	end
end

function AdjustHeaderTextHorizontalPosition( f3_arg0 )
	assert( f3_arg0.GameType )
	assert( f3_arg0.MapName )
	local f3_local0 = GetTextWidth( f3_arg0.GameType:getText() )
	local f3_local1 = GetTextWidth( f3_arg0.MapName:getText() )
	local f3_local2, f3_local3, f3_local4, f3_local5 = f3_arg0.Scores:getLocalRect()
	local f3_local6 = math.abs( f3_local2 - f3_local4 )
	local f3_local7 = f3_local0 + f3_local1
	local f3_local8 = _1080p * 30
	local f3_local9 = 20
	local f3_local10 = (f0_local1 - f0_local2) / 2
	local f3_local11 = -358
	local f3_local12 = f3_local11 + f3_local10
	local f3_local13 = -f3_local0 / 2 - f3_local9
	f3_arg0.GameType:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * f3_local13, _1080p * (f3_local13 + f3_local0 + f3_local9), _1080p * f3_local11, _1080p * (f3_local11 + f0_local1), 0 )
	local f3_local14 = -f3_local6 / 2 + f3_local8
	f3_arg0.MapName:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, f3_local14, f3_local14 + f3_local1, _1080p * f3_local12, _1080p * (f3_local12 + f0_local2), 0 )
end

function PostLoadFunc( f4_arg0, f4_arg1, f4_arg2 )
	f0_local3( f4_arg0, 0 )
	AdjustHeaderTextHorizontalPosition( f4_arg0 )
	local self = LUI.UITimer.new( nil, {
		interval = 1000,
		event = {
			name = "refreshScores",
			speakerOnly = true
		}
	} )
	self.id = "TeamScoresTimer"
	f4_arg0:addElement( self )
	f4_arg0:registerEventHandler( "refreshScores", function ( element, event )
		element.Scores:RefreshRows( event.speakerOnly )
		local f5_local0 = math.max( 4, element.Scores:GetNumPlayers() )
		element.Scores:SetBackgroundRowCount( f5_local0 )
		f0_local3( element, f5_local0 )
	end )
	f4_arg0:processEvent( {
		name = "refreshScores"
	} )
	local f4_local1 = function ( f6_arg0 )
		return function ()
			local f7_local0 = f6_arg0:GetMyRowIndex()
			if f7_local0 then
				return {
					x = 0,
					y = f7_local0
				}
			else
				
			end
		end
		
	end
	
	f4_arg0.Scores:SetDefaultFocusFunction( f4_local1( f4_arg0.Scores ) )
end

function AARFFAScoreboard( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "AARFFAScoreboard"
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	self:playSound( "menu_open" )
	local f8_local2 = self
	local BackgroundBlur = nil
	
	BackgroundBlur = MenuBuilder.BuildRegisteredType( "ScoreboardHeaderBG", {
		controllerIndex = f8_local1
	} )
	BackgroundBlur.id = "BackgroundBlur"
	BackgroundBlur:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 429, _1080p * -429, _1080p * 45, _1080p * 417 )
	self:addElement( BackgroundBlur )
	self.BackgroundBlur = BackgroundBlur
	
	local Scores = nil
	
	Scores = MenuBuilder.BuildRegisteredType( "FFATeamScores", {
		controllerIndex = f8_local1
	} )
	Scores.id = "Scores"
	Scores.BackgroundColorTop:SetLeft( _1080p * 37, 0 )
	Scores.BackgroundColorTop:SetRight( _1080p * 895, 0 )
	Scores.BackgroundColorTop:SetTop( _1080p * 0, 0 )
	Scores.BackgroundColorTop:SetAlpha( 0, 0 )
	Scores.BackgroundBacking:SetLeft( _1080p * 37, 0 )
	Scores.BackgroundBacking:SetAlpha( 0, 0 )
	Scores.BackgroundColor:SetLeft( _1080p * 37, 0 )
	Scores.BackgroundColor:SetAlpha( 0, 0 )
	Scores.TeamInfo:SetLeft( _1080p * 0, 0 )
	Scores.TeamInfo:SetRight( _1080p * 0, 0 )
	Scores.TeamInfo:SetAlpha( 0, 0 )
	Scores.TeamInfo.Score:setText( "", 0 )
	Scores:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -466, _1080p * 418, _1080p * -180, _1080p * 530 )
	self:addElement( Scores )
	self.Scores = Scores
	
	local MapName = nil
	
	MapName = LUI.UIText.new()
	MapName.id = "MapName"
	MapName:SetFontSize( 32 * _1080p )
	MapName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MapName:SetAlignment( LUI.Alignment.Left )
	MapName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 539.29, _1080p * 793.29, _1080p * 60, _1080p * 92 )
	MapName:SubscribeToModel( DataSources.frontEnd.AAR.mapName:GetModel( f8_local1 ), function ()
		local f9_local0 = DataSources.frontEnd.AAR.mapName:GetValue( f8_local1 )
		if f9_local0 ~= nil then
			MapName:setText( ToUpperCase( f9_local0 ), 0 )
		end
	end )
	self:addElement( MapName )
	self.MapName = MapName
	
	local GameType = nil
	
	GameType = LUI.UIText.new()
	GameType.id = "GameType"
	GameType:SetFontSize( 38 * _1080p )
	GameType:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GameType:SetAlignment( LUI.Alignment.Center )
	GameType:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 618, _1080p * 1302, _1080p * 54, _1080p * 92 )
	GameType:SubscribeToModel( DataSources.frontEnd.AAR.gameTypeName:GetModel( f8_local1 ), function ()
		local f10_local0 = DataSources.frontEnd.AAR.gameTypeName:GetValue( f8_local1 )
		if f10_local0 ~= nil then
			GameType:setText( ToUpperCase( f10_local0 ), 0 )
		end
	end )
	self:addElement( GameType )
	self.GameType = GameType
	
	PostLoadFunc( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "AARFFAScoreboard", AARFFAScoreboard )
LockTable( _M )
