LUI = {
	roots = {},
	DIRECTION = {
		horizontal = 0,
		vertical = 1
	},
	Alignment = {
		None = 0,
		Left = 1,
		Center = 2,
		Right = 3,
		Top = 4,
		Middle = 5,
		Bottom = 6
	},
	ActiveScoped = nil,
	EASING = {
		linear = 0,
		inQuadratic = 1,
		outQuadratic = 2,
		inOutQuadratic = 3,
		inCubic = 4,
		outCubic = 5,
		inOutCubic = 6,
		inQuartic = 7,
		outQuartic = 8,
		inOutQuartic = 9,
		inQuintic = 10,
		outQuintic = 11,
		inOutQuintic = 12,
		inSine = 13,
		outSine = 14,
		inOutSine = 15,
		inBack = 16,
		outBack = 17,
		inOutBack = 18
	}
}
if not Engine.IsDevelopmentBuild() then
	function print()
		
	end
	
	function printf()
		
	end
	
end
LUI.CachedEvents = {
	run_frame = {
		name = "run_frame",
		immediate = true
	},
	transition_complete = {
		name = "transistion_complete_default",
		lateness = 0
	},
	gamepad_button = {
		name = "gamepad_button",
		controller = 0,
		button = "primary",
		down = true,
		immediate = true
	}
}
function LockTable( f3_arg0 )
	local f3_local0 = getmetatable( f3_arg0 )
	if not f3_local0 then
		f3_local0 = {}
		setmetatable( f3_arg0, f3_local0 )
	end
	f3_local0.__newindex = function ( f4_arg0, f4_arg1, f4_arg2 )
		error( "LUI Error: Tried to create module variable " .. f4_arg1, 2 )
	end
	
end

if nil ~= hpairs then
	pairs = hpairs
