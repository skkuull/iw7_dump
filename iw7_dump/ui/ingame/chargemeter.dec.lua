local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = DataSources.inGame.player.currentWeapon.charge
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			if f2_local0 ~= 0 then
				f1_arg0.Button1:SetAlpha( 0.8, 100, LUI.EASING.outQuadratic )
			else
				f1_arg0.Button1:SetAlpha( 0, 100, LUI.EASING.outQuadratic )
			end
			if f2_local0 > 0.39 then
				f1_arg0.Button2:SetAlpha( 0.8, 100, LUI.EASING.outQuadratic )
			else
				f1_arg0.Button2:SetAlpha( 0, 100, LUI.EASING.outQuadratic )
			end
			if f2_local0 > 0.59 then
				f1_arg0.Button3:SetAlpha( 0.8, 100, LUI.EASING.outQuadratic )
			else
				f1_arg0.Button3:SetAlpha( 0, 100, LUI.EASING.outQuadratic )
			end
			if f2_local0 > 0.79 then
				f1_arg0.Button4:SetAlpha( 0.8, 100, LUI.EASING.outQuadratic )
			else
				f1_arg0.Button4:SetAlpha( 0, 100, LUI.EASING.outQuadratic )
			end
			if f2_local0 >= 1 then
				f1_arg0.Button5:SetAlpha( 0.8, 100, LUI.EASING.outQuadratic )
				ACTIONS.AnimateSequence( f1_arg0, "FullyCharged" )
			else
				f1_arg0.Button5:SetAlpha( 0, 100, LUI.EASING.outQuadratic )
				f1_arg0.GreenCharge:SetAlpha( 0, 100, LUI.EASING.outQuadratic )
			end
		end
	end )
	local f1_local1 = 0.75
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f3_arg0 )
		local f3_local0 = DataModel.GetModelValue( f3_arg0 )
		if not f1_arg0.isVisible and f1_local1 <= f3_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible and f3_local0 < f1_local1 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			f1_arg0.isVisible = false
		end
	end )
end

function ChargeMeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "ChargeMeter"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Backing = nil
	
	Backing = LUI.UIImage.new()
	Backing.id = "Backing"
	Backing:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	Backing:SetAlpha( 0.3, 0 )
	Backing:setImage( RegisterMaterial( "hud_reticle_charging_bracket" ), 0 )
	Backing:SetVMax( 0.31, 0 )
	Backing:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 20, _1080p * -20, _1080p * 17, _1080p * -17 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local Button1 = nil
	
	Button1 = LUI.UIImage.new()
	Button1.id = "Button1"
	Button1:SetRGBFromInt( 15028736, 0 )
	Button1:SetAlpha( 0.6, 0 )
	Button1:setImage( RegisterMaterial( "hud_reticle_charge_meter" ), 0 )
	Button1:SetBlendMode( BLEND_MODE.addWithAlpha )
	Button1:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 20, _1080p * -20, _1080p * 41, _1080p * -17 )
	self:addElement( Button1 )
	self.Button1 = Button1
	
	local Button2 = nil
	
	Button2 = LUI.UIImage.new()
	Button2.id = "Button2"
	Button2:SetRGBFromInt( 15028736, 0 )
	Button2:SetAlpha( 0.6, 0 )
	Button2:setImage( RegisterMaterial( "hud_reticle_charge_meter" ), 0 )
	Button2:SetBlendMode( BLEND_MODE.addWithAlpha )
	Button2:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 20, _1080p * -20, _1080p * 35, _1080p * -23 )
	self:addElement( Button2 )
	self.Button2 = Button2
	
	local Button3 = nil
	
	Button3 = LUI.UIImage.new()
	Button3.id = "Button3"
	Button3:SetRGBFromInt( 15028736, 0 )
	Button3:SetAlpha( 0.6, 0 )
	Button3:setImage( RegisterMaterial( "hud_reticle_charge_meter" ), 0 )
	Button3:SetBlendMode( BLEND_MODE.addWithAlpha )
	Button3:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 20, _1080p * -20, _1080p * 29, _1080p * -29 )
	self:addElement( Button3 )
	self.Button3 = Button3
	
	local Button4 = nil
	
	Button4 = LUI.UIImage.new()
	Button4.id = "Button4"
	Button4:SetRGBFromInt( 15028736, 0 )
	Button4:SetAlpha( 0.6, 0 )
	Button4:setImage( RegisterMaterial( "hud_reticle_charge_meter" ), 0 )
	Button4:SetBlendMode( BLEND_MODE.addWithAlpha )
	Button4:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 20, _1080p * -20, _1080p * 23, _1080p * -35 )
	self:addElement( Button4 )
	self.Button4 = Button4
	
	local Button5 = nil
	
	Button5 = LUI.UIImage.new()
	Button5.id = "Button5"
	Button5:SetRGBFromInt( 15028736, 0 )
	Button5:SetAlpha( 0.6, 0 )
	Button5:setImage( RegisterMaterial( "hud_reticle_charge_meter" ), 0 )
	Button5:SetBlendMode( BLEND_MODE.addWithAlpha )
	Button5:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 20, _1080p * -20, _1080p * 17, _1080p * -41 )
	self:addElement( Button5 )
	self.Button5 = Button5
	
	local GreenCharge = nil
	
	GreenCharge = LUI.UIImage.new()
	GreenCharge.id = "GreenCharge"
	GreenCharge:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	GreenCharge:setImage( RegisterMaterial( "hud_reticle_charging_bracket" ), 0 )
	GreenCharge:SetVMax( 0.31, 0 )
	GreenCharge:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 20, _1080p * -20, _1080p * 17, _1080p * -17 )
	self:addElement( GreenCharge )
	self.GreenCharge = GreenCharge
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Backing:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Backing:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 12, _1080p * -12, _1080p * 3, _1080p * -3, 59 )
				end
			}
		} )
		Button1:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Button1:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 12, _1080p * -12, _1080p * 50, _1080p * -2, 59 )
				end
			}
		} )
		Button2:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Button2:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 12, _1080p * -12, _1080p * 38, _1080p * -14, 59 )
				end
			}
		} )
		Button3:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Button3:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 12, _1080p * -12, _1080p * 26, _1080p * -26, 59 )
				end
			}
		} )
		Button4:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Button4:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 12, _1080p * -12, _1080p * 14, _1080p * -38, 59 )
				end
			}
		} )
		Button5:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Button5:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 12, _1080p * -12, _1080p * 2, _1080p * -50, 59 )
				end
			}
		} )
		GreenCharge:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.GreenCharge:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 8.8, _1080p * -8.8, _1080p * 2, _1080p * -2, 59 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			Backing:AnimateSequence( "ADSIN" )
			Button1:AnimateSequence( "ADSIN" )
			Button2:AnimateSequence( "ADSIN" )
			Button3:AnimateSequence( "ADSIN" )
			Button4:AnimateSequence( "ADSIN" )
			Button5:AnimateSequence( "ADSIN" )
			GreenCharge:AnimateSequence( "ADSIN" )
		end
		
		Backing:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Backing:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 20, _1080p * -20, _1080p * 17, _1080p * -17, 59 )
				end
			}
		} )
		Button1:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Button1:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 20, _1080p * -20, _1080p * 41, _1080p * -17, 59 )
				end
			}
		} )
		Button2:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Button2:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 20, _1080p * -20, _1080p * 35, _1080p * -23, 59 )
				end
			}
		} )
		Button3:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Button3:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 20, _1080p * -20, _1080p * 29, _1080p * -29, 59 )
				end
			}
		} )
		Button4:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Button4:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 20, _1080p * -20, _1080p * 23, _1080p * -35, 59 )
				end
			}
		} )
		Button5:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Button5:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 20, _1080p * -20, _1080p * 17, _1080p * -41, 59 )
				end
			}
		} )
		GreenCharge:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.GreenCharge:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 20, _1080p * -20, _1080p * 17, _1080p * -17, 59 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			Backing:AnimateSequence( "ADSOUT" )
			Button1:AnimateSequence( "ADSOUT" )
			Button2:AnimateSequence( "ADSOUT" )
			Button3:AnimateSequence( "ADSOUT" )
			Button4:AnimateSequence( "ADSOUT" )
			Button5:AnimateSequence( "ADSOUT" )
			GreenCharge:AnimateSequence( "ADSOUT" )
		end
		
		GreenCharge:RegisterAnimationSequence( "FullyCharged", {
			{
				function ()
					return self.GreenCharge:SetAlpha( 0, 0 )
				end,
				function ()
					return self.GreenCharge:SetAlpha( 0.8, 70 )
				end,
				function ()
					return self.GreenCharge:SetAlpha( 0, 70 )
				end,
				function ()
					return self.GreenCharge:SetAlpha( 0.8, 70 )
				end
			}
		} )
		self._sequences.FullyCharged = function ()
			GreenCharge:AnimateSequence( "FullyCharged" )
		end
		
		Button1:RegisterAnimationSequence( "PreCharge", {
			{
				function ()
					return self.Button1:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 500 )
				end
			}
		} )
		Button2:RegisterAnimationSequence( "PreCharge", {
			{
				function ()
					return self.Button2:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 500 )
				end
			}
		} )
		Button3:RegisterAnimationSequence( "PreCharge", {
			{
				function ()
					return self.Button3:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 500 )
				end
			}
		} )
		Button4:RegisterAnimationSequence( "PreCharge", {
			{
				function ()
					return self.Button4:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 500 )
				end
			}
		} )
		Button5:RegisterAnimationSequence( "PreCharge", {
			{
				function ()
					return self.Button5:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 500 )
				end
			}
		} )
		self._sequences.PreCharge = function ()
			Button1:AnimateSequence( "PreCharge" )
			Button2:AnimateSequence( "PreCharge" )
			Button3:AnimateSequence( "PreCharge" )
			Button4:AnimateSequence( "PreCharge" )
			Button5:AnimateSequence( "PreCharge" )
		end
		
		Button1:RegisterAnimationSequence( "NotCharged", {
			{
				function ()
					return self.Button1:SetRGBFromInt( 15028736, 60 )
				end
			}
		} )
		Button2:RegisterAnimationSequence( "NotCharged", {
			{
				function ()
					return self.Button2:SetRGBFromInt( 15028736, 60 )
				end
			}
		} )
		Button3:RegisterAnimationSequence( "NotCharged", {
			{
				function ()
					return self.Button3:SetRGBFromInt( 15028736, 60 )
				end
			}
		} )
		Button4:RegisterAnimationSequence( "NotCharged", {
			{
				function ()
					return self.Button4:SetRGBFromInt( 15028736, 60 )
				end
			}
		} )
		Button5:RegisterAnimationSequence( "NotCharged", {
			{
				function ()
					return self.Button5:SetRGBFromInt( 15028736, 60 )
				end
			}
		} )
		self._sequences.NotCharged = function ()
			Button1:AnimateSequence( "NotCharged" )
			Button2:AnimateSequence( "NotCharged" )
			Button3:AnimateSequence( "NotCharged" )
			Button4:AnimateSequence( "NotCharged" )
			Button5:AnimateSequence( "NotCharged" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.charge:GetModel( f4_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.charge:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.charge:GetValue( f4_local1 ) >= 0.8 then
			ACTIONS.AnimateSequence( self, "PreCharge" )
		end
		if DataSources.inGame.player.currentWeapon.charge:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.charge:GetValue( f4_local1 ) <= 0.79 then
			ACTIONS.AnimateSequence( self, "NotCharged" )
		end
	end )
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "ChargeMeter", ChargeMeter )
LockTable( _M )
