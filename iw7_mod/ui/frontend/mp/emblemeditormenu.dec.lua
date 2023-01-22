local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.FlowManager.RegisterFenceGroup( "EmblemEditorMenu", {
	"canCreateEmblem"
} )
EmblemEditor.ColorPickerMode = {
	CLOSED = 0,
	COLOR_GRID = 1,
	COLOR_MIXER = 2,
	MATERIAL_PICKER = 3
}
EmblemEditor.ScaleMode = {
	FIXED_SCALE = 0,
	FREE_SCALE = 1
}
EmblemEditor.gridVisible = false
EmblemEditor.useAlternateGridColor = false
EmblemEditor.gridLineWidth = 2
EmblemEditor.maximumGridLines = 10
EmblemEditor.dirty = false
EmblemEditor.layerIconChanged = false
EmblemEditor.colorPickerMode = EmblemEditor.ColorPickerMode.CLOSED
EmblemEditor.selectingFavoriteColors = false
f0_local0 = "frontEnd.MP.headQuarters.emblemEditor"
f0_local1 = function ( f1_arg0, f1_arg1 )
	EmblemEditor.gridVisible = not EmblemEditor.gridVisible
	f1_arg0:dispatchEventToRoot( {
		name = "grid_modified",
		immediate = true
	} )
	LUI.FlowManager.RequestLeaveMenuByName( "EditorOptionsPopup" )
end

f0_local2 = function ( f2_arg0, f2_arg1 )
	EmblemEditor.useAlternateGridColor = not EmblemEditor.useAlternateGridColor
	f2_arg0:dispatchEventToRoot( {
		name = "grid_modified",
		immediate = true
	} )
	LUI.FlowManager.RequestLeaveMenuByName( "EditorOptionsPopup" )
end

MenuBuilder.registerType( "EditorOptionsPopup", function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg1.controllerIndex
	local f3_local1 = MenuBuilder.BuildRegisteredType( "PopupMessageAndButtons", {
		title = Engine.Localize( "MP_EMBLEM_EDITOR_OPTIONS_MENU_TITLE" ),
		width = 400,
		message = "",
		defaultFocusIndex = 1,
		cancelClosesPopup = true,
		buttonsClosePopup = false,
		buttons = {
			{
				label = EmblemEditor.gridVisible and Engine.Localize( "MP_EMBLEM_EDITOR_TOGGLE_GRID_OFF" ) or Engine.Localize( "MP_EMBLEM_EDITOR_TOGGLE_GRID_ON" ),
				action = function ( f4_arg0, f4_arg1 )
					f0_local1( f4_arg0, f4_arg1 )
				end
			},
			{
				label = EmblemEditor.useAlternateGridColor and Engine.Localize( "MP_EMBLEM_EDITOR_TOGGLE_GRID_ALT_COLOR_OFF" ) or Engine.Localize( "MP_EMBLEM_EDITOR_TOGGLE_GRID_ALT_COLOR_ON" ),
				action = function ( f5_arg0, f5_arg1 )
					f0_local2( f5_arg0, f5_arg1 )
				end,
				disabled = not EmblemEditor.gridVisible
			}
		}
	} )
	f3_local1.id = "EditorOptionsPopup"
	return f3_local1
end )
local f0_local3 = function ( f6_arg0 )
	LUI.FlowManager.RegisterStackPushBehaviour( "EditorOptionsPopup", function ()
		EmblemEditor.EndEdit( f6_arg0 )
	end )
	LUI.FlowManager.RegisterStackPopBehaviour( "EditorOptionsPopup", function ()
		EmblemEditor.BeginEdit( f6_arg0 )
	end )
end

function HandleEditLayer( f9_arg0, f9_arg1 )
	if LUI.UIGrid.GetFocusPosition( f9_arg0.LayersGrid, LUI.DIRECTION.horizontal ) ~= nil then
		local f9_local0 = EmblemEditor.GetSelectedLayerIndex()
		if EmblemEditor.IsLayerEmpty( f9_local0 ) then
			HandleChooseLayerIcon( f9_arg0, f9_arg1 )
		else
			StartEditingLayer( f9_arg0, f9_arg1.controller, f9_local0 )
		end
	end
end

function HandleClearLayer( f10_arg0, f10_arg1 )
	if LUI.UIGrid.GetFocusPosition( f10_arg0.LayersGrid, LUI.DIRECTION.horizontal ) ~= nil then
		EmblemEditor.dirty = true
		f10_arg0:playSound( "clearLayer" )
		local f10_local0 = EmblemEditor.GetSelectedLayerIndex()
		EmblemEditor.ClearLayer( f10_local0 )
		EmblemEditor.CreateEmblemEditorDataModel( f10_arg1.controller, f10_local0 )
		UpdateButtonHelper( f10_arg0, f10_arg1.controller )
	end
end

function HandleCopyLayer( f11_arg0, f11_arg1 )
	if LUI.UIGrid.GetFocusPosition( f11_arg0.LayersGrid, LUI.DIRECTION.horizontal ) ~= nil then
		local f11_local0 = EmblemEditor.GetSelectedLayerIndex()
		if not EmblemEditor.IsLayerEmpty( f11_local0 ) then
			f11_arg0:playSound( "copyLayer" )
			EmblemEditor.CopyLayer( f11_local0 )
			UpdateButtonHelper( f11_arg0, f11_arg1.controller )
		end
	end
end

function HandleCutLayer( f12_arg0, f12_arg1 )
	HandleCopyLayer( f12_arg0, f12_arg1 )
	HandleClearLayer( f12_arg0, f12_arg1 )
end

function HandlePasteLayer( f13_arg0, f13_arg1 )
	if LUI.UIGrid.GetFocusPosition( f13_arg0.LayersGrid, LUI.DIRECTION.horizontal ) ~= nil then
		f13_arg0:playSound( "pasteLayer" )
		EmblemEditor.dirty = true
		local f13_local0 = EmblemEditor.GetSelectedLayerIndex()
		EmblemEditor.PasteLayer( f13_local0 )
		EmblemEditor.CreateEmblemEditorDataModel( f13_arg1.controller, f13_local0 )
		UpdateButtonHelper( f13_arg0, f13_arg1.controller )
	end
end

function HandleChooseLayerIcon( f14_arg0, f14_arg1 )
	if not EmblemEditorUtils.IsEditingLayer() and LUI.UIGrid.GetFocusPosition( f14_arg0.LayersGrid, LUI.DIRECTION.horizontal ) ~= nil then
		LUI.FlowManager.RequestAddMenu( "EmblemDecalLibraryMenu", false, controllerIndex, nil, nil, true )
	end
end

function HandleBackConfirmation( f15_arg0, f15_arg1 )
	if EmblemEditorUtils.IsEditingLayer() then
		StopEditingLayer( f15_arg0, f15_arg1.controller )
		ACTIONS.GainFocus( f15_arg0, "LayersGrid", f15_arg1.controller )
	elseif EmblemEditor.dirty then
		local f15_local0 = f15_arg0:GetDataSource()
		if (f15_local0.selectedEmblem.layersUsed:GetValue( f15_arg1.controller ) or 0) > 0 then
			LUI.FlowManager.RequestPopupMenu( f15_arg0, "EmblemEditorSavePopup", true, f15_arg1.controller, false, {
				emblemName = EmblemEditor.GetEmblemName()
			} )
		else
			LUI.FlowManager.RequestPopupMenu( f15_arg0, "EmblemEmptyLayersPopup", true, f15_arg1.controller, false, false )
			LUI.FlowManager.RequestLeaveMenu( f15_arg0 )
		end
	else
		LUI.FlowManager.RequestLeaveMenu( f15_arg0 )
	end
end

function HandleDuplicateLayer( f16_arg0, f16_arg1 )
	local f16_local0 = nil
	local f16_local1 = f16_arg0.layersGridCountDataSource:GetValue( f16_arg1.controller ) or 0
	local f16_local2 = EmblemEditor.GetSelectedLayerIndex()
	local f16_local3 = f16_local2 + f16_local1 - 1
	for f16_local4 = f16_local2, f16_local3, 1 do
		local f16_local7 = f16_local4 % f16_local1
		if EmblemEditor.IsLayerEmpty( f16_local7 ) then
			f16_local0 = f16_local7
			break
		end
	end
	if f16_local0 ~= nil then
		EmblemEditor.dirty = true
		EmblemEditor.CopyLayer( EmblemEditor.GetSelectedLayerIndex() )
		EmblemEditor.PasteLayer( f16_local0 )
		SelectLayer( f16_arg0, f16_arg1.controller, f16_local0 )
		f16_arg0.LayersGrid:SetPosition( {
			x = f16_local0,
			y = 0
		}, true )
		EmblemEditor.CreateEmblemEditorDataModel( f16_arg1.controller, f16_local0 )
		UpdateButtonHelper( f16_arg0, f16_arg1.controller )
	end
end

function HandleDoneEditingLayer( f17_arg0, f17_arg1 )
	StopEditingLayer( f17_arg0, f17_arg1.controller )
	ACTIONS.GainFocus( f17_arg0, "LayersGrid", controllerIndex )
end

function HandleGroupLayer( f18_arg0, f18_arg1 )
	EmblemEditor.SetLayerGroupIndex( EmblemEditor.GetSelectedLayerIndex(), 1, f18_arg1.controller )
	UpdateButtonHelper( f18_arg0, f18_arg1.controller )
end

function HandleUngroupLayer( f19_arg0, f19_arg1 )
	EmblemEditor.SetLayerGroupIndex( EmblemEditor.GetSelectedLayerIndex(), 0, f19_arg1.controller )
	UpdateButtonHelper( f19_arg0, f19_arg1.controller )
end

