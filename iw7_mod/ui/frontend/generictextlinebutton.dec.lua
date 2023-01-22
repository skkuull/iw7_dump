local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericTextLineButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 488 * _1080p, 0, 56 * _1080p )
	self.id = "GenericTextLineButton"
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
	GenericTextBox:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 488, 0, _1080p * 56 )
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
		
		GenericTextBox:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.GenericTextBox:SetRGBFromInt( 15573666, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			GenericTextBox:AnimateSequence( "ButtonOver" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f8_arg0, f8_arg1 )
		local f8_local0 = f8_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	return self
end

MenuBuilder.registerType( "GenericTextLineButton", GenericTextLineButton )
LockTable( _M )
