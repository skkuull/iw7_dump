local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local ArmoryLootCard = MenuBuilder.BuildRegisteredType( "LootItemCard", {
		isDuplicate = false,
		context = LUI.ItemCard.contexts.ITEM_CRAFTED,
		itemType = LUI.ItemCard.types.STREAK,
		cardIndex = 0,
		identifier = f1_arg2.lootItemID,
		modelPath = "frontEnd.armory.streakCrafted." .. f1_arg2.lootItemID,
		controllerIndex = f1_arg1
	} )
	ArmoryLootCard.id = "ArmoryLootCard"
	ArmoryLootCard:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -160, _1080p * 160, _1080p * -236, _1080p * 236 )
	f1_arg0:addElement( ArmoryLootCard )
	f1_arg0.ArmoryLootCard = ArmoryLootCard
	
	f1_arg0.ArmoryLootCard:SetAlpha( 0 )
	f1_arg0.ArmoryLootCard:SetScale( 1 )
	f1_arg0.ArmoryLootCard:SetScale( 0, 200, LUI.EASING.outQuadratic )
	f1_arg0.ArmoryLootCard:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
	f1_arg0.CraftingMessage:setText( Engine.Localize( "LUA_MENU_MP_ARMORY_CRAFTING_COMPLETE", Engine.TableLookup( CSV.streakLootMaster.file, CSV.streakLootMaster.cols.index, f1_arg2.lootItemID, CSV.streakLootMaster.cols.displayName ) ), 0 )
	local f1_local1 = function ( f2_arg0 )
		LUI.FlowManager.RequestLeaveMenu( f2_arg0, true )
	end
	
	f1_arg0.bindButton:addEventHandler( "button_primary", f1_local1 )
	f1_arg0.bindButton:addEventHandler( "button_secondary", f1_local1 )
end

function ArmoryStreakCrafted( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "ArmoryStreakCrafted"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self:playSound( "menu_open" )
	local f3_local2 = self
	local Darkener = nil
	
	Darkener = LUI.UIImage.new()
	Darkener.id = "Darkener"
	Darkener:SetRGBFromInt( 0, 0 )
	Darkener:SetAlpha( 0.9, 0 )
	Darkener:SetScale( 1, 0 )
	Darkener:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -960, _1080p * 960 )
	self:addElement( Darkener )
	self.Darkener = Darkener
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f3_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar.Background:SetAlpha( 0, 0 )
	ButtonHelperBar:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -180, _1080p * 180, _1080p * -241, _1080p * -156 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local CraftingMessage = nil
	
	CraftingMessage = LUI.UIStyledText.new()
	CraftingMessage.id = "CraftingMessage"
	CraftingMessage:setText( "", 0 )
	CraftingMessage:SetFontSize( 24 * _1080p )
	CraftingMessage:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CraftingMessage:SetAlignment( LUI.Alignment.Center )
	CraftingMessage:SetDecodeLetterLength( 15 )
	CraftingMessage:SetDecodeMaxRandChars( 6 )
	CraftingMessage:SetDecodeUpdatesPerLetter( 4 )
	CraftingMessage:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 225, _1080p * 249 )
	self:addElement( CraftingMessage )
	self.CraftingMessage = CraftingMessage
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Darkener:RegisterAnimationSequence( "Darken", {
			{
				function ()
					return self.Darkener:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Darkener:SetAlpha( 0.9, 100 )
				end
			}
		} )
		self._sequences.Darken = function ()
			Darkener:AnimateSequence( "Darken" )
		end
		
		ButtonHelperBar:RegisterAnimationSequence( "PCOffset", {
			{
				function ()
					return self.ButtonHelperBar:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -232, _1080p * 128, _1080p * -241, _1080p * -156, 0 )
				end
			}
		} )
		self._sequences.PCOffset = function ()
			ButtonHelperBar:AnimateSequence( "PCOffset" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Darken" )
	ACTIONS.PlaySoundSetSound( self, "popup", false )
	self.addButtonHelperFunction = function ( f11_arg0, f11_arg1 )
		f11_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_CLOSE" ),
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
	
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "Darken" )
	if CONDITIONS.IsPC( self ) and not CONDITIONS.IsGamepadEnabled( self ) then
		ACTIONS.AnimateSequence( self, "PCOffset" )
	end
	return self
end

MenuBuilder.registerType( "ArmoryStreakCrafted", ArmoryStreakCrafted )
LockTable( _M )