function HandleResetMaterial( f20_arg0, f20_arg1 )
	EmblemEditor.ResetLayerMaterial( f20_arg1.controller )
end

function ShouldShowPasteButtonHelper()
	return not EmblemEditor.IsClipboardEmpty()
end

function ShouldShowGroupLayerButtonHelper()
	return not EmblemEditor.IsLayerGrouped( EmblemEditor.GetSelectedLayerIndex() )
end

function ShouldShowAddToFavoritesButtonHelper( f23_arg0, f23_arg1 )
	return EmblemEditor.CanAddColorToFavorites()
end

function ShouldShowRemoveColorFromFavorites( f24_arg0, f24_arg1 )
	local f24_local0 = f24_arg0.FavoriteColorsPanel.ColorsGrid:GetFocusPositionIndex()
	local f24_local1
	if f24_local0 ~= nil then
		f24_local1 = f24_arg0.FavoriteColorsPanel.ColorsGrid:GetGridDataSource()
		f24_local1 = f24_local1:GetDataSourceAtIndex( f24_local0 )
	else
		f24_local1 = false
	end
	local f24_local2
	if f24_local1 ~= nil then
		f24_local2 = f24_local1.valid:GetValue( f24_arg1 )
	else
		f24_local2 = false
	end
	return f24_local2
end

function ShouldShowUngroupLayerButtonHelper()
	return EmblemEditor.IsLayerGrouped( EmblemEditor.GetSelectedLayerIndex() )
end

function ShouldShowDuplicateLayerButtonHelper( f26_arg0, f26_arg1 )
	local f26_local0 = f26_arg0:GetDataSource()
	if f26_local0 then
		local f26_local1 = f26_local0.selectedEmblem
		local f26_local2 = f26_local0.selectedEmblem.layersUsed:GetValue( f26_arg1 )
	end
	return (f26_local1 and f26_local2 or 0) < (f26_arg0.layersGridCountDataSource:GetValue( f26_arg1 ) or 0)
end

function SetColorPickerMode( f27_arg0, f27_arg1, f27_arg2 )
	EmblemEditor.colorPickerMode = f27_arg2
	f27_arg0.originalLayerColor = EmblemEditor.GetSelectedLayerColor() or -1
	f27_arg0.originalMaterialID = EmblemEditor.GetSelectedLayerMaterialID()
	local f27_local0 = f27_arg0.EmblemEditorToolPanel:SetColorPickerMode( f27_arg1, f27_arg2, f27_arg0.originalLayerColor, f27_arg0.originalMaterialID )
	local f27_local1 = f27_local0
	local f27_local2
	if f27_arg2 ~= EmblemEditor.ColorPickerMode.COLOR_GRID and f27_arg2 ~= EmblemEditor.ColorPickerMode.COLOR_MIXER then
		f27_local2 = false
	else
		f27_local2 = f27_local1 and true
	end
	EmblemEditorUtils.SetVisibleAndEnabled( f27_arg0.FavoriteColorsPanel, f27_local2 )
	if f27_local0 then
		PauseEditingLayer( f27_arg0, f27_arg1 )
	end
	UpdateButtonHelper( f27_arg0, f27_arg1 )
end

function OpenColorMixerPanel( f28_arg0, f28_arg1 )
	SetColorPickerMode( f28_arg0, f28_arg1.controller, EmblemEditor.ColorPickerMode.COLOR_MIXER )
	UpdateMenuTitle( f28_arg0 )
	return false
end

function AddColorToFavorites( f29_arg0, f29_arg1 )
	EmblemEditor.AddColorToFavorites( f29_arg1.controller, EmblemEditor.GetLayerColor() )
	UpdateButtonHelper( f29_arg0, f29_arg1.controller )
end

function RemoveColorFromFavorites( f30_arg0, f30_arg1 )
	local f30_local0 = f30_arg0.FavoriteColorsPanel.ColorsGrid:GetFocusPositionIndex()
	if f30_local0 ~= nil then
		EmblemEditor.RemoveColorFromFavorites( f30_arg1.controller, f30_local0 )
		UpdateButtonHelper( f30_arg0, f30_arg1.controller )
	end
end

function SwitchToFavorites( f31_arg0, f31_arg1 )
	EmblemEditor.selectingFavoriteColors = true
	f31_arg0.FavoriteColorsPanel:processEvent( {
		name = "gain_focus"
	} )
	f31_arg0.EmblemEditorToolPanel:processEvent( {
		name = "lose_focus"
	} )
	UpdateButtonHelper( f31_arg0, f31_arg1.controller )
end

function SwitchToColors( f32_arg0, f32_arg1 )
	if EmblemEditor.colorPickerMode == EmblemEditor.ColorPickerMode.COLOR_GRID then
		ACTIONS.GainFocus( f32_arg0.EmblemEditorToolPanel.ColorPickerGrid, "SelectedColor", f32_arg1.controller )
	else
		ACTIONS.GainFocus( f32_arg0.EmblemEditorToolPanel.ColorMixerPanel, "Red", f32_arg1.controller )
	end
	f32_arg0.FavoriteColorsPanel:processEvent( {
		name = "lose_focus"
	} )
	EmblemEditor.selectingFavoriteColors = false
	UpdateButtonHelper( f32_arg0, f32_arg1.controller )
end

function OpenColorPicker( f33_arg0, f33_arg1 )
	SetColorPickerMode( f33_arg0, f33_arg1.controller, EmblemEditor.ColorPickerMode.COLOR_GRID )
	UpdateMenuTitle( f33_arg0 )
	return false
end

function OpenMaterialPicker( f34_arg0, f34_arg1 )
	SetColorPickerMode( f34_arg0, f34_arg1.controller, EmblemEditor.ColorPickerMode.MATERIAL_PICKER )
	EmblemEditor.BeginEditMaterial( f34_arg1.controller )
	UpdateMenuTitle( f34_arg0 )
	return false
end

function CloseToolPanel( f35_arg0, f35_arg1 )
	if EmblemEditor.colorPickerMode == EmblemEditor.ColorPickerMode.MATERIAL_PICKER then
		EmblemEditor.EndEditMaterial( f35_arg1.controller )
	end
	EmblemEditor.colorPickerMode = EmblemEditor.ColorPickerMode.CLOSED
	EmblemEditor.selectingFavoriteColors = false
	f35_arg0.EmblemEditorToolPanel:CloseToolPanel()
	ACTIONS.LoseFocus( f35_arg0, "FavoriteColorsPanel", f35_arg1.controller )
	ACTIONS.LoseFocus( f35_arg0, "EmblemEditorToolPanel", f35_arg1.controller )
	ResumeEditingLayer( f35_arg0, f35_arg1.controller, EmblemEditor.GetSelectedLayerIndex() )
	f35_arg0.EmblemEditorToolPanel:SetAlpha( 0 )
	EmblemEditorUtils.SetVisibleAndEnabled( f35_arg0.FavoriteColorsPanel, false )
	UpdateButtonHelper( f35_arg0, f35_arg1.controller )
	UpdateMenuTitle( f35_arg0 )
end

local f0_local4 = function ( f36_arg0, f36_arg1 )
	EmblemEditor.ResetLayerMaterial( f36_arg1 )
	EmblemEditor.SetLayerMaterial( f36_arg1, -1 )
end

local f0_local5 = function ( f37_arg0, f37_arg1 )
	if f37_arg0.originalLayerColor then
		local f37_local0 = GetColorTableFromIntColor( f37_arg0.originalLayerColor )
		EmblemEditor.SetLayerColor( f37_local0.r, f37_local0.g, f37_local0.b, f37_arg1.controller )
	end
end

local f0_local6 = function ( f38_arg0, f38_arg1 )
	if f38_arg0.originalMaterialID then
		EmblemEditor.SetLayerMaterial( f38_arg1.controller, f38_arg0.originalMaterialID )
	end
end

local f0_local7 = function ( f39_arg0, f39_arg1 )
	f0_local5( f39_arg0, f39_arg1 )
	f0_local6( f39_arg0, f39_arg1 )
end

local f0_local8 = function ( f40_arg0, f40_arg1 )
	f0_local7( f40_arg0, f40_arg1 )
	CloseToolPanel( f40_arg0, f40_arg1 )
end

local f0_local9 = function ( f41_arg0, f41_arg1 )
	f0_local5( f41_arg0, f41_arg1 )
	f0_local6( f41_arg0, f41_arg1 )
	CloseToolPanel( f41_arg0, f41_arg1 )
end

function OpenOptionsPopup( f42_arg0, f42_arg1 )
	LUI.FlowManager.RequestPopupMenu( f42_arg0, "EditorOptionsPopup", true, f42_arg1.controller, false, {}, nil, false )
end

function UpdateLayersUI( f43_arg0, f43_arg1 )
	local f43_local0 = f43_arg0:GetDataSource()
	f43_local0 = f43_local0.selectedEmblem.selectedLayer:GetValue( f43_arg1 ) or 0
	local f43_local1 = f43_arg0:GetDataSource()
	f43_local1 = f43_local1.selectedEmblem.layersUsed:GetValue( f43_arg1 ) or 0
	local f43_local2 = f43_arg0.layersGridCountDataSource:GetValue( f43_arg1 ) or 0
	if f43_local0 < 0 then
		f43_local0 = f43_local0 + f43_local2
	end
	local f43_local3 = Engine.Localize( "MP_EMBLEM_EDITOR_LAYER_X_OF_Y", tostring( f43_local0 + 1 ), tostring( f43_local2 ) )
	f43_arg0.ArrowsWithLabel:UpdateLabel( f43_local3 )
	f43_arg0.GridItemText:setText( f43_local3 )
	if EmblemEditor.IsLayerEmpty( f43_local0 ) then
		f43_arg0.EditLabelButton.Label:setText( ToUpperCase( Engine.Localize( "MP_EMBLEM_EDITOR_CREATE_NEW" ) ) )
	else
		f43_arg0.EditLabelButton.Label:setText( ToUpperCase( Engine.Localize( "MP_EMBLEM_EDITOR_EDIT_LAYER" ) ) )
	end
	f43_arg0.LayersUsedLabel:setText( Engine.Localize( "MP_EMBLEM_EDITOR_LAYERS_USED", tostring( f43_local1 ), tostring( f43_local2 ) ), 0 )
