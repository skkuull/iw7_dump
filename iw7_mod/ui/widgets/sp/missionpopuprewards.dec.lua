local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0 )
	f1_arg0:SetAlignment( LUI.Alignment.Top )
	f1_arg0:SetAdjustSizeToContent( true )
end

function MissionPopupRewards( menu, controller )
	local self = LUI.UIVerticalStackedLayout.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 450 * _1080p, 0, 132 * _1080p )
	self.id = "MissionPopupRewards"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	self:SetSpacing( 12 * _1080p )
	local Reward1 = nil
	
	Reward1 = MenuBuilder.BuildRegisteredType( "MissionPopupReward", {
		controllerIndex = f2_local1
	} )
	Reward1.id = "Reward1"
	Reward1:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( Reward1 )
	self.Reward1 = Reward1
	
	local Reward2 = nil
	
	Reward2 = MenuBuilder.BuildRegisteredType( "MissionPopupReward", {
		controllerIndex = f2_local1
	} )
	Reward2.id = "Reward2"
	Reward2:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 36, _1080p * 60 )
	self:addElement( Reward2 )
	self.Reward2 = Reward2
	
	local Reward3 = nil
	
	Reward3 = MenuBuilder.BuildRegisteredType( "MissionPopupReward", {
		controllerIndex = f2_local1
	} )
	Reward3.id = "Reward3"
	Reward3:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 72, _1080p * 96 )
	self:addElement( Reward3 )
	self.Reward3 = Reward3
	
	local Reward4 = nil
	
	Reward4 = MenuBuilder.BuildRegisteredType( "MissionPopupReward", {
		controllerIndex = f2_local1
	} )
	Reward4.id = "Reward4"
	Reward4:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 108, _1080p * 132 )
	self:addElement( Reward4 )
	self.Reward4 = Reward4
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "MissionPopupRewards", MissionPopupRewards )
LockTable( _M )
