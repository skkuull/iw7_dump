local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:addEventHandler( "button_over", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg0:GetCurrentMenu()
		f2_local0:processEvent( {
			name = "OverTrait"
		} )
	end )
	f1_arg0.actionSFX = "ui_select_screen_return"
	f1_arg0:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		ACTIONS.EquipRigPerk( f1_arg0, f3_arg1.controller or f1_arg1 )
		LUI.FlowManager.RequestLeaveMenu( f1_arg0, true, true )
	end )
	if CONDITIONS.UseCACBreadCrumbs() then
		assert( f1_arg0.NewItemNotification )
		f1_arg0:SubscribeToModelThroughElement( f1_arg0, "ref", function ()
			local f4_local0 = f1_arg0:GetDataSource()
			Cac.UpdateNewItemNotification( f1_arg1, f4_local0.ref:GetValue( f1_arg1 ), CSV.rigTraitUnlockTable, "trait", f1_arg0.NewItemNotification )
		end )
		f1_arg0:addEventHandler( "gain_focus", function ( f5_arg0, f5_arg1 )
			local f5_local0 = LUI.FlowManager.GetScopedData( f5_arg0 )
			local f5_local1 = f1_arg0:GetDataSource()
			f5_local0.currentTrait = f5_local1.ref:GetValue( f1_arg1 )
		end )
		f1_arg0:addEventHandler( "lose_focus", function ( f6_arg0, f6_arg1 )
			local f6_local0 = LUI.FlowManager.GetScopedData( f6_arg0 )
			Cac.ClearNewItemNotification( f1_arg1, f6_local0.currentTrait, CSV.rigTraitUnlockTable, "trait", f1_arg0.NewItemNotification )
		end )
	end
end

function RigPerkButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 210 * _1080p, 0, 150 * _1080p )
	self.id = "RigPerkButton"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	self:setUseStencil( true )
	self:SubscribeToModelThroughElement( self, "rigPerk.isDisabled", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.rigPerk.isDisabled:GetValue( f7_local1 )
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
	
	local RigPerkImage = nil
	
	RigPerkImage = LUI.UIImage.new()
	RigPerkImage.id = "RigPerkImage"
	RigPerkImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	RigPerkImage:SubscribeToModelThroughElement( self, "rigPerk.icon", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.rigPerk.icon:GetValue( f7_local1 )
		if f9_local0 ~= nil then
			RigPerkImage:setImage( RegisterMaterial( f9_local0 ), 0 )
		end
	end )
	self:addElement( RigPerkImage )
	self.RigPerkImage = RigPerkImage
	
	local TraitName = nil
	
	TraitName = LUI.UIStyledText.new()
	TraitName.id = "TraitName"
	TraitName:SetFontSize( 22 * _1080p )
	TraitName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TraitName:SetAlignment( LUI.Alignment.Left )
	TraitName:SetStartupDelay( 1000 )
	TraitName:SetLineHoldTime( 400 )
	TraitName:SetAnimMoveTime( 150 )
	TraitName:SetEndDelay( 1000 )
	TraitName:SetCrossfadeTime( 400 )
	TraitName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	TraitName:SetMaxVisibleLines( 1 )
	TraitName:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, _1080p * -9, _1080p * 117, _1080p * 139 )
	TraitName:SubscribeToModelThroughElement( self, "rigPerk.name", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.rigPerk.name:GetValue( f7_local1 )
		if f10_local0 ~= nil then
			TraitName:setText( f10_local0, 0 )
		end
	end )
	self:addElement( TraitName )
	self.TraitName = TraitName
	
	local Selected = nil
	
	Selected = MenuBuilder.BuildRegisteredType( "CaCSelectedMessage", {
		controllerIndex = f7_local1
	} )
	Selected.id = "Selected"
	Selected:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 18, 0, _1080p * 130, _1080p * 150 )
	Selected:SubscribeToModelThroughElement( self, "rigPerk.isEquippedAlpha", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.rigPerk.isEquippedAlpha:GetValue( f7_local1 )
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
		
		RigPerkImage:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.RigPerkImage:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.RigPerkImage:SetRGBFromInt( 16777215, 50 )
				end
			},
			{
				function ()
					return self.RigPerkImage:SetScale( 0.05, 50 )
				end
			}
		} )
		TraitName:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.TraitName:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TraitName:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			RigPerkImage:AnimateSequence( "ButtonOver" )
			TraitName:AnimateSequence( "ButtonOver" )
		end
		
		RigPerkImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.RigPerkImage:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.RigPerkImage:SetScale( 0, 200 )
				end
			}
		} )
		TraitName:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.TraitName:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.TraitName:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			RigPerkImage:AnimateSequence( "ButtonUp" )
			TraitName:AnimateSequence( "ButtonUp" )
		end
		
		self._sequences.Pulse = function ()
			
		end
		
		self._sequences.PulseStop = function ()
			
		end
		
		TraitName:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.TraitName:SetRGBFromTable( SWATCHES.genericButton.textDefault, 50 )
				end
			},
			{
				function ()
					return self.TraitName:SetAlpha( 0.2, 50 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			TraitName:AnimateSequence( "ButtonOverDisabled" )
		end
		
		TraitName:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.TraitName:SetAlpha( 0.2, 200 )
				end
			},
			{
				function ()
					return self.TraitName:SetRGBFromTable( SWATCHES.genericButton.textDefault, 200 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			TraitName:AnimateSequence( "ButtonUpDisabled" )
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
		
		RigPerkImage:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.RigPerkImage:SetAlpha( 0, 0 )
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
			RigPerkImage:AnimateSequence( "Locked" )
			Lock:AnimateSequence( "Locked" )
		end
		
		RigPerkImage:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.RigPerkImage:SetAlpha( 1, 0 )
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
			RigPerkImage:AnimateSequence( "Unlocked" )
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
	self:SubscribeToModelThroughElement( self, "rigPerk.isEquipped", function ()
		local f51_local0 = self:GetDataSource()
		if f51_local0.rigPerk.isEquipped:GetValue( f7_local1 ) ~= nil then
			f51_local0 = self:GetDataSource()
			if f51_local0.rigPerk.isEquipped:GetValue( f7_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Selected",
					sequenceName = "Activate",
					elementPath = "Selected"
				} )
				ACTIONS.AnimateSequence( self, "Activate" )
			end
		end
		f51_local0 = self:GetDataSource()
		if f51_local0.rigPerk.isEquipped:GetValue( f7_local1 ) ~= nil then
			f51_local0 = self:GetDataSource()
			if f51_local0.rigPerk.isEquipped:GetValue( f7_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Selected",
					sequenceName = "Inactive",
					elementPath = "Selected"
				} )
				ACTIONS.AnimateSequence( self, "StopActivateAnim" )
			end
		end
	end )
	self:addEventHandler( "button_over", function ( f52_arg0, f52_arg1 )
		local f52_local0 = f52_arg1.controller or f7_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
		ACTIONS.AnimateSequence( self, "Pulse" )
	end )
	self:addEventHandler( "button_up", function ( f53_arg0, f53_arg1 )
		local f53_local0 = f53_arg1.controller or f7_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
		ACTIONS.AnimateSequence( self, "PulseStop" )
	end )
	self:addEventHandler( "button_disable", function ( f54_arg0, f54_arg1 )
		local f54_local0 = f54_arg1.controller or f7_local1
		ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
	end )
	self:addEventHandler( "button_over_disable", function ( f55_arg0, f55_arg1 )
		local f55_local0 = f55_arg1.controller or f7_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
	end )
	self:SubscribeToModelThroughElement( self, "rigPerk.isUnlocked", function ()
		local f56_local0 = self:GetDataSource()
		if f56_local0.rigPerk.isUnlocked:GetValue( f7_local1 ) ~= nil then
			f56_local0 = self:GetDataSource()
			if f56_local0.rigPerk.isUnlocked:GetValue( f7_local1 ) == true then
				ACTIONS.AnimateSequence( self, "Unlocked" )
			end
		end
		f56_local0 = self:GetDataSource()
		if f56_local0.rigPerk.isUnlocked:GetValue( f7_local1 ) ~= nil then
			f56_local0 = self:GetDataSource()
			if f56_local0.rigPerk.isUnlocked:GetValue( f7_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Locked" )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "rigPerk.isDisabled", function ()
		local f57_local0 = self:GetDataSource()
		if f57_local0.rigPerk.isDisabled:GetValue( f7_local1 ) ~= nil then
			f57_local0 = self:GetDataSource()
			if f57_local0.rigPerk.isDisabled:GetValue( f7_local1 ) == true then
				ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
			end
		end
		f57_local0 = self:GetDataSource()
		if f57_local0.rigPerk.isDisabled:GetValue( f7_local1 ) ~= nil then
			f57_local0 = self:GetDataSource()
			if f57_local0.rigPerk.isDisabled:GetValue( f7_local1 ) == false then
				ACTIONS.AnimateSequence( self, "ButtonUp" )
			end
		end
	end )
	f0_local0( self, f7_local1, controller )
	return self
end

MenuBuilder.registerType( "RigPerkButton", RigPerkButton )
LockTable( _M )
