local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CRMSplitWindow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "CRMSplitWindow"
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
	
	local DarkenGradient = nil
	
	DarkenGradient = LUI.UIImage.new()
	DarkenGradient.id = "DarkenGradient"
	DarkenGradient:SetRGBFromTable( SWATCHES.genericMenu.blackBackground, 0 )
	DarkenGradient:SetAlpha( 0.75, 0 )
	DarkenGradient:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	DarkenGradient:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 316, _1080p * 1604, _1080p * 763, _1080p * 903 )
	self:addElement( DarkenGradient )
	self.DarkenGradient = DarkenGradient
	
	local BodyBackground = nil
	
	BodyBackground = LUI.UIImage.new()
	BodyBackground.id = "BodyBackground"
	BodyBackground:SetRGBFromTable( SWATCHES.genericMenu.blackBackground, 0 )
	BodyBackground:SetAlpha( 0.4, 0 )
	BodyBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 316, _1080p * 1604, _1080p * 797, _1080p * 903 )
	self:addElement( BodyBackground )
	self.BodyBackground = BodyBackground
	
	local TitleBackground = nil
	
	TitleBackground = LUI.UIImage.new()
	TitleBackground.id = "TitleBackground"
	TitleBackground:SetRGBFromTable( SWATCHES.genericMenu.blackBackground, 0 )
	TitleBackground:SetAlpha( 0.4, 0 )
	TitleBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 316, _1080p * 1604, _1080p * 103, _1080p * 208 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local CRMTitleSplitWindow0 = nil
	
	CRMTitleSplitWindow0 = MenuBuilder.BuildRegisteredType( "CRMTitleSplitWindow", {
		controllerIndex = f1_local1
	} )
	CRMTitleSplitWindow0.id = "CRMTitleSplitWindow0"
	CRMTitleSplitWindow0:SetDataSourceThroughElement( self, nil )
	CRMTitleSplitWindow0:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 340, _1080p * -340, _1080p * 125.5, _1080p * 185.5 )
	self:addElement( CRMTitleSplitWindow0 )
	self.CRMTitleSplitWindow0 = CRMTitleSplitWindow0
	
	local CRMBodySplitWindow0 = nil
	
	CRMBodySplitWindow0 = MenuBuilder.BuildRegisteredType( "CRMBodySplitWindow", {
		controllerIndex = f1_local1
	} )
	CRMBodySplitWindow0.id = "CRMBodySplitWindow0"
	CRMBodySplitWindow0:SetDataSourceThroughElement( self, nil )
	CRMBodySplitWindow0:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 380, _1080p * -380, _1080p * 805, _1080p * 903 )
	self:addElement( CRMBodySplitWindow0 )
	self.CRMBodySplitWindow0 = CRMBodySplitWindow0
	
	local YellowLineTop = nil
	
	YellowLineTop = LUI.UIImage.new()
	YellowLineTop.id = "YellowLineTop"
	YellowLineTop:SetRGBFromTable( SWATCHES.CAC.yellowLight, 0 )
	YellowLineTop:SetAlpha( 0.75, 0 )
	YellowLineTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 316, _1080p * -316, _1080p * 206, _1080p * 208 )
	self:addElement( YellowLineTop )
	self.YellowLineTop = YellowLineTop
	
	local YellowLineBot = nil
	
	YellowLineBot = LUI.UIImage.new()
	YellowLineBot.id = "YellowLineBot"
	YellowLineBot:SetRGBFromTable( SWATCHES.CAC.yellowLight, 0 )
	YellowLineBot:SetAlpha( 0.75, 0 )
	YellowLineBot:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 316, _1080p * -316, _1080p * 796, _1080p * 798 )
	self:addElement( YellowLineBot )
	self.YellowLineBot = YellowLineBot
	
	local LineTopLt = nil
	
	LineTopLt = LUI.UIImage.new()
	LineTopLt.id = "LineTopLt"
	LineTopLt:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	LineTopLt:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 316, _1080p * 330, _1080p * 205, _1080p * 210 )
	self:addElement( LineTopLt )
	self.LineTopLt = LineTopLt
	
	local LineTopRt = nil
	
	LineTopRt = LUI.UIImage.new()
	LineTopRt.id = "LineTopRt"
	LineTopRt:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	LineTopRt:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -330, _1080p * -316, _1080p * 205, _1080p * 210 )
	self:addElement( LineTopRt )
	self.LineTopRt = LineTopRt
	
	local LineBotLt = nil
	
	LineBotLt = LUI.UIImage.new()
	LineBotLt.id = "LineBotLt"
	LineBotLt:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	LineBotLt:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 316, _1080p * 330, _1080p * 794, _1080p * 799 )
	self:addElement( LineBotLt )
	self.LineBotLt = LineBotLt
	
	local LineBotRt = nil
	
	LineBotRt = LUI.UIImage.new()
	LineBotRt.id = "LineBotRt"
	LineBotRt:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	LineBotRt:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -330, _1080p * -316, _1080p * 794, _1080p * 799 )
	self:addElement( LineBotRt )
	self.LineBotRt = LineBotRt
	
	CRMTitleSplitWindow0:SetDataSourceThroughElement( self, nil )
	CRMBodySplitWindow0:SetDataSourceThroughElement( self, nil )
	return self
end

MenuBuilder.registerType( "CRMSplitWindow", CRMSplitWindow )
LockTable( _M )
