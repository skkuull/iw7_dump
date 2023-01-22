local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RigCustomizationAppearenceButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 640 * _1080p, 0, 130 * _1080p )
	self.id = "RigCustomizationAppearenceButton"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if Engine.InFrontend() then
		f1_local3 = LUI.UIBlur.new()
		f1_local3.id = "Blur"
		f1_local3:SetBlurStrength( 2.75, 0 )
		self:addElement( f1_local3 )
		self.Blur = f1_local3
	end
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
		controllerIndex = f1_local1
	} )
	GenericItemBackground.id = "GenericItemBackground"
	GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAlpha( 0.7, 0 )
	Image:setImage( RegisterMaterial( "icon_rig_taunt" ), 0 )
	Image:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 71, _1080p * 495, _1080p * -106, 0 )
	self:addElement( Image )
	self.Image = Image
	
	local Name = nil
	
	Name = LUI.UIText.new()
	Name.id = "Name"
	Name:setText( "", 0 )
	Name:SetFontSize( 18 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Name:SetAlignment( LUI.Alignment.Right )
	Name:SetOptOutRightToLeftAlignmentFlip( true )
	Name:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -357, _1080p * -11, _1080p * -23, _1080p * -6 )
	self:addElement( Name )
	self.Name = Name
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f1_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local TitleBackground = nil
	
	TitleBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f1_local1
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
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetAlpha( 0.8, 0 )
	Icon:setImage( RegisterMaterial( "icon_rig_taunt_small" ), 0 )
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 31.03, _1080p * 125.09, _1080p * 29.94, _1080p * 124 )
	self:addElement( Icon )
	self.Icon = Icon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Image:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Image:SetAlpha( 0.7, 250 )
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
		Icon:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Icon:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Image:AnimateSequence( "ButtonOver" )
			TitleText:AnimateSequence( "ButtonOver" )
			Icon:AnimateSequence( "ButtonOver" )
		end
		
		Image:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Image:SetAlpha( 0.7, 0 )
				end,
				function ()
					return self.Image:SetAlpha( 0.7, 250 )
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
		Icon:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Icon:SetAlpha( 0.8, 250 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Image:AnimateSequence( "ButtonUp" )
			TitleText:AnimateSequence( "ButtonUp" )
			Icon:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f13_arg0, f13_arg1 )
		local f13_local0 = f13_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f14_arg0, f14_arg1 )
		local f14_local0 = f14_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	return self
end

MenuBuilder.registerType( "RigCustomizationAppearenceButton", RigCustomizationAppearenceButton )
LockTable( _M )
