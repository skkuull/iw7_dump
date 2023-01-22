local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.AmmoCounter:SetBlendMode( BLEND_MODE.addWithAlpha )
end

function AmmoCounterBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 40 * _1080p, 0, 16 * _1080p )
	self.id = "AmmoCounterBase"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local AmmoCounterShadow = nil
	
	AmmoCounterShadow = LUI.UIStyledText.new()
	AmmoCounterShadow.id = "AmmoCounterShadow"
	AmmoCounterShadow:SetAlpha( 0.4, 0 )
	AmmoCounterShadow:SetScale( 0.01, 0 )
	AmmoCounterShadow:SetFontSize( 16 * _1080p )
	AmmoCounterShadow:SetFont( FONTS.GetFont( FONTS.EquipmentFont.File ) )
	AmmoCounterShadow:SetAlignment( LUI.Alignment.Center )
	AmmoCounterShadow:SetOptOutRightToLeftAlignmentFlip( true )
	AmmoCounterShadow:SetShadowRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	AmmoCounterShadow:SubscribeToModel( DataSources.inGame.player.currentWeapon.clipAmmoRightDisplay:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.clipAmmoRightDisplay:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			AmmoCounterShadow:setText( f3_local0, 0 )
		end
	end )
	self:addElement( AmmoCounterShadow )
	self.AmmoCounterShadow = AmmoCounterShadow
	
	local AmmoCounter = nil
	
	AmmoCounter = LUI.UIStyledText.new()
	AmmoCounter.id = "AmmoCounter"
	AmmoCounter:SetAlpha( 0, 0 )
	AmmoCounter:SetFontSize( 16 * _1080p )
	AmmoCounter:SetFont( FONTS.GetFont( FONTS.EquipmentFont.File ) )
	AmmoCounter:SetAlignment( LUI.Alignment.Center )
	AmmoCounter:SetOptOutRightToLeftAlignmentFlip( true )
	AmmoCounter:SetShadowMinDistance( -1, 0 )
	AmmoCounter:SetShadowMaxDistance( 1, 0 )
	AmmoCounter:SubscribeToModel( DataSources.inGame.player.currentWeapon.clipAmmoRightDisplay:GetModel( f2_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.currentWeapon.clipAmmoRightDisplay:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			AmmoCounter:setText( f4_local0, 0 )
		end
	end )
	self:addElement( AmmoCounter )
	self.AmmoCounter = AmmoCounter
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AmmoCounter:RegisterAnimationSequence( "Glow", {
			{
				function ()
					return self.AmmoCounter:SetAlpha( 0.4, 100 )
				end
			}
		} )
		self._sequences.Glow = function ()
			AmmoCounter:AnimateSequence( "Glow" )
		end
		
		AmmoCounter:RegisterAnimationSequence( "NoGlow", {
			{
				function ()
					return self.AmmoCounter:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.NoGlow = function ()
			AmmoCounter:AnimateSequence( "NoGlow" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	AmmoCounter:SubscribeToModel( DataSources.inGame.player.inADS:GetModel( f2_local1 ), function ()
		if DataSources.inGame.player.inADS:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.inADS:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Glow" )
		end
		if DataSources.inGame.player.inADS:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.inADS:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequence( self, "NoGlow" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "AmmoCounterBase", AmmoCounterBase )
LockTable( _M )
