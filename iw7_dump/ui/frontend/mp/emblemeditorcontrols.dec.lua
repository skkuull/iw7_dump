local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 10
function getButtonIconText( f1_arg0 )
	local f1_local0 = Engine.Localize( f1_arg0.string )
	if not CONDITIONS.IsGamepadEnabled() and f1_arg0 == ButtonMap.button_r3 then
		f1_local0 = Engine.Localize( "PLATFORM_KB_F_BUTTON" )
	end
	return f1_local0
end

function AddButtonHelper( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = f2_arg0:getNumChildren()
	if f0_local0 <= f2_local0 then
		DebugPrint( "Ran out of button helpers!!" )
		return 
	end
	local f2_local1 = f2_arg2.isSlider
	local f2_local2 = nil
	if f2_local1 then
		f2_local2 = CreateSlider( f2_arg1, "control" .. tostring( f2_local0 + 1 ), f2_arg2 )
	else
		f2_local2 = CreateButtonHelper( f2_arg0, f2_arg1, "control" .. tostring( f2_local0 + 1 ), f2_arg2 )
	end
	f2_arg0:addElement( f2_local2 )
	return true
end

function ClearButtonHelper( f3_arg0 )
	f3_arg0:closeChildren()
end

function CreateButtonHelper( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	local f4_local0 = MenuBuilder.BuildRegisteredType( CONDITIONS.IsGamepadEnabled() and "ControlsButtonHelper" or "ControlsButtonHelperPC", {
		controllerIndex = f4_arg1
	} )
	f4_local0.id = f4_arg2
	f4_local0.Label:setText( f4_arg3.helper_text or "" )
	local f4_local1 = f4_arg3.button_ref
	if f4_local1 then
		f4_local1 = ButtonMap[f4_arg3.button_ref]
	end
	local f4_local2 = f4_arg3.button_ref2
	if f4_local2 then
		f4_local2 = ButtonMap[f4_arg3.button_ref2]
	end
	local f4_local3 = f4_arg3.imageIcon
	if f4_local3 then
		f4_local3 = f4_local0.IconImage
		if f4_local3 then
			if not f4_local1 then
				f4_local3 = not f4_local2
			else
				f4_local3 = false
			end
		end
	end
	if f4_local1 then
		f4_local0.Icon:setText( getButtonIconText( ButtonMap[f4_arg3.button_ref] ) )
	else
		f4_local0.Icon:setText( "" )
	end
	if f4_local2 then
		f4_local0.Icon2:setText( getButtonIconText( ButtonMap[f4_arg3.button_ref2] ) )
	else
		f4_local0.Icon2:setText( "" )
	end
	if f4_local3 then
		f4_local0.IconImage:SetAlpha( 1, 0 )
		f4_local0.IconImage:setImage( RegisterMaterial( f4_arg3.imageIcon ), 0 )
	elseif f4_local0.IconImage then
		f4_local0.IconImage:SetAlpha( 0, 0 )
	end
	local f4_local4 = ACTIONS.AnimateSequence
	local f4_local5 = f4_local0
	local f4_local6
	if f4_local2 then
		f4_local6 = "TwoRef"
		if not f4_local6 then
		
		else
			f4_local4( f4_local5, f4_local6 )
			if f4_arg3.isButton then
				assert( f4_arg3.binding )
				assert( f4_local0.ButtonBackground )
				f4_local0:SetHandleMouse( true )
				f4_local0.ButtonBackground:SetAlpha( 1, 0 )
				f4_local5 = f4_arg0:GetCurrentMenu()
				f4_local0:registerEventHandler( "button_action", function ( element, event )
					f4_arg3.binding( f4_local5, event )
					return true
				end )
			else
				f4_local0:SetHandleMouse( false )
			end
			if f4_arg3.ignoreGroupedLayers and EmblemEditor.HasGroupedLayers() then
				f4_local0.Label:SetAlpha( 0.6 )
				f4_local0.Icon:SetAlpha( 0.6 )
				f4_local0.Icon2:SetAlpha( 0.6 )
				if not CONDITIONS.IsGamepadEnabled() then
					f4_local0:SetButtonDisabled( true )
				end
			end
			return f4_local0
		end
	end
	f4_local6 = "OneRef"
end

function CreateSlider( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = MenuBuilder.BuildRegisteredType( "ControlsSlider", {
		controllerIndex = f6_arg0
	} )
	f6_local0.id = f6_arg1
	f6_local0.Label:setText( f6_arg2.helper_text or "" )
	local f6_local1 = function ( f7_arg0, f7_arg1 )
		if f6_arg2.sliderAction then
			f6_arg2.sliderAction( f7_arg0, f7_arg1 )
		end
		f6_local0.ValueLabel:setText( f7_arg0 )
	end
	
	local f6_local2 = f6_arg2.sliderValue
	if not f6_local2 and f6_arg2.sliderValueFunc then
		f6_local2 = f6_arg2.sliderValueFunc()
	end
	assert( f6_local2 )
	LUI.AddUIArrowFillBarButtonLogic( f6_local0, f6_arg0, {
		action = f6_local1,
		defaultValue = f6_local2,
		wrapAround = false,
		max = f6_arg2.sliderMax,
		min = f6_arg2.sliderMin,
		step = 1,
		fillElement = f6_local0.GenericFillBar.Fill,
		fillMarkerElement = f6_local0.GenericFillBar.SliderFillBarMarker,
		enableButtonInput = false
	} )
	f6_local0:SetValue( f6_local2 )
	return f6_local0
end

function PostLoadFunc( menu, controller )
	local self = LUI.UIVerticalList.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 5,
		right = 0,
		top = 25,
		bottom = 0,
		alignment = LUI.Alignment.Top,
		spacing = 3
	} )
	self.id = "buttonHelperList"
	menu:addElement( self )
	self:registerEventHandler( "add_control_panel_button_helper", function ( element, event )
		AddButtonHelper( self, controller, event )
	end )
	self:registerEventHandler( "clear_control_panel_button_helpers", function ( element, event )
		ClearButtonHelper( self )
	end )
end

function EmblemEditorControls( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 260 * _1080p, 0, 300 * _1080p )
	self.id = "EmblemEditorControls"
	local f11_local1 = controller and controller.controllerIndex
	if not f11_local1 and not Engine.InFrontend() then
		f11_local1 = self:getRootController()
	end
	assert( f11_local1 )
	local f11_local2 = self
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
	Title:setText( Engine.Localize( "MP_EMBLEM_EDITOR_CONTROLS" ), 0 )
	Title:SetFontSize( 18 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16.5, _1080p * 243.5, _1080p * 3, _1080p * 21 )
	self:addElement( Title )
	self.Title = Title
	
	local f11_local6 = nil
	if Engine.InFrontend() then
		f11_local6 = LUI.UIImage.new()
		f11_local6.id = "DropShadow"
		f11_local6:SetRGBFromInt( 0, 0 )
		f11_local6:SetAlpha( 0.3, 0 )
		f11_local6:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f11_local6:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f11_local6 )
		self.DropShadow = f11_local6
	end
	PostLoadFunc( self, f11_local1, controller )
	return self
end

MenuBuilder.registerType( "EmblemEditorControls", EmblemEditorControls )
LUI.FlowManager.RegisterStackPopBehaviour( "EmblemEditorControls", PopFunc )
LockTable( _M )
