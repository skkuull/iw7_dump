local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 300
f0_local1 = EmblemEditorUtils.MaxPosition / f0_local0
f0_local2 = EmblemEditorUtils.MaxScale / f0_local0
function BuildGridLines( f1_arg0 )
	local f1_local0 = 0
	local f1_local1 = 532 * _1080p
	local f1_local2 = 0
	local f1_local3 = 532 * _1080p
	local f1_local4 = f1_local1 - f1_local0
	local f1_local5 = f1_local3 - f1_local2
	local f1_local6 = 2 * _1080p * 0.5
	local f1_local7 = 20
	local f1_local8 = f1_local4 / f1_local7
	for f1_local9 = 1, f1_local7 - 1, 1 do
		local f1_local12 = f1_local9 * f1_local8
		local self = nil
		self = LUI.UIImage.new()
		self:SetAnchorsAndPosition( 0, 1, 0, 0, f1_local12 - f1_local6, f1_local12 + f1_local6, 0, 0 )
		f1_arg0:addElement( self )
	end
	for f1_local9 = 1, f1_local7 - 1, 1 do
		local f1_local12 = f1_local9 * f1_local8
		local self = nil
		self = LUI.UIImage.new()
		self:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, f1_local12 - f1_local6, f1_local12 + f1_local6 )
		f1_arg0:addElement( self )
	end
end

function HideGridLines( f2_arg0, f2_arg1 )
	f2_arg0:SetAlpha( 0 )
end

function ShowGridLines( f3_arg0, f3_arg1 )
	f3_arg0:SetAlpha( 0.5 )
end

local f0_local3 = function ( f4_arg0 )
	local f4_local0
	if f4_arg0.x ~= -1000 or f4_arg0.y ~= -1000 then
		f4_local0 = false
	else
		f4_local0 = true
	end
	return f4_local0
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = EmblemEditorUtils.IsEditingLayer()
	local f5_local1 = EmblemEditor.colorPickerMode == EmblemEditor.ColorPickerMode.MATERIAL_PICKER
	if (f5_local0 or f5_local1) and (f5_arg0._moving or f5_arg0._scaling) then
		if f0_local3( f5_arg1 ) then
			EndMouseInput( f5_arg0, f5_arg1 )
			return 
		end
		local f5_local2, f5_local3 = f5_arg1.root:PixelsToUnits( f5_arg0._lastXPos, f5_arg0._lastYPos )
		local f5_local4, f5_local5 = f5_arg1.root:PixelsToUnits( f5_arg1.x, f5_arg1.y )
		local f5_local6 = EmblemEditor.GetSelectedLayerIndex()
		if f5_arg0._moving and f5_local0 then
			EmblemEditor.AdjustLayerPosition( f5_local6, (f5_local4 - f5_local2) * f0_local1, (f5_local5 - f5_local3) * f0_local1 )
		elseif f5_arg0._scaling then
			local f5_local7, f5_local8 = nil
			if EmblemEditor.GetScaleMode() == EmblemEditor.ScaleMode.FIXED_SCALE then
				f5_local7 = (f5_local4 - f5_local2) * f0_local2
				f5_local8 = f5_local7
			else
				f5_local7 = (f5_local4 - f5_local2) * f0_local2
				f5_local8 = (f5_local5 - f5_local3) * f0_local2
			end
			if f5_local1 then
				EmblemEditor.AdjustLayerMaterialScale( f5_local6, f5_local7, f5_local8 )
			else
				EmblemEditor.AdjustLayerScale( f5_local6, f5_local7, f5_local8 )
			end
		end
		f5_arg0._lastXPos = f5_arg1.x
		f5_arg0._lastYPos = f5_arg1.y
	end
end

local f0_local5 = function ( f6_arg0, f6_arg1 )
	f6_arg0:applyElementTransform()
	local f6_local0, f6_local1 = ProjectRootCoordinate( f6_arg1.rootName, f6_arg1.x, f6_arg1.y )
	f0_local4( f6_arg0, {
		controller = f6_arg1.controller,
		root = f6_arg1.root,
		x = f6_local0,
		y = f6_local1
	} )
	f6_arg0:undoElementTransform()
