local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function fortuneCardSlotWidget( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 860 * _1080p, 0, 225 * _1080p )
	self.id = "fortuneCardSlotWidget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local fortuneCardSlotButtton = nil
	
	fortuneCardSlotButtton = MenuBuilder.BuildRegisteredType( "fortuneCardSlotButtton", {
		controllerIndex = f1_local1
	} )
	fortuneCardSlotButtton.id = "fortuneCardSlotButtton"
	fortuneCardSlotButtton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 165, 0, _1080p * 221.5 )
	fortuneCardSlotButtton:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot1Backing:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot1Backing:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			fortuneCardSlotButtton.base:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	fortuneCardSlotButtton:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot1Name:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot1Name:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			fortuneCardSlotButtton.CardName:setText( f3_local0, 0 )
		end
	end )
	fortuneCardSlotButtton:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot1Icon:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot1Icon:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			fortuneCardSlotButtton.CardIcon:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( fortuneCardSlotButtton )
	self.fortuneCardSlotButtton = fortuneCardSlotButtton
	
	local fortuneCardSlotButttonCopy0 = nil
	
	fortuneCardSlotButttonCopy0 = MenuBuilder.BuildRegisteredType( "fortuneCardSlotButtton", {
		controllerIndex = f1_local1
	} )
	fortuneCardSlotButttonCopy0.id = "fortuneCardSlotButttonCopy0"
	fortuneCardSlotButttonCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 173, _1080p * 338, 0, _1080p * 221.5 )
	fortuneCardSlotButttonCopy0:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot2Backing:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot2Backing:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			fortuneCardSlotButttonCopy0.base:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	fortuneCardSlotButttonCopy0:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot2Name:GetModel( f1_local1 ), function ()
		local f6_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot2Name:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			fortuneCardSlotButttonCopy0.CardName:setText( f6_local0, 0 )
		end
	end )
	fortuneCardSlotButttonCopy0:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot2Icon:GetModel( f1_local1 ), function ()
		local f7_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot2Icon:GetValue( f1_local1 )
		if f7_local0 ~= nil then
			fortuneCardSlotButttonCopy0.CardIcon:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	self:addElement( fortuneCardSlotButttonCopy0 )
	self.fortuneCardSlotButttonCopy0 = fortuneCardSlotButttonCopy0
	
	local fortuneCardSlotButttonCopy1 = nil
	
	fortuneCardSlotButttonCopy1 = MenuBuilder.BuildRegisteredType( "fortuneCardSlotButtton", {
		controllerIndex = f1_local1
	} )
	fortuneCardSlotButttonCopy1.id = "fortuneCardSlotButttonCopy1"
	fortuneCardSlotButttonCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 346, _1080p * 511, 0, _1080p * 221.5 )
	fortuneCardSlotButttonCopy1:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot3Backing:GetModel( f1_local1 ), function ()
		local f8_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot3Backing:GetValue( f1_local1 )
		if f8_local0 ~= nil then
			fortuneCardSlotButttonCopy1.base:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	fortuneCardSlotButttonCopy1:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot3Name:GetModel( f1_local1 ), function ()
		local f9_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot3Name:GetValue( f1_local1 )
		if f9_local0 ~= nil then
			fortuneCardSlotButttonCopy1.CardName:setText( f9_local0, 0 )
		end
	end )
	fortuneCardSlotButttonCopy1:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot3Icon:GetModel( f1_local1 ), function ()
		local f10_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot3Icon:GetValue( f1_local1 )
		if f10_local0 ~= nil then
			fortuneCardSlotButttonCopy1.CardIcon:setImage( RegisterMaterial( f10_local0 ), 0 )
		end
	end )
	self:addElement( fortuneCardSlotButttonCopy1 )
	self.fortuneCardSlotButttonCopy1 = fortuneCardSlotButttonCopy1
	
	local fortuneCardSlotButttonCopy2 = nil
	
	fortuneCardSlotButttonCopy2 = MenuBuilder.BuildRegisteredType( "fortuneCardSlotButtton", {
		controllerIndex = f1_local1
	} )
	fortuneCardSlotButttonCopy2.id = "fortuneCardSlotButttonCopy2"
	fortuneCardSlotButttonCopy2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 518, _1080p * 683, 0, _1080p * 221.5 )
	fortuneCardSlotButttonCopy2:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot4Backing:GetModel( f1_local1 ), function ()
		local f11_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot4Backing:GetValue( f1_local1 )
		if f11_local0 ~= nil then
			fortuneCardSlotButttonCopy2.base:setImage( RegisterMaterial( f11_local0 ), 0 )
		end
	end )
	fortuneCardSlotButttonCopy2:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot4Name:GetModel( f1_local1 ), function ()
		local f12_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot4Name:GetValue( f1_local1 )
		if f12_local0 ~= nil then
			fortuneCardSlotButttonCopy2.CardName:setText( f12_local0, 0 )
		end
	end )
	fortuneCardSlotButttonCopy2:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot4Icon:GetModel( f1_local1 ), function ()
		local f13_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot4Icon:GetValue( f1_local1 )
		if f13_local0 ~= nil then
			fortuneCardSlotButttonCopy2.CardIcon:setImage( RegisterMaterial( f13_local0 ), 0 )
		end
	end )
	self:addElement( fortuneCardSlotButttonCopy2 )
	self.fortuneCardSlotButttonCopy2 = fortuneCardSlotButttonCopy2
	
	local fortuneCardSlotButttonCopy3 = nil
	
	fortuneCardSlotButttonCopy3 = MenuBuilder.BuildRegisteredType( "fortuneCardSlotButtton", {
		controllerIndex = f1_local1
	} )
	fortuneCardSlotButttonCopy3.id = "fortuneCardSlotButttonCopy3"
	fortuneCardSlotButttonCopy3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 691, _1080p * 856, 0, _1080p * 221.5 )
	fortuneCardSlotButttonCopy3:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot5Backing:GetModel( f1_local1 ), function ()
		local f14_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot5Backing:GetValue( f1_local1 )
		if f14_local0 ~= nil then
			fortuneCardSlotButttonCopy3.base:setImage( RegisterMaterial( f14_local0 ), 0 )
		end
	end )
	fortuneCardSlotButttonCopy3:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot5Name:GetModel( f1_local1 ), function ()
		local f15_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot5Name:GetValue( f1_local1 )
		if f15_local0 ~= nil then
			fortuneCardSlotButttonCopy3.CardName:setText( f15_local0, 0 )
		end
	end )
	fortuneCardSlotButttonCopy3:SubscribeToModel( DataSources.frontEnd.CP.fortuneCards.cardSlot5Icon:GetModel( f1_local1 ), function ()
		local f16_local0 = DataSources.frontEnd.CP.fortuneCards.cardSlot5Icon:GetValue( f1_local1 )
		if f16_local0 ~= nil then
			fortuneCardSlotButttonCopy3.CardIcon:setImage( RegisterMaterial( f16_local0 ), 0 )
		end
	end )
	self:addElement( fortuneCardSlotButttonCopy3 )
	self.fortuneCardSlotButttonCopy3 = fortuneCardSlotButttonCopy3
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		fortuneCardSlotButttonCopy2:RegisterAnimationSequence( "card4Unlocked", {
			{
				function ()
					return self.fortuneCardSlotButttonCopy2.CardName:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.card4Unlocked = function ()
			fortuneCardSlotButttonCopy2:AnimateSequence( "card4Unlocked" )
		end
		
		fortuneCardSlotButttonCopy2:RegisterAnimationSequence( "card4Locked", {
			{
				function ()
					return self.fortuneCardSlotButttonCopy2.CardName:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.card4Locked = function ()
			fortuneCardSlotButttonCopy2:AnimateSequence( "card4Locked" )
		end
		
		fortuneCardSlotButttonCopy3:RegisterAnimationSequence( "card5Locked", {
			{
				function ()
					return self.fortuneCardSlotButttonCopy3.CardName:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.card5Locked = function ()
			fortuneCardSlotButttonCopy3:AnimateSequence( "card5Locked" )
		end
		
		fortuneCardSlotButttonCopy3:RegisterAnimationSequence( "card5Unlocked", {
			{
				function ()
					return self.fortuneCardSlotButttonCopy3.CardName:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.card5Unlocked = function ()
			fortuneCardSlotButttonCopy3:AnimateSequence( "card5Unlocked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	fortuneCardSlotButtton:addEventHandler( "button_action", function ( f27_arg0, f27_arg1 )
		ACTIONS.OpenCardOneSelectMenu( self, self.fortuneCardSlotButtton, f27_arg1.controller or f1_local1 )
	end )
	fortuneCardSlotButttonCopy0:addEventHandler( "button_action", function ( f28_arg0, f28_arg1 )
		ACTIONS.OpenCardTwoSelectMenu( self, self.fortuneCardSlotButttonCopy0, f28_arg1.controller or f1_local1 )
	end )
	fortuneCardSlotButttonCopy1:addEventHandler( "button_action", function ( f29_arg0, f29_arg1 )
		ACTIONS.OpenCardThreeSelectMenu( self, self.fortuneCardSlotButttonCopy1, f29_arg1.controller or f1_local1 )
	end )
	fortuneCardSlotButttonCopy2:addEventHandler( "button_action", function ( f30_arg0, f30_arg1 )
		ACTIONS.OpenCardFourSelectMenu( self, self.fortuneCardSlotButttonCopy2, f30_arg1.controller or f1_local1 )
	end )
	fortuneCardSlotButttonCopy3:addEventHandler( "button_action", function ( f31_arg0, f31_arg1 )
		ACTIONS.OpenCardFiveSelectMenu( self, self.fortuneCardSlotButttonCopy3, f31_arg1.controller or f1_local1 )
	end )
	if CONDITIONS.IsFateCardSlotUnlocked( f1_local1, "fate_card_slot_5" ) then
		ACTIONS.AnimateSequence( self, "card5Unlocked" )
	end
	if not CONDITIONS.IsFateCardSlotUnlocked( f1_local1, "fate_card_slot_5" ) then
		ACTIONS.AnimateSequence( self, "card5Locked" )
	end
	if CONDITIONS.IsFateCardSlotUnlocked( f1_local1, "fate_card_slot_4" ) then
		ACTIONS.AnimateSequence( self, "card4Unlocked" )
	end
	if not CONDITIONS.IsFateCardSlotUnlocked( f1_local1, "fate_card_slot_4" ) then
		ACTIONS.AnimateSequence( self, "card4Locked" )
	end
	return self
end

MenuBuilder.registerType( "fortuneCardSlotWidget", fortuneCardSlotWidget )
LockTable( _M )
