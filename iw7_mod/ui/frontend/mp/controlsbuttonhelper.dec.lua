local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ControlsButtonHelper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 24 * _1080p )
	self.id = "ControlsButtonHelper"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Icon = nil
	
	Icon = LUI.UIText.new()
	Icon.id = "Icon"
	Icon:setText( "#", 0 )
	Icon:SetFontSize( 20 * _1080p )
	Icon:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	Icon:SetAlignment( LUI.Alignment.Center )
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 53, _1080p * 2.5, _1080p * 22.5 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Icon2 = nil
	
	Icon2 = LUI.UIText.new()
	Icon2.id = "Icon2"
	Icon2:setText( "#", 0 )
	Icon2:SetFontSize( 20 * _1080p )
	Icon2:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	Icon2:SetAlignment( LUI.Alignment.Center )
	Icon2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 53, _1080p * 106, _1080p * 2.5, _1080p * 22.5 )
	self:addElement( Icon2 )
	self.Icon2 = Icon2
	
	local Label = nil
	
	Label = LUI.UIStyledText.new()
	Label.id = "Label"
	Label:setText( Engine.Localize( "MENU_BACK" ), 0 )
	Label:SetFontSize( 16 * _1080p )
	Label:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label:SetAlignment( LUI.Alignment.Left )
	Label:SetStartupDelay( 1250 )
	Label:SetLineHoldTime( 400 )
	Label:SetAnimMoveTime( 300 )
	Label:SetEndDelay( 1000 )
	Label:SetCrossfadeTime( 500 )
	Label:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Label:SetMaxVisibleLines( 1 )
	Label:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 112, _1080p * 346, _1080p * 3.5, _1080p * 19.5 )
	self:addElement( Label )
	self.Label = Label
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Icon:RegisterAnimationSequence( "OneRef", {
			{
				function ()
					return self.Icon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 106, _1080p * 2.5, _1080p * 22.5, 0 )
				end
			}
		} )
		Icon2:RegisterAnimationSequence( "OneRef", {
			{
				function ()
					return self.Icon2:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.OneRef = function ()
			Icon:AnimateSequence( "OneRef" )
			Icon2:AnimateSequence( "OneRef" )
		end
		
		Icon:RegisterAnimationSequence( "TwoRef", {
			{
				function ()
					return self.Icon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 53, _1080p * 2.5, _1080p * 22.5, 0 )
				end
			}
		} )
		Icon2:RegisterAnimationSequence( "TwoRef", {
			{
				function ()
					return self.Icon2:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.TwoRef = function ()
			Icon:AnimateSequence( "TwoRef" )
			Icon2:AnimateSequence( "TwoRef" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "ControlsButtonHelper", ControlsButtonHelper )
LockTable( _M )
