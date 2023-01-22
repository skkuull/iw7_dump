local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ArmoryStreakButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 100 * _1080p )
	self.id = "ArmoryStreakButton"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local GenericItemBackground = nil
	
	GenericItemBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f1_local1
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
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -47, _1080p * 47, _1080p * -73, _1080p * -3 )
	self:addElement( Image )
	self.Image = Image
	
	local NewItemNotification = nil
	
	NewItemNotification = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
		controllerIndex = f1_local1
	} )
	NewItemNotification.id = "NewItemNotification"
	NewItemNotification:SetAlpha( 0, 0 )
	NewItemNotification:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 168, _1080p * 200, _1080p * 68, _1080p * 100 )
	self:addElement( NewItemNotification )
	self.NewItemNotification = NewItemNotification
	
	local TitleBackground = nil
	
	TitleBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f1_local1
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
		controllerIndex = f1_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local QualityImage = nil
	
	QualityImage = LUI.UIImage.new()
	QualityImage.id = "QualityImage"
	QualityImage:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 8, _1080p * 40, _1080p * -40, _1080p * -8 )
	self:addElement( QualityImage )
	self.QualityImage = QualityImage
	
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:SetAlpha( 0, 0 )
	Lock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Lock:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * 18, _1080p * -6, _1080p * 30 )
	self:addElement( Lock )
	self.Lock = Lock
	
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
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Rollover" )
	end )
	self:addEventHandler( "button_up", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f17_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Rollout" )
	end )
	return self
end

MenuBuilder.registerType( "ArmoryStreakButton", ArmoryStreakButton )
LockTable( _M )
