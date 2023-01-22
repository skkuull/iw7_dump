local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.ArrowStub )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "winLossPercent", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.winLossPercent:GetValue( f1_arg1 )
		f1_arg0.ArrowStub:SetRightAnchor( 1 - f2_local0, 250 )
		f1_arg0.ArrowStub:SetLeftAnchor( f2_local0, 250 )
	end )
end

function AARWinLossBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 826 * _1080p, 0, 81 * _1080p )
	self.id = "AARWinLossBar"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local bg = nil
	
	bg = LUI.UIImage.new()
	bg.id = "bg"
	bg:SetRGBFromInt( 0, 0 )
	bg:SetAlpha( 0.36, 0 )
	bg:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -2, _1080p * -2 )
	self:addElement( bg )
	self.bg = bg
	
	local black = nil
	
	black = LUI.UIImage.new()
	black.id = "black"
	black:SetRGBFromInt( 0, 0 )
	black:SetAlpha( 0.35, 0 )
	black:SetDotPitchEnabled( true )
	black:SetDotPitchX( 0, 0 )
	black:SetDotPitchY( 0, 0 )
	black:SetDotPitchContrast( 0, 0 )
	black:SetDotPitchMode( 0 )
	black:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 274, _1080p * -2, _1080p * 24 )
	self:addElement( black )
	self.black = black
	
	local Line = nil
	
	Line = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f3_local1
	} )
	Line.id = "Line"
	Line:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 24, _1080p * 25.5 )
	self:addElement( Line )
	self.Line = Line
	
	local LineCopy1 = nil
	
	LineCopy1 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f3_local1
	} )
	LineCopy1.id = "LineCopy1"
	LineCopy1:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -1, 0 )
	self:addElement( LineCopy1 )
	self.LineCopy1 = LineCopy1
	
	local blackCopy1 = nil
	
	blackCopy1 = LUI.UIImage.new()
	blackCopy1.id = "blackCopy1"
	blackCopy1:SetRGBFromInt( 0, 0 )
	blackCopy1:SetAlpha( 0.35, 0 )
	blackCopy1:SetDotPitchEnabled( true )
	blackCopy1:SetDotPitchX( 0, 0 )
	blackCopy1:SetDotPitchY( 0, 0 )
	blackCopy1:SetDotPitchContrast( 0, 0 )
	blackCopy1:SetDotPitchMode( 0 )
	blackCopy1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -274, 0, _1080p * -2, _1080p * 24 )
	self:addElement( blackCopy1 )
	self.blackCopy1 = blackCopy1
	
	local blackCopy0 = nil
	
	blackCopy0 = LUI.UIImage.new()
	blackCopy0.id = "blackCopy0"
	blackCopy0:SetRGBFromInt( 0, 0 )
	blackCopy0:SetAlpha( 0.35, 0 )
	blackCopy0:SetDotPitchEnabled( true )
	blackCopy0:SetDotPitchX( 0, 0 )
	blackCopy0:SetDotPitchY( 0, 0 )
	blackCopy0:SetDotPitchContrast( 0, 0 )
	blackCopy0:SetDotPitchMode( 0 )
	blackCopy0:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -137.5, _1080p * 137.5, _1080p * -2, _1080p * 24 )
	self:addElement( blackCopy0 )
	self.blackCopy0 = blackCopy0
	
	local ProgressBar = nil
	
	ProgressBar = MenuBuilder.BuildRegisteredType( "AARWinLossRatioBar", {
		controllerIndex = f3_local1
	} )
	ProgressBar.id = "ProgressBar"
	ProgressBar:SetDataSourceThroughElement( self, "winLossPercent" )
	ProgressBar.Wins:SetRGBFromInt( 15658644, 0 )
	ProgressBar:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 6, _1080p * -6, _1080p * -16, _1080p * -6.5 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local WinsHeader = nil
	
	WinsHeader = LUI.UIText.new()
	WinsHeader.id = "WinsHeader"
	WinsHeader:setText( Engine.Localize( "LUA_MENU_WINS_CAPS" ), 0 )
	WinsHeader:SetFontSize( 20 * _1080p )
	WinsHeader:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WinsHeader:SetAlignment( LUI.Alignment.Center )
	WinsHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 73.5, _1080p * 199.5, _1080p * 1, _1080p * 21 )
	self:addElement( WinsHeader )
	self.WinsHeader = WinsHeader
	
	local WinRatioHeader = nil
	
	WinRatioHeader = LUI.UIText.new()
	WinRatioHeader.id = "WinRatioHeader"
	WinRatioHeader:setText( Engine.Localize( "LUA_MENU_MP_AAR_OVERALL_WIN_RATIO" ), 0 )
	WinRatioHeader:SetFontSize( 20 * _1080p )
	WinRatioHeader:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WinRatioHeader:SetAlignment( LUI.Alignment.Center )
	WinRatioHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 292.3, _1080p * 531.7, _1080p * 1, _1080p * 21 )
	self:addElement( WinRatioHeader )
	self.WinRatioHeader = WinRatioHeader
	
	local LossesHeader = nil
	
	LossesHeader = LUI.UIText.new()
	LossesHeader.id = "LossesHeader"
	LossesHeader:setText( Engine.Localize( "LUA_MENU_LOSSES_CAPS" ), 0 )
	LossesHeader:SetFontSize( 20 * _1080p )
	LossesHeader:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LossesHeader:SetAlignment( LUI.Alignment.Center )
	LossesHeader:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -199.5, _1080p * -73.5, _1080p * 1, _1080p * 21 )
	self:addElement( LossesHeader )
	self.LossesHeader = LossesHeader
	
	local WinStat = nil
	
	WinStat = LUI.UIText.new()
	WinStat.id = "WinStat"
	WinStat:SetRGBFromInt( 15658644, 0 )
	WinStat:SetFontSize( 38 * _1080p )
	WinStat:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WinStat:SetAlignment( LUI.Alignment.Center )
	WinStat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 73.5, _1080p * 199.5, _1080p * 25, _1080p * 63 )
	WinStat:SubscribeToModelThroughElement( self, "totalWins", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.totalWins:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			WinStat:setText( f4_local0, 0 )
		end
	end )
	self:addElement( WinStat )
	self.WinStat = WinStat
	
	local WinRatioStat = nil
	
	WinRatioStat = LUI.UIText.new()
	WinRatioStat.id = "WinRatioStat"
	WinRatioStat:SetFontSize( 38 * _1080p )
	WinRatioStat:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WinRatioStat:SetAlignment( LUI.Alignment.Center )
	WinRatioStat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 322, _1080p * 502, _1080p * 25, _1080p * 63 )
	WinRatioStat:SubscribeToModelThroughElement( self, "winLossPercentString", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.winLossPercentString:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			WinRatioStat:setText( f5_local0, 0 )
		end
	end )
	self:addElement( WinRatioStat )
	self.WinRatioStat = WinRatioStat
	
	local LossStat = nil
	
	LossStat = LUI.UIText.new()
	LossStat.id = "LossStat"
	LossStat:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	LossStat:SetFontSize( 38 * _1080p )
	LossStat:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LossStat:SetAlignment( LUI.Alignment.Center )
	LossStat:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -199.5, _1080p * -73.5, _1080p * 25, _1080p * 63 )
	LossStat:SubscribeToModelThroughElement( self, "totalLosses", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.totalLosses:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			LossStat:setText( f6_local0, 0 )
		end
	end )
	self:addElement( LossStat )
	self.LossStat = LossStat
	
	local ArrowStub = nil
	
	ArrowStub = LUI.UIImage.new()
	ArrowStub.id = "ArrowStub"
	ArrowStub:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	ArrowStub:SetUseAA( true )
	ArrowStub:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -10, _1080p * 0.27, _1080p * 57, _1080p * 68 )
	self:addElement( ArrowStub )
	self.ArrowStub = ArrowStub
	
	ProgressBar:SetDataSourceThroughElement( self, "winLossPercent" )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "AARWinLossBar", AARWinLossBar )
LockTable( _M )
