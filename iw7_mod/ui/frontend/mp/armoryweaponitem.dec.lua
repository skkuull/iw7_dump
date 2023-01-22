local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	local f1_local0 = Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.index, f1_arg0, CSV.weaponLootMaster.cols.missionTeam )
	if f1_local0 == MissionDirector.teamRnGValue and not ARMORY.IsWeaponRnG( f1_arg0, f1_local0 ) then
		return true
	else
		return false
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "bindButton"
	f2_arg0:addElement( bindButton )
	f2_arg0.bindButton = bindButton
	
	f2_arg0.bindButton:addEventHandler( "button_secondary", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg0:GetCurrentMenu()
		local f3_local1 = f3_arg0:getParent()
		if #f3_local1:getAllFocusedChildren() <= 0 then
			f3_local1 = f3_arg0:getParent()
			if f3_local1:isInFocus() then
			
			else
				return false
			end
		end
		if f3_local0.menuUsesItemClasses then
			f2_arg0:dispatchEventToCurrentMenu( {
				name = "close_quality_items"
			} )
			return true
		end
		return false
	end )
	f2_arg0:addEventHandler( "button_over", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg0:GetDataSource()
		f4_local0 = f4_local0.isUnlocked:GetValue( f2_arg1 )
		local f4_local1 = f0_local0
		local f4_local2 = f4_arg0:GetDataSource()
		if f4_local1( f4_local2.lootItemID:GetValue( f2_arg1 ) ) then
			f4_local0 = true
		end
		f4_local1 = f4_arg0:GetCurrentMenu()
		assert( f4_local1.ButtonHelperBar )
		local f4_local3 = f4_arg0
		f4_local2 = f4_arg0.dispatchEventToCurrentMenu
		local f4_local4 = {
			name = "update_item_card"
		}
		local f4_local5 = f4_arg0:GetDataSource()
		f4_local4.identifier = f4_local5.lootItemID:GetValue( f2_arg1 )
		f4_local4.context = LUI.ItemCard.contexts.INVENTORY_ITEM
		f4_local2( f4_local3, f4_local4 )
		if f4_local0 then
			f4_arg0:AddButtonHelperTextToElement( f4_local1.ButtonHelperBar, {
				helper_text = Engine.Localize( "LUA_MENU_DECONSTRUCT_CAPS" ),
				button_ref = "button_primary",
				side = "left",
				priority = 0,
				clickable = true,
				width = 200
			} )
		else
			f4_arg0:AddButtonHelperTextToElement( f4_local1.ButtonHelperBar, {
				helper_text = Engine.Localize( "LUA_MENU_PURCHASE_CAPS" ),
				button_ref = "button_primary",
				side = "left",
				priority = 0,
				clickable = true,
				width = 150
			} )
		end
	end )
	f2_arg0:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg0:GetDataSource()
		f5_local0 = f5_local0.isUnlocked:GetValue( f2_arg1 )
		local f5_local1 = f0_local0
		local f5_local2 = f5_arg0:GetDataSource()
		if f5_local1( f5_local2.lootItemID:GetValue( f2_arg1 ) ) then
			f5_local0 = true
		end
		if not f5_local0 then
			f5_local1 = DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue( f2_arg1 )
			f5_local2 = f5_arg0:GetDataSource()
			f5_local2 = f5_local2.cost:GetValue( f2_arg1 )
			local f5_local3 = Loot.CraftDetails
			local f5_local4 = f2_arg1
			local f5_local5 = f5_arg0:GetDataSource()
			f5_local3 = f5_local3( f5_local4, f5_local5.lootItemID:GetValue( f2_arg1 ) )
			if f5_local3.canCraft == false then
				LUI.FlowManager.RequestPopupMenu( f2_arg0, "PopupOK", true, f2_arg1, false, {
					message = Engine.Localize( "LUA_MENU_MP_ARMORY_RARITY_WARNING" )
				} )
			elseif f5_local2 <= f5_local1 then
				f5_local5 = LUI.FlowManager.RequestPopupMenu
				local f5_local6 = f2_arg0
				local f5_local7 = "PurchaseArmoryItem"
				local f5_local8 = true
				local f5_local9 = f2_arg1
				local f5_local10 = false
				local f5_local11 = {}
				local f5_local12 = f5_arg0:GetDataSource()
				f5_local11.lootItemID = f5_local12.lootItemID:GetValue( f2_arg1 )
				f5_local11.cost = f5_local2
				f5_local5( f5_local6, f5_local7, f5_local8, f5_local9, f5_local10, f5_local11 )
			else
				LUI.FlowManager.RequestPopupMenu( f2_arg0, "PopupOK", true, f2_arg1, false, {
					message = Engine.Localize( "@LUA_MENU_NOT_ENOUGH_SALVAGE" )
				} )
			end
		end
	end )
end

