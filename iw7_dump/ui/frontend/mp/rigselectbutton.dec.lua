local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0:GetDataSource()
	f1_local0 = f1_local0.rig.isUnlocked:GetValue( f1_arg1 )
	local f1_local1 = f1_arg0:GetDataSource()
	f1_local1 = f1_local1.rig.ref:GetValue( f1_arg1 )
	local f1_local2 = CONDITIONS.IsDraftEnabled()
	if f1_local2 then
		f1_local2 = f1_arg0:getParent()
		f1_local2 = f1_local2.XUID
	end
	return f1_local0 and not (f1_local2 and Cac.HasRigItemBeenDrafted( f1_arg1, f1_local1 ))
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.RigImage:SetMask( f2_arg0.Mask )
	f2_arg0.actionSFX = "ui_select_screen_return"
	local f2_local0 = function ()
		local f3_local0 = f0_local0( f2_arg0, f2_arg1 )
		if f2_arg0:IsDisabled() == true == f3_local0 then
			f2_arg0:SetButtonDisabled( not f3_local0 )
			if f2_arg0:IsDisabled() then
				ACTIONS.AnimateSequenceByElement( f2_arg0, {
					elementName = "UnlockCriteria",
					sequenceName = "Visible",
					elementPath = "UnlockCriteria"
				} )
			else
				ACTIONS.AnimateSequenceByElement( f2_arg0, {
					elementName = "UnlockCriteria",
					sequenceName = "Hidden",
					elementPath = "UnlockCriteria"
				} )
			end
		end
	end
	
	f2_arg0:addEventHandler( "update_drafted", f2_local0 )
	f2_arg0:SubscribeToModelThroughElement( f2_arg0, "rig.isUnlocked", f2_local0 )
	f2_arg0:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		if f0_local0( f2_arg0, f2_arg1 ) then
			local f4_local0 = f2_arg0:GetCurrentMenu()
			local f4_local1 = function ()
				ACTIONS.EquipRig( f2_arg0, f4_arg0, f2_arg1 )
				local f5_local0 = f4_local0.rigDataSource.rigRef:GetValue( f2_arg1 )
				local f5_local1 = Cac.GetPreferencesForRig( f4_local0.squadMemberDataSource.archetypePreferences, f5_local0, f2_arg1 )
				local f5_local2 = f5_local1.archetypeSuper:GetValue( f2_arg1 )
				FrontEndScene.SetCharacterToRig( FrontEndScene.ClientCharacters.Self, f5_local0, f4_local0.squadMemberDataSource.archetypePreferences, f2_arg1 )
				FrontEndScene.SetWeaponForSuper( FrontEndScene.ClientCharacters.Self, f5_local2, f5_local0 )
				FrontEndScene.PlayIdleForSuper( FrontEndScene.ClientCharacters.Self, f5_local2, f5_local0 )
				LUI.FlowManager.RequestLeaveMenu( f2_arg0, true, true )
			end
			
			if CONDITIONS.IsDraftEnabled() and f4_local0.XUID then
				local f4_local2 = f2_arg0:GetDataSource()
				f4_local2 = f4_local2.rig.ref:GetValue( f2_arg1 )
				local f4_local3 = Cac.GetRigTableIndex( f4_local2 )
				LoadoutDrafting.RequestRig( f2_arg1, f4_local3 )
				LUI.FlowManager.RequestPopupMenu( f2_arg0, "RequestDraftPopup", true, f2_arg1, false, {
					refreshFunction = function ()
						local f6_local0 = LoadoutDrafting.GetPlayerXUIDWithRig( f2_arg1, f4_local3 )
						if not Engine.IsXUIDInvalid( f6_local0 ) then
							if f6_local0 == f4_local0.XUID then
								LUI.FlowManager.RequestLeaveMenuByName( "RequestDraftPopup" )
								local f6_local1 = Cac.GetPreferencesForRig( f4_local0.squadMemberDataSource.archetypePreferences, f4_local2, f2_arg1 )
								f6_local1.archetypeSuper:SetValue( f2_arg1, Cac.superNoneValue )
								f6_local1.archetypePerk:SetValue( f2_arg1, Cac.traitNoneValue )
								f4_local1()
							else
								LUI.FlowManager.RequestLeaveMenuByName( "RequestDraftPopup" )
								LUI.FlowManager.RequestPopupMenu( f2_arg0, "DraftFailed", true, f2_arg1, false )
								f2_local0()
							end
						end
					end
				} )
			elseif CONDITIONS.UseLoadoutRestrictions() then
				local f4_local2 = f2_arg0:GetDataSource()
				f4_local2 = f4_local2.rig.ref:GetValue( f2_arg1 )
				local f4_local3 = Cac.GetPreferencesForRig( f4_local0.squadMemberDataSource.archetypePreferences, f4_local2, f2_arg1 )
				f4_local3.archetypeSuper:SetValue( f2_arg1, Engine.TableLookupMultipleKeys( CSV.proDefaults.file, {
					{
						col = CSV.proDefaults.cols.itemType,
						key = "super"
					},
					{
						col = CSV.proDefaults.cols.rigRef,
						key = f4_local2
					}
				}, CSV.proDefaults.cols.itemRef ) )
				f4_local3.archetypePerk:SetValue( f2_arg1, Engine.TableLookupMultipleKeys( CSV.proDefaults.file, {
					{
						col = CSV.proDefaults.cols.itemType,
						key = "trait"
					},
					{
						col = CSV.proDefaults.cols.rigRef,
						key = f4_local2
					}
				}, CSV.proDefaults.cols.itemRef ) )
				f4_local1()
			else
				f4_local1()
			end
		end
	end )
	f2_arg0:addEventHandler( "button_over", function ( f7_arg0, f7_arg1 )
		f7_arg0:dispatchEventToCurrentMenu( {
			name = "selection_changed",
			enable = true
		} )
	end )
	f2_arg0:addEventHandler( "button_over_disable", function ( f8_arg0, f8_arg1 )
		f8_arg0:dispatchEventToCurrentMenu( {
			name = "selection_changed",
			enable = false
		} )
	end )
	if CONDITIONS.UseCACBreadCrumbs() then
		assert( f2_arg0.NewItemNotification )
		f2_arg0:SubscribeToModelThroughElement( f2_arg0, "ref", function ()
			local f9_local0 = f2_arg0:GetDataSource()
			Cac.UpdateNewItemNotification( f2_arg1, f9_local0.ref:GetValue( f2_arg1 ), CSV.rigUnlockTable, "rig", f2_arg0.NewItemNotification )
		end )
		f2_arg0:addEventHandler( "gain_focus", function ( f10_arg0, f10_arg1 )
			local f10_local0 = LUI.FlowManager.GetScopedData( f10_arg0 )
			local f10_local1 = f2_arg0:GetDataSource()
			f10_local0.currentRig = f10_local1.ref:GetValue( f2_arg1 )
		end )
		f2_arg0:addEventHandler( "lose_focus", function ( f11_arg0, f11_arg1 )
			local f11_local0 = LUI.FlowManager.GetScopedData( f11_arg0 )
			Cac.ClearNewItemNotification( f2_arg1, f11_local0.currentRig, CSV.rigUnlockTable, "rig", f2_arg0.NewItemNotification )
		end )
	end
	local f2_local1 = function ()
		local f12_local0 = f2_arg0:GetCurrentMenu()
		local f12_local1 = f2_arg0:GetDataSource()
		f12_local1 = f12_local1.rig.ref:GetValue( f2_arg1 )
		local f12_local2 = Cac.GetPreferencesForRig( f12_local0.squadMemberDataSource.archetypePreferences, f12_local1, f2_arg1 )
		Cac.RequestAndSetRig( f12_local1, f12_local2.head:GetValue( f2_arg1 ), f12_local2.body:GetValue( f2_arg1 ), f12_local2.archetypeSuper:GetValue( f2_arg1 ) )
	end
	
	f2_arg0:addEventHandler( "button_over", function ( f13_arg0, f13_arg1 )
		f2_local1()
		ACTIONS.AnimateSequence( f2_arg0, "TextOverUnlocked" )
	end )
	f2_arg0:addEventHandler( "button_up", function ( f14_arg0, f14_arg1 )
		ACTIONS.AnimateSequence( f2_arg0, "TextUpUnlocked" )
	end )
	f2_arg0:addEventHandler( "button_over_disable", function ( f15_arg0, f15_arg1 )
		f2_local1()
		ACTIONS.AnimateSequence( f2_arg0, "TextOverLocked" )
	end )
	f2_arg0:addEventHandler( "button_disable", function ( f16_arg0, f16_arg1 )
		ACTIONS.AnimateSequence( f2_arg0, "TextUpLocked" )
	end )
	if Onboarding.RigTutorial:WasCompleted( f2_arg1 ) then
		local bindButton = LUI.UIBindButton.new()
		bindButton.id = "selfBindButton"
		f2_arg0:addElement( bindButton )
		f2_arg0.bindButton = bindButton
		
		f2_arg0.bindButton:addEventHandler( "button_alt2", function ( f17_arg0, f17_arg1 )
			local f17_local0 = f17_arg0:getParent()
			if #f17_local0:getAllFocusedChildren() <= 0 then
				f17_local0 = f17_arg0:getParent()
				if f17_local0:isInFocus() then
					f17_local0 = f0_local0( f2_arg0, f2_arg1 )
					if f17_local0 ~= nil and f17_local0 then
						ACTIONS.EquipRig( f2_arg0, f17_arg0, f2_arg1 )
						if CONDITIONS.IsPublicMatch( f2_arg0 ) then
							ACTIONS.OpenPublicRigCustomization( f2_arg0, f2_arg1 )
						else
							ACTIONS.OpenPrivateRigCustomization( f2_arg0, f2_arg1 )
						end
					end
				end
			else
				f17_local0 = f0_local0( f2_arg0, f2_arg1 )
				if f17_local0 ~= nil and f17_local0 then
					ACTIONS.EquipRig( f2_arg0, f17_arg0, f2_arg1 )
					if CONDITIONS.IsPublicMatch( f2_arg0 ) then
						ACTIONS.OpenPublicRigCustomization( f2_arg0, f2_arg1 )
					else
						ACTIONS.OpenPrivateRigCustomization( f2_arg0, f2_arg1 )
					end
				end
			end
		end )
	else
		f2_arg0.PersonalizeDarkener:SetAlpha( 0 )
		f2_arg0.EditText:SetAlpha( 0 )
		local bindButton = {
			{
				function ()
					
				end
			}
		}
		for f2_local6, f2_local7 in ipairs( {
			"ButtonOver",
			"ButtonUp",
			"TextOverLocked",
			"TextOverUnlocked",
			"TextUpLocked",
			"TextDownUnlocked"
		} ) do
			f2_arg0.PersonalizeDarkener:RegisterAnimationSequence( f2_local7, emptyAnimation )
			f2_arg0.EditText:RegisterAnimationSequence( f2_local7, emptyAnimation )
			f2_arg0.Button:RegisterAnimationSequence( f2_local7, emptyAnimation )
		end
	end
	assert( f2_arg0.UnlockCriteria )
	local bindButton = function ()
		local f19_local0 = f2_arg0:GetDataSource()
		f19_local0 = f19_local0.ref:GetValue( f2_arg1 )
		if CONDITIONS.IsDraftEnabled() then
			local f19_local1 = f2_arg0:getParent()
			if f19_local1.XUID then
				local f19_local2 = LoadoutDrafting.GetPlayerXUIDWithRig( f2_arg1, Cac.GetRigIndex( f19_local0 ) )
				if not Engine.IsXUIDInvalid( f19_local2 ) then
					f2_arg0.UnlockCriteria.UnlockDesc:SetAlpha( 1, 0 )
					local f19_local3 = f2_arg0:getParent()
					if f19_local2 == f19_local3.XUID then
						f2_arg0.UnlockCriteria.UnlockDesc:setText( Engine.Localize( "MP_FRONTEND_ONLY_YOU_HAVE_DRAFTED" ) )
					else
						f2_arg0.UnlockCriteria.UnlockDesc:setText( Engine.Localize( "MP_FRONTEND_ONLY_ANOTHER_PLAYER_DRAFTED" ) )
					end
					return 
				end
			end
		end
		f2_arg0.UnlockCriteria.UnlockDesc:setText( GetRigUnlockText( f19_local0 ) )
	end
	
	f2_arg0:addEventHandler( "update_drafted", bindButton )
	f2_arg0.UnlockCriteria:SubscribeToModelThroughElement( f2_arg0, "ref", bindButton )
	f2_arg0:SubscribeToModelThroughElement( f2_arg0, "rig.isEquipped", function ()
		local f20_local0 = f2_arg0:GetDataSource()
		if f20_local0.rig.isEquipped:GetValue( f2_arg1 ) ~= nil then
			f20_local0 = f2_arg0:GetDataSource()
			if f20_local0.rig.isEquipped:GetValue( f2_arg1 ) == true then
				ACTIONS.AnimateSequenceByElement( f2_arg0, {
					elementName = "Selected",
					sequenceName = "Activate",
					elementPath = "Selected"
				} )
			end
		end
		f20_local0 = f2_arg0:GetDataSource()
		if f20_local0.rig.isEquipped:GetValue( f2_arg1 ) ~= nil then
			f20_local0 = f2_arg0:GetDataSource()
			if f20_local0.rig.isEquipped:GetValue( f2_arg1 ) == false then
				ACTIONS.AnimateSequenceByElement( f2_arg0, {
					elementName = "Selected",
					sequenceName = "Inactive",
					elementPath = "Selected"
				} )
			end
		end
	end )
