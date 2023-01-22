local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:registerEventHandler( "button_down", function ( element, event )
		OSK.OpenScreenKeyboard( f1_arg1, Engine.Localize( "MLG_GAMEBATTLES_MATCH_ID" ), element.Text:getText(), 100, false, true, false, function ( f3_arg0, f3_arg1, f3_arg2 )
			if f3_arg1 ~= nil and f3_arg1 ~= "" then
				element.Text:setText( f3_arg1 )
				element:dispatchEventToParent( {
					name = "matchID_updated",
					immediate = true
				} )
			end
		end, CoD.KeyboardInputTypes.Normal )
	end )
end

function MatchIDTextBox( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 505 * _1080p, 0, 53 * _1080p )
	self.id = "MatchIDTextBox"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:setText( "", 0 )
	Text:SetFontSize( 45 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 2.5, _1080p * 47.5 )
	self:addElement( Text )
	self.Text = Text
	
	local ButtonSelection = nil
	
	ButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f4_local1
	} )
	ButtonSelection.id = "ButtonSelection"
	ButtonSelection:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -12, _1080p * 516, 0, _1080p * 50 )
	self:addElement( ButtonSelection )
	self.ButtonSelection = ButtonSelection
	
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "MatchIDTextBox", MatchIDTextBox )
LockTable( _M )
