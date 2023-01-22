local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = DataSources.inGame.HUD.hints.interactiveObject.button.targetEntity:GetModel( f1_arg1 )
	local f1_local1 = function ()
		return f1_arg0:GetEntityNum() == DataModel.GetModelValue( f1_local0 )
	end
	
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "obstructed", function ( f3_arg0 )
		if f1_local1() then
			if DataModel.GetModelValue( f3_arg0 ) then
				f1_arg0:SetAlpha( 0.3, 150 )
			else
				f1_arg0:SetAlpha( 1, 150 )
			end
		end
	end )
	local f1_local2 = function ()
		if f1_local1() then
			local f4_local0 = DataModel.GetModelValue
			local f4_local1 = f1_arg0:GetDataSource( f1_arg1 )
			f4_local0 = f4_local0( f4_local1.operable:GetModel( f1_arg1 ) )
			f4_local1 = nil
			local f4_local2 = false
			if not f4_local0 then
				f4_local1 = "Inoperable"
			else
				local f4_local3 = DataModel.GetModelValue
				local f4_local4 = f1_arg0:GetDataSource( f1_arg1 )
				if f4_local3( f4_local4.range:GetModel( f1_arg1 ) ) == HintRange.USE_RANGE then
					f4_local1 = "InRange"
					f4_local2 = Engine.IsGamepadEnabled() == 0
				else
					f4_local1 = "TooFar"
				end
			end
			if f1_arg0.currentStateAnim ~= f4_local1 then
				f1_arg0.currentStateAnim = f4_local1
				ACTIONS.AnimateSequence( f1_arg0, f4_local1 )
				if f4_local2 then
					ACTIONS.AnimateSequence( f1_arg0, "KeyboardOn" )
				else
					ACTIONS.AnimateSequence( f1_arg0, "KeyboardOff" )
				end
			end
		end
	end
	
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "range", f1_local2 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "operable", f1_local2 )
	local f1_local3 = DataSources.inGame.HUD.hints.interactiveObject.progress:GetModel( f1_arg1 )
	local f1_local4 = DataSources.inGame.HUD.hints.interactiveObject.progress.entity:GetModel( f1_arg1 )
	local f1_local5 = function ()
		if not f1_arg0.GetEntityNum then
			return 
		end
		local f5_local0 = DataModel.GetModelValue( f1_local3 )
		local f5_local1 = DataModel.GetModelValue( f1_local4 )
		local f5_local2 = f1_arg0:GetEntityNum()
		local f5_local3 = nil
		if f5_local0 < 1 then
			f1_arg0.hasBeenIncomplete = true
		end
		if f5_local2 == f5_local1 and f5_local0 >= 1 and f1_arg0.hasBeenIncomplete then
			f5_local3 = "Completed"
		elseif f5_local2 == f5_local1 and f5_local0 < 1 and f5_local0 > 0 and f1_arg0.hasBeenIncomplete then
			f5_local3 = "NotCompleted"
		end
		if f5_local3 and f1_arg0.currentCompletionAnim ~= f5_local3 then
			f1_arg0.currentCompletionAnim = f5_local3
			ACTIONS.AnimateSequence( f1_arg0, f5_local3 )
		end
	end
	
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "targetEntity", f1_local5 )
	f1_arg0:SubscribeToModel( f1_local4, f1_local5 )
	f1_arg0:SubscribeToModel( f1_local3, f1_local5 )
	assert( f1_arg0.ProgressBar )
	local f1_local6 = function ()
		if not f1_arg0.GetEntityNum then
			return 
		elseif DataModel.GetModelValue( f1_local4 ) == f1_arg0:GetEntityNum() then
			if not f1_arg0.ProgressBar.progressSubscription then
				f1_arg0.ProgressBar.progressSubscription = f1_arg0.ProgressBar:SubscribeToModel( f1_local3, function ()
					local f7_local0 = DataModel.GetModelValue( f1_local3 )
					if f1_arg0.hasBeenIncomplete then
						f1_arg0.ProgressBar:SetProgress( f7_local0 )
						f1_arg0.ProgressBar:SetAlpha( 1, 0 )
					end
				end )
			end
		elseif f1_arg0.ProgressBar.progressSubscription then
			f1_arg0.ProgressBar:SetProgress( 0 )
			f1_arg0.ProgressBar:UnsubscribeFromModel( f1_arg0.ProgressBar.progressSubscription )
			f1_arg0.ProgressBar.progressSubscription = nil
			f1_arg0.ProgressBar:SetAlpha( 0, 0 )
		end
	end
	
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "targetEntity", f1_local6 )
	f1_arg0:SubscribeToModel( f1_local4, f1_local6 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "dismiss", function ( f8_arg0 )
		if DataModel.GetModelValue( f8_arg0 ) then
			ACTIONS.AnimateSequence( f1_arg0, "Dismiss" )
		end
	end )
	f1_arg0.ProgressBar:SetAlpha( 0, 0 )
	if Engine.IsPC() then
		f1_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
			assert( element.ButtonBindingText )
			local f9_local0 = element:GetDataSource( f1_arg1 )
			if f9_local0 then
				if f9_local0.range then
					if Engine.IsGamepadEnabled() == 0 and DataModel.GetModelValue( f9_local0.range:GetModel( f1_arg1 ) ) == HintRange.USE_RANGE then
						ACTIONS.AnimateSequence( element, "KeyboardOn" )
					else
						ACTIONS.AnimateSequence( element, "KeyboardOff" )
					end
				end
				if f9_local0.keyBind then
					local f9_local1 = f9_local0.keyBind:GetValue( f1_arg1 )
					if f9_local1 ~= nil then
						element.ButtonBindingText:setText( LocalizeString( f9_local1 ), 0 )
					end
				end
			end
		end )
	end
