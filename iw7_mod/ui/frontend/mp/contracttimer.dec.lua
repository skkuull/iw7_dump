local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.TimeRemaining )
	f1_arg0.TimeRemaining:setEndTime( Rewards.GetContractEndTime() )
	f1_arg0.TimeRemaining:useLocalizedFormat()
	if Engine.IsAliensMode() then
		f1_arg0.TimeRemaining:setLocalizedFormatString( "LUA_MENU_ZM_BOUNTY_TIMER" )
	else
		f1_arg0.TimeRemaining:setLocalizedFormatString( "LUA_MENU_MP_CONTRACT_TIMER" )
	end
	f1_arg0:addEventHandler( "update_contracts", function ( f2_arg0, f2_arg1 )
		f1_arg0.TimeRemaining:setEndTime( Rewards.GetContractEndTime() )
	end )
end

function ContractTimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 480 * _1080p, 0, 40 * _1080p )
	self.id = "ContractTimer"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local TimeRemaining = nil
	
	TimeRemaining = MenuBuilder.BuildRegisteredType( "UILongCountdown", {
		controllerIndex = f3_local1
	} )
	TimeRemaining.id = "TimeRemaining"
	TimeRemaining:SetFontSize( 32 * _1080p )
	TimeRemaining:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TimeRemaining:SetAlignment( LUI.Alignment.Left )
	TimeRemaining:setEndTime( 0 )
	TimeRemaining:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 41.15, _1080p * 691, _1080p * 4, _1080p * 36 )
	self:addElement( TimeRemaining )
	self.TimeRemaining = TimeRemaining
	
	local Clock = nil
	
	Clock = LUI.UIImage.new()
	Clock.id = "Clock"
	Clock:setImage( RegisterMaterial( "icon_clock_ring" ), 0 )
	Clock:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 32, _1080p * 4, _1080p * -4 )
	self:addElement( Clock )
	self.Clock = Clock
	
	local ClockHandHour = nil
	
	ClockHandHour = LUI.UIImage.new()
	ClockHandHour.id = "ClockHandHour"
	ClockHandHour:SetZRotation( -78, 0 )
	ClockHandHour:setImage( RegisterMaterial( "icon_clock_hand" ), 0 )
	ClockHandHour:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 4, _1080p * 28, _1080p * 8, _1080p * -8 )
	self:addElement( ClockHandHour )
	self.ClockHandHour = ClockHandHour
	
	local ClockHandMinute = nil
	
	ClockHandMinute = LUI.UIImage.new()
	ClockHandMinute.id = "ClockHandMinute"
	ClockHandMinute:SetZRotation( -3, 0 )
	ClockHandMinute:setImage( RegisterMaterial( "icon_clock_hand" ), 0 )
	ClockHandMinute:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 4, _1080p * 28, _1080p * 8, _1080p * -8 )
	self:addElement( ClockHandMinute )
	self.ClockHandMinute = ClockHandMinute
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ContractTimer", ContractTimer )
LockTable( _M )
