local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	return function ( f2_arg0, f2_arg1 )
		ACTIONS.AnimateSequence( f1_arg0, "ButtonOver" )
		if Engine.InFrontend() then
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "Background",
				sequenceName = "Pick10Over",
				elementPath = "Background"
			} )
			f1_arg0.Background:Pick10Over()
			f1_arg0.Background:GradientFlashOver()
		end
	end
	
end

f0_local1 = function ( f3_arg0 )
	return function ( f4_arg0, f4_arg1 )
		ACTIONS.AnimateSequence( f3_arg0, "ButtonUp" )
		if Engine.InFrontend() then
			f3_arg0.Background:Pick10Up()
			f3_arg0.Background:GradientFlashUp()
		end
	end
	
end

f0_local2 = function ( f5_arg0, f5_arg1, f5_arg2 )
	f5_arg0:SetNoWrap( true )
	if CONDITIONS.InGameSPOrFrontendMP() then
		f5_arg0.Perk:addEventHandler( "button_over", f0_local0( f5_arg0 ) )
		f5_arg0.Perk:addEventHandler( "button_up", f0_local1( f5_arg0 ) )
		f5_arg0.Perk:addEventHandler( "button_over_disable", f0_local0( f5_arg0 ) )
		f5_arg0.Perk:addEventHandler( "button_disable", f0_local1( f5_arg0 ) )
		f5_arg0.ExtraPerk:addEventHandler( "button_over", f0_local0( f5_arg0 ) )
		f5_arg0.ExtraPerk:addEventHandler( "button_up", f0_local1( f5_arg0 ) )
		f5_arg0.ExtraPerk:addEventHandler( "button_over_disable", f0_local0( f5_arg0 ) )
		f5_arg0.ExtraPerk:addEventHandler( "button_disable", f0_local1( f5_arg0 ) )
	end
	if CONDITIONS.IsCoreFrontendPC() and f5_arg0.Background then
		ACTIONS.AnimateSequence( f5_arg0.Background, "AlignMainShadow" )
	end
end

function FramedPerks( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 95 * _1080p, 0, 206 * _1080p )
	self.id = "FramedPerks"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local f6_local3 = nil
	if not Engine.InFrontend() then
		f6_local3 = LUI.UIImage.new()
		f6_local3.id = "InGameBackground"
		f6_local3:SetRGBFromInt( 0, 0 )
		f6_local3:SetAlpha( 0.8, 0 )
		f6_local3:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
		self:addElement( f6_local3 )
		self.InGameBackground = f6_local3
	end
	local Perk = nil
	
	Perk = MenuBuilder.BuildRegisteredType( "FramedPerk", {
		controllerIndex = f6_local1
	} )
	Perk.id = "Perk"
	Perk:SetDataSourceThroughElement( self, "perk" )
	Perk:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 95, _1080p * 24, _1080p * 114 )
	self:addElement( Perk )
	self.Perk = Perk
	
	local ExtraPerk = nil
	
	ExtraPerk = MenuBuilder.BuildRegisteredType( "FramedPerk", {
		controllerIndex = f6_local1
	} )
	ExtraPerk.id = "ExtraPerk"
	ExtraPerk:SetDataSourceThroughElement( self, "extraPerk" )
	ExtraPerk:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 95, _1080p * 116, _1080p * 206 )
	self:addElement( ExtraPerk )
	self.ExtraPerk = ExtraPerk
	
	local f6_local6 = nil
	if Engine.InFrontend() then
		f6_local6 = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
			controllerIndex = f6_local1
		} )
		f6_local6.id = "Background"
		f6_local6.DropShadow:SetAlpha( 0, 0 )
		f6_local6:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
		self:addElement( f6_local6 )
		self.Background = f6_local6
	end
	local FrameLabel = nil
	
	FrameLabel = LUI.UIText.new()
	FrameLabel.id = "FrameLabel"
	FrameLabel:SetRGBFromInt( 14277081, 0 )
	FrameLabel:setText( Engine.Localize( "MENU_NEW" ), 0 )
	FrameLabel:SetFontSize( 19 * _1080p )
	FrameLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FrameLabel:SetAlignment( LUI.Alignment.Center )
	FrameLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 2, 0, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( FrameLabel )
	self.FrameLabel = FrameLabel
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		FrameLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			FrameLabel:AnimateSequence( "ButtonOver" )
		end
		
		FrameLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			FrameLabel:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Perk:SetDataSourceThroughElement( self, "perk" )
	ExtraPerk:SetDataSourceThroughElement( self, "extraPerk" )
	f0_local2( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "FramedPerks", FramedPerks )
LockTable( _M )
