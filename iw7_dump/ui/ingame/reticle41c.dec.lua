local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.75
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f1_arg0.isVisible ~= true and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			ACTIONS.AnimateSequence( f1_arg0, "Snow" )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible ~= false and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			ACTIONS.AnimateSequence( f1_arg0, "NoSnow" )
			f1_arg0.isVisible = false
		end
	end )
end

function Reticle41c( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "Reticle41c"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local FlakeS = nil
	
	FlakeS = LUI.UIImage.new()
	FlakeS.id = "FlakeS"
	FlakeS:SetRGBFromInt( 9485535, 0 )
	FlakeS:SetAlpha( 0.4, 0 )
	FlakeS:SetScale( -0.28, 0 )
	FlakeS:setImage( RegisterMaterial( "hud_reticle_41_nostencil" ), 0 )
	FlakeS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50 )
	self:addElement( FlakeS )
	self.FlakeS = FlakeS
	
	local Flake = nil
	
	Flake = LUI.UIImage.new()
	Flake.id = "Flake"
	Flake:SetRGBFromInt( 13625087, 0 )
	Flake:SetAlpha( 0.6, 0 )
	Flake:SetScale( -0.3, 0 )
	Flake:setImage( RegisterMaterial( "hud_reticle_41_nostencil" ), 0 )
	Flake:SetBlendMode( BLEND_MODE.addWithAlpha )
	Flake:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -49, _1080p * 49, _1080p * -49, _1080p * 49 )
	self:addElement( Flake )
	self.Flake = Flake
	
	local Snow2 = nil
	
	Snow2 = LUI.UIImage.new()
	Snow2.id = "Snow2"
	Snow2:SetRGBFromInt( 13625087, 0 )
	Snow2:SetAlpha( 0.4, 0 )
	Snow2:SetZRotation( 180, 0 )
	Snow2:SetScale( -0.2, 0 )
	Snow2:setImage( RegisterMaterial( "hud_reticle_41b_nostencil" ), 0 )
	Snow2:SetBlendMode( BLEND_MODE.addWithAlpha )
	Snow2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 4, _1080p * -126, _1080p * 130 )
	self:addElement( Snow2 )
	self.Snow2 = Snow2
	
	local Snow1 = nil
	
	Snow1 = LUI.UIImage.new()
	Snow1.id = "Snow1"
	Snow1:SetRGBFromInt( 13625087, 0 )
	Snow1:SetAlpha( 0.4, 0 )
	Snow1:SetScale( -0.2, 0 )
	Snow1:setImage( RegisterMaterial( "hud_reticle_41b_nostencil" ), 0 )
	Snow1:SetBlendMode( BLEND_MODE.addWithAlpha )
	Snow1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -15, _1080p * 49, _1080p * -126, _1080p * 130 )
	self:addElement( Snow1 )
	self.Snow1 = Snow1
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Snow2:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.Snow2:SetVMin( 0, 0 )
				end,
				function ()
					return self.Snow2:SetVMin( 1, 7000 )
				end
			},
			{
				function ()
					return self.Snow2:SetVMax( 1, 0 )
				end,
				function ()
					return self.Snow2:SetVMax( 2, 7000 )
				end
			},
			{
				function ()
					return self.Snow2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -54.2, _1080p * -2.2, _1080p * -88, _1080p * 88, 0 )
				end,
				function ()
					return self.Snow2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -49.2, _1080p * 2.8, _1080p * -88, _1080p * 88, 3279 )
				end,
				function ()
					return self.Snow2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -54.2, _1080p * -2.2, _1080p * -88, _1080p * 88, 3720 )
				end
			}
		} )
		Snow1:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.Snow1:SetVMin( 0.5, 0 )
				end,
				function ()
					return self.Snow1:SetVMin( -0.5, 8000 )
				end
			},
			{
				function ()
					return self.Snow1:SetVMax( 1.5, 0 )
				end,
				function ()
					return self.Snow1:SetVMax( 0.5, 8000 )
				end
			},
			{
				function ()
					return self.Snow1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 5, _1080p * 55, _1080p * -88, _1080p * 88, 0 )
				end,
				function ()
					return self.Snow1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 1, _1080p * 51, _1080p * -88, _1080p * 88, 3980 )
				end,
				function ()
					return self.Snow1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 5, _1080p * 55, _1080p * -88, _1080p * 88, 4019 )
				end
			}
		} )
		self._sequences.Idle = function ()
			Snow2:AnimateLoop( "Idle" )
			Snow1:AnimateLoop( "Idle" )
		end
		
		FlakeS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.FlakeS:SetAlpha( 0.8, 60 )
				end
			},
			{
				function ()
					return self.FlakeS:SetRGBFromInt( 9025484, 60 )
				end
			},
			{
				function ()
					return self.FlakeS:SetScale( 0.03, 60 )
				end
			},
			{
				function ()
					return self.FlakeS:setImage( RegisterMaterial( "hud_reticle_41_nostencil" ), 60 )
				end
			},
			{
				function ()
					return self.FlakeS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10, 59 )
				end
			}
		} )
		Flake:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Flake:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.Flake:SetScale( 0, 60 )
				end
			},
			{
				function ()
					return self.Flake:setImage( RegisterMaterial( "hud_reticle_41_nostencil" ), 60 )
				end
			},
			{
				function ()
					return self.Flake:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -11, _1080p * 11, _1080p * -11, _1080p * 11, 59 )
				end
			}
		} )
		Snow2:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Snow2:setImage( RegisterMaterial( "hud_reticle_41b_nostencil" ), 60 )
				end
			}
		} )
		Snow1:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Snow1:setImage( RegisterMaterial( "hud_reticle_41b_nostencil" ), 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			FlakeS:AnimateSequence( "ADSIN" )
			Flake:AnimateSequence( "ADSIN" )
			Snow2:AnimateSequence( "ADSIN" )
			Snow1:AnimateSequence( "ADSIN" )
		end
		
		FlakeS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.FlakeS:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.FlakeS:SetScale( -0.28, 60 )
				end
			},
			{
				function ()
					return self.FlakeS:setImage( RegisterMaterial( "hud_reticle_41" ), 60 )
				end
			},
			{
				function ()
					return self.FlakeS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -25, _1080p * 25, _1080p * -25, _1080p * 25, 59 )
				end
			}
		} )
		Flake:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Flake:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Flake:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.Flake:SetScale( -0.3, 60 )
				end
			},
			{
				function ()
					return self.Flake:setImage( RegisterMaterial( "hud_reticle_41" ), 60 )
				end
			},
			{
				function ()
					return self.Flake:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -25, _1080p * 25, _1080p * -25, _1080p * 25, 59 )
				end
			}
		} )
		Snow2:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Snow2:setImage( RegisterMaterial( "hud_reticle_41b" ), 60 )
				end
			}
		} )
		Snow1:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Snow1:setImage( RegisterMaterial( "hud_reticle_41b" ), 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			FlakeS:AnimateLoop( "ADSOUT" )
			Flake:AnimateLoop( "ADSOUT" )
			Snow2:AnimateLoop( "ADSOUT" )
			Snow1:AnimateLoop( "ADSOUT" )
		end
		
		Snow2:RegisterAnimationSequence( "Snow", {
			{
				function ()
					return self.Snow2:SetAlpha( 0.4, 60 )
				end
			}
		} )
		Snow1:RegisterAnimationSequence( "Snow", {
			{
				function ()
					return self.Snow1:SetAlpha( 0.4, 60 )
				end
			}
		} )
		self._sequences.Snow = function ()
			Snow2:AnimateSequence( "Snow" )
			Snow1:AnimateSequence( "Snow" )
		end
		
		Snow2:RegisterAnimationSequence( "NoSnow", {
			{
				function ()
					return self.Snow2:SetAlpha( 0, 50 )
				end
			}
		} )
		Snow1:RegisterAnimationSequence( "NoSnow", {
			{
				function ()
					return self.Snow1:SetAlpha( 0, 50 )
				end
			}
		} )
		self._sequences.NoSnow = function ()
			Snow2:AnimateSequence( "NoSnow" )
			Snow1:AnimateSequence( "NoSnow" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "Idle" )
	return self
end

MenuBuilder.registerType( "Reticle41c", Reticle41c )
LockTable( _M )