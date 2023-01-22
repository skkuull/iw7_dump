local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RigPreview( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 365 * _1080p, 0, 310 * _1080p )
	self.id = "RigPreview"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LoadoutBlur = nil
	
	LoadoutBlur = LUI.UIBlur.new()
	LoadoutBlur.id = "LoadoutBlur"
	LoadoutBlur:SetRGBFromInt( 12566463, 0 )
	LoadoutBlur:SetBlendMode( BLEND_MODE.blend )
	LoadoutBlur:SetBlurStrength( 2.75, 0 )
	LoadoutBlur:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 80, 0, 0 )
	self:addElement( LoadoutBlur )
	self.LoadoutBlur = LoadoutBlur
	
	local SuperBacker = nil
	
	SuperBacker = LUI.UIImage.new()
	SuperBacker.id = "SuperBacker"
	SuperBacker:SetRGBFromInt( 1710618, 0 )
	SuperBacker:SetAlpha( 0.4, 0 )
	SuperBacker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 238, _1080p * 8, _1080p * 151 )
	self:addElement( SuperBacker )
	self.SuperBacker = SuperBacker
	
	local SuperBackerGradient = nil
	
	SuperBackerGradient = LUI.UIImage.new()
	SuperBackerGradient.id = "SuperBackerGradient"
	SuperBackerGradient:SetRGBFromInt( 0, 0 )
	SuperBackerGradient:SetAlpha( 0.4, 0 )
	SuperBackerGradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	SuperBackerGradient:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 238, _1080p * 8, _1080p * 151 )
	self:addElement( SuperBackerGradient )
	self.SuperBackerGradient = SuperBackerGradient
	
	local TraitBacker = nil
	
	TraitBacker = LUI.UIImage.new()
	TraitBacker.id = "TraitBacker"
	TraitBacker:SetRGBFromInt( 0, 0 )
	TraitBacker:SetAlpha( 0.4, 0 )
	TraitBacker:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 8, _1080p * 238, _1080p * -151, _1080p * -8 )
	self:addElement( TraitBacker )
	self.TraitBacker = TraitBacker
	
	local TraitBackerGradient = nil
	
	TraitBackerGradient = LUI.UIImage.new()
	TraitBackerGradient.id = "TraitBackerGradient"
	TraitBackerGradient:SetRGBFromInt( 0, 0 )
	TraitBackerGradient:SetAlpha( 0.4, 0 )
	TraitBackerGradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	TraitBackerGradient:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 8, _1080p * 238, _1080p * -151, _1080p * -8 )
	self:addElement( TraitBackerGradient )
	self.TraitBackerGradient = TraitBackerGradient
	
	local SuperTab = nil
	
	SuperTab = LUI.UIImage.new()
	SuperTab.id = "SuperTab"
	SuperTab:SetRGBFromInt( 14277081, 0 )
	SuperTab:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 23, _1080p * 8, _1080p * 11 )
	self:addElement( SuperTab )
	self.SuperTab = SuperTab
	
	local TraitTab = nil
	
	TraitTab = LUI.UIImage.new()
	TraitTab.id = "TraitTab"
	TraitTab:SetRGBFromInt( 14277081, 0 )
	TraitTab:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 8, _1080p * 23, _1080p * -151, _1080p * -148 )
	self:addElement( TraitTab )
	self.TraitTab = TraitTab
	
	local SuperImage = nil
	
	SuperImage = LUI.UIImage.new()
	SuperImage.id = "SuperImage"
	SuperImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 51.5, _1080p * 194.5, _1080p * 8, _1080p * 151 )
	SuperImage:SubscribeToModelThroughElement( self, "icon", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.icon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			SuperImage:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( SuperImage )
	self.SuperImage = SuperImage
	
	local TraitImage = nil
	
	TraitImage = LUI.UIImage.new()
	TraitImage.id = "TraitImage"
	TraitImage:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 51.5, _1080p * 194.5, _1080p * -151, _1080p * -8 )
	TraitImage:SubscribeToModelThroughElement( self, "archetypePerk.fullImage", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.archetypePerk.fullImage:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			TraitImage:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( TraitImage )
	self.TraitImage = TraitImage
	
	local SuperName = nil
	
	SuperName = LUI.UIStyledText.new()
	SuperName.id = "SuperName"
	SuperName:SetFontSize( 18 * _1080p )
	SuperName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SuperName:SetAlignment( LUI.Alignment.Left )
	SuperName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 251.01, _1080p * 437.01, _1080p * 8, _1080p * 26 )
	SuperName:SubscribeToModelThroughElement( self, "superName", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.superName:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			SuperName:setText( f4_local0, 0 )
		end
	end )
	self:addElement( SuperName )
	self.SuperName = SuperName
	
	local TraitName = nil
	
	TraitName = LUI.UIStyledText.new()
	TraitName.id = "TraitName"
	TraitName:SetFontSize( 18 * _1080p )
	TraitName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TraitName:SetAlignment( LUI.Alignment.Left )
	TraitName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 251.01, _1080p * 437.01, _1080p * 159, _1080p * 177 )
	TraitName:SubscribeToModelThroughElement( self, "archetypePerk.name", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.archetypePerk.name:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			TraitName:setText( f5_local0, 0 )
		end
	end )
	self:addElement( TraitName )
	self.TraitName = TraitName
	
	return self
end

MenuBuilder.registerType( "RigPreview", RigPreview )
LockTable( _M )
