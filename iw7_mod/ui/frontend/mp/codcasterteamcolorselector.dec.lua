local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = {
		f1_arg0.CodCasterTeamColor1,
		f1_arg0.CodCasterTeamColor2,
		f1_arg0.CodCasterTeamColor3,
		f1_arg0.CodCasterTeamColor4,
		f1_arg0.CodCasterTeamColor5,
		f1_arg0.CodCasterTeamColor6,
		f1_arg0.CodCasterTeamColor7,
		f1_arg0.CodCasterTeamColor8,
		f1_arg0.CodCasterTeamColor9,
		f1_arg0.CodCasterTeamColor10,
		f1_arg0.CodCasterTeamColor11,
		f1_arg0.CodCasterTeamColor12,
		f1_arg0.CodCasterTeamColor13,
		f1_arg0.CodCasterTeamColor14,
		f1_arg0.CodCasterTeamColor15,
		f1_arg0.CodCasterTeamColor16
	}
	local f1_local1 = math.ceil( #f1_local0 / 2 )
	for f1_local2 = 1, #f1_local0, 1 do
		f1_local0[f1_local2].navigation = {
			left = f1_local0[f1_local2 - 1],
			right = f1_local0[f1_local2 + 1],
			up = f1_local0[f1_local2 - f1_local1],
			down = f1_local0[f1_local2 + f1_local1]
		}
	end
	f1_arg0.colorWidgets = {}
	for f1_local2 = 1, #f1_local0, 1 do
		local f1_local5, f1_local6, f1_local7, f1_local8 = f1_local0[f1_local2].TeamColor:getCurrentRGBA()
		local f1_local9 = GetIntForColor( {
			r = f1_local5,
			g = f1_local6,
			b = f1_local7
		} )
		f1_arg0.colorWidgets[f1_local9] = f1_local0[f1_local2]
		f1_arg0.colorWidgets[f1_local9].intColor = f1_local9
		if f1_local2 == 1 then
			f1_arg0.defaultColorTeam1 = f1_local9
		end
		if f1_local2 == 2 then
			f1_arg0.defaultColorTeam2 = f1_local9
		end
	end
end

function CodCasterTeamColorSelector( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 649 * _1080p, 0, 194 * _1080p )
	self.id = "CodCasterTeamColorSelector"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local CodCasterTeamColor1 = nil
	
	CodCasterTeamColor1 = MenuBuilder.BuildRegisteredType( "CodCasterTeamColor", {
		controllerIndex = f2_local1
	} )
	CodCasterTeamColor1.id = "CodCasterTeamColor1"
	CodCasterTeamColor1.TeamColor:SetRGBFromInt( 3381759, 0 )
	CodCasterTeamColor1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30, _1080p * 90, _1080p * 20, _1080p * 80 )
	self:addElement( CodCasterTeamColor1 )
	self.CodCasterTeamColor1 = CodCasterTeamColor1
	
	local CodCasterTeamColor2 = nil
	
	CodCasterTeamColor2 = MenuBuilder.BuildRegisteredType( "CodCasterTeamColor", {
		controllerIndex = f2_local1
	} )
	CodCasterTeamColor2.id = "CodCasterTeamColor2"
	CodCasterTeamColor2.TeamColor:SetRGBFromInt( 1566351, 0 )
	CodCasterTeamColor2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 103.29, _1080p * 163.29, _1080p * 20, _1080p * 80 )
	self:addElement( CodCasterTeamColor2 )
	self.CodCasterTeamColor2 = CodCasterTeamColor2
	
	local CodCasterTeamColor3 = nil
	
	CodCasterTeamColor3 = MenuBuilder.BuildRegisteredType( "CodCasterTeamColor", {
		controllerIndex = f2_local1
	} )
	CodCasterTeamColor3.id = "CodCasterTeamColor3"
	CodCasterTeamColor3.TeamColor:SetRGBFromInt( 16741282, 0 )
	CodCasterTeamColor3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 177, _1080p * 237, _1080p * 20, _1080p * 80 )
	self:addElement( CodCasterTeamColor3 )
	self.CodCasterTeamColor3 = CodCasterTeamColor3
	
	local CodCasterTeamColor4 = nil
	
	CodCasterTeamColor4 = MenuBuilder.BuildRegisteredType( "CodCasterTeamColor", {
		controllerIndex = f2_local1
	} )
	CodCasterTeamColor4.id = "CodCasterTeamColor4"
	CodCasterTeamColor4.TeamColor:SetRGBFromInt( 56026, 0 )
	CodCasterTeamColor4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 252, _1080p * 312, _1080p * 20, _1080p * 80 )
	self:addElement( CodCasterTeamColor4 )
	self.CodCasterTeamColor4 = CodCasterTeamColor4
	
	local CodCasterTeamColor5 = nil
	
	CodCasterTeamColor5 = MenuBuilder.BuildRegisteredType( "CodCasterTeamColor", {
		controllerIndex = f2_local1
	} )
	CodCasterTeamColor5.id = "CodCasterTeamColor5"
	CodCasterTeamColor5.TeamColor:SetRGBFromInt( 7467568, 0 )
	CodCasterTeamColor5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 324.5, _1080p * 384.5, _1080p * 20, _1080p * 80 )
	self:addElement( CodCasterTeamColor5 )
	self.CodCasterTeamColor5 = CodCasterTeamColor5
	
	local CodCasterTeamColor6 = nil
	
	CodCasterTeamColor6 = MenuBuilder.BuildRegisteredType( "CodCasterTeamColor", {
		controllerIndex = f2_local1
	} )
	CodCasterTeamColor6.id = "CodCasterTeamColor6"
	CodCasterTeamColor6.TeamColor:SetRGBFromInt( 15102950, 0 )
	CodCasterTeamColor6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 402, _1080p * 462, _1080p * 20, _1080p * 80 )
	self:addElement( CodCasterTeamColor6 )
	self.CodCasterTeamColor6 = CodCasterTeamColor6
	
	local CodCasterTeamColor7 = nil
	
	CodCasterTeamColor7 = MenuBuilder.BuildRegisteredType( "CodCasterTeamColor", {
		controllerIndex = f2_local1
	} )
	CodCasterTeamColor7.id = "CodCasterTeamColor7"
	CodCasterTeamColor7.TeamColor:SetRGBFromInt( 16695040, 0 )
	CodCasterTeamColor7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 478, _1080p * 538, _1080p * 20, _1080p * 80 )
	self:addElement( CodCasterTeamColor7 )
	self.CodCasterTeamColor7 = CodCasterTeamColor7
	
	local CodCasterTeamColor8 = nil
	
	CodCasterTeamColor8 = MenuBuilder.BuildRegisteredType( "CodCasterTeamColor", {
		controllerIndex = f2_local1
	} )
	CodCasterTeamColor8.id = "CodCasterTeamColor8"
	CodCasterTeamColor8.TeamColor:SetRGBFromInt( 12566454, 0 )
	CodCasterTeamColor8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 557, _1080p * 617, _1080p * 20, _1080p * 80 )
	self:addElement( CodCasterTeamColor8 )
	self.CodCasterTeamColor8 = CodCasterTeamColor8
	
	local CodCasterTeamColor9 = nil
	
	CodCasterTeamColor9 = MenuBuilder.BuildRegisteredType( "CodCasterTeamColor", {
		controllerIndex = f2_local1
	} )
	CodCasterTeamColor9.id = "CodCasterTeamColor9"
	CodCasterTeamColor9.TeamColor:SetRGBFromInt( 3616409, 0 )
	CodCasterTeamColor9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30, _1080p * 90, _1080p * 97, _1080p * 157 )
	self:addElement( CodCasterTeamColor9 )
	self.CodCasterTeamColor9 = CodCasterTeamColor9
	
	local CodCasterTeamColor10 = nil
	
	CodCasterTeamColor10 = MenuBuilder.BuildRegisteredType( "CodCasterTeamColor", {
		controllerIndex = f2_local1
	} )
	CodCasterTeamColor10.id = "CodCasterTeamColor10"
	CodCasterTeamColor10.TeamColor:SetRGBFromInt( 22843, 0 )
	CodCasterTeamColor10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 103.29, _1080p * 163.29, _1080p * 97, _1080p * 157 )
	self:addElement( CodCasterTeamColor10 )
	self.CodCasterTeamColor10 = CodCasterTeamColor10
	
	local CodCasterTeamColor11 = nil
	
	CodCasterTeamColor11 = MenuBuilder.BuildRegisteredType( "CodCasterTeamColor", {
		controllerIndex = f2_local1
	} )
	CodCasterTeamColor11.id = "CodCasterTeamColor11"
	CodCasterTeamColor11.TeamColor:SetRGBFromInt( 7536677, 0 )
	CodCasterTeamColor11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 177, _1080p * 237, _1080p * 97, _1080p * 157 )
	self:addElement( CodCasterTeamColor11 )
	self.CodCasterTeamColor11 = CodCasterTeamColor11
	
	local CodCasterTeamColor12 = nil
	
	CodCasterTeamColor12 = MenuBuilder.BuildRegisteredType( "CodCasterTeamColor", {
		controllerIndex = f2_local1
	} )
	CodCasterTeamColor12.id = "CodCasterTeamColor12"
	CodCasterTeamColor12.TeamColor:SetRGBFromInt( 15462, 0 )
	CodCasterTeamColor12:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 252, _1080p * 312, _1080p * 97, _1080p * 157 )
	self:addElement( CodCasterTeamColor12 )
	self.CodCasterTeamColor12 = CodCasterTeamColor12
	
	local CodCasterTeamColor13 = nil
	
	CodCasterTeamColor13 = MenuBuilder.BuildRegisteredType( "CodCasterTeamColor", {
		controllerIndex = f2_local1
	} )
	CodCasterTeamColor13.id = "CodCasterTeamColor13"
	CodCasterTeamColor13.TeamColor:SetRGBFromInt( 2971904, 0 )
	CodCasterTeamColor13:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 324.5, _1080p * 384.5, _1080p * 97, _1080p * 157 )
	self:addElement( CodCasterTeamColor13 )
	self.CodCasterTeamColor13 = CodCasterTeamColor13
	
	local CodCasterTeamColor14 = nil
	
	CodCasterTeamColor14 = MenuBuilder.BuildRegisteredType( "CodCasterTeamColor", {
		controllerIndex = f2_local1
	} )
	CodCasterTeamColor14.id = "CodCasterTeamColor14"
	CodCasterTeamColor14.TeamColor:SetRGBFromInt( 6291571, 0 )
	CodCasterTeamColor14:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 402, _1080p * 462, _1080p * 97, _1080p * 157 )
	self:addElement( CodCasterTeamColor14 )
	self.CodCasterTeamColor14 = CodCasterTeamColor14
	
	local CodCasterTeamColor15 = nil
	
	CodCasterTeamColor15 = MenuBuilder.BuildRegisteredType( "CodCasterTeamColor", {
		controllerIndex = f2_local1
	} )
	CodCasterTeamColor15.id = "CodCasterTeamColor15"
	CodCasterTeamColor15.TeamColor:SetRGBFromInt( 10027008, 0 )
	CodCasterTeamColor15:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 478, _1080p * 538, _1080p * 97, _1080p * 157 )
	self:addElement( CodCasterTeamColor15 )
	self.CodCasterTeamColor15 = CodCasterTeamColor15
	
	local CodCasterTeamColor16 = nil
	
	CodCasterTeamColor16 = MenuBuilder.BuildRegisteredType( "CodCasterTeamColor", {
		controllerIndex = f2_local1
	} )
	CodCasterTeamColor16.id = "CodCasterTeamColor16"
	CodCasterTeamColor16.TeamColor:SetRGBFromInt( 5854256, 0 )
	CodCasterTeamColor16:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 557, _1080p * 617, _1080p * 97, _1080p * 157 )
	self:addElement( CodCasterTeamColor16 )
	self.CodCasterTeamColor16 = CodCasterTeamColor16
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "CodCasterTeamColorSelector", CodCasterTeamColorSelector )
LockTable( _M )
