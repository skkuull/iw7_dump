local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	assert( f1_arg0.AARBars )
	assert( f1_arg0.Global )
	assert( f1_arg0.PeronalBest )
	local f1_local0 = {
		average = f1_arg2.average:GetValue( f1_arg3 ),
		maxValue = f1_arg2.maxValue:GetValue( f1_arg3 )
	}
	local f1_local1 = {}
	local f1_local2 = f1_arg1:GetCountValue( f1_arg3 )
	for f1_local3 = 1, f1_local2, 1 do
		local f1_local6 = f1_arg1:GetDataSourceAtIndex( f1_local3 - 1, f1_arg3 )
		table.insert( f1_local1, {
			valid = f1_local6.valid:GetValue( f1_arg3 ),
			maxValue = f1_local6.maxValue:GetValue( f1_arg3 ),
			value = f1_local6.value:GetValue( f1_arg3 ),
			valueText = f1_local6.valueText:GetValue( f1_arg3 ),
			barColor = f1_local6.barColor:GetValue( f1_arg3 )
		} )
	end
	f1_arg0.AARBars:SetGraphData( f1_local1, f1_local0, f1_arg4 )
	f1_arg0.Global:SubscribeToModelThroughElement( f1_arg0, "globalStat", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.globalStat:GetValue( f1_arg3 )
		if f2_local0 ~= nil then
			local f2_local1 = ""
			if f1_arg4 then
				f2_local1 = string.format( "%.2f", f2_local0 )
			else
				f2_local1 = string.format( "%d", f2_local0 )
			end
			f1_arg0.Global.StatText:setText( f2_local1, 0 )
		end
	end )
	f1_arg0.PeronalBest:SubscribeToModelThroughElement( f1_arg0, "personalBestStat", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		f3_local0 = f3_local0.personalBestStat:GetValue( f1_arg3 )
		if f3_local0 ~= nil then
			local f3_local1 = ""
			if f1_arg4 then
				f3_local1 = string.format( "%.2f", f3_local0 )
			else
				f3_local1 = string.format( "%d", f3_local0 )
			end
			f1_arg0.PeronalBest.StatText:setText( f3_local1, 0 )
		end
	end )
end

f0_local1 = function ( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg0.SetGraphDataSource = f0_local0
end

function AARBarGraph( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 455 * _1080p, 0, 283 * _1080p )
	self.id = "AARBarGraph"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local BlurBacker = nil
	
	BlurBacker = LUI.UIBlur.new()
	BlurBacker.id = "BlurBacker"
	BlurBacker:SetRGBFromInt( 0, 0 )
	BlurBacker:SetAlpha( 0.36, 0 )
	BlurBacker:SetBlurStrength( 2.75, 0 )
	self:addElement( BlurBacker )
	self.BlurBacker = BlurBacker
	
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
	black:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 26 )
	self:addElement( black )
	self.black = black
	
	local AARGraphicBacker = nil
	
	AARGraphicBacker = MenuBuilder.BuildRegisteredType( "AARGraphicBacker", {
		controllerIndex = f5_local1
	} )
	AARGraphicBacker.id = "AARGraphicBacker"
	AARGraphicBacker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 62.5, _1080p * 443.5, _1080p * 52.24, _1080p * 220.24 )
	self:addElement( AARGraphicBacker )
	self.AARGraphicBacker = AARGraphicBacker
	
	local SubHeader = nil
	
	SubHeader = LUI.UIText.new()
	SubHeader.id = "SubHeader"
	SubHeader:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	SubHeader:SetFontSize( 16 * _1080p )
	SubHeader:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SubHeader:SetAlignment( LUI.Alignment.Center )
	SubHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 123, _1080p * 375, _1080p * 36.24, _1080p * 52.24 )
	self:addElement( SubHeader )
	self.SubHeader = SubHeader
	
	local Global = nil
	
	Global = MenuBuilder.BuildRegisteredType( "AARBarGraphStatDisplay", {
		controllerIndex = f5_local1
	} )
	Global.id = "Global"
	Global.StatText:setText( "1.54", 0 )
	Global.StatText:SetAlignment( LUI.Alignment.Left )
	Global.StatTitle:setText( "Personal Best K/D:", 0 )
	Global.StatTitle:SetAlignment( LUI.Alignment.Right )
	Global.StatDate:setText( "", 0 )
	Global.StatDate:SetAlignment( LUI.Alignment.Right )
	Global:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 230, _1080p * 439.5, _1080p * 243.75, _1080p * 279.75 )
	self:addElement( Global )
	self.Global = Global
	
	local PeronalBest = nil
	
	PeronalBest = MenuBuilder.BuildRegisteredType( "AARBarGraphStatDisplay", {
		controllerIndex = f5_local1
	} )
	PeronalBest.id = "PeronalBest"
	PeronalBest.StatText:setText( "1.54", 0 )
	PeronalBest.StatText:SetAlignment( LUI.Alignment.Left )
	PeronalBest.StatTitle:setText( "Personal Best K/D:", 0 )
	PeronalBest.StatTitle:SetAlignment( LUI.Alignment.Left )
	PeronalBest.StatDate:SetAlignment( LUI.Alignment.Left )
	PeronalBest:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 214, _1080p * 243.75, _1080p * 279.75 )
	PeronalBest:SubscribeToModelThroughElement( self, "personalBestTime", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.personalBestTime:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			PeronalBest.StatDate:setText( f6_local0, 0 )
		end
	end )
	self:addElement( PeronalBest )
	self.PeronalBest = PeronalBest
	
	local AARBars = nil
	
	AARBars = MenuBuilder.BuildRegisteredType( "AARBars", {
		controllerIndex = f5_local1
	} )
	AARBars.id = "AARBars"
	AARBars:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 67, _1080p * 426.5, _1080p * 63.24, _1080p * 212 )
	self:addElement( AARBars )
	self.AARBars = AARBars
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_SCORESTREAKS" ) ), 0 )
	Title:SetFontSize( 20 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetOptOutRightToLeftAlignmentFlip( true )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 12, _1080p * -12, _1080p * 3, _1080p * 23 )
	self:addElement( Title )
	self.Title = Title
	
	local Line = nil
	
	Line = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f5_local1
	} )
	Line.id = "Line"
	Line:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 26, _1080p * 27.5 )
	self:addElement( Line )
	self.Line = Line
	
	local LineCopy0 = nil
	
	LineCopy0 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f5_local1
	} )
	LineCopy0.id = "LineCopy0"
	LineCopy0:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -45, _1080p * -43.5 )
	self:addElement( LineCopy0 )
	self.LineCopy0 = LineCopy0
	
	f0_local1( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "AARBarGraph", AARBarGraph )
LockTable( _M )
