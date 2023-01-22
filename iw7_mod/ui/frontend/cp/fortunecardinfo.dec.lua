local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function fortuneCardInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 173 * _1080p, 0, 470 * _1080p )
	self.id = "fortuneCardInfo"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CardBacking = nil
	
	CardBacking = LUI.UIImage.new()
	CardBacking.id = "CardBacking"
	CardBacking:SetScale( -0.29, 0 )
	CardBacking:SetUseAA( true )
	CardBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -42.38, _1080p * 213.62, _1080p * -71.68, _1080p * 440.32 )
	CardBacking:SubscribeToModelThroughElement( self, "backing", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.backing:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			CardBacking:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( CardBacking )
	self.CardBacking = CardBacking
	
	local CardIcon = nil
	
	CardIcon = LUI.UIImage.new()
	CardIcon.id = "CardIcon"
	CardIcon:SetScale( -0.07, 0 )
	CardIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21.62, _1080p * 149.62, _1080p * 52.59, _1080p * 180.59 )
	CardIcon:SubscribeToModelThroughElement( self, "icon", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.icon:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			CardIcon:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( CardIcon )
	self.CardIcon = CardIcon
	
	local CardName = nil
	
	CardName = LUI.UIText.new()
	CardName.id = "CardName"
	CardName:SetRGBFromInt( 16777215, 0 )
	CardName:SetFontSize( 20 * _1080p )
	CardName:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	CardName:SetAlignment( LUI.Alignment.Center )
	CardName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12.5, _1080p * 160.74, _1080p * 11.5, _1080p * 31.5 )
	CardName:SubscribeToModelThroughElement( self, "name", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.name:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			CardName:setText( ToUpperCase( LocalizeString( f4_local0 ) ), 0 )
		end
	end )
	self:addElement( CardName )
	self.CardName = CardName
	
	local Description = nil
	
	Description = LUI.UIStyledText.new()
	Description.id = "Description"
	Description:SetFontSize( 20 * _1080p )
	Description:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Description:SetAlignment( LUI.Alignment.Center )
	Description:SetStartupDelay( 1000 )
	Description:SetLineHoldTime( 400 )
	Description:SetAnimMoveTime( 150 )
	Description:SetEndDelay( 1000 )
	Description:SetCrossfadeTime( 400 )
	Description:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	Description:SetMaxVisibleLines( 4 )
	Description:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 173, _1080p * 249.5, _1080p * 269.5 )
	Description:SubscribeToModelThroughElement( self, "desc", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.desc:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			Description:setText( LocalizeString( f5_local0 ), 0 )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local RarityIcon = nil
	
	RarityIcon = LUI.UIImage.new()
	RarityIcon.id = "RarityIcon"
	RarityIcon:SetScale( -0.38, 0 )
	RarityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21.62, _1080p * 149.62, _1080p * 351.68, _1080p * 479.68 )
	RarityIcon:SubscribeToModelThroughElement( self, "rarity", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.rarity:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			RarityIcon:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( RarityIcon )
	self.RarityIcon = RarityIcon
	
	local numOwnedBox = nil
	
	numOwnedBox = LUI.UIImage.new()
	numOwnedBox.id = "numOwnedBox"
	numOwnedBox:SetRGBFromInt( 8421504, 0 )
	numOwnedBox:setImage( RegisterMaterial( "zm_wc_fortune_owned_box" ), 0 )
	numOwnedBox:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 173, _1080p * 184.32, _1080p * 234.59 )
	self:addElement( numOwnedBox )
	self.numOwnedBox = numOwnedBox
	
	local numOwned = nil
	
	numOwned = LUI.UIText.new()
	numOwned.id = "numOwned"
	numOwned:SetFontSize( 45 * _1080p )
	numOwned:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	numOwned:SetAlignment( LUI.Alignment.Center )
	numOwned:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 173, _1080p * 190.32, _1080p * 235.32 )
	numOwned:SubscribeToModelThroughElement( self, "numOwned", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.numOwned:GetValue( f1_local1 )
		if f7_local0 ~= nil then
			numOwned:setText( f7_local0, 0 )
		end
	end )
	self:addElement( numOwned )
	self.numOwned = numOwned
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RarityIcon:RegisterAnimationSequence( "common", {
			{
				function ()
					return self.RarityIcon:SetRGBFromTable( SWATCHES.itemRarity.quality0, 0 )
				end
			}
		} )
		self._sequences.common = function ()
			RarityIcon:AnimateSequence( "common" )
		end
		
		RarityIcon:RegisterAnimationSequence( "rare", {
			{
				function ()
					return self.RarityIcon:SetRGBFromTable( SWATCHES.itemRarity.quality1, 0 )
				end
			}
		} )
		self._sequences.rare = function ()
			RarityIcon:AnimateSequence( "rare" )
		end
		
		RarityIcon:RegisterAnimationSequence( "legendary", {
			{
				function ()
					return self.RarityIcon:SetRGBFromTable( SWATCHES.itemRarity.quality2, 0 )
				end
			}
		} )
		self._sequences.legendary = function ()
			RarityIcon:AnimateSequence( "legendary" )
		end
		
		RarityIcon:RegisterAnimationSequence( "epic", {
			{
				function ()
					return self.RarityIcon:SetRGBFromTable( SWATCHES.itemRarity.quality3, 0 )
				end
			}
		} )
		self._sequences.epic = function ()
			RarityIcon:AnimateSequence( "epic" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "rarity", function ()
		local f18_local0 = self:GetDataSource()
		if f18_local0.rarity:GetValue( f1_local1 ) ~= nil then
			f18_local0 = self:GetDataSource()
			if f18_local0.rarity:GetValue( f1_local1 ) == "icon_item_quality_1" then
				ACTIONS.AnimateSequence( self, "common" )
			end
		end
		f18_local0 = self:GetDataSource()
		if f18_local0.rarity:GetValue( f1_local1 ) ~= nil then
			f18_local0 = self:GetDataSource()
			if f18_local0.rarity:GetValue( f1_local1 ) == "icon_item_quality_2" then
				ACTIONS.AnimateSequence( self, "rare" )
			end
		end
		f18_local0 = self:GetDataSource()
		if f18_local0.rarity:GetValue( f1_local1 ) ~= nil then
			f18_local0 = self:GetDataSource()
			if f18_local0.rarity:GetValue( f1_local1 ) == "icon_item_quality_3" then
				ACTIONS.AnimateSequence( self, "legendary" )
			end
		end
		f18_local0 = self:GetDataSource()
		if f18_local0.rarity:GetValue( f1_local1 ) ~= nil then
			f18_local0 = self:GetDataSource()
			if f18_local0.rarity:GetValue( f1_local1 ) == "icon_item_quality_4" then
				ACTIONS.AnimateSequence( self, "epic" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "fortuneCardInfo", fortuneCardInfo )
LockTable( _M )
