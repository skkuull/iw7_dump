local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.Text:setText( f1_arg1, 0 )
	local f1_local0, f1_local1, f1_local2, f1_local3 = f1_arg0.Text:getLocalRect()
	local f1_local4, f1_local5, f1_local6, f1_local7 = GetTextDimensions( f1_arg1, f1_arg0.Text:GetCurrentFont(), math.abs( f1_local3 - f1_local1 ) )
	local f1_local8 = (f1_local6 - f1_local4) / 2
	local f1_local9 = -1 * f1_local8
	f1_arg0.Text:SetLeft( f1_local9 )
	f1_arg0.Text:SetRight( f1_local8 )
	local f1_local10 = 10 * _1080p
	local f1_local11, f1_local12, f1_local13, f1_local14 = f1_arg0.ArrowLeft:getLocalRect()
	f1_arg0.ArrowLeft:SetLeft( f1_local9 - f1_local10 - math.abs( f1_local13 - f1_local11 ) )
	f1_arg0.ArrowLeft:SetRight( f1_local9 - f1_local10 )
	local f1_local15, f1_local16, f1_local17, f1_local18 = f1_arg0.ArrowRight:getLocalRect()
	local f1_local19 = math.abs( f1_local17 - f1_local15 )
	f1_arg0.ArrowRight:SetLeft( f1_local8 + f1_local10 )
	f1_arg0.ArrowRight:SetRight( f1_local8 + f1_local10 + f1_local19 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.UpdateLabel = f0_local0
end

function ArrowsWithLabel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 50 * _1080p )
	self.id = "ArrowsWithLabel"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ArrowLeft = nil
	
	ArrowLeft = MenuBuilder.BuildRegisteredType( "ArrowLeft", {
		controllerIndex = f3_local1
	} )
	ArrowLeft.id = "ArrowLeft"
	ArrowLeft:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -100.5, _1080p * -78, 0, _1080p * 45 )
	self:addElement( ArrowLeft )
	self.ArrowLeft = ArrowLeft
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Text:SetFontSize( 30 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Center )
	Text:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, _1080p * 7.5, _1080p * 37.5 )
	self:addElement( Text )
	self.Text = Text
	
	local ArrowRight = nil
	
	ArrowRight = MenuBuilder.BuildRegisteredType( "ArrowRight", {
		controllerIndex = f3_local1
	} )
	ArrowRight.id = "ArrowRight"
	ArrowRight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 78, _1080p * 100.5, 0, _1080p * 45 )
	self:addElement( ArrowRight )
	self.ArrowRight = ArrowRight
	
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ArrowsWithLabel", ArrowsWithLabel )
LockTable( _M )
