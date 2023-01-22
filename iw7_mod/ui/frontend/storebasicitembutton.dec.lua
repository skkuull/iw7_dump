local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f1_arg0:GetDataSource()
		if not f2_local0 then
			return true
		elseif f2_local0.isFirstParty:GetValue( f1_arg1 ) then
			if f2_local0.owned:GetValue( f1_arg1 ) == false or false == Engine.IsPS4() then
				if Engine.IsPS4() and (Commerce.GetPS4Region() == 8 or f2_local0.should_exchange:GetValue( f1_arg1 ) == "0") then
					Commerce.Purchase( f1_arg1, f2_local0.index:GetValue( f1_arg1 ), true )
				else
					Commerce.Purchase( f1_arg1, f2_local0.index:GetValue( f1_arg1 ), false )
				end
			end
		else
			local f2_local1 = tonumber( f2_local0.price:GetValue( f1_arg1 ) )
			local f2_local2 = Commerce.GetCurrency( f1_arg1, 20 )
			local f2_local3 = f2_local0.index:GetValue( f1_arg1 )
			if Loot.IsOwned( f1_arg1, f2_local3 ) > 0 then
				LUI.FlowManager.RequestPopupMenu( f1_arg0, "PopupOK", true, f1_arg1, false, {
					message = Engine.Localize( "LUA_MENU_MP_ALREADY_OWN_ITEM" )
				} )
			elseif f2_local2 < f2_local1 then
				LUI.FlowManager.RequestPopupMenu( f1_arg0, "PopupOK", true, f1_arg1, false, {
					message = Engine.Localize( "LUA_MENU_MP_PURCHASE_NOT_ENOUGH_CP" )
				} )
			else
				LUI.FlowManager.RequestPopupMenu( f1_arg0, "DLCStoreYesNoPopup", true, f1_arg1, false, {
					controllerIndex = f1_arg1,
					cost = f2_local1,
					itemID = f2_local3
				} )
			end
		end
	end )
	f1_arg0:addEventHandler( "loot_item_transaction_complete", function ( f3_arg0, f3_arg1 )
		LUI.FlowManager.RequestLeaveMenuByName( "live_dialog_text_box" )
		LUI.FlowManager.RequestPopupMenu( f1_arg0, "PopupOK", true, f1_arg1, false, {
			message = Engine.Localize( "LUA_MENU_MP_DLC_PURCHASED" )
		} )
		return true
	end )
	f1_arg0:addEventHandler( "loot_item_transaction_error", function ( f4_arg0, f4_arg1 )
		LUI.FlowManager.RequestLeaveMenuByName( "live_dialog_text_box" )
		LUI.FlowManager.RequestPopupMenu( f1_arg0, "PopupOK", true, f1_arg1, false, {
			message = Engine.Localize( "LUA_MENU_MP_DLC_PURCHASE_ERROR" )
		} )
		return true
	end )
	f1_arg0:addEventHandler( "gain_focus", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg1.controller or f1_arg1
		local f5_local1 = f1_arg0:GetDataSource()
		if f5_local1 ~= nil then
			Engine.StoreItemViewBegan( f5_local0, f5_local1.index:GetValue( f5_local0 ) )
			if Engine.IsPS4() then
				if f5_local1.isFirstParty:GetValue( f5_local0 ) then
					Engine.Exec( "showStoreIcon" )
				else
					Engine.Exec( "hideStoreIcon" )
				end
			end
		end
	end )
	f1_arg0:addEventHandler( "lose_focus", function ( f6_arg0, f6_arg1 )
		local f6_local0 = f6_arg1.controller or f1_arg1
		local f6_local1 = f1_arg0:GetDataSource()
		if f6_local1 ~= nil then
			Engine.StoreItemViewEnded( f6_local0, f6_local1.index:GetValue( f6_local0 ) )
		end
	end )
	f1_arg0:addEventHandler( "button_over", function ( f7_arg0, f7_arg1 )
		local f7_local0 = f1_arg0:GetDataSource()
		if f7_local0 and f7_local0.name then
			local f7_local1 = f7_local0.name:GetValue( f1_arg1 )
			if f7_local1 ~= nil and f1_arg0.Title then
				f1_arg0.Title:setText( "", 0 )
				f1_arg0.Title:setText( f7_local1, 0 )
			end
		end
	end )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "owned", function ()
		local f8_local0 = f1_arg0:GetDataSource()
		f8_local0 = f8_local0.owned:GetValue( f1_arg1 )
		if f8_local0 ~= nil then
			f1_arg0.Purchased:SetAlpha( 0, 0 )
			if f8_local0 == true then
				f1_arg0.Purchased:SetAlpha( 1, 0 )
			end
		end
	end )
