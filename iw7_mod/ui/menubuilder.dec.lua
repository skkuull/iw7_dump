local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function Property( f1_arg0 )
	local f1_local0 = {}
	assert( f1_arg0, "No property name given" )
	f1_local0.propName = f1_arg0
	f1_local0.isProperty = true
	f1_local0.func = function ( f2_arg0 )
		assert( f2_arg0[f1_local0.propName] ~= nil, "Could not find property named " .. f1_local0.propName )
		return f2_arg0[f1_local0.propName]
	end
	
	return f1_local0
end

function HalfProperty( f3_arg0 )
	local f3_local0 = {}
	assert( f3_arg0, "No property name given" )
	f3_local0.propName = f3_arg0
	f3_local0.isProperty = true
	f3_local0.func = function ( f4_arg0 )
		assert( f4_arg0[f3_local0.propName] ~= nil, "Could not find property named " .. f3_local0.propName )
		if type( f4_arg0[f3_local0.propName] ) == "number" then
			return 0.5 * f4_arg0[f3_local0.propName]
		else
			assert( false, "Property " .. f3_local0.propName .. " should be a number for use with the HalfProperty helper" )
		end
	end
	
	return f3_local0
end

function HalfOppositeProperty( f5_arg0 )
	local f5_local0 = {}
	assert( f5_arg0, "No property name given" )
	f5_local0.propName = f5_arg0
	f5_local0.isProperty = true
	f5_local0.func = function ( f6_arg0 )
		assert( f6_arg0[f5_local0.propName] ~= nil, "Could not find property named " .. f5_local0.propName )
		if type( f6_arg0[f5_local0.propName] ) == "number" then
			return -0.5 * f6_arg0[f5_local0.propName]
		else
			assert( false, "Property " .. f5_local0.propName .. " should be a number for use with the HalfOppositeProperty helper" )
		end
	end
	
	return f5_local0
end

function RunPropertyFunc( f7_arg0 )
	return function ( f8_arg0, f8_arg1 )
		if f8_arg0.properties[f7_arg0] and type( f8_arg0.properties[f7_arg0] ) == "function" then
			f8_arg0.properties[f7_arg0]( f8_arg0, f8_arg1 )
		end
	end
	
end

function ParentProperty( f9_arg0 )
	local f9_local0 = f9_arg0
	return function ( f10_arg0, f10_arg1 )
		assert( f10_arg1, "ParentProperty can only be included inside the property section" )
		return f10_arg1[f9_local0]
	end
	
end

function BaseState( f11_arg0, f11_arg1 )
	local f11_local0 = f11_arg0
	local f11_local1 = f11_arg1
	if not f11_local1 then
		f11_local1 = {}
	end
	return function ( f12_arg0 )
		assert( f12_arg0 )
		assert( f12_arg0.states )
		assert( f12_arg0.states[f11_local0], "Could not find base state " .. f11_local0 )
		assert( type( f12_arg0.states[f11_local0] ) == "table", "Must only use BaseState on non-derived states! state = " .. f11_local0 )
		local f12_local0 = {}
		for f12_local4, f12_local5 in pairs( f12_arg0.states[f11_local0] ) do
			f12_local0[f12_local4] = f12_local5
		end
		for f12_local4, f12_local5 in pairs( f11_local1 ) do
			f12_local0[f12_local4] = f12_local5
		end
		return f12_local0
	end
	
end