end
function split( f5_arg0, f5_arg1 )
	local f5_local0 = {}
	string.gsub( f5_arg0, "([^" .. f5_arg1 .. "]+)", function ( f6_arg0 )
		f5_local0[#f5_local0 + 1] = f6_arg0
	end )
	return f5_local0
end

function GetSwatchIntColor( f7_arg0, f7_arg1 )
	local f7_local0 = _G.SWATCHES
	local f7_local1 = split( f7_arg1, "." )
	for f7_local2 = 1, #f7_local1, 1 do
		f7_local0 = f7_local0[f7_local1[f7_local2]]
		if f7_local0 == nil then
			return false
		end
	end
	if f7_local0.r and f7_local0.g and f7_local0.b then
		return GetIntForColor( f7_local0 )
	end
	return false
end

LUI.ShallowCopy = function ( f8_arg0 )
	assert( f8_arg0 )
	assert( type( f8_arg0 ) == "table" )
	local f8_local0 = {}
	for f8_local4, f8_local5 in pairs( f8_arg0 ) do
		f8_local0[f8_local4] = f8_local5
	end
	return f8_local0
end

LUI.ConcatenateToTable = function ( f9_arg0, f9_arg1 )
	assert( f9_arg0 )
	assert( f9_arg1 )
	assert( type( f9_arg0 ) == "table" )
	assert( type( f9_arg1 ) == "table" )
	if f9_arg1 == nil then
		return 
	end
	for f9_local3, f9_local4 in ipairs( f9_arg1 ) do
		table.insert( f9_arg0, f9_local4 )
	end
end

LUI.RemoveSingleItemFromArray = function ( f10_arg0, f10_arg1 )
	for f10_local0 = 1, #f10_arg0, 1 do
		if f10_arg0[f10_local0] == f10_arg1 then
			table.remove( f10_arg0, f10_local0 )
			break
		end
	end
end

LUI.IsItemInArray = function ( f11_arg0, f11_arg1 )
	for f11_local0 = 1, #f11_arg0, 1 do
		if f11_arg0[f11_local0] == f11_arg1 then
			return true
		end
	end
	return false
end

LUI.ReverseTable = function ( f12_arg0 )
	assert( f12_arg0 )
	assert( type( f12_arg0 ) == "table" )
	local f12_local0 = #f12_arg0
	local f12_local1 = {}
	for f12_local5, f12_local6 in ipairs( f12_arg0 ) do
		f12_local1[f12_local0 - f12_local5 + 1] = f12_local6
	end
	return f12_local1
end

LUI.clamp = function ( f13_arg0, f13_arg1, f13_arg2 )
	if f13_arg0 < f13_arg1 then
		return f13_arg1
	elseif f13_arg2 < f13_arg0 then
		return f13_arg2
	else
		return f13_arg0
	end
end

LUI.Lerp = function ( f14_arg0, f14_arg1, f14_arg2 )
	return f14_arg0 + f14_arg2 * (f14_arg1 - f14_arg0)
end

LUI.Split = function ( f15_arg0, f15_arg1 )
	local f15_local0 = {}
	f15_arg0:gsub( string.format( "([^%s]+)", f15_arg1 ), function ( f16_arg0 )
		table.insert( f15_local0, f16_arg0 )
	end )
	return f15_local0
end

LUI.FormatAnimStateFinishEvent = function ( f17_arg0 )
	return "transition_complete_" .. f17_arg0
end

LUI.MakeFlyOverAnimationState = function ( f18_arg0, f18_arg1 )
	assert( f18_arg0 )
	assert( f18_arg1 )
	local f18_local0, f18_local1, f18_local2, f18_local3 = f18_arg0:getCurrentGlobalRect()
	local f18_local4, f18_local5, f18_local6, f18_local7 = f18_arg1:getCurrentGlobalRect()
	local f18_local8 = f18_local4 - f18_local0
	local f18_local9 = f18_local6 - f18_local2
	local f18_local10 = f18_local5 - f18_local1
	local f18_local11 = f18_local7 - f18_local3
	local f18_local12, f18_local13, f18_local14, f18_local15 = f18_arg0:getLocalRect()
	local f18_local16, f18_local17, f18_local18, f18_local19 = f18_arg0:GetAnchorData()
	return {
		topAnchor = f18_local17,
		bottomAnchor = f18_local19,
		leftAnchor = f18_local16,
		rightAnchor = f18_local18,
		top = f18_local13 + f18_local10,
		bottom = f18_local15 + f18_local11,
		left = f18_local12 + f18_local8,
		right = f18_local14 + f18_local9
	}
end

LUI.Round = function ( f19_arg0, f19_arg1 )
	local f19_local0 = 10 ^ (f19_arg1 or 0)
	return math.floor( f19_arg0 * f19_local0 + 0.5 ) / f19_local0
end

function IsMouseEvent( f20_arg0 )
	local f20_local0
	if f20_arg0 ~= "mousemove" and f20_arg0 ~= "mousedown" and f20_arg0 ~= "mouseup" then
		f20_local0 = false
	else
		f20_local0 = true
	end
	return f20_local0
end

function IsInputEvent( f21_arg0 )
	local f21_local0
	if f21_arg0 ~= "mousemove" and f21_arg0 ~= "mousedown" and f21_arg0 ~= "mouseup" and f21_arg0 ~= "gamepad_button" and f21_arg0 ~= "gamepad_sticks" then
		f21_local0 = false
	else
		f21_local0 = true
	end
	return f21_local0
end

LargestElements = {}
LargestElementsSize = {}
LargestElementsCount = {}
function LUITestFunction()
	DebugPrint( "Running LUITestFunction()" )
end

function CountTableKeys( f23_arg0 )
	assert( f23_arg0 )
	assert( type( f23_arg0 ) == "table" )
	local f23_local0 = 0
	for f23_local4, f23_local5 in pairs( f23_arg0 ) do
		f23_local0 = f23_local0 + 1
	end
	return f23_local0
end

function CountFieldsHelper( f24_arg0, f24_arg1 )
	assert( f24_arg0 )
	assert( type( f24_arg0 ) == "table" )
	if f24_arg1[f24_arg0] then
		return 
	end
	f24_arg1[f24_arg0] = true
	local f24_local0 = 0
	for f24_local4, f24_local5 in pairs( f24_arg0 ) do
		if type( f24_local4 ) == "table" then
			f24_local0 = f24_local0 + CountFieldsHelper( f24_local4, f24_arg1 )
		end
		f24_local0 = f24_local0 + 1
	end
	return f24_local0
end

function CountFields( f25_arg0 )
	return CountFieldsHelper( f25_arg0, {} )
end

function CountReferencesHelper( f26_arg0, f26_arg1 )
	if f26_arg1[f26_arg0] then
		return 
	end
	f26_arg1[f26_arg0] = true
	if type( f26_arg0 ) == "userdata" then
		local f26_local0 = getmetatable( f26_arg0 )
		if not f26_local0 then
			return 
		end
		f26_arg0 = f26_local0.__index
		if not f26_arg0 then
			return 
		elseif type( f26_arg0 ) == "table" and f26_arg0.id then
			local f26_local1 = CountFields( f26_arg0 )
			if not LargestElementsSize[f26_arg0.id] or LargestElementsSize[f26_arg0.id] < f26_local1 then
				LargestElements[f26_arg0.id] = f26_arg0
				LargestElementsSize[f26_arg0.id] = f26_local1
			end
			if not LargestElementsCount[f26_arg0.id] then
				LargestElementsCount[f26_arg0.id] = 0
			end
			LargestElementsCount[f26_arg0.id] = LargestElementsCount[f26_arg0.id] + 1
		end
	end
	if type( f26_arg0 ) ~= "table" then
		return 
	end
	for f26_local3, f26_local4 in pairs( f26_arg0 ) do
		CountReferencesHelper( f26_local4, f26_arg1 )
	end
end

function CountReferences( f27_arg0 )
	local f27_local0 = {
		[f27_arg0] = true
	}
	if type( f27_arg0 ) == "userdata" then
		local f27_local1 = getmetatable( f27_arg0 )
		if not f27_local1 then
			return 0
		end
		f27_arg0 = f27_local1.__index
		if not f27_arg0 then
			return 0
		end
	end
	if type( f27_arg0 ) ~= "table" then
		return 0
	end
	for f27_local4, f27_local5 in pairs( f27_arg0 ) do
		CountReferencesHelper( f27_local5, f27_local0 )
	end
	f27_local1 = 0
	for f27_local5, f27_local6 in pairs( f27_local0 ) do
		f27_local1 = f27_local1 + 1
	end
	return f27_local1
end

function GetIntForColor( f28_arg0 )
	return BitShiftLeft( math.floor( 255 * f28_arg0.r ), 16 ) + BitShiftLeft( math.floor( 255 * f28_arg0.g ), 8 ) + math.floor( 255 * f28_arg0.b )
end

function GetColorTableFromIntColor( f29_arg0 )
	local f29_local0 = {
		r = math.floor( BitShiftRight( f29_arg0, 16 ) ),
		g = 0,
		b = 0
	}
	local f29_local1 = BitShiftLeft( f29_local0.r, 16 )
	f29_local0.g = math.floor( BitShiftRight( f29_arg0 - f29_local1, 8 ) )
	local f29_local2 = BitShiftLeft( f29_local0.g, 8 )
	f29_local0.b = f29_arg0 - f29_local1
	f29_local0.b = f29_local0.b - f29_local2
	f29_local0.r = f29_local0.r / 255
	f29_local0.g = f29_local0.g / 255
	f29_local0.b = f29_local0.b / 255
	return f29_local0
end

