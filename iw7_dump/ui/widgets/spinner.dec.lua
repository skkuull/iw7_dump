local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = (1 - f1_arg0) / 2
	local self = LUI.UIElement.new()
	self:SetAnchors( f1_local0, f1_local0, f1_local0, f1_local0 )
	local f1_local2 = 0.6
	local f1_local3 = 1
	local f1_local4 = 4
	local f1_local5 = {}
	for f1_local6 = 1, f1_local4, 1 do
		local f1_local9 = LUI.UILine.new()
		f1_local9:SetThickness( 2 * _1080p )
		f1_local9:SetAlpha( f1_local2 )
		self:addElement( f1_local9 )
		local f1_local10 = 2 * math.pi / f1_local4 * (f1_local6 - 1)
		f1_local9:SetVertexPosition( 0, 0.5 * (1 + math.cos( f1_local10 )), 0.5 * (1 + math.sin( f1_local10 )), 0, 0 )
		local f1_local11 = 2 * math.pi / f1_local4 * f1_local6
		f1_local9:SetVertexPosition( 1, 0.5 * (1 + math.cos( f1_local11 )), 0.5 * (1 + math.sin( f1_local11 )), 0, 0 )
		table.insert( f1_local5, f1_local9 )
	end
	local f1_local6 = nil
	local f1_local7 = 1
	local f1_local8 = function ()
		f1_local7 = f1_local7 + f1_arg1
		if #f1_local5 < f1_local7 then
			f1_local7 = 1
		end
		if f1_local7 == 0 then
			f1_local7 = #f1_local5
		end
		local f2_local0 = f1_local7 + f1_arg1
		if #f1_local5 < f2_local0 then
			f2_local0 = 1
		end
		if f2_local0 == 0 then
			f2_local0 = #f1_local5
		end
		local f2_local1 = 0
		local f2_local2 = 1
		if f1_arg1 < 0 then
			local f2_local3 = 1
			f2_local2 = 0
			f2_local1 = f2_local3
		end
		f1_local5[f1_local7]:SetVertexPadding( f2_local1, 0 )
		f1_local5[f1_local7]:SetVertexPadding( f2_local2, 1 )
		f1_local5[f1_local7]:SetVertexPadding( f2_local2, 0, 350, LUI.EASING.linear )
		f1_local5[f1_local7]:SetAlpha( f1_local3 )
		f1_local5[f1_local7]:SetAlpha( f1_local2, 350 * (f1_local4 - 1), LUI.EASING.inOutQuadratic )
		f1_local5[f2_local0]:SetVertexPadding( f2_local1, 0 )
		f1_local5[f2_local0]:SetVertexPadding( f2_local1, 1, 350, LUI.EASING.linear )
		local f2_local3 = self:Wait( 350 )
		f2_local3.onComplete = f1_local6
	end
	
	f1_local8()
	f1_local8 = self:Wait( 400 + 200 * f1_arg1 )
	f1_local8.onComplete = function ()
		local f3_local0 = nil
		local f3_local1 = 0
		local f3_local2 = function ()
			f3_local1 = f3_local1 - f1_arg1 * 360 * (f1_local4 - 1) / f1_local4
			self:SetZRotation( f3_local1, 1000, LUI.EASING.outCubic )
			local f4_local0 = self:Wait( 1400 )
			f4_local0.onComplete = f3_local0
		end
		
		f3_local2()
	end
	
	return self
end

MenuBuilder.registerType( "Spinner", function ()
	local self = LUI.UIElement.new()
	self:addElement( f0_local0( 1, -1 ) )
	self:addElement( f0_local0( 0.5, 1 ) )
	return self
end )
LockTable( _M )
