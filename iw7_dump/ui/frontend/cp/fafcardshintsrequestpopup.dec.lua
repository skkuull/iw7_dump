local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local self = LUI.UIBindButton.new()
	self.id = "DismissFAFCardsHintsRequestPopup_id"
	self:registerEventHandler( "button_secondary", f0_local0 )
	f2_arg0:addElement( self )
end

function FAFCardsHintsRequestPopup( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "FAFCardsHintsRequestPopup"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self:playSound( "menu_open" )
	local f3_local2 = self
	local Darkener = nil
	
	Darkener = LUI.UIImage.new()
	Darkener.id = "Darkener"
	Darkener:SetRGBFromTable( SWATCHES.genericMenu.blackBackground, 0 )
	Darkener:SetAlpha( 0, 0 )
	Darkener:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1000, _1080p * 1000, _1080p * -1000, _1080p * 1000 )
	self:addElement( Darkener )
	self.Darkener = Darkener
	
	local PopupButtonYes = nil
	
	PopupButtonYes = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f3_local1
	} )
	PopupButtonYes.id = "PopupButtonYes"
	PopupButtonYes.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_YES" ) ), 0 )
	PopupButtonYes.Label:SetAlignment( LUI.Alignment.Center )
	PopupButtonYes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 623.5, _1080p * 1023.5, _1080p * 589.25, _1080p * 619.25 )
	self:addElement( PopupButtonYes )
	self.PopupButtonYes = PopupButtonYes
	
	local PopupButtonNo = nil
	
	PopupButtonNo = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f3_local1
	} )
	PopupButtonNo.id = "PopupButtonNo"
	PopupButtonNo.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_NO" ) ), 0 )
	PopupButtonNo.Label:SetAlignment( LUI.Alignment.Center )
	PopupButtonNo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 623.5, _1080p * 1023.5, _1080p * 635.25, _1080p * 665.25 )
	self:addElement( PopupButtonNo )
	self.PopupButtonNo = PopupButtonNo
	
	local FAFDescription = nil
	
	FAFDescription = LUI.UIText.new()
	FAFDescription.id = "FAFDescription"
	FAFDescription:setText( Engine.Localize( "LUA_MENU_ZM_FAF_CARDS_HINT_PROMPT" ), 0 )
	FAFDescription:SetFontSize( 22 * _1080p )
	FAFDescription:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	FAFDescription:SetAlignment( LUI.Alignment.Left )
	FAFDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 623.5, _1080p * 1123.5, _1080p * 502.75, _1080p * 525.25 )
	self:addElement( FAFDescription )
	self.FAFDescription = FAFDescription
	
	local HintNote = nil
	
	HintNote = LUI.UIText.new()
	HintNote.id = "HintNote"
	HintNote:setText( Engine.Localize( "LUA_MENU_ZM_FAF_CARDS_HINT_NOTE" ), 0 )
	HintNote:SetFontSize( 19 * _1080p )
	HintNote:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	HintNote:SetAlignment( LUI.Alignment.Left )
	HintNote:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 623.5, _1080p * 1123.5, _1080p * 697.75, _1080p * 716.75 )
	self:addElement( HintNote )
	self.HintNote = HintNote
	
	local CPIconSquares = nil
	
	CPIconSquares = LUI.UIImage.new()
	CPIconSquares.id = "CPIconSquares"
	CPIconSquares:setImage( RegisterMaterial( "cp_menu_title_icon_squares" ), 0 )
	CPIconSquares:SetBlendMode( BLEND_MODE.addWithAlpha )
	CPIconSquares:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 588, _1080p * 612, _1080p * 461, _1080p * 501 )
	self:addElement( CPIconSquares )
	self.CPIconSquares = CPIconSquares
	
	local Header = nil
	
	Header = LUI.UIText.new()
	Header.id = "Header"
	Header:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	Header:setText( Engine.Localize( "LUA_MENU_ZM_WONDER_CARDS" ), 0 )
	Header:SetFontSize( 45 * _1080p )
	Header:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	Header:SetAlignment( LUI.Alignment.Left )
	Header:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 622.5, _1080p * 1122.5, _1080p * 459.25, _1080p * 504.25 )
	self:addElement( Header )
	self.Header = Header
	
	local CPMenuTitle = nil
	
	CPMenuTitle = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
		controllerIndex = f3_local1
	} )
	CPMenuTitle.id = "CPMenuTitle"
	CPMenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_ZM_CREATE_DECK" ), 0 )
	CPMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( CPMenuTitle )
	self.CPMenuTitle = CPMenuTitle
	
	local GradLineTop = nil
	
	GradLineTop = LUI.UIImage.new()
	GradLineTop.id = "GradLineTop"
	GradLineTop:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	GradLineTop:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 445, _1080p * 1601, _1080p * 444, _1080p * 445 )
	self:addElement( GradLineTop )
	self.GradLineTop = GradLineTop
	
	local GradLineBot = nil
	
	GradLineBot = LUI.UIImage.new()
	GradLineBot.id = "GradLineBot"
	GradLineBot:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	GradLineBot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 445, _1080p * 1601, _1080p * 767, _1080p * 768 )
	self:addElement( GradLineBot )
	self.GradLineBot = GradLineBot
	
	local FAFCardsDisplay = nil
	
	FAFCardsDisplay = MenuBuilder.BuildRegisteredType( "FAFCardsDisplay", {
		controllerIndex = f3_local1
	} )
	FAFCardsDisplay.id = "FAFCardsDisplay"
	FAFCardsDisplay:SetScale( -0.25, 0 )
	FAFCardsDisplay:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1086.61, _1080p * 1447.61, _1080p * 475.38, _1080p * 740.38 )
	self:addElement( FAFCardsDisplay )
	self.FAFCardsDisplay = FAFCardsDisplay
	
	self._animationSets.DefaultAnimationSet = function ()
		Darkener:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Darkener:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Darkener:SetAlpha( 0.8, 1000 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Darkener:AnimateSequence( "DefaultSequence" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PopupButtonYes:addEventHandler( "button_action", function ( f8_arg0, f8_arg1 )
		local f8_local0 = f8_arg1.controller or f3_local1
		ACTIONS.LeaveMenu( self )
		ACTIONS.OpenPopupMenu( self, "FAFCardsHintsPopup", true, f8_local0 )
	end )
	PopupButtonNo:addEventHandler( "button_action", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f3_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local1( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "FAFCardsHintsRequestPopup", FAFCardsHintsRequestPopup )
LockTable( _M )
