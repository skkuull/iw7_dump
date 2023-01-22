local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CRMFullWindow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "CRMFullWindow"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 316, _1080p * -316, _1080p * 103, _1080p * -177 )
	Image:SubscribeToModelThroughElement( self, "image", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.image:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Image:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local BodyBackground = nil
	
	BodyBackground = LUI.UIImage.new()
	BodyBackground.id = "BodyBackground"
	BodyBackground:SetRGBFromTable( SWATCHES.HUD.background, 0 )
	BodyBackground:SetAlpha( 0.85, 0 )
	BodyBackground:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	BodyBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 316, _1080p * -420, _1080p * 103, _1080p * -173 )
	self:addElement( BodyBackground )
	self.BodyBackground = BodyBackground
	
	local TitleBandAlpha = nil
	
	TitleBandAlpha = LUI.UIImage.new()
	TitleBandAlpha.id = "TitleBandAlpha"
	TitleBandAlpha:SetRGBFromTable( SWATCHES.genericMenu.title, 0 )
	TitleBandAlpha:SetAlpha( 0.2, 0 )
	TitleBandAlpha:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 316, _1080p * -316, _1080p * 102, _1080p * 182 )
	self:addElement( TitleBandAlpha )
	self.TitleBandAlpha = TitleBandAlpha
	
	local TitleBandTop = nil
	
	TitleBandTop = LUI.UIImage.new()
	TitleBandTop.id = "TitleBandTop"
	TitleBandTop:SetRGBFromTable( SWATCHES.CAC.yellowLight, 0 )
	TitleBandTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 316, _1080p * -316, _1080p * 92, _1080p * 102 )
	self:addElement( TitleBandTop )
	self.TitleBandTop = TitleBandTop
	
	local GameLogoShadow = nil
	
	GameLogoShadow = LUI.UIImage.new()
	GameLogoShadow.id = "GameLogoShadow"
	GameLogoShadow:SetRGBFromTable( SWATCHES.HUD.background, 0 )
	GameLogoShadow:SetAlpha( 0.9, 0 )
	GameLogoShadow:SetScale( -0.4, 0 )
	GameLogoShadow:setImage( RegisterMaterial( "hud_glow" ), 0 )
	GameLogoShadow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 634, _1080p * 1926, _1080p * 363.2, _1080p * 1216.5 )
	self:addElement( GameLogoShadow )
	self.GameLogoShadow = GameLogoShadow
	
	local GameLogo = nil
	
	GameLogo = LUI.UIImage.new()
	GameLogo.id = "GameLogo"
	GameLogo:SetAlpha( 0.9, 0 )
	GameLogo:SetScale( -0.5, 0 )
	GameLogo:setImage( RegisterMaterial( "cod_splash_logo_1" ), 0 )
	GameLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 746, _1080p * 1770, _1080p * 659.5, _1080p * 915.5 )
	self:addElement( GameLogo )
	self.GameLogo = GameLogo
	
	local CRMTitle = nil
	
	CRMTitle = MenuBuilder.BuildRegisteredType( "CRMTitle", {
		controllerIndex = f1_local1
	} )
	CRMTitle.id = "CRMTitle"
	CRMTitle:SetDataSourceThroughElement( self, nil )
	CRMTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 363.5, _1080p * 1278.5, _1080p * 112, _1080p * 172 )
	self:addElement( CRMTitle )
	self.CRMTitle = CRMTitle
	
	local CRMBody = nil
	
	CRMBody = MenuBuilder.BuildRegisteredType( "CRMBody", {
		controllerIndex = f1_local1
	} )
	CRMBody.id = "CRMBody"
	CRMBody:SetRGBFromInt( 15461355, 0 )
	CRMBody:SetDataSourceThroughElement( self, nil )
	CRMBody:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 366.5, _1080p * 937.5, _1080p * 198, _1080p * 756 )
	self:addElement( CRMBody )
	self.CRMBody = CRMBody
	
	CRMTitle:SetDataSourceThroughElement( self, nil )
	CRMBody:SetDataSourceThroughElement( self, nil )
	return self
end

MenuBuilder.registerType( "CRMFullWindow", CRMFullWindow )
LockTable( _M )
