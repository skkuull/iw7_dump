local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleBracketDoubleGreen( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 50 * _1080p, 0, 20 * _1080p )
	self.id = "ReticleBracketDoubleGreen"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ReticleBracketBase = nil
	
	ReticleBracketBase = MenuBuilder.BuildRegisteredType( "ReticleBracketBase", {
		controllerIndex = f1_local1
	} )
	ReticleBracketBase.id = "ReticleBracketBase"
	ReticleBracketBase:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	ReticleBracketBase:SetScale( -0.2, 0 )
	ReticleBracketBase:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -6.28, _1080p * 6.28, _1080p * -2, _1080p * 2 )
	self:addElement( ReticleBracketBase )
	self.ReticleBracketBase = ReticleBracketBase
	
	local ReticleBracketDoubleInner = nil
	
	ReticleBracketDoubleInner = MenuBuilder.BuildRegisteredType( "ReticleBracketDoubleInner", {
		controllerIndex = f1_local1
	} )
	ReticleBracketDoubleInner.id = "ReticleBracketDoubleInner"
	ReticleBracketDoubleInner:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	ReticleBracketDoubleInner:SetScale( -0.2, 0 )
	ReticleBracketDoubleInner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -28.5, _1080p * 28.5, _1080p * -6.5, _1080p * 6.5 )
	self:addElement( ReticleBracketDoubleInner )
	self.ReticleBracketDoubleInner = ReticleBracketDoubleInner
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleBracketBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleBracketBase:SetAlpha( 0.5, 60 )
				end
			},
			{
				function ()
					return self.ReticleBracketBase:SetScale( 0.5, 60 )
				end
			}
		} )
		ReticleBracketDoubleInner:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleBracketDoubleInner:SetAlpha( 0.5, 60 )
				end
			},
			{
				function ()
					return self.ReticleBracketDoubleInner:SetScale( 0.5, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleBracketBase:AnimateSequence( "ADSIN" )
			ReticleBracketDoubleInner:AnimateSequence( "ADSIN" )
		end
		
		ReticleBracketBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleBracketBase:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.ReticleBracketBase:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.ReticleBracketBase:SetScale( -0.2, 60 )
				end
			}
		} )
		ReticleBracketDoubleInner:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleBracketDoubleInner:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.ReticleBracketDoubleInner:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.ReticleBracketDoubleInner:SetScale( -0.2, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleBracketBase:AnimateLoop( "ADSOUT" )
			ReticleBracketDoubleInner:AnimateLoop( "ADSOUT" )
		end
		
		ReticleBracketDoubleInner:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.ReticleBracketDoubleInner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -28.5, _1080p * 28.5, _1080p * -6.5, _1080p * 6.5, 0 )
				end,
				function ()
					return self.ReticleBracketDoubleInner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * 12, _1080p * -4, _1080p * 4, 409, LUI.EASING.inOutBack )
				end
			}
		} )
		self._sequences.OnFire = function ()
			ReticleBracketDoubleInner:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.inADS:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.inADS:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.inADS:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ADSIN" )
		end
		if DataSources.inGame.player.inADS:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.inADS:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "ADSOUT" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
	end )
	return self
end

MenuBuilder.registerType( "ReticleBracketDoubleGreen", ReticleBracketDoubleGreen )
LockTable( _M )
