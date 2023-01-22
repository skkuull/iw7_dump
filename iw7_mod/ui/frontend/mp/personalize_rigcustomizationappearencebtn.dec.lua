local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.PositionQualityIcon = function ()
		assert( f1_arg0.QualityIcon )
		assert( f1_arg0.Name )
		local f2_local0, f2_local1, f2_local2, f2_local3 = GetTextDimensions( f1_arg0.Name:getText(), f1_arg0.Name:GetCurrentFont(), 18 * _1080p )
		local f2_local4 = f2_local2 + 14
		f1_arg0.QualityIcon:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -28 - f2_local4, -f2_local4, _1080p * -30, _1080p * -2 )
	end
	
end

function Personalize_RigCustomizationAppearenceBtn( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 616 * _1080p, 0, 158 * _1080p )
	self.id = "Personalize_RigCustomizationAppearenceBtn"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local BlurTitleBar = nil
	
	BlurTitleBar = LUI.UIBlur.new()
	BlurTitleBar.id = "BlurTitleBar"
	BlurTitleBar:SetRGBFromInt( 4210752, 0 )
	BlurTitleBar:SetBlurStrength( 2.5, 0 )
	BlurTitleBar:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( BlurTitleBar )
	self.BlurTitleBar = BlurTitleBar
	
	local GenericItemBackground = nil
	
	GenericItemBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f3_local1
	} )
	GenericItemBackground.id = "GenericItemBackground"
	GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local BGImage = nil
	
	BGImage = LUI.UIImage.new()
	BGImage.id = "BGImage"
	BGImage:SetAlpha( 0.7, 0 )
	BGImage:setImage( RegisterMaterial( "icon_weapon_accessory" ), 0 )
	BGImage:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -528, _1080p * -1, _1080p * 25.25, _1080p * 157 )
	self:addElement( BGImage )
	self.BGImage = BGImage
	
	local Gradient = nil
	
	Gradient = LUI.UIImage.new()
	Gradient.id = "Gradient"
	Gradient:SetRGBFromInt( 0, 0 )
	Gradient:SetAlpha( 0.6, 0 )
	Gradient:SetZRotation( 180, 0 )
	Gradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	Gradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -36, 0 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetAlpha( 0.6, 0 )
	Icon:setImage( RegisterMaterial( "icon_weapon_accessory_small" ), 0 )
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 33, _1080p * 129, _1080p * 44, _1080p * 140 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Name = nil
	
	Name = LUI.UIText.new()
	Name.id = "Name"
	Name:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Name:SetFontSize( 18 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Name:SetAlignment( LUI.Alignment.Right )
	Name:SetOptOutRightToLeftAlignmentFlip( true )
	Name:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -357, _1080p * -11, _1080p * -23, _1080p * -6 )
	self:addElement( Name )
	self.Name = Name
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f3_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local TitleBackground = nil
	
	TitleBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f3_local1
	} )
	TitleBackground.id = "TitleBackground"
	TitleBackground.DropShadow:SetAlpha( 0, 0 )
	TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local TitleText = nil
	
	TitleText = LUI.UIText.new()
	TitleText.id = "TitleText"
	TitleText:setText( ToUpperCase( "HEAD" ), 0 )
	TitleText:SetFontSize( 19 * _1080p )
	TitleText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TitleText:SetAlignment( LUI.Alignment.Left )
	TitleText:SetOptOutRightToLeftAlignmentFlip( true )
	TitleText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 640, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( TitleText )
	self.TitleText = TitleText
	
	local LineCopy1 = nil
	
	LineCopy1 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f3_local1
	} )
	LineCopy1.id = "LineCopy1"
	LineCopy1:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -1, 0 )
	self:addElement( LineCopy1 )
	self.LineCopy1 = LineCopy1
	
	local LineCopy2 = nil
	
	LineCopy2 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f3_local1
	} )
	LineCopy2.id = "LineCopy2"
	LineCopy2:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -134, _1080p * -133 )
	self:addElement( LineCopy2 )
	self.LineCopy2 = LineCopy2
	
	local LockIcon = nil
	
	LockIcon = LUI.UIImage.new()
	LockIcon.id = "LockIcon"
	LockIcon:SetAlpha( 0, 0 )
	LockIcon:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	LockIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 49, _1080p * 113, _1080p * 60, _1080p * 124 )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f3_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon:SetAlpha( 0, 0 )
	QualityIcon:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -28, 0, _1080p * -28, 0 )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BGImage:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.BGImage:SetAlpha( 0.7, 250 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Icon:SetAlpha( 1, 250 )
				end
			}
		} )
		TitleText:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.TitleText:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.LockIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			BGImage:AnimateSequence( "ButtonOver" )
			Icon:AnimateSequence( "ButtonOver" )
			TitleText:AnimateSequence( "ButtonOver" )
			LockIcon:AnimateSequence( "ButtonOver" )
		end
		
		BGImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.BGImage:SetAlpha( 0.7, 250 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Icon:SetAlpha( 0.8, 250 )
				end
			}
		} )
		TitleText:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.TitleText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.LockIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			BGImage:AnimateSequence( "ButtonUp" )
			Icon:AnimateSequence( "ButtonUp" )
			TitleText:AnimateSequence( "ButtonUp" )
			LockIcon:AnimateSequence( "ButtonUp" )
		end
		
		Icon:RegisterAnimationSequence( "ButtonDisabled", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		TitleText:RegisterAnimationSequence( "ButtonDisabled", {
			{
				function ()
					return self.TitleText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "ButtonDisabled", {
			{
				function ()
					return self.LockIcon:SetAlpha( 0.6, 250 )
				end
			}
		} )
		self._sequences.ButtonDisabled = function ()
			Icon:AnimateSequence( "ButtonDisabled" )
			TitleText:AnimateSequence( "ButtonDisabled" )
			LockIcon:AnimateSequence( "ButtonDisabled" )
		end
		
		Icon:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		TitleText:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.TitleText:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.LockIcon:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			Icon:AnimateSequence( "ButtonOverDisabled" )
			TitleText:AnimateSequence( "ButtonOverDisabled" )
			LockIcon:AnimateSequence( "ButtonOverDisabled" )
		end
		
	end
	
	self._animationSets.CP = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BGImage:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.BGImage:SetAlpha( 0.7, 250 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Icon:SetAlpha( 1, 250 )
				end
			}
		} )
		TitleText:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.TitleText:SetRGBFromInt( 0, 0 )
				end,
				function ()
					return self.TitleText:SetRGBFromInt( 16777215, 10 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			BGImage:AnimateSequence( "ButtonOver" )
			Icon:AnimateSequence( "ButtonOver" )
			TitleText:AnimateSequence( "ButtonOver" )
		end
		
		BGImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.BGImage:SetAlpha( 0.3, 250 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Icon:SetAlpha( 0.8, 250 )
				end
			}
		} )
		TitleText:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.TitleText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			BGImage:AnimateSequence( "ButtonUp" )
			Icon:AnimateSequence( "ButtonUp" )
			TitleText:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f35_arg0, f35_arg1 )
		local f35_local0 = f35_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f36_arg0, f36_arg1 )
		local f36_local0 = f36_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_disable", function ( f37_arg0, f37_arg1 )
		local f37_local0 = f37_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonDisabled" )
	end )
	self:addEventHandler( "button_over_disable", function ( f38_arg0, f38_arg1 )
		local f38_local0 = f38_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
	end )
	f0_local0( self, f3_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "CP" )
	end
	return self
end

MenuBuilder.registerType( "Personalize_RigCustomizationAppearenceBtn", Personalize_RigCustomizationAppearenceBtn )
LockTable( _M )
