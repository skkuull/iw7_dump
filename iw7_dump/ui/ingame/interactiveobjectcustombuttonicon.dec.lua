local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function InteractiveObjectCustomButtonIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 40 * _1080p, 0, 40 * _1080p )
	self.id = "InteractiveObjectCustomButtonIcon"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TextBackground = nil
	
	TextBackground = LUI.UIImage.new()
	TextBackground.id = "TextBackground"
	TextBackground:SetRGBFromInt( 0, 0 )
	TextBackground:SetAlpha( 0.15, 0 )
	TextBackground:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 38, _1080p * 157, _1080p * -16, _1080p * 16 )
	self:addElement( TextBackground )
	self.TextBackground = TextBackground
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -34, _1080p * 30, _1080p * -32, _1080p * 32 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:setText( "", 0 )
	Text:SetFontSize( 32 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Text:SetAlignment( LUI.Alignment.Center )
	Text:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 59, _1080p * 157, _1080p * -16, _1080p * 16 )
	self:addElement( Text )
	self.Text = Text
	
	local Button = nil
	
	Button = LUI.UIImage.new()
	Button.id = "Button"
	Button:setImage( RegisterMaterial( "button_alt1" ), 0 )
	Button:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -16, _1080p * 16 )
	self:addElement( Button )
	self.Button = Button
	
	local RarityColor = nil
	
	RarityColor = LUI.UIImage.new()
	RarityColor.id = "RarityColor"
	RarityColor:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 51, _1080p * 59, _1080p * -18, _1080p * 18 )
	RarityColor:BindColorToModel( DataSources.inGame.HUD.hints.interactiveObject.button.rarityColor:GetModel( f1_local1 ) )
	self:addElement( RarityColor )
	self.RarityColor = RarityColor
	
	local TextFadeEffect = nil
	
	TextFadeEffect = LUI.UIText.new()
	TextFadeEffect.id = "TextFadeEffect"
	TextFadeEffect:SetAlpha( 0, 0 )
	TextFadeEffect:setText( "", 0 )
	TextFadeEffect:SetFontSize( 32 * _1080p )
	TextFadeEffect:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	TextFadeEffect:SetAlignment( LUI.Alignment.Center )
	TextFadeEffect:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 59, _1080p * 157, _1080p * -16, _1080p * 16 )
	self:addElement( TextFadeEffect )
	self.TextFadeEffect = TextFadeEffect
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TextBackground:RegisterAnimationSequence( "InRange", {
			{
				function ()
					return self.TextBackground:SetAlpha( 0.15, 150 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "InRange", {
			{
				function ()
					return self.Icon:SetScale( 0, 0 )
				end,
				function ()
					return self.Icon:SetScale( 0.3, 150, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Icon:SetScale( 0, 150 )
				end
			},
			{
				function ()
					return self.Icon:SetAlpha( 0, 300 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "InRange", {
			{
				function ()
					return self.Text:SetAlpha( 1, 150 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "InRange", {
			{
				function ()
					return self.Button:SetScale( 0, 0 )
				end,
				function ()
					return self.Button:SetScale( 0.5, 150, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Button:SetScale( 0, 150 )
				end
			},
			{
				function ()
					return self.Button:SetAlpha( 1, 300 )
				end
			}
		} )
		RarityColor:RegisterAnimationSequence( "InRange", {
			{
				function ()
					return self.RarityColor:SetAlpha( 1, 150 )
				end
			}
		} )
		self._sequences.InRange = function ()
			TextBackground:AnimateSequence( "InRange" )
			Icon:AnimateSequence( "InRange" )
			Text:AnimateSequence( "InRange" )
			Button:AnimateSequence( "InRange" )
			RarityColor:AnimateSequence( "InRange" )
		end
		
		TextBackground:RegisterAnimationSequence( "NotInRange", {
			{
				function ()
					return self.TextBackground:SetAlpha( 0.15, 150 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "NotInRange", {
			{
				function ()
					return self.Icon:SetScale( 0, 0 )
				end,
				function ()
					return self.Icon:SetScale( 0.3, 150 )
				end,
				function ()
					return self.Icon:SetScale( 0, 150 )
				end
			},
			{
				function ()
					return self.Icon:SetAlpha( 1, 300 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "NotInRange", {
			{
				function ()
					return self.Text:SetAlpha( 1, 150 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "NotInRange", {
			{
				function ()
					return self.Button:SetScale( 0, 0 )
				end,
				function ()
					return self.Button:SetScale( 0.5, 150 )
				end,
				function ()
					return self.Button:SetScale( 0, 150 )
				end
			},
			{
				function ()
					return self.Button:SetAlpha( 0, 300 )
				end
			}
		} )
		RarityColor:RegisterAnimationSequence( "NotInRange", {
			{
				function ()
					return self.RarityColor:SetAlpha( 1, 150 )
				end
			}
		} )
		self._sequences.NotInRange = function ()
			TextBackground:AnimateSequence( "NotInRange" )
			Icon:AnimateSequence( "NotInRange" )
			Text:AnimateSequence( "NotInRange" )
			Button:AnimateSequence( "NotInRange" )
			RarityColor:AnimateSequence( "NotInRange" )
		end
		
		TextBackground:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.TextBackground:SetAlpha( 0.15, 200 )
				end
			},
			{
				function ()
					return self.TextBackground:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 38, _1080p * 157, _1080p * -16, _1080p * 16, 200 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.Icon:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.Icon:SetAlpha( 1, 0 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.Text:SetScale( 0, 200 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 38, _1080p * 157, _1080p * -16, _1080p * 16, 200 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.Button:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.Button:SetScale( 0, 200 )
				end
			}
		} )
		RarityColor:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.RarityColor:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.RarityColor:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 51, _1080p * 59, _1080p * -18, _1080p * 18, 200 )
				end
			}
		} )
		TextFadeEffect:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.TextFadeEffect:SetAlpha( 0, 200 )
				end
			},
			{
				function ()
					return self.TextFadeEffect:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.FadeIn = function ()
			TextBackground:AnimateSequence( "FadeIn" )
			Icon:AnimateSequence( "FadeIn" )
			Text:AnimateSequence( "FadeIn" )
			Button:AnimateSequence( "FadeIn" )
			RarityColor:AnimateSequence( "FadeIn" )
			TextFadeEffect:AnimateSequence( "FadeIn" )
		end
		
		TextBackground:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.TextBackground:SetAlpha( 0.15, 150 )
				end,
				function ()
					return self.TextBackground:SetAlpha( 0, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.TextBackground:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 38, _1080p * 157, _1080p * -16, _1080p * 16, 0 )
				end,
				function ()
					return self.TextBackground:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 38, _1080p * 50, _1080p * -16, _1080p * 16, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.Icon:SetScale( 0, 0 )
				end,
				function ()
					return self.Icon:SetScale( 0.3, 250 )
				end
			},
			{
				function ()
					return self.Icon:SetAlpha( 0, 90 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 0, 150 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.Button:SetScale( 0, 0 )
				end,
				function ()
					return self.Button:SetScale( 0.3, 250 )
				end
			},
			{
				function ()
					return self.Button:SetAlpha( 0, 90 )
				end
			}
		} )
		RarityColor:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.RarityColor:SetAlpha( 1, 0 )
				end,
				function ()
					return self.RarityColor:SetAlpha( 0, 250 )
				end
			},
			{
				function ()
					return self.RarityColor:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 51, _1080p * 59, _1080p * -18, _1080p * 18, 0 )
				end,
				function ()
					return self.RarityColor:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 145, _1080p * 153, _1080p * -18, _1080p * 18, 250 )
				end
			}
		} )
		TextFadeEffect:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.TextFadeEffect:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.TextFadeEffect:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.TextFadeEffect:SetScale( 0, 0 )
				end,
				function ()
					return self.TextFadeEffect:SetScale( 1.5, 150 )
				end
			}
		} )
		self._sequences.FadeOut = function ()
			TextBackground:AnimateSequence( "FadeOut" )
			Icon:AnimateSequence( "FadeOut" )
			Text:AnimateSequence( "FadeOut" )
			Button:AnimateSequence( "FadeOut" )
			RarityColor:AnimateSequence( "FadeOut" )
			TextFadeEffect:AnimateSequence( "FadeOut" )
		end
		
		self._sequences.HintOff = function ()
			
		end
		
		TextBackground:RegisterAnimationSequence( "HintOn", {
			{
				function ()
					return self.TextBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "HintOn", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Icon:SetAlpha( 1, 300 )
				end
			},
			{
				function ()
					return self.Icon:SetScale( 0, 0 )
				end,
				function ()
					return self.Icon:SetScale( 0.2, 150 )
				end,
				function ()
					return self.Icon:SetScale( 0, 150 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "HintOn", {
			{
				function ()
					return self.Text:SetAlpha( 0, 0 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "HintOn", {
			{
				function ()
					return self.Button:SetAlpha( 0, 0 )
				end
			}
		} )
		RarityColor:RegisterAnimationSequence( "HintOn", {
			{
				function ()
					return self.RarityColor:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HintOn = function ()
			TextBackground:AnimateSequence( "HintOn" )
			Icon:AnimateSequence( "HintOn" )
			Text:AnimateSequence( "HintOn" )
			Button:AnimateSequence( "HintOn" )
			RarityColor:AnimateSequence( "HintOn" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "InteractiveObjectCustomButtonIcon", InteractiveObjectCustomButtonIcon )
LockTable( _M )