function ArmoryWeaponItem( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 160 * _1080p, 0, 100 * _1080p )
	self.id = "ArmoryWeaponItem"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "GenericButtonBlurBackground", {
		controllerIndex = f6_local1
	} )
	Background.id = "Background"
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	Background:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.qualityColor:GetValue( f6_local1 )
		if f7_local0 ~= nil then
			Background:SetRGBFromInt( f7_local0, 0 )
		end
	end )
	self:addElement( Background )
	self.Background = Background
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAlpha( 0.9, 0 )
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 130, _1080p * 33, _1080p * 93 )
	Image:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.qualityColor:GetValue( f6_local1 )
		if f8_local0 ~= nil then
			Image:SetRGBFromInt( f8_local0, 0 )
		end
	end )
	Image:SubscribeToModelThroughElement( self, "displayImage", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.displayImage:GetValue( f6_local1 )
		if f9_local0 ~= nil then
			Image:setImage( RegisterMaterial( f9_local0 ), 0 )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local PassiveBackers = nil
	
	PassiveBackers = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 3,
		controllerIndex = f6_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ArmoryPassiveBacker", {
				controllerIndex = f6_local1
			} )
		end,
		refreshChild = function ( f11_arg0, f11_arg1, f11_arg2 )
			
		end,
		numRows = 3,
		numColumns = 1,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 18,
		rowHeight = _1080p * 18,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	PassiveBackers.id = "PassiveBackers"
	PassiveBackers:SetRGBFromInt( 0, 0 )
	PassiveBackers:SetAlpha( 0.8, 0 )
	PassiveBackers:setUseStencil( true )
	PassiveBackers:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 135.5, _1080p * 153.5, _1080p * 32, _1080p * 94 )
	self:addElement( PassiveBackers )
	self.PassiveBackers = PassiveBackers
	
	local Passives = nil
	
	Passives = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 3,
		controllerIndex = f6_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ArmoryPassive", {
				controllerIndex = f6_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 18,
		rowHeight = _1080p * 18,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Right,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Passives.id = "Passives"
	Passives:setUseStencil( true )
	Passives:SetGridDataSourceThroughElement( self, "passives" )
	Passives:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 135.5, _1080p * 153.5, _1080p * 32, _1080p * 94 )
	self:addElement( Passives )
	self.Passives = Passives
	
	local RectrictionOverlay = nil
	
	RectrictionOverlay = MenuBuilder.BuildRegisteredType( "CaCButtonRectrictionOverlay", {
		controllerIndex = f6_local1
	} )
	RectrictionOverlay.id = "RectrictionOverlay"
	RectrictionOverlay:SetAlpha( 0, 0 )
	RectrictionOverlay:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( RectrictionOverlay )
	self.RectrictionOverlay = RectrictionOverlay
	
	local BlurTitleBar = nil
	
	BlurTitleBar = LUI.UIBlur.new()
	BlurTitleBar.id = "BlurTitleBar"
	BlurTitleBar:SetRGBFromInt( 4210752, 0 )
	BlurTitleBar:SetBlurStrength( 2.5, 0 )
	BlurTitleBar:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( BlurTitleBar )
	self.BlurTitleBar = BlurTitleBar
	
	local OwnedBackground = nil
	
	OwnedBackground = LUI.UIImage.new()
	OwnedBackground.id = "OwnedBackground"
	OwnedBackground:SetRGBFromInt( 0, 0 )
	OwnedBackground:SetAlpha( 0, 0 )
	OwnedBackground:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -30, 0, 0, _1080p * 26 )
	self:addElement( OwnedBackground )
	self.OwnedBackground = OwnedBackground
	
	local Owned = nil
	
	Owned = LUI.UIText.new()
	Owned.id = "Owned"
	Owned:SetAlpha( 0, 0 )
	Owned:SetFontSize( 16 * _1080p )
	Owned:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Owned:SetAlignment( LUI.Alignment.Center )
	Owned:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -30, _1080p * -1, _1080p * 5, _1080p * 21 )
	Owned:SubscribeToModelThroughElement( self, "owned", function ()
		local f13_local0 = self:GetDataSource()
		f13_local0 = f13_local0.owned:GetValue( f6_local1 )
		if f13_local0 ~= nil then
			Owned:setText( f13_local0, 0 )
		end
	end )
	self:addElement( Owned )
	self.Owned = Owned
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f6_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local Name = nil
	
	Name = LUI.UIStyledText.new()
	Name.id = "Name"
	Name:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	Name:SetAlpha( 0.6, 0 )
	Name:SetFontSize( 19 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Name:SetAlignment( LUI.Alignment.Left )
	Name:SetStartupDelay( 1250 )
	Name:SetLineHoldTime( 400 )
	Name:SetAnimMoveTime( 300 )
	Name:SetEndDelay( 1000 )
	Name:SetCrossfadeTime( 500 )
	Name:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Name:SetMaxVisibleLines( 1 )
	Name:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, _1080p * -11, _1080p * 2.5, _1080p * 21.5 )
	Name:SubscribeToModelThroughElement( self, "name", function ()
		local f14_local0 = self:GetDataSource()
		f14_local0 = f14_local0.name:GetValue( f6_local1 )
		if f14_local0 ~= nil then
			Name:setText( f14_local0, 0 )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Image:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Image:SetAlpha( 0.4, 0 )
				end
			}
		} )
		PassiveBackers:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.PassiveBackers:SetAlpha( 0.4, 0 )
				end
			}
		} )
		Passives:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Passives:SetAlpha( 0.4, 0 )
				end
			}
		} )
		RectrictionOverlay:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.RectrictionOverlay:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Image:AnimateSequence( "Locked" )
			PassiveBackers:AnimateSequence( "Locked" )
			Passives:AnimateSequence( "Locked" )
			RectrictionOverlay:AnimateSequence( "Locked" )
		end
		
		Image:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Image:SetAlpha( 1, 0 )
				end
			}
		} )
		PassiveBackers:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.PassiveBackers:SetAlpha( 0.8, 0 )
				end
			}
		} )
		Passives:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Passives:SetAlpha( 1, 0 )
				end
			}
		} )
		RectrictionOverlay:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.RectrictionOverlay:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			Image:AnimateSequence( "Unlocked" )
			PassiveBackers:AnimateSequence( "Unlocked" )
			Passives:AnimateSequence( "Unlocked" )
			RectrictionOverlay:AnimateSequence( "Unlocked" )
		end
		
		OwnedBackground:RegisterAnimationSequence( "OwnedMany", {
			{
				function ()
					return self.OwnedBackground:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.OwnedBackground:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -30, 0, 0, _1080p * 24, 0 )
				end
			}
		} )
		Owned:RegisterAnimationSequence( "OwnedMany", {
			{
				function ()
					return self.Owned:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.OwnedMany = function ()
			OwnedBackground:AnimateSequence( "OwnedMany" )
			Owned:AnimateSequence( "OwnedMany" )
		end
		
		OwnedBackground:RegisterAnimationSequence( "OwnedFew", {
			{
				function ()
					return self.OwnedBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		Owned:RegisterAnimationSequence( "OwnedFew", {
			{
				function ()
					return self.Owned:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.OwnedFew = function ()
			OwnedBackground:AnimateSequence( "OwnedFew" )
			Owned:AnimateSequence( "OwnedFew" )
		end
		
		Name:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Name:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.Name:SetRGBFromTable( SWATCHES.genericButton.highlight, 200 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Name:AnimateSequence( "ButtonOver" )
		end
		
		Name:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Name:SetRGBFromTable( SWATCHES.genericButton.textDefault, 100 )
				end
			},
			{
				function ()
					return self.Name:SetAlpha( 0.6, 100 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Name:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f40_arg0, f40_arg1 )
		local f40_local0 = f40_arg1.controller or f6_local1
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "RectrictionOverlay",
			sequenceName = "ButtonOver",
			elementPath = "RectrictionOverlay"
		} )
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f41_arg0, f41_arg1 )
		local f41_local0 = f41_arg1.controller or f6_local1
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "RectrictionOverlay",
			sequenceName = "ButtonUp",
			elementPath = "RectrictionOverlay"
		} )
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f42_local0 = self:GetDataSource()
		if f42_local0.isUnlocked:GetValue( f6_local1 ) ~= nil then
			f42_local0 = self:GetDataSource()
			if f42_local0.isUnlocked:GetValue( f6_local1 ) == true then
				ACTIONS.AnimateSequence( self, "Unlocked" )
			end
		end
		f42_local0 = self:GetDataSource()
		if f42_local0.isUnlocked:GetValue( f6_local1 ) ~= nil then
			f42_local0 = self:GetDataSource()
			if f42_local0.isUnlocked:GetValue( f6_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Locked" )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "owned", function ()
		local f43_local0 = self:GetDataSource()
		if f43_local0.owned:GetValue( f6_local1 ) ~= nil then
			f43_local0 = self:GetDataSource()
			if f43_local0.owned:GetValue( f6_local1 ) >= 2 then
				ACTIONS.AnimateSequence( self, "OwnedMany" )
			end
		end
		f43_local0 = self:GetDataSource()
		if f43_local0.owned:GetValue( f6_local1 ) ~= nil then
			f43_local0 = self:GetDataSource()
			if f43_local0.owned:GetValue( f6_local1 ) < 2 then
				ACTIONS.AnimateSequence( self, "OwnedFew" )
			end
		end
	end )
	f0_local1( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "ArmoryWeaponItem", ArmoryWeaponItem )
LockTable( _M )
