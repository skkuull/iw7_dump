local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CraftingCurrencyCount( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 50 * _1080p, 0, 24 * _1080p )
	self.id = "CraftingCurrencyCount"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CurrencyLogo = nil
	
	CurrencyLogo = LUI.UIImage.new()
	CurrencyLogo.id = "CurrencyLogo"
	CurrencyLogo:setImage( RegisterMaterial( "icon_currency_keys" ), 0 )
	CurrencyLogo:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 64, _1080p * -40, _1080p * 24 )
	self:addElement( CurrencyLogo )
	self.CurrencyLogo = CurrencyLogo
	
	local CurrencyCount = nil
	
	CurrencyCount = LUI.UIText.new()
	CurrencyCount.id = "CurrencyCount"
	CurrencyCount:SetFontSize( 24 * _1080p )
	CurrencyCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CurrencyCount:SetAlignment( LUI.Alignment.Center )
	CurrencyCount:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -12, _1080p * 12 )
	CurrencyCount:SubscribeToModelThroughElement( self, nil, function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			CurrencyCount:setText( f2_local0, 0 )
		end
	end )
	self:addElement( CurrencyCount )
	self.CurrencyCount = CurrencyCount
	
	return self
end

MenuBuilder.registerType( "CraftingCurrencyCount", CraftingCurrencyCount )
LockTable( _M )
