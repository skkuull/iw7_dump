local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	assert( f1_arg0.Fill )
	assert( f1_arg0.StatText )
	assert( f1_arg0.TopBox )
	f1_arg0.SetData = function ( f2_arg0, f2_arg1 )
		if not f2_arg1.valid then
			f2_arg0:SetAlpha( 0 )
			return 
		end
		f2_arg0:SetAlpha( 1 )
		assert( f2_arg1.barColor )
		f2_arg0.Fill:SetRGBFromInt( f2_arg1.barColor )
		assert( f2_arg1.valueText )
		f2_arg0.StatText:setText( f2_arg1.valueText )
		assert( f2_arg1.value )
		assert( f2_arg1.maxValue )
		local f2_local0 = f2_arg1.maxValue
		if f2_local0 == 0 then
			f2_local0 = 1
		end
		local f2_local1 = math.max( f2_arg1.value / f2_local0, 0.09 )
		f2_arg0.Fill:SetAnchors( 0, 1, 1 - f2_local1, 1, 0 )
		f2_arg0.TopBox:SetAnchors( 0, 1, 1 - f2_local1, f2_local1, 0 )
	end
	
end

function AARVerticalStatsBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 14 * _1080p, 0, 150 * _1080p )
	self.id = "AARVerticalStatsBar"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetRGBFromTable( SWATCHES.AAR.InfoHighlight, 0 )
	Fill:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 14, 0, _1080p * 150 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local StatText = nil
	
	StatText = LUI.UIText.new()
	StatText.id = "StatText"
	StatText:setText( Engine.Localize( "MENU_NEW" ), 0 )
	StatText:SetFontSize( 18 * _1080p )
	StatText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	StatText:SetAlignment( LUI.Alignment.Center )
	StatText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -32.5, _1080p * 47.5, _1080p * 153, _1080p * 171 )
	self:addElement( StatText )
	self.StatText = StatText
	
	local TopBox = nil
	
	TopBox = LUI.UIImage.new()
	TopBox.id = "TopBox"
	TopBox:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 14, 0, _1080p * 14 )
	self:addElement( TopBox )
	self.TopBox = TopBox
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "AARVerticalStatsBar", AARVerticalStatsBar )
LockTable( _M )
