local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = assert
	local f1_local1 = f1_arg0.MapName
	if f1_local1 then
		f1_local1 = f1_arg0.GameType and f1_arg0.GameTime
	end
	f1_local0( f1_local1, "Warning: ScoreboardHeader items missing..." )
	f1_arg0:SetAlignment( LUI.Alignment.Center )
	f1_local0 = function ()
		local f2_local0 = ""
		local f2_local1 = ""
		local f2_local2 = ""
		local f2_local3 = DataSources.frontEnd.AAR.mapName:GetValue( f1_arg1 )
		if f2_local3 ~= nil then
			f2_local0 = ToUpperCase( f2_local3 )
		end
		f2_local3 = DataSources.frontEnd.AAR.gameTypeName:GetValue( f1_arg1 )
		if f2_local3 ~= nil then
			f2_local1 = ToUpperCase( f2_local3 )
		end
		f2_local3 = DataSources.frontEnd.AAR.gameTime:GetValue( f1_arg1 )
		if f2_local3 ~= nil then
			f2_local2 = ToUpperCase( f2_local3 )
		end
		local f2_local4 = f1_arg0.MapName:GetCurrentFont()
		local f2_local5, f2_local6, f2_local7, f2_local8 = f1_arg0.MapName:getLocalRect()
		local f2_local9 = math.abs( f2_local6 - f2_local8 )
		local f2_local10 = {
			f2_local0,
			f2_local1,
			f2_local2
		}
		local f2_local11 = {
			f1_arg0.MapName,
			f1_arg0.GameType,
			f1_arg0.GameTime
		}
		for f2_local12 = 1, 3, 1 do
			local f2_local15 = f2_local10[f2_local12]
			local f2_local16 = f2_local11[f2_local12]
			local f2_local17, f2_local18, f2_local19, f2_local20 = GetTextDimensions( f2_local15, f2_local4, f2_local9 )
			local f2_local21 = f2_local19 - f2_local17
			f2_local16:setText( Engine.MarkLocalized( f2_local15 ) )
			f2_local16:SetLeftAnchor( 1 )
			f2_local16:SetRightAnchor( 0 )
			f2_local16:SetLeft( 0 )
			f2_local16:SetRight( f2_local21 )
		end
	end
	
	f1_local1 = nil
	f1_arg0.MapName:SubscribeToModel( DataSources.frontEnd.AAR.mapName:GetModel( f1_arg1 ), f1_local0 )
	f1_arg0.GameType:SubscribeToModel( DataSources.frontEnd.AAR.gameTypeName:GetModel( f1_arg1 ), f1_local0 )
	f1_arg0.GameTime:SubscribeToModel( DataSources.frontEnd.AAR.gameTime:GetModel( f1_arg1 ), f1_local0 )
end

function AARTeamScoreboardHeader( menu, controller )
	local self = LUI.UIHorizontalStackedLayout.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 761 * _1080p, 0, 80 * _1080p )
	self.id = "AARTeamScoreboardHeader"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	self:SetSpacing( 15 )
	local MapName = nil
	
	MapName = LUI.UIText.new()
	MapName.id = "MapName"
	MapName:setText( ToUpperCase( "MapName" ), 0 )
	MapName:SetFontSize( 38 * _1080p )
	MapName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MapName:SetAlignment( LUI.Alignment.Left )
	MapName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 84, _1080p * 160, _1080p * 21, _1080p * 59 )
	self:addElement( MapName )
	self.MapName = MapName
	
	local GameType = nil
	
	GameType = LUI.UIText.new()
	GameType.id = "GameType"
	GameType:SetAlpha( 0.5, 0 )
	GameType:setText( ToUpperCase( "GameType" ), 0 )
	GameType:SetFontSize( 38 * _1080p )
	GameType:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GameType:SetAlignment( LUI.Alignment.Center )
	GameType:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 579, _1080p * 80, _1080p * 118 )
	self:addElement( GameType )
	self.GameType = GameType
	
	local GameTime = nil
	
	GameTime = LUI.UIText.new()
	GameTime.id = "GameTime"
	GameTime:setText( ToUpperCase( "GameTime" ), 0 )
	GameTime:SetFontSize( 38 * _1080p )
	GameTime:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GameTime:SetAlignment( LUI.Alignment.Left )
	GameTime:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 685, _1080p * 79, _1080p * 21, _1080p * 59 )
	self:addElement( GameTime )
	self.GameTime = GameTime
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "AARTeamScoreboardHeader", AARTeamScoreboardHeader )
LockTable( _M )
