local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Image )
	assert( f1_arg0.MissionTeamLevel )
	f1_arg0.MissionTeamLevel:SetShadowUOffset( -0 )
	f1_arg0.MissionTeamLevel:SetShadowVOffset( -0 )
	local f1_local0 = CSV.ReadRow( CSV.missionTeams, Engine.TableLookupGetRowNum( CSV.missionTeams.file, CSV.missionTeams.cols.index, f1_arg2.index ) )
	local f1_local1 = MissionDirector.GetMissionTeamLevel( f1_arg1, f1_arg2.index )
	local f1_local2 = SWATCHES.MissionTeams[f1_local0.color]
	f1_arg0.Image:setImage( RegisterMaterial( tostring( f1_local0.image ) .. "_tilted" ) )
	f1_arg0.MissionTeamLevel:setText( Engine.Localize( "LUA_MENU_WEAPON_LEVEL_BUTTON", f1_local1 + 1 ) )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.SetupMissionTeam = f0_local0
end

function ArmoryMissionTeam( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 100 * _1080p )
	self.id = "ArmoryMissionTeam"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 34, _1080p * -58, _1080p * -4, _1080p * 4 )
	self:addElement( Image )
	self.Image = Image
	
	local LevelBacker = nil
	
	LevelBacker = LUI.UIImage.new()
	LevelBacker.id = "LevelBacker"
	LevelBacker:SetRGBFromInt( 0, 0 )
	LevelBacker:SetAlpha( 0.6, 0 )
	LevelBacker:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -52, _1080p * 28, _1080p * -20, 0 )
	self:addElement( LevelBacker )
	self.LevelBacker = LevelBacker
	
	local LeftNotch = nil
	
	LeftNotch = LUI.UIImage.new()
	LeftNotch.id = "LeftNotch"
	LeftNotch:SetRGBFromInt( 0, 0 )
	LeftNotch:SetAlpha( 0.6, 0 )
	LeftNotch:SetZRotation( -180, 0 )
	LeftNotch:setImage( RegisterMaterial( "wdg_slot_cut_out_1" ), 0 )
	LeftNotch:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 28, _1080p * -152, _1080p * 80, 0 )
	self:addElement( LeftNotch )
	self.LeftNotch = LeftNotch
	
	local MissionTeamLevel = nil
	
	MissionTeamLevel = LUI.UIStyledText.new()
	MissionTeamLevel.id = "MissionTeamLevel"
	MissionTeamLevel:setText( Engine.Localize( "LUA_MENU_WEAPON_LEVEL_BUTTON" ), 0 )
	MissionTeamLevel:SetFontSize( 18 * _1080p )
	MissionTeamLevel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionTeamLevel:SetAlignment( LUI.Alignment.Center )
	MissionTeamLevel:SetShadowMinDistance( -0.2, 0 )
	MissionTeamLevel:SetShadowMaxDistance( 0.2, 0 )
	MissionTeamLevel:SetShadowRGBFromInt( 0, 0 )
	MissionTeamLevel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 52, _1080p * 124, _1080p * -19, _1080p * -1 )
	self:addElement( MissionTeamLevel )
	self.MissionTeamLevel = MissionTeamLevel
	
	local LeftNotchCopy0 = nil
	
	LeftNotchCopy0 = LUI.UIImage.new()
	LeftNotchCopy0.id = "LeftNotchCopy0"
	LeftNotchCopy0:SetRGBFromInt( 0, 0 )
	LeftNotchCopy0:SetAlpha( 0.6, 0 )
	LeftNotchCopy0:SetZRotation( 90, 0 )
	LeftNotchCopy0:setImage( RegisterMaterial( "wdg_slot_cut_out_1" ), 0 )
	LeftNotchCopy0:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 128, _1080p * -52, _1080p * 80, 0 )
	self:addElement( LeftNotchCopy0 )
	self.LeftNotchCopy0 = LeftNotchCopy0
	
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ArmoryMissionTeam", ArmoryMissionTeam )
LockTable( _M )
