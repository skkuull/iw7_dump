local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MissionsButtons( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 380 * _1080p )
	self.id = "MissionsButtons"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local MissionsVerticalLayout = nil
	
	MissionsVerticalLayout = MenuBuilder.BuildRegisteredType( "MissionsVerticalLayout", {
		controllerIndex = f1_local1
	} )
	MissionsVerticalLayout.id = "MissionsVerticalLayout"
	MissionsVerticalLayout:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 504, 0, _1080p * 340 )
	self:addElement( MissionsVerticalLayout )
	self.MissionsVerticalLayout = MissionsVerticalLayout
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f1_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 317, _1080p * 530, _1080p * 854 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Opening",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "MissionsButtons", MissionsButtons )
LockTable( _M )
