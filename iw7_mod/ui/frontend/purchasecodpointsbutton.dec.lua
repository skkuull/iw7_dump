local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = STORE.GoToCODPointsOnlyStore
		local f2_local1 = f1_arg1
		local f2_local2 = f2_arg0:GetCurrentMenu()
		f2_local0( f2_local1, f2_local2.id, f2_arg0.id )
	end )
end

function PurchaseCODPointsButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 680 * _1080p, 0, 80 * _1080p )
	self.id = "PurchaseCODPointsButton"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	self.buttonDescription = Engine.Localize( "MENU_BUY_COD_POINTS_DESC" )
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f3_local1
	} )
	Background.id = "Background"
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local BackgroundImage = nil
	
	BackgroundImage = LUI.UIImage.new()
	BackgroundImage.id = "BackgroundImage"
	BackgroundImage:SetRGBFromInt( 13421772, 0 )
	BackgroundImage:setImage( RegisterMaterial( "currency_cod_points_button_bg" ), 0 )
	BackgroundImage:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( BackgroundImage )
	self.BackgroundImage = BackgroundImage
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:setImage( RegisterMaterial( "currency_cod_points_icon" ), 0 )
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 74, _1080p * 25, _1080p * 79 )
	self:addElement( Image )
	self.Image = Image
	
	local Selection = nil
	
	Selection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f3_local1
	} )
	Selection.id = "Selection"
	Selection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( Selection )
	self.Selection = Selection
	
	local f3_local7 = nil
	if Engine.InFrontend() then
		f3_local7 = LUI.UIImage.new()
		f3_local7.id = "DropShadow"
		f3_local7:SetRGBFromInt( 0, 0 )
		f3_local7:SetAlpha( 0.3, 0 )
		f3_local7:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f3_local7:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f3_local7 )
		self.DropShadow = f3_local7
	end
	local TitleBG = nil
	
	TitleBG = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f3_local1
	} )
	TitleBG.id = "TitleBG"
	TitleBG.DropShadow:SetAlpha( 0, 0 )
	TitleBG:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( TitleBG )
	self.TitleBG = TitleBG
	
	local Name = nil
	
	Name = LUI.UIStyledText.new()
	Name.id = "Name"
	Name:setText( Engine.Localize( "LUA_MENU_STORE_CAPS" ), 0 )
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
	
	local PurchaseText = nil
	
	PurchaseText = LUI.UIStyledText.new()
	PurchaseText.id = "PurchaseText"
	PurchaseText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_PURCHASE_COD_POINTS" ) ), 0 )
	PurchaseText:SetFontSize( 32 * _1080p )
	PurchaseText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PurchaseText:SetAlignment( LUI.Alignment.Left )
	PurchaseText:SetShadowMinDistance( -0.7, 0 )
	PurchaseText:SetShadowMaxDistance( 0.8, 0 )
	PurchaseText:SetShadowRGBFromTable( SWATCHES.MPArmory.CODPointsGlow, 0 )
	PurchaseText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 85, _1080p * 585, _1080p * 35, _1080p * 67 )
	self:addElement( PurchaseText )
	self.PurchaseText = PurchaseText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Image:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Image:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Image:SetScale( 0.05, 100 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		PurchaseText:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.PurchaseText:SetShadowRGBFromTable( SWATCHES.MPArmory.CODPointsGlow, 0 )
				end
			},
			{
				function ()
					return self.PurchaseText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Image:AnimateSequence( "ButtonOver" )
			Name:AnimateSequence( "ButtonOver" )
			PurchaseText:AnimateSequence( "ButtonOver" )
		end
		
		BackgroundImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.BackgroundImage:SetRGBFromInt( 13421772, 100 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Image:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Image:SetScale( 0, 100 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		PurchaseText:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.PurchaseText:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.PurchaseText:SetShadowRGBFromTable( SWATCHES.MPArmory.CODPointsGlow, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			BackgroundImage:AnimateSequence( "ButtonUp" )
			Image:AnimateSequence( "ButtonUp" )
			Name:AnimateSequence( "ButtonUp" )
			PurchaseText:AnimateSequence( "ButtonUp" )
		end
		
		BackgroundImage:RegisterAnimationSequence( "Available", {
			{
				function ()
					return self.BackgroundImage:SetRGBFromInt( 13421772, 0 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "Available", {
			{
				function ()
					return self.Image:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		PurchaseText:RegisterAnimationSequence( "Available", {
			{
				function ()
					return self.PurchaseText:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.PurchaseText:SetShadowRGBFromTable( SWATCHES.MPArmory.CODPointsGlow, 0 )
				end
			}
		} )
		self._sequences.Available = function ()
			BackgroundImage:AnimateSequence( "Available" )
			Image:AnimateSequence( "Available" )
			PurchaseText:AnimateSequence( "Available" )
		end
		
		BackgroundImage:RegisterAnimationSequence( "Unavailable", {
			{
				function ()
					return self.BackgroundImage:SetRGBFromInt( 6710886, 0 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "Unavailable", {
			{
				function ()
					return self.Image:SetRGBFromInt( 8421504, 0 )
				end
			}
		} )
		PurchaseText:RegisterAnimationSequence( "Unavailable", {
			{
				function ()
					return self.PurchaseText:SetRGBFromInt( 8421504, 0 )
				end
			},
			{
				function ()
					return self.PurchaseText:SetShadowRGBFromInt( 4075029, 0 )
				end
			}
		} )
		self._sequences.Unavailable = function ()
			BackgroundImage:AnimateSequence( "Unavailable" )
			Image:AnimateSequence( "Unavailable" )
			PurchaseText:AnimateSequence( "Unavailable" )
		end
		
		BackgroundImage:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.BackgroundImage:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.BackgroundImage:SetRGBFromInt( 15132390, 750, LUI.EASING.inSine )
				end,
				function ()
					return self.BackgroundImage:SetRGBFromInt( 16777215, 750, LUI.EASING.inSine )
				end
			}
		} )
		self._sequences.Pulse = function ()
			BackgroundImage:AnimateLoop( "Pulse" )
		end
		
		Image:RegisterAnimationSequence( "CPButtonOver", {
			{
				function ()
					return self.Image:SetScale( 0.05, 100 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "CPButtonOver", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.CPButtonOver = function ()
			Image:AnimateSequence( "CPButtonOver" )
			Name:AnimateSequence( "CPButtonOver" )
		end
		
	end
	
	self._animationSets.CP = function ()
		Name:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Name:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Name:AnimateSequence( "DefaultSequence" )
		end
		
		Image:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Image:SetScale( 0.05, 100 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 100 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Image:AnimateSequence( "ButtonOver" )
			Name:AnimateSequence( "ButtonOver" )
		end
		
		BackgroundImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.BackgroundImage:SetRGBFromInt( 13421772, 100 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Image:SetScale( 0, 100 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Name:SetRGBFromTable( SWATCHES.genericButton.textDefault, 100 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			BackgroundImage:AnimateSequence( "ButtonUp" )
			Image:AnimateSequence( "ButtonUp" )
			Name:AnimateSequence( "ButtonUp" )
		end
		
		BackgroundImage:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.BackgroundImage:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.BackgroundImage:SetRGBFromInt( 15132390, 750, LUI.EASING.inSine )
				end,
				function ()
					return self.BackgroundImage:SetRGBFromInt( 16777215, 750, LUI.EASING.inSine )
				end
			}
		} )
		self._sequences.Pulse = function ()
			BackgroundImage:AnimateLoop( "Pulse" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f50_arg0, f50_arg1 )
		local f50_local0 = f50_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
		ACTIONS.AnimateSequence( self, "Pulse" )
	end )
	self:addEventHandler( "button_up", function ( f51_arg0, f51_arg1 )
		local f51_local0 = f51_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_disable", function ( f52_arg0, f52_arg1 )
		local f52_local0 = f52_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "Unavailable" )
	end )
	f0_local0( self, f3_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "CP" )
	end
	return self
end

MenuBuilder.registerType( "PurchaseCODPointsButton", PurchaseCODPointsButton )
LockTable( _M )
