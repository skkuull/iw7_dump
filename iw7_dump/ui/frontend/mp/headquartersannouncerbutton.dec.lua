local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function UpdateAnnouncerText( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Common, "mp_announcer_type" )
	local f1_local1 = CSV.announcerVoiceDataTable
	f1_arg0.AnnouncerButton.DynamicText:setText( Engine.Localize( Engine.TableLookup( f1_local1.file, f1_local1.cols.index, f1_local0, f1_local1.cols.name ) ) )
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0:addEventHandler( "popup_inactive", function ( f3_arg0, f3_arg1 )
		UpdateAnnouncerText( f3_arg0, f2_arg1 )
	end )
	UpdateAnnouncerText( f2_arg0, f2_arg1 )
end

function HeadquartersAnnouncerButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "HeadquartersAnnouncerButton"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	self.buttonDescription = Engine.Localize( "LUA_MENU_ANNOUNCER_VOICE_DESC" )
	local AnnouncerButton = nil
	
	AnnouncerButton = MenuBuilder.BuildRegisteredType( "GenericDualLabelButton", {
		controllerIndex = f4_local1
	} )
	AnnouncerButton.id = "AnnouncerButton"
	AnnouncerButton.buttonDescription = Engine.Localize( "LUA_MENU_ANNOUNCER_VOICE_DESC" )
	AnnouncerButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ANNOUNCER" ) ), 0 )
	AnnouncerButton.DynamicText:setText( "", 0 )
	AnnouncerButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 30 )
	self:addElement( AnnouncerButton )
	self.AnnouncerButton = AnnouncerButton
	
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "HeadquartersAnnouncerButton", HeadquartersAnnouncerButton )
LockTable( _M )
