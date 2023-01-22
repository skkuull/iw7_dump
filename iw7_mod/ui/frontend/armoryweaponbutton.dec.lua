local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	assert( f1_arg0.Gradient )
	f1_arg0.Gradient:RegisterAnimationSequence( "Glow", {
		{
			function ()
				return f1_arg0.Gradient:SetAlpha( 0.3, 0 )
			end,
			function ()
				return f1_arg0.Gradient:SetAlpha( 0.35, 760, LUI.EASING.inSine )
			end,
			function ()
				return f1_arg0.Gradient:SetAlpha( 0.3, 580, LUI.EASING.outSine )
			end,
			function ()
				return f1_arg0.Gradient:SetAlpha( 0.35, 560, LUI.EASING.inSine )
			end,
			function ()
				return f1_arg0.Gradient:SetAlpha( 0.3, 690, LUI.EASING.outSine )
			end,
			function ()
				return f1_arg0.Gradient:SetAlpha( 0.35, 690, LUI.EASING.inSine )
			end,
			function ()
				return f1_arg0.Gradient:SetAlpha( 0.3, 420, LUI.EASING.outSine )
			end
		},
		{
			function ()
				return f1_arg0.Gradient:SetTop( _1080p * -76, 0 )
			end,
			function ()
				return f1_arg0.Gradient:SetTop( _1080p * -68, 490 )
			end,
			function ()
				return f1_arg0.Gradient:SetTop( _1080p * -76, 659 )
			end,
			function ()
				return f1_arg0.Gradient:SetTop( _1080p * -68, 500 )
			end,
			function ()
				return f1_arg0.Gradient:SetTop( _1080p * -76, 659 )
			end,
			function ()
				return f1_arg0.Gradient:SetTop( _1080p * -68, 840 )
			end,
			function ()
				return f1_arg0.Gradient:SetTop( _1080p * -76, 549, LUI.EASING.outSine )
			end
		}
	} )
	f1_arg0._sequences.Glow = function ()
		f1_arg0.Gradient:AnimateLoop( "Glow" )
	end
	
end

f0_local1 = function ( f17_arg0, f17_arg1, f17_arg2 )
	assert( f17_arg0.Pattern )
	assert( f17_arg0.Ring )
	f17_arg0.Pattern:SetMask( f17_arg0.Ring )
	f0_local0( f17_arg0 )
end

function ArmoryWeaponButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 100 * _1080p )
	self.id = "ArmoryWeaponButton"
	self._animationSets = {}
	self._sequences = {}
	local f18_local1 = controller and controller.controllerIndex
	if not f18_local1 and not Engine.InFrontend() then
		f18_local1 = self:getRootController()
	end
	assert( f18_local1 )
	local f18_local2 = self
	local GenericItemBackground = nil
	
	GenericItemBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f18_local1
	} )
	GenericItemBackground.id = "GenericItemBackground"
	GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local UnavailableOverlay = nil
	
	UnavailableOverlay = LUI.UIImage.new()
	UnavailableOverlay.id = "UnavailableOverlay"
	UnavailableOverlay:setImage( RegisterMaterial( "inventory_blueprint_grid_small" ), 0 )
	UnavailableOverlay:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( UnavailableOverlay )
	self.UnavailableOverlay = UnavailableOverlay
	
	local Highlight = nil
	
	Highlight = LUI.UIImage.new()
	Highlight.id = "Highlight"
	Highlight:SetAlpha( 0, 0 )
	Highlight:setImage( RegisterMaterial( "hud_glow" ), 0 )
	Highlight:SetBlendMode( BLEND_MODE.addWithAlpha )
	Highlight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -92, _1080p * 92, _1080p * 9, _1080p * 115 )
	self:addElement( Highlight )
	self.Highlight = Highlight
	
	local Gradient = nil
	
	Gradient = LUI.UIImage.new()
	Gradient.id = "Gradient"
	Gradient:SetAlpha( 0, 0 )
	Gradient:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	Gradient:SetUseAA( true )
	Gradient:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -100, _1080p * 100, _1080p * -76, 0 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local PatternDup = nil
	
	PatternDup = LUI.UIImage.new()
	PatternDup.id = "PatternDup"
	PatternDup:SetAlpha( 0, 0 )
	PatternDup:setImage( RegisterMaterial( "mk2_pattern" ), 0 )
	PatternDup:SetBlendMode( BLEND_MODE.addWithAlpha )
	PatternDup:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * 100, _1080p * -88, _1080p * 112 )
	self:addElement( PatternDup )
	self.PatternDup = PatternDup
	
	local f18_local8 = nil
	if Engine.IsMultiplayer() and CONDITIONS.InFrontend( self ) then
		f18_local8 = LUI.UIImage.new()
		f18_local8.id = "MK2"
		f18_local8:SetAlpha( 0, 0 )
		f18_local8:setImage( RegisterMaterial( "mk2_watermark_1" ), 0 )
		f18_local8:SetBlendMode( BLEND_MODE.addWithAlpha )
		f18_local8:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -64, _1080p * -4, _1080p * -28, _1080p * 2 )
		self:addElement( f18_local8 )
		self.MK2 = f18_local8
	end
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -70, _1080p * 70, _1080p * -73, _1080p * -3 )
	self:addElement( Image )
	self.Image = Image
	
	local NewItemNotification = nil
	
	NewItemNotification = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
		controllerIndex = f18_local1
	} )
	NewItemNotification.id = "NewItemNotification"
	NewItemNotification:SetAlpha( 0, 0 )
	NewItemNotification:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 168, _1080p * 200, _1080p * 68, _1080p * 100 )
	self:addElement( NewItemNotification )
	self.NewItemNotification = NewItemNotification
	
	local TitleBackground = nil
	
	TitleBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f18_local1
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
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f18_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:SetAlpha( 0, 0 )
	Lock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Lock:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * 18, _1080p * -6, _1080p * 30 )
	self:addElement( Lock )
	self.Lock = Lock
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f18_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 8, _1080p * 40, _1080p * -40, _1080p * -8 )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	local Pattern = nil
	
	Pattern = LUI.UIImage.new()
	Pattern.id = "Pattern"
	Pattern:SetAlpha( 0, 0 )
	Pattern:setImage( RegisterMaterial( "mk2_pattern" ), 0 )
	Pattern:SetBlendMode( BLEND_MODE.addWithAlpha )
	Pattern:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * 100, _1080p * -88, _1080p * 112 )
	self:addElement( Pattern )
	self.Pattern = Pattern
	
	local Ring = nil
	
	Ring = LUI.UIImage.new()
	Ring.id = "Ring"
	Ring:SetAlpha( 0, 0 )
	Ring:setImage( RegisterMaterial( "wdg_ring_mask" ), 0 )
	Ring:SetBlendMode( BLEND_MODE.addWithAlpha )
	Ring:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -116, _1080p * 140 )
	self:addElement( Ring )
	self.Ring = Ring
	
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
		
		NewItemNotification:RegisterAnimationSequence( "IsNew", {
			{
				function ()
					return self.NewItemNotification:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.IsNew = function ()
			NewItemNotification:AnimateSequence( "IsNew" )
		end
		
		NewItemNotification:RegisterAnimationSequence( "IsNotNew", {
			{
				function ()
					return self.NewItemNotification:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.IsNotNew = function ()
			NewItemNotification:AnimateSequence( "IsNotNew" )
		end
		
		PatternDup:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.PatternDup:SetAlpha( 0.6, 0 )
				end
			}
		} )
		Pattern:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.Pattern:SetAlpha( 1, 0 )
				end
			}
		} )
		Ring:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.Ring:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Ring:SetAlpha( 1, 500 )
				end,
				function ()
					return self.Ring:SetAlpha( 0, 500 )
				end,
				function ()
					return self.Ring:SetAlpha( 1, 500 )
				end,
				function ()
					return self.Ring:SetAlpha( 0, 500 )
				end,
				function ()
					return self.Ring:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Ring:SetAlpha( 1, 1700, LUI.EASING.outBack )
				end,
				function ()
					return self.Ring:SetAlpha( 0, 250 )
				end
			},
			{
				function ()
					return self.Ring:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -44, _1080p * 44, _1080p * -32, _1080p * 56, 0 )
				end,
				function ()
					return self.Ring:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -44, _1080p * 44, _1080p * -32, _1080p * 56, 1000 )
				end,
				function ()
					return self.Ring:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -57.32, _1080p * 57.32, _1080p * -45.32, _1080p * 69.32, 9 )
				end,
				function ()
					return self.Ring:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -57.32, _1080p * 57.32, _1080p * -45.32, _1080p * 69.32, 990 )
				end,
				function ()
					return self.Ring:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -116, _1080p * 140, 2000 )
				end
			}
		} )
		self._sequences.Pulse = function ()
			PatternDup:AnimateLoop( "Pulse" )
			Pattern:AnimateLoop( "Pulse" )
			Ring:AnimateLoop( "Pulse" )
		end
		
		Highlight:RegisterAnimationSequence( "MK2HighlightOn", {
			{
				function ()
					return self.Highlight:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.Highlight:SetAlpha( 0.65, 1010, LUI.EASING.inSine )
				end,
				function ()
					return self.Highlight:SetAlpha( 0.6, 990, LUI.EASING.inSine )
				end
			},
			{
				function ()
					return self.Highlight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -92, _1080p * 92, _1080p * 9, _1080p * 115, 0 )
				end,
				function ()
					return self.Highlight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -112, _1080p * 112, _1080p * 7, _1080p * 117, 1009, LUI.EASING.inSine )
				end,
				function ()
					return self.Highlight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -92, _1080p * 92, _1080p * 9, _1080p * 115, 990, LUI.EASING.inSine )
				end
			}
		} )
		self._sequences.MK2HighlightOn = function ()
			Highlight:AnimateLoop( "MK2HighlightOn" )
		end
		
		Highlight:RegisterAnimationSequence( "MK2HighlightOff", {
			{
				function ()
					return self.Highlight:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.Highlight:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.Highlight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -92, _1080p * 92, _1080p * 9, _1080p * 115, 0 )
				end
			}
		} )
		self._sequences.MK2HighlightOff = function ()
			Highlight:AnimateSequence( "MK2HighlightOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f60_arg0, f60_arg1 )
		local f60_local0 = f60_arg1.controller or f18_local1
		ACTIONS.AnimateSequence( self, "Rollover" )
	end )
	self:addEventHandler( "button_up", function ( f61_arg0, f61_arg1 )
		local f61_local0 = f61_arg1.controller or f18_local1
		ACTIONS.AnimateSequence( self, "Rollout" )
	end )
	f0_local1( self, f18_local1, controller )
	return self
end

MenuBuilder.registerType( "ArmoryWeaponButton", ArmoryWeaponButton )
LockTable( _M )
