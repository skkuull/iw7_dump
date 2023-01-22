local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( menu, controller )
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	menu:addElement( bindButton )
	menu.bindButton = bindButton
	
	menu:addEventHandler( "button_over", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg0:GetCurrentMenu()
		f2_local0:processEvent( {
			name = "OverSuper"
		} )
	end )
	menu.actionSFX = "ui_select_screen_return"
	menu:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		ACTIONS.EquipRigSuper( menu, f3_arg1.controller or controller )
		LUI.FlowManager.RequestLeaveMenu( menu, true, true )
	end )
	if CONDITIONS.UseCACBreadCrumbs() then
		assert( menu.NewItemNotification )
		menu:SubscribeToModelThroughElement( menu, "ref", function ()
			local f4_local0 = menu:GetDataSource()
			Cac.UpdateNewItemNotification( controller, f4_local0.ref:GetValue( controller ), CSV.rigSuperUnlockTable, "super", menu.NewItemNotification )
		end )
		menu:addEventHandler( "gain_focus", function ( f5_arg0, f5_arg1 )
			local f5_local0 = LUI.FlowManager.GetScopedData( f5_arg0 )
			local f5_local1 = menu:GetDataSource()
			f5_local0.currentSuper = f5_local1.ref:GetValue( controller )
		end )
		menu:addEventHandler( "lose_focus", function ( f6_arg0, f6_arg1 )
			local f6_local0 = LUI.FlowManager.GetScopedData( f6_arg0 )
			Cac.ClearNewItemNotification( controller, f6_local0.currentSuper, CSV.rigSuperUnlockTable, "super", menu.NewItemNotification )
		end )
	end
end

function RigSuperButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 210 * _1080p, 0, 150 * _1080p )
	self.id = "RigSuperButton"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	self:setUseStencil( true )
	self:SubscribeToModelThroughElement( self, "rigSuper.isDisabled", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.rigSuper.isDisabled:GetValue( f7_local1 )
		if f8_local0 ~= nil then
			self:SetButtonDisabled( f8_local0 )
		end
	end )
	local GenericItemBackground = nil
	
	GenericItemBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f7_local1
	} )
	GenericItemBackground.id = "GenericItemBackground"
	GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local ActivateTextMask = nil
	
	ActivateTextMask = LUI.UIImage.new()
	ActivateTextMask.id = "ActivateTextMask"
	ActivateTextMask:SetRGBFromInt( 0, 0 )
	ActivateTextMask:SetAlpha( 0, 0 )
	ActivateTextMask:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	ActivateTextMask:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 16, _1080p * 100 )
	self:addElement( ActivateTextMask )
	self.ActivateTextMask = ActivateTextMask
	
	local ActivateTextMaskTop = nil
	
	ActivateTextMaskTop = LUI.UIImage.new()
	ActivateTextMaskTop.id = "ActivateTextMaskTop"
	ActivateTextMaskTop:SetRGBFromInt( 0, 0 )
	ActivateTextMaskTop:SetAlpha( 0, 0 )
	ActivateTextMaskTop:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 16 )
	self:addElement( ActivateTextMaskTop )
	self.ActivateTextMaskTop = ActivateTextMaskTop
	
	local SuperImage = nil
	
	SuperImage = LUI.UIImage.new()
	SuperImage.id = "SuperImage"
	SuperImage:SetAlpha( 0.6, 0 )
	SuperImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -75, _1080p * 75, _1080p * -75, _1080p * 75 )
	SuperImage:SubscribeToModelThroughElement( self, "rigSuper.fullImage", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.rigSuper.fullImage:GetValue( f7_local1 )
		if f9_local0 ~= nil then
			SuperImage:setImage( RegisterMaterial( f9_local0 ), 0 )
		end
	end )
	self:addElement( SuperImage )
	self.SuperImage = SuperImage
	
	local SuperName = nil
	
	SuperName = LUI.UIStyledText.new()
	SuperName.id = "SuperName"
	SuperName:SetFontSize( 22 * _1080p )
	SuperName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SuperName:SetAlignment( LUI.Alignment.Left )
	SuperName:SetStartupDelay( 1000 )
	SuperName:SetLineHoldTime( 400 )
	SuperName:SetAnimMoveTime( 150 )
	SuperName:SetEndDelay( 1000 )
	SuperName:SetCrossfadeTime( 400 )
	SuperName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	SuperName:SetMaxVisibleLines( 1 )
	SuperName:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 9, _1080p * -9, _1080p * 43, _1080p * 65 )
	SuperName:SubscribeToModelThroughElement( self, "rigSuper.name", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.rigSuper.name:GetValue( f7_local1 )
		if f10_local0 ~= nil then
			SuperName:setText( f10_local0, 0 )
		end
	end )
	self:addElement( SuperName )
	self.SuperName = SuperName
	
	local Selected = nil
	
	Selected = MenuBuilder.BuildRegisteredType( "CaCSelectedMessage", {
		controllerIndex = f7_local1
	} )
	Selected.id = "Selected"
	Selected:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 18, 0, _1080p * 130, _1080p * 150 )
	Selected:SubscribeToModelThroughElement( self, "rigSuper.isEquippedAlpha", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.rigSuper.isEquippedAlpha:GetValue( f7_local1 )
		if f11_local0 ~= nil then
			Selected.EndCapRight:SetAlpha( f11_local0, 0 )
		end
	end )
	self:addElement( Selected )
	self.Selected = Selected
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f7_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:SetAlpha( 0, 0 )
	Lock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Lock:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -26, _1080p * 26, _1080p * -26, _1080p * 26 )
	self:addElement( Lock )
	self.Lock = Lock
	
	local f7_local11 = nil
	if CONDITIONS.UseCACBreadCrumbs( self ) then
		f7_local11 = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
			controllerIndex = f7_local1
		} )
		f7_local11.id = "NewItemNotification"
		f7_local11:SetAlpha( 0, 0 )
		f7_local11:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
		self:addElement( f7_local11 )
		self.NewItemNotification = f7_local11
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		SuperImage:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.SuperImage:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.SuperImage:SetScale( 0.05, 50 )
				end
			}
		} )
		SuperName:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.SuperName:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.SuperName:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			SuperImage:AnimateSequence( "ButtonOver" )
			SuperName:AnimateSequence( "ButtonOver" )
		end
		
		SuperImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.SuperImage:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.SuperImage:SetScale( 0, 200 )
				end
			}
		} )
		SuperName:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.SuperName:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.SuperName:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			SuperImage:AnimateSequence( "ButtonUp" )
			SuperName:AnimateSequence( "ButtonUp" )
		end
		
		self._sequences.Pulse = function ()
			
		end
		
		self._sequences.PulseStop = function ()
			
		end
		
		SuperName:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.SuperName:SetAlpha( 0.2, 50 )
				end
			},
			{
				function ()
					return self.SuperName:SetRGBFromTable( SWATCHES.genericButton.textDefault, 50 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			SuperName:AnimateSequence( "ButtonOverDisabled" )
		end
		
		SuperName:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.SuperName:SetRGBFromTable( SWATCHES.genericButton.textDefault, 200 )
				end
			},
			{
				function ()
					return self.SuperName:SetAlpha( 0.2, 200 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			SuperName:AnimateSequence( "ButtonUpDisabled" )
		end
		
		ActivateTextMask:RegisterAnimationSequence( "Activate", {
			{
				function ()
					return self.ActivateTextMask:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ActivateTextMask:SetAlpha( 0.8, 100 )
				end,
				function ()
					return self.ActivateTextMask:SetAlpha( 0.8, 800 )
				end,
				function ()
					return self.ActivateTextMask:SetAlpha( 0, 300 )
				end
			}
		} )
		ActivateTextMaskTop:RegisterAnimationSequence( "Activate", {
			{
				function ()
					return self.ActivateTextMaskTop:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ActivateTextMaskTop:SetAlpha( 0.8, 100 )
				end,
				function ()
					return self.ActivateTextMaskTop:SetAlpha( 0.8, 800 )
				end,
				function ()
					return self.ActivateTextMaskTop:SetAlpha( 0, 300 )
				end
			}
		} )
		self._sequences.Activate = function ()
			ActivateTextMask:AnimateSequence( "Activate" )
			ActivateTextMaskTop:AnimateSequence( "Activate" )
		end
		
		SuperImage:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.SuperImage:SetAlpha( 0, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			SuperImage:AnimateSequence( "Locked" )
			Lock:AnimateSequence( "Locked" )
		end
		
		SuperImage:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.SuperImage:SetAlpha( 1, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			SuperImage:AnimateSequence( "Unlocked" )
			Lock:AnimateSequence( "Unlocked" )
		end
		
		ActivateTextMask:RegisterAnimationSequence( "StopActivateAnim", {
			{
				function ()
					return self.ActivateTextMask:SetAlpha( 0, 0 )
				end
			}
		} )
		ActivateTextMaskTop:RegisterAnimationSequence( "StopActivateAnim", {
			{
				function ()
					return self.ActivateTextMaskTop:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.StopActivateAnim = function ()
			ActivateTextMask:AnimateSequence( "StopActivateAnim" )
			ActivateTextMaskTop:AnimateSequence( "StopActivateAnim" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f50_arg0, f50_arg1 )
		local f50_local0 = f50_arg1.controller or f7_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
		ACTIONS.AnimateSequence( self, "Pulse" )
	end )
	self:addEventHandler( "button_up", function ( f51_arg0, f51_arg1 )
		local f51_local0 = f51_arg1.controller or f7_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
		ACTIONS.AnimateSequence( self, "PulseStop" )
	end )
	self:SubscribeToModelThroughElement( self, "rigSuper.isEquipped", function ()
		local f52_local0 = self:GetDataSource()
		if f52_local0.rigSuper.isEquipped:GetValue( f7_local1 ) ~= nil then
			f52_local0 = self:GetDataSource()
			if f52_local0.rigSuper.isEquipped:GetValue( f7_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Selected",
					sequenceName = "Activate",
					elementPath = "Selected"
				} )
				ACTIONS.AnimateSequence( self, "Activate" )
			end
		end
		f52_local0 = self:GetDataSource()
		if f52_local0.rigSuper.isEquipped:GetValue( f7_local1 ) ~= nil then
			f52_local0 = self:GetDataSource()
			if f52_local0.rigSuper.isEquipped:GetValue( f7_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Selected",
					sequenceName = "Inactive",
					elementPath = "Selected"
				} )
				ACTIONS.AnimateSequence( self, "StopActivateAnim" )
			end
		end
	end )
	self:addEventHandler( "button_disable", function ( f53_arg0, f53_arg1 )
		local f53_local0 = f53_arg1.controller or f7_local1
		ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
	end )
	self:addEventHandler( "button_over_disable", function ( f54_arg0, f54_arg1 )
		local f54_local0 = f54_arg1.controller or f7_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
	end )
	self:SubscribeToModelThroughElement( self, "rigSuper.isUnlocked", function ()
		local f55_local0 = self:GetDataSource()
		if f55_local0.rigSuper.isUnlocked:GetValue( f7_local1 ) ~= nil then
			f55_local0 = self:GetDataSource()
			if f55_local0.rigSuper.isUnlocked:GetValue( f7_local1 ) == true then
				ACTIONS.AnimateSequence( self, "Unlocked" )
			end
		end
		f55_local0 = self:GetDataSource()
		if f55_local0.rigSuper.isUnlocked:GetValue( f7_local1 ) ~= nil then
			f55_local0 = self:GetDataSource()
			if f55_local0.rigSuper.isUnlocked:GetValue( f7_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Locked" )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "rigSuper.isDisabled", function ()
		local f56_local0 = self:GetDataSource()
		if f56_local0.rigSuper.isDisabled:GetValue( f7_local1 ) ~= nil then
			f56_local0 = self:GetDataSource()
			if f56_local0.rigSuper.isDisabled:GetValue( f7_local1 ) == true then
				ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
			end
		end
		f56_local0 = self:GetDataSource()
		if f56_local0.rigSuper.isDisabled:GetValue( f7_local1 ) ~= nil then
			f56_local0 = self:GetDataSource()
			if f56_local0.rigSuper.isDisabled:GetValue( f7_local1 ) == false then
				ACTIONS.AnimateSequence( self, "ButtonUp" )
			end
		end
	end )
	f0_local0( self, f7_local1, controller )
	return self
end

MenuBuilder.registerType( "RigSuperButton", RigSuperButton )
LockTable( _M )
