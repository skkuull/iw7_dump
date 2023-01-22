local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Card1 )
	assert( f1_arg0.Card2 )
	assert( f1_arg0.Card3 )
	f1_arg0.Card1:SetButtonDisabled( true )
	f1_arg0.Card2:SetButtonDisabled( true )
	f1_arg0.Card3:SetButtonDisabled( true )
	f1_arg0.Card1:SetFocusable( false )
	f1_arg0.Card2:SetFocusable( false )
	f1_arg0.Card3:SetFocusable( false )
end

function FAFCardsDisplay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 354 * _1080p, 0, 265 * _1080p )
	self.id = "FAFCardsDisplay"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Card3 = nil
	
	Card3 = MenuBuilder.BuildRegisteredType( "fortuneCardSlotButtton", {
		controllerIndex = f2_local1
	} )
	Card3.id = "Card3"
	Card3:SetZRotation( 14, 0 )
	Card3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 29, _1080p * 194, _1080p * 17.75, _1080p * 239.25 )
	Card3:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot1Backing:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot1Backing:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			Card3.base:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	Card3:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot1Icon:GetModel( f2_local1 ), function ()
		local f4_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot1Icon:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			Card3.CardIcon:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	Card3:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot1Name:GetModel( f2_local1 ), function ()
		local f5_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot1Name:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			Card3.CardName:setText( f5_local0, 0 )
		end
	end )
	self:addElement( Card3 )
	self.Card3 = Card3
	
	local Card2 = nil
	
	Card2 = MenuBuilder.BuildRegisteredType( "fortuneCardSlotButtton", {
		controllerIndex = f2_local1
	} )
	Card2.id = "Card2"
	Card2:SetZRotation( -14, 0 )
	Card2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 169, _1080p * 334, _1080p * 17.75, _1080p * 239.25 )
	Card2:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot3Backing:GetModel( f2_local1 ), function ()
		local f6_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot3Backing:GetValue( f2_local1 )
		if f6_local0 ~= nil then
			Card2.base:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	Card2:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot3Icon:GetModel( f2_local1 ), function ()
		local f7_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot3Icon:GetValue( f2_local1 )
		if f7_local0 ~= nil then
			Card2.CardIcon:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	Card2:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot3Name:GetModel( f2_local1 ), function ()
		local f8_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot3Name:GetValue( f2_local1 )
		if f8_local0 ~= nil then
			Card2.CardName:setText( f8_local0, 0 )
		end
	end )
	self:addElement( Card2 )
	self.Card2 = Card2
	
	local Card1 = nil
	
	Card1 = MenuBuilder.BuildRegisteredType( "fortuneCardSlotButtton", {
		controllerIndex = f2_local1
	} )
	Card1.id = "Card1"
	Card1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96.5, _1080p * 261.5, _1080p * 38.25, _1080p * 259.75 )
	Card1:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot2Backing:GetModel( f2_local1 ), function ()
		local f9_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot2Backing:GetValue( f2_local1 )
		if f9_local0 ~= nil then
			Card1.base:setImage( RegisterMaterial( f9_local0 ), 0 )
		end
	end )
	Card1:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot2Icon:GetModel( f2_local1 ), function ()
		local f10_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot2Icon:GetValue( f2_local1 )
		if f10_local0 ~= nil then
			Card1.CardIcon:setImage( RegisterMaterial( f10_local0 ), 0 )
		end
	end )
	Card1:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot2Name:GetModel( f2_local1 ), function ()
		local f11_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot2Name:GetValue( f2_local1 )
		if f11_local0 ~= nil then
			Card1.CardName:setText( f11_local0, 0 )
		end
	end )
	self:addElement( Card1 )
	self.Card1 = Card1
	
	Card3:addEventHandler( "button_action", function ( f12_arg0, f12_arg1 )
		ACTIONS.OpenCardOneSelectMenu( self, self.Card3, f12_arg1.controller or f2_local1 )
	end )
	Card2:addEventHandler( "button_action", function ( f13_arg0, f13_arg1 )
		ACTIONS.OpenCardThreeSelectMenu( self, self.Card2, f13_arg1.controller or f2_local1 )
	end )
	Card1:addEventHandler( "button_action", function ( f14_arg0, f14_arg1 )
		ACTIONS.OpenCardTwoSelectMenu( self, self.Card1, f14_arg1.controller or f2_local1 )
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "FAFCardsDisplay", FAFCardsDisplay )
LockTable( _M )
