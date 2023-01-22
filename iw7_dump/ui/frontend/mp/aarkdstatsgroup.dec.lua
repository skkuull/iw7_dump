local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.AAR.performance"
f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.PersonalBestKills )
	assert( f1_arg0.PersonalBestKDRatio )
	assert( f1_arg0.PersonalBestKillsLabel )
	assert( f1_arg0.PersonalBestKDLabel )
	f1_arg0:SetDataSource( DataSources.frontEnd.AAR.performance, f1_arg1 )
	local f1_local0 = DataSources.frontEnd.AAR.performance.isPersonalBestKills:GetValue( f1_arg1 )
	local f1_local1 = 0
	if f1_local0 then
		f1_local1 = 1
	end
	f1_arg0.PersonalBestKills:SetAlpha( f1_local1 )
	f1_arg0.PersonalBestKillsLabel:SetAlpha( f1_local1 )
	f1_local0 = DataSources.frontEnd.AAR.performance.isPersonalBestKD:GetValue( f1_arg1 )
	f1_local1 = 0
	if f1_local0 then
		f1_local1 = 1
	end
	f1_arg0.PersonalBestKDRatio:SetAlpha( f1_local1 )
	f1_arg0.PersonalBestKDLabel:SetAlpha( f1_local1 )
end

function AARKDStatsGroup( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 297 * _1080p, 0, 657 * _1080p )
	self.id = "AARKDStatsGroup"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Deaths = nil
	
	Deaths = MenuBuilder.BuildRegisteredType( "AARKDStat", {
		controllerIndex = f2_local1
	} )
	Deaths.id = "Deaths"
	Deaths.Icon:setImage( RegisterMaterial( "aar_deaths_icon" ), 0 )
	Deaths.Header:setText( ToUpperCase( Engine.Localize( "MENU_DEATHS" ) ), 0 )
	Deaths:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 0.5, _1080p * 297.5, _1080p * 224, _1080p * 435 )
	Deaths:SubscribeToModelThroughElement( self, "deaths", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.deaths:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			Deaths.Count:setText( f3_local0, 0 )
		end
	end )
	self:addElement( Deaths )
	self.Deaths = Deaths
	
	local KDRatio = nil
	
	KDRatio = MenuBuilder.BuildRegisteredType( "AARKDStat", {
		controllerIndex = f2_local1
	} )
	KDRatio.id = "KDRatio"
	KDRatio.Icon:setImage( RegisterMaterial( "aar_kdr_icon" ), 0 )
	KDRatio.Header:setText( ToUpperCase( Engine.Localize( "LUA_MENU_KD_RATIO" ) ), 0 )
	KDRatio:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 0.5, _1080p * 297.5, _1080p * 446, _1080p * 657 )
	KDRatio:SubscribeToModelThroughElement( self, "kdRatioString", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.kdRatioString:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			KDRatio.Count:setText( f4_local0, 0 )
		end
	end )
	self:addElement( KDRatio )
	self.KDRatio = KDRatio
	
	local Kills = nil
	
	Kills = MenuBuilder.BuildRegisteredType( "AARKDStat", {
		controllerIndex = f2_local1
	} )
	Kills.id = "Kills"
	Kills.Icon:setImage( RegisterMaterial( "aar_kills_icon" ), 0 )
	Kills.Header:setText( ToUpperCase( ToUpperCase( Engine.Localize( "MENU_KILLS" ) ) ), 0 )
	Kills:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 0.5, _1080p * 297.5, 0, _1080p * 211 )
	Kills:SubscribeToModelThroughElement( self, "kills", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.kills:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			Kills.Count:setText( f5_local0, 0 )
		end
	end )
	self:addElement( Kills )
	self.Kills = Kills
	
	local PersonalBestKillsLabel = nil
	
	PersonalBestKillsLabel = LUI.UIText.new()
	PersonalBestKillsLabel.id = "PersonalBestKillsLabel"
	PersonalBestKillsLabel:setText( Engine.Localize( "MENU_PB" ), 0 )
	PersonalBestKillsLabel:SetFontSize( 18 * _1080p )
	PersonalBestKillsLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PersonalBestKillsLabel:SetAlignment( LUI.Alignment.Center )
	PersonalBestKillsLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 274, _1080p * 304, _1080p * 2.5, _1080p * 20.5 )
	self:addElement( PersonalBestKillsLabel )
	self.PersonalBestKillsLabel = PersonalBestKillsLabel
	
	local PersonalBestKDLabel = nil
	
	PersonalBestKDLabel = LUI.UIText.new()
	PersonalBestKDLabel.id = "PersonalBestKDLabel"
	PersonalBestKDLabel:setText( Engine.Localize( "MENU_PB" ), 0 )
	PersonalBestKDLabel:SetFontSize( 18 * _1080p )
	PersonalBestKDLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PersonalBestKDLabel:SetAlignment( LUI.Alignment.Center )
	PersonalBestKDLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 272.5, _1080p * 302.5, _1080p * 449, _1080p * 467 )
	self:addElement( PersonalBestKDLabel )
	self.PersonalBestKDLabel = PersonalBestKDLabel
	
	local PersonalBestKills = nil
	
	PersonalBestKills = LUI.UIImage.new()
	PersonalBestKills.id = "PersonalBestKills"
	PersonalBestKills:setImage( RegisterMaterial( "aar_pb_graphic" ), 0 )
	PersonalBestKills:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.5, _1080p * 305.5, _1080p * -10, _1080p * 38 )
	self:addElement( PersonalBestKills )
	self.PersonalBestKills = PersonalBestKills
	
	local PersonalBestKDRatio = nil
	
	PersonalBestKDRatio = LUI.UIImage.new()
	PersonalBestKDRatio.id = "PersonalBestKDRatio"
	PersonalBestKDRatio:setImage( RegisterMaterial( "aar_pb_graphic" ), 0 )
	PersonalBestKDRatio:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.5, _1080p * 305.5, _1080p * 436, _1080p * 484 )
	self:addElement( PersonalBestKDRatio )
	self.PersonalBestKDRatio = PersonalBestKDRatio
	
	f0_local1( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "AARKDStatsGroup", AARKDStatsGroup )
LockTable( _M )
