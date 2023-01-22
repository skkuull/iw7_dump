local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if Engine.GetDvarBool( "killswitch_character_rotation" ) then
		return 
	else
		assert( f1_arg0.characterRotationArea )
		f1_arg0.characterRotationArea:SetModelIndex( f1_arg1 )
	end
end

f0_local1 = function ( f2_arg0 )
	if Engine.GetDvarBool( "killswitch_character_rotation" ) then
		return 
	else
		assert( f2_arg0.characterRotationArea )
		f2_arg0.characterRotationArea:Reset()
	end
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0.SetClientCharacterIndex = f0_local0
	f3_arg0.ResetRotation = f0_local1
	if Engine.GetDvarBool( "killswitch_character_rotation" ) then
		return 
	else
		local characterRotationArea = LUI.UIModelRotationArea.new( {
			type = LUI.UIModelRotationArea.Types.Character
		} )
		characterRotationArea.id = "characterRotationArea"
		characterRotationArea:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		f3_arg0:addElement( characterRotationArea )
		f3_arg0.characterRotationArea = characterRotationArea
		
	end
end

function CharacterRotator( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "CharacterRotator"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	f0_local2( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "CharacterRotator", CharacterRotator )
LockTable( _M )
