local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Text:SetShadowUOffset( -0 )
	f1_arg0.Text:SetShadowVOffset( -0 )
	f1_arg0.Text:SetBlendMode( BLEND_MODE.addWithAlpha )
end

function CalculatingDupeSalvage( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 64 * _1080p )
	self.id = "CalculatingDupeSalvage"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	Background:setImage( RegisterMaterial( "widg_gradient_center_out" ), 0 )
	Background:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -500, _1080p * 500, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Spinner = nil
	
	Spinner = LUI.UIImage.new()
	Spinner.id = "Spinner"
	Spinner:setImage( RegisterMaterial( "loot_item_card_spinning_widg" ), 0 )
	Spinner:SetBlendMode( BLEND_MODE.addWithAlpha )
	Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -6, _1080p * 70, _1080p * -6, _1080p * 70 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:setImage( RegisterMaterial( "currency_parts_icon_large" ), 0 )
	Icon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 64, _1080p * -32, _1080p * 32 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Text = nil
	
	Text = LUI.UIStyledText.new()
	Text.id = "Text"
	Text:SetRGBFromTable( SWATCHES.text.primaryText, 0 )
	Text:setText( ToUpperCase( Engine.Localize( "MP_FRONTEND_ONLY_CALCULATING_SALVAGE" ) ), 0 )
	Text:SetFontSize( 38 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetOptOutRightToLeftAlignmentFlip( true )
	Text:SetShadowMinDistance( -0.01, 0 )
	Text:SetShadowMaxDistance( 0.01, 0 )
	Text:SetShadowRGBFromInt( 0, 0 )
	Text:SetDecodeLetterLength( 25 )
	Text:SetDecodeMaxRandChars( 6 )
	Text:SetDecodeUpdatesPerLetter( 4 )
	Text:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 80, _1080p * 1000, _1080p * -19, _1080p * 19 )
	self:addElement( Text )
	self.Text = Text
	
	self._animationSets.DefaultAnimationSet = function ()
		Background:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Spinner:SetAlpha( 0, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Text:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Background:AnimateSequence( "DefaultSequence" )
			Spinner:AnimateSequence( "DefaultSequence" )
			Icon:AnimateSequence( "DefaultSequence" )
			Text:AnimateSequence( "DefaultSequence" )
		end
		
		Background:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 100 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Spinner:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Spinner:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Spinner:SetScale( 1, 0 )
				end,
				function ()
					return self.Spinner:SetScale( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Icon:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Icon:SetScale( 1, 0 )
				end,
				function ()
					return self.Icon:SetScale( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		Text:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Text:SetAlpha( 0, 100 )
				end,
				function ()
					return self.Text:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Show = function ()
			Background:AnimateSequence( "Show" )
			Spinner:AnimateSequence( "Show" )
			Icon:AnimateSequence( "Show" )
			Text:AnimateSequence( "Show" )
		end
		
		Background:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Background:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Spinner:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Spinner:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Icon:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Icon:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		Text:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Hide = function ()
			Background:AnimateSequence( "Hide" )
			Spinner:AnimateSequence( "Hide" )
			Icon:AnimateSequence( "Hide" )
			Text:AnimateSequence( "Hide" )
		end
		
		Spinner:RegisterAnimationSequence( "Spin", {
			{
				function ()
					return self.Spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Spinner:SetZRotation( -359, 1500 )
				end
			}
		} )
		self._sequences.Spin = function ()
			Spinner:AnimateLoop( "Spin" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "menu_create", function ( f34_arg0, f34_arg1 )
		local f34_local0 = f34_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "Spin" )
	end )
	f0_local0( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "CalculatingDupeSalvage", CalculatingDupeSalvage )
LockTable( _M )
