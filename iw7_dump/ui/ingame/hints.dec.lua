local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 1.2
function invalidCmdHintDef()
	local self = LUI.UIElement.new()
	self.id = "invalidCmdHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGInvalidCmdHint, f0_local0, CoD.TextStyle.Shadowed )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 162,
		left = -32,
		right = 32,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		alpha = 0.6
	} )
	self:animateToState( "default", 0 )
	return self
end

function spectatorControlsDef()
	local self = LUI.UIElement.new()
	self.id = "spectatorControlsId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGSpectatorControls, f0_local0, CoD.TextStyle.Shadowed )
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = -5,
		left = 10,
		height = 5,
		width = 512,
		alignment = CoD.OwnerdrawAlignment.TextTopLeft,
		font = CoD.TextSettings.HudEuroConRegTinyFont.Font,
		alpha = 0.6
	} )
	self:animateToState( "default", 0 )
	return self
end

function breathHintDef()
	local self = LUI.UIElement.new()
	self.id = "breathHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGHoldBreathHint, f0_local0, CoD.TextStyle.Shadowed )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 40,
		left = -32,
		right = 32,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		alpha = 0.6
	} )
	self:animateToState( "default", 0 )
	return self
end

function zoomHintDef()
	local self = LUI.UIElement.new()
	self.id = "zoomHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGChangeZoomHint, f0_local0, CoD.TextStyle.Shadowed )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 70,
		left = -32,
		right = 32,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		alpha = 0.6
	} )
	self:animateToState( "default", 0 )
	return self
end

function toggleHybridHintDef()
	local self = LUI.UIElement.new()
	self.id = "toggleHybridHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGToggleHybridHint, f0_local0, CoD.TextStyle.Shadowed )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 40,
		left = -32,
		right = 32,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		alpha = 0.6
	} )
	self:animateToState( "default", 0 )
	return self
end

function toggleThermalHintDef()
	local self = LUI.UIElement.new()
	self.id = "toggleThermalHintId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGToggleThermalHint, f0_local0, CoD.TextStyle.Shadowed )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 40,
		left = -32,
		right = 32,
		height = 64,
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		alpha = 0.6
	} )
	self:animateToState( "default", 0 )
	return self
end

MenuBuilder.registerType( "Hints", function ()
	local self = LUI.UIElement.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true
	} )
	self.id = "Hints"
	self:addElement( invalidCmdHintDef() )
	self:addElement( breathHintDef() )
	self:addElement( zoomHintDef() )
	self:addElement( toggleHybridHintDef() )
	self:addElement( toggleThermalHintDef() )
	return self
end )
LockTable( _M )
