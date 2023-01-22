local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f1_arg0:GetDataSource()
		if f2_local0.isFirstParty then
			if Engine.IsPS4() and Commerce.GetPS4Region() == 8 then
				Commerce.Purchase( f1_arg1, f2_local0.index, true )
			else
				Commerce.Purchase( f1_arg1, f2_local0.index, false )
			end
		elseif f2_local0.owned:GetValue( f1_arg1 ) then
			LUI.FlowManager.RequestPopupMenu( f1_arg0, "PopupOK", true, f1_arg1, false, {
				message = Engine.Localize( "LUA_MENU_MP_ALREADY_OWN_ITEM" )
			} )
		else
			Loot.PurchaseItem( f1_arg1, f2_local0.index, true )
		end
	end )
	f1_arg0:addEventHandler( "gain_focus", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg1.controller or f1_arg1
		local f3_local1 = f1_arg0:GetDataSource()
		if f3_local1 ~= nil then
			Engine.StoreItemViewBegan( f3_local0, f3_local1.index )
		end
	end )
	f1_arg0:addEventHandler( "lose_focus", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg1.controller or f1_arg1
		local f4_local1 = f1_arg0:GetDataSource()
		if f4_local1 ~= nil then
			Engine.StoreItemViewEnded( f4_local0, f4_local1.index )
		end
	end )
end

function StoreItemButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 200 * _1080p )
	self.id = "StoreItemButton"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SubscribeToModelThroughElement( self, "image", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.image:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			Background:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( Background )
	self.Background = Background
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 4,
		borderThicknessRight = _1080p * 4,
		borderThicknessTop = _1080p * 4,
		borderThicknessBottom = _1080p * 4
	} )
	Border.id = "Border"
	Border:SetRGBFromInt( 0, 0 )
	Border:SetBorderThicknessLeft( _1080p * 4, 0 )
	Border:SetBorderThicknessRight( _1080p * 4, 0 )
	Border:SetBorderThicknessTop( _1080p * 4, 0 )
	Border:SetBorderThicknessBottom( _1080p * 4, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local ItemName = nil
	
	ItemName = LUI.UIText.new()
	ItemName.id = "ItemName"
	ItemName:SetFontSize( 36 * _1080p )
	ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ItemName:SetAlignment( LUI.Alignment.Center )
	ItemName:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 12.97, _1080p * -10, _1080p * 33, _1080p * 69 )
	ItemName:SubscribeToModelThroughElement( self, "name", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.name:GetValue( f5_local1 )
		if f7_local0 ~= nil then
			ItemName:setText( f7_local0, 0 )
		end
	end )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	local Price = nil
	
	Price = LUI.UIText.new()
	Price.id = "Price"
	Price:SetFontSize( 45 * _1080p )
	Price:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Price:SetAlignment( LUI.Alignment.Left )
	Price:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 12.97, _1080p * 137.97, _1080p * -58.59, _1080p * -13.59 )
	Price:SubscribeToModelThroughElement( self, "price", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.price:GetValue( f5_local1 )
		if f8_local0 ~= nil then
			Price:setText( f8_local0, 0 )
		end
	end )
	self:addElement( Price )
	self.Price = Price
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Border:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Border:SetRGBFromInt( 13079820, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Border:AnimateSequence( "ButtonOver" )
		end
		
		Border:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Border:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Border:AnimateSequence( "ButtonUp" )
		end
		
		self._sequences.Available = function ()
			
		end
		
		self._sequences.Unavailable = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f17_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local0( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "StoreItemButton", StoreItemButton )
LockTable( _M )
