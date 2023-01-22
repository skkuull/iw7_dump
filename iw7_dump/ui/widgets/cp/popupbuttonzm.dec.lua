local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0 )
	assert( f1_arg0.Label )
	f1_arg0.SetText = function ( f2_arg0, f2_arg1 )
		f2_arg0.Label:setText( ToUpperCase( f2_arg1 ) )
	end
	
end

function PopupButtonZm( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 40 * _1080p )
	self.id = "PopupButtonZm"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetAlpha( 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Highlight = nil
	
	Highlight = LUI.UIImage.new()
	Highlight.id = "Highlight"
	Highlight:SetAlpha( 0, 0 )
	Highlight:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 40, 0 )
	self:addElement( Highlight )
	self.Highlight = Highlight
	
	local Label = nil
	
	Label = LUI.UIText.new()
	Label.id = "Label"
	Label:SetRGBFromInt( 16777215, 0 )
	Label:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	Label:SetFontSize( 32 * _1080p )
	Label:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label:SetAlignment( LUI.Alignment.Left )
	Label:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, 0, _1080p * -16, _1080p * 16 )
	self:addElement( Label )
	self.Label = Label
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.Popups.backgroundOver, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 0.75, 0 )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.Highlight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Highlight:SetAlpha( 1, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Highlight:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end,
				function ()
					return self.Highlight:SetRGBFromInt( 14042667, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Highlight:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 40, 0, 0 )
				end,
				function ()
					return self.Highlight:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 40, 0, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		Label:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.Label:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.Label:SetRGBFromInt( 0, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Label:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, 0, _1080p * -16, _1080p * 16, 0 )
				end,
				function ()
					return self.Label:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 40, 0, _1080p * -16, _1080p * 16, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Focused = function ()
			Background:AnimateSequence( "Focused" )
			Highlight:AnimateSequence( "Focused" )
			Label:AnimateSequence( "Focused" )
		end
		
		Background:RegisterAnimationSequence( "NotFocused", {
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.Popups.background, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "NotFocused", {
			{
				function ()
					return self.Highlight:SetAlpha( 0, 0 )
				end
			}
		} )
		Label:RegisterAnimationSequence( "NotFocused", {
			{
				function ()
					return self.Label:SetRGBFromInt( 16775930, 0 )
				end
			},
			{
				function ()
					return self.Label:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 40, 0, _1080p * -16, _1080p * 16, 0 )
				end,
				function ()
					return self.Label:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, 0, _1080p * -16, _1080p * 16, 100, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.NotFocused = function ()
			Background:AnimateSequence( "NotFocused" )
			Highlight:AnimateSequence( "NotFocused" )
			Label:AnimateSequence( "NotFocused" )
		end
		
		Background:RegisterAnimationSequence( "FocusedDisabled", {
			{
				function ()
					return self.Background:SetAlpha( 0.75, 0 )
				end
			},
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.Popups.backgroundOver, 0 )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "FocusedDisabled", {
			{
				function ()
					return self.Highlight:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Highlight:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Highlight:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.Highlight:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.Highlight:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 3, 100 )
				end
			}
		} )
		Label:RegisterAnimationSequence( "FocusedDisabled", {
			{
				function ()
					return self.Label:SetAlpha( 0.3, 0 )
				end
			},
			{
				function ()
					return self.Label:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, 0, _1080p * -16, _1080p * 16, 0 )
				end,
				function ()
					return self.Label:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 40, 0, _1080p * -16, _1080p * 16, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.FocusedDisabled = function ()
			Background:AnimateSequence( "FocusedDisabled" )
			Highlight:AnimateSequence( "FocusedDisabled" )
			Label:AnimateSequence( "FocusedDisabled" )
		end
		
		Background:RegisterAnimationSequence( "NotFocusedDisabled", {
			{
				function ()
					return self.Background:SetAlpha( 0.05, 0 )
				end
			},
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.Popups.background, 0 )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "NotFocusedDisabled", {
			{
				function ()
					return self.Highlight:SetAlpha( 0, 0 )
				end
			}
		} )
		Label:RegisterAnimationSequence( "NotFocusedDisabled", {
			{
				function ()
					return self.Label:SetAlpha( 0.15, 0 )
				end
			},
			{
				function ()
					return self.Label:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 40, 0, _1080p * -16, _1080p * 16, 0 )
				end,
				function ()
					return self.Label:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, 0, _1080p * -16, _1080p * 16, 100, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.NotFocusedDisabled = function ()
			Background:AnimateSequence( "NotFocusedDisabled" )
			Highlight:AnimateSequence( "NotFocusedDisabled" )
			Label:AnimateSequence( "NotFocusedDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f44_arg0, f44_arg1 )
		local f44_local0 = f44_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "Focused" )
	end )
	self:addEventHandler( "button_up", function ( f45_arg0, f45_arg1 )
		local f45_local0 = f45_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "NotFocused" )
	end )
	self:addEventHandler( "button_over_disable", function ( f46_arg0, f46_arg1 )
		local f46_local0 = f46_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "FocusedDisabled" )
	end )
	self:addEventHandler( "button_disable", function ( f47_arg0, f47_arg1 )
		local f47_local0 = f47_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "NotFocusedDisabled" )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "PopupButtonZm", PopupButtonZm )
LockTable( _M )
