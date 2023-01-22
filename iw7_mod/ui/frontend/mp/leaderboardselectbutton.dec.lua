local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg1.controller or f1_arg1
		local f2_local1 = f1_arg0:GetDataSource()
		if f2_local1.ref:GetValue( f2_local0 ) ~= nil then
			f2_local1 = {}
			local f2_local2 = f1_arg0:GetDataSource()
			f2_local1.leaderboardType = f2_local2.ref:GetValue( f2_local0 )
			f2_local1.filterType = "Friends"
			LUI.FlowManager.RequestAddMenu( "LeaderboardMenu", true, f2_local0, false, f2_local1, true )
		end
	end )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "ref", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		f3_local0 = f3_local0.ref:GetValue( f1_arg1 )
		if f3_local0 ~= nil then
			if Leaderboards.GetLeaderboardDisabled( f3_local0 ) == true then
				f1_arg0:SetButtonDisabled( true )
			else
				f1_arg0:SetButtonDisabled( false )
			end
		end
	end )
end

function LeaderboardSelectButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "LeaderboardSelectButton"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	self:SubscribeToModelThroughElement( self, "desc", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.desc:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			self.buttonDescription = f5_local0
		end
	end )
	local GenericButton = nil
	
	GenericButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f4_local1
	} )
	GenericButton.id = "GenericButton"
	GenericButton:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	GenericButton:SubscribeToModelThroughElement( self, "desc", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.desc:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			GenericButton.buttonDescription = f6_local0
		end
	end )
	GenericButton:SubscribeToModelThroughElement( self, "name", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.name:GetValue( f4_local1 )
		if f7_local0 ~= nil then
			GenericButton.Text:setText( ToUpperCase( f7_local0 ), 0 )
		end
	end )
	self:addElement( GenericButton )
	self.GenericButton = GenericButton
	
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "LeaderboardSelectButton", LeaderboardSelectButton )
LockTable( _M )
