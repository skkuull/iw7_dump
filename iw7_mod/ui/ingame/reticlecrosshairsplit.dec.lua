local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleCrosshairSplit( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 13 * _1080p, 0, 10 * _1080p )
	self.id = "ReticleCrosshairSplit"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if not Engine.InFrontend() then
		f1_local3 = MenuBuilder.BuildRegisteredType( "ScopeReticleSpacer", {
			minSizeADS = 0,
			maxSizeADS = 0,
			minSizeHip = 10,
			maxSizeHip = 18,
			adjustLeft = true,
			adjustRight = true,
			controllerIndex = f1_local1
		} )
		f1_local3.id = "ScopeReticleSpacer"
		f1_local3:SetAlpha( 0, 0 )
		self:addElement( f1_local3 )
		self.ScopeReticleSpacer = f1_local3
	end
	local RightHorzShadow = nil
	
	RightHorzShadow = LUI.UIImage.new()
	RightHorzShadow.id = "RightHorzShadow"
	RightHorzShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	RightHorzShadow:SetAlpha( 0.6, 0 )
	RightHorzShadow:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	RightHorzShadow:SetUseAA( true )
	RightHorzShadow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 1, _1080p * 5, _1080p * -1, _1080p * 1 )
	self:addElement( RightHorzShadow )
	self.RightHorzShadow = RightHorzShadow
	
	local RightVertShadow = nil
	
	RightVertShadow = LUI.UIImage.new()
	RightVertShadow.id = "RightVertShadow"
	RightVertShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	RightVertShadow:SetAlpha( 0.6, 0 )
	RightVertShadow:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	RightVertShadow:SetUseAA( true )
	RightVertShadow:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -1, _1080p * 1, 0, 0 )
	self:addElement( RightVertShadow )
	self.RightVertShadow = RightVertShadow
	
	local LeftHorzShadow = nil
	
	LeftHorzShadow = LUI.UIImage.new()
	LeftHorzShadow.id = "LeftHorzShadow"
	LeftHorzShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	LeftHorzShadow:SetAlpha( 0.6, 0 )
	LeftHorzShadow:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	LeftHorzShadow:SetUseAA( true )
	LeftHorzShadow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -5, _1080p * -1, _1080p * -1, _1080p * 1 )
	self:addElement( LeftHorzShadow )
	self.LeftHorzShadow = LeftHorzShadow
	
	local LeftVertShadow = nil
	
	LeftVertShadow = LUI.UIImage.new()
	LeftVertShadow.id = "LeftVertShadow"
	LeftVertShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	LeftVertShadow:SetAlpha( 0.6, 0 )
	LeftVertShadow:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	LeftVertShadow:SetUseAA( true )
	LeftVertShadow:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -1, _1080p * 1, 0, 0 )
	self:addElement( LeftVertShadow )
	self.LeftVertShadow = LeftVertShadow
	
	local RightVert = nil
	
	RightVert = LUI.UIImage.new()
	RightVert.id = "RightVert"
	RightVert:SetAlpha( 0.6, 0 )
	RightVert:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	RightVert:SetUseAA( true )
	RightVert:SetBlendMode( BLEND_MODE.addWithAlpha )
	RightVert:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -1, _1080p * 1, 0, 0 )
	self:addElement( RightVert )
	self.RightVert = RightVert
	
	local RightHorz = nil
	
	RightHorz = LUI.UIImage.new()
	RightHorz.id = "RightHorz"
	RightHorz:SetAlpha( 0.6, 0 )
	RightHorz:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	RightHorz:SetUseAA( true )
	RightHorz:SetBlendMode( BLEND_MODE.addWithAlpha )
	RightHorz:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 1, _1080p * 5, _1080p * -1, _1080p * 1 )
	self:addElement( RightHorz )
	self.RightHorz = RightHorz
	
	local LeftVert = nil
	
	LeftVert = LUI.UIImage.new()
	LeftVert.id = "LeftVert"
	LeftVert:SetAlpha( 0.6, 0 )
	LeftVert:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	LeftVert:SetUseAA( true )
	LeftVert:SetBlendMode( BLEND_MODE.addWithAlpha )
	LeftVert:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -1, _1080p * 1, 0, 0 )
	self:addElement( LeftVert )
	self.LeftVert = LeftVert
	
	local LeftHorz = nil
	
	LeftHorz = LUI.UIImage.new()
	LeftHorz.id = "LeftHorz"
	LeftHorz:SetAlpha( 0.6, 0 )
	LeftHorz:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	LeftHorz:SetUseAA( true )
	LeftHorz:SetBlendMode( BLEND_MODE.addWithAlpha )
	LeftHorz:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -5, _1080p * -1, _1080p * -1, _1080p * 1 )
	self:addElement( LeftHorz )
	self.LeftHorz = LeftHorz
	
	return self
end

MenuBuilder.registerType( "ReticleCrosshairSplit", ReticleCrosshairSplit )
LockTable( _M )
