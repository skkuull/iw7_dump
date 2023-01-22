local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARUnlockItemHeader( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 100 * _1080p )
	self.id = "AARUnlockItemHeader"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetAlpha( 0.4, 0 )
	Background:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.qualityColor:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Background:SetRGBFromInt( f2_local0, 0 )
		end
	end )
	self:addElement( Background )
	self.Background = Background
	
	local TabBar = nil
	
	TabBar = LUI.UIImage.new()
	TabBar.id = "TabBar"
	TabBar:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 10, 0, 0 )
	TabBar:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.qualityColor:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			TabBar:SetRGBFromInt( f3_local0, 0 )
		end
	end )
	self:addElement( TabBar )
	self.TabBar = TabBar
	
	local CategoryText = nil
	
	CategoryText = LUI.UIText.new()
	CategoryText.id = "CategoryText"
	CategoryText:SetFontSize( 20 * _1080p )
	CategoryText:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	CategoryText:SetAlignment( LUI.Alignment.Center )
	CategoryText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 5, _1080p * 25 )
	CategoryText:SubscribeToModelThroughElement( self, "categoryName", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.categoryName:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			CategoryText:setText( f4_local0, 0 )
		end
	end )
	self:addElement( CategoryText )
	self.CategoryText = CategoryText
	
	local NameText = nil
	
	NameText = LUI.UIText.new()
	NameText.id = "NameText"
	NameText:SetFontSize( 32 * _1080p )
	NameText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	NameText:SetAlignment( LUI.Alignment.Left )
	NameText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -10, _1080p * 30, _1080p * 62 )
	NameText:SubscribeToModelThroughElement( self, "name", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.name:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			NameText:setText( f5_local0, 0 )
		end
	end )
	self:addElement( NameText )
	self.NameText = NameText
	
	local RarityText = nil
	
	RarityText = LUI.UIText.new()
	RarityText.id = "RarityText"
	RarityText:SetAlpha( 0.5, 0 )
	RarityText:setText( "ITEM RARITY", 0 )
	RarityText:SetFontSize( 22 * _1080p )
	RarityText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	RarityText:SetAlignment( LUI.Alignment.Left )
	RarityText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -10, _1080p * 57, _1080p * 79 )
	self:addElement( RarityText )
	self.RarityText = RarityText
	
	return self
end

MenuBuilder.registerType( "AARUnlockItemHeader", AARUnlockItemHeader )
LockTable( _M )
