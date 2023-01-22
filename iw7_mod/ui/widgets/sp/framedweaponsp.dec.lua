local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg0:GetDataSource()
	f1_local0 = f1_local0.used:GetValue( f1_arg2 )
	local f1_local1 = nil
	if f1_arg1 then
		if f1_local0 then
			f1_local1 = "ButtonOverInUse"
		else
			f1_local1 = "ButtonOverNotInUse"
		end
	elseif f1_local0 then
		f1_local1 = "ButtonUpInUse"
	else
		f1_local1 = "ButtonUpNotInUse"
	end
	if f1_local1 and f1_arg0._currentSequence ~= f1_local1 then
		ACTIONS.AnimateSequence( f1_arg0, f1_local1 )
		f1_arg0._currentSequence = f1_local1
	end
end

f0_local1 = function ( f2_arg0 )
	return function ( f3_arg0, f3_arg1 )
		ACTIONS.AnimateSequence( f2_arg0, "ButtonOverInUse" )
		ACTIONS.AnimateSequenceByElement( f2_arg0, {
			elementName = "Background",
			sequenceName = "Pick10Over",
			elementPath = "Background"
		} )
		f2_arg0.Background:Pick10Over()
		f2_arg0.Background:GradientFlashOver()
	end
	
end

f0_local2 = function ( f4_arg0 )
	return function ( f5_arg0, f5_arg1 )
		if #f4_arg0:getAllFocusedChildren() == 0 then
			ACTIONS.AnimateSequence( f4_arg0, "ButtonUpInUse" )
			f4_arg0.Background:Pick10Up()
			f4_arg0.Background:GradientFlashUp()
		end
	end
	
end

local f0_local3 = function ( f6_arg0, f6_arg1, f6_arg2 )
	f6_arg0:registerEventHandler( "button_over", function ( element, event )
		f0_local0( element, true, f6_arg1 )
	end )
	f6_arg0:registerEventHandler( "button_up", function ( element, event )
		f0_local0( element, false, f6_arg1 )
	end )
	f6_arg0:SubscribeToModelThroughElement( f6_arg0, "used", function ()
		f0_local0( f6_arg0, f6_arg0:isInFocus(), f6_arg1 )
	end )
	local f6_local0 = function ( f10_arg0 )
		local f10_local0 = f10_arg0:getFirstChild()
		local f10_local1 = 0
		while f10_local0 do
			f10_local0.navigation = {}
			f10_local0:addEventHandler( "button_over", f0_local1( f6_arg0 ) )
			f10_local0:addEventHandler( "button_up", f0_local2( f6_arg0 ) )
			f10_local0:addEventHandler( "button_over_disable", f0_local1( f6_arg0 ) )
			f10_local0:addEventHandler( "button_disable", f0_local2( f6_arg0 ) )
			f10_local0 = f10_local0:getNextSibling()
			f10_local1 = f10_local1 + 1
		end
	end
	
	f6_local0( f6_arg0.AttachmentsOne )
	if Engine.IsMultiplayer() then
		f6_local0( f6_arg0.AttachmentsTwo )
	end
	f6_arg0.WeaponButton:addEventHandler( "button_over", f0_local1( f6_arg0 ) )
	f6_arg0.WeaponButton:addEventHandler( "button_up", f0_local2( f6_arg0 ) )
	f6_arg0.WeaponButton:addEventHandler( "button_over_disable", f0_local1( f6_arg0 ) )
	f6_arg0.WeaponButton:addEventHandler( "button_disable", f0_local2( f6_arg0 ) )
end

function FramedWeaponSP( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 206.98 * _1080p )
	self.id = "FramedWeaponSP"
	self._animationSets = {}
	self._sequences = {}
	local f11_local1 = controller and controller.controllerIndex
	if not f11_local1 and not Engine.InFrontend() then
		f11_local1 = self:getRootController()
	end
	assert( f11_local1 )
	local f11_local2 = self
	local WeaponButton = nil
	
	WeaponButton = MenuBuilder.BuildRegisteredType( "WeaponButton", {
		controllerIndex = f11_local1
	} )
	WeaponButton.id = "WeaponButton"
	WeaponButton:SetDataSourceThroughElement( self, nil )
	WeaponButton.PersonalizeLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_PERSONALIZE" ) ), 0 )
	WeaponButton:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -137, _1080p * 24, _1080p * 206.98 )
	self:addElement( WeaponButton )
	self.WeaponButton = WeaponButton
	
	local AttachmentsOne = nil
	
	AttachmentsOne = MenuBuilder.BuildRegisteredType( "FramedAttachmentsSP", {
		controllerIndex = f11_local1
	} )
	AttachmentsOne.id = "AttachmentsOne"
	AttachmentsOne:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -135, 0, _1080p * 24, _1080p * 206.98 )
	self:addElement( AttachmentsOne )
	self.AttachmentsOne = AttachmentsOne
	
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f11_local1
	} )
	Background.id = "Background"
	Background.DropShadow:SetAlpha( 0, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( Background )
	self.Background = Background
	
	local FrameLabel = nil
	
	FrameLabel = LUI.UIText.new()
	FrameLabel.id = "FrameLabel"
	FrameLabel:SetRGBFromInt( 14277081, 0 )
	FrameLabel:setText( Engine.Localize( "MENU_NEW" ), 0 )
	FrameLabel:SetFontSize( 19 * _1080p )
	FrameLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FrameLabel:SetAlignment( LUI.Alignment.Left )
	FrameLabel:SetOptOutRightToLeftAlignmentFlip( true )
	FrameLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -9, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( FrameLabel )
	self.FrameLabel = FrameLabel
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		FrameLabel:RegisterAnimationSequence( "ButtonOverInUse", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOverInUse = function ()
			FrameLabel:AnimateSequence( "ButtonOverInUse" )
		end
		
		FrameLabel:RegisterAnimationSequence( "ButtonOverNotInUse", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOverNotInUse = function ()
			FrameLabel:AnimateSequence( "ButtonOverNotInUse" )
		end
		
		FrameLabel:RegisterAnimationSequence( "ButtonUpInUse", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		self._sequences.ButtonUpInUse = function ()
			FrameLabel:AnimateSequence( "ButtonUpInUse" )
		end
		
		FrameLabel:RegisterAnimationSequence( "ButtonUpNotInUse", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		self._sequences.ButtonUpNotInUse = function ()
			FrameLabel:AnimateSequence( "ButtonUpNotInUse" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	WeaponButton:SetDataSourceThroughElement( self, nil )
	f0_local3( self, f11_local1, controller )
	return self
end

MenuBuilder.registerType( "FramedWeaponSP", FramedWeaponSP )
LockTable( _M )
