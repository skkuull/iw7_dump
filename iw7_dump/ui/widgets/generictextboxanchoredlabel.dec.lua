local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericTextBoxAnchoredLabel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 50 * _1080p )
	self.id = "GenericTextBoxAnchoredLabel"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Box = nil
	
	Box = MenuBuilder.BuildRegisteredType( "GenericBoxFillAndStroke", {
		controllerIndex = f1_local1
	} )
	Box.id = "Box"
	Box.Fill:SetAlpha( 0.5, 0 )
	Box:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Box )
	self.Box = Box
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Text:SetFontSize( 20 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Text:SetAlignment( LUI.Alignment.Center )
	Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -10, _1080p * 10 )
	self:addElement( Text )
	self.Text = Text
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Text:RegisterAnimationSequence( "Blink_Medium", {
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 1, 790 )
				end,
				function ()
					return self.Text:SetAlpha( 0, 10 )
				end,
				function ()
					return self.Text:SetAlpha( 0, 390 )
				end,
				function ()
					return self.Text:SetAlpha( 1, 10 )
				end
			}
		} )
		self._sequences.Blink_Medium = function ()
			Text:AnimateLoop( "Blink_Medium" )
		end
		
		Text:RegisterAnimationSequence( "Pulse_Medium", {
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 0, 700 )
				end,
				function ()
					return self.Text:SetAlpha( 0, 300 )
				end,
				function ()
					return self.Text:SetAlpha( 1, 400 )
				end
			}
		} )
		self._sequences.Pulse_Medium = function ()
			Text:AnimateLoop( "Pulse_Medium" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "GenericTextBoxAnchoredLabel", GenericTextBoxAnchoredLabel )
LockTable( _M )
