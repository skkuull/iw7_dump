LUI.UIModelRotationArea = LUI.Class( LUI.UIElement )
LUI.UIModelRotationArea.Types = {
	Weapon = 0,
	Character = 1
}
LUI.UIModelRotationArea.MaxScrollDistance = 200
local f0_local0 = -30
local f0_local1 = 50
local f0_local2 = -65
local f0_local3 = 65
local f0_local4 = -180
local f0_local5 = 180
local f0_local6 = 2
local f0_local7 = function ( f1_arg0 )
	local f1_local0
	if f1_arg0.x ~= -1000 or f1_arg0.y ~= -1000 then
		f1_local0 = false
	else
		f1_local0 = true
	end
	return f1_local0
end

local f0_local8 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0
	if 0 < f2_arg1 then
		f2_local0 = f0_local1
		if not f2_local0 then
		
		else
			f2_local0 = f2_arg1 * f2_local0
			local f2_local1
			if 0 < f2_arg2 then
				f2_local1 = f0_local3
				if not f2_local1 then
				
				else
					ClientWeapon.SetWeaponRotationGoal( f2_arg0._modelIndex, 0, f2_local0, f2_arg2 * f2_local1 )
				end
			end
			f2_local1 = -f0_local2
		end
	end
	f2_local0 = -f0_local0
end

local f0_local9 = function ( f3_arg0, f3_arg1 )
	if f3_arg0._rotating then
		if f0_local7( f3_arg1 ) then
			EndMouseRotation( f3_arg0, f3_arg1 )
			ResetRotation( f3_arg0 )
			return 
		end
		local f3_local0 = f3_arg0._initialX - LUI.UIModelRotationArea.MaxScrollDistance
		local f3_local1 = f3_arg0._initialX + LUI.UIModelRotationArea.MaxScrollDistance
		local f3_local2 = f3_arg0._initialY - LUI.UIModelRotationArea.MaxScrollDistance
		local f3_local3 = f3_arg0._initialY + LUI.UIModelRotationArea.MaxScrollDistance
		local f3_local4, f3_local5 = f3_arg1.root:PixelsToUnits( f3_arg1.x, f3_arg1.y )
		f3_local0, f3_local2 = f3_arg1.root:PixelsToUnits( f3_local0, f3_local2 )
		local f3_local6, f3_local7 = f3_arg1.root:PixelsToUnits( f3_local1, f3_local3 )
		f3_local3 = f3_local7
		f3_local6 = (f3_local4 - f3_local0) / (f3_local6 - f3_local0)
		f3_local7 = (f3_local5 - f3_local2) / (f3_local3 - f3_local2)
		local f3_local8 = -1
		local f3_local9 = 1
		local f3_local10 = LUI.Lerp( f3_local8, f3_local9, f3_local6 )
		local f3_local11 = LUI.Lerp( f3_local8, f3_local9, f3_local7 )
		f3_local10 = LUI.clamp( f3_local10, f3_local8, f3_local9 )
		f3_local11 = LUI.clamp( f3_local11, f3_local8, f3_local9 ) * -1
		if f3_arg0._type == LUI.UIModelRotationArea.Types.Weapon then
			f0_local8( f3_arg0, f3_local10, f3_local11 )
		elseif f3_arg0._type == LUI.UIModelRotationArea.Types.Character then
			ClientCharacter.SetCharacterRotation( f3_arg0._modelIndex, 0, LUI.Lerp( f0_local4, f0_local5, 1.5 + f3_local10 / 2 ), 0 )
		end
	end
end

local f0_local10 = function ( f4_arg0, f4_arg1 )
	f4_arg0:applyElementTransform()
	local f4_local0, f4_local1 = ProjectRootCoordinate( f4_arg1.rootName, f4_arg1.x, f4_arg1.y )
	f0_local9( f4_arg0, {
		controller = f4_arg1.controller,
		root = f4_arg1.root,
		x = f4_local0,
		y = f4_local1
	} )
	f4_arg0:undoElementTransform()
end

local f0_local11 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg1.rightStickYaw or 0
	local f5_local1 = f5_arg1.rightStickPitch or 0
	if f5_arg0._type == LUI.UIModelRotationArea.Types.Weapon then
		f0_local8( f5_arg0, f5_local0, f5_local1 )
	elseif f5_arg0._type == LUI.UIModelRotationArea.Types.Character then
		f5_arg0._rotationInput = f5_local0
		if f5_arg0._rotationInput < 0.1 and f5_arg0._rotationInput > -0.1 then
			f5_arg0._rotationInput = 0
		end
	end
	return true
end

local f0_local12 = function ( f6_arg0, f6_arg1 )
	if f6_arg0._modelIndex then
		f6_arg0._rotating = true
		f6_arg0._initialX = f6_arg1.x
		f6_arg0._initialY = f6_arg1.y
	end
end

local f0_local13 = function ( f7_arg0, f7_arg1 )
	f7_arg0._rotating = false
	f7_arg0._initialX = nil
	f7_arg0._initialY = nil
end

local f0_local14 = function ( f8_arg0 )
	if f8_arg0._modelIndex then
		if f8_arg0._type == LUI.UIModelRotationArea.Types.Weapon then
			ClientWeapon.SetWeaponRotationGoal( f8_arg0._modelIndex, 0, 0, 0 )
		else
			ClientCharacter.SetCharacterRotation( f8_arg0._modelIndex, 0, 0, 0 )
		end
	end
	f8_arg0._currentYaw = 0
end

local f0_local15 = function ( f9_arg0, f9_arg1 )
	local f9_local0 = f9_arg0._currentYaw + f0_local6 * f9_arg0._rotationInput
	ClientCharacter.SetCharacterRotation( f9_arg0._modelIndex, 0, f9_local0, 0 )
	f9_arg0._currentYaw = f9_local0
end

local f0_local16 = function ( f10_arg0, f10_arg1 )
	f0_local13( f10_arg0, f10_arg1 )
end

local f0_local17 = function ( f11_arg0 )
	f0_local14( f11_arg0 )
	f0_local13( f11_arg0, nil )
end

LUI.UIModelRotationArea.SetModelIndex = function ( f12_arg0, f12_arg1 )
	assert( type( f12_arg1 ) == "number" )
	f12_arg0._modelIndex = f12_arg1
	f0_local14( f12_arg0 )
end

LUI.UIModelRotationArea.init = function ( f13_arg0, f13_arg1 )
	LUI.UIModelRotationArea.super.init( f13_arg0, f13_arg1 )
	assert( f13_arg1 )
	assert( f13_arg1.type )
	f13_arg0._type = f13_arg1.type
	f13_arg0.Reset = f0_local17
	if Engine.IsGamepadEnabled() == 1 then
		f13_arg0._rotationInput = 0
		f13_arg0._currentYaw = 0
		f13_arg0:registerEventHandler( "gamepad_sticks", f0_local11 )
		if f13_arg0._type == LUI.UIModelRotationArea.Types.Character then
			local self = LUI.UITimer.new( nil, {
				interval = 15,
				event = "tick"
			} )
			self.id = "UIModelRotationAreaTimer"
			f13_arg0:addElement( self )
			f13_arg0:registerEventHandler( "tick", f0_local15 )
		end
	else
		f13_arg0:SetHandleMouse( true )
		f13_arg0:registerEventHandler( "rightmousedown", f0_local12 )
		f13_arg0:registerEventHandler( "rightmouseup", f0_local16 )
		f13_arg0:addEventHandler( "popup_active", f0_local16 )
		f13_arg0:addEventHandler( "mousemove", f0_local10 )
	end
end

