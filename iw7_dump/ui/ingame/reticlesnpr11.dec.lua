local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleSnpr11( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1 * _1080p, 0, 1 * _1080p )
	self.id = "ReticleSnpr11"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Snipe = nil
	
	Snipe = LUI.UIImage.new()
	Snipe.id = "Snipe"
	Snipe:SetRGBFromInt( 16766208, 0 )
	Snipe:setImage( RegisterMaterial( "hud_reticle_sniper19" ), 0 )
	Snipe:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -257.5, _1080p * 255.5, _1080p * -232, _1080p * 4 )
	Snipe:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Snipe )
	self.Snipe = Snipe
	
	local LineConveyorL = nil
	
	LineConveyorL = MenuBuilder.BuildRegisteredType( "LineConveyor", {
		controllerIndex = f1_local1
	} )
	LineConveyorL.id = "LineConveyorL"
	LineConveyorL:SetRGBFromInt( 16766208, 0 )
	LineConveyorL:SetYRotation( 180, 0 )
	LineConveyorL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -91, _1080p * -27, _1080p * 4, 0 )
	LineConveyorL:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( LineConveyorL )
	self.LineConveyorL = LineConveyorL
	
	local LineConveyorR = nil
	
	LineConveyorR = MenuBuilder.BuildRegisteredType( "LineConveyor", {
		controllerIndex = f1_local1
	} )
	LineConveyorR.id = "LineConveyorR"
	LineConveyorR:SetRGBFromInt( 16766208, 0 )
	LineConveyorR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 25, _1080p * 89, _1080p * 4, 0 )
	LineConveyorR:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( LineConveyorR )
	self.LineConveyorR = LineConveyorR
	
	local TechyDigitsElement = nil
	
	TechyDigitsElement = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 5,
		minValue = 0,
		maxValue = 100000000,
		longWait = 100,
		shortWaitMin = 20,
		shortWaitMax = 40,
		pulsesMin = 6,
		pulsesMax = 10,
		controllerIndex = f1_local1
	} )
	TechyDigitsElement.id = "TechyDigitsElement"
	TechyDigitsElement:SetRGBFromInt( 16766208, 0 )
	TechyDigitsElement:SetFontSize( 16 * _1080p )
	TechyDigitsElement:SetFont( FONTS.GetFont( FONTS.EquipmentFont.File ) )
	TechyDigitsElement:SetAlignment( LUI.Alignment.Left )
	TechyDigitsElement:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 199.49, _1080p * 235.49, _1080p * 3, _1080p * 19 )
	TechyDigitsElement:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( TechyDigitsElement )
	self.TechyDigitsElement = TechyDigitsElement
	
	local Notch1 = nil
	
	Notch1 = LUI.UIImage.new()
	Notch1.id = "Notch1"
	Notch1:SetRGBFromInt( 16766208, 0 )
	Notch1:setImage( RegisterMaterial( "hud_reticle_sniper19b" ), 0 )
	Notch1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1, _1080p * 1, _1080p * 2, _1080p * 16 )
	Notch1:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Notch1 )
	self.Notch1 = Notch1
	
	local Notch2 = nil
	
	Notch2 = LUI.UIImage.new()
	Notch2.id = "Notch2"
	Notch2:SetRGBFromInt( 16766208, 0 )
	Notch2:SetZRotation( -45, 0 )
	Notch2:setImage( RegisterMaterial( "hud_reticle_sniper19b" ), 0 )
	Notch2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 5.5, _1080p * 7.5, _1080p * -13, _1080p * 1 )
	Notch2:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Notch2 )
	self.Notch2 = Notch2
	
	local Notch3 = nil
	
	Notch3 = LUI.UIImage.new()
	Notch3.id = "Notch3"
	Notch3:SetRGBFromInt( 16766208, 0 )
	Notch3:SetZRotation( 45, 0 )
	Notch3:setImage( RegisterMaterial( "hud_reticle_sniper19b" ), 0 )
	Notch3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -7.5, _1080p * -5.5, _1080p * -13, _1080p * 1 )
	Notch3:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Notch3 )
	self.Notch3 = Notch3
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TechyDigitsElement:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.TechyDigitsElement:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -198, _1080p * -162, _1080p * 2, _1080p * 6, 0 )
				end
			}
		} )
		self._sequences.Idle = function ()
			TechyDigitsElement:AnimateSequence( "Idle" )
		end
		
		Notch1:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.Notch1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1.5, _1080p * 1.5, _1080p * 25, _1080p * 47, 0 )
				end,
				function ()
					return self.Notch1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1, _1080p * 1, _1080p * 1, _1080p * 13.48, 400, LUI.EASING.inBack )
				end,
				function ()
					return self.Notch1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1, _1080p * 1, _1080p * 16.27, _1080p * 28.27, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Notch1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1, _1080p * 1, _1080p * 2.24, _1080p * 16.24, 199, LUI.EASING.outCubic )
				end
			}
		} )
		Notch2:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.Notch2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 29, _1080p * 32, _1080p * -40, _1080p * -18, 0 )
				end,
				function ()
					return self.Notch2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 3.75, _1080p * 5.75, _1080p * -11, _1080p * 1.48, 400, LUI.EASING.inBack )
				end,
				function ()
					return self.Notch2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 16.77, _1080p * 18.73, _1080p * -24.76, _1080p * -12.76, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Notch2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 5, _1080p * 7, _1080p * -13, _1080p * 1, 199, LUI.EASING.outCubic )
				end
			}
		} )
		Notch3:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.Notch3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * -29, _1080p * -40, _1080p * -18, 0 )
				end,
				function ()
					return self.Notch3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -6.25, _1080p * -4.25, _1080p * -11, _1080p * 1.48, 400, LUI.EASING.inBack )
				end,
				function ()
					return self.Notch3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19.23, _1080p * -17.27, _1080p * -24.76, _1080p * -12.76, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Notch3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -7, _1080p * -5, _1080p * -13, _1080p * 1, 199, LUI.EASING.outCubic )
				end
			}
		} )
		self._sequences.OnFire = function ()
			Notch1:AnimateSequence( "OnFire" )
			Notch2:AnimateSequence( "OnFire" )
			Notch3:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
	end )
	ACTIONS.AnimateSequence( self, "Idle" )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "LineConveyorL",
		sequenceName = "Cycle2",
		elementPath = "LineConveyorL"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "LineConveyorR",
		sequenceName = "Cycle2",
		elementPath = "LineConveyorR"
	} )
	return self
end

MenuBuilder.registerType( "ReticleSnpr11", ReticleSnpr11 )
LockTable( _M )
