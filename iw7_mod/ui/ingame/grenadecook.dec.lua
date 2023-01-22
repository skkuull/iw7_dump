local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JustFilled( f1_arg0, f1_arg1 )
	if f1_arg0 == 1 and f1_arg1 and f1_arg1 < 1 then
		return true
	else
		return false
	end
end

function PostLoadFunc( f2_arg0, f2_arg1 )
	local f2_local0 = RegisterMaterial( "hud_grenade_prime_qtr" )
	local f2_local1 = RegisterMaterial( "hud_grenade_cook_qtr" )
	f2_arg0.LastProcessedGrenadeType = nil
	f2_arg0.GrenadeBar:SetOnUpdateCallback( function ( f3_arg0 )
		local f3_local0 = DataSources.inGame.HUD.grenadeReticleType:GetValue( f2_arg1 )
		local f3_local1 = 4
		local f3_local2 = f2_arg0.numChunksComplete
		f2_arg0.numChunksComplete = math.floor( f3_local1 * f3_arg0 )
		if f3_local0 == 1 then
			f2_arg0.GrenadeBar:SetSegmentImage( f2_local0 )
			if f3_arg0 == 0 and f3_local2 and f3_local2 ~= f3_local1 then
				ACTIONS.AnimateSequence( f2_arg0, "GrenadeTypePrime" )
			end
			if f3_local2 then
				if f3_local2 < 1 and f2_arg0.numChunksComplete >= 1 then
					ACTIONS.AnimateSequence( f2_arg0, "PrimeProgress25" )
				end
				if f3_local2 < 2 and f2_arg0.numChunksComplete >= 2 then
					ACTIONS.AnimateSequence( f2_arg0, "PrimeProgress50" )
				end
				if f3_local2 < 3 and f2_arg0.numChunksComplete >= 3 then
					ACTIONS.AnimateSequence( f2_arg0, "PrimeProgress75" )
				end
				if f3_local2 < 4 and f2_arg0.numChunksComplete >= 4 then
					ACTIONS.AnimateSequence( f2_arg0, "PrimeProgress100" )
					ACTIONS.AnimateSequence( f2_arg0, "Primed" )
				end
			end
		elseif f3_local0 == 2 then
			f2_arg0.GrenadeBar:SetSegmentImage( f2_local1 )
			if f3_arg0 == 0 and f3_local2 and f3_local2 ~= f3_local1 then
				ACTIONS.AnimateSequence( f2_arg0, "GrenadeTypeCook" )
			end
			if f3_local2 then
				if f3_local2 < 1 and f2_arg0.numChunksComplete >= 1 then
					ACTIONS.AnimateSequence( f2_arg0, "CookProgress25" )
				end
				if f3_local2 < 2 and f2_arg0.numChunksComplete >= 2 then
					ACTIONS.AnimateSequence( f2_arg0, "CookProgress50" )
				end
				if f3_local2 < 3 and f2_arg0.numChunksComplete >= 3 then
					ACTIONS.AnimateSequence( f2_arg0, "CookProgress75" )
				end
				if f3_local2 < 4 and f2_arg0.numChunksComplete >= 4 then
					ACTIONS.AnimateSequence( f2_arg0, "CookProgress100" )
					ACTIONS.AnimateSequence( f2_arg0, "Cooked" )
				end
			end
		elseif f3_local0 == 3 then
			f2_arg0.GrenadeBar:SetSegmentImage( f2_local1 )
			if f2_arg0.LastProcessedGrenadeType ~= 3 then
				ACTIONS.AnimateSequence( f2_arg0, "GrenadeTypeMaxHold" )
			end
		end
		f2_arg0.LastProcessedGrenadeType = f3_local0
	end )
end