end

function SelectLayer( f44_arg0, f44_arg1, f44_arg2 )
	EmblemEditor.SelectLayer( f44_arg2 )
	UpdateLayersUI( f44_arg0, f44_arg1 )
end

local f0_local10 = nil
f0_local10 = function ( f45_arg0, f45_arg1 )
	StartEditingLayer( f45_arg0, f45_arg1, EmblemEditor.GetSelectedLayerIndex() )
	f45_arg0.editLayerTimer = nil
end

local f0_local11 = nil
f0_local11 = function ( f46_arg0, f46_arg1 )
	if f46_arg0.buttonHelpers ~= nil then
		for f46_local3, f46_local4 in pairs( f46_arg0.buttonHelpers ) do
			if (f46_local4.condition == nil or f46_local4.condition( f46_arg0, f46_arg1 ) == true) and f46_local4.binding ~= nil then
				if f46_local4.button_ref then
					f46_arg0.bindButton:registerEventHandler( f46_local4.button_ref, function ( element, event )
						f46_local4.binding( f46_arg0, event )
						return true
					end )
				elseif f46_local4.button_ref2 then
					f46_arg0.bindButton:registerEventHandler( f46_local4.button_ref2, function ( element, event )
						f46_local4.binding( f46_arg0, event )
						return true
					end )
				end
			end
		end
	end
	f46_arg0.refreshTimer = nil
end

local f0_local12 = function ()
	local f49_local0
	if EmblemEditor.GetScaleMode() == EmblemEditor.ScaleMode.FIXED_SCALE then
		f49_local0 = Engine.Localize( "@MP_EMBLEM_EDITOR_SCALE_LAYER_FIXED" )
		if not f49_local0 then
		
		else
			return f49_local0
		end
	end
	f49_local0 = Engine.Localize( "@MP_EMBLEM_EDITOR_SCALE_LAYER_FREE" )
end

local f0_local13 = function ()
	return EmblemEditor.GetLayerOpacity( EmblemEditor.GetSelectedLayerIndex() ) * 100
end

local f0_local14 = function ()
	return EmblemEditor.GetLayerRotation( EmblemEditor.GetSelectedLayerIndex() )
end

local f0_local15 = function ( f52_arg0, f52_arg1 )
	EmblemEditor.SetLayerOpacity( EmblemEditor.GetSelectedLayerIndex(), f52_arg0 / 100 )
end

local f0_local16 = function ( f53_arg0, f53_arg1 )
	EmblemEditor.SetLayerRotation( EmblemEditor.GetSelectedLayerIndex(), f53_arg0 )
end

local f0_local17 = function ()
	return EmblemEditor.GetLayerMaterialRotation( EmblemEditor.GetSelectedLayerIndex() )
end

local f0_local18 = function ( f55_arg0, f55_arg1 )
	EmblemEditor.SetLayerMaterialRotation( EmblemEditor.GetSelectedLayerIndex(), f55_arg0 )
end

local f0_local19 = function ()
	EmblemEditor.ToggleOutline( EmblemEditor.GetSelectedLayerIndex() )
end

local f0_local20 = function ()
	EmblemEditor.ToggleFlip( EmblemEditor.GetSelectedLayerIndex() )
end

local f0_local21 = function ( f58_arg0 )
	return function ()
		if not EmblemEditor.HasGroupedLayers() then
			EmblemEditor.ToggleScaleMode( f58_arg0 )
		end
	end
	
end

