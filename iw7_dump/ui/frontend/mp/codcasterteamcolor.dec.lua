local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		f2_arg0:dispatchEventToCurrentMenu( {
			name = "color_selected",
			intColor = f1_arg0.intColor
		} )
	end )
end

function CodCasterTeamColor( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 60 * _1080p, 0, 60 * _1080p )
	self.id = "CodCasterTeamColor"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local TeamColor = nil
	
	TeamColor = LUI.UIImage.new()
	TeamColor.id = "TeamColor"
	TeamColor:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 60, 0, _1080p * 60 )
	self:addElement( TeamColor )
	self.TeamColor = TeamColor
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f3_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 60, 0, _1080p * 60 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local ColorLocked = nil
	
	ColorLocked = LUI.UIImage.new()
	ColorLocked.id = "ColorLocked"
	ColorLocked:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	ColorLocked:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 54, _1080p * 7, _1080p * 55 )
	self:addElement( ColorLocked )
	self.ColorLocked = ColorLocked
	
	local ColorSelected = nil
	
	ColorSelected = LUI.UIImage.new()
	ColorSelected.id = "ColorSelected"
	ColorSelected:SetScale( -0.36, 0 )
	ColorSelected:setImage( RegisterMaterial( "solid_triangle" ), 0 )
	ColorSelected:SetUMin( 1, 0 )
	ColorSelected:SetUMax( 0, 0 )
	ColorSelected:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 35.4, _1080p * 65.4, _1080p * 35.4, _1080p * 65.4 )
	self:addElement( ColorSelected )
	self.ColorSelected = ColorSelected
	
	self._animationSets.DefaultAnimationSet = function ()
		ColorLocked:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ColorLocked:SetAlpha( 0, 0 )
				end
			}
		} )
		ColorSelected:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ColorSelected:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			ColorLocked:AnimateSequence( "DefaultSequence" )
			ColorSelected:AnimateSequence( "DefaultSequence" )
		end
		
		ColorSelected:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.ColorSelected:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Selected = function ()
			ColorSelected:AnimateSequence( "Selected" )
		end
		
		ColorLocked:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.ColorLocked:SetAlpha( 1, 0 )
				end
			}
		} )
		ColorSelected:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.ColorSelected:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			ColorLocked:AnimateSequence( "Locked" )
			ColorSelected:AnimateSequence( "Locked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "CodCasterTeamColor", CodCasterTeamColor )
LockTable( _M )