end

local f0_local6 = function ( f7_arg0, f7_arg1 )
	if not f7_arg0._scaling then
		f7_arg0._moving = true
		f7_arg0._lastXPos = f7_arg1.x
		f7_arg0._lastYPos = f7_arg1.y
	end
end

local f0_local7 = function ( f8_arg0, f8_arg1 )
	if not EmblemEditor.HasGroupedLayers() and not f8_arg0._moving then
		f8_arg0._scaling = true
		f8_arg0._lastXPos = f8_arg1.x
		f8_arg0._lastYPos = f8_arg1.y
	end
end

local f0_local8 = function ( f9_arg0, f9_arg1 )
	f9_arg0._moving = false
	f9_arg0._scaling = false
	f9_arg0._lastXPos = nil
	f9_arg0._lastYPos = nil
end

local f0_local9 = function ( f10_arg0, f10_arg1 )
	if f10_arg0._moving then
		f0_local8( f10_arg0, f10_arg1 )
	end
end

local f0_local10 = function ( f11_arg0, f11_arg1 )
	if f11_arg0._scaling then
		f0_local8( f11_arg0, f11_arg1 )
	end
end

function PostLoadFunc( f12_arg0, f12_arg1, f12_arg2 )
	local self = nil
	self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self.id = "Grid"
	self.hide = HideGridLines
	self.show = ShowGridLines
	self:addElementBefore( f12_arg0.Background )
	f12_arg0.Grid = self
	BuildGridLines( self )
	if EmblemEditor.gridVisible then
		f12_arg0.Grid:show()
	else
		f12_arg0.Grid:hide()
	end
	if EmblemEditor.useAlternateGridColor then
		f12_arg0.Grid:SetRGBFromTable( SWATCHES.emblemEditor.gridColorAlt )
	else
		f12_arg0.Grid:SetRGBFromTable( SWATCHES.emblemEditor.gridColor )
	end
	f12_arg0:setActionSFX( nil )
	if Engine.IsPC() then
		f12_arg0:SetHandleMouse( true )
		f12_arg0:registerEventHandler( "leftmousedown", f0_local6 )
		f12_arg0:registerEventHandler( "leftmouseup", f0_local9 )
		f12_arg0:registerEventHandler( "rightmousedown", f0_local7 )
		f12_arg0:registerEventHandler( "rightmouseup", f0_local10 )
		f12_arg0:addEventHandler( "popup_active", f0_local8 )
		f12_arg0:registerEventHandler( "mousemove", f0_local5 )
	end
end

function EmblemEditorEmblemPreview( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 350 * _1080p )
	self.id = "EmblemEditorEmblemPreview"
	local f13_local1 = controller and controller.controllerIndex
	if not f13_local1 and not Engine.InFrontend() then
		f13_local1 = self:getRootController()
	end
	assert( f13_local1 )
	local f13_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	self:addElement( Background )
	self.Background = Background
	
	local HeaderBackground = nil
	
	HeaderBackground = LUI.UIImage.new()
	HeaderBackground.id = "HeaderBackground"
	HeaderBackground:SetRGBFromInt( 0, 0 )
	HeaderBackground:SetAlpha( 0.8, 0 )
	HeaderBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -24, 0 )
	self:addElement( HeaderBackground )
	self.HeaderBackground = HeaderBackground
	
	local HeaderText = nil
	
	HeaderText = LUI.UIText.new()
	HeaderText.id = "HeaderText"
	HeaderText:setText( ToUpperCase( Engine.Localize( "MP_EMBLEM_EDITOR_CANVAS" ) ), 0 )
	HeaderText:SetFontSize( 18 * _1080p )
	HeaderText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	HeaderText:SetAlignment( LUI.Alignment.Left )
	HeaderText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 12, _1080p * -11, _1080p * -21, _1080p * -3 )
	self:addElement( HeaderText )
	self.HeaderText = HeaderText
	
	PostLoadFunc( self, f13_local1, controller )
	return self
end

MenuBuilder.registerType( "EmblemEditorEmblemPreview", EmblemEditorEmblemPreview )
LockTable( _M )
