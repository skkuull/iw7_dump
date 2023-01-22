local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 15
f0_local1 = function ( f1_arg0 )
	Engine.PlaySound( "MP_hit_alert_strong" )
	f1_arg0.audioEventQueue = f1_arg0.audioEventQueue - 1
	if f1_arg0.audioEventQueue > 0 then
		local self = LUI.UITimer.new( nil, {
			interval = 50,
			event = "play_hitmarker_sound",
			disposable = true
		} )
		self.id = "play_sound_timer"
		f1_arg0:addElement( self )
	end
end

f0_local2 = function ( f2_arg0, f2_arg1 )
	if f2_arg1 <= 0 then
		return 
	elseif f2_arg0.audioEventQueue == nil then
		f2_arg0.audioEventQueue = 0
		f2_arg0:registerEventHandler( "play_hitmarker_sound", f0_local1 )
	end
	f2_arg0.audioEventQueue = f2_arg0.audioEventQueue + f2_arg1
	if f2_arg0.audioEventQueue == f2_arg1 then
		f0_local1( f2_arg0 )
	end
end

local f0_local3 = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = function ()
		if string.lower( Game.GetOmnvar( "damage_feedback" ) ) ~= "none" and not CONDITIONS.IsCinematicCameraActive( f3_arg0 ) then
			if Engine.IsMultiplayer() and Game.GetOmnvar( "damage_feedback_kill" ) then
				f3_arg0.HitMarkerTick:SetScale( 0.3, 0 )
				local f4_local0 = f3_arg0.HitMarkerTick:SetScale( 0.3, 20 )
				f4_local0.onComplete = function ()
					local f5_local0 = f3_arg0.HitMarkerTick:SetScale( 0, 10 )
					f5_local0.onComplete = function ()
						f3_arg0.HitMarkerTick:SetScale( 0, 140 )
					end
					
				end
				
				f3_arg0.HitMarkerTick:SetAlpha( 1, 0 )
				local f4_local1 = f3_arg0.HitMarkerTick:SetAlpha( 1, 20 )
				f4_local1.onComplete = function ()
					local f7_local0 = f3_arg0.HitMarkerTick:SetAlpha( 0.7, 10 )
					f7_local0.onComplete = function ()
						local f8_local0 = f3_arg0.HitMarkerTick:SetAlpha( 0.6, 210 )
						f8_local0.onComplete = function ()
							f3_arg0.HitMarkerTick:SetAlpha( 0, 160 )
						end
						
					end
					
				end
				
				return 
			end
			f3_arg0.HitMarkerTick:SetScale( 0.15, 0 )
			local f4_local2 = f3_arg0.HitMarkerTick:SetScale( 0.15, 20 )
			f4_local2.onComplete = function ()
				local f10_local0 = f3_arg0.HitMarkerTick:SetScale( 0, 10 )
				f10_local0.onComplete = function ()
					f3_arg0.HitMarkerTick:SetScale( 0, 140 )
				end
				
			end
			
			f3_arg0.HitMarkerTick:SetAlpha( 1, 0 )
			local f4_local0 = f3_arg0.HitMarkerTick:SetAlpha( 1, 20 )
			f4_local0.onComplete = function ()
				local f12_local0 = f3_arg0.HitMarkerTick:SetAlpha( 0.7, 10 )
				f12_local0.onComplete = function ()
					f3_arg0.HitMarkerTick:SetAlpha( 0, 270 )
				end
				
			end
			
		end
	end
	
	if not Engine.IsMultiplayer() or not Engine.IsCoreMode() then
		f3_arg0:SubscribeToModel( DataSources.inGame.HUD.hitMarker.type:GetModel( f3_arg1 ), f3_local0, true )
	end
	f3_arg0:SubscribeToModel( DataSources.inGame.HUD.hitMarker.typeNotify:GetModel( f3_arg1 ), f3_local0, true )
	if Engine.IsMultiplayer() and Engine.IsCoreMode() then
		f3_arg0.oldAudioEventTotal = 0
		f3_arg0.audioEventClient = Game.GetPlayerstateClientnum( f3_arg1 )
		f3_arg0.wasInKillCam = Game.InKillCam( f3_arg1 )
		f3_arg0:SubscribeToModel( DataSources.inGame.HUD.hitMarker.audioEvents:GetModel( f3_arg1 ), function ( f14_arg0 )
			local f14_local0 = DataModel.GetModelValue( f14_arg0 )
			local f14_local1 = Game.GetPlayerstateClientnum( f3_arg1 )
			local f14_local2 = Game.InKillCam( f3_arg1 )
			if f14_local1 ~= f3_arg0.audioEventClient or f3_arg0.wasInKillCam ~= f14_local2 then
				f3_arg0.oldAudioEventTotal = f14_local0
			end
			f3_arg0.audioEventClient = f14_local1
			f3_arg0.wasInKillCam = f14_local2
			local f14_local3 = 0
			if f3_arg0.oldAudioEventTotal == nil then
				f14_local3 = f14_local0
			else
				f14_local3 = f14_local0 - f3_arg0.oldAudioEventTotal
				if f14_local3 < 0 then
					f14_local3 = f14_local3 + f0_local0 + 1
				end
			end
			f3_arg0.oldAudioEventTotal = f14_local0
			f0_local2( f3_arg0, f14_local3 )
		end, true )
	end
