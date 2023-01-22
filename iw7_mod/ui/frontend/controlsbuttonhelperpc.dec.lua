local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.m_requireFocusType = FocusType.MouseOver
end

function ControlsButtonHelperPC( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 24 * _1080p )
	self.id = "ControlsButtonHelperPC"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local ButtonBackground = nil
	
	ButtonBackground = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f2_local1
	} )
	ButtonBackground.id = "ButtonBackground"
	ButtonBackground:SetAlpha( 0, 0 )
	ButtonBackground.Label:setText( ToUpperCase( "" ), 0 )
	ButtonBackground.Label:SetAlignment( LUI.Alignment.Left )
	ButtonBackground:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 350, 0, _1080p * 24 )
	self:addElement( ButtonBackground )
	self.ButtonBackground = ButtonBackground
	
	local Icon = nil
	
	Icon = LUI.UIText.new()
	Icon.id = "Icon"
	Icon:SetRGBFromInt( 14277081, 0 )
	Icon:setText( "#", 0 )
	Icon:SetFontSize( 20 * _1080p )
	Icon:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	Icon:SetAlignment( LUI.Alignment.Center )
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 240, _1080p * 293, _1080p * 2.5, _1080p * 22.5 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Icon2 = nil
	
	Icon2 = LUI.UIText.new()
	Icon2.id = "Icon2"
	Icon2:SetRGBFromInt( 14277081, 0 )
	Icon2:setText( "#", 0 )
	Icon2:SetFontSize( 20 * _1080p )
	Icon2:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	Icon2:SetAlignment( LUI.Alignment.Center )
	Icon2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 293, _1080p * 346, _1080p * 2.5, _1080p * 22.5 )
	self:addElement( Icon2 )
	self.Icon2 = Icon2
	
	local Label = nil
	
	Label = LUI.UIStyledText.new()
	Label.id = "Label"
	Label:SetRGBFromInt( 14277081, 0 )
	Label:setText( Engine.Localize( "MENU_BACK" ), 0 )
	Label:SetFontSize( 16 * _1080p )
	Label:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label:SetAlignment( LUI.Alignment.Left )
	Label:SetStartupDelay( 1250 )
	Label:SetLineHoldTime( 400 )
	Label:SetAnimMoveTime( 300 )
	Label:SetEndDelay( 1000 )
	Label:SetCrossfadeTime( 500 )
	Label:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Label:SetMaxVisibleLines( 1 )
	Label:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 237, _1080p * 4, _1080p * 20 )
	self:addElement( Label )
	self.Label = Label
	
	local IconImage = nil
	
	IconImage = LUI.UIImage.new()
	IconImage.id = "IconImage"
	IconImage:SetAlpha( 0, 0 )
	IconImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 276.5, _1080p * 309.5, _1080p * 2.5, _1080p * 22.5 )
	self:addElement( IconImage )
	self.IconImage = IconImage
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Icon:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Icon:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Icon2:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Icon2:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Label:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Label:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Icon:AnimateSequence( "ButtonOver" )
			Icon2:AnimateSequence( "ButtonOver" )
			Label:AnimateSequence( "ButtonOver" )
		end
		
		Icon:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Icon:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		Icon2:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Icon2:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		Label:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Label:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Icon:AnimateSequence( "ButtonUp" )
			Icon2:AnimateSequence( "ButtonUp" )
			Label:AnimateSequence( "ButtonUp" )
		end
		
		Icon:RegisterAnimationSequence( "OneRef", {
			{
				function ()
					return self.Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 240, _1080p * 346, _1080p * 2.5, _1080p * 22.5, 0 )
				end
			}
		} )
		Icon2:RegisterAnimationSequence( "OneRef", {
			{
				function ()
					return self.Icon2:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.OneRef = function ()
			Icon:AnimateSequence( "OneRef" )
			Icon2:AnimateSequence( "OneRef" )
		end
		
		Icon:RegisterAnimationSequence( "TwoRef", {
			{
				function ()
					return self.Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 240, _1080p * 293, _1080p * 2.5, _1080p * 22.5, 0 )
				end
			}
		} )
		Icon2:RegisterAnimationSequence( "TwoRef", {
			{
				function ()
					return self.Icon2:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.TwoRef = function ()
			Icon:AnimateSequence( "TwoRef" )
			Icon2:AnimateSequence( "TwoRef" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f19_arg0, f19_arg1 )
		local f19_local0 = f19_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "ControlsButtonHelperPC", ControlsButtonHelperPC )
LockTable( _M )
