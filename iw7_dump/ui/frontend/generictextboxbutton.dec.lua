local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericTextBoxButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 488 * _1080p, 0, 172 * _1080p )
	self.id = "GenericTextBoxButton"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local GenericTextBox = nil
	
	GenericTextBox = MenuBuilder.BuildRegisteredType( "GenericTextBox", {
		controllerIndex = f1_local1
	} )
	GenericTextBox.id = "GenericTextBox"
	GenericTextBox.Text:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
	GenericTextBox.Text:setText( Engine.Localize( "MENU_NEW" ), 0 )
	GenericTextBox.Text:SetFontSize( 20 * _1080p )
	GenericTextBox.Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GenericTextBox.Text:SetAlignment( LUI.Alignment.Left )
	GenericTextBox:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 488, 0, _1080p * 172 )
	self:addElement( GenericTextBox )
	self.GenericTextBox = GenericTextBox
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		GenericTextBox:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.GenericTextBox:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			GenericTextBox:AnimateSequence( "ButtonUp" )
		end
		
		GenericTextBox:RegisterAnimationSequence( "ButtonHover", {
			{
				function ()
					return self.GenericTextBox:SetRGBFromInt( 13717424, 0 )
				end
			}
		} )
		self._sequences.ButtonHover = function ()
			GenericTextBox:AnimateSequence( "ButtonHover" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_up", function ( f8_arg0, f8_arg1 )
		local f8_local0 = f8_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_over", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonHover" )
	end )
	return self
end

MenuBuilder.registerType( "GenericTextBoxButton", GenericTextBoxButton )
LockTable( _M )
