local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PersonalizeRig( f1_arg0, f1_arg1 )
	if CONDITIONS.IsPublicMatch( f1_arg0 ) then
		ACTIONS.OpenPublicRigCustomization( f1_arg0, f1_arg1 )
	end
	if not CONDITIONS.IsPublicMatch( f1_arg0 ) then
		ACTIONS.OpenPrivateRigCustomization( f1_arg0, f1_arg1 )
	end
end

function PostLoadFunc( f2_arg0, f2_arg1 )
	if CONDITIONS.UseCACBreadCrumbs() then
		assert( f2_arg0.NewItemNotification )
		if Rewards.IsTypeNew( f2_arg1, "rig" ) then
			f2_arg0.NewItemNotification:SetAlpha( 1, 0 )
		end
	end
	if not Onboarding:IsFlowInProgress( Onboarding.RigTutorial ) then
		local bindButton = LUI.UIBindButton.new()
		bindButton.id = "selfBindButton"
		f2_arg0:addElement( bindButton )
		f2_arg0.bindButton = bindButton
		
		f2_arg0.bindButton:addEventHandler( "button_alt2", function ( f3_arg0, f3_arg1 )
			local f3_local0 = f3_arg0:getParent()
			if #f3_local0:getAllFocusedChildren() <= 0 then
				f3_local0 = f3_arg0:getParent()
				if f3_local0:isInFocus() then
				
				else
					return false
				end
			end
			PersonalizeRig( f2_arg0, f3_arg1.controller )
			return true
		end )
	else
		f2_arg0.PersonalizeDarkener:SetAlpha( 0 )
		f2_arg0.EditText:SetAlpha( 0 )
		if CONDITIONS.IsCoreFrontendPC() then
			f2_arg0.RigPersonalizeButton:SetAlpha( 0 )
			f2_arg0.RigPersonalizeButton.tutorialActive = true
		end
		local bindButton = {
			{
				function ()
					
				end
			}
		}
		for f2_local4, f2_local5 in ipairs( {
			"ButtonOver",
			"ButtonUp"
		} ) do
			f2_arg0.PersonalizeDarkener:RegisterAnimationSequence( f2_local5, emptyAnimation )
			f2_arg0.EditText:RegisterAnimationSequence( f2_local5, emptyAnimation )
			f2_arg0.Button:RegisterAnimationSequence( f2_local5, emptyAnimation )
		end
	end
	f2_arg0.RigImage:SetMask( f2_arg0.Mask )
	if CONDITIONS.IsCoreFrontendPC() then
		f2_arg0.Button:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -54, _1080p * 51, _1080p * 149, _1080p * -5 )
		f2_arg0.EditText:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -165, _1080p * -59, _1080p * 150, _1080p * -6 )
		f2_arg0.RigPersonalizeButton:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
			PersonalizeRig( f2_arg0, f2_arg1 )
		end )
	end
end

function RigEditButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 426 * _1080p, 0, 174 * _1080p )
	self.id = "RigEditButton"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local GenericItemBackground = nil
	
	GenericItemBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f6_local1
	} )
	GenericItemBackground.id = "GenericItemBackground"
	GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local PersonalizeDarkener = nil
	
	PersonalizeDarkener = LUI.UIImage.new()
	PersonalizeDarkener.id = "PersonalizeDarkener"
	PersonalizeDarkener:SetRGBFromInt( 0, 0 )
	PersonalizeDarkener:SetAlpha( 0, 0 )
	PersonalizeDarkener:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 144, 0 )
	self:addElement( PersonalizeDarkener )
	self.PersonalizeDarkener = PersonalizeDarkener
	
	local RigImage = nil
	
	RigImage = LUI.UIImage.new()
	RigImage.id = "RigImage"
	RigImage:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 12, _1080p * -126, _1080p * -21, _1080p * 93 )
	RigImage:SubscribeToModelThroughElement( self, "rigPortrait", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.rigPortrait:GetValue( f6_local1 )
		if f7_local0 ~= nil then
			RigImage:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	self:addElement( RigImage )
	self.RigImage = RigImage
	
	local Mask = nil
	
	Mask = LUI.UIImage.new()
	Mask.id = "Mask"
	Mask:setImage( RegisterMaterial( "wdg_large_mask" ), 0 )
	Mask:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( Mask )
	self.Mask = Mask
	
	local Button = nil
	
	Button = LUI.UIText.new()
	Button.id = "Button"
	Button:SetRGBFromInt( 14277081, 0 )
	Button:SetAlpha( 0, 0 )
	Button:setText( Engine.Localize( "LUA_MENU_PAD_ALT2_BUTTON" ), 0 )
	Button:SetFontSize( 24 * _1080p )
	Button:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Button:SetAlignment( LUI.Alignment.Left )
	Button:SetOptOutRightToLeftAlignmentFlip( true )
	Button:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -32, _1080p * 73, _1080p * 147, _1080p * -3 )
	self:addElement( Button )
	self.Button = Button
	
	local EditText = nil
	
	EditText = LUI.UIText.new()
	EditText.id = "EditText"
	EditText:SetRGBFromInt( 14277081, 0 )
	EditText:SetAlpha( 0, 0 )
	EditText:setText( Engine.Localize( "LUA_MENU_MP_PERSONALIZE" ), 0 )
	EditText:SetFontSize( 22 * _1080p )
	EditText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	EditText:SetAlignment( LUI.Alignment.Right )
	EditText:SetOptOutRightToLeftAlignmentFlip( true )
	EditText:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -165, _1080p * -37, _1080p * 148, _1080p * -4 )
	self:addElement( EditText )
	self.EditText = EditText
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f6_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local f6_local10 = nil
	if Engine.InFrontend() then
		f6_local10 = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
			controllerIndex = f6_local1
		} )
		f6_local10.id = "TitleBackground"
		f6_local10.DropShadow:SetAlpha( 0, 0 )
		f6_local10:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
		self:addElement( f6_local10 )
		self.TitleBackground = f6_local10
	end
	local FrameLabel = nil
	
	FrameLabel = LUI.UIText.new()
	FrameLabel.id = "FrameLabel"
	FrameLabel:SetRGBFromInt( 14277081, 0 )
	FrameLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_SELECT_RIG" ) ), 0 )
	FrameLabel:SetFontSize( 19 * _1080p )
	FrameLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FrameLabel:SetAlignment( LUI.Alignment.Left )
	FrameLabel:SetOptOutRightToLeftAlignmentFlip( true )
	FrameLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( FrameLabel )
	self.FrameLabel = FrameLabel
	
	local f6_local12 = nil
	if CONDITIONS.UseCACBreadCrumbs( self ) then
		f6_local12 = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
			controllerIndex = f6_local1
		} )
		f6_local12.id = "NewItemNotification"
		f6_local12:SetAlpha( 0, 0 )
		f6_local12:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -20, _1080p * 44 )
		self:addElement( f6_local12 )
		self.NewItemNotification = f6_local12
	end
	local f6_local13 = nil
	if CONDITIONS.IsCoreFrontendPC( self ) then
		f6_local13 = MenuBuilder.BuildRegisteredType( "RigPersonalizeButton", {
			controllerIndex = f6_local1
		} )
		f6_local13.id = "RigPersonalizeButton"
		if CONDITIONS.IsCoreFrontendPC( self ) then
			f6_local13:SetDataSourceThroughElement( self, nil )
		end
		f6_local13:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 274, _1080p * -3, _1080p * 146, _1080p * -2 )
		self:addElement( f6_local13 )
		self.RigPersonalizeButton = f6_local13
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		PersonalizeDarkener:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.PersonalizeDarkener:SetAlpha( 1, 0 )
				end
			}
		} )
		RigImage:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.RigImage:SetScale( 0.05, 100 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Button:SetAlpha( 1, 0 )
				end
			}
		} )
		EditText:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.EditText:SetAlpha( 1, 0 )
				end
			}
		} )
		FrameLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			PersonalizeDarkener:AnimateSequence( "ButtonOver" )
			RigImage:AnimateSequence( "ButtonOver" )
			Button:AnimateSequence( "ButtonOver" )
			EditText:AnimateSequence( "ButtonOver" )
			FrameLabel:AnimateSequence( "ButtonOver" )
		end
		
		PersonalizeDarkener:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.PersonalizeDarkener:SetAlpha( 0, 0 )
				end
			}
		} )
		RigImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.RigImage:SetScale( 0, 200 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Button:SetAlpha( 0, 0 )
				end
			}
		} )
		EditText:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.EditText:SetAlpha( 0, 0 )
				end
			}
		} )
		FrameLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 14277081, 0 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			PersonalizeDarkener:AnimateSequence( "ButtonUp" )
			RigImage:AnimateSequence( "ButtonUp" )
			Button:AnimateSequence( "ButtonUp" )
			EditText:AnimateSequence( "ButtonUp" )
			FrameLabel:AnimateSequence( "ButtonUp" )
		end
		
		self._sequences.Pulse = function ()
			
		end
		
		self._sequences.PulseStop = function ()
			
		end
		
		RigImage:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.RigImage:SetScale( 0.05, 200 )
				end
			}
		} )
		FrameLabel:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.FrameLabel:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			RigImage:AnimateSequence( "ButtonOverDisabled" )
			FrameLabel:AnimateSequence( "ButtonOverDisabled" )
		end
		
		RigImage:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.RigImage:SetScale( 0, 200 )
				end
			}
		} )
		FrameLabel:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.FrameLabel:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
				end
			},
			{
				function ()
					return self.FrameLabel:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			RigImage:AnimateSequence( "ButtonUpDisabled" )
			FrameLabel:AnimateSequence( "ButtonUpDisabled" )
		end
		
		self._sequences.Activate = function ()
			
		end
		
		self._sequences.Locked = function ()
			
		end
		
		self._sequences.Unlocked = function ()
			
		end
		
		self._sequences.StopActivateAnim = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsCoreFrontendPC( self ) then
		f6_local13:SetDataSourceThroughElement( self, nil )
	end
	self:addEventHandler( "button_over", function ( f38_arg0, f38_arg1 )
		local f38_local0 = f38_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "TitleBackground",
			sequenceName = "Pick10Over",
			elementPath = "TitleBackground"
		} )
	end )
	self:addEventHandler( "button_up", function ( f39_arg0, f39_arg1 )
		local f39_local0 = f39_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "TitleBackground",
			sequenceName = "Pick10Up",
			elementPath = "TitleBackground"
		} )
	end )
	self:addEventHandler( "button_over_disable", function ( f40_arg0, f40_arg1 )
		local f40_local0 = f40_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "TitleBackground",
			sequenceName = "Pick10Over",
			elementPath = "TitleBackground"
		} )
	end )
	self:addEventHandler( "button_disable", function ( f41_arg0, f41_arg1 )
		local f41_local0 = f41_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "TitleBackground",
			sequenceName = "Pick10Up",
			elementPath = "TitleBackground"
		} )
	end )
	PostLoadFunc( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "RigEditButton", RigEditButton )
LockTable( _M )
