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
		if Engine.InFrontend() then
			ACTIONS.AnimateSequenceByElement( f2_arg0, {
				elementName = "Background",
				sequenceName = "Pick10Over",
				elementPath = "Background"
			} )
			f2_arg0.Background:Pick10Over()
			f2_arg0.Background:GradientFlashOver()
		end
	end
	
end

f0_local2 = function ( f4_arg0 )
	return function ( f5_arg0, f5_arg1 )
		ACTIONS.AnimateSequence( f4_arg0, "ButtonUpInUse" )
		if Engine.InFrontend() then
			f4_arg0.Background:Pick10Up()
			f4_arg0.Background:GradientFlashUp()
		end
	end
	
end

local f0_local3 = function ( f6_arg0 )
	return function ( f7_arg0, f7_arg1 )
		ACTIONS.AnimateSequence( f6_arg0, "ButtonOverInUse" )
		if Engine.InFrontend() then
			ACTIONS.AnimateSequenceByElement( f6_arg0, {
				elementName = "Background",
				sequenceName = "Pick10Over",
				elementPath = "Background"
			} )
			f6_arg0.Background:Pick10Over()
			f6_arg0.Background:GradientFlashOver()
		end
	end
	
end

local f0_local4 = function ( f8_arg0 )
	return function ( f9_arg0, f9_arg1 )
		ACTIONS.AnimateSequence( f8_arg0, "ButtonUpInUse" )
		if Engine.InFrontend() then
			f8_arg0.Background:Pick10Up()
			f8_arg0.Background:GradientFlashUp()
		end
	end
	
end

local f0_local5 = function ( f10_arg0, f10_arg1, f10_arg2 )
	f10_arg0:registerEventHandler( "button_over", function ( element, event )
		f0_local0( element, true, f10_arg1 )
	end )
	f10_arg0:registerEventHandler( "button_up", function ( element, event )
		f0_local0( element, false, f10_arg1 )
	end )
	f10_arg0:SubscribeToModelThroughElement( f10_arg0, "used", function ()
		f0_local0( f10_arg0, f10_arg0:isInFocus(), f10_arg1 )
	end )
	local f10_local0 = function ( f14_arg0 )
		local f14_local0 = f14_arg0:getFirstChild()
		local f14_local1 = 0
		while f14_local0 do
			f14_local0.navigation = {}
			f14_local0:addEventHandler( "button_over", f0_local1( f10_arg0 ) )
			f14_local0:addEventHandler( "button_up", f0_local2( f10_arg0 ) )
			f14_local0:addEventHandler( "button_over_disable", f0_local3( f10_arg0 ) )
			f14_local0:addEventHandler( "button_disable", f0_local4( f10_arg0 ) )
			f14_local0 = f14_local0:getNextSibling()
			f14_local1 = f14_local1 + 1
		end
	end
	
	f10_local0( f10_arg0.AttachmentsOne )
	if Engine.IsMultiplayer() then
		f10_local0( f10_arg0.AttachmentsTwo )
	end
	f10_arg0.WeaponButton:addEventHandler( "button_over", f0_local1( f10_arg0 ) )
	f10_arg0.WeaponButton:addEventHandler( "button_up", f0_local2( f10_arg0 ) )
	f10_arg0.Overkill:addEventHandler( "button_over", f0_local1( f10_arg0 ) )
	f10_arg0.Overkill:addEventHandler( "button_up", f0_local2( f10_arg0 ) )
	if CONDITIONS.IsCoreFrontendPC() and f10_arg0.Background then
		ACTIONS.AnimateSequence( f10_arg0.Background, "AlignMainShadow" )
	end
end

function OverkillWeapon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 590 * _1080p, 0, 206 * _1080p )
	self.id = "OverkillWeapon"
	self._animationSets = {}
	self._sequences = {}
	local f15_local1 = controller and controller.controllerIndex
	if not f15_local1 and not Engine.InFrontend() then
		f15_local1 = self:getRootController()
	end
	assert( f15_local1 )
	local f15_local2 = self
	local f15_local3 = nil
	if not Engine.InFrontend() then
		f15_local3 = LUI.UIImage.new()
		f15_local3.id = "InGameBackground"
		f15_local3:SetRGBFromInt( 0, 0 )
		f15_local3:SetAlpha( 0.8, 0 )
		f15_local3:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
		self:addElement( f15_local3 )
		self.InGameBackground = f15_local3
	end
	local WeaponButton = nil
	
	WeaponButton = MenuBuilder.BuildRegisteredType( "WeaponButton", {
		controllerIndex = f15_local1
	} )
	WeaponButton.id = "WeaponButton"
	WeaponButton:SetDataSourceThroughElement( self, nil )
	WeaponButton.PersonalizeLabel:setText( Engine.Localize( "LUA_MENU_MP_PERSONALIZE" ), 0 )
	WeaponButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 295, _1080p * 24, _1080p * 206 )
	self:addElement( WeaponButton )
	self.WeaponButton = WeaponButton
	
	local AttachmentsOne = nil
	
	AttachmentsOne = MenuBuilder.BuildRegisteredType( "FramedAttachments", {
		controllerIndex = f15_local1
	} )
	AttachmentsOne.id = "AttachmentsOne"
	AttachmentsOne:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 301, _1080p * 590, _1080p * 24, _1080p * 114 )
	self:addElement( AttachmentsOne )
	self.AttachmentsOne = AttachmentsOne
	
	local f15_local6 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f15_local6 = MenuBuilder.BuildRegisteredType( "Overkill", {
			controllerIndex = f15_local1
		} )
		f15_local6.id = "Overkill"
		f15_local6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 301, _1080p * 396, _1080p * 116, _1080p * 206 )
		self:addElement( f15_local6 )
		self.Overkill = f15_local6
	end
	local f15_local7 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f15_local7 = MenuBuilder.BuildRegisteredType( "TwoFramedAttachments", {
			controllerIndex = f15_local1
		} )
		f15_local7.id = "AttachmentsTwo"
		f15_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 398, _1080p * 590, _1080p * 116, _1080p * 206 )
		self:addElement( f15_local7 )
		self.AttachmentsTwo = f15_local7
	end
	local f15_local8 = nil
	if Engine.InFrontend() then
		f15_local8 = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
			controllerIndex = f15_local1
		} )
		f15_local8.id = "Background"
		f15_local8.DropShadow:SetAlpha( 0, 0 )
		f15_local8:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
		self:addElement( f15_local8 )
		self.Background = f15_local8
	end
	local FrameLabel = nil
	
	FrameLabel = LUI.UIText.new()
	FrameLabel.id = "FrameLabel"
	FrameLabel:SetRGBFromInt( 14277081, 0 )
	FrameLabel:setText( Engine.Localize( "MENU_NEW" ), 0 )
	FrameLabel:SetFontSize( 19 * _1080p )
	FrameLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FrameLabel:SetAlignment( LUI.Alignment.Left )
	FrameLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -23, _1080p * 2.5, _1080p * 21.5 )
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
		
		self._sequences.OverkillOn = function ()
			
		end
		
		self._sequences.OverkillOff = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	WeaponButton:SetDataSourceThroughElement( self, nil )
	f0_local5( self, f15_local1, controller )
	return self
end

MenuBuilder.registerType( "OverkillWeapon", OverkillWeapon )
LockTable( _M )
