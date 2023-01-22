local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARUnlockItemCondensed( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 350 * _1080p )
	self.id = "AARUnlockItemCondensed"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetAlpha( 0.2, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 350 )
	self:addElement( Background )
	self.Background = Background
	
	local UnlockedItem = nil
	
	UnlockedItem = MenuBuilder.BuildRegisteredType( "AARUnlockItemImage", {
		controllerIndex = f1_local1
	} )
	UnlockedItem.id = "UnlockedItem"
	UnlockedItem:SetDataSourceThroughElement( self, nil )
	UnlockedItem:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 100, _1080p * 250 )
	self:addElement( UnlockedItem )
	self.UnlockedItem = UnlockedItem
	
	local ItemHeader = nil
	
	ItemHeader = MenuBuilder.BuildRegisteredType( "AARUnlockItemHeader", {
		controllerIndex = f1_local1
	} )
	ItemHeader.id = "ItemHeader"
	ItemHeader:SetDataSourceThroughElement( self, nil )
	ItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1, _1080p * -1, 0, _1080p * 90 )
	self:addElement( ItemHeader )
	self.ItemHeader = ItemHeader
	
	UnlockedItem:SetDataSourceThroughElement( self, nil )
	ItemHeader:SetDataSourceThroughElement( self, nil )
	return self
end

MenuBuilder.registerType( "AARUnlockItemCondensed", AARUnlockItemCondensed )
LockTable( _M )
