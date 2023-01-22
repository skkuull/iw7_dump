local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleSnpr07( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1 * _1080p, 0, 1 * _1080p )
	self.id = "ReticleSnpr07"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LineConveyorL = nil
	
	LineConveyorL = MenuBuilder.BuildRegisteredType( "LineConveyor", {
		controllerIndex = f1_local1
	} )
	LineConveyorL.id = "LineConveyorL"
	LineConveyorL:SetRGBFromInt( 16766208, 0 )
	LineConveyorL:SetYRotation( 180, 0 )
	LineConveyorL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -120, _1080p * -56, _1080p * 3, 0 )
	LineConveyorL:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			LineConveyorL:SetAlpha( Lerp( f2_local0, 0, 0.5 ), 0 )
		end
	end )
	self:addElement( LineConveyorL )
	self.LineConveyorL = LineConveyorL
	
	local LineConveyorR = nil
	
	LineConveyorR = MenuBuilder.BuildRegisteredType( "LineConveyor", {
		controllerIndex = f1_local1
	} )
	LineConveyorR.id = "LineConveyorR"
	LineConveyorR:SetRGBFromInt( 16766208, 0 )
	LineConveyorR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 57, _1080p * 121, _1080p * 3, 0 )
	LineConveyorR:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			LineConveyorR:SetAlpha( Lerp( f3_local0, 0, 0.5 ), 0 )
		end
	end )
	self:addElement( LineConveyorR )
	self.LineConveyorR = LineConveyorR
	
	local Orange = nil
	
	Orange = LUI.UIImage.new()
	Orange.id = "Orange"
	Orange:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	Orange:setImage( RegisterMaterial( "hud_reticle_sniper15" ), 0 )
	Orange:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -196, _1080p * 196, _1080p * -101, _1080p * 100 )
	Orange:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Orange )
	self.Orange = Orange
	
	local Accents = nil
	
	Accents = LUI.UIImage.new()
	Accents.id = "Accents"
	Accents:setImage( RegisterMaterial( "hud_reticle_sniper15b" ), 0 )
	Accents:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -66.55, _1080p * 67.55, _1080p * -55.26, _1080p * 2.5 )
	Accents:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Accents )
	self.Accents = Accents
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f1_local1
	} )
	DotBase.id = "DotBase"
	DotBase.DotShadow:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	DotBase.DotShadow:SetAlpha( 0.6, 0 )
	DotBase.Dot:SetRGBFromInt( 4863, 0 )
	DotBase.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Periwinkle, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -2, _1080p * 2 )
	DotBase:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LineConveyorL:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.LineConveyorL:SetRGBFromInt( 16766208, 0 )
				end,
				function ()
					return self.LineConveyorL:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 1300 )
				end,
				function ()
					return self.LineConveyorL:SetRGBFromInt( 16766208, 1100 )
				end
			}
		} )
		LineConveyorR:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.LineConveyorR:SetRGBFromInt( 16766208, 0 )
				end,
				function ()
					return self.LineConveyorR:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 1300 )
				end,
				function ()
					return self.LineConveyorR:SetRGBFromInt( 16766208, 1100 )
				end
			}
		} )
		Orange:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.Orange:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
				end,
				function ()
					return self.Orange:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 1300 )
				end,
				function ()
					return self.Orange:SetRGBFromTable( SWATCHES.Reticles.Orange, 1100 )
				end
			},
			{
				function ()
					return self.Orange:SetDotPitchEnabled( true )
				end
			},
			{
				function ()
					return self.Orange:SetDotPitchContrast( 0, 0 )
				end,
				function ()
					return self.Orange:SetDotPitchContrast( 0.3, 300 )
				end,
				function ()
					return self.Orange:SetDotPitchContrast( 0, 1000 )
				end
			},
			{
				function ()
					return self.Orange:SetDotPitchX( 50, 0 )
				end,
				function ()
					return self.Orange:SetDotPitchX( 10, 1300 )
				end,
				function ()
					return self.Orange:SetDotPitchX( 50, 1100 )
				end
			},
			{
				function ()
					return self.Orange:SetDotPitchY( 10, 0 )
				end,
				function ()
					return self.Orange:SetDotPitchY( 50, 1300 )
				end,
				function ()
					return self.Orange:SetDotPitchY( 10, 1100 )
				end
			}
		} )
		self._sequences.Idle = function ()
			LineConveyorL:AnimateLoop( "Idle" )
			LineConveyorR:AnimateLoop( "Idle" )
			Orange:AnimateLoop( "Idle" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "LineConveyorR",
		sequenceName = "Cycle2",
		elementPath = "LineConveyorR"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "LineConveyorL",
		sequenceName = "Cycle2",
		elementPath = "LineConveyorL"
	} )
	ACTIONS.AnimateSequence( self, "Idle" )
	return self
end

MenuBuilder.registerType( "ReticleSnpr07", ReticleSnpr07 )
LockTable( _M )
