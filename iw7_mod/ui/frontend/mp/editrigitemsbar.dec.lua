local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function EditRigItemsBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 467 * _1080p, 0, 34 * _1080p )
	self.id = "EditRigItemsBar"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local PressToEditBar = nil
	
	PressToEditBar = LUI.UIImage.new()
	PressToEditBar.id = "PressToEditBar"
	PressToEditBar:SetRGBFromTable( SWATCHES.CAC.powerBoxFrame, 0 )
	PressToEditBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 467, 0, _1080p * 36 )
	self:addElement( PressToEditBar )
	self.PressToEditBar = PressToEditBar
	
	local PressToEdit = nil
	
	PressToEdit = LUI.UIText.new()
	PressToEdit.id = "PressToEdit"
	PressToEdit:SetRGBFromInt( 0, 0 )
	PressToEdit:setText( Engine.Localize( "LUA_MENU_MP_ACTIVATE_TO_EDIT" ), 0 )
	PressToEdit:SetFontSize( 34 * _1080p )
	PressToEdit:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	PressToEdit:SetAlignment( LUI.Alignment.Center )
	PressToEdit:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 467, 0, _1080p * 34 )
	self:addElement( PressToEdit )
	self.PressToEdit = PressToEdit
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		PressToEdit:RegisterAnimationSequence( "CloseEditRigItems", {
			{
				function ()
					return self.PressToEdit:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.CloseEditRigItems = function ()
			PressToEdit:AnimateSequence( "CloseEditRigItems" )
		end
		
		self._sequences.OpenEditRigItems = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "EditRigItemsBar", EditRigItemsBar )
LockTable( _M )