end

function HitMarker( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 22 * _1080p, 0, 22 * _1080p )
	self.id = "HitMarker"
	self._animationSets = {}
	self._sequences = {}
	local f15_local1 = controller and controller.controllerIndex
	if not f15_local1 and not Engine.InFrontend() then
		f15_local1 = self:getRootController()
	end
	assert( f15_local1 )
	local f15_local2 = self
	local HitMarkerTick = nil
	
	HitMarkerTick = MenuBuilder.BuildRegisteredType( "HitMarkerTick", {
		controllerIndex = f15_local1
	} )
	HitMarkerTick.id = "HitMarkerTick"
	HitMarkerTick:SetAlpha( 0, 0 )
	HitMarkerTick:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 22, 0, _1080p * 22 )
	self:addElement( HitMarkerTick )
	self.HitMarkerTick = HitMarkerTick
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		HitMarkerTick:RegisterAnimationSequence( "Hit", {
			{
				function ()
					return self.HitMarkerTick:SetScale( 0.15, 0 )
				end,
				function ()
					return self.HitMarkerTick:SetScale( 0.15, 20 )
				end,
				function ()
					return self.HitMarkerTick:SetScale( 0, 10 )
				end,
				function ()
					return self.HitMarkerTick:SetScale( 0, 140 )
				end
			},
			{
				function ()
					return self.HitMarkerTick:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HitMarkerTick:SetAlpha( 1, 20 )
				end,
				function ()
					return self.HitMarkerTick:SetAlpha( 0.7, 10 )
				end,
				function ()
					return self.HitMarkerTick:SetAlpha( 0, 270 )
				end
			}
		} )
		self._sequences.Hit = function ()
			HitMarkerTick:AnimateSequence( "Hit" )
		end
		
		HitMarkerTick:RegisterAnimationSequence( "HitKill", {
			{
				function ()
					return self.HitMarkerTick:SetScale( 0.3, 0 )
				end,
				function ()
					return self.HitMarkerTick:SetScale( 0.3, 20 )
				end,
				function ()
					return self.HitMarkerTick:SetScale( 0, 10 )
				end,
				function ()
					return self.HitMarkerTick:SetScale( 0, 140 )
				end
			},
			{
				function ()
					return self.HitMarkerTick:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HitMarkerTick:SetAlpha( 1, 20 )
				end,
				function ()
					return self.HitMarkerTick:SetAlpha( 0.7, 10 )
				end,
				function ()
					return self.HitMarkerTick:SetAlpha( 0.6, 210 )
				end,
				function ()
					return self.HitMarkerTick:SetAlpha( 0, 160 )
				end
			}
		} )
		self._sequences.HitKill = function ()
			HitMarkerTick:AnimateSequence( "HitKill" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local3( self, f15_local1, controller )
	return self
end

MenuBuilder.registerType( "HitMarker", HitMarker )
LockTable( _M )