end

function RigSelectButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 426 * _1080p, 0, 125 * _1080p )
	self.id = "RigSelectButton"
	self._animationSets = {}
	self._sequences = {}
	local f21_local1 = controller and controller.controllerIndex
	if not f21_local1 and not Engine.InFrontend() then
		f21_local1 = self:getRootController()
	end
	assert( f21_local1 )
	local f21_local2 = self
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetRGBFromInt( 0, 0 )
	Border:SetAlpha( 0.1, 0 )
	Border:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 640, 0, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local GenericItemBackground = nil
	
	GenericItemBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f21_local1
	} )
	GenericItemBackground.id = "GenericItemBackground"
	GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local PersonalizeDarkener = nil
	
	PersonalizeDarkener = LUI.UIImage.new()
	PersonalizeDarkener.id = "PersonalizeDarkener"
	PersonalizeDarkener:SetRGBFromInt( 0, 0 )
	PersonalizeDarkener:SetAlpha( 0, 0 )
	PersonalizeDarkener:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * 214, _1080p * -30, 0 )
	self:addElement( PersonalizeDarkener )
	self.PersonalizeDarkener = PersonalizeDarkener
	
	local RigDescription = nil
	
	RigDescription = LUI.UIText.new()
	RigDescription.id = "RigDescription"
	RigDescription:SetAlpha( 0, 0 )
	RigDescription:SetFontSize( 18 * _1080p )
	RigDescription:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	RigDescription:SetAlignment( LUI.Alignment.Left )
	RigDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 358, _1080p * 620, _1080p * 31.5, _1080p * 49.5 )
	RigDescription:SubscribeToModelThroughElement( self, "desc", function ()
		local f22_local0 = self:GetDataSource()
		f22_local0 = f22_local0.desc:GetValue( f21_local1 )
		if f22_local0 ~= nil then
			RigDescription:setText( f22_local0, 0 )
		end
	end )
	self:addElement( RigDescription )
	self.RigDescription = RigDescription
	
	local RigImage = nil
	
	RigImage = LUI.UIImage.new()
	RigImage.id = "RigImage"
	RigImage:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 20, _1080p * -118, _1080p * -43.5, _1080p * 114.5 )
	RigImage:SubscribeToModelThroughElement( self, "image", function ()
		local f23_local0 = self:GetDataSource()
		f23_local0 = f23_local0.image:GetValue( f21_local1 )
		if f23_local0 ~= nil then
			RigImage:setImage( RegisterMaterial( f23_local0 ), 0 )
		end
	end )
	self:addElement( RigImage )
	self.RigImage = RigImage
	
	local Mask = nil
	
	Mask = LUI.UIImage.new()
	Mask.id = "Mask"
	Mask:setImage( RegisterMaterial( "wdg_large_mask" ), 0 )
	Mask:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( Mask )
	self.Mask = Mask
	
	local Button = nil
	
	Button = LUI.UIText.new()
	Button.id = "Button"
	Button:SetRGBFromInt( 14277081, 0 )
	Button:SetAlpha( 0, 0 )
	Button:setText( Engine.Localize( "LUA_MENU_PAD_ALT2_BUTTON" ), 0 )
	Button:SetFontSize( 24 * _1080p )
	Button:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Button:SetAlignment( LUI.Alignment.Left )
	Button:SetOptOutRightToLeftAlignmentFlip( true )
	Button:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * 162, _1080p * 247, _1080p * -27, _1080p * -3 )
	self:addElement( Button )
	self.Button = Button
	
	local EditText = nil
	
	EditText = LUI.UIText.new()
	EditText.id = "EditText"
	EditText:SetRGBFromInt( 14277081, 0 )
	EditText:SetAlpha( 0, 0 )
	EditText:setText( Engine.Localize( "LUA_MENU_MP_PERSONALIZE" ), 0 )
	EditText:SetFontSize( 20 * _1080p )
	EditText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	EditText:SetAlignment( LUI.Alignment.Right )
	EditText:SetOptOutRightToLeftAlignmentFlip( true )
	EditText:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -120, _1080p * 157, _1080p * -24, _1080p * -4 )
	self:addElement( EditText )
	self.EditText = EditText
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f21_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local f21_local12 = nil
	if Engine.InFrontend() then
		f21_local12 = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
			controllerIndex = f21_local1
		} )
		f21_local12.id = "TitleBackground"
		f21_local12.DropShadow:SetAlpha( 0, 0 )
		f21_local12:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
		self:addElement( f21_local12 )
		self.TitleBackground = f21_local12
	end
	local FrameLabel = nil
	
	FrameLabel = LUI.UIText.new()
	FrameLabel.id = "FrameLabel"
	FrameLabel:SetRGBFromInt( 14277081, 0 )
	FrameLabel:SetFontSize( 19 * _1080p )
	FrameLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FrameLabel:SetAlignment( LUI.Alignment.Right )
	FrameLabel:SetOptOutRightToLeftAlignmentFlip( true )
	FrameLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 2.5, _1080p * 21.5 )
	FrameLabel:SubscribeToModelThroughElement( self, "name", function ()
		local f24_local0 = self:GetDataSource()
		f24_local0 = f24_local0.name:GetValue( f21_local1 )
		if f24_local0 ~= nil then
			FrameLabel:setText( ToUpperCase( f24_local0 ), 0 )
		end
	end )
	self:addElement( FrameLabel )
	self.FrameLabel = FrameLabel
	
	local UnlockCriteria = nil
	
	UnlockCriteria = MenuBuilder.BuildRegisteredType( "UnlockCriteria", {
		controllerIndex = f21_local1
	} )
	UnlockCriteria.id = "UnlockCriteria"
	UnlockCriteria:SetAlpha( 0, 0 )
	UnlockCriteria.UnlockDesc:SetRight( _1080p * 300, 0 )
	UnlockCriteria.UnlockDesc:setText( "", 0 )
	UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 342, _1080p * 625, _1080p * 58.5, _1080p * 90.5 )
	self:addElement( UnlockCriteria )
	self.UnlockCriteria = UnlockCriteria
	
	local UnlockIcon = nil
	
	UnlockIcon = LUI.UIImage.new()
	UnlockIcon.id = "UnlockIcon"
	UnlockIcon:SetAlpha( 0, 0 )
	UnlockIcon:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	UnlockIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 342, _1080p * 374, _1080p * -4, _1080p * 28 )
	self:addElement( UnlockIcon )
	self.UnlockIcon = UnlockIcon
	
	local f21_local16 = nil
	if CONDITIONS.UseCACBreadCrumbs( self ) then
		f21_local16 = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
			controllerIndex = f21_local1
		} )
		f21_local16.id = "NewItemNotification"
		f21_local16:SetAlpha( 0, 0 )
		f21_local16:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -25.5, _1080p * 38.5 )
		self:addElement( f21_local16 )
		self.NewItemNotification = f21_local16
	end
	local Selected = nil
	
	Selected = MenuBuilder.BuildRegisteredType( "CaCSelectedMessage", {
		controllerIndex = f21_local1
	} )
	Selected.id = "Selected"
	Selected.EndCapRight:SetAlpha( 1, 0 )
	Selected:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -317, 0, _1080p * -20, 0 )
	self:addElement( Selected )
	self.Selected = Selected
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		GenericItemBackground:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 214, _1080p * 24, 0, 100 )
				end
			}
		} )
		PersonalizeDarkener:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.PersonalizeDarkener:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.PersonalizeDarkener:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 214, _1080p * 95, 0, 100 )
				end
			}
		} )
		RigImage:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.RigImage:SetScale( 0.05, 100 )
				end
			}
		} )
		if Engine.InFrontend() then
			f21_local12:RegisterAnimationSequence( "ButtonOver", {
				{
					function ()
						return self.TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * 214, 0, _1080p * 24, 100 )
					end
				}
			} )
		end
		FrameLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 0, 100 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 234, _1080p * 194, _1080p * 2.5, _1080p * 21.5, 100 )
				end
			}
		} )
		Selected:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Selected:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -103, _1080p * 214, _1080p * -20, 0, 100 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			GenericItemBackground:AnimateSequence( "ButtonOver" )
			PersonalizeDarkener:AnimateSequence( "ButtonOver" )
			RigImage:AnimateSequence( "ButtonOver" )
			if Engine.InFrontend() then
				f21_local12:AnimateSequence( "ButtonOver" )
			end
			FrameLabel:AnimateSequence( "ButtonOver" )
			Selected:AnimateSequence( "ButtonOver" )
		end
		
		GenericItemBackground:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0, 200 )
				end
			}
		} )
		PersonalizeDarkener:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.PersonalizeDarkener:SetAlpha( 0, 200 )
				end
			},
			{
				function ()
					return self.PersonalizeDarkener:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 95, 0, 200 )
				end
			}
		} )
		RigImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.RigImage:SetScale( 0, 200 )
				end
			}
		} )
		if Engine.InFrontend() then
			f21_local12:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24, 200 )
					end
				}
			} )
		end
		FrameLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 14277081, 200 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 2.5, _1080p * 21.5, 200 )
				end
			}
		} )
		Selected:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Selected:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -317, 0, _1080p * -20, 0, 200 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			GenericItemBackground:AnimateSequence( "ButtonUp" )
			PersonalizeDarkener:AnimateSequence( "ButtonUp" )
			RigImage:AnimateSequence( "ButtonUp" )
			if Engine.InFrontend() then
				f21_local12:AnimateSequence( "ButtonUp" )
			end
			FrameLabel:AnimateSequence( "ButtonUp" )
			Selected:AnimateSequence( "ButtonUp" )
		end
		
		RigImage:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.RigImage:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.RigImage:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			RigImage:AnimateSequence( "Locked" )
		end
		
		RigImage:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.RigImage:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			RigImage:AnimateSequence( "Unlocked" )
		end
		
		PersonalizeDarkener:RegisterAnimationSequence( "TextOverUnlocked", {
			{
				function ()
					return self.PersonalizeDarkener:SetAlpha( 1, 110 )
				end
			}
		} )
		RigDescription:RegisterAnimationSequence( "TextOverUnlocked", {
			{
				function ()
					return self.RigDescription:SetAlpha( 0, 100 )
				end,
				function ()
					return self.RigDescription:SetAlpha( 1, 10 )
				end
			}
		} )
		RigImage:RegisterAnimationSequence( "TextOverUnlocked", {
			{
				function ()
					return self.RigImage:SetAlpha( 1, 110 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "TextOverUnlocked", {
			{
				function ()
					return self.Button:SetAlpha( 0, 100 )
				end,
				function ()
					return self.Button:SetAlpha( 1, 10 )
				end
			}
		} )
		EditText:RegisterAnimationSequence( "TextOverUnlocked", {
			{
				function ()
					return self.EditText:SetAlpha( 0, 100 )
				end,
				function ()
					return self.EditText:SetAlpha( 1, 10 )
				end
			}
		} )
		UnlockCriteria:RegisterAnimationSequence( "TextOverUnlocked", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 0 )
				end
			}
		} )
		UnlockIcon:RegisterAnimationSequence( "TextOverUnlocked", {
			{
				function ()
					return self.UnlockIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.TextOverUnlocked = function ()
			PersonalizeDarkener:AnimateSequence( "TextOverUnlocked" )
			RigDescription:AnimateSequence( "TextOverUnlocked" )
			RigImage:AnimateSequence( "TextOverUnlocked" )
			Button:AnimateSequence( "TextOverUnlocked" )
			EditText:AnimateSequence( "TextOverUnlocked" )
			UnlockCriteria:AnimateSequence( "TextOverUnlocked" )
			UnlockIcon:AnimateSequence( "TextOverUnlocked" )
		end
		
		PersonalizeDarkener:RegisterAnimationSequence( "TextUpUnlocked", {
			{
				function ()
					return self.PersonalizeDarkener:SetAlpha( 0, 0 )
				end
			}
		} )
		RigDescription:RegisterAnimationSequence( "TextUpUnlocked", {
			{
				function ()
					return self.RigDescription:SetAlpha( 1, 0 )
				end,
				function ()
					return self.RigDescription:SetAlpha( 0, 10 )
				end
			}
		} )
		RigImage:RegisterAnimationSequence( "TextUpUnlocked", {
			{
				function ()
					return self.RigImage:SetAlpha( 1, 0 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "TextUpUnlocked", {
			{
				function ()
					return self.Button:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Button:SetAlpha( 0, 10 )
				end
			}
		} )
		EditText:RegisterAnimationSequence( "TextUpUnlocked", {
			{
				function ()
					return self.EditText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.EditText:SetAlpha( 0, 10 )
				end
			}
		} )
		UnlockCriteria:RegisterAnimationSequence( "TextUpUnlocked", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 0 )
				end
			}
		} )
		UnlockIcon:RegisterAnimationSequence( "TextUpUnlocked", {
			{
				function ()
					return self.UnlockIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.TextUpUnlocked = function ()
			PersonalizeDarkener:AnimateSequence( "TextUpUnlocked" )
			RigDescription:AnimateSequence( "TextUpUnlocked" )
			RigImage:AnimateSequence( "TextUpUnlocked" )
			Button:AnimateSequence( "TextUpUnlocked" )
			EditText:AnimateSequence( "TextUpUnlocked" )
			UnlockCriteria:AnimateSequence( "TextUpUnlocked" )
			UnlockIcon:AnimateSequence( "TextUpUnlocked" )
		end
		
		PersonalizeDarkener:RegisterAnimationSequence( "TextOverLocked", {
			{
				function ()
					return self.PersonalizeDarkener:SetAlpha( 0, 0 )
				end
			}
		} )
		RigDescription:RegisterAnimationSequence( "TextOverLocked", {
			{
				function ()
					return self.RigDescription:SetAlpha( 0, 0 )
				end
			}
		} )
		RigImage:RegisterAnimationSequence( "TextOverLocked", {
			{
				function ()
					return self.RigImage:SetAlpha( 0.5, 0 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "TextOverLocked", {
			{
				function ()
					return self.Button:SetAlpha( 0, 0 )
				end
			}
		} )
		EditText:RegisterAnimationSequence( "TextOverLocked", {
			{
				function ()
					return self.EditText:SetAlpha( 0, 0 )
				end
			}
		} )
		UnlockCriteria:RegisterAnimationSequence( "TextOverLocked", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 90 )
				end,
				function ()
					return self.UnlockCriteria:SetAlpha( 1, 10 )
				end
			}
		} )
		UnlockIcon:RegisterAnimationSequence( "TextOverLocked", {
			{
				function ()
					return self.UnlockIcon:SetAlpha( 1, 90 )
				end,
				function ()
					return self.UnlockIcon:SetAlpha( 0, 10 )
				end
			}
		} )
		self._sequences.TextOverLocked = function ()
			PersonalizeDarkener:AnimateSequence( "TextOverLocked" )
			RigDescription:AnimateSequence( "TextOverLocked" )
			RigImage:AnimateSequence( "TextOverLocked" )
			Button:AnimateSequence( "TextOverLocked" )
			EditText:AnimateSequence( "TextOverLocked" )
			UnlockCriteria:AnimateSequence( "TextOverLocked" )
			UnlockIcon:AnimateSequence( "TextOverLocked" )
		end
		
		PersonalizeDarkener:RegisterAnimationSequence( "TextUpLocked", {
			{
				function ()
					return self.PersonalizeDarkener:SetAlpha( 0, 0 )
				end
			}
		} )
		RigDescription:RegisterAnimationSequence( "TextUpLocked", {
			{
				function ()
					return self.RigDescription:SetAlpha( 1, 0 )
				end,
				function ()
					return self.RigDescription:SetAlpha( 0, 10 )
				end
			}
		} )
		RigImage:RegisterAnimationSequence( "TextUpLocked", {
			{
				function ()
					return self.RigImage:SetAlpha( 0.5, 0 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "TextUpLocked", {
			{
				function ()
					return self.Button:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Button:SetAlpha( 0, 10 )
				end
			}
		} )
		EditText:RegisterAnimationSequence( "TextUpLocked", {
			{
				function ()
					return self.EditText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.EditText:SetAlpha( 0, 10 )
				end
			}
		} )
		UnlockCriteria:RegisterAnimationSequence( "TextUpLocked", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 0 )
				end
			}
		} )
		UnlockIcon:RegisterAnimationSequence( "TextUpLocked", {
			{
				function ()
					return self.UnlockIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.TextUpLocked = function ()
			PersonalizeDarkener:AnimateSequence( "TextUpLocked" )
			RigDescription:AnimateSequence( "TextUpLocked" )
			RigImage:AnimateSequence( "TextUpLocked" )
			Button:AnimateSequence( "TextUpLocked" )
			EditText:AnimateSequence( "TextUpLocked" )
			UnlockCriteria:AnimateSequence( "TextUpLocked" )
			UnlockIcon:AnimateSequence( "TextUpLocked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f94_arg0, f94_arg1 )
		local f94_local0 = f94_arg1.controller or f21_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f95_arg0, f95_arg1 )
		local f95_local0 = f95_arg1.controller or f21_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_over_disable", function ( f96_arg0, f96_arg1 )
		local f96_local0 = f96_arg1.controller or f21_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_disable", function ( f97_arg0, f97_arg1 )
		local f97_local0 = f97_arg1.controller or f21_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local1( self, f21_local1, controller )
	return self
end

MenuBuilder.registerType( "RigSelectButton", RigSelectButton )
LockTable( _M )
