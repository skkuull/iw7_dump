local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function OpenGradientColorPickerGrid( f1_arg0 )
	local f1_local0 = f1_arg0.GradientColorPickerGrid
	if f1_local0 ~= nil then
		f1_local0:SetAlpha( 1 )
	end
end

function CloseGradientColorPickerGrid( f2_arg0 )
	local f2_local0 = f2_arg0.GradientColorPickerGrid
	if f2_local0 ~= nil then
		f2_local0:SetAlpha( 0 )
	end
end

function OpenGradientAdjustPanel( f3_arg0 )
	local f3_local0 = f3_arg0.GradientAdjust
	if f3_local0 ~= nil then
		f3_local0:SetAlpha( 1 )
	end
end

function CloseGradientAdjustPanel( f4_arg0 )
	local f4_local0 = f4_arg0.GradientAdjust
	if f4_local0 ~= nil then
		f4_local0:SetAlpha( 0 )
	end
end

function SwitchToGradientColorPicker( f5_arg0 )
	CloseGradientAdjustPanel( f5_arg0 )
	OpenGradientColorPickerGrid( f5_arg0 )
end

function SwitchToGradientEditor( f6_arg0 )
	CloseGradientColorPickerGrid( f6_arg0 )
	OpenGradientAdjustPanel( f6_arg0 )
end

function PostLoadFunc( f7_arg0, f7_arg1, f7_arg2 )
	LUI.AddUIArrowFillBarButtonLogic( f7_arg0.GradientAdjust.GradientSlider, f7_arg1, {
		decimalPlacesToRound = 2,
		action = function ( f8_arg0, f8_arg1 )
			
		end,
		defaultValue = 128,
		wrapAround = false,
		max = 255,
		min = 0,
		step = 1,
		fillElement = f7_arg0.GradientAdjust.GradientSlider.GenericFillBar.Fill
	} )
	f7_arg0.SwitchToGradientColorPicker = SwitchToGradientColorPicker
	f7_arg0.SwitchToGradientEditor = SwitchToGradientEditor
	f7_arg0.GradientColorPickerGrid.NoColor.Background:SetAlpha( 0 )
	f7_arg0:SubscribeToModelThroughElement( f7_arg0.GradientColorPickerGrid.Grid, "color", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f7_arg0.GradientColorPickerGrid.Grid:GetDataSource()
		f9_local0 = f9_local0.color:GetValue( f7_arg1 )
		if f7_arg0.SelectedColorButtonNum ~= nil then
			f7_arg0.SelectedColorButton.color:SetRGBFromInt( f9_local0, 0 )
		end
	end )
end

function EmblemGradientMixerPanel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 480 * _1080p, 0, 234 * _1080p )
	self.id = "EmblemGradientMixerPanel"
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	local f10_local2 = self
	local GradientColorPickerGrid = nil
	
	GradientColorPickerGrid = MenuBuilder.BuildRegisteredType( "GradientColorPickerGrid", {
		controllerIndex = f10_local1
	} )
	GradientColorPickerGrid.id = "GradientColorPickerGrid"
	GradientColorPickerGrid:SetAlpha( 0, 0 )
	GradientColorPickerGrid:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 480, 0, _1080p * 234 )
	self:addElement( GradientColorPickerGrid )
	self.GradientColorPickerGrid = GradientColorPickerGrid
	
	local GradientAdjust = nil
	
	GradientAdjust = MenuBuilder.BuildRegisteredType( "EmblemGradientAdjust", {
		controllerIndex = f10_local1
	} )
	GradientAdjust.id = "GradientAdjust"
	GradientAdjust:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 480, 0, _1080p * 234 )
	self:addElement( GradientAdjust )
	self.GradientAdjust = GradientAdjust
	
	PostLoadFunc( self, f10_local1, controller )
	return self
end

MenuBuilder.registerType( "EmblemGradientMixerPanel", EmblemGradientMixerPanel )
LockTable( _M )
