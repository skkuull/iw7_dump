local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleSnpr06( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1 * _1080p, 0, 1 * _1080p )
	self.id = "ReticleSnpr06"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:setImage( RegisterMaterial( "hud_reticle_sniper14" ), 0 )
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -152, _1080p * 152, _1080p * -150, _1080p * 150 )
	Image:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Image )
	self.Image = Image
	
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
	TechyDigitsElement:SetFontSize( 16 * _1080p )
	TechyDigitsElement:SetFont( FONTS.GetFont( FONTS.EquipmentFont.File ) )
	TechyDigitsElement:SetAlignment( LUI.Alignment.Left )
	TechyDigitsElement:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 167.49, _1080p * 203.49, _1080p * -8, _1080p * 8 )
	TechyDigitsElement:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( TechyDigitsElement )
	self.TechyDigitsElement = TechyDigitsElement
	
	local Line = nil
	
	Line = LUI.UIImage.new()
	Line.id = "Line"
	Line:SetZRotation( 90, 0 )
	Line:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	Line:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -112.2, _1080p * -107.5, _1080p * -3, _1080p * -1 )
	Line:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Line )
	self.Line = Line
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TechyDigitsElement:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.TechyDigitsElement:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 121.49, _1080p * 157.49, _1080p * -2, _1080p * 3, 0 )
				end
			}
		} )
		Line:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.Line:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -112.2, _1080p * -107.5, _1080p * -3, _1080p * -1, 0 )
				end,
				function ()
					return self.Line:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -110.5, _1080p * -109.4, _1080p * -1.5, 0, 400 )
				end,
				function ()
					return self.Line:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -112.2, _1080p * -107.5, _1080p * -3, _1080p * -1, 400 )
				end
			}
		} )
		self._sequences.Idle = function ()
			TechyDigitsElement:AnimateLoop( "Idle" )
			Line:AnimateLoop( "Idle" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Idle" )
	return self
end

MenuBuilder.registerType( "ReticleSnpr06", ReticleSnpr06 )
LockTable( _M )
