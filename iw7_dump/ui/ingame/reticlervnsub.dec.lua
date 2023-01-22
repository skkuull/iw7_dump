local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.75
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if not f1_arg0.isVisible and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			f1_arg0.isVisible = false
		end
	end )
end

function ReticleRVNSub( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 15 * _1080p, 0, 15 * _1080p )
	self.id = "ReticleRVNSub"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ScopeReticleSpacer = nil
	
	ScopeReticleSpacer = MenuBuilder.BuildRegisteredType( "ScopeReticleSpacer", {
		minSizeADS = 3,
		maxSizeADS = 3,
		minSizeHip = 5,
		maxSizeHip = 11,
		adjustLeft = true,
		adjustRight = true,
		controllerIndex = f3_local1
	} )
	ScopeReticleSpacer.id = "ScopeReticleSpacer"
	ScopeReticleSpacer:SetAlpha( 0, 0 )
	self:addElement( ScopeReticleSpacer )
	self.ScopeReticleSpacer = ScopeReticleSpacer
	
	local BracketRS = nil
	
	BracketRS = LUI.UIImage.new()
	BracketRS.id = "BracketRS"
	BracketRS:SetRGBFromInt( 12779264, 0 )
	BracketRS:SetAlpha( 0.6, 0 )
	BracketRS:SetZRotation( 180, 0 )
	BracketRS:setImage( RegisterMaterial( "hud_reticle_rvn" ), 0 )
	BracketRS:SetUseAA( true )
	BracketRS:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -8.5, _1080p * 3.5, 0, 0 )
	self:addElement( BracketRS )
	self.BracketRS = BracketRS
	
	local BracketLS = nil
	
	BracketLS = LUI.UIImage.new()
	BracketLS.id = "BracketLS"
	BracketLS:SetRGBFromInt( 12779264, 0 )
	BracketLS:SetAlpha( 0.6, 0 )
	BracketLS:setImage( RegisterMaterial( "hud_reticle_rvn" ), 0 )
	BracketLS:SetUseAA( true )
	BracketLS:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -3.5, _1080p * 8.5, 0, 0 )
	self:addElement( BracketLS )
	self.BracketLS = BracketLS
	
	local BracketR = nil
	
	BracketR = LUI.UIImage.new()
	BracketR.id = "BracketR"
	BracketR:SetRGBFromInt( 12779264, 0 )
	BracketR:SetAlpha( 0.6, 0 )
	BracketR:SetZRotation( 180, 0 )
	BracketR:setImage( RegisterMaterial( "hud_reticle_rvn" ), 0 )
	BracketR:SetUseAA( true )
	BracketR:SetBlendMode( BLEND_MODE.addWithAlpha )
	BracketR:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -8, _1080p * 3.5, 0, 0 )
	self:addElement( BracketR )
	self.BracketR = BracketR
	
	local BracketL = nil
	
	BracketL = LUI.UIImage.new()
	BracketL.id = "BracketL"
	BracketL:SetRGBFromInt( 12779264, 0 )
	BracketL:SetAlpha( 0.6, 0 )
	BracketL:setImage( RegisterMaterial( "hud_reticle_rvn" ), 0 )
	BracketL:SetUseAA( true )
	BracketL:SetBlendMode( BLEND_MODE.addWithAlpha )
	BracketL:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -3.5, _1080p * 8, 0, 0 )
	self:addElement( BracketL )
	self.BracketL = BracketL
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BracketRS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.BracketRS:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -8, _1080p * 3.5, 0, 0, 59 )
				end
			}
		} )
		BracketLS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.BracketLS:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -3.5, _1080p * 8, 0, 0, 59 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			BracketRS:AnimateSequence( "ADSIN" )
			BracketLS:AnimateSequence( "ADSIN" )
		end
		
		BracketRS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.BracketRS:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -9, _1080p * 4.5, _1080p * -1, _1080p * 1, 59 )
				end
			}
		} )
		BracketLS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.BracketLS:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -4.5, _1080p * 9, _1080p * -1, _1080p * 1, 59 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			BracketRS:AnimateSequence( "ADSOUT" )
			BracketLS:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleRVNSub", ReticleRVNSub )
LockTable( _M )
