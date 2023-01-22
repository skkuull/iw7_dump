local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ButtonHelperOSIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 290 * _1080p, 0, 40 * _1080p )
	self.id = "ButtonHelperOSIcon"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local OSIcon1 = nil
	
	OSIcon1 = LUI.UIImage.new()
	OSIcon1.id = "OSIcon1"
	OSIcon1:setImage( RegisterMaterial( "icon_ios_1" ), 0 )
	OSIcon1:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 10, _1080p * 40, _1080p * -15, _1080p * 15 )
	self:addElement( OSIcon1 )
	self.OSIcon1 = OSIcon1
	
	local OSIcon2 = nil
	
	OSIcon2 = LUI.UIImage.new()
	OSIcon2.id = "OSIcon2"
	OSIcon2:setImage( RegisterMaterial( "icon_ios_2" ), 0 )
	OSIcon2:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 60, _1080p * 90, _1080p * -15, _1080p * 15 )
	self:addElement( OSIcon2 )
	self.OSIcon2 = OSIcon2
	
	local OSIcon3 = nil
	
	OSIcon3 = LUI.UIImage.new()
	OSIcon3.id = "OSIcon3"
	OSIcon3:setImage( RegisterMaterial( "icon_ios_3" ), 0 )
	OSIcon3:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 110, _1080p * 140, _1080p * -15, _1080p * 15 )
	self:addElement( OSIcon3 )
	self.OSIcon3 = OSIcon3
	
	local LineDivider1 = nil
	
	LineDivider1 = LUI.UIImage.new()
	LineDivider1.id = "LineDivider1"
	LineDivider1:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 50, _1080p * 51, 0, 0 )
	self:addElement( LineDivider1 )
	self.LineDivider1 = LineDivider1
	
	local LineDivider2 = nil
	
	LineDivider2 = LUI.UIImage.new()
	LineDivider2.id = "LineDivider2"
	LineDivider2:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 100, _1080p * 101, 0, 0 )
	self:addElement( LineDivider2 )
	self.LineDivider2 = LineDivider2
	
	local LineDivider3 = nil
	
	LineDivider3 = LUI.UIImage.new()
	LineDivider3.id = "LineDivider3"
	LineDivider3:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 150, _1080p * 151, 0, 0 )
	self:addElement( LineDivider3 )
	self.LineDivider3 = LineDivider3
	
	local TimerText = nil
	
	TimerText = LUI.UIText.new()
	TimerText.id = "TimerText"
	TimerText:setText( "00:00:00", 0 )
	TimerText:SetFontSize( 34 * _1080p )
	TimerText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TimerText:SetAlignment( LUI.Alignment.Center )
	TimerText:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -130, 0, _1080p * -17, _1080p * 17 )
	self:addElement( TimerText )
	self.TimerText = TimerText
	
	return self
end

MenuBuilder.registerType( "ButtonHelperOSIcon", ButtonHelperOSIcon )
LockTable( _M )
