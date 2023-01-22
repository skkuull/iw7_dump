local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ItemCardWeapon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "ItemCardWeapon"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local WeaponName = nil
	
	WeaponName = LUI.UIText.new()
	WeaponName.id = "WeaponName"
	WeaponName:SetFontSize( 12 * _1080p )
	WeaponName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	WeaponName:SetAlignment( LUI.Alignment.Right )
	WeaponName:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 5, _1080p * 17 )
	WeaponName:SubscribeToModelThroughElement( self, "textA", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.textA:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			WeaponName:setText( f2_local0, 0 )
		end
	end )
	self:addElement( WeaponName )
	self.WeaponName = WeaponName
	
	local WeaponImage = nil
	
	WeaponImage = LUI.UIImage.new()
	WeaponImage.id = "WeaponImage"
	WeaponImage:SetScale( -0.6, 0 )
	WeaponImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -64, _1080p * 64 )
	WeaponImage:SubscribeToModelThroughElement( self, "image", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.image:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			WeaponImage:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( WeaponImage )
	self.WeaponImage = WeaponImage
	
	local WeaponLevel = nil
	
	WeaponLevel = LUI.UIText.new()
	WeaponLevel.id = "WeaponLevel"
	WeaponLevel:SetFontSize( 12 * _1080p )
	WeaponLevel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	WeaponLevel:SetAlignment( LUI.Alignment.Right )
	WeaponLevel:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -17, _1080p * -5 )
	WeaponLevel:SubscribeToModelThroughElement( self, "textB", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.textB:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			WeaponLevel:setText( f4_local0, 0 )
		end
	end )
	self:addElement( WeaponLevel )
	self.WeaponLevel = WeaponLevel
	
	return self
end

MenuBuilder.registerType( "ItemCardWeapon", ItemCardWeapon )
LockTable( _M )
