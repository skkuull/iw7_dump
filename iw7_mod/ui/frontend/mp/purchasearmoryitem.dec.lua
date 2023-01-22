local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.armory.purchaseItem"
f0_local1 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local2 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.YesButton:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		Loot.PurchaseItem( f2_arg1, f2_arg2.lootItemID, false )
		LUI.FlowManager.RequestPopupMenu( f3_arg0, "live_dialog_text_box", true, f3_arg1.controller, true, {
			message = Engine.Localize( "LUA_MENU_MP_PURCHASING_ARMORY_ITEM" )
		} )
	end )
	f2_arg0:SetDataSource( {
		image = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".image", f2_arg2.itemImage ),
		name = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".name", f2_arg2.name ),
		currency = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".currency", f2_arg2.cost ),
		newBalance = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".newBalance", DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue( f2_arg1 ) - f2_arg2.cost )
	}, f2_arg1 )
	f2_arg0.CurrentSalvage:SetWordWrap( false )
	f2_arg0.CurrentSalvage:SubscribeToModel( DataSources.frontEnd.MP.commerce.inGameCurrency:GetModel( f2_arg1 ), function ()
		local f4_local0 = REG5:GetCurrentFont()
		local f4_local1, f4_local2, f4_local3, f4_local4 = REG5:getLocalRect()
		local f4_local5, f4_local6, f4_local7, f4_local8 = GetTextDimensions( tostring( DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue( f2_arg1 ) ), f4_local0, math.abs( f4_local4 - f4_local2 ) )
		local f4_local9 = math.ceil( math.abs( f4_local7 - f4_local5 ) )
		local f4_local10 = _1080p * 4
		local f4_local11 = _1080p * 36
		REG5:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -660 - f4_local9, _1080p * -656, _1080p * 298, _1080p * 322 )
		f2_arg0.PartsIcon:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -656 - f4_local9 - f4_local10 + f4_local11, _1080p * -656 - f4_local9 - f4_local10, _1080p * 292, _1080p * 328 )
	end )
	if f2_arg2.scopedContext == ARMORY.inventoryContext.STREAK_PROTOTYPE then
		ACTIONS.AnimateSequence( f2_arg0, "StreakRatio" )
	else
		ACTIONS.AnimateSequence( f2_arg0, "WeaponRatio" )
	end
end

