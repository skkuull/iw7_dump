local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg2 and f1_arg2 ~= -1 then
		local f1_local0 = EmblemEditor.GetMaterialHandle( f1_arg2 )
		f1_arg0:SetRGBFromTable( COLORS.white )
		f1_arg0:setImage( f1_local0 )
	else
		f1_arg0:SetRGBFromInt( f1_arg1 )
		f1_arg0:setImage( RegisterMaterial( "white" ), 0 )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	f0_local0( f2_arg0.ColorPickerGrid.SelectedColor.Background, f2_arg2, f2_arg3 )
	ACTIONS.GainFocus( f2_arg0.ColorPickerGrid, "SelectedColor", f2_arg1 )
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	f0_local0( f3_arg0.ColorMixerPanel.SelectedColor, f3_arg2 )
	ACTIONS.GainFocus( f3_arg0.ColorMixerPanel, "Red", f3_arg1 )
end

local f0_local3 = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	f0_local0( f4_arg0.MaterialPickerPanel.SelectedColor.Background, f4_arg2, f4_arg3 )
	if EmblemEditor.GetSelectedLayerMaterialID() == -1 then
		ACTIONS.GainFocus( f4_arg0.MaterialPickerPanel, "SelectedColor", f4_arg1 )
	else
		ACTIONS.GainFocus( f4_arg0.MaterialPickerPanel, "Grid", f4_arg1 )
	end
end

local f0_local4 = function ( f5_arg0 )
	local f5_local0 = f5_arg0.modeOptions[f5_arg0.lastMode]
	if f5_local0.toolPanel then
		EmblemEditorUtils.SetVisibleAndEnabled( f5_local0.toolPanel, false )
		ACTIONS.LoseFocus( f5_local0.toolPanel, "", controllerIndex )
	end
	f5_arg0.lastMode = EmblemEditor.ColorPickerMode.CLOSED
end

local f0_local5 = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3, f6_arg4 )
	local f6_local0 = f6_arg0.modeOptions[f6_arg2]
	f6_arg0.Title:setText( Engine.Localize( f6_local0.title ) )
	assert( f6_arg3 )
	if EmblemEditor.colorPickerMode == EmblemEditor.ColorPickerMode.COLOR_GRID then
		f0_local1( f6_arg0, f6_arg1, f6_arg3, f6_arg4 )
	elseif EmblemEditor.colorPickerMode == EmblemEditor.ColorPickerMode.COLOR_MIXER then
		f0_local2( f6_arg0, f6_arg1, f6_arg3 )
	elseif EmblemEditor.colorPickerMode == EmblemEditor.ColorPickerMode.MATERIAL_PICKER then
		f0_local3( f6_arg0, f6_arg1, f6_arg3, f6_arg4 )
	end
	if f6_local0.toolPanel then
		f6_arg0:CloseToolPanel()
		f6_arg0.lastMode = f6_arg2
		EmblemEditorUtils.SetVisibleAndEnabled( f6_local0.toolPanel, true )
		f6_arg0:SetAlpha( 1, 0 )
		return true
	else
		f6_arg0:SetAlpha( 0, 0 )
		return false
	end
end

local f0_local6 = function ( f7_arg0, f7_arg1 )
	f7_arg0.lastMode = EmblemEditor.ColorPickerMode.CLOSED
	f7_arg0.SetColorPickerMode = f0_local5
	f7_arg0.CloseToolPanel = f0_local4
	f7_arg0.modeOptions = {}
	f7_arg0.modeOptions[EmblemEditor.ColorPickerMode.CLOSED] = {
		title = "",
		toolPanel = nil
	}
	f7_arg0.modeOptions[EmblemEditor.ColorPickerMode.COLOR_GRID] = {
		title = "MP_EMBLEM_EDITOR_COLOR_PICKER",
		toolPanel = f7_arg0.ColorPickerGrid
	}
	f7_arg0.modeOptions[EmblemEditor.ColorPickerMode.COLOR_MIXER] = {
		title = "MP_EMBLEM_EDITOR_COLOR_MIXER",
		toolPanel = f7_arg0.ColorMixerPanel
	}
	f7_arg0.modeOptions[EmblemEditor.ColorPickerMode.MATERIAL_PICKER] = {
		title = "MP_EMBLEM_EDITOR_MATERIAL_PICKER",
		toolPanel = f7_arg0.MaterialPickerPanel
	}
	for f7_local3, f7_local4 in pairs( f7_arg0.modeOptions ) do
		if f7_local4.toolPanel then
			EmblemEditorUtils.SetVisibleAndEnabled( f7_local4.toolPanel, false )
		end
	end
end

function EmblemEditorToolPanel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 482 * _1080p, 0, 230 * _1080p )
	self.id = "EmblemEditorToolPanel"
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local f8_local3 = nil
	if Engine.InFrontend() then
		f8_local3 = LUI.UIImage.new()
		f8_local3.id = "DropShadow"
		f8_local3:SetRGBFromInt( 0, 0 )
		f8_local3:SetAlpha( 0.3, 0 )
		f8_local3:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f8_local3:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f8_local3 )
		self.DropShadow = f8_local3
	end
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetRGBFromTable( SWATCHES.CAC.BarracksBlurDark, 0 )
	ListBlur:SetBlurStrength( 2.75, 0 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local black = nil
	
	black = LUI.UIImage.new()
	black.id = "black"
	black:SetRGBFromInt( 0, 0 )
	black:SetAlpha( 0.8, 0 )
	black:SetDotPitchEnabled( true )
	black:SetDotPitchX( 0, 0 )
	black:SetDotPitchY( 0, 0 )
	black:SetDotPitchContrast( 0, 0 )
	black:SetDotPitchMode( 0 )
	black:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( black )
	self.black = black
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:setText( Engine.Localize( "MP_EMBLEM_EDITOR_COLOR_PICKER" ), 0 )
	Title:SetFontSize( 19 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 8, _1080p * -8, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( Title )
	self.Title = Title
	
	local ColorPickerGrid = nil
	
	ColorPickerGrid = MenuBuilder.BuildRegisteredType( "ColorPickerGrid", {
		controllerIndex = f8_local1
	} )
	ColorPickerGrid.id = "ColorPickerGrid"
	ColorPickerGrid:SetAlpha( 0, 0 )
	ColorPickerGrid:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 10, _1080p * 472, _1080p * 34, _1080p * -10 )
	self:addElement( ColorPickerGrid )
	self.ColorPickerGrid = ColorPickerGrid
	
	local ColorMixerPanel = nil
	
	ColorMixerPanel = MenuBuilder.BuildRegisteredType( "ColorMixerPanel", {
		controllerIndex = f8_local1
	} )
	ColorMixerPanel.id = "ColorMixerPanel"
	ColorMixerPanel:SetAlpha( 0, 0 )
	ColorMixerPanel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 472, _1080p * 34, _1080p * 220 )
	self:addElement( ColorMixerPanel )
	self.ColorMixerPanel = ColorMixerPanel
	
	local MaterialPickerPanel = nil
	
	MaterialPickerPanel = MenuBuilder.BuildRegisteredType( "MaterialPickerPanel", {
		controllerIndex = f8_local1
	} )
	MaterialPickerPanel.id = "MaterialPickerPanel"
	MaterialPickerPanel:SetAlpha( 0, 0 )
	MaterialPickerPanel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 472, _1080p * 34, _1080p * 220 )
	self:addElement( MaterialPickerPanel )
	self.MaterialPickerPanel = MaterialPickerPanel
	
	f0_local6( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "EmblemEditorToolPanel", EmblemEditorToolPanel )
LockTable( _M )