function GrenadeCook( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "GrenadeCook"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local GrenadeCookGlow4 = nil
	
	GrenadeCookGlow4 = LUI.UIImage.new()
	GrenadeCookGlow4.id = "GrenadeCookGlow4"
	GrenadeCookGlow4:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	GrenadeCookGlow4:SetAlpha( 0, 0 )
	GrenadeCookGlow4:SetZRotation( 90, 0 )
	GrenadeCookGlow4:SetScale( -0.22, 0 )
	GrenadeCookGlow4:setImage( RegisterMaterial( "hud_grenade_cook_glow" ), 0 )
	GrenadeCookGlow4:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128 )
	self:addElement( GrenadeCookGlow4 )
	self.GrenadeCookGlow4 = GrenadeCookGlow4
	
	local GrenadeCookGlow3 = nil
	
	GrenadeCookGlow3 = LUI.UIImage.new()
	GrenadeCookGlow3.id = "GrenadeCookGlow3"
	GrenadeCookGlow3:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	GrenadeCookGlow3:SetAlpha( 0, 0 )
	GrenadeCookGlow3:SetZRotation( 180, 0 )
	GrenadeCookGlow3:SetScale( -0.22, 0 )
	GrenadeCookGlow3:setImage( RegisterMaterial( "hud_grenade_cook_glow" ), 0 )
	GrenadeCookGlow3:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128 )
	self:addElement( GrenadeCookGlow3 )
	self.GrenadeCookGlow3 = GrenadeCookGlow3
	
	local GrenadeCookGlow2 = nil
	
	GrenadeCookGlow2 = LUI.UIImage.new()
	GrenadeCookGlow2.id = "GrenadeCookGlow2"
	GrenadeCookGlow2:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	GrenadeCookGlow2:SetAlpha( 0, 0 )
	GrenadeCookGlow2:SetZRotation( -90, 0 )
	GrenadeCookGlow2:SetScale( -0.22, 0 )
	GrenadeCookGlow2:setImage( RegisterMaterial( "hud_grenade_cook_glow" ), 0 )
	GrenadeCookGlow2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128 )
	self:addElement( GrenadeCookGlow2 )
	self.GrenadeCookGlow2 = GrenadeCookGlow2
	
	local GrenadeCookGlow1 = nil
	
	GrenadeCookGlow1 = LUI.UIImage.new()
	GrenadeCookGlow1.id = "GrenadeCookGlow1"
	GrenadeCookGlow1:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	GrenadeCookGlow1:SetAlpha( 0, 0 )
	GrenadeCookGlow1:SetScale( -0.22, 0 )
	GrenadeCookGlow1:setImage( RegisterMaterial( "hud_grenade_cook_glow" ), 0 )
	GrenadeCookGlow1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128 )
	self:addElement( GrenadeCookGlow1 )
	self.GrenadeCookGlow1 = GrenadeCookGlow1
	
	local GenadePrimeHighlight4 = nil
	
	GenadePrimeHighlight4 = LUI.UIImage.new()
	GenadePrimeHighlight4.id = "GenadePrimeHighlight4"
	GenadePrimeHighlight4:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
	GenadePrimeHighlight4:SetScale( -0.87, 0 )
	GenadePrimeHighlight4:setImage( RegisterMaterial( "hud_grenade_prime_highlight" ), 0 )
	GenadePrimeHighlight4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -71, _1080p * 55, _1080p * -95, _1080p * 33 )
	self:addElement( GenadePrimeHighlight4 )
	self.GenadePrimeHighlight4 = GenadePrimeHighlight4
	
	local GenadePrimeHighlight3 = nil
	
	GenadePrimeHighlight3 = LUI.UIImage.new()
	GenadePrimeHighlight3.id = "GenadePrimeHighlight3"
	GenadePrimeHighlight3:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
	GenadePrimeHighlight3:SetScale( -0.87, 0 )
	GenadePrimeHighlight3:setImage( RegisterMaterial( "hud_grenade_prime_highlight" ), 0 )
	GenadePrimeHighlight3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -95, _1080p * 33, _1080p * -55, _1080p * 71 )
	self:addElement( GenadePrimeHighlight3 )
	self.GenadePrimeHighlight3 = GenadePrimeHighlight3
	
	local GenadePrimeHighlight2 = nil
	
	GenadePrimeHighlight2 = LUI.UIImage.new()
	GenadePrimeHighlight2.id = "GenadePrimeHighlight2"
	GenadePrimeHighlight2:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
	GenadePrimeHighlight2:SetScale( -0.87, 0 )
	GenadePrimeHighlight2:setImage( RegisterMaterial( "hud_grenade_prime_highlight" ), 0 )
	GenadePrimeHighlight2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -55, _1080p * 71, _1080p * -33, _1080p * 95 )
	self:addElement( GenadePrimeHighlight2 )
	self.GenadePrimeHighlight2 = GenadePrimeHighlight2
	
	local GenadePrimeHighlight1 = nil
	
	GenadePrimeHighlight1 = LUI.UIImage.new()
	GenadePrimeHighlight1.id = "GenadePrimeHighlight1"
	GenadePrimeHighlight1:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
	GenadePrimeHighlight1:SetScale( -0.87, 0 )
	GenadePrimeHighlight1:setImage( RegisterMaterial( "hud_grenade_prime_highlight" ), 0 )
	GenadePrimeHighlight1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -33, _1080p * 95, _1080p * -71, _1080p * 55 )
	self:addElement( GenadePrimeHighlight1 )
	self.GenadePrimeHighlight1 = GenadePrimeHighlight1
	
	local GrenadeBacker = nil
	
	GrenadeBacker = LUI.UIImage.new()
	GrenadeBacker.id = "GrenadeBacker"
	GrenadeBacker:SetRGBFromTable( SWATCHES.HUD.disabled, 0 )
	GrenadeBacker:setImage( RegisterMaterial( "hud_grenade_prime_full" ), 0 )
	GrenadeBacker:SetBlendMode( BLEND_MODE.addWithAlpha )
	GrenadeBacker:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50 )
	self:addElement( GrenadeBacker )
	self.GrenadeBacker = GrenadeBacker
	
	local GrenadeBar = nil
	
	GrenadeBar = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 4,
		segmentMaterial = "hud_grenade_cook_qtr",
		maskMaterial = "hud_grenade_cook_mask",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f4_local1
	} )
	GrenadeBar.id = "GrenadeBar"
	GrenadeBar:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	GrenadeBar:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50 )
	GrenadeBar:SubscribeToModel( DataSources.inGame.HUD.grenadeCookPercent:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.inGame.HUD.grenadeCookPercent:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			GrenadeBar:SetProgress( f5_local0 )
		end
	end )
	self:addElement( GrenadeBar )
	self.GrenadeBar = GrenadeBar
	
	local Primed = nil
	
	Primed = LUI.UIImage.new()
	Primed.id = "Primed"
	Primed:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
	Primed:SetAlpha( 0, 0 )
	Primed:setImage( RegisterMaterial( "hud_grenade_prime_full" ), 0 )
	Primed:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50 )
	self:addElement( Primed )
	self.Primed = Primed
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		GrenadeBacker:RegisterAnimationSequence( "GrenadeReticleOn", {
			{
				function ()
					return self.GrenadeBacker:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.GrenadeReticleOn = function ()
			GrenadeBacker:AnimateSequence( "GrenadeReticleOn" )
		end
		
		GrenadeCookGlow4:RegisterAnimationSequence( "GrenadeReticleOff", {
			{
				function ()
					return self.GrenadeCookGlow4:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.GrenadeCookGlow4:SetRGBFromTable( SWATCHES.HUD.active, 0 )
				end
			}
		} )
		GrenadeCookGlow3:RegisterAnimationSequence( "GrenadeReticleOff", {
			{
				function ()
					return self.GrenadeCookGlow3:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.GrenadeCookGlow3:SetRGBFromTable( SWATCHES.HUD.active, 0 )
				end
			}
		} )
		GrenadeCookGlow2:RegisterAnimationSequence( "GrenadeReticleOff", {
			{
				function ()
					return self.GrenadeCookGlow2:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.GrenadeCookGlow2:SetRGBFromTable( SWATCHES.HUD.active, 0 )
				end
			}
		} )
		GrenadeCookGlow1:RegisterAnimationSequence( "GrenadeReticleOff", {
			{
				function ()
					return self.GrenadeCookGlow1:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.GrenadeCookGlow1:SetRGBFromTable( SWATCHES.HUD.active, 0 )
				end
			}
		} )
		GenadePrimeHighlight4:RegisterAnimationSequence( "GrenadeReticleOff", {
			{
				function ()
					return self.GenadePrimeHighlight4:SetAlpha( 0, 0 )
				end
			}
		} )
		GenadePrimeHighlight3:RegisterAnimationSequence( "GrenadeReticleOff", {
			{
				function ()
					return self.GenadePrimeHighlight3:SetAlpha( 0, 0 )
				end
			}
		} )
		GenadePrimeHighlight2:RegisterAnimationSequence( "GrenadeReticleOff", {
			{
				function ()
					return self.GenadePrimeHighlight2:SetAlpha( 0, 0 )
				end
			}
		} )
		GenadePrimeHighlight1:RegisterAnimationSequence( "GrenadeReticleOff", {
			{
				function ()
					return self.GenadePrimeHighlight1:SetAlpha( 0, 0 )
				end
			}
		} )
		GrenadeBacker:RegisterAnimationSequence( "GrenadeReticleOff", {
			{
				function ()
					return self.GrenadeBacker:SetAlpha( 0, 0 )
				end
			}
		} )
		Primed:RegisterAnimationSequence( "GrenadeReticleOff", {
			{
				function ()
					return self.Primed:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.GrenadeReticleOff = function ()
			GrenadeCookGlow4:AnimateSequence( "GrenadeReticleOff" )
			GrenadeCookGlow3:AnimateSequence( "GrenadeReticleOff" )
			GrenadeCookGlow2:AnimateSequence( "GrenadeReticleOff" )
			GrenadeCookGlow1:AnimateSequence( "GrenadeReticleOff" )
			GenadePrimeHighlight4:AnimateSequence( "GrenadeReticleOff" )
			GenadePrimeHighlight3:AnimateSequence( "GrenadeReticleOff" )
			GenadePrimeHighlight2:AnimateSequence( "GrenadeReticleOff" )
			GenadePrimeHighlight1:AnimateSequence( "GrenadeReticleOff" )
			GrenadeBacker:AnimateSequence( "GrenadeReticleOff" )
			Primed:AnimateSequence( "GrenadeReticleOff" )
		end
		
		GrenadeCookGlow1:RegisterAnimationSequence( "CookProgress25", {
			{
				function ()
					return self.GrenadeCookGlow1:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.GrenadeCookGlow1:SetAlpha( 0.2, 500 )
				end
			}
		} )
		self._sequences.CookProgress25 = function ()
			GrenadeCookGlow1:AnimateSequence( "CookProgress25" )
		end
		
		GrenadeCookGlow2:RegisterAnimationSequence( "CookProgress50", {
			{
				function ()
					return self.GrenadeCookGlow2:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.GrenadeCookGlow2:SetAlpha( 0.2, 500 )
				end
			}
		} )
		self._sequences.CookProgress50 = function ()
			GrenadeCookGlow2:AnimateSequence( "CookProgress50" )
		end
		
		GrenadeCookGlow3:RegisterAnimationSequence( "CookProgress75", {
			{
				function ()
					return self.GrenadeCookGlow3:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.GrenadeCookGlow3:SetAlpha( 0.2, 500 )
				end
			}
		} )
		self._sequences.CookProgress75 = function ()
			GrenadeCookGlow3:AnimateSequence( "CookProgress75" )
		end
		
		GrenadeCookGlow4:RegisterAnimationSequence( "CookProgress100", {
			{
				function ()
					return self.GrenadeCookGlow4:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.GrenadeCookGlow4:SetAlpha( 0.2, 500 )
				end
			}
		} )
		self._sequences.CookProgress100 = function ()
			GrenadeCookGlow4:AnimateSequence( "CookProgress100" )
		end
		
		GrenadeCookGlow4:RegisterAnimationSequence( "GrenadeTypeCook", {
			{
				function ()
					return self.GrenadeCookGlow4:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		GrenadeCookGlow3:RegisterAnimationSequence( "GrenadeTypeCook", {
			{
				function ()
					return self.GrenadeCookGlow3:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		GrenadeCookGlow2:RegisterAnimationSequence( "GrenadeTypeCook", {
			{
				function ()
					return self.GrenadeCookGlow2:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		GrenadeCookGlow1:RegisterAnimationSequence( "GrenadeTypeCook", {
			{
				function ()
					return self.GrenadeCookGlow1:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		GrenadeBacker:RegisterAnimationSequence( "GrenadeTypeCook", {
			{
				function ()
					return self.GrenadeBacker:setImage( RegisterMaterial( "hud_grenade_cook_full" ), 0 )
				end
			}
		} )
		GrenadeBar:RegisterAnimationSequence( "GrenadeTypeCook", {
			{
				function ()
					return self.GrenadeBar:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			},
			{
				function ()
					return self.GrenadeBar:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50, 0 )
				end
			}
		} )
		self._sequences.GrenadeTypeCook = function ()
			GrenadeCookGlow4:AnimateSequence( "GrenadeTypeCook" )
			GrenadeCookGlow3:AnimateSequence( "GrenadeTypeCook" )
			GrenadeCookGlow2:AnimateSequence( "GrenadeTypeCook" )
			GrenadeCookGlow1:AnimateSequence( "GrenadeTypeCook" )
			GrenadeBacker:AnimateSequence( "GrenadeTypeCook" )
			GrenadeBar:AnimateSequence( "GrenadeTypeCook" )
		end
		
		GenadePrimeHighlight1:RegisterAnimationSequence( "PrimeProgress25", {
			{
				function ()
					return self.GenadePrimeHighlight1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.GenadePrimeHighlight1:SetAlpha( 1, 10 )
				end,
				function ()
					return self.GenadePrimeHighlight1:SetAlpha( 0, 240 )
				end
			},
			{
				function ()
					return self.GenadePrimeHighlight1:SetScale( -0.87, 0 )
				end,
				function ()
					return self.GenadePrimeHighlight1:SetScale( -0.6, 250 )
				end
			}
		} )
		self._sequences.PrimeProgress25 = function ()
			GenadePrimeHighlight1:AnimateSequence( "PrimeProgress25" )
		end
		
		GenadePrimeHighlight2:RegisterAnimationSequence( "PrimeProgress50", {
			{
				function ()
					return self.GenadePrimeHighlight2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.GenadePrimeHighlight2:SetAlpha( 1, 10 )
				end,
				function ()
					return self.GenadePrimeHighlight2:SetAlpha( 0, 240 )
				end
			},
			{
				function ()
					return self.GenadePrimeHighlight2:SetScale( -0.87, 0 )
				end,
				function ()
					return self.GenadePrimeHighlight2:SetScale( -0.6, 250 )
				end
			}
		} )
		self._sequences.PrimeProgress50 = function ()
			GenadePrimeHighlight2:AnimateSequence( "PrimeProgress50" )
		end
		
		GenadePrimeHighlight3:RegisterAnimationSequence( "PrimeProgress75", {
			{
				function ()
					return self.GenadePrimeHighlight3:SetAlpha( 0, 0 )
				end,
				function ()
					return self.GenadePrimeHighlight3:SetAlpha( 1, 10 )
				end,
				function ()
					return self.GenadePrimeHighlight3:SetAlpha( 0, 240 )
				end
			},
			{
				function ()
					return self.GenadePrimeHighlight3:SetScale( -0.87, 0 )
				end,
				function ()
					return self.GenadePrimeHighlight3:SetScale( -0.6, 250 )
				end
			}
		} )
		self._sequences.PrimeProgress75 = function ()
			GenadePrimeHighlight3:AnimateSequence( "PrimeProgress75" )
		end
		
		GenadePrimeHighlight4:RegisterAnimationSequence( "PrimeProgress100", {
			{
				function ()
					return self.GenadePrimeHighlight4:SetAlpha( 0, 0 )
				end,
				function ()
					return self.GenadePrimeHighlight4:SetAlpha( 1, 10 )
				end,
				function ()
					return self.GenadePrimeHighlight4:SetAlpha( 0, 240 )
				end
			},
			{
				function ()
					return self.GenadePrimeHighlight4:SetScale( -0.87, 0 )
				end,
				function ()
					return self.GenadePrimeHighlight4:SetScale( -0.6, 250 )
				end
			}
		} )
		self._sequences.PrimeProgress100 = function ()
			GenadePrimeHighlight4:AnimateSequence( "PrimeProgress100" )
		end
		
		GrenadeBacker:RegisterAnimationSequence( "GrenadeTypePrime", {
			{
				function ()
					return self.GrenadeBacker:setImage( RegisterMaterial( "hud_grenade_prime_full" ), 0 )
				end
			},
			{
				function ()
					return self.GrenadeBacker:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		GrenadeBar:RegisterAnimationSequence( "GrenadeTypePrime", {
			{
				function ()
					return self.GrenadeBar:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
				end
			}
		} )
		self._sequences.GrenadeTypePrime = function ()
			GrenadeBacker:AnimateSequence( "GrenadeTypePrime" )
			GrenadeBar:AnimateSequence( "GrenadeTypePrime" )
		end
		
		Primed:RegisterAnimationSequence( "Primed", {
			{
				function ()
					return self.Primed:SetRGBFromInt( 9658880, 0 )
				end
			},
			{
				function ()
					return self.Primed:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Primed:SetAlpha( 1, 300 )
				end,
				function ()
					return self.Primed:SetAlpha( 0, 300 )
				end
			}
		} )
		self._sequences.Primed = function ()
			Primed:AnimateLoop( "Primed" )
		end
		
		GrenadeCookGlow4:RegisterAnimationSequence( "Cooked", {
			{
				function ()
					return self.GrenadeCookGlow4:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		GrenadeCookGlow3:RegisterAnimationSequence( "Cooked", {
			{
				function ()
					return self.GrenadeCookGlow3:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		GrenadeCookGlow2:RegisterAnimationSequence( "Cooked", {
			{
				function ()
					return self.GrenadeCookGlow2:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		GrenadeCookGlow1:RegisterAnimationSequence( "Cooked", {
			{
				function ()
					return self.GrenadeCookGlow1:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		GrenadeBar:RegisterAnimationSequence( "Cooked", {
			{
				function ()
					return self.GrenadeBar:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		self._sequences.Cooked = function ()
			GrenadeCookGlow4:AnimateSequence( "Cooked" )
			GrenadeCookGlow3:AnimateSequence( "Cooked" )
			GrenadeCookGlow2:AnimateSequence( "Cooked" )
			GrenadeCookGlow1:AnimateSequence( "Cooked" )
			GrenadeBar:AnimateSequence( "Cooked" )
		end
		
		GrenadeBacker:RegisterAnimationSequence( "GrenadeTypeMaxHold", {
			{
				function ()
					return self.GrenadeBacker:setImage( RegisterMaterial( "hud_grenade_cook_full" ), 0 )
				end
			}
		} )
		GrenadeBar:RegisterAnimationSequence( "GrenadeTypeMaxHold", {
			{
				function ()
					return self.GrenadeBar:SetRGBFromTable( SWATCHES.HUD.Countdown, 0 )
				end
			},
			{
				function ()
					return self.GrenadeBar:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50, 0 )
				end
			}
		} )
		self._sequences.GrenadeTypeMaxHold = function ()
			GrenadeBacker:AnimateSequence( "GrenadeTypeMaxHold" )
			GrenadeBar:AnimateSequence( "GrenadeTypeMaxHold" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.grenadeCookPercent:GetModel( f4_local1 ), function ()
		if DataSources.inGame.HUD.grenadeCookPercent:GetValue( f4_local1 ) ~= nil and DataSources.inGame.HUD.grenadeCookPercent:GetValue( f4_local1 ) <= 0 then
			ACTIONS.AnimateSequence( self, "GrenadeReticleOff" )
		end
		if DataSources.inGame.HUD.grenadeCookPercent:GetValue( f4_local1 ) ~= nil and DataSources.inGame.HUD.grenadeCookPercent:GetValue( f4_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "GrenadeReticleOn" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.HUD.grenadeReticleType:GetModel( f4_local1 ), function ()
		if DataSources.inGame.HUD.grenadeReticleType:GetValue( f4_local1 ) ~= nil and DataSources.inGame.HUD.grenadeReticleType:GetValue( f4_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "GrenadeTypePrime" )
		end
		if DataSources.inGame.HUD.grenadeReticleType:GetValue( f4_local1 ) ~= nil and DataSources.inGame.HUD.grenadeReticleType:GetValue( f4_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "GrenadeTypeCook" )
		end
	end )
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "GrenadeCook", GrenadeCook )
LockTable( _M )
