local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg0.value ~= f1_arg1 then
		f1_arg0:SetCurrentValue( math.floor( f1_arg1 + 0.5 ) )
		f1_arg0.value = f1_arg1
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.SetValue = f0_local0
	f2_arg0:SetHandleMouseButton( false )
	if not CONDITIONS.IsGamepadEnabled() then
		LUI.AddMouseSliderLogic( f2_arg0 )
	end
end

function ControlsSlider( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 50 * _1080p )
	self.id = "ControlsSlider"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Label = nil
	
	Label = LUI.UIText.new()
	Label.id = "Label"
	Label:setText( "", 0 )
	Label:SetFontSize( 16 * _1080p )
	Label:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label:SetAlignment( LUI.Alignment.Left )
	Label:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 345, _1080p * 4, _1080p * 20 )
	self:addElement( Label )
	self.Label = Label
	
	local GenericFillBar = nil
	
	GenericFillBar = MenuBuilder.BuildRegisteredType( "SliderFillBar", {
		controllerIndex = f3_local1
	} )
	GenericFillBar.id = "GenericFillBar"
	GenericFillBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 73, _1080p * 345, _1080p * 28, _1080p * 44 )
	self:addElement( GenericFillBar )
	self.GenericFillBar = GenericFillBar
	
	local ValueLabel = nil
	
	ValueLabel = LUI.UIText.new()
	ValueLabel.id = "ValueLabel"
	ValueLabel:setText( "", 0 )
	ValueLabel:SetFontSize( 16 * _1080p )
	ValueLabel:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	ValueLabel:SetAlignment( LUI.Alignment.Left )
	ValueLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 69, _1080p * 28, _1080p * 44 )
	self:addElement( ValueLabel )
	self.ValueLabel = ValueLabel
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Label:RegisterAnimationSequence( "button_over", {
			{
				function ()
					return self.Label:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.Label:SetRGBFromTable( SWATCHES.genericButton.highlight, 100 )
				end
			}
		} )
		self._sequences.button_over = function ()
			Label:AnimateSequence( "button_over" )
		end
		
		Label:RegisterAnimationSequence( "button_up", {
			{
				function ()
					return self.Label:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end,
				function ()
					return self.Label:SetRGBFromInt( 16777215, 100 )
				end
			}
		} )
		self._sequences.button_up = function ()
			Label:AnimateSequence( "button_up" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f12_arg0, f12_arg1 )
		local f12_local0 = f12_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "button_over" )
	end )
	self:addEventHandler( "button_up", function ( f13_arg0, f13_arg1 )
		local f13_local0 = f13_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "button_up" )
	end )
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ControlsSlider", ControlsSlider )
LockTable( _M )
