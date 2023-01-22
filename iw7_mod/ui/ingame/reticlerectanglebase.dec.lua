local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleRectangleBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 12 * _1080p, 0, 12 * _1080p )
	self.id = "ReticleRectangleBase"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ScopeReticleSpacer = nil
	
	ScopeReticleSpacer = MenuBuilder.BuildRegisteredType( "ScopeReticleSpacer", {
		minSizeADS = 2,
		maxSizeADS = 2,
		minSizeHip = 6,
		maxSizeHip = 12,
		adjustTop = true,
		adjustBottom = true,
		controllerIndex = f1_local1
	} )
	ScopeReticleSpacer.id = "ScopeReticleSpacer"
	ScopeReticleSpacer:SetAlpha( 0, 0 )
	self:addElement( ScopeReticleSpacer )
	self.ScopeReticleSpacer = ScopeReticleSpacer
	
	local LineShadow = nil
	
	LineShadow = LUI.UIImage.new()
	LineShadow.id = "LineShadow"
	LineShadow:SetRGBFromInt( 4473924, 0 )
	LineShadow:SetAlpha( 0.4, 0 )
	LineShadow:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	LineShadow:SetUseAA( true )
	LineShadow:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -2, _1080p * 0.5, _1080p * 1, _1080p * -1 )
	self:addElement( LineShadow )
	self.LineShadow = LineShadow
	
	local LineRShadow = nil
	
	LineRShadow = LUI.UIImage.new()
	LineRShadow.id = "LineRShadow"
	LineRShadow:SetRGBFromInt( 4473924, 0 )
	LineRShadow:SetAlpha( 0.4, 0 )
	LineRShadow:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	LineRShadow:SetUseAA( true )
	LineRShadow:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -0.5, _1080p * 2, _1080p * 1, _1080p * -1 )
	self:addElement( LineRShadow )
	self.LineRShadow = LineRShadow
	
	local LineBShadow = nil
	
	LineBShadow = LUI.UIImage.new()
	LineBShadow.id = "LineBShadow"
	LineBShadow:SetRGBFromInt( 4473924, 0 )
	LineBShadow:SetAlpha( 0.4, 0 )
	LineBShadow:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	LineBShadow:SetUseAA( true )
	LineBShadow:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -2, _1080p * 2, _1080p * -1, _1080p * 2 )
	self:addElement( LineBShadow )
	self.LineBShadow = LineBShadow
	
	local LineTShadow = nil
	
	LineTShadow = LUI.UIImage.new()
	LineTShadow.id = "LineTShadow"
	LineTShadow:SetRGBFromInt( 4473924, 0 )
	LineTShadow:SetAlpha( 0.4, 0 )
	LineTShadow:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	LineTShadow:SetUseAA( true )
	LineTShadow:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -2, _1080p * 2, _1080p * -2, _1080p * 1 )
	self:addElement( LineTShadow )
	self.LineTShadow = LineTShadow
	
	local LineL = nil
	
	LineL = LUI.UIImage.new()
	LineL.id = "LineL"
	LineL:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	LineL:SetUseAA( true )
	LineL:SetBlendMode( BLEND_MODE.addWithAlpha )
	LineL:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -1.5, 0, 0, 0 )
	self:addElement( LineL )
	self.LineL = LineL
	
	local LineB = nil
	
	LineB = LUI.UIImage.new()
	LineB.id = "LineB"
	LineB:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	LineB:SetUseAA( true )
	LineB:SetBlendMode( BLEND_MODE.addWithAlpha )
	LineB:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -1.5, _1080p * 1.5, 0, _1080p * 1.5 )
	self:addElement( LineB )
	self.LineB = LineB
	
	local LineR = nil
	
	LineR = LUI.UIImage.new()
	LineR.id = "LineR"
	LineR:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	LineR:SetUseAA( true )
	LineR:SetBlendMode( BLEND_MODE.addWithAlpha )
	LineR:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 1.5, 0, 0 )
	self:addElement( LineR )
	self.LineR = LineR
	
	local LineT = nil
	
	LineT = LUI.UIImage.new()
	LineT.id = "LineT"
	LineT:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	LineT:SetUseAA( true )
	LineT:SetBlendMode( BLEND_MODE.addWithAlpha )
	LineT:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -1.5, _1080p * 1.5, _1080p * -1.5, 0 )
	self:addElement( LineT )
	self.LineT = LineT
	
	return self
end

MenuBuilder.registerType( "ReticleRectangleBase", ReticleRectangleBase )
LockTable( _M )
