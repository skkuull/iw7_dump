local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HackControlScreenElements( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HackControlScreenElements"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BottomMeter = nil
	
	BottomMeter = LUI.UIImage.new()
	BottomMeter.id = "BottomMeter"
	BottomMeter:setImage( RegisterMaterial( "hud_robot_hack_bottom_meter" ), 0 )
	BottomMeter:SetBlendMode( BLEND_MODE.addWithAlpha )
	BottomMeter:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -710, _1080p * 710, _1080p * -38, _1080p * 38 )
	self:addElement( BottomMeter )
	self.BottomMeter = BottomMeter
	
	local TopMeter = nil
	
	TopMeter = LUI.UIImage.new()
	TopMeter.id = "TopMeter"
	TopMeter:setImage( RegisterMaterial( "hud_robot_hack_top_meter" ), 0 )
	TopMeter:SetBlendMode( BLEND_MODE.addWithAlpha )
	TopMeter:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -512, _1080p * 512, _1080p * -53, _1080p * 43 )
	self:addElement( TopMeter )
	self.TopMeter = TopMeter
	
	local SideBracketRight = nil
	
	SideBracketRight = LUI.UIImage.new()
	SideBracketRight.id = "SideBracketRight"
	SideBracketRight:setImage( RegisterMaterial( "hud_robot_hack_side_bracket" ), 0 )
	SideBracketRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	SideBracketRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -232, _1080p * -60, _1080p * -400, _1080p * 400 )
	self:addElement( SideBracketRight )
	self.SideBracketRight = SideBracketRight
	
	local SideBracketLeft = nil
	
	SideBracketLeft = LUI.UIImage.new()
	SideBracketLeft.id = "SideBracketLeft"
	SideBracketLeft:SetZRotation( 180, 0 )
	SideBracketLeft:setImage( RegisterMaterial( "hud_robot_hack_side_bracket" ), 0 )
	SideBracketLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	SideBracketLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 60, _1080p * 232, _1080p * -400, _1080p * 400 )
	self:addElement( SideBracketLeft )
	self.SideBracketLeft = SideBracketLeft
	
	local CrosshairRight = nil
	
	CrosshairRight = LUI.UIImage.new()
	CrosshairRight.id = "CrosshairRight"
	CrosshairRight:SetAlpha( 0.8, 0 )
	CrosshairRight:setImage( RegisterMaterial( "hud_robot_hack_crosshair_line" ), 0 )
	CrosshairRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	CrosshairRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -960, _1080p * -172, _1080p * -4, _1080p * 4 )
	self:addElement( CrosshairRight )
	self.CrosshairRight = CrosshairRight
	
	local CrosshairLeft = nil
	
	CrosshairLeft = LUI.UIImage.new()
	CrosshairLeft.id = "CrosshairLeft"
	CrosshairLeft:SetAlpha( 0.8, 0 )
	CrosshairLeft:SetZRotation( 180, 0 )
	CrosshairLeft:setImage( RegisterMaterial( "hud_robot_hack_crosshair_line" ), 0 )
	CrosshairLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	CrosshairLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 172, _1080p * 960, _1080p * -4, _1080p * 4 )
	self:addElement( CrosshairLeft )
	self.CrosshairLeft = CrosshairLeft
	
	local CrosshairTop = nil
	
	CrosshairTop = LUI.UIImage.new()
	CrosshairTop.id = "CrosshairTop"
	CrosshairTop:SetAlpha( 0.8, 0 )
	CrosshairTop:setImage( RegisterMaterial( "hud_robot_hack_crosshair_line_vert" ), 0 )
	CrosshairTop:SetBlendMode( BLEND_MODE.addWithAlpha )
	CrosshairTop:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -4, _1080p * 4, _1080p * 92, _1080p * 540 )
	self:addElement( CrosshairTop )
	self.CrosshairTop = CrosshairTop
	
	local CompassElement = nil
	
	CompassElement = MenuBuilder.BuildRegisteredType( "Compass", {
		stretch = 0.85,
		controllerIndex = f1_local1
	} )
	CompassElement.id = "CompassElement"
	CompassElement:SetRGBFromInt( 12356096, 0 )
	CompassElement:setImage( RegisterMaterial( "compass_tickertape_space" ), 0 )
	CompassElement:SetBlendMode( BLEND_MODE.addWithAlpha )
	CompassElement:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 25, _1080p * 41 )
	self:addElement( CompassElement )
	self.CompassElement = CompassElement
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BottomMeter:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.BottomMeter:SetAlpha( 0, 0 )
				end
			}
		} )
		TopMeter:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.TopMeter:SetAlpha( 0, 0 )
				end
			}
		} )
		SideBracketRight:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.SideBracketRight:SetAlpha( 0, 0 )
				end
			}
		} )
		SideBracketLeft:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.SideBracketLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		CrosshairRight:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.CrosshairRight:SetAlpha( 0, 0 )
				end
			}
		} )
		CrosshairLeft:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.CrosshairLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		CrosshairTop:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.CrosshairTop:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Off = function ()
			BottomMeter:AnimateSequence( "Off" )
			TopMeter:AnimateSequence( "Off" )
			SideBracketRight:AnimateSequence( "Off" )
			SideBracketLeft:AnimateSequence( "Off" )
			CrosshairRight:AnimateSequence( "Off" )
			CrosshairLeft:AnimateSequence( "Off" )
			CrosshairTop:AnimateSequence( "Off" )
		end
		
		BottomMeter:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.BottomMeter:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BottomMeter:SetAlpha( 0, 880 )
				end,
				function ()
					return self.BottomMeter:SetAlpha( 0.4, 10 )
				end
			},
			{
				function ()
					return self.BottomMeter:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -50, _1080p * 50, _1080p * -38, _1080p * 38, 879 )
				end,
				function ()
					return self.BottomMeter:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -710, _1080p * 710, _1080p * -38, _1080p * 38, 120, LUI.EASING.outQuadratic )
				end
			}
		} )
		TopMeter:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.TopMeter:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TopMeter:SetAlpha( 0, 880 )
				end,
				function ()
					return self.TopMeter:SetAlpha( 0.4, 10 )
				end
			},
			{
				function ()
					return self.TopMeter:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -50, _1080p * 50, _1080p * -48, _1080p * 48, 879 )
				end,
				function ()
					return self.TopMeter:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -512, _1080p * 512, _1080p * -48, _1080p * 48, 120, LUI.EASING.outQuadratic )
				end
			}
		} )
		SideBracketRight:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.SideBracketRight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SideBracketRight:SetAlpha( 0, 700 )
				end,
				function ()
					return self.SideBracketRight:SetAlpha( 0.5, 50 )
				end
			},
			{
				function ()
					return self.SideBracketRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 18, _1080p * 190, _1080p * -400, _1080p * 400, 750 )
				end,
				function ()
					return self.SideBracketRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -232, _1080p * -60, _1080p * -400, _1080p * 400, 149, LUI.EASING.outQuadratic )
				end
			}
		} )
		SideBracketLeft:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.SideBracketLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SideBracketLeft:SetAlpha( 0, 700 )
				end,
				function ()
					return self.SideBracketLeft:SetAlpha( 0.5, 50 )
				end
			},
			{
				function ()
					return self.SideBracketLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -190, _1080p * -18, _1080p * -400, _1080p * 400, 750 )
				end,
				function ()
					return self.SideBracketLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 60, _1080p * 232, _1080p * -400, _1080p * 400, 149, LUI.EASING.outQuadratic )
				end
			}
		} )
		CrosshairRight:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.CrosshairRight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CrosshairRight:SetAlpha( 0, 700 )
				end,
				function ()
					return self.CrosshairRight:SetAlpha( 0.4, 50 )
				end
			},
			{
				function ()
					return self.CrosshairRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, 0, _1080p * -4, _1080p * 4, 750 )
				end,
				function ()
					return self.CrosshairRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 788, _1080p * -4, _1080p * 4, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		CrosshairLeft:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.CrosshairLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CrosshairLeft:SetAlpha( 0, 700 )
				end,
				function ()
					return self.CrosshairLeft:SetAlpha( 0.4, 50 )
				end
			},
			{
				function ()
					return self.CrosshairLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, 0, _1080p * -4, _1080p * 4, 750 )
				end,
				function ()
					return self.CrosshairLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -788, 0, _1080p * -4, _1080p * 4, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		CrosshairTop:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.CrosshairTop:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CrosshairTop:SetAlpha( 0, 700 )
				end,
				function ()
					return self.CrosshairTop:SetAlpha( 0.4, 50 )
				end
			},
			{
				function ()
					return self.CrosshairTop:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, 0, 0, 750 )
				end,
				function ()
					return self.CrosshairTop:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -448, 0, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		CompassElement:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.CompassElement:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CompassElement:SetAlpha( 0, 890 )
				end,
				function ()
					return self.CompassElement:SetAlpha( 1, 110 )
				end
			},
			{
				function ()
					return self.CompassElement:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 20, _1080p * 36, 0 )
				end,
				function ()
					return self.CompassElement:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 20, _1080p * 36, 889 )
				end,
				function ()
					return self.CompassElement:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 25, _1080p * 41, 110 )
				end
			}
		} )
		self._sequences.BootUp = function ()
			BottomMeter:AnimateSequence( "BootUp" )
			TopMeter:AnimateSequence( "BootUp" )
			SideBracketRight:AnimateSequence( "BootUp" )
			SideBracketLeft:AnimateSequence( "BootUp" )
			CrosshairRight:AnimateSequence( "BootUp" )
			CrosshairLeft:AnimateSequence( "BootUp" )
			CrosshairTop:AnimateSequence( "BootUp" )
			CompassElement:AnimateSequence( "BootUp" )
		end
		
		BottomMeter:RegisterAnimationSequence( "BootupSpectator", {
			{
				function ()
					return self.BottomMeter:SetAlpha( 0, 0 )
				end
			}
		} )
		TopMeter:RegisterAnimationSequence( "BootupSpectator", {
			{
				function ()
					return self.TopMeter:SetAlpha( 0, 0 )
				end
			}
		} )
		CompassElement:RegisterAnimationSequence( "BootupSpectator", {
			{
				function ()
					return self.CompassElement:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.BootupSpectator = function ()
			BottomMeter:AnimateSequence( "BootupSpectator" )
			TopMeter:AnimateSequence( "BootupSpectator" )
			CompassElement:AnimateSequence( "BootupSpectator" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "BootUp" )
	return self
end

MenuBuilder.registerType( "HackControlScreenElements", HackControlScreenElements )
LockTable( _M )
