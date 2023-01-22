local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HeadquartersCustomization( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 773 * _1080p )
	self.id = "HeadquartersCustomization"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local HeadquartersCustomizationButtons = nil
	
	HeadquartersCustomizationButtons = MenuBuilder.BuildRegisteredType( "HeadquartersCustomizationButtons", {
		controllerIndex = f1_local1
	} )
	HeadquartersCustomizationButtons.id = "HeadquartersCustomizationButtons"
	HeadquartersCustomizationButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30, _1080p * 530, _1080p * 22, _1080p * 501 )
	self:addElement( HeadquartersCustomizationButtons )
	self.HeadquartersCustomizationButtons = HeadquartersCustomizationButtons
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
	end
	
	self._animationSets.CP = function ()
		HeadquartersCustomizationButtons:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.HeadquartersCustomizationButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30, _1080p * 530, _1080p * 7, _1080p * 486, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			HeadquartersCustomizationButtons:AnimateSequence( "DefaultSequence" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "CP" )
	end
	return self
end

MenuBuilder.registerType( "HeadquartersCustomization", HeadquartersCustomization )
LockTable( _M )
