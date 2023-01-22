local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ArmoryButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 606 * _1080p, 0, 173 * _1080p )
	self.id = "ArmoryButton"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
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
	
	local BGImage = nil
	
	BGImage = LUI.UIImage.new()
	BGImage.id = "BGImage"
	BGImage:SetAlpha( 0.7, 0 )
	BGImage:setImage( RegisterMaterial( "icon_inventory_main" ), 0 )
	BGImage:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( BGImage )
	self.BGImage = BGImage
	
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
	TitleText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 590, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( TitleText )
	self.TitleText = TitleText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BGImage:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.BGImage:SetRGBFromInt( 16777215, 250 )
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
		self._sequences.ButtonOver = function ()
			BGImage:AnimateSequence( "ButtonOver" )
			TitleText:AnimateSequence( "ButtonOver" )
		end
		
		BGImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.BGImage:SetRGBFromInt( 16777215, 250 )
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
			TitleText:AnimateSequence( "ButtonUp" )
		end
		
		BGImage:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.BGImage:SetRGBFromInt( 5066061, 250 )
				end
			}
		} )
		TitleText:RegisterAnimationSequence( "DisabledOver", {
			{
				function ()
					return self.TitleText:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.DisabledOver = function ()
			BGImage:AnimateSequence( "DisabledOver" )
			TitleText:AnimateSequence( "DisabledOver" )
		end
		
		BGImage:RegisterAnimationSequence( "DisabledUp", {
			{
				function ()
					return self.BGImage:SetRGBFromInt( 5066061, 250 )
				end
			}
		} )
		TitleText:RegisterAnimationSequence( "DisabledUp", {
			{
				function ()
					return self.TitleText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.DisabledUp = function ()
			BGImage:AnimateSequence( "DisabledUp" )
			TitleText:AnimateSequence( "DisabledUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f17_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	return self
end

MenuBuilder.registerType( "ArmoryButton", ArmoryButton )
LockTable( _M )