function OpenMenu( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
	local f13_local0 = f13_arg0
	local f13_local1 = f13_arg1
	local f13_local2 = f13_arg2
	local f13_local3 = f13_arg3
	return function ( f14_arg0, f14_arg1 )
		LUI.FlowManager.RequestAddMenu( f13_local0, f13_local1, f14_arg1.controller, f13_local2, f13_local3 )
	end
	
end

function PopupMenu( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
	local f15_local0 = f15_arg0
	local f15_local1 = f15_arg1
	local f15_local2 = f15_arg2
	local f15_local3 = f15_arg3
	return function ( f16_arg0, f16_arg1 )
		LUI.FlowManager.RequestPopupMenu( f16_arg0, f15_local0, f15_local1, f16_arg1.controller, f15_local2, f15_local3 )
	end
	
end

function LeaveMenu()
	return function ( f18_arg0, f18_arg1 )
		LUI.FlowManager.RequestLeaveMenu( f18_arg0 )
	end
	
end

function RestoreMenu( f19_arg0, f19_arg1, f19_arg2 )
	return function ( f20_arg0, f20_arg1 )
		LUI.FlowManager.RequestRestoreMenu( f19_arg0, f19_arg1, f20_arg1.controller, f19_arg2 )
	end
	
end

function CloseAllMenus()
	return function ( f22_arg0, f22_arg1 )
		LUI.FlowManager.RequestCloseAllMenus()
	end
	
end

function EmitEvent( f23_arg0 )
	local f23_local0 = f23_arg0
	if type( f23_local0 ) == "string" then
		f23_local0 = {
			name = f23_local0
		}
	end
	return function ( f24_arg0, f24_arg1 )
		f24_arg0:processEvent( f23_local0 )
	end
	
end

function EmitEventToParent( f25_arg0, f25_arg1 )
	local f25_local0
	if f25_arg1 then
		f25_local0 = f25_arg1.saveOriginal
		if not f25_local0 then
		
		else
			local f25_local1 = f25_arg0
			if not f25_local0 and type( f25_local1 ) == "string" then
				f25_local1 = {
					name = f25_local1
				}
			end
			return function ( f26_arg0, f26_arg1 )
				if f25_local0 then
					local f26_local0 = {}
					if type( f25_local1 ) == "string" then
						f26_local0.name = f25_local1
					else
						for f26_local4, f26_local5 in pairs( f25_local1 ) do
							f26_local0[f26_local4] = f26_local5
						end
					end
					f26_local0.original = f26_arg1
					return f26_arg0:dispatchEventToParent( f26_local0 )
				else
					return f26_arg0:dispatchEventToParent( f25_local1 )
				end
			end
			
		end
	end
	f25_local0 = false
end

function EmitEventToRoot( f27_arg0 )
	local f27_local0 = f27_arg0
	if type( f27_local0 ) == "string" then
		f27_local0 = {
			name = f27_local0
		}
	end
	return function ( f28_arg0, f28_arg1 )
		f28_arg0:dispatchEventToRoot( f27_local0 )
	end
	
end

function EmitOmnvarUpdateEventToRoot( f29_arg0 )
	return function ( f30_arg0 )
		f30_arg0:dispatchEventToRoot( {
			name = "omnvar_update",
			omnvar = f29_arg0,
			value = Game.GetOmnvar( f29_arg0 )
		} )
	end
	
end

f0_local0 = function ( f31_arg0, f31_arg1 )
	local f31_local0 = type( f31_arg0 )
	if f31_local0 == "function" then
		assert( f31_arg1.properties, "Item built that didn't get it's properties set!" )
		DebugPrint( "defaultDuration is " .. f31_arg0( f31_arg1.properties ) )
		return f31_arg0( f31_arg1.properties )
	elseif f31_local0 == "table" and f31_arg0.isProperty then
		assert( f31_arg1.properties, "Item built that didn't get it's properties set!" )
		DebugPrint( "defaultDuration is " .. f31_arg0.func( f31_arg1.properties ) )
		return f31_arg0.func( f31_arg1.properties )
	else
		return f31_arg0
	end
end

function AnimateToStateWithEvent( f32_arg0, f32_arg1, f32_arg2, f32_arg3 )
	local f32_local0 = f32_arg0
	local f32_local1 = f32_arg1
	local f32_local2 = f32_arg2
	local f32_local3 = f32_arg3
	return function ( f33_arg0, f33_arg1 )
		local f33_local0 = f0_local0( f32_local1, f33_arg0 )
		local f33_local1 = f0_local0( f32_local2, f33_arg0 )
		local f33_local2 = f0_local0( f32_local3, f33_arg0 )
		if f33_arg0:hasAnimationState( f32_local0 ) then
			if Engine.GetDvarBool( "lui_print_anim_states" ) then
				local f33_local3 = "None"
				if f33_arg0.id ~= nil then
					f33_local3 = f33_arg0.id
				end
				DebugPrint( "LUI: AnimateToStateWithEvent: id: " .. f33_local3 .. " state: " .. f32_local0 )
			end
			f33_arg0:animateToState( f32_local0, f33_local0, f33_local1, f33_local2 )
		end
	end
	
end

function AnimateToState( f34_arg0, f34_arg1, f34_arg2, f34_arg3 )
	local f34_local0 = f34_arg0
	local f34_local1 = f34_arg1
	local f34_local2 = f34_arg2
	local f34_local3 = f34_arg3
	return function ( f35_arg0, f35_arg1 )
		f35_arg0:registerEventHandler( LUI.FormatAnimStateFinishEvent( f34_local0 ), nil )
		local f35_local0 = f0_local0( f34_local1, f35_arg0 )
		local f35_local1 = f0_local0( f34_local2, f35_arg0 )
		local f35_local2 = f0_local0( f34_local3, f35_arg0 )
		if f35_arg0:hasAnimationState( f34_local0 ) then
			if Engine.GetDvarBool( "lui_print_anim_states" ) then
				local f35_local3 = "None"
				if f35_arg0.id ~= nil then
					f35_local3 = f35_arg0.id
				end
				DebugPrint( "LUI: AnimateToState: id: " .. f35_local3 .. " state: " .. f34_local0 )
			end
			f35_arg0:animateToState( f34_local0, f35_local0, f35_local1, f35_local2 )
		end
	end
	
end

f0_local1 = function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3, f36_arg4 )
	local f36_local0 = f36_arg0
	local f36_local1 = 2
	local f36_local2 = f36_arg1
	local f36_local3 = f36_arg2
	local f36_local4 = f36_arg3
	return function ( f37_arg0, f37_arg1 )
		if #f36_local0 < f36_local1 then
			f36_local1 = 1
			if not f36_local3 then
				return 
			end
		end
		local f37_local0 = f36_local0[f36_local1]
		f37_arg0:registerEventHandler( f37_arg1.name, nil )
		if f36_local2 and not f37_arg0:isInFocus() and not f37_arg0:isParentInFocus() then
			return 
		elseif f37_arg1.interrupted then
			if Engine.GetDvarBool( "lui_print_anim_states" ) then
				local f37_local1 = "None"
				if f37_arg0.id ~= nil then
					f37_local1 = f37_arg0.id
				end
				DebugPrint( "LUI: Animation to state '" .. f37_local0[1] .. "' interrupted! id: " .. f37_local1 )
			end
			return 
		end
		local f37_local1 = LUI.FormatAnimStateFinishEvent( f37_local0[1] )
		f37_arg0:animateToState( f37_local0[1], f37_local0[2], f37_local0[3], f37_local0[4] )
		if f36_local3 or f36_local1 ~= #f36_local0 and not f36_local3 then
			f37_arg0:registerEventHandler( f37_local1, REG10 )
		end
		if f36_local1 == #f36_local0 and not f36_local3 and f36_local4 then
			f37_arg0:registerEventHandler( f37_local1, function ( element, event )
				element:close()
			end )
		end
		if f36_local1 == #f36_local0 and not f36_local3 and not f36_local4 and f36_arg4 then
			f37_arg0:registerEventHandler( f37_local1, function ( element, event )
				f36_arg4()
			end )
		end
		f36_local1 = f36_local1 + 1
	end
	
end

function AnimateLoop( f40_arg0, f40_arg1 )
	return AnimateSequenceInternal( f40_arg0, f40_arg1, true, false, false )
end

function AnimateSequence( f41_arg0 )
	return AnimateSequenceInternal( f41_arg0, false, false, false, false )
end

function AnimateSequenceAndClose( f42_arg0 )
	return AnimateSequenceInternal( f42_arg0, false, false, true, nil )
end

function AnimateSequenceAndCallback( f43_arg0, f43_arg1 )
	return AnimateSequenceInternal( f43_arg0, false, false, false, f43_arg1 )
end

function AnimateSequenceInternal( f44_arg0, f44_arg1, f44_arg2, f44_arg3, f44_arg4 )
	local f44_local0 = f44_arg0
	local f44_local1 = f44_arg1
	local f44_local2 = f44_arg2
	local f44_local3 = f44_arg3
	local f44_local4 = f44_arg4
	return function ( f45_arg0, f45_arg1 )
		local f45_local0 = Engine.GetDvarBool( "lui_print_anim_states" )
		if f45_local0 then
			local f45_local1 = "None"
			if f45_arg0.id ~= nil then
				f45_local1 = f45_arg0.id
			end
			DebugPrint( "LUI: AnimateSequence: id: " .. f45_local1 )
		end
		if f45_local0 or f44_local3 then
			for f45_local4, f45_local5 in ipairs( f44_local0 ) do
				if f45_local0 then
					DebugPrint( "\t->" .. f45_local5[1] )
				end
				if f44_local3 then
					f45_arg0:registerEventHandler( LUI.FormatAnimStateFinishEvent( f45_local5[1] ), nil )
				end
			end
		end
		local f45_local1 = assert
		local f45_local2 = f44_local0
		if f45_local2 then
			f45_local2 = #f44_local0 ~= 0
		end
		f45_local1( f45_local2, "AnimateSequence does not have animation states!" )
		f45_local1 = f44_local0[1]
		f45_local2 = f44_local0[#f44_local0]
		local f45_local3 = LUI.FormatAnimStateFinishEvent( f45_local1[1] )
		if #f44_local0 == 1 then
			DebugPrint( "LUI Warning: AnimateSequence only has one animation state! " .. f44_local0[1][1] )
		else
			f45_arg0:registerEventHandler( f45_local3, f0_local1( f44_local0, f44_local1, f44_local2, f44_local3, f44_local4 ) )
		end
		f45_arg0:animateToState( f45_local1[1], f45_local1[2], f45_local1[3], f45_local1[4] )
	end
	
end

function DoMultiple( f46_arg0 )
	local f46_local0 = f46_arg0
	return function ( f47_arg0, f47_arg1 )
		for f47_local3, f47_local4 in ipairs( f46_local0 ) do
			assert( type( f47_local4 ) == "function" )
			f47_local4( f47_arg0, f47_arg1 )
		end
	end
	
end

helpers = {
	Property = Property,
	HalfProperty = HalfProperty,
	HalfOppositeProperty = HalfOppositeProperty,
	RunPropertyFunc = RunPropertyFunc,
	BaseState = BaseState,
	AnimateToState = AnimateToState,
	AnimateToStateWithEvent = AnimateToStateWithEvent,
	DoMultiple = DoMultiple,
	AnimateLoop = AnimateLoop,
	AnimateSequence = AnimateSequence,
	ParentProperty = ParentProperty,
	OpenMenu = OpenMenu,
	PopupMenu = PopupMenu,
	LeaveMenu = LeaveMenu,
	RestoreMenu = RestoreMenu,
	CloseAllMenus = CloseAllMenus,
	EmitEvent = EmitEvent,
	EmitEventToParent = EmitEventToParent,
	EmitEventToRoot = EmitEventToRoot,
	EmitOmnvarUpdateEventToRoot = EmitOmnvarUpdateEventToRoot,
	AnimateSequenceAndClose = AnimateSequenceAndClose,
	AnimateSequenceAndCallback = AnimateSequenceAndCallback
}
f0_local2 = function ( menu, controller )
	local self = LUI.UIElement.new()
	self:setUseStencil( true )
	return self
end

local f0_local3 = function ( f49_arg0, f49_arg1 )
	if not LUI.UIElement.setupCompass then
		return LUI.UIImage.new( f49_arg0, f49_arg1 )
	else
		local self = LUI.UIElement.new()
		self:setupCompass( 0.85 )
		return self
	end
end

local f0_local4 = function ( menu, controller )
	local self = LUI.UIText.new()
	self:setupUIBindText( controller.dataSource, controller.textFormat, controller.param1 or 0 )
	return self
end

local f0_local5 = function ( menu, controller )
	local self = LUI.UIImage.new()
	self:setupUIBindImage( controller.dataSource, controller.param1 or 0 )
	return self
end

local f0_local6 = function ( menu, controller )
	local self = LUI.UIElement.new()
	self:setupUIIntWatch( controller.dataSource, controller.param1 or 0 )
	return self
end

local f0_local7 = function ( menu, controller )
	local self = LUI.UIElement.new()
	self:setupUIScorebar( controller.dataSource )
	self.m_maxWidth = controller.maxWidth
	self.m_maxScore = controller.maxScore
	return self
end

local f0_local8 = function ( menu, controller )
	local self = LUI.UIElement.new()
	self:setupWorldBlur()
	return self
end

function buildOwnerDraw( menu, controller )
	local self = LUI.UIElement.new()
	self:setupOwnerdraw( controller.ownerDraw, controller.ownerDrawTextScale, controller.ownerDrawTextStyle )
	return self
end

function buildTextEdit( menu, controller )
	local self = LUI.UIElement.new()
	self:setupTextEdit( controller.max_length, controller.password_field, controller.use_auto_align )
	if controller.use_auto_align then
		self:setUseStencil( true )
	end
	return self
end

m_types = {
	UIElement = LUI.UIElement.build,
	UIText = LUI.UIText.build,
	UIBindText = f0_local4,
	UIBindImage = f0_local5,
	UIIntWatch = f0_local6,
	UIImage = LUI.UIImage.build,
	UILitImage = LUI.UILitImage.build,
	UIButton = LUI.UIButton.build,
	UITimer = LUI.UITimer.build,
	UIStencil = f0_local2,
	UIVerticalList = LUI.UIVerticalList.build,
	UIVerticalScrollbar = LUI.UIVerticalScrollbar.build,
	UIHorizontalList = LUI.UIHorizontalList.build,
	UICountdown = LUI.UICountdown.build,
	UILongCountdown = LUI.UILongCountdown.build,
	UITechyDigits = LUI.UITechyDigits.build,
	UIBindButton = LUI.UIBindButton.build,
	UICompass = f0_local3,
	UIScorebar = f0_local7,
	UIWorldBlur = f0_local8,
	UIOwnerdraw = buildOwnerDraw,
	UITextEdit = buildTextEdit
}
m_definitions = {}
m_debugData = {
	requestedMenu = "",
	currentDef = {},
	definitionStack = {}
}
baseAssert = assert
local f0_local9 = function ( f57_arg0, f57_arg1 )
	m_debugData.currentDef = f57_arg0
	m_debugData.definitionStack[#m_debugData.definitionStack + 1] = {
		type = f57_arg0.type,
		id = f57_arg0.id,
		childNum = f57_arg1
	}
end

local f0_local10 = function ()
	m_debugData.definitionStack[#m_debugData.definitionStack] = nil
end

local f0_local11 = function ()
	for f59_local4, f59_local5 in ipairs( m_debugData.definitionStack ) do
		local f59_local3 = f59_local4 .. ") type: " .. f59_local5.type
		if f59_local5.id then
			f59_local3 = f59_local3 .. " id: " .. f59_local5.id
		end
		if f59_local5.childNum then
			f59_local3 = f59_local3 .. " childNum: " .. f59_local5.childNum
		end
		DebugPrint( f59_local3 )
	end
	DebugPrint( "Current itemDef: " )
	defPrint( m_debugData.currentDef )
end

local f0_local12 = function ( f60_arg0, f60_arg1, ... )
	if not f60_arg0 then
		if type( f60_arg1 ) == "string" then
			DebugPrint( "Error: " .. string.format( f60_arg1, ... ) )
		end
		DebugPrint( "Error Making Menu: " .. tostring( m_debugData.requestedMenu ) )
		f0_local11()
		baseAssert( f60_arg0, ... )
	end
end

function defPrint( f61_arg0, f61_arg1 )
	if not f61_arg1 then
		f61_arg1 = 0
	end
	for f61_local4, f61_local5 in pairs( f61_arg0 ) do
		local f61_local6 = string.rep( "  ", f61_arg1 ) .. f61_local4 .. ": "
		if type( f61_local5 ) == "table" then
			DebugPrint( f61_local6 )
			defPrint( f61_local5, f61_arg1 + 1 )
		else
			DebugPrint( f61_local6 .. tostring( f61_local5 ) )
		end
		local f61_local3 = getmetatable( f61_arg0 )
		if f61_local3 and f61_local3.__index then
			DebugPrint( f61_local6 .. "__index" )
			defPrint( f61_local3.__index, f61_arg1 + 1 )
		end
	end
end

assert = f0_local12
function registerDef( f62_arg0, f62_arg1 )
	assert( m_definitions[f62_arg0] == nil, "This type has already been registered! " .. f62_arg0 )
	assert( m_types[f62_arg0] == nil, "This type is a basic element type that has been registered! " .. f62_arg0 )
	assert( type( f62_arg1 ) == "function", "Attempting to register old style type definition!  See wiki for info on how to update your def.  def = " .. f62_arg0 )
	m_definitions[f62_arg0] = f62_arg1
end

function registerType( f63_arg0, f63_arg1 )
	assert( m_definitions[f63_arg0] == nil, "This type has already been registered! " .. f63_arg0 )
	assert( m_types[f63_arg0] == nil, "This type is a basic element type that has been registered! " .. f63_arg0 )
	assert( type( f63_arg1 ) == "function", "The buildFunction for this type is not a function!  typeName = " .. f63_arg0 )
	m_types[f63_arg0] = f63_arg1
end

g_keyWordList = hashset( {
	"properties",
	"children",
	"childrenFeeder",
	"states",
	"id",
	"type",
	"handlers"
} )
local f0_local13 = function ( f64_arg0 )
	if g_keyWordList[f64_arg0] then
		assert( false, "It appears that you are using the keyword '" .. f64_arg0 .. "' as a member name, are you sure this is set up correctly?" )
	end
end

validateName = f0_local13
f0_local13 = function ( f65_arg0, f65_arg1, f65_arg2 )
	local f65_local0 = type( f65_arg0 )
	if f65_local0 == "function" then
		return f0_local13( f65_arg0( f65_arg1, f65_arg2 ), f65_arg1, f65_arg2 )
	end
	assert( f65_local0 == "table", "Current state is not a table, did you forget {}?" )
	for f65_local5, f65_local6 in pairs( f65_arg0 ) do
		validateName( f65_local5 )
		if f65_arg1.type ~= "UIImage" and f65_arg1.type ~= "UILitImage" and f65_arg1.type ~= "UIScorebar" and f65_arg1.type ~= "UICompass" and f65_local5 == "material" then
			DebugPrint( "LUI Warning: It appears that you are assigning material as a state member in an element that is not of type UIImage, is this intentional?" )
		end
		local f65_local4 = type( f65_local6 )
		if f65_local4 == "function" then
			f65_arg0[f65_local5] = f65_local6( f65_arg2 )
		end
		if f65_local4 == "table" and f65_local6.isProperty then
			f65_arg0[f65_local5] = f65_local6.func( f65_arg2 )
		else
			f65_arg0[f65_local5] = f65_local6
		end
	end
	return f65_arg0
end

local f0_local14 = function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3 )
	if f66_arg1.states then
		assert( f66_arg1.states.default, "No default state provided for element definition" )
		for f66_local3, f66_local4 in pairs( f66_arg1.states ) do
			validateName( f66_local3 )
			f66_local4 = f0_local13( f66_local4, f66_arg1, f66_arg2 )
			if f66_arg1.debug or f66_arg2 and f66_arg2.debug then
				DebugPrint( "Printing out formatted state:" )
				defPrint( builtState )
			end
			f66_arg0:registerAnimationState( f66_local3, f66_local4 )
			if not (f66_local3 ~= "default" or f66_arg3) or f66_local4.animateOnRefresh then
				f66_arg0:animateToState( f66_local3 )
			end
		end
	end
end

function buildChildren( f67_arg0, f67_arg1, f67_arg2 )
	assert( not f67_arg2.type, "It appears that the children list is not a list but instead is a single element definition." )
	for f67_local3, f67_local4 in ipairs( f67_arg2 ) do
		local f67_local5 = buildItems( f67_local4, f67_arg1, f67_arg0, f67_local3 )
		f67_local5:close()
		f67_arg0:addElement( f67_local5 )
	end
end

local f0_local15 = function ( f68_arg0, f68_arg1 )
	if type( f68_arg0 ) == "table" and f68_arg0.isProperty then
		return f68_arg0.func( f68_arg1 )
	else
		return f68_arg0
	end
end

function buildItems( f69_arg0, f69_arg1, f69_arg2, f69_arg3 )
	assert( f69_arg0.type, "No type in itemDef!" )
	f0_local9( f69_arg0, f69_arg3 )
	Memory.CheckLow()
	if m_definitions[f69_arg0.type] then
		local f69_local0 = f69_arg0.type
		Engine.MeasureResourceEventStart( f69_local0, "widget" )
		local f69_local1 = nil
		if type( m_definitions[f69_arg0.type] ) == "function" then
			f69_local1 = m_definitions[f69_arg0.type]()
		else
			f69_local1 = m_definitions[f69_arg0.type]
		end
		f69_arg0.type = nil
		if not f69_local1.properties then
			f69_local1.properties = {}
		end
		if f69_arg0.properties and f69_local1.properties then
			for f69_local5, f69_local6 in pairs( f69_arg0.properties ) do
				validateName( f69_local5 )
				f69_local1.properties[f69_local5] = f69_local6
			end
			f69_arg0.properties = nil
		end
		for f69_local5, f69_local6 in pairs( f69_arg0 ) do
			f69_local1[f69_local5] = f69_local6
		end
		f69_local2 = buildItems( f69_local1, f69_arg1, f69_arg2 )
		if f69_local2 and f69_local2.properties then
			f69_local2.m_ownerController = f69_local2.properties.exclusiveController
		end
		Engine.MeasureResourceEventEnd( f69_local0, "widget" )
		f0_local10()
		return f69_local2
	else
		assert( m_types[f69_arg0.type], "Unknown type for element definition: " .. f69_arg0.type )
		local f69_local0 = f69_arg0.type
		Engine.MeasureResourceEventStart( f69_local0, "widget" )
		local f69_local1 = f69_arg0.properties or f69_arg1
		if f69_local1 then
			for f69_local5, f69_local6 in pairs( f69_local1 ) do
				validateName( f69_local5 )
				if type( f69_local6 ) == "table" and f69_local6.isProperty then
					f69_local1[f69_local5] = f69_local6.func( f69_arg1 )
				end
			end
		end
		local f69_local2 = nil
		local f69_local3 = true
		if f69_arg2 and f69_arg0.id then
			f69_local2 = f69_arg2:getChildById( f69_arg0.id )
		end
		if not f69_local2 then
			f69_local3 = false
			f69_local2 = m_types[f69_arg0.type]( f69_arg0, f69_local1, f69_arg3 )
		end
		f69_local2._marked = true
		f69_local2._fromMenuBuilder = true
		f69_local2._isRefresh = f69_local3
		if f69_arg1 and f69_arg1.exclusiveController then
			f69_local2.m_ownerController = f69_arg1.exclusiveController
			f69_local1.exclusiveController = f69_arg1.exclusiveController
		end
		if not (not f69_local1 or not f69_local1.debug) or f69_arg0.debug then
			DebugPrint( "Printing out item Props:" )
			defPrint( f69_local1 )
			DebugPrint( "Printing out item Def:" )
			defPrint( f69_arg0 )
			f69_local1.debug = nil
			f69_arg0.debug = nil
		end
		f69_local2.m_outsideParentList = f69_local2.m_outsideParentList or false
		f69_local2.m_requireFocusType = f69_arg0.requireFocusType
		if f69_local2.setText and f69_local1 and f69_local1.text then
			f69_local2:setText( f69_local1.text )
		end
		if f69_local2.setTextStyle and f69_local1 and f69_local1.textStyle then
			f69_local2:setTextStyle( f69_local1.textStyle )
		end
		local f69_local4 = f69_local2.disabled or false
		f69_local2.disabled = false
		if f69_arg0.disabledFunc then
			f69_local2.disabled = f69_arg0.disabledFunc( f69_local2, f69_local1 )
		end
		if f69_arg0.disabled then
			f69_local2.disabled = true
		end
		if f69_local4 ~= f69_local2.disabled then
			f69_local2.disabledStateChange = true
		else
			f69_local2.disabledStateChange = false
		end
		if f69_arg0.audio then
			if f69_local2.setGainFocusSFX and f69_arg0.audio.button_over then
				f69_local2:setGainFocusSFX( f69_arg0.audio.button_over )
			end
			if f69_local2.setActionSFX and f69_arg0.audio.button_action then
				f69_local2:setActionSFX( f69_arg0.audio.button_action )
			end
		end
		if f69_arg0.childrenFeeder then
			local f69_local5 = f69_arg0.childrenFeeder
			if type( f69_local5 ) == "table" and f69_local5.isProperty then
				f69_local5 = f69_arg0.childrenFeeder.func( f69_local1 )
			end
			assert( type( f69_local5 ) == "function", "Feeders must be a function or referenced by the MBh.Property helper" )
			f69_arg0.children = f69_local5( f69_local1 )
			f69_local2.childrenFeeder = f69_local5
			f69_local2:registerEventHandler( "menu_refresh", HandleMenuRefresh )
		end
		if f69_arg0.children then
			for f69_local8, f69_local9 in ipairs( f69_arg0.children ) do
				if f69_local9.disabledFunc then
					f69_local2:registerEventHandler( "menu_refresh", HandleMenuRefresh )
					f69_local2.children = f69_arg0.children
					break
				end
			end
		end
		if f69_arg0.id then
			f69_local2.id = f69_arg0.id
		end
		if f69_arg0.listDefaultFocus then
			f69_local2.listDefaultFocus = true
		end
		assert( not f69_arg0.additionalHandlers, "The additional_handlers must be specified inside the 'properties' tables, not in the main definition" )
		f0_local14( f69_local2, f69_arg0, f69_local1, f69_local3 )
		if f69_arg0.handlers then
			for f69_local8, f69_local9 in pairs( f69_arg0.handlers ) do
				if f69_local8 == "omnvar_update" then
					assert( type( f69_local9 ) == "table", "omnvar_update should be a table of handlers for specific omnvars" )
					local f69_local10 = f69_local2:getRootParent()
					f69_local10 = f69_local10.eventCatcher
					for f69_local14, f69_local15 in pairs( f69_local9 ) do
						f69_local10:registerOmnvarHandler( f69_local2, f69_local14, f0_local15( f69_local15, f69_local1 ) )
					end
				end
				f69_local2:registerEventHandler( f69_local8, f0_local15( f69_local9, f69_local1 ) )
			end
		else
			f69_arg0.handlers = {}
		end
		if f69_local1 and f69_local1.additional_handlers then
			assert( not f69_local1.additional_handlers.omnvar_update, "Omnvar_update events don't support being an 'additional_handler'" )
			for f69_local8, f69_local9 in pairs( f69_local1.additional_handlers ) do
				if not (not f69_local3 or not f69_arg0.handlers[f69_local8]) or not f69_local3 then
					f69_local2:addEventHandler( f69_local8, f69_local9 )
				end
			end
			f69_local1.additional_handlers = nil
		end
		f69_local2.properties = f69_local1
		if f69_arg0.children then
			buildChildren( f69_local2, f69_local1, f69_arg0.children )
		end
		if f69_local2.disabledStateChange then
			if f69_local2.disabled then
				f69_local2:processEvent( {
					name = "disable"
				} )
			else
				f69_local2:processEvent( {
					name = "enable"
				} )
			end
		end
		if f69_arg0.isSignInMenu then
			f69_local2.isSignInMenu = f69_arg0.isSignInMenu
		end
		Engine.MeasureResourceEventEnd( f69_local0, "widget" )
		f0_local10()
		return f69_local2
	end
end

function buildMenu( f70_arg0, f70_arg1 )
	m_debugData.requestedMenu = f70_arg0
	m_debugData.definitionStack = {}
	if not f70_arg1 then
		f70_arg1 = {}
	end
	local f70_local0 = buildItems( {
		type = f70_arg0,
		properties = f70_arg1
	}, {}, nil )
	m_debugData.requestedMenu = nil
	m_debugData.definitionStack = {}
	m_debugData.currentDef = {}
	return f70_local0
end

function unmarkChildren( f71_arg0 )
	local f71_local0 = f71_arg0:getFirstChild()
	while f71_local0 ~= nil do
		local f71_local1 = f71_local0:getNextSibling()
		f71_local0._marked = false
		unmarkChildren( f71_local0 )
		f71_local0 = f71_local1
	end
end

function closeUnmarkedChildren( f72_arg0 )
	local f72_local0 = f72_arg0:getFirstChild()
	while f72_local0 ~= nil do
		local f72_local1 = f72_local0:getNextSibling()
		if f72_local0._fromMenuBuilder and not f72_local0._marked then
			f72_local0:close()
		else
			closeUnmarkedChildren( f72_local0 )
		end
		f72_local0 = f72_local1
	end
end

function HandleMenuRefresh( f73_arg0, f73_arg1 )
	unmarkChildren( f73_arg0 )
	local f73_local0 = f73_arg0.children
	if f73_arg0.childrenFeeder then
		f73_local0 = f73_arg0.childrenFeeder( f73_arg0.properties )
	end
	local f73_local1 = f73_arg0:getAllFocusedChildren()
	if #f73_local1 > 0 then
		f73_arg0:saveState()
	end
	m_debugData.requestedMenu = "menuRefreshEvent"
	m_debugData.definitionStack = {}
	buildChildren( f73_arg0, f73_arg0.properties, f73_local0 )
	m_debugData.requestedMenu = nil
	m_debugData.definitionStack = {}
	m_debugData.currentDef = {}
	closeUnmarkedChildren( f73_arg0 )
	if #f73_local1 > 0 then
		local f73_local2, f73_local3 = f73_arg0:restoreState( nil, nil, true )
		if f73_local3 == 0 then
			f73_arg0:clearSavedState()
			f73_arg0:processEvent( {
				name = "gain_focus"
			} )
		end
	end
	f73_arg0:processEvent( {
		name = "element_refresh",
		dispatchChildren = true
	} )
end

function BuildAddChild( f74_arg0, f74_arg1 )
	local f74_local0 = nil
	if type( f74_arg1 ) == "table" then
		f74_local0 = buildItems( f74_arg1, f74_arg0.properties, f74_arg0 )
	else
		f74_local0 = f74_arg1
	end
	m_debugData.requestedMenu = nil
	m_debugData.definitionStack = {}
	m_debugData.currentDef = {}
	f74_arg0:addElement( f74_local0 )
	return f74_local0
end

function BuildRegisteredType( f75_arg0, f75_arg1 )
	assert( type( f75_arg0 ) == "string" )
	assert( m_types[f75_arg0], "Could not find a constructor for " .. f75_arg0 .. "." .. (m_definitions[f75_arg0] and " Use 'MenuBuilder.BuildAddChild' to build elements registered using the deprecated MenuBuilder" or "") )
	Engine.MeasureResourceEventStart( f75_arg0, "widget" )
	local f75_local0 = m_types[f75_arg0]( nil, f75_arg1 )
	Engine.MeasureResourceEventEnd( f75_arg0, "widget" )
	return f75_local0
end

function AnimStateBasedOn( f76_arg0, f76_arg1 )
	return setmetatable( f76_arg1, {
		__index = f76_arg0
	} )
end

function IsTypeRegistered( f77_arg0 )
	assert( type( f77_arg0 ) == "string" )
	return m_types[f77_arg0] ~= nil
end

LockTable( _M )