end

function StoreBasicItemButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 652 * _1080p, 0, 326 * _1080p )
	self.id = "StoreBasicItemButton"
	self._animationSets = {}
	self._sequences = {}
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	local f9_local2 = self
	self:setUseStencil( true )
	local BackgroundFill = nil
	
	BackgroundFill = LUI.UIImage.new()
	BackgroundFill.id = "BackgroundFill"
	BackgroundFill:SetRGBFromInt( 0, 0 )
	self:addElement( BackgroundFill )
	self.BackgroundFill = BackgroundFill
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SubscribeToModelThroughElement( self, "image", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.image:GetValue( f9_local1 )
		if f10_local0 ~= nil then
			Image:setImage( RegisterMaterial( f10_local0 ), 0 )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local Tint = nil
	
	Tint = LUI.UIImage.new()
	Tint.id = "Tint"
	Tint:SetRGBFromTable( SWATCHES.CAC.button, 0 )
	Tint:SetAlpha( 0.4, 0 )
	self:addElement( Tint )
	self.Tint = Tint
	
	local TickBR = nil
	
	TickBR = LUI.UIImage.new()
	TickBR.id = "TickBR"
	TickBR:SetAlpha( 0.5, 0 )
	TickBR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -21, _1080p * -7, _1080p * -10, _1080p * -7 )
	self:addElement( TickBR )
	self.TickBR = TickBR
	
	local TickBL = nil
	
	TickBL = LUI.UIImage.new()
	TickBL.id = "TickBL"
	TickBL:SetAlpha( 0.5, 0 )
	TickBL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 7, _1080p * 21, _1080p * -10, _1080p * -7 )
	self:addElement( TickBL )
	self.TickBL = TickBL
	
	local TickTR = nil
	
	TickTR = LUI.UIImage.new()
	TickTR.id = "TickTR"
	TickTR:SetAlpha( 0.5, 0 )
	TickTR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -21, _1080p * -7, _1080p * 7, _1080p * 10 )
	self:addElement( TickTR )
	self.TickTR = TickTR
	
	local TickTL = nil
	
	TickTL = LUI.UIImage.new()
	TickTL.id = "TickTL"
	TickTL:SetAlpha( 0.5, 0 )
	TickTL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 7, _1080p * 21, _1080p * 7, _1080p * 10 )
	self:addElement( TickTL )
	self.TickTL = TickTL
	
	local TitleBar = nil
	
	TitleBar = LUI.UIImage.new()
	TitleBar.id = "TitleBar"
	TitleBar:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	TitleBar:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 38 )
	self:addElement( TitleBar )
	self.TitleBar = TitleBar
	
	local TitleBarGradient = nil
	
	TitleBarGradient = LUI.UIImage.new()
	TitleBarGradient.id = "TitleBarGradient"
	TitleBarGradient:SetAlpha( 0.7, 0 )
	TitleBarGradient:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	TitleBarGradient:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 38 )
	self:addElement( TitleBarGradient )
	self.TitleBarGradient = TitleBarGradient
	
	local f9_local12 = nil
	if not CONDITIONS.IsArabicSKU( self ) then
		f9_local12 = LUI.UIStyledText.new()
		f9_local12.id = "Title"
		f9_local12:SetRGBFromInt( 0, 0 )
		f9_local12:SetFontSize( 26 * _1080p )
		f9_local12:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f9_local12:SetAlignment( LUI.Alignment.Left )
		f9_local12:SetOptOutRightToLeftAlignmentFlip( true )
		f9_local12:SetStartupDelay( 1000 )
		f9_local12:SetLineHoldTime( 500 )
		f9_local12:SetAnimMoveTime( 750 )
		f9_local12:SetEndDelay( 1000 )
		f9_local12:SetCrossfadeTime( 400 )
		f9_local12:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
		f9_local12:SetMaxVisibleLines( 1 )
		f9_local12:SetDecodeLetterLength( 25 )
		f9_local12:SetDecodeMaxRandChars( 3 )
		f9_local12:SetDecodeUpdatesPerLetter( 4 )
		f9_local12:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 14, _1080p * -16, _1080p * 8.5, _1080p * 34.5 )
		f9_local12:SubscribeToModelThroughElement( self, "name", function ()
			local f11_local0 = self:GetDataSource()
			f11_local0 = f11_local0.name:GetValue( f9_local1 )
			if f11_local0 ~= nil then
				f9_local12:setText( f11_local0, 0 )
			end
		end )
		self:addElement( f9_local12 )
		self.Title = f9_local12
	end
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 5,
		borderThicknessRight = _1080p * 5,
		borderThicknessTop = _1080p * 5,
		borderThicknessBottom = _1080p * 5
	} )
	Border.id = "Border"
	Border:SetRGBFromTable( SWATCHES.genericMenu.border, 0 )
	Border:SetBorderThicknessLeft( _1080p * 5, 0 )
	Border:SetBorderThicknessRight( _1080p * 5, 0 )
	Border:SetBorderThicknessTop( _1080p * 5, 0 )
	Border:SetBorderThicknessBottom( _1080p * 5, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local Purchased = nil
	
	Purchased = LUI.UIImage.new()
	Purchased.id = "Purchased"
	Purchased:setImage( RegisterMaterial( "icon_new_item_purchased" ), 0 )
	Purchased:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -39, _1080p * -7, _1080p * -42, _1080p * -10 )
	self:addElement( Purchased )
	self.Purchased = Purchased
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Tint:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Tint:SetAlpha( 0, 0 )
				end
			}
		} )
		TitleBar:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.TitleBar:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TitleBar:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -750, 0, _1080p * 38, 0 )
				end,
				function ()
					return self.TitleBar:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 38, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		TitleBarGradient:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.TitleBarGradient:SetAlpha( 0.7, 0 )
				end
			},
			{
				function ()
					return self.TitleBarGradient:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -750, 0, _1080p * 38, 0 )
				end,
				function ()
					return self.TitleBarGradient:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 38, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		if not CONDITIONS.IsArabicSKU( self ) then
			f9_local12:RegisterAnimationSequence( "ButtonOver", {
				{
					function ()
						return self.Title:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		Border:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Border:SetRGBFromTable( SWATCHES.CAC.equippedPerkTic, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Tint:AnimateSequence( "ButtonOver" )
			TitleBar:AnimateSequence( "ButtonOver" )
			TitleBarGradient:AnimateSequence( "ButtonOver" )
			if not CONDITIONS.IsArabicSKU( self ) then
				f9_local12:AnimateSequence( "ButtonOver" )
			end
			Border:AnimateSequence( "ButtonOver" )
		end
		
		Tint:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Tint:SetAlpha( 0.4, 0 )
				end
			}
		} )
		TitleBar:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.TitleBar:SetAlpha( 0, 0 )
				end
			}
		} )
		TitleBarGradient:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.TitleBarGradient:SetAlpha( 0, 0 )
				end
			}
		} )
		if not CONDITIONS.IsArabicSKU( self ) then
			f9_local12:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.Title:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		Border:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Border:SetRGBFromTable( SWATCHES.genericMenu.border, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Tint:AnimateSequence( "ButtonUp" )
			TitleBar:AnimateSequence( "ButtonUp" )
			TitleBarGradient:AnimateSequence( "ButtonUp" )
			if not CONDITIONS.IsArabicSKU( self ) then
				f9_local12:AnimateSequence( "ButtonUp" )
			end
			Border:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f30_arg0, f30_arg1 )
		local f30_local0 = f30_arg1.controller or f9_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f31_arg0, f31_arg1 )
		local f31_local0 = f31_arg1.controller or f9_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local0( self, f9_local1, controller )
	ACTIONS.AnimateSequence( self, "ButtonUp" )
	return self
end

MenuBuilder.registerType( "StoreBasicItemButton", StoreBasicItemButton )
LockTable( _M )
