local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleCircleDualTickOrange( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "ReticleCircleDualTickOrange"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ReticleCircleDualTick = nil
	
	ReticleCircleDualTick = MenuBuilder.BuildRegisteredType( "ReticleCircleDualTick", {
		controllerIndex = f1_local1
	} )
	ReticleCircleDualTick.id = "ReticleCircleDualTick"
	ReticleCircleDualTick:SetRGBFromInt( 16739328, 0 )
	ReticleCircleDualTick:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5 )
	ReticleCircleDualTick:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ReticleCircleDualTick:SetZRotation( Lerp( f2_local0, 0, 90 ), 0 )
		end
	end )
	self:addElement( ReticleCircleDualTick )
	self.ReticleCircleDualTick = ReticleCircleDualTick
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f1_local1
	} )
	DotBase.id = "DotBase"
	DotBase.DotShadow:SetRGBFromInt( 16739328, 0 )
	DotBase.Dot:SetRGBFromInt( 16739328, 0 )
	DotBase.DotHighlight:SetRGBFromInt( 16765593, 0 )
	DotBase.DotHighlight:SetAlpha( 0.4, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3 )
	DotBase:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			DotBase:SetAlpha( Add( f3_local0, -0.2 ), 0 )
		end
	end )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleCircleDualTick:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleCircleDualTick:SetAlpha( 0.8, 100 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleCircleDualTick:AnimateSequence( "ADSIN" )
		end
		
		ReticleCircleDualTick:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleCircleDualTick:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.ReticleCircleDualTick:SetAlpha( 0.2, 50 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleCircleDualTick:AnimateLoop( "ADSOUT" )
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
	return self
end

MenuBuilder.registerType( "ReticleCircleDualTickOrange", ReticleCircleDualTickOrange )
LockTable( _M )
