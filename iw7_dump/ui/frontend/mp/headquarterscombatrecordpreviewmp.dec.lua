local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.KDRatioAmountLabel )
	assert( f1_arg0.WLRatioAmountLabel )
	f1_arg0.KDRatioAmountLabel:SubscribeToModel( DataSources.alwaysLoaded.playerData.MP.ranked.kdRatio:GetModel( f1_arg1 ), function ()
		local f2_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.kdRatio:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			f1_arg0.KDRatioAmountLabel:setText( string.format( "%.03f", f2_local0 / 1000 ), 0 )
		end
	end )
	f1_arg0.WLRatioAmountLabel:SubscribeToModel( DataSources.alwaysLoaded.playerData.MP.ranked.winLossRatio:GetModel( f1_arg1 ), function ()
		local f3_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.winLossRatio:GetValue( f1_arg1 )
		if f3_local0 ~= nil then
			f1_arg0.WLRatioAmountLabel:setText( string.format( "%.03f", f3_local0 / 1000 ), 0 )
		end
	end )
end

function HeadquartersCombatRecordPreviewMP( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 226 * _1080p )
	self.id = "HeadquartersCombatRecordPreviewMP"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local KillsAmountLabel = nil
	
	KillsAmountLabel = LUI.UIStyledText.new()
	KillsAmountLabel.id = "KillsAmountLabel"
	KillsAmountLabel:SetFontSize( 38 * _1080p )
	KillsAmountLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KillsAmountLabel:SetAlignment( LUI.Alignment.Left )
	KillsAmountLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 50, _1080p * 225, _1080p * 56.81, _1080p * 94.81 )
	KillsAmountLabel:SubscribeToModel( DataSources.alwaysLoaded.playerData.MP.ranked.kills:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.kills:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			KillsAmountLabel:setText( f5_local0, 0 )
		end
	end )
	self:addElement( KillsAmountLabel )
	self.KillsAmountLabel = KillsAmountLabel
	
	local KillsLabel = nil
	
	KillsLabel = LUI.UIStyledText.new()
	KillsLabel.id = "KillsLabel"
	KillsLabel:SetRGBFromTable( SWATCHES.CAC.subPopupText, 0 )
	KillsLabel:setText( ToUpperCase( Engine.Localize( "MENU_KILLS" ) ), 0 )
	KillsLabel:SetFontSize( 30 * _1080p )
	KillsLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KillsLabel:SetAlignment( LUI.Alignment.Left )
	KillsLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 50, _1080p * 225, _1080p * 26.81, _1080p * 56.81 )
	self:addElement( KillsLabel )
	self.KillsLabel = KillsLabel
	
	local WinsAmountLabel = nil
	
	WinsAmountLabel = LUI.UIStyledText.new()
	WinsAmountLabel.id = "WinsAmountLabel"
	WinsAmountLabel:SetFontSize( 38 * _1080p )
	WinsAmountLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WinsAmountLabel:SetAlignment( LUI.Alignment.Left )
	WinsAmountLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 50, _1080p * 225, _1080p * 162, _1080p * 200 )
	WinsAmountLabel:SubscribeToModel( DataSources.alwaysLoaded.playerData.MP.ranked.wins:GetModel( f4_local1 ), function ()
		local f6_local0 = DataSources.alwaysLoaded.playerData.MP.ranked.wins:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			WinsAmountLabel:setText( f6_local0, 0 )
		end
	end )
	self:addElement( WinsAmountLabel )
	self.WinsAmountLabel = WinsAmountLabel
	
	local WinsLabel = nil
	
	WinsLabel = LUI.UIStyledText.new()
	WinsLabel.id = "WinsLabel"
	WinsLabel:SetRGBFromTable( SWATCHES.CAC.subPopupText, 0 )
	WinsLabel:setText( ToUpperCase( Engine.Localize( "MENU_WINS" ) ), 0 )
	WinsLabel:SetFontSize( 30 * _1080p )
	WinsLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WinsLabel:SetAlignment( LUI.Alignment.Left )
	WinsLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 50, _1080p * 225, _1080p * 132, _1080p * 162 )
	self:addElement( WinsLabel )
	self.WinsLabel = WinsLabel
	
	local KDRatioAmountLabel = nil
	
	KDRatioAmountLabel = LUI.UIText.new()
	KDRatioAmountLabel.id = "KDRatioAmountLabel"
	KDRatioAmountLabel:setText( Engine.Localize( "LUA_MENU_KD_RATIO" ), 0 )
	KDRatioAmountLabel:SetFontSize( 38 * _1080p )
	KDRatioAmountLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KDRatioAmountLabel:SetAlignment( LUI.Alignment.Left )
	KDRatioAmountLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 250, _1080p * 481.8, _1080p * 56.81, _1080p * 94.81 )
	self:addElement( KDRatioAmountLabel )
	self.KDRatioAmountLabel = KDRatioAmountLabel
	
	local KDRatioLabel = nil
	
	KDRatioLabel = LUI.UIText.new()
	KDRatioLabel.id = "KDRatioLabel"
	KDRatioLabel:SetRGBFromTable( SWATCHES.CAC.subPopupText, 0 )
	KDRatioLabel:setText( Engine.Localize( "LUA_MENU_KD_RATIO" ), 0 )
	KDRatioLabel:SetFontSize( 30 * _1080p )
	KDRatioLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KDRatioLabel:SetAlignment( LUI.Alignment.Left )
	KDRatioLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 250, _1080p * 481.8, _1080p * 26.81, _1080p * 56.81 )
	self:addElement( KDRatioLabel )
	self.KDRatioLabel = KDRatioLabel
	
	local WLRatioAmountLabel = nil
	
	WLRatioAmountLabel = LUI.UIText.new()
	WLRatioAmountLabel.id = "WLRatioAmountLabel"
	WLRatioAmountLabel:setText( Engine.Localize( "LUA_MENU_WL_RATIO" ), 0 )
	WLRatioAmountLabel:SetFontSize( 38 * _1080p )
	WLRatioAmountLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WLRatioAmountLabel:SetAlignment( LUI.Alignment.Left )
	WLRatioAmountLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 250, _1080p * 481.8, _1080p * 162, _1080p * 200 )
	self:addElement( WLRatioAmountLabel )
	self.WLRatioAmountLabel = WLRatioAmountLabel
	
	local WLRatioLabel = nil
	
	WLRatioLabel = LUI.UIText.new()
	WLRatioLabel.id = "WLRatioLabel"
	WLRatioLabel:SetRGBFromTable( SWATCHES.CAC.subPopupText, 0 )
	WLRatioLabel:setText( Engine.Localize( "LUA_MENU_WL_RATIO" ), 0 )
	WLRatioLabel:SetFontSize( 30 * _1080p )
	WLRatioLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WLRatioLabel:SetAlignment( LUI.Alignment.Left )
	WLRatioLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 250, _1080p * 481.8, _1080p * 132, _1080p * 162 )
	self:addElement( WLRatioLabel )
	self.WLRatioLabel = WLRatioLabel
	
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "HeadquartersCombatRecordPreviewMP", HeadquartersCombatRecordPreviewMP )
LockTable( _M )
