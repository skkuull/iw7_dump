local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if IsLanguageArabic() then
		f1_arg0.XPNeededValue:SetAlignment( LUI.Alignment.Left )
	end
end

function AARRewardsXPNeeded( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 20 * _1080p )
	self.id = "AARRewardsXPNeeded"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local XPNeededLabel = nil
	
	XPNeededLabel = LUI.UIStyledText.new()
	XPNeededLabel.id = "XPNeededLabel"
	XPNeededLabel:SetRGBFromInt( 10066329, 0 )
	XPNeededLabel:setText( Engine.Localize( "MENU_NEW" ), 0 )
	XPNeededLabel:SetFontSize( 20 * _1080p )
	XPNeededLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	XPNeededLabel:SetAlignment( LUI.Alignment.Left )
	XPNeededLabel:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 20 )
	self:addElement( XPNeededLabel )
	self.XPNeededLabel = XPNeededLabel
	
	local XPNeededValue = nil
	
	XPNeededValue = LUI.UIStyledText.new()
	XPNeededValue.id = "XPNeededValue"
	XPNeededValue:SetRGBFromInt( 10066329, 0 )
	XPNeededValue:setText( "8008135", 0 )
	XPNeededValue:SetFontSize( 20 * _1080p )
	XPNeededValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	XPNeededValue:SetAlignment( LUI.Alignment.Right )
	XPNeededValue:SetOptOutRightToLeftAlignmentFlip( true )
	XPNeededValue:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 20 )
	self:addElement( XPNeededValue )
	self.XPNeededValue = XPNeededValue
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		XPNeededLabel:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.XPNeededLabel:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		XPNeededValue:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.XPNeededValue:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.CPDefault = function ()
			XPNeededLabel:AnimateSequence( "CPDefault" )
			XPNeededValue:AnimateSequence( "CPDefault" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPDefault" )
	end
	return self
end

MenuBuilder.registerType( "AARRewardsXPNeeded", AARRewardsXPNeeded )
LockTable( _M )
