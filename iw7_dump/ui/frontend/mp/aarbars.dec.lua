local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	local self = LUI.UILine.new()
	self:SetThickness( 1.5 )
	f1_arg0:addElement( self )
	self:SetVertexPosition( 0, f1_arg4 * f1_arg1, 1 - f1_arg2 + 0.05, 7, 0 )
	self:SetVertexPosition( 1, f1_arg4 * (f1_arg1 + 1), 1 - f1_arg3 + 0.05, 7, 0 )
	table.insert( f1_arg0.lines, self )
end

f0_local1 = function ( menu, controller )
	menu.Bars = LUI.UIHorizontalStackedLayout.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 9 * _1080p,
		right = 9 * _1080p,
		top = 0,
		bottom = 0
	} )
	menu.Bars:SetSpacing( _1080p * 69 )
	menu:addElement( menu.Bars )
	menu.lines = {}
	assert( menu.AverageLine )
	assert( menu.AverageText )
	assert( menu.AverageText.AverageValue )
	menu.SetGraphData = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		f3_arg0.Bars:closeChildren()
		for f3_local0 = 1, #f3_arg0.lines, 1 do
			f3_arg0.lines[f3_local0]:closeTree()
		end
		f3_arg0.lines = {}
		for f3_local0 = 1, #f3_arg1, 1 do
			local f3_local3 = MenuBuilder.BuildRegisteredType( "AARVerticalStatsBar", {
				controllerIndex = controller
			} )
			f3_local3:SetData( f3_arg1[f3_local0] )
			f3_arg0.Bars:addElement( f3_local3 )
		end
		assert( type( f3_arg2.average ) == "number" )
		assert( type( f3_arg2.maxValue ) == "number" )
		local f3_local0 = f3_arg2.average
		local f3_local1 = f3_arg2.maxValue
		if f3_local1 == 0 then
			f3_local1 = 1
		end
		local f3_local2 = f3_local0 / f3_local1
		f3_arg0.AverageLine:SetAnchors( 0, 1, 1 - f3_local2, f3_local2, 0 )
		local f3_local4 = ""
		if f3_arg3 then
			f3_local4 = string.format( "%.2f", f3_local0 )
		else
			f3_local4 = string.format( "%d", f3_local0 )
		end
		f3_arg0.AverageText.AverageValue:setText( f3_local4 )
		f3_arg0.AverageText:SetAnchors( 0, 1, 1 - f3_local2, f3_local2, 0 )
		local f3_local3 = #f3_arg1 - 2
		local f3_local5 = 14
		local f3_local6 = 250
		local f3_local7 = 5
		local f3_local8, f3_local9, f3_local10, f3_local11 = nil
		local f3_local12 = 0.09
		local f3_local13 = (1 - f3_local5 / f3_local6) / (f3_local7 - 1)
		for f3_local14 = 0, f3_local3, 1 do
			f3_local8 = f3_arg1[f3_local14 + 1]
			if f3_local8.valid then
				f3_local10 = math.max( f3_local8.value / f3_local1, f3_local12 )
				f3_local8 = f3_arg1[f3_local14 + 2]
				if f3_local8.valid then
					f0_local0( f3_arg0, f3_local14, f3_local10, math.max( f3_local8.value / f3_local1, f3_local12 ), f3_local13 )
				end
			end
		end
	end
	
end

function AARBars( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 363 * _1080p, 0, 151 * _1080p )
	self.id = "AARBars"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local AverageLine = nil
	
	AverageLine = LUI.UIImage.new()
	AverageLine.id = "AverageLine"
	AverageLine:SetAlpha( 0.65, 0 )
	AverageLine:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 372, 0, _1080p * 2 )
	self:addElement( AverageLine )
	self.AverageLine = AverageLine
	
	local AverageText = nil
	
	AverageText = MenuBuilder.BuildRegisteredType( "AARAverageContainer", {
		controllerIndex = f4_local1
	} )
	AverageText.id = "AverageText"
	AverageText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -66, _1080p * 4, _1080p * -18, _1080p * 20 )
	self:addElement( AverageText )
	self.AverageText = AverageText
	
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "AARBars", AARBars )
LockTable( _M )
