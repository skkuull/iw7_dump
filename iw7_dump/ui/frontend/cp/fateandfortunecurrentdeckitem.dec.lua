local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FateAndFortuneCurrentDeckItem( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "FateAndFortuneCurrentDeckItem"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CardImage = nil
	
	CardImage = LUI.UIImage.new()
	CardImage.id = "CardImage"
	CardImage:SetAlpha( 0.7, 0 )
	CardImage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 71.75, 0, _1080p * 71.75 )
	self:addElement( CardImage )
	self.CardImage = CardImage
	
	local SelectedIcon = nil
	
	SelectedIcon = LUI.UIImage.new()
	SelectedIcon.id = "SelectedIcon"
	SelectedIcon:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	SelectedIcon:SetAlpha( 0, 0 )
	SelectedIcon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 71.75, _1080p * 85.35, _1080p * 94 )
	self:addElement( SelectedIcon )
	self.SelectedIcon = SelectedIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CardImage:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.CardImage:SetAlpha( 1, 500 )
				end
			}
		} )
		SelectedIcon:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.SelectedIcon:SetAlpha( 1, 500 )
				end
			}
		} )
		self._sequences.Selected = function ()
			CardImage:AnimateSequence( "Selected" )
			SelectedIcon:AnimateSequence( "Selected" )
		end
		
		CardImage:RegisterAnimationSequence( "Unselected", {
			{
				function ()
					return self.CardImage:SetAlpha( 0.7, 500 )
				end
			}
		} )
		SelectedIcon:RegisterAnimationSequence( "Unselected", {
			{
				function ()
					return self.SelectedIcon:SetAlpha( 0, 500 )
				end
			}
		} )
		self._sequences.Unselected = function ()
			CardImage:AnimateSequence( "Unselected" )
			SelectedIcon:AnimateSequence( "Unselected" )
		end
		
		CardImage:RegisterAnimationSequence( "Unavailable", {
			{
				function ()
					return self.CardImage:SetAlpha( 0, 0 )
				end
			}
		} )
		SelectedIcon:RegisterAnimationSequence( "Unavailable", {
			{
				function ()
					return self.SelectedIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Unavailable = function ()
			CardImage:AnimateSequence( "Unavailable" )
			SelectedIcon:AnimateSequence( "Unavailable" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "FateAndFortuneCurrentDeckItem", FateAndFortuneCurrentDeckItem )
LockTable( _M )
