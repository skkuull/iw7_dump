local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.TrackerText )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
	local f1_local0 = f1_arg0.TrackerText
	local f1_local1 = DataSources.inGame.HUD.compassRotation
	f1_local0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = math.ceil( f1_local1:GetValue( f1_arg1 ) )
		local f2_local1 = nil
		if f2_local0 <= 180 then
			f2_local1 = f2_local0 / 180 * -2.5
		else
			f2_local1 = (1 - (f2_local0 - 180) / 180) * 2.5
		end
		f1_local0:setText( string.format( "%0.5f", f2_local1 ), 0 )
	end )
end

function JackalCompass( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 260 * _1080p, 0, 62 * _1080p )
	self.id = "JackalCompass"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Tracker = nil
	
	Tracker = LUI.UIImage.new()
	Tracker.id = "Tracker"
	Tracker:setImage( RegisterMaterial( "hud_jackal_compass_tracker" ), 0 )
	Tracker:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -64, _1080p * 64, _1080p * 1.97, _1080p * 33.97 )
	self:addElement( Tracker )
	self.Tracker = Tracker
	
	local TrackerText = nil
	
	TrackerText = LUI.UIText.new()
	TrackerText.id = "TrackerText"
	TrackerText:setText( "-----", 0 )
	TrackerText:SetFontSize( 16 * _1080p )
	TrackerText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TrackerText:SetAlignment( LUI.Alignment.Center )
	TrackerText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -31.5, _1080p * 31.5, _1080p * 4.97, _1080p * 20.97 )
	self:addElement( TrackerText )
	self.TrackerText = TrackerText
	
	local Compass = nil
	
	Compass = MenuBuilder.BuildRegisteredType( "Compass", {
		stretch = 0.25,
		controllerIndex = f3_local1
	} )
	Compass.id = "Compass"
	Compass:setImage( RegisterMaterial( "hud_jackal_compass_tickertape" ), 0 )
	Compass:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -32, 0 )
	self:addElement( Compass )
	self.Compass = Compass
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Tracker:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.Tracker:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Tracker:SetAlpha( 0, 350 )
				end,
				function ()
					return self.Tracker:SetAlpha( 1, 200 )
				end
			}
		} )
		TrackerText:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.TrackerText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TrackerText:SetAlpha( 0, 350 )
				end,
				function ()
					return self.TrackerText:SetAlpha( 1, 200 )
				end
			}
		} )
		Compass:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.Compass:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Compass:SetAlpha( 0, 350 )
				end,
				function ()
					return self.Compass:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.bootup = function ()
			Tracker:AnimateSequence( "bootup" )
			TrackerText:AnimateSequence( "bootup" )
			Compass:AnimateSequence( "bootup" )
		end
		
		Tracker:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.Tracker:SetAlpha( 0, 700 )
				end
			}
		} )
		TrackerText:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.TrackerText:SetAlpha( 0, 700 )
				end
			}
		} )
		Compass:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.Compass:SetAlpha( 0, 700 )
				end
			}
		} )
		self._sequences.default = function ()
			Tracker:AnimateSequence( "default" )
			TrackerText:AnimateSequence( "default" )
			Compass:AnimateSequence( "default" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalCompass", JackalCompass )
LockTable( _M )