function PurchaseArmoryItem( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "PurchaseArmoryItem"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	self:playSound( "menu_open" )
	local f5_local2 = self
	local PopupFrame = nil
	
	PopupFrame = MenuBuilder.BuildRegisteredType( "PopupFrame", {
		controllerIndex = f5_local1
	} )
	PopupFrame.id = "PopupFrame"
	PopupFrame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -150, _1080p * 150 )
	PopupFrame:SubscribeToModelThroughElement( self, "name", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.name:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			PopupFrame.Title:setText( f6_local0, 0 )
		end
	end )
	self:addElement( PopupFrame )
	self.PopupFrame = PopupFrame
	
	local AreYouSure = nil
	
	AreYouSure = LUI.UIText.new()
	AreYouSure.id = "AreYouSure"
	AreYouSure:setText( Engine.Localize( "LUA_MENU_ARMORY_PURCHASE_CONFIRMATION" ), 0 )
	AreYouSure:SetFontSize( 24 * _1080p )
	AreYouSure:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	AreYouSure:SetAlignment( LUI.Alignment.Center )
	AreYouSure:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -285, _1080p * 285, _1080p * 396, _1080p * 420 )
	self:addElement( AreYouSure )
	self.AreYouSure = AreYouSure
	
	local NoButton = nil
	
	NoButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f5_local1
	} )
	NoButton.id = "NoButton"
	NoButton.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_NO" ) ), 0 )
	NoButton.Label:SetAlignment( LUI.Alignment.Left )
	NoButton:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 660, _1080p * 690 )
	self:addElement( NoButton )
	self.NoButton = NoButton
	
	local YesButton = nil
	
	YesButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f5_local1
	} )
	YesButton.id = "YesButton"
	YesButton.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_YES" ) ), 0 )
	YesButton.Label:SetAlignment( LUI.Alignment.Left )
	YesButton:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 621, _1080p * 651 )
	self:addElement( YesButton )
	self.YesButton = YesButton
	
	local Cost = nil
	
	Cost = LUI.UIText.new()
	Cost.id = "Cost"
	Cost:setText( Engine.Localize( "LUA_MENU_COST" ), 0 )
	Cost:SetFontSize( 24 * _1080p )
	Cost:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Cost:SetAlignment( LUI.Alignment.Right )
	Cost:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 846, _1080p * 946, _1080p * 584.5, _1080p * 608.5 )
	self:addElement( Cost )
	self.Cost = Cost
	
	local Price = nil
	
	Price = LUI.UIText.new()
	Price.id = "Price"
	Price:SetFontSize( 24 * _1080p )
	Price:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Price:SetAlignment( LUI.Alignment.Left )
	Price:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1000, _1080p * 1057, _1080p * 584.5, _1080p * 608.5 )
	Price:SubscribeToModelThroughElement( self, "currency", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.currency:GetValue( f5_local1 )
		if f7_local0 ~= nil then
			Price:setText( f7_local0, 0 )
		end
	end )
	self:addElement( Price )
	self.Price = Price
	
	local PartsIconCopy0 = nil
	
	PartsIconCopy0 = LUI.UIImage.new()
	PartsIconCopy0.id = "PartsIconCopy0"
	PartsIconCopy0:setImage( RegisterMaterial( "currency_parts_icon" ), 0 )
	PartsIconCopy0:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 964, _1080p * 1000, _1080p * 37.5, _1080p * 73.5 )
	self:addElement( PartsIconCopy0 )
	self.PartsIconCopy0 = PartsIconCopy0
	
	local CurrencyBacker = nil
	
	CurrencyBacker = LUI.UIImage.new()
	CurrencyBacker.id = "CurrencyBacker"
	CurrencyBacker:SetRGBFromInt( 0, 0 )
	CurrencyBacker:SetAlpha( 0.6, 0 )
	CurrencyBacker:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -310, _1080p * 310, _1080p * -250, _1080p * -210 )
	self:addElement( CurrencyBacker )
	self.CurrencyBacker = CurrencyBacker
	
	local CurrentSalvage = nil
	
	CurrentSalvage = LUI.UIText.new()
	CurrentSalvage.id = "CurrentSalvage"
	CurrentSalvage:SetFontSize( 24 * _1080p )
	CurrentSalvage:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CurrentSalvage:SetAlignment( LUI.Alignment.Right )
	CurrentSalvage:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -690, _1080p * -656, _1080p * 298, _1080p * 322 )
	CurrentSalvage:SubscribeToModel( DataSources.frontEnd.MP.commerce.craftingCurrency:GetModel( f5_local1 ), function ()
		local f8_local0 = DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue( f5_local1 )
		if f8_local0 ~= nil then
			CurrentSalvage:setText( f8_local0, 0 )
		end
	end )
	self:addElement( CurrentSalvage )
	self.CurrentSalvage = CurrentSalvage
	
	local PartsIcon = nil
	
	PartsIcon = LUI.UIImage.new()
	PartsIcon.id = "PartsIcon"
	PartsIcon:setImage( RegisterMaterial( "currency_parts_icon" ), 0 )
	PartsIcon:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -726, _1080p * -690, _1080p * 292, _1080p * 328 )
	self:addElement( PartsIcon )
	self.PartsIcon = PartsIcon
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -128, _1080p * 128, _1080p * 448, _1080p * 576 )
	Image:SubscribeToModelThroughElement( self, "image", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.image:GetValue( f5_local1 )
		if f9_local0 ~= nil then
			Image:setImage( RegisterMaterial( f9_local0 ), 0 )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Image:RegisterAnimationSequence( "WeaponRatio", {
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -128, _1080p * 128, _1080p * 448, _1080p * 576, 0 )
				end
			}
		} )
		self._sequences.WeaponRatio = function ()
			Image:AnimateSequence( "WeaponRatio" )
		end
		
		Image:RegisterAnimationSequence( "StreakRatio", {
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -64, _1080p * 64, _1080p * 448, _1080p * 576, 0 )
				end
			}
		} )
		self._sequences.StreakRatio = function ()
			Image:AnimateSequence( "StreakRatio" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	NoButton:addEventHandler( "button_action", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f5_local1
		ACTIONS.LeaveMenu( self )
	end )
	self.addButtonHelperFunction = function ( f17_arg0, f17_arg1 )
		f17_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg1.controller or f5_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local2( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "PurchaseArmoryItem", PurchaseArmoryItem )
LUI.FlowManager.RegisterStackPopBehaviour( "PurchaseArmoryItem", f0_local1 )
LockTable( _M )
