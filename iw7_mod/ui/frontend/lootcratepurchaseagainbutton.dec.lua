local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	assert( f1_arg0.Cost )
	assert( f1_arg0.KeyIcon )
	assert( f1_arg0.PurchaseAgainLabel )
	assert( f1_arg0.RemainingCrates )
	local f1_local0 = Loot.IsOwned( f1_arg2, f1_arg1 )
	if f1_local0 > 0 then
		f1_arg0.KeyIcon:SetAlpha( 0, 0 )
		f1_arg0.Cost:setText( Engine.Localize( "LUA_MENU_MP_CONFIRM" ) )
		f1_arg0.Cost:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -70, _1080p * 70, _1080p * -80, _1080p * -50 )
		f1_arg0.PurchaseAgainLabel:setText( Engine.Localize( "LUA_MENU_MP_CLAIM_FREE" ) )
		f1_arg0.RemainingCrates:SetAlpha( 1, 0 )
		f1_arg0.RemainingCrates:setText( Engine.Localize( "LUA_MENU_MP_REMAINING_CRATES", f1_local0 ) )
		
	else
		local f1_local1, f1_local2, f1_local3 = ARMORY.GetCurrencyCostAndImageForCrate( f1_arg1, f1_arg2, f1_arg3 )
		f1_arg0.Cost:setText( f1_local1, 0 )
		f1_arg0.Cost:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -22, _1080p * 117, _1080p * -80, _1080p * -50 )
		f1_arg0.KeyIcon:setImage( RegisterMaterial( f1_local2 ), 0 )
		f1_arg0.KeyIcon:SetAlpha( 1, 0 )
		f1_arg0.RemainingCrates:SetAlpha( 0, 0 )
		f1_arg0.PurchaseAgainLabel:setText( Engine.Localize( "MP_FRONTEND_ONLY_PURCHASE_AGAIN" ) )
		return f1_local3
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.UpdatePurchaseAgain = f0_local0
end

function LootCratePurchaseAgainButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 300 * _1080p )
	self.id = "LootCratePurchaseAgainButton"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "loot_purchase_again_bg" ), 0 )
	Background:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -154, _1080p * 154, _1080p * -208, _1080p * 208 )
	self:addElement( Background )
	self.Background = Background
	
	local ButtonBackground = nil
	
	ButtonBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f3_local1
	} )
	ButtonBackground.id = "ButtonBackground"
	ButtonBackground:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 20, _1080p * -20, _1080p * -90, _1080p * -40 )
	self:addElement( ButtonBackground )
	self.ButtonBackground = ButtonBackground
	
	local PurchaseAgainLabel = nil
	
	PurchaseAgainLabel = LUI.UIStyledText.new()
	PurchaseAgainLabel.id = "PurchaseAgainLabel"
	PurchaseAgainLabel:setText( Engine.Localize( "MP_FRONTEND_ONLY_PURCHASE_AGAIN" ), 0 )
	PurchaseAgainLabel:SetFontSize( 26 * _1080p )
	PurchaseAgainLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PurchaseAgainLabel:SetAlignment( LUI.Alignment.Center )
	PurchaseAgainLabel:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -127, _1080p * -101 )
	self:addElement( PurchaseAgainLabel )
	self.PurchaseAgainLabel = PurchaseAgainLabel
	
	local Cost = nil
	
	Cost = LUI.UIStyledText.new()
	Cost.id = "Cost"
	Cost:setText( "", 0 )
	Cost:SetFontSize( 30 * _1080p )
	Cost:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Cost:SetAlignment( LUI.Alignment.Center )
	Cost:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -22, _1080p * 74, _1080p * -80, _1080p * -50 )
	self:addElement( Cost )
	self.Cost = Cost
	
	local CrateImage = nil
	
	CrateImage = LUI.UIImage.new()
	CrateImage.id = "CrateImage"
	CrateImage:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -128, _1080p * 128, _1080p * -271, _1080p * -143 )
	self:addElement( CrateImage )
	self.CrateImage = CrateImage
	
	local KeyIcon = nil
	
	KeyIcon = LUI.UIImage.new()
	KeyIcon.id = "KeyIcon"
	KeyIcon:setImage( RegisterMaterial( "currency_keys_icon" ), 0 )
	KeyIcon:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 40, _1080p * 88, _1080p * -89, _1080p * -41 )
	self:addElement( KeyIcon )
	self.KeyIcon = KeyIcon
	
	local RemainingCrates = nil
	
	RemainingCrates = LUI.UIStyledText.new()
	RemainingCrates.id = "RemainingCrates"
	RemainingCrates:SetAlpha( 0, 0 )
	RemainingCrates:setText( Engine.Localize( "LUA_MENU_MP_REMAINING_CRATES" ), 0 )
	RemainingCrates:SetFontSize( 20 * _1080p )
	RemainingCrates:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RemainingCrates:SetAlignment( LUI.Alignment.Center )
	RemainingCrates:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -7, _1080p * 13 )
	self:addElement( RemainingCrates )
	self.RemainingCrates = RemainingCrates
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Cost:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Cost:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Cost:AnimateSequence( "ButtonOver" )
		end
		
		Cost:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Cost:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Cost:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f10_arg0, f10_arg1 )
		local f10_local0 = f10_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f11_arg0, f11_arg1 )
		local f11_local0 = f11_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "LootCratePurchaseAgainButton", LootCratePurchaseAgainButton )
LockTable( _M )
