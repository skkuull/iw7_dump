local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local self = LUI.UILongCountdown.new( nil, {
		endTime = ARMORY.GetEventCrateEndTime()
	} )
	self.id = "eventTimer"
	self:SetFontSize( 20 * _1080p )
	self:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:SetAlignment( LUI.Alignment.Left )
	self:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:setLocalizedFormatString( "LUA_MENU_MP_ARMORY_EVENT_END" )
	self:useLocalizedFormat()
	f1_arg0.timer = self
	f1_arg0:addElement( self )
end

function EventCrateTimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 22 * _1080p )
	self.id = "EventCrateTimer"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "EventCrateTimer", EventCrateTimer )
LockTable( _M )
