local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ContextualButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 50 * _1080p )
	self.id = "ContextualButton"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:SubscribeToModelThroughElement( self, "buttonDescription", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.buttonDescription:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			self.buttonDescription = f2_local0
		end
	end )
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "GenericButtonBackground", {
		controllerIndex = f1_local1
	} )
	Background.id = "Background"
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	Text:SetFontSize( 32 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -16, _1080p * 16 )
	Text:SubscribeToModelThroughElement( self, "buttonLabel", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.buttonLabel:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Text:setText( f3_local0, 0 )
		end
	end )
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
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -16, _1080p * 16, 0 )
				end,
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 40, _1080p * -20, _1080p * -16, _1080p * 16, 100, LUI.EASING.outQuadratic )
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
				end
			},
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 40, _1080p * -20, _1080p * -16, _1080p * 16, 0 )
				end,
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -16, _1080p * 16, 100, LUI.EASING.inQuadratic )
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
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 0.15, 0 )
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
			},
			{
				function ()
					return self.Text:SetAlpha( 0.15, 0 )
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
					return self.Text:SetAlpha( 0.3, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -16, _1080p * 16, 0 )
				end,
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 40, _1080p * -20, _1080p * -16, _1080p * 16, 100, LUI.EASING.outQuadratic )
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
					return self.Text:SetAlpha( 0.15, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 40, _1080p * -20, _1080p * -16, _1080p * 16, 0 )
				end,
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -16, _1080p * 16, 100, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			Background:AnimateSequence( "ButtonUpDisabled" )
			Text:AnimateSequence( "ButtonUpDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f36_arg0, f36_arg1 )
		local f36_local0 = f36_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f37_arg0, f37_arg1 )
		local f37_local0 = f37_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_action", function ( f38_arg0, f38_arg1 )
		local f38_local0 = f38_arg1.controller or f1_local1
		local f38_local1 = ACTIONS.RunFunctionFromDataSource
		local f38_local2 = self
		local f38_local3 = self:GetDataSource()
		f38_local1( f38_local2, f38_local3.buttonOnClickFunction )
	end )
	self:addEventHandler( "button_disable", function ( f39_arg0, f39_arg1 )
		local f39_local0 = f39_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
	end )
	self:addEventHandler( "button_over_disable", function ( f40_arg0, f40_arg1 )
		local f40_local0 = f40_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
	end )
	return self
end

MenuBuilder.registerType( "ContextualButton", ContextualButton )
LockTable( _M )