local f0_local22 = function ( f60_arg0, f60_arg1 )
	local f60_local0 = LUI.FlowManager.GetScopedData( f60_arg0 )
	f60_local0.layerEmptySelectButtonHelpers = {
		{
			helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_CREATE_NEW" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true,
			binding = HandleEditLayer,
			control_panel_only = false,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MENU_DONE" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true,
			binding = HandleBackConfirmation,
			control_panel_only = false,
			button_helper_only = true
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_PASTE_LAYER" ),
			button_ref = "button_start",
			side = "left",
			clickable = true,
			binding = HandlePasteLayer,
			condition = ShouldShowPasteButtonHelper,
			control_panel_only = true,
			button_helper_only = false
		}
	}
	f60_local0.layerSelectButtonHelpers = {
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_EDIT_LAYER" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true,
			binding = HandleEditLayer,
			control_panel_only = false,
			button_helper_only = true
		},
		{
			helper_text = Engine.Localize( "@MENU_DONE" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true,
			binding = HandleBackConfirmation,
			control_panel_only = false,
			button_helper_only = true
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_CHANGE_LAYER" ),
			button_ref = "button_alt2",
			side = "left",
			clickable = true,
			binding = HandleChooseLayerIcon,
			control_panel_only = false,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_CLEAR_LAYER" ),
			button_ref = "button_alt1",
			side = "left",
			clickable = true,
			binding = HandleClearLayer,
			control_panel_only = false,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_COPY_LAYER" ),
			button_ref = "button_select",
			side = "left",
			clickable = true,
			binding = HandleCopyLayer,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_PASTE_LAYER" ),
			button_ref = "button_start",
			side = "left",
			clickable = true,
			binding = HandlePasteLayer,
			condition = ShouldShowPasteButtonHelper,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_CUT_LAYER" ),
			button_ref = "button_dpad_down",
			side = "left",
			clickable = true,
			binding = HandleCutLayer,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_GROUP_LAYER" ),
			button_ref = "button_shoulderr",
			side = "left",
			clickable = true,
			binding = HandleGroupLayer,
			condition = ShouldShowGroupLayerButtonHelper,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_UNGROUP_LAYER" ),
			button_ref = "button_shoulderl",
			side = "left",
			clickable = true,
			binding = HandleUngroupLayer,
			condition = ShouldShowUngroupLayerButtonHelper,
			control_panel_only = true,
			button_helper_only = false
		}
	}
	f60_local0.layerEditButtonHelpers = {
		{
			helper_text = Engine.Localize( "@MENU_DONE" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true,
			binding = HandleDoneEditingLayer,
			control_panel_only = false,
			button_helper_only = true
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_OPTIONS" ),
			button_ref = "button_start",
			side = "left",
			clickable = true,
			binding = OpenOptionsPopup,
			control_panel_only = false,
			button_helper_only = true
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_MOVE" ),
			button_ref = "button_stickl_updown",
			side = "left",
			clickable = true,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_ROTATE" ),
			button_ref = "button_left_trigger",
			button_ref2 = "button_right_trigger",
			side = "left",
			clickable = true,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text_func = f0_local12,
			button_ref = "button_r3",
			side = "left",
			clickable = true,
			ignoreGroupedLayers = true,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_FLIP" ),
			button_ref = "button_select",
			side = "left",
			clickable = true,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_OUTLINE" ),
			button_ref = "button_alt1",
			side = "left",
			clickable = true,
			binding = f0_local19,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_CHANGE_LAYER_ORDER" ),
			button_ref = "button_dpad_left",
			button_ref2 = "button_dpad_right",
			side = "left",
			clickable = true,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_CHANGE_OPACITY" ),
			button_ref = "button_shoulderl",
			button_ref2 = "button_shoulderr",
			side = "left",
			clickable = true,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_COLOR_PICKER" ),
			button_ref = "button_alt2",
			side = "left",
			clickable = true,
			binding = OpenColorPicker,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_MATERIAL_PICKER" ),
			button_ref = "button_dpad_up",
			side = "left",
			clickable = true,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_DUPLICATE_LAYER" ),
			button_ref = "button_left_stick",
			side = "left",
			clickable = true,
			binding = HandleDuplicateLayer,
			control_panel_only = true,
			button_helper_only = false
		}
	}
	f60_local0.colorPickerButtonHelpers = {
		{
			helper_text = Engine.Localize( "@LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true,
			binding = nil,
			control_panel_only = false,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true,
			binding = f0_local8,
			control_panel_only = false,
			button_helper_only = true
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_TOGGLE_COLOR_MIXER" ),
			button_ref = "button_select",
			side = "left",
			clickable = true,
			binding = OpenColorMixerPanel,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_ADD_TO_FAVORITES" ),
			button_ref = "button_alt2",
			side = "left",
			clickable = true,
			condition = ShouldShowAddToFavoritesButtonHelper,
			binding = AddColorToFavorites,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_SWITCH_TO_FAVORITES" ),
			button_ref = "button_alt1",
			side = "left",
			clickable = true,
			binding = SwitchToFavorites,
			control_panel_only = true,
			button_helper_only = false
		}
	}
	f60_local0.colorMixerButtonHelpers = {
		{
			helper_text = Engine.Localize( "@LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true,
			binding = CloseToolPanel,
			control_panel_only = false,
			button_helper_only = true
		},
		{
			helper_text = Engine.Localize( "@MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true,
			binding = CloseToolPanel,
			control_panel_only = false,
			button_helper_only = true
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_TOGGLE_COLOR_PICKER" ),
			button_ref = "button_select",
			side = "left",
			clickable = true,
			binding = OpenColorPicker,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_ADD_TO_FAVORITES" ),
			button_ref = "button_alt2",
			side = "left",
			clickable = true,
			condition = ShouldShowAddToFavoritesButtonHelper,
			binding = AddColorToFavorites,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_SWITCH_TO_FAVORITES" ),
			button_ref = "button_alt1",
			side = "left",
			clickable = true,
			binding = SwitchToFavorites,
			control_panel_only = true,
			button_helper_only = false
		}
	}
	f60_local0.favoriteColorsButtonHelpers = {
		{
			helper_text = Engine.Localize( "@MENU_DONE" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true,
			binding = nil,
			control_panel_only = false,
			button_helper_only = true
		},
		{
			helper_text = Engine.Localize( "@MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true,
			binding = f0_local8,
			control_panel_only = false,
			button_helper_only = true
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_REMOVE_FROM_FAVORITES" ),
			button_ref = "button_alt2",
			side = "left",
			clickable = true,
			condition = ShouldShowRemoveColorFromFavorites,
			binding = RemoveColorFromFavorites,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_SWITCH_TO_COLORS" ),
			button_ref = "button_alt1",
			side = "left",
			clickable = true,
			binding = SwitchToColors,
			control_panel_only = true,
			button_helper_only = false
		}
	}
	f60_local0.materialPickerButtonHelpers = {
		{
			helper_text = Engine.Localize( "@MENU_DONE" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true,
			binding = nil,
			control_panel_only = false,
			button_helper_only = true
		},
		{
			helper_text = Engine.Localize( "@MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true,
			binding = f0_local9,
			control_panel_only = false,
			button_helper_only = true
		},
		{
			helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_ROTATE_MATERIAL" ),
			button_ref = "button_left_trigger",
			button_ref2 = "button_right_trigger",
			side = "left",
			clickable = true,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text_func = f0_local12,
			button_ref = "button_r3",
			side = "left",
			clickable = true,
			control_panel_only = true,
			button_helper_only = false
		},
		{
			helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_RESET_MATERIAL" ),
			button_ref = "button_alt1",
			side = "left",
			clickable = true,
			binding = HandleResetMaterial,
			control_panel_only = true,
			button_helper_only = false
		}
	}
	if Engine.IsPC() then
		f60_local0.layerEditMouseHelpers = {
			{
				helper_text = Engine.Localize( "@MENU_DONE" ),
				button_ref = "button_secondary",
				side = "left",
				clickable = true,
				binding = HandleDoneEditingLayer,
				control_panel_only = false,
				button_helper_only = true
			},
			{
				helper_text = Engine.Localize( "@MP_EMBLEM_EDITOR_OPTIONS" ),
				button_ref = "button_start",
				side = "left",
				clickable = true,
				binding = OpenOptionsPopup,
				control_panel_only = false,
				button_helper_only = true
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_MOVE" ),
				imageIcon = "ui_button_pc_click_left",
				mouse_control_panel = true,
				control_panel_only = true,
				button_helper_only = false
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_CHANGE_LAYER_ORDER" ),
				button_ref = "button_dpad_left",
				button_ref2 = "button_dpad_right",
				mouse_control_panel = true,
				control_panel_only = true,
				button_helper_only = false
			},
			{
				helper_text_func = f0_local12,
				isButton = true,
				ignoreGroupedLayers = true,
				imageIcon = "ui_button_pc_click_right",
				binding = f0_local21( f60_arg1 ),
				control_panel_only = true,
				button_helper_only = false
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_FLIP" ),
				isButton = true,
				binding = f0_local20,
				clickable = true,
				control_panel_only = true,
				button_helper_only = false
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_OUTLINE" ),
				isButton = true,
				button_ref = "button_alt1",
				binding = f0_local19,
				control_panel_only = true,
				button_helper_only = false
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_COLOR_PICKER" ),
				isButton = true,
				button_ref = "button_alt2",
				binding = OpenColorPicker,
				control_panel_only = true,
				button_helper_only = false
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_MATERIAL_PICKER" ),
				isButton = true,
				button_ref = "button_dpad_up",
				binding = OpenMaterialPicker,
				control_panel_only = true,
				button_helper_only = false
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_DUPLICATE_LAYER" ),
				isButton = true,
				binding = HandleDuplicateLayer,
				control_panel_only = true,
				button_helper_only = false
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_CHANGE_OPACITY" ),
				isSlider = true,
				sliderMin = 0,
				sliderMax = 100,
				sliderValueFunc = f0_local13,
				sliderAction = f0_local15,
				control_panel_only = true,
				button_helper_only = false
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_ROTATE" ),
				isSlider = true,
				sliderMin = 0,
				sliderMax = 360,
				sliderValueFunc = f0_local14,
				sliderAction = f0_local16,
				control_panel_only = true,
				button_helper_only = false
			}
		}
		f60_local0.layerEmptySelectMouseHelpers = {
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_CREATE_NEW" ),
				button_ref = "button_primary",
				side = "left",
				clickable = true,
				binding = HandleEditLayer,
				control_panel_only = false,
				button_helper_only = true
			},
			{
				helper_text = Engine.Localize( "@MENU_DONE" ),
				button_ref = "button_secondary",
				side = "left",
				clickable = true,
				binding = HandleBackConfirmation,
				control_panel_only = false,
				button_helper_only = true
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_PASTE_LAYER" ),
				button_ref = "button_start",
				isButton = true,
				binding = HandlePasteLayer,
				condition = ShouldShowPasteButtonHelper,
				control_panel_only = true,
				button_helper_only = false
			}
		}
		f60_local0.layerSelectMouseHelpers = {
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_EDIT_LAYER" ),
				button_ref = "button_primary",
				side = "left",
				clickable = true,
				binding = HandleEditLayer,
				control_panel_only = false,
				button_helper_only = true
			},
			{
				helper_text = Engine.Localize( "MENU_DONE" ),
				button_ref = "button_secondary",
				side = "left",
				clickable = true,
				binding = HandleBackConfirmation,
				control_panel_only = false,
				button_helper_only = true
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_CHANGE_LAYER" ),
				button_ref = "button_alt2",
				isButton = true,
				binding = HandleChooseLayerIcon,
				control_panel_only = false,
				button_helper_only = false
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_CLEAR_LAYER" ),
				button_ref = "button_alt1",
				isButton = true,
				binding = HandleClearLayer,
				control_panel_only = false,
				button_helper_only = false
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_COPY_LAYER" ),
				button_ref = "button_select",
				isButton = true,
				binding = HandleCopyLayer,
				control_panel_only = true,
				button_helper_only = false
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_PASTE_LAYER" ),
				button_ref = "button_start",
				isButton = true,
				binding = HandlePasteLayer,
				condition = ShouldShowPasteButtonHelper,
				control_panel_only = true,
				button_helper_only = false
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_CUT_LAYER" ),
				button_ref = "button_dpad_down",
				isButton = true,
				binding = HandleCutLayer,
				control_panel_only = true,
				button_helper_only = false
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_GROUP_LAYER" ),
				button_ref = "button_shoulderr",
				isButton = true,
				binding = HandleGroupLayer,
				condition = ShouldShowGroupLayerButtonHelper,
				control_panel_only = true,
				button_helper_only = false
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_UNGROUP_LAYER" ),
				button_ref = "button_shoulderl",
				isButton = true,
				binding = HandleUngroupLayer,
				condition = ShouldShowUngroupLayerButtonHelper,
				control_panel_only = true,
				button_helper_only = false
			}
		}
		f60_local0.materialPickerMouseHelpers = {
			{
				helper_text = Engine.Localize( "MENU_DONE" ),
				button_ref = "button_primary",
				side = "left",
				clickable = true,
				binding = nil,
				control_panel_only = false,
				button_helper_only = true
			},
			{
				helper_text = Engine.Localize( "MENU_BACK" ),
				button_ref = "button_secondary",
				side = "left",
				clickable = true,
				binding = f0_local9,
				control_panel_only = false,
				button_helper_only = true
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_ROTATE_MATERIAL" ),
				isSlider = true,
				sliderMin = 0,
				sliderMax = 360,
				sliderValueFunc = f0_local17,
				sliderAction = f0_local18,
				control_panel_only = true,
				button_helper_only = false
			},
			{
				helper_text_func = f0_local12,
				isButton = true,
				imageIcon = "ui_button_pc_click_right",
				binding = f0_local21( f60_arg1 ),
				control_panel_only = true,
				button_helper_only = false
			},
			{
				helper_text = Engine.Localize( "MP_EMBLEM_EDITOR_RESET_MATERIAL" ),
				isButton = true,
				button_ref = "button_alt1",
				binding = HandleResetMaterial,
				control_panel_only = true,
				button_helper_only = false
			}
		}
	end
end

function UpdateButtonHelper( f61_arg0, f61_arg1 )
	local f61_local0 = LUI.FlowManager.GetScopedData( f61_arg0 )
	if not f61_local0.layerEmptySelectButtonHelpers then
		f0_local22( f61_arg0, f61_arg1 )
	end
	local f61_local1 = nil
	if f61_arg0.buttonHelpers ~= nil then
		f61_arg0.EmblemEditorControls:processEvent( {
			name = "clear_control_panel_button_helpers"
		} )
		if f61_arg0.EmblemEditorMouseControls then
			f61_arg0.EmblemEditorMouseControls:processEvent( {
				name = "clear_control_panel_button_helpers"
			} )
		end
		for f61_local5, f61_local6 in pairs( f61_arg0.buttonHelpers ) do
			if not f61_local6.control_panel_only then
				if f61_local6.button_ref then
					f61_arg0:RemoveButtonHelperTextFromElement( f61_arg0.ButtonHelperBar, f61_local6.button_ref, f61_local6.side )
				end
				if f61_local6.button_ref2 then
					f61_arg0:RemoveButtonHelperTextFromElement( f61_arg0.ButtonHelperBar, f61_local6.button_ref2, f61_local6.side )
				end
			end
			if f61_local6.binding ~= nil then
				if f61_local6.button_ref then
					f61_arg0.bindButton:registerEventHandler( f61_local6.button_ref, nil )
				end
				if f61_local6.button_ref2 then
					f61_arg0.bindButton:registerEventHandler( f61_local6.button_ref2, nil )
				end
			end
		end
	end
	if EmblemEditorUtils.IsEditingLayer() then
		f61_arg0.buttonHelpers = CONDITIONS.IsGamepadEnabled() and f61_local0.layerEditButtonHelpers or f61_local0.layerEditMouseHelpers
		ACTIONS.AnimateSequence( f61_arg0, "CanvasHighlightOn" )
	elseif EmblemEditor.colorPickerMode ~= EmblemEditor.ColorPickerMode.CLOSED then
		ACTIONS.AnimateSequence( f61_arg0, "CanvasHighlightOff" )
		if EmblemEditor.selectingFavoriteColors then
			f61_arg0.buttonHelpers = f61_local0.favoriteColorsButtonHelpers
		elseif EmblemEditor.colorPickerMode == EmblemEditor.ColorPickerMode.COLOR_GRID then
			f61_arg0.buttonHelpers = f61_local0.colorPickerButtonHelpers
		elseif EmblemEditor.colorPickerMode == EmblemEditor.ColorPickerMode.COLOR_MIXER then
			f61_arg0.buttonHelpers = f61_local0.colorMixerButtonHelpers
		elseif EmblemEditor.colorPickerMode == EmblemEditor.ColorPickerMode.MATERIAL_PICKER then
			f61_arg0.buttonHelpers = CONDITIONS.IsGamepadEnabled() and f61_local0.materialPickerButtonHelpers or f61_local0.materialPickerMouseHelpers
		end
	elseif EmblemEditor.GetSelectedLayerIndex() == -1 or EmblemEditor.IsLayerEmpty( EmblemEditor.GetSelectedLayerIndex() ) then
		ACTIONS.AnimateSequence( f61_arg0, "CanvasHighlightOff" )
		f61_arg0.buttonHelpers = CONDITIONS.IsGamepadEnabled() and f61_local0.layerEmptySelectButtonHelpers or f61_local0.layerEmptySelectMouseHelpers
	else
		ACTIONS.AnimateSequence( f61_arg0, "CanvasHighlightOff" )
		f61_arg0.buttonHelpers = CONDITIONS.IsGamepadEnabled() and f61_local0.layerSelectButtonHelpers or f61_local0.layerSelectMouseHelpers
	end
	if f61_arg0.buttonHelpers ~= nil then
		for f61_local5, f61_local6 in pairs( f61_arg0.buttonHelpers ) do
			if f61_local6.condition == nil or f61_local6.condition( f61_arg0, f61_arg1 ) == true then
				if f61_local6.helper_text_func then
					f61_local6.helper_text = f61_local6.helper_text_func()
				end
				if not f61_local6.control_panel_only then
					f61_arg0:AddButtonHelperTextToElement( f61_arg0.ButtonHelperBar, f61_local6 )
				end
				if not f61_local6.button_helper_only then
					local f61_local7 = f61_local6
					f61_local7.name = "add_control_panel_button_helper"
					f61_local7.controllerIndex = f61_arg1
					if f61_local7.mouse_control_panel and f61_arg0.EmblemEditorMouseControls then
						f61_arg0.EmblemEditorMouseControls:processEvent( f61_local7 )
					else
						f61_arg0.EmblemEditorControls:processEvent( f61_local7 )
					end
				end
			end
		end
	end
	if not f61_arg0.refreshTimer then
		f61_arg0.refreshTimer = f61_arg0:Wait( 150 )
		f61_arg0.refreshTimer.onComplete = function ()
			return f0_local11( f61_arg0, f61_arg1 )
		end
		
	end
end

local f0_local23 = function ( f63_arg0, f63_arg1 )
	f63_arg0:SetArrowsEnabled( f63_arg1 )
	f63_arg0:SetDirectionalInputEnabled( f63_arg1 )
end

function StartEditingLayer( f64_arg0, f64_arg1, f64_arg2 )
	EmblemEditor.dirty = true
	EmblemEditorUtils.EmblemLayerBeingEdited = f64_arg2
	f0_local23( f64_arg0.LayersGrid, false )
	f64_arg0.ArrowLeft:SetAlpha( 0 )
	f64_arg0.ArrowRight:SetAlpha( 0 )
	f64_arg0.EditLabelButton:SetAlpha( 0 )
	f64_arg0.EditLabelButton:SetHandleMouse( false )
	ACTIONS.GainFocus( f64_arg0, "EmblemPreview", f64_arg1 )
	ACTIONS.LoseFocus( f64_arg0, "LayersGrid", f64_arg1 )
	f64_arg0.EmblemClipboard:SetAlpha( 0 )
	ACTIONS.AnimateSequence( f64_arg0, "BorderOn" )
	f64_arg0.EmblemPreview:processEvent( {
		name = "button_over"
	} )
	EmblemEditor.BeginEdit( f64_arg1 )
	UpdateButtonHelper( f64_arg0, f64_arg1 )
	UpdateMenuTitle( f64_arg0 )
	if f64_arg0.EmblemEditorMouseControls then
		f64_arg0.EmblemEditorMouseControls:SetAlpha( 1, 0 )
	end
end

function StopEditingLayer( f65_arg0, f65_arg1 )
	EmblemEditorUtils.EmblemLayerBeingEdited = -1
	f0_local23( f65_arg0.LayersGrid, true )
	f65_arg0.ArrowLeft:SetAlpha( 1 )
	f65_arg0.ArrowRight:SetAlpha( 1 )
	f65_arg0.EditLabelButton:SetAlpha( 1 )
	f65_arg0.EditLabelButton:SetHandleMouse( true )
	ACTIONS.LoseFocus( f65_arg0, "EmblemPreview", f65_arg1 )
	EmblemEditor.EndEdit( f65_arg1 )
	f65_arg0.EmblemClipboard:SetAlpha( 1 )
	ACTIONS.AnimateSequence( f65_arg0, "BorderOff" )
	f65_arg0.EmblemPreview:processEvent( {
		name = "button_up"
	} )
	UpdateButtonHelper( f65_arg0, f65_arg1 )
	UpdateMenuTitle( f65_arg0 )
	if f65_arg0.EmblemEditorMouseControls then
		f65_arg0.EmblemEditorMouseControls:SetAlpha( 0, 0 )
	end
end

function PauseEditingLayer( f66_arg0, f66_arg1 )
	EmblemEditorUtils.EmblemLayerBeingEdited = -1
	EmblemEditorUtils.ToolPanelOpen = true
	ACTIONS.LoseFocus( f66_arg0, "EmblemPreview", f66_arg1 )
	EmblemEditor.EndEdit( f66_arg1 )
	UpdateButtonHelper( f66_arg0, f66_arg1 )
	if f66_arg0.EmblemEditorMouseControls then
		f66_arg0.EmblemEditorMouseControls:SetAlpha( 0, 0 )
	end
end

function ResumeEditingLayer( f67_arg0, f67_arg1 )
	EmblemEditorUtils.EmblemLayerBeingEdited = EmblemEditor.GetSelectedLayerIndex()
	EmblemEditorUtils.ToolPanelOpen = false
	ACTIONS.GainFocus( f67_arg0, "EmblemPreview", f67_arg1 )
	EmblemEditor.BeginEdit( f67_arg1 )
	UpdateButtonHelper( f67_arg0, f67_arg1 )
	if f67_arg0.EmblemEditorMouseControls then
		f67_arg0.EmblemEditorMouseControls:SetAlpha( 1, 0 )
	end
end

function UpdateMenuTitle( f68_arg0 )
	if EmblemEditor.colorPickerMode == EmblemEditor.ColorPickerMode.COLOR_GRID then
		f68_arg0.MenuTitle.MenuTitle:setText( Engine.Localize( "MP_EMBLEM_EDITOR_COLOR_PICKER" ), 0 )
	elseif EmblemEditor.colorPickerMode == EmblemEditor.ColorPickerMode.COLOR_MIXER then
		f68_arg0.MenuTitle.MenuTitle:setText( Engine.Localize( "MP_EMBLEM_EDITOR_COLOR_MIXER" ), 0 )
	elseif EmblemEditor.colorPickerMode == EmblemEditor.ColorPickerMode.MATERIAL_PICKER then
		f68_arg0.MenuTitle.MenuTitle:setText( Engine.Localize( "MP_EMBLEM_EDITOR_MATERIAL_PICKER" ), 0 )
	elseif EmblemEditorUtils.IsEditingLayer() then
		f68_arg0.MenuTitle.MenuTitle:setText( Engine.Localize( "MP_EMBLEM_EDITOR_EDIT_LAYER_TITLE" ), 0 )
	else
		f68_arg0.MenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_TITLE_EMBLEM_EDITOR" ), 0 )
	end
end

local f0_local24 = function ( f69_arg0, f69_arg1 )
	if CONDITIONS.IsGamepadEnabled( f69_arg0 ) then
		f69_arg0:removeElement( f69_arg0.ArrowLeft )
		f69_arg0:removeElement( f69_arg0.ArrowRight )
		f69_arg0:removeElement( f69_arg0.GridItemText )
		f69_arg0:removeElement( f69_arg0.EditLabelButton )
		if not f69_arg1 then
			f69_arg0:addElement( f69_arg0.ArrowsWithLabel )
		end
		f69_arg0.LayersGrid:AddArrow( f69_arg0.ArrowsWithLabel.ArrowLeft )
		f69_arg0.LayersGrid:AddArrow( f69_arg0.ArrowsWithLabel.ArrowRight )
	else
		f69_arg0:removeElement( f69_arg0.ArrowsWithLabel )
		if not f69_arg1 then
			f69_arg0:addElement( f69_arg0.ArrowLeft )
			f69_arg0:addElement( f69_arg0.ArrowRight )
			f69_arg0:addElement( f69_arg0.GridItemText )
			f69_arg0:addElement( f69_arg0.EditLabelButton )
		end
		f69_arg0.LayersGrid:AddArrow( f69_arg0.ArrowLeft )
		f69_arg0.LayersGrid:AddArrow( f69_arg0.ArrowRight )
	end
end

function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
	WipeControllerModelsAtPath( f0_local0 )
end

function PreLoadFunc( f71_arg0, f71_arg1 )
	local f71_local0 = f0_local0 .. ".selectedEmblem"
	local f71_local1 = f71_local0 .. ".layers"
	f71_arg0.layersGridCountDataSource = LUI.DataSourceInControllerModel.new( f0_local0 .. ".layersGridCount" )
	f71_arg0.layersGridCountDataSource:SetValue( f71_arg1, 64 )
	local f71_local2 = LUI.DataSourceFromList.new( f71_arg0.layersGridCountDataSource )
	f71_local2.MakeDataSourceAtIndex = function ( f72_arg0, f72_arg1, f72_arg2 )
		f72_arg1 = f72_arg1 % (f71_arg0.layersGridCountDataSource:GetValue( f72_arg2 ) or 0)
		return {
			number = LUI.DataSourceInControllerModel.new( f71_local1 .. "." .. f72_arg1 .. ".number" ),
			iconId = LUI.DataSourceInControllerModel.new( f71_local1 .. "." .. f72_arg1 .. ".iconId" ),
			groupIndex = LUI.DataSourceInControllerModel.new( f71_local1 .. "." .. f72_arg1 .. ".groupIndex" ),
			color = LUI.DataSourceInControllerModel.new( f71_local1 .. "." .. f72_arg1 .. ".color" )
		}
	end
	
	local f71_local3 = LUI.DataSourceInControllerModel.new( f0_local0 )
	f71_local3.selectedEmblem = LUI.DataSourceInControllerModel.new( f71_local0 )
	f71_local3.selectedEmblem.layersUsed = LUI.DataSourceInControllerModel.new( f71_local0 .. ".layersUsed" )
	f71_local3.selectedEmblem.layersCount = LUI.DataSourceInControllerModel.new( f71_local0 .. ".layersCount" )
	f71_local3.selectedEmblem.selectedLayer = LUI.DataSourceInControllerModel.new( f71_local0 .. ".selectedLayer" )
	f71_local3.selectedEmblem.scaleMode = LUI.DataSourceInControllerModel.new( f71_local0 .. ".scaleMode" )
	local f71_local4 = f0_local0 .. ".layerDetails"
	f71_local3.layerDetails = {
		position = LUI.DataSourceInControllerModel.new( f71_local4 .. ".position" ),
		rotation = LUI.DataSourceInControllerModel.new( f71_local4 .. ".rotation" ),
		scale = LUI.DataSourceInControllerModel.new( f71_local4 .. ".scale" ),
		opacity = LUI.DataSourceInControllerModel.new( f71_local4 .. ".opacity" )
	}
	f71_local3.selectedEmblem.layers = f71_local2
	local LayersGrid = nil
	local f71_local6 = {
		maxVisibleColumns = 9,
		maxVisibleRows = 1,
		controllerIndex = f71_arg1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "EmblemLayer", {
				controllerIndex = f71_arg1
			} )
		end,
		refreshChild = function ( f74_arg0, f74_arg1, f74_arg2 )
			f74_arg0:SetDataSource( f71_local2:GetDataSourceAtIndex( f74_arg1 % 64, f71_arg1 ), f71_arg1 )
		end,
		wrapX = true,
		wrapY = false,
		numRows = 1,
		numColumns = nil,
		spacingX = _1080p * 30,
		spacingY = _1080p * 18,
		columnWidth = _1080p * 200,
		rowHeight = _1080p * 200,
		scrollingThresholdX = 4,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Middle,
		springCoefficient = 400,
		maxVelocity = 5000
	}
	if Engine.IsPC() then
		f71_local6.maxVisibleColumns = 7
		f71_local6.scrollingThresholdX = 3
	end
	LayersGrid = LUI.UIGrid.new( nil, f71_local6 )
	LayersGrid.id = "LayersGrid"
	LayersGrid:setUseStencil( false )
	LayersGrid:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -12, _1080p * 12, _1080p * 720, _1080p * 920 )
	f71_arg0:addElement( LayersGrid )
	f71_arg0.LayersGrid = LayersGrid
	
	f71_arg0.LayersGrid.SetFocusedPosition = function ( f75_arg0, f75_arg1, f75_arg2 )
		LUI.UIGrid.SetFocusedPosition( f71_arg0.LayersGrid, f75_arg1, f75_arg2 )
		if f71_arg0.LayersGrid._targetPosition then
			f71_arg0.LayersGrid:SetDataSource( f71_local2:GetDataSourceAtIndex( f71_arg0.LayersGrid._targetPosition.x, f71_arg1 ), f71_arg1 )
		end
	end
	
	f71_arg0.LayersGrid.GetDefaultFocus = function ( f76_arg0 )
		return {
			x = EmblemEditor.GetSelectedLayerIndex() or 0,
			y = 0
		}
	end
	
	f71_arg0:SetDataSource( f71_local3, f71_arg1 )
end

function PostLoadFunc( f77_arg0, f77_arg1 )
	f0_local3( f77_arg1 )
	f77_arg0.EmblemPreview.Background:SetupEmblem()
	f0_local24( f77_arg0, true )
	f77_arg0:registerEventHandler( "refresh_button_helper", function ( element, event )
		f0_local24( element, false )
	end )
	f77_arg0.EmblemPreview:SetAlpha( 1 )
	f77_arg0.Emblembg:SetAlpha( 1 )
	f77_arg0.EmblemClipboard:SetAlpha( 1 )
	f77_arg0:addEventHandler( "edit_emblem_layer", HandleEditLayer )
	assert( f77_arg0.EditLabelButton )
	f77_arg0.EditLabelButton:addEventHandler( "button_action", function ( f79_arg0, f79_arg1 )
		f77_arg0:processEvent( {
			name = "edit_emblem_layer",
			controller = f77_arg1
		} )
	end )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	f77_arg0:addElement( bindButton )
	f77_arg0.bindButton = bindButton
	
	local f77_local1 = f0_local0 .. ".selectedEmblem"
	local f77_local2 = f0_local0 .. ".favoriteColors"
	local f77_local3 = LUI.DataSourceInControllerModel.new( f77_local2 .. ".count", 0 )
	local f77_local4 = LUI.DataSourceFromList.new( LUI.DataSourceInControllerModel.new( f77_local2 .. ".total", 0 ) )
	f77_local4.MakeDataSourceAtIndex = function ( f80_arg0, f80_arg1, f80_arg2 )
		return {
			color = LUI.DataSourceInControllerModel.new( f77_local2 .. "." .. f80_arg1 .. ".color" ),
			valid = LUI.DataSourceInControllerModel.new( f77_local2 .. "." .. f80_arg1 .. ".valid" )
		}
	end
	
	f77_arg0.FavoriteColorsPanel.ColorsGrid:SetGridDataSource( f77_local4 )
	SelectLayer( f77_arg0, f77_arg1, 0 )
	EmblemEditor.CreateEmblemEditorDataModel( f77_arg1, EmblemEditorUtils.SelectedEmblem )
	local f77_local5 = function ()
		UpdateLayersUI( f77_arg0, f77_arg1 )
	end
	
	f77_arg0:SubscribeToModelThroughElement( f77_arg0, "selectedEmblem.layersUsed", f77_local5 )
	f77_arg0:SubscribeToModelThroughElement( f77_arg0, "selectedEmblem.layersCount", f77_local5 )
	f77_arg0:SubscribeToModelThroughElement( f77_arg0, "selectedEmblem.selectedLayer", f77_local5 )
	f77_arg0:SubscribeToModelThroughElement( f77_arg0, "selectedEmblem.scaleMode", function ()
		UpdateButtonHelper( f77_arg0, f77_arg1 )
	end )
	f77_arg0:SubscribeToDataSourceThroughElement( f77_arg0.LayersGrid, nil, function ( f83_arg0, f83_arg1 )
		SelectLayer( f77_arg0, f77_arg1, f77_arg0.LayersGrid:GetFocusPosition( LUI.DIRECTION.horizontal ) % (f77_arg0.layersGridCountDataSource:GetValue( f77_arg1 ) or 0) )
		EmblemEditor.CreateEmblemEditorDataModel( f77_arg1, EmblemEditorUtils.SelectedEmblem )
		UpdateButtonHelper( f77_arg0, f77_arg1 )
	end )
	f77_arg0.EmblemEditorToolPanel.ColorMixerPanel:SetDataSourceThroughElement( f77_arg0.LayersGrid, nil )
	f77_arg0:SubscribeToModelThroughElement( f77_arg0.EmblemEditorToolPanel.ColorPickerGrid.Grid, "color", function ()
		if EmblemEditor.colorPickerMode == EmblemEditor.ColorPickerMode.COLOR_GRID then
			EmblemEditor.SetLayerColorFromSwatch( f77_arg0.EmblemEditorToolPanel.ColorPickerGrid.Grid:GetFocusPosition( LUI.DIRECTION.vertical ) or 0, f77_arg0.EmblemEditorToolPanel.ColorPickerGrid.Grid:GetFocusPosition( LUI.DIRECTION.horizontal ) or 0, f77_arg1 )
			f0_local4( f77_arg0, f77_arg1 )
		end
	end )
	f77_arg0.EmblemEditorToolPanel.ColorPickerGrid.SelectedColor:addEventHandler( "gain_focus", function ( f85_arg0, f85_arg1 )
		f0_local7( f77_arg0, f85_arg1 )
		return true
	end )
	f77_arg0.EmblemEditorToolPanel.MaterialPickerPanel.SelectedColor:addEventHandler( "gain_focus", function ( f86_arg0, f86_arg1 )
		f0_local7( f77_arg0, f86_arg1 )
		return true
	end )
	f77_arg0.EmblemEditorToolPanel.ColorPickerGrid.SelectedColor:registerEventHandler( "button_action", function ( element, event )
		f0_local7( f77_arg0, event )
		CloseToolPanel( f77_arg0, event )
		return true
	end )
	f77_arg0.EmblemEditorToolPanel.MaterialPickerPanel.SelectedColor:registerEventHandler( "button_action", function ( element, event )
		f0_local7( f77_arg0, event )
		CloseToolPanel( f77_arg0, event )
		return true
	end )
	f77_arg0:SubscribeToModelThroughElement( f77_arg0.FavoriteColorsPanel.ColorsGrid, "color", function ()
		if EmblemEditor.selectingFavoriteColors then
			local f89_local0 = f77_arg0.FavoriteColorsPanel.ColorsGrid:GetDataSource()
			if f89_local0.valid:GetValue( f77_arg1 ) then
				local f89_local1 = f77_arg0.FavoriteColorsPanel.ColorsGrid:GetDataSource()
				f89_local1 = f89_local1.color:GetValue( f77_arg1 )
				local f89_local2 = GetColorTableFromIntColor( f89_local1 )
				EmblemEditor.SetLayerColor( f89_local2.r, f89_local2.g, f89_local2.b, f77_arg1 )
				f0_local4( f77_arg0, f77_arg1 )
				if EmblemEditor.colorPickerMode == EmblemEditor.ColorPickerMode.COLOR_MIXER then
					f77_arg0.EmblemEditorToolPanel.ColorMixerPanel.SelectedColor:SetRGBFromInt( f89_local1 )
				end
			end
		end
	end )
	f77_arg0:registerEventHandler( "focused_on_layer_color", function ( element, event )
		local f90_local0 = GetColorTableFromIntColor( event.color )
		EmblemEditor.SetLayerColor( f90_local0.r, f90_local0.g, f90_local0.b, f77_arg1 )
		f0_local4( element, f77_arg1 )
		f77_arg0.EmblemEditorToolPanel.ColorMixerPanel.SelectedColor:SetRGBFromInt( event.color )
		return true
	end )
	f77_arg0:registerEventHandler( "focused_on_layer_swatch", function ( element, event )
		EmblemEditor.SetLayerColorFromSwatch( event.swatchRow, event.swatchCol, f77_arg1 )
		f0_local4( element, f77_arg1 )
		return true
	end )
	f77_arg0:registerEventHandler( "focused_on_layer_material", function ( element, event )
		if event.materialID then
			EmblemEditor.SetLayerMaterial( f77_arg1, event.materialID )
			EmblemEditor.SetLayerColor( 1, 1, 1, f77_arg1 )
		end
		return true
	end )
	f77_arg0:registerEventHandler( "color_picker_color_selected", function ( element, event )
		f0_local4( element, f77_arg1 )
		CloseToolPanel( f77_arg0, event )
		return true
	end )
	f77_arg0:registerEventHandler( "material_picker_material_selected", function ( element, event )
		EmblemEditor.SetLayerColor( 1, 1, 1, f77_arg1 )
		CloseToolPanel( f77_arg0, event )
		return true
	end )
	f77_arg0:SubscribeToModelThroughElement( f77_arg0.FavoriteColorsPanel.ColorsGrid, "valid", function ()
		UpdateButtonHelper( f77_arg0, f77_arg1 )
	end )
	f77_arg0:registerEventHandler( "grid_modified", function ( element, event )
		if EmblemEditor.gridVisible then
			f77_arg0.EmblemPreview.Grid:show()
		else
			f77_arg0.EmblemPreview.Grid:hide()
		end
		if EmblemEditor.useAlternateGridColor then
			f77_arg0.EmblemPreview.Grid:SetRGBFromTable( SWATCHES.emblemEditor.gridColorAlt )
		else
			f77_arg0.EmblemPreview.Grid:SetRGBFromTable( SWATCHES.emblemEditor.gridColor )
		end
	end )
	SetColorPickerMode( f77_arg0, f77_arg1, EmblemEditor.ColorPickerMode.CLOSED )
	local f77_local6 = function ( f97_arg0, f97_arg1 )
		local f97_local0
		if f97_arg1.qualifier ~= "dpad" and f97_arg1.qualifier ~= "keyboard" then
			f97_local0 = false
		else
			f97_local0 = true
		end
		local f97_local1 = CONDITIONS.IsGamepadEnabled()
		if EmblemEditorUtils.IsEditingLayer() then
			if f97_arg1.down == true then
				if f97_arg1.button == "shoulderl" and f97_local1 then
					EmblemEditor.DecreaseLayerOpacity( EmblemEditor.GetSelectedLayerIndex() )
				elseif f97_arg1.button == "shoulderr" and f97_local1 then
					EmblemEditor.IncreaseLayerOpacity( EmblemEditor.GetSelectedLayerIndex() )
				elseif f97_arg1.button == "up" and f97_local0 then
					OpenMaterialPicker( f77_arg0, {
						controller = f77_arg1
					} )
				elseif f97_arg1.button == "select" then
					f0_local20()
				elseif f97_arg1.button == "left" and f97_local0 then
					if EmblemEditor.ChangeLayerOrder( f97_arg1.controller, -1 ) then
						f77_arg0.LayersGrid:SetPosition( {
							x = EmblemEditor.GetSelectedLayerIndex(),
							y = 0
						}, true )
						f77_arg0:processEvent( {
							name = "arrow_button_left_moved",
							controller = f97_arg1.controller
						} )
						f77_arg0.LayersGrid:processEvent( {
							name = "lose_focus"
						} )
					end
				elseif f97_arg1.button == "right" and f97_local0 and EmblemEditor.ChangeLayerOrder( f97_arg1.controller, 1 ) then
					f77_arg0.LayersGrid:SetPosition( {
						x = EmblemEditor.GetSelectedLayerIndex(),
						y = 0
					}, true )
					f77_arg0:processEvent( {
						name = "arrow_button_right_moved",
						controller = f97_arg1.controller
					} )
					f77_arg0.LayersGrid:processEvent( {
						name = "lose_focus"
					} )
				end
			end
		elseif EmblemEditor.colorPickerMode == EmblemEditor.ColorPickerMode.CLOSED and f97_arg1.down == true then
			if f97_arg1.button == "down" and f97_local0 then
				HandleCutLayer( f77_arg0, f97_arg1 )
			else
				return f77_arg0:dispatchEventToChildren( f97_arg1 )
			end
		end
	end
	
	local f77_local7 = {
		"shoulderl",
		"shoulderr",
		"left",
		"right"
	}
	local f77_local8, f77_local9 = nil
	for f77_local13, f77_local14 in ipairs( f77_local7 ) do
		f77_arg0:addElement( LUI.UIButtonRepeater.new( nil, {
			buttonName = f77_local14,
			event = {
				name = "gamepad_button",
				button = f77_local14,
				down = true,
				controller = f77_arg1,
				immediate = true
			},
			eventTarget = f77_arg0
		} ) )
	end
	f77_arg0:registerEventHandler( "gamepad_button", f77_local6 )
	if EmblemEditor.layerIconChanged then
		EmblemEditor.layerIconChanged = false
		if not f77_arg0.editLayerTimer then
			f77_arg0.editLayerTimer = f77_arg0:Wait( 1 )
			f77_arg0.editLayerTimer.onComplete = function ()
				return f0_local10( f77_arg0, f77_arg1 )
			end
			
		end
	end
	UpdateMenuTitle( f77_arg0 )
	f77_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ), 0 ) )
	f77_arg0:registerEventHandler( "refresh_button_helper", function ( element, event )
		UpdateButtonHelper( element, event.controller or f77_arg1 )
	end )
	UpdateButtonHelper( f77_arg0, f77_arg1 )
	if CONDITIONS.IsMultiplayer( f77_arg0 ) then
		f77_local10 = LUI.UIElement.new( {
			worldBlur = 5
		} )
		f77_local10:setupWorldBlur()
		f77_local10.id = "blur"
		f77_arg0:addElement( f77_local10 )
	end
end

function EmblemEditorMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "EmblemEditorMenu"
	self._animationSets = {}
	self._sequences = {}
	local f100_local1 = controller and controller.controllerIndex
	if not f100_local1 and not Engine.InFrontend() then
		f100_local1 = self:getRootController()
	end
	assert( f100_local1 )
	PreLoadFunc( self, f100_local1, controller )
	self.soundSet = "emblemEditor"
	self:playSound( "menu_open" )
	local f100_local2 = self
	local Emblembg = nil
	
	Emblembg = MenuBuilder.BuildRegisteredType( "Emblembg", {
		controllerIndex = f100_local1
	} )
	Emblembg.id = "Emblembg"
	Emblembg:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 697, _1080p * 1229, _1080p * 168, _1080p * 700 )
	self:addElement( Emblembg )
	self.Emblembg = Emblembg
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f100_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 1010, _1080p * 1080 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local LayerDetails = nil
	
	LayerDetails = MenuBuilder.BuildRegisteredType( "LayerDetails", {
		controllerIndex = f100_local1
	} )
	LayerDetails.id = "LayerDetails"
	LayerDetails:SetDataSourceThroughElement( self, "layerDetails" )
	LayerDetails:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -673, _1080p * -348, _1080p * 144, _1080p * 364 )
	self:addElement( LayerDetails )
	self.LayerDetails = LayerDetails
	
	local LayersUsedLabel = nil
	
	LayersUsedLabel = LUI.UIText.new()
	LayersUsedLabel.id = "LayersUsedLabel"
	LayersUsedLabel:setText( Engine.Localize( "MP_EMBLEM_EDITOR_LAYERS_USED" ), 0 )
	LayersUsedLabel:SetFontSize( 19 * _1080p )
	LayersUsedLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LayersUsedLabel:SetAlignment( LUI.Alignment.Left )
	LayersUsedLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1255, _1080p * 1562, _1080p * 184, _1080p * 203 )
	self:addElement( LayersUsedLabel )
	self.LayersUsedLabel = LayersUsedLabel
	
	local EmblemClipboard = nil
	
	EmblemClipboard = MenuBuilder.BuildRegisteredType( "EmblemClipboard", {
		controllerIndex = f100_local1
	} )
	EmblemClipboard.id = "EmblemClipboard"
	EmblemClipboard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 500, _1080p * 676.51, _1080p * 495.28, _1080p * 700 )
	self:addElement( EmblemClipboard )
	self.EmblemClipboard = EmblemClipboard
	
	local f100_local8 = nil
	if not Engine.IsConsoleGame() then
		f100_local8 = MenuBuilder.BuildRegisteredType( "EmblemEditorControls", {
			controllerIndex = f100_local1
		} )
		f100_local8.id = "EmblemEditorMouseControls"
		f100_local8:SetAlpha( 0, 0 )
		f100_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 316, _1080p * 676, _1080p * 500, _1080p * 650 )
		self:addElement( f100_local8 )
		self.EmblemEditorMouseControls = f100_local8
	end
	local EmblemEditorControls = nil
	
	EmblemEditorControls = MenuBuilder.BuildRegisteredType( "EmblemEditorControls", {
		controllerIndex = f100_local1
	} )
	EmblemEditorControls.id = "EmblemEditorControls"
	EmblemEditorControls:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 316, _1080p * 676, _1080p * 143.72, _1080p * 478 )
	self:addElement( EmblemEditorControls )
	self.EmblemEditorControls = EmblemEditorControls
	
	local EmblemPreview = nil
	
	EmblemPreview = MenuBuilder.BuildRegisteredType( "EmblemEditorEmblemPreview", {
		controllerIndex = f100_local1
	} )
	EmblemPreview.id = "EmblemPreview"
	EmblemPreview:SetAlpha( 0.34, 0 )
	EmblemPreview:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 697, _1080p * 1229, _1080p * 168, _1080p * 700 )
	self:addElement( EmblemPreview )
	self.EmblemPreview = EmblemPreview
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f100_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( "", 0 )
	MenuTitle.MenuBreadcrumbs:setText( "", 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local FavoriteColorsPanel = nil
	
	FavoriteColorsPanel = MenuBuilder.BuildRegisteredType( "FavoriteColorsPanel", {
		controllerIndex = f100_local1
	} )
	FavoriteColorsPanel.id = "FavoriteColorsPanel"
	FavoriteColorsPanel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1247, _1080p * 1329, _1080p * 466, _1080p * 700 )
	self:addElement( FavoriteColorsPanel )
	self.FavoriteColorsPanel = FavoriteColorsPanel
	
	local EmblemEditorToolPanel = nil
	
	EmblemEditorToolPanel = MenuBuilder.BuildRegisteredType( "EmblemEditorToolPanel", {
		controllerIndex = f100_local1
	} )
	EmblemEditorToolPanel.id = "EmblemEditorToolPanel"
	EmblemEditorToolPanel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1340, _1080p * 1820, _1080p * 466, _1080p * 700 )
	self:addElement( EmblemEditorToolPanel )
	self.EmblemEditorToolPanel = EmblemEditorToolPanel
	
	local LayerBorder = nil
	
	LayerBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	LayerBorder.id = "LayerBorder"
	LayerBorder:SetAlpha( 0, 0 )
	LayerBorder:SetScale( 0.1, 0 )
	LayerBorder:SetBorderThicknessLeft( _1080p * 2, 0 )
	LayerBorder:SetBorderThicknessRight( _1080p * 2, 0 )
	LayerBorder:SetBorderThicknessTop( _1080p * 2, 0 )
	LayerBorder:SetBorderThicknessBottom( _1080p * 2, 0 )
	LayerBorder:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 860, _1080p * 1060, _1080p * 719.5, _1080p * 919.5 )
	self:addElement( LayerBorder )
	self.LayerBorder = LayerBorder
	
	local CanvasHighlight = nil
	
	CanvasHighlight = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	CanvasHighlight.id = "CanvasHighlight"
	CanvasHighlight:SetAlpha( 0, 0 )
	CanvasHighlight:SetBorderThicknessLeft( _1080p * 2, 0 )
	CanvasHighlight:SetBorderThicknessRight( _1080p * 2, 0 )
	CanvasHighlight:SetBorderThicknessTop( _1080p * 2, 0 )
	CanvasHighlight:SetBorderThicknessBottom( _1080p * 2, 0 )
	CanvasHighlight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 695, _1080p * 1231, _1080p * 166, _1080p * 702 )
	self:addElement( CanvasHighlight )
	self.CanvasHighlight = CanvasHighlight
	
	local ArrowsWithLabel = nil
	
	ArrowsWithLabel = MenuBuilder.BuildRegisteredType( "ArrowsWithLabel", {
		controllerIndex = f100_local1
	} )
	ArrowsWithLabel.id = "ArrowsWithLabel"
	ArrowsWithLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 713, _1080p * 1213, _1080p * 929.5, _1080p * 979.5 )
	self:addElement( ArrowsWithLabel )
	self.ArrowsWithLabel = ArrowsWithLabel
	
	local ArrowLeft = nil
	
	ArrowLeft = MenuBuilder.BuildRegisteredType( "ArrowLeft", {
		controllerIndex = f100_local1
	} )
	ArrowLeft.id = "ArrowLeft"
	ArrowLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 160, _1080p * 756, _1080p * 884 )
	self:addElement( ArrowLeft )
	self.ArrowLeft = ArrowLeft
	
	local ArrowRight = nil
	
	ArrowRight = MenuBuilder.BuildRegisteredType( "ArrowRight", {
		controllerIndex = f100_local1
	} )
	ArrowRight.id = "ArrowRight"
	ArrowRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1760, _1080p * 1824, _1080p * 756, _1080p * 884 )
	self:addElement( ArrowRight )
	self.ArrowRight = ArrowRight
	
	local GridItemText = nil
	
	GridItemText = LUI.UIText.new()
	GridItemText.id = "GridItemText"
	GridItemText:setText( Engine.Localize( "MENU_NEW" ), 0 )
	GridItemText:SetFontSize( 30 * _1080p )
	GridItemText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GridItemText:SetAlignment( LUI.Alignment.Right )
	GridItemText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -832, _1080p * -484, _1080p * 670, _1080p * 700 )
	self:addElement( GridItemText )
	self.GridItemText = GridItemText
	
	local EditLabelButton = nil
	
	EditLabelButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f100_local1
	} )
	EditLabelButton.id = "EditLabelButton"
	EditLabelButton.Label:setText( ToUpperCase( "" ), 0 )
	EditLabelButton.Label:SetAlignment( LUI.Alignment.Center )
	EditLabelButton:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 860, _1080p * -860, _1080p * 939.5, _1080p * 969.5 )
	self:addElement( EditLabelButton )
	self.EditLabelButton = EditLabelButton
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LayerBorder:RegisterAnimationSequence( "BorderOn", {
			{
				function ()
					return self.LayerBorder:SetScale( 0, 0 )
				end,
				function ()
					return self.LayerBorder:SetScale( 0.1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.LayerBorder:SetAlpha( 0.4, 0 )
				end
			}
		} )
		self._sequences.BorderOn = function ()
			LayerBorder:AnimateSequence( "BorderOn" )
		end
		
		LayerBorder:RegisterAnimationSequence( "BorderOff", {
			{
				function ()
					return self.LayerBorder:SetScale( 0.1, 0 )
				end,
				function ()
					return self.LayerBorder:SetScale( 0, 200 )
				end
			},
			{
				function ()
					return self.LayerBorder:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.LayerBorder:SetAlpha( 0, 200 )
				end
			}
		} )
		self._sequences.BorderOff = function ()
			LayerBorder:AnimateSequence( "BorderOff" )
		end
		
		CanvasHighlight:RegisterAnimationSequence( "CanvasHighlightOn", {
			{
				function ()
					return self.CanvasHighlight:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.CanvasHighlight:SetRGBFromTable( SWATCHES.genericButton.highlight, 100 )
				end
			},
			{
				function ()
					return self.CanvasHighlight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CanvasHighlight:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.CanvasHighlightOn = function ()
			CanvasHighlight:AnimateSequence( "CanvasHighlightOn" )
		end
		
		CanvasHighlight:RegisterAnimationSequence( "CanvasHighlightOff", {
			{
				function ()
					return self.CanvasHighlight:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.CanvasHighlight:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.CanvasHighlightOff = function ()
			CanvasHighlight:AnimateSequence( "CanvasHighlightOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	LayerDetails:SetDataSourceThroughElement( self, "layerDetails" )
	PostLoadFunc( self, f100_local1, controller )
	return self
end

MenuBuilder.registerType( "EmblemEditorMenu", EmblemEditorMenu )
LUI.FlowManager.RegisterStackPopBehaviour( "EmblemEditorMenu", PopFunc )
LockTable( _M )
