local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ClanTagButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "ClanTagButton"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "GenericListArrowButtonBackground", {
		controllerIndex = f1_local1
	} )
	Background.id = "Background"
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -50, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Text = nil
	
	Text = LUI.UIStyledText.new()
	Text.id = "Text"
	Text:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	Text:SetAlpha( 0.8, 0 )
	Text:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	Text:SetFontSize( 26 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetOutlineRGBFromInt( 0, 0 )
	Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -65, _1080p * -13, _1080p * 13 )
	self:addElement( Text )
	self.Text = Text
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -50, 0, 0, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		Text:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end,
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.textFocus, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 1, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -65, _1080p * -13, _1080p * 13, 0 )
				end,
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 40, _1080p * -45, _1080p * -13, _1080p * 13, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Background:AnimateSequence( "ButtonOver" )
			Text:AnimateSequence( "ButtonOver" )
		end
		
		Background:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -50, 0, 0, 100, LUI.EASING.inQuadratic )
				end
			}
		} )
		Text:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end,
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.textDefault, 100, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 0.8, 100, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 40, _1080p * -45, _1080p * -13, _1080p * 13, 0 )
				end,
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -65, _1080p * -13, _1080p * 13, 100, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Background:AnimateSequence( "ButtonUp" )
			Text:AnimateSequence( "ButtonUp" )
		end
		
		Text:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Text:AnimateSequence( "Locked" )
		end
		
		Text:RegisterAnimationSequence( "NewNotification", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.contentFocus, 0 )
				end
			}
		} )
		self._sequences.NewNotification = function ()
			Text:AnimateSequence( "NewNotification" )
		end
		
		Background:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -50, 0, 0, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		Text:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Text:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 0.8, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
				end,
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -65, _1080p * -13, _1080p * 13, 0 )
				end,
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 40, _1080p * -45, _1080p * -13, _1080p * 13, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			Background:AnimateSequence( "ButtonOverDisabled" )
			Text:AnimateSequence( "ButtonOverDisabled" )
		end
		
		Background:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -50, 0, 0, 100, LUI.EASING.inQuadratic )
				end
			}
		} )
		Text:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Text:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 0.5, 100, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
				end,
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 100, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 40, _1080p * -45, _1080p * -13, _1080p * 13, 0 )
				end,
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -65, _1080p * -13, _1080p * 13, 100, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			Background:AnimateSequence( "ButtonUpDisabled" )
			Text:AnimateSequence( "ButtonUpDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f45_arg0, f45_arg1 )
		local f45_local0 = f45_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f46_arg0, f46_arg1 )
		local f46_local0 = f46_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_disable", function ( f47_arg0, f47_arg1 )
		local f47_local0 = f47_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
	end )
	self:addEventHandler( "button_over_disable", function ( f48_arg0, f48_arg1 )
		local f48_local0 = f48_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
	end )
	return self
end

MenuBuilder.registerType( "ClanTagButton", ClanTagButton )
LockTable( _M )
