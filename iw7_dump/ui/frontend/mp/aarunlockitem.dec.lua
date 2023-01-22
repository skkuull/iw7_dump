local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = _1080p * 350
	local f1_local1 = _1080p * 500
	f1_arg0.Contract = function ( f2_arg0 )
		f1_arg0:SetBottom( f1_local0, f2_arg0 )
		f1_arg0.XpEarned:SetAlpha( 0, f2_arg0 )
		f1_arg0.ItemDescription:SetAlpha( 0, f2_arg0 )
	end
	
	f1_arg0.Expand = function ()
		f1_arg0:SetBottom( f1_local1, 150, LUI.EASING.outBack )
		f1_arg0.XpEarned:SetAlpha( 1, 150, LUI.EASING.outBack )
		f1_arg0.ItemDescription:SetAlpha( 1, 150, LUI.EASING.outBack )
	end
	
	f1_arg0:registerEventHandler( "button_up", function ()
		f1_arg0.Contract( 100 )
	end )
	f1_arg0:registerEventHandler( "button_over", f1_arg0.Expand )
	f1_arg0.Contract( 0 )
end

function AARUnlockItem( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 500 * _1080p )
	self.id = "AARUnlockItem"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetAlpha( 0.2, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local XpEarned = nil
	
	XpEarned = MenuBuilder.BuildRegisteredType( "AARUnlockItemXpEarned", {
		controllerIndex = f5_local1
	} )
	XpEarned.id = "XpEarned"
	XpEarned:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1, _1080p * -1, _1080p * -40, 0 )
	XpEarned:SubscribeToModelThroughElement( self, "xpEarned", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.xpEarned:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			XpEarned.XPEarned:setText( f6_local0, 0 )
		end
	end )
	self:addElement( XpEarned )
	self.XpEarned = XpEarned
	
	local UnlockedItem = nil
	
	UnlockedItem = MenuBuilder.BuildRegisteredType( "AARUnlockItemImage", {
		controllerIndex = f5_local1
	} )
	UnlockedItem.id = "UnlockedItem"
	UnlockedItem:SetDataSourceThroughElement( self, nil )
	UnlockedItem:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 100, _1080p * 250 )
	self:addElement( UnlockedItem )
	self.UnlockedItem = UnlockedItem
	
	local ItemHeader = nil
	
	ItemHeader = MenuBuilder.BuildRegisteredType( "AARUnlockItemHeader", {
		controllerIndex = f5_local1
	} )
	ItemHeader.id = "ItemHeader"
	ItemHeader:SetDataSourceThroughElement( self, nil )
	ItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1, _1080p * -1, 0, _1080p * 90 )
	self:addElement( ItemHeader )
	self.ItemHeader = ItemHeader
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	self:addElement( Border )
	self.Border = Border
	
	local ItemDescription = nil
	
	ItemDescription = MenuBuilder.BuildRegisteredType( "AARUnlockItemDescription", {
		controllerIndex = f5_local1
	} )
	ItemDescription.id = "ItemDescription"
	ItemDescription:SetDataSourceThroughElement( self, nil )
	ItemDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 399, _1080p * 340, _1080p * 367 )
	self:addElement( ItemDescription )
	self.ItemDescription = ItemDescription
	
	XpEarned:addEventHandler( "menu_create", function ( f7_arg0, f7_arg1 )
		local f7_local0 = f7_arg1.controller or f5_local1
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "AARUnlockItemXpEarned0",
			sequenceName = "Hidden",
			elementPath = "AARUnlockItemXpEarned0"
		} )
	end )
	UnlockedItem:SetDataSourceThroughElement( self, nil )
	ItemHeader:SetDataSourceThroughElement( self, nil )
	ItemDescription:SetDataSourceThroughElement( self, nil )
	f0_local0( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "AARUnlockItem", AARUnlockItem )
LockTable( _M )