end

function InteractiveObjectButton( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 40 * _1080p, 0, 40 * _1080p )
	self.id = "InteractiveObjectButton"
	self._animationSets = {}
	self._sequences = {}
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	local f10_local2 = self
	local Shadow = nil
	
	Shadow = LUI.UIImage.new()
	Shadow.id = "Shadow"
	Shadow:SetRGBFromInt( 0, 0 )
	Shadow:SetAlpha( 0.8, 0 )
	Shadow:SetScale( 0.4, 0 )
	Shadow:setImage( RegisterMaterial( "hud_interaction_prompt_shadow" ), 0 )
	Shadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -20, _1080p * 20 )
	self:addElement( Shadow )
	self.Shadow = Shadow
	
	local Circle = nil
	
	Circle = LUI.UIImage.new()
	Circle.id = "Circle"
	Circle:SetScale( 0.4, 0 )
	Circle:setImage( RegisterMaterial( "hud_interaction_prompt" ), 0 )
	Circle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -20, _1080p * 20 )
	self:addElement( Circle )
	self.Circle = Circle
	
	local CircleCenterIcon = nil
	
	CircleCenterIcon = LUI.UIImage.new()
	CircleCenterIcon.id = "CircleCenterIcon"
	CircleCenterIcon:SetScale( 0.4, 0 )
	CircleCenterIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -20, _1080p * 20 )
	CircleCenterIcon:SubscribeToModelThroughElement( self, "material", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.material:GetValue( f10_local1 )
		if f11_local0 ~= nil then
			CircleCenterIcon:setImage( RegisterMaterial( f11_local0 ), 0 )
		end
	end )
	self:addElement( CircleCenterIcon )
	self.CircleCenterIcon = CircleCenterIcon
	
	local ProgressBacker = nil
	
	ProgressBacker = LUI.UIImage.new()
	ProgressBacker.id = "ProgressBacker"
	ProgressBacker:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	ProgressBacker:SetAlpha( 0, 0 )
	ProgressBacker:setImage( RegisterMaterial( "dpad_circle_whole" ), 0 )
	ProgressBacker:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -12, _1080p * 12, _1080p * -12, _1080p * 12 )
	self:addElement( ProgressBacker )
	self.ProgressBacker = ProgressBacker
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:SetFontSize( 36 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Text:setTextStyle( CoD.TextStyle.Shadowed )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetOptOutRightToLeftAlignmentFlip( true )
	Text:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 34, _1080p * 584, _1080p * -18, _1080p * 18 )
	Text:SubscribeToModelThroughElement( self, "string", function ()
		local f12_local0 = self:GetDataSource()
		f12_local0 = f12_local0.string:GetValue( f10_local1 )
		if f12_local0 ~= nil then
			Text:setText( f12_local0, 0 )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	local ButtonBindingText = nil
	
	ButtonBindingText = LUI.UIText.new()
	ButtonBindingText.id = "ButtonBindingText"
	ButtonBindingText:SetAlpha( 0, 0 )
	ButtonBindingText:SetFontSize( 36 * _1080p )
	ButtonBindingText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ButtonBindingText:setTextStyle( CoD.TextStyle.Shadowed )
	ButtonBindingText:SetAlignment( LUI.Alignment.Left )
	ButtonBindingText:SetOptOutRightToLeftAlignmentFlip( true )
	ButtonBindingText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 34, _1080p * 584, _1080p * 3, _1080p * 39 )
	ButtonBindingText:SubscribeToModelThroughElement( self, "keyBind", function ()
		local f13_local0 = self:GetDataSource()
		f13_local0 = f13_local0.keyBind:GetValue( f10_local1 )
		if f13_local0 ~= nil then
			ButtonBindingText:setText( LocalizeString( f13_local0 ), 0 )
		end
	end )
	self:addElement( ButtonBindingText )
	self.ButtonBindingText = ButtonBindingText
	
	local InteractiveObjectButtonIcon0 = nil
	
	InteractiveObjectButtonIcon0 = MenuBuilder.BuildRegisteredType( "InteractiveObjectButtonIcon", {
		controllerIndex = f10_local1
	} )
	InteractiveObjectButtonIcon0.id = "InteractiveObjectButtonIcon0"
	InteractiveObjectButtonIcon0:SetAlpha( 0, 0 )
	InteractiveObjectButtonIcon0:SetDataSourceThroughElement( self, nil )
	InteractiveObjectButtonIcon0:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( InteractiveObjectButtonIcon0 )
	self.InteractiveObjectButtonIcon0 = InteractiveObjectButtonIcon0
	
	local GenericReticleCrosshairs0 = nil
	
	GenericReticleCrosshairs0 = MenuBuilder.BuildRegisteredType( "GenericReticleCrosshairs", {
		controllerIndex = f10_local1
	} )
	GenericReticleCrosshairs0.id = "GenericReticleCrosshairs0"
	GenericReticleCrosshairs0.rightLine:SetLeft( _1080p * -4, 0 )
	GenericReticleCrosshairs0.rightLine:SetTop( _1080p * -1, 0 )
	GenericReticleCrosshairs0.rightLine:SetBottom( _1080p * 1, 0 )
	GenericReticleCrosshairs0.leftLine:SetRight( _1080p * 4, 0 )
	GenericReticleCrosshairs0.leftLine:SetTop( _1080p * -1, 0 )
	GenericReticleCrosshairs0.leftLine:SetBottom( _1080p * 1, 0 )
	GenericReticleCrosshairs0.bottomLine:SetLeft( _1080p * -1, 0 )
	GenericReticleCrosshairs0.bottomLine:SetRight( _1080p * 1, 0 )
	GenericReticleCrosshairs0.bottomLine:SetTop( _1080p * -4, 0 )
	GenericReticleCrosshairs0.topLine:SetLeft( _1080p * -1, 0 )
	GenericReticleCrosshairs0.topLine:SetRight( _1080p * 1, 0 )
	GenericReticleCrosshairs0.topLine:SetBottom( _1080p * 4, 0 )
	GenericReticleCrosshairs0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -21, _1080p * 21, _1080p * -21, _1080p * 21 )
	self:addElement( GenericReticleCrosshairs0 )
	self.GenericReticleCrosshairs0 = GenericReticleCrosshairs0
	
	local Cross = nil
	
	Cross = LUI.UIImage.new()
	Cross.id = "Cross"
	Cross:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	Cross:SetAlpha( 0, 0 )
	Cross:setImage( RegisterMaterial( "hud_x_marker" ), 0 )
	Cross:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -35, _1080p * 35, _1080p * -35, _1080p * 35 )
	self:addElement( Cross )
	self.Cross = Cross
	
	local ProgressBar = nil
	
	ProgressBar = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 2,
		segmentMaterial = "dpad_circle_segment",
		maskMaterial = "dpad_circle_mask",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f10_local1
	} )
	ProgressBar.id = "ProgressBar"
	ProgressBar:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	ProgressBar:SetProgress( 0 )
	ProgressBar:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -12, _1080p * 12, _1080p * -12, _1080p * 12 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Shadow:RegisterAnimationSequence( "TooFar", {
			{
				function ()
					return self.Shadow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Shadow:SetAlpha( 0.8, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Shadow:SetScale( 1, 0 )
				end,
				function ()
					return self.Shadow:SetScale( 0.4, 200, LUI.EASING.outBack )
				end
			}
		} )
		Circle:RegisterAnimationSequence( "TooFar", {
			{
				function ()
					return self.Circle:SetScale( 1, 0 )
				end,
				function ()
					return self.Circle:SetScale( 0.4, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Circle:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Circle:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			}
		} )
		CircleCenterIcon:RegisterAnimationSequence( "TooFar", {
			{
				function ()
					return self.CircleCenterIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CircleCenterIcon:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.CircleCenterIcon:SetScale( 1, 0 )
				end,
				function ()
					return self.CircleCenterIcon:SetScale( 0.4, 200, LUI.EASING.outBack )
				end
			}
		} )
		Text:RegisterAnimationSequence( "TooFar", {
			{
				function ()
					return self.Text:SetAlpha( 0, 0 )
				end
			}
		} )
		ButtonBindingText:RegisterAnimationSequence( "TooFar", {
			{
				function ()
					return self.ButtonBindingText:SetAlpha( 0, 0 )
				end
			}
		} )
		InteractiveObjectButtonIcon0:RegisterAnimationSequence( "TooFar", {
			{
				function ()
					return self.InteractiveObjectButtonIcon0:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.InteractiveObjectButtonIcon0:SetScale( -0.15, 50 )
				end
			}
		} )
		GenericReticleCrosshairs0:RegisterAnimationSequence( "TooFar", {
			{
				function ()
					return self.GenericReticleCrosshairs0:SetAlpha( 0, 120 )
				end,
				function ()
					return self.GenericReticleCrosshairs0:SetAlpha( 1, 80 )
				end
			}
		} )
		Cross:RegisterAnimationSequence( "TooFar", {
			{
				function ()
					return self.Cross:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.TooFar = function ()
			Shadow:AnimateSequence( "TooFar" )
			Circle:AnimateSequence( "TooFar" )
			CircleCenterIcon:AnimateSequence( "TooFar" )
			Text:AnimateSequence( "TooFar" )
			ButtonBindingText:AnimateSequence( "TooFar" )
			InteractiveObjectButtonIcon0:AnimateSequence( "TooFar" )
			GenericReticleCrosshairs0:AnimateSequence( "TooFar" )
			Cross:AnimateSequence( "TooFar" )
		end
		
		Shadow:RegisterAnimationSequence( "InRange", {
			{
				function ()
					return self.Shadow:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.Shadow:SetAlpha( 0, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Shadow:SetScale( 0.4, 0 )
				end,
				function ()
					return self.Shadow:SetScale( 1, 200, LUI.EASING.outBack )
				end
			}
		} )
		Circle:RegisterAnimationSequence( "InRange", {
			{
				function ()
					return self.Circle:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Circle:SetAlpha( 0, 200 )
				end
			},
			{
				function ()
					return self.Circle:SetScale( 0.4, 0 )
				end,
				function ()
					return self.Circle:SetScale( 1, 200 )
				end
			}
		} )
		CircleCenterIcon:RegisterAnimationSequence( "InRange", {
			{
				function ()
					return self.CircleCenterIcon:SetScale( 0.4, 0 )
				end,
				function ()
					return self.CircleCenterIcon:SetScale( 1, 200 )
				end
			},
			{
				function ()
					return self.CircleCenterIcon:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CircleCenterIcon:SetAlpha( 0, 200 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "InRange", {
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end
			}
		} )
		InteractiveObjectButtonIcon0:RegisterAnimationSequence( "InRange", {
			{
				function ()
					return self.InteractiveObjectButtonIcon0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.InteractiveObjectButtonIcon0:SetAlpha( 0, 50 )
				end,
				function ()
					return self.InteractiveObjectButtonIcon0:SetAlpha( 1, 150, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.InteractiveObjectButtonIcon0:SetScale( -0.2, 0 )
				end,
				function ()
					return self.InteractiveObjectButtonIcon0:SetScale( -0.2, 50 )
				end,
				function ()
					return self.InteractiveObjectButtonIcon0:SetScale( 0.4, 150, LUI.EASING.outBack )
				end
			}
		} )
		GenericReticleCrosshairs0:RegisterAnimationSequence( "InRange", {
			{
				function ()
					return self.GenericReticleCrosshairs0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.GenericReticleCrosshairs0:SetAlpha( 0, 50 )
				end
			}
		} )
		Cross:RegisterAnimationSequence( "InRange", {
			{
				function ()
					return self.Cross:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.InRange = function ()
			Shadow:AnimateSequence( "InRange" )
			Circle:AnimateSequence( "InRange" )
			CircleCenterIcon:AnimateSequence( "InRange" )
			Text:AnimateSequence( "InRange" )
			InteractiveObjectButtonIcon0:AnimateSequence( "InRange" )
			GenericReticleCrosshairs0:AnimateSequence( "InRange" )
			Cross:AnimateSequence( "InRange" )
		end
		
		Shadow:RegisterAnimationSequence( "Dismiss", {
			{
				function ()
					return self.Shadow:SetScale( 0.4, 0 )
				end,
				function ()
					return self.Shadow:SetScale( 1, 190 )
				end
			},
			{
				function ()
					return self.Shadow:SetAlpha( 0, 50 )
				end
			}
		} )
		Circle:RegisterAnimationSequence( "Dismiss", {
			{
				function ()
					return self.Circle:SetScale( 0.4, 0 )
				end,
				function ()
					return self.Circle:SetScale( 1, 190, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Circle:SetAlpha( 0, 190, LUI.EASING.inBack )
				end
			}
		} )
		CircleCenterIcon:RegisterAnimationSequence( "Dismiss", {
			{
				function ()
					return self.CircleCenterIcon:SetScale( 0.4, 0 )
				end,
				function ()
					return self.CircleCenterIcon:SetScale( 1, 190 )
				end
			},
			{
				function ()
					return self.CircleCenterIcon:SetAlpha( 0, 190 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "Dismiss", {
			{
				function ()
					return self.Text:SetAlpha( 0, 190 )
				end
			}
		} )
		ButtonBindingText:RegisterAnimationSequence( "Dismiss", {
			{
				function ()
					return self.ButtonBindingText:SetAlpha( 0, 190 )
				end
			}
		} )
		InteractiveObjectButtonIcon0:RegisterAnimationSequence( "Dismiss", {
			{
				function ()
					return self.InteractiveObjectButtonIcon0:SetAlpha( 0, 190 )
				end
			}
		} )
		GenericReticleCrosshairs0:RegisterAnimationSequence( "Dismiss", {
			{
				function ()
					return self.GenericReticleCrosshairs0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.GenericReticleCrosshairs0:SetAlpha( 0, 50 )
				end
			}
		} )
		Cross:RegisterAnimationSequence( "Dismiss", {
			{
				function ()
					return self.Cross:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Dismiss = function ()
			Shadow:AnimateSequence( "Dismiss" )
			Circle:AnimateSequence( "Dismiss" )
			CircleCenterIcon:AnimateSequence( "Dismiss" )
			Text:AnimateSequence( "Dismiss" )
			ButtonBindingText:AnimateSequence( "Dismiss" )
			InteractiveObjectButtonIcon0:AnimateSequence( "Dismiss" )
			GenericReticleCrosshairs0:AnimateSequence( "Dismiss" )
			Cross:AnimateSequence( "Dismiss" )
		end
		
		Shadow:RegisterAnimationSequence( "Spin", {
			{
				function ()
					return self.Shadow:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Shadow:SetZRotation( -360, 30000 )
				end
			}
		} )
		Circle:RegisterAnimationSequence( "Spin", {
			{
				function ()
					return self.Circle:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Circle:SetZRotation( -360, 30000 )
				end
			}
		} )
		GenericReticleCrosshairs0:RegisterAnimationSequence( "Spin", {
			{
				function ()
					return self.GenericReticleCrosshairs0:SetZRotation( 0, 0 )
				end,
				function ()
					return self.GenericReticleCrosshairs0:SetZRotation( 720, 30000 )
				end
			}
		} )
		self._sequences.Spin = function ()
			Shadow:AnimateLoop( "Spin" )
			Circle:AnimateLoop( "Spin" )
			GenericReticleCrosshairs0:AnimateLoop( "Spin" )
		end
		
		Shadow:RegisterAnimationSequence( "Inoperable", {
			{
				function ()
					return self.Shadow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Shadow:SetAlpha( 0.4, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Shadow:SetScale( 1, 0 )
				end,
				function ()
					return self.Shadow:SetScale( 0.4, 200, LUI.EASING.outBack )
				end
			}
		} )
		Circle:RegisterAnimationSequence( "Inoperable", {
			{
				function ()
					return self.Circle:SetScale( 1, 0 )
				end,
				function ()
					return self.Circle:SetScale( 0.4, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Circle:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Circle:SetAlpha( 0.8, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Circle:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		CircleCenterIcon:RegisterAnimationSequence( "Inoperable", {
			{
				function ()
					return self.CircleCenterIcon:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			},
			{
				function ()
					return self.CircleCenterIcon:SetScale( 1, 0 )
				end,
				function ()
					return self.CircleCenterIcon:SetScale( 0.4, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.CircleCenterIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CircleCenterIcon:SetAlpha( 0.8, 200, LUI.EASING.outBack )
				end
			}
		} )
		GenericReticleCrosshairs0:RegisterAnimationSequence( "Inoperable", {
			{
				function ()
					return self.GenericReticleCrosshairs0:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			},
			{
				function ()
					return self.GenericReticleCrosshairs0:SetAlpha( 0, 190 )
				end,
				function ()
					return self.GenericReticleCrosshairs0:SetAlpha( 0.8, 10 )
				end
			}
		} )
		Cross:RegisterAnimationSequence( "Inoperable", {
			{
				function ()
					return self.Cross:SetAlpha( 0, 190 )
				end,
				function ()
					return self.Cross:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.Cross:SetScale( -0.5, 200 )
				end,
				function ()
					return self.Cross:SetScale( 0.2, 80, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Inoperable = function ()
			Shadow:AnimateSequence( "Inoperable" )
			Circle:AnimateSequence( "Inoperable" )
			CircleCenterIcon:AnimateSequence( "Inoperable" )
			GenericReticleCrosshairs0:AnimateSequence( "Inoperable" )
			Cross:AnimateSequence( "Inoperable" )
		end
		
		ProgressBacker:RegisterAnimationSequence( "Completed", {
			{
				function ()
					return self.ProgressBacker:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ProgressBacker:SetAlpha( 0, 30 )
				end,
				function ()
					return self.ProgressBacker:SetAlpha( 1, 30 )
				end,
				function ()
					return self.ProgressBacker:SetAlpha( 0, 30 )
				end,
				function ()
					return self.ProgressBacker:SetAlpha( 0, 30 )
				end,
				function ()
					return self.ProgressBacker:SetAlpha( 1, 30 )
				end,
				function ()
					return self.ProgressBacker:SetAlpha( 0, 30 )
				end,
				function ()
					return self.ProgressBacker:SetAlpha( 1, 20 )
				end,
				function ()
					return self.ProgressBacker:SetAlpha( 0, 300, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.ProgressBacker:SetScale( 0, 0 )
				end,
				function ()
					return self.ProgressBacker:SetScale( 0, 200 )
				end,
				function ()
					return self.ProgressBacker:SetScale( 0.4, 300, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.ProgressBacker:SetRGBFromTable( SWATCHES.HUD.active, 0 )
				end
			}
		} )
		ProgressBar:RegisterAnimationSequence( "Completed", {
			{
				function ()
					return self.ProgressBar:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Completed = function ()
			ProgressBacker:AnimateSequence( "Completed" )
			ProgressBar:AnimateSequence( "Completed" )
		end
		
		ProgressBacker:RegisterAnimationSequence( "NotCompleted", {
			{
				function ()
					return self.ProgressBacker:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.ProgressBacker:SetAlpha( 0.25, 0 )
				end
			},
			{
				function ()
					return self.ProgressBacker:SetScale( 0, 0 )
				end
			}
		} )
		ProgressBar:RegisterAnimationSequence( "NotCompleted", {
			{
				function ()
					return self.ProgressBar:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ProgressBar:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
				end
			},
			{
				function ()
					return self.ProgressBar:SetScale( 0, 0 )
				end
			}
		} )
		self._sequences.NotCompleted = function ()
			ProgressBacker:AnimateSequence( "NotCompleted" )
			ProgressBar:AnimateSequence( "NotCompleted" )
		end
		
		Text:RegisterAnimationSequence( "KeyboardOn", {
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 34, _1080p * 1500, _1080p * -38, _1080p * -2, 0 )
				end
			}
		} )
		ButtonBindingText:RegisterAnimationSequence( "KeyboardOn", {
			{
				function ()
					return self.ButtonBindingText:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ButtonBindingText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 34, _1080p * 1500, _1080p * 3, _1080p * 39, 0 )
				end
			}
		} )
		self._sequences.KeyboardOn = function ()
			Text:AnimateSequence( "KeyboardOn" )
			ButtonBindingText:AnimateSequence( "KeyboardOn" )
		end
		
		Text:RegisterAnimationSequence( "KeyboardOff", {
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 34, _1080p * 584, _1080p * -18, _1080p * 18, 0 )
				end
			}
		} )
		ButtonBindingText:RegisterAnimationSequence( "KeyboardOff", {
			{
				function ()
					return self.ButtonBindingText:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.ButtonBindingText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 34, _1080p * 584, _1080p * 3, _1080p * 39, 0 )
				end
			}
		} )
		self._sequences.KeyboardOff = function ()
			Text:AnimateSequence( "KeyboardOff" )
			ButtonBindingText:AnimateSequence( "KeyboardOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	InteractiveObjectButtonIcon0:SetDataSourceThroughElement( self, nil )
	self:SubscribeToModelThroughElement( self, "requiresMashing", function ()
		local f134_local0 = self:GetDataSource()
		if f134_local0.requiresMashing:GetValue( f10_local1 ) ~= nil then
			f134_local0 = self:GetDataSource()
			if f134_local0.requiresMashing:GetValue( f10_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "InteractiveObjectButtonIcon0",
					sequenceName = "Mash",
					elementPath = "InteractiveObjectButtonIcon0"
				} )
			end
		end
		f134_local0 = self:GetDataSource()
		if f134_local0.requiresMashing:GetValue( f10_local1 ) ~= nil then
			f134_local0 = self:GetDataSource()
			if f134_local0.requiresMashing:GetValue( f10_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "InteractiveObjectButtonIcon0",
					sequenceName = "DontMash",
					elementPath = "InteractiveObjectButtonIcon0"
				} )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "requiresHolding", function ()
		local f135_local0 = self:GetDataSource()
		if f135_local0.requiresHolding:GetValue( f10_local1 ) ~= nil then
			f135_local0 = self:GetDataSource()
			if f135_local0.requiresHolding:GetValue( f10_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "InteractiveObjectButtonIcon0",
					sequenceName = "Hold",
					elementPath = "InteractiveObjectButtonIcon0"
				} )
			end
		end
		f135_local0 = self:GetDataSource()
		if f135_local0.requiresHolding:GetValue( f10_local1 ) ~= nil then
			f135_local0 = self:GetDataSource()
			if f135_local0.requiresHolding:GetValue( f10_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "InteractiveObjectButtonIcon0",
					sequenceName = "DontHold",
					elementPath = "InteractiveObjectButtonIcon0"
				} )
			end
		end
	end )
	PostLoadFunc( self, f10_local1, controller )
	ACTIONS.AnimateSequence( self, "Spin" )
	if CONDITIONS.IsGamepadEnabled( self ) then
		ACTIONS.AnimateSequence( self, "KeyboardOff" )
	end
	if not CONDITIONS.IsGamepadEnabled( self ) then
		ACTIONS.AnimateSequence( self, "KeyboardOn" )
	end
	return self
end

MenuBuilder.registerType( "InteractiveObjectButton", InteractiveObjectButton )
LockTable( _M )
