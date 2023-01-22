local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	return function ( f2_arg0, f2_arg1 )
		f2_arg0.buttonDescription = f2_arg1.buttonDescription
		local f2_local0 = f2_arg1.imageAnchors
		f2_arg0.Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * f2_local0.left, _1080p * f2_local0.right, _1080p * f2_local0.top, _1080p * f2_local0.bottom )
		f2_arg0.Image:setImage( RegisterMaterial( f2_arg1.image ), 0 )
		f2_arg0.Name:setText( ToUpperCase( f2_arg1.name ), 0 )
		f2_arg0:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
			LUI.FlowManager.RequestAddMenu( f2_arg1.openMenu, true, f1_arg0, false, {
				isMk2 = f2_arg1.isMk2
			}, true )
		end )
		if Engine.IsAliensMode() and f2_arg1.aliensMode and f2_arg1.aliensMode.imageColor then
			f2_arg0.Image:SetRGBFromInt( f2_arg1.aliensMode.imageColor, 0 )
		end
	end
	
end

f0_local1 = function ( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg0.SetupArmoryButtonData = f0_local0( f4_arg1 )
end

function ArmoryCategoryButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 335 * _1080p, 0, 200 * _1080p )
	self.id = "ArmoryCategoryButton"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local GenericItemBackground = nil
	
	GenericItemBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f5_local1
	} )
	GenericItemBackground.id = "GenericItemBackground"
	GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -64, _1080p * 64 )
	self:addElement( Image )
	self.Image = Image
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f5_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local TitleBackground = nil
	
	TitleBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f5_local1
	} )
	TitleBackground.id = "TitleBackground"
	TitleBackground.DropShadow:SetAlpha( 0, 0 )
	TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local Name = nil
	
	Name = LUI.UIStyledText.new()
	Name.id = "Name"
	Name:SetRGBFromInt( 14277081, 0 )
	Name:setText( "", 0 )
	Name:SetFontSize( 19 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Name:SetAlignment( LUI.Alignment.Left )
	Name:SetStartupDelay( 2000 )
	Name:SetLineHoldTime( 400 )
	Name:SetAnimMoveTime( 300 )
	Name:SetEndDelay( 1500 )
	Name:SetCrossfadeTime( 750 )
	Name:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Name:SetMaxVisibleLines( 1 )
	Name:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 13, _1080p * -13, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( Name )
	self.Name = Name
	
	local f5_local8 = nil
	if Engine.InFrontend() then
		f5_local8 = LUI.UIImage.new()
		f5_local8.id = "DropShadowCrafting"
		f5_local8:SetRGBFromInt( 0, 0 )
		f5_local8:SetAlpha( 0.3, 0 )
		f5_local8:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f5_local8:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f5_local8 )
		self.DropShadowCrafting = f5_local8
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Image:RegisterAnimationSequence( "Rollover", {
			{
				function ()
					return self.Image:SetScale( 0.05, 100 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "Rollover", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Name:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Rollover = function ()
			Image:AnimateSequence( "Rollover" )
			Name:AnimateSequence( "Rollover" )
		end
		
		Image:RegisterAnimationSequence( "Rollout", {
			{
				function ()
					return self.Image:SetScale( 0, 200 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "Rollout", {
			{
				function ()
					return self.Name:SetRGBFromInt( 14277081, 0 )
				end
			},
			{
				function ()
					return self.Name:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Rollout = function ()
			Image:AnimateSequence( "Rollout" )
			Name:AnimateSequence( "Rollout" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "Rollover" )
	end )
	self:addEventHandler( "button_up", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f17_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "Rollout" )
	end )
	self:addEventHandler( "button_over_disable", function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "Rollover" )
	end )
	self:addEventHandler( "button_disable", function ( f19_arg0, f19_arg1 )
		local f19_local0 = f19_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "Rollout" )
	end )
	f0_local1( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "ArmoryCategoryButton", ArmoryCategoryButton )
LockTable( _M )
