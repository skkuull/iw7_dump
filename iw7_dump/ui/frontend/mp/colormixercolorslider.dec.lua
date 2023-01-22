local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg0.value ~= f1_arg1 then
		f1_arg0.ValueLabel:setText( f1_arg1 )
		f1_arg0:SetCurrentValue( f1_arg1 )
		f1_arg0.value = f1_arg1
	end
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.SetValue = f0_local0
	f2_arg0:SetHandleMouseButton( false )
	if not CONDITIONS.IsGamepadEnabled() then
		LUI.AddMouseSliderLogic( f2_arg0 )
	end
end

function ColorMixerColorSlider( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 45 * _1080p )
	self.id = "ColorMixerColorSlider"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ValueName = nil
	
	ValueName = LUI.UIText.new()
	ValueName.id = "ValueName"
	ValueName:setText( "", 0 )
	ValueName:SetFontSize( 20 * _1080p )
	ValueName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ValueName:SetAlignment( LUI.Alignment.Left )
	ValueName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 18, _1080p * 118, _1080p * 12.5, _1080p * 32.5 )
	self:addElement( ValueName )
	self.ValueName = ValueName
	
	local ValueLabel = nil
	
	ValueLabel = LUI.UIText.new()
	ValueLabel.id = "ValueLabel"
	ValueLabel:setText( "", 0 )
	ValueLabel:SetFontSize( 20 * _1080p )
	ValueLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ValueLabel:SetAlignment( LUI.Alignment.Left )
	ValueLabel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -45, _1080p * -10, _1080p * 12.5, _1080p * 32.5 )
	self:addElement( ValueLabel )
	self.ValueLabel = ValueLabel
	
	local GenericFillBar = nil
	
	GenericFillBar = MenuBuilder.BuildRegisteredType( "SliderFillBar", {
		controllerIndex = f3_local1
	} )
	GenericFillBar.id = "GenericFillBar"
	GenericFillBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 123, _1080p * 348, _1080p * 13.5, _1080p * 31.5 )
	self:addElement( GenericFillBar )
	self.GenericFillBar = GenericFillBar
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ValueName:RegisterAnimationSequence( "button_over", {
			{
				function ()
					return self.ValueName:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.ValueName:SetRGBFromTable( SWATCHES.genericButton.highlight, 100 )
				end
			}
		} )
		ValueLabel:RegisterAnimationSequence( "button_over", {
			{
				function ()
					return self.ValueLabel:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.ValueLabel:SetRGBFromTable( SWATCHES.genericButton.highlight, 100 )
				end
			}
		} )
		self._sequences.button_over = function ()
			ValueName:AnimateSequence( "button_over" )
			ValueLabel:AnimateSequence( "button_over" )
		end
		
		ValueName:RegisterAnimationSequence( "button_up", {
			{
				function ()
					return self.ValueName:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end,
				function ()
					return self.ValueName:SetRGBFromInt( 16777215, 100 )
				end
			}
		} )
		ValueLabel:RegisterAnimationSequence( "button_up", {
			{
				function ()
					return self.ValueLabel:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end,
				function ()
					return self.ValueLabel:SetRGBFromInt( 16777215, 100 )
				end
			}
		} )
		self._sequences.button_up = function ()
			ValueName:AnimateSequence( "button_up" )
			ValueLabel:AnimateSequence( "button_up" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "button_over" )
	end )
	self:addEventHandler( "button_up", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f17_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "button_up" )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ColorMixerColorSlider", ColorMixerColorSlider )
LockTable( _M )
