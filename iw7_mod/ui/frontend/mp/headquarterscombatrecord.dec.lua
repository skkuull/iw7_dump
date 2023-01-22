local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.headquarters"
function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = MP.GetGameModeStats( f2_arg1 )
	local f2_local1 = f0_local0 .. ".GameMode"
	local f2_local2 = LUI.DataSourceFromList.new( #f2_local0 )
	f2_local2.MakeDataSourceAtIndex = function ( f3_arg0, f3_arg1, f3_arg2 )
		f3_arg1 = f3_arg1 + 1
		return {
			name = LUI.DataSourceInGlobalModel.new( f2_local1 .. ".name", f2_local0[f3_arg1].name ),
			image = LUI.DataSourceInGlobalModel.new( f2_local1 .. ".image", f2_local0[f3_arg1].image ),
			score = LUI.DataSourceInGlobalModel.new( f2_local1 .. ".score", f2_local0[f3_arg1].score ),
			timePlayed = LUI.DataSourceInGlobalModel.new( f2_local1 .. ".timePlayed", f2_local0[f3_arg1].timePlayed ),
			spm = LUI.DataSourceInGlobalModel.new( f2_local1 .. ".spm", f2_local0[f3_arg1].spm ),
			kills = LUI.DataSourceInGlobalModel.new( f2_local1 .. ".kills", f2_local0[f3_arg1].kills ),
			deaths = LUI.DataSourceInGlobalModel.new( f2_local1 .. ".deaths", f2_local0[f3_arg1].deaths ),
			kdr = LUI.DataSourceInGlobalModel.new( f2_local1 .. ".kdr", f2_local0[f3_arg1].kdr ),
			extraStat1 = LUI.DataSourceInGlobalModel.new( f2_local1 .. ".extraStat1", f2_local0[f3_arg1].extraStat1 ),
			extraStat1Name = LUI.DataSourceInGlobalModel.new( f2_local1 .. ".extraStat1Name", f2_local0[f3_arg1].extraStat1Name ),
			extraStat2 = LUI.DataSourceInGlobalModel.new( f2_local1 .. ".extraStat2", f2_local0[f3_arg1].extraStat2 ),
			extraStat2Name = LUI.DataSourceInGlobalModel.new( f2_local1 .. ".extraStat2Name", f2_local0[f3_arg1].extraStat2Name )
		}
	end
	
	return f2_local2
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = Cac.GetWeaponStatsTable( f4_arg1 )
	table.sort( f4_local0, function ( f5_arg0, f5_arg1 )
		return f5_arg1.kills < f5_arg0.kills
	end )
	local f4_local1 = f0_local0 .. ".Weapon"
	local f4_local2 = LUI.DataSourceFromList.new( #f4_local0 )
	f4_local2.MakeDataSourceAtIndex = function ( f6_arg0, f6_arg1, f6_arg2 )
		f6_arg1 = f6_arg1 + 1
		return {
			ref = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".ref", f4_local0[f6_arg1].ref ),
			name = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".name", f4_local0[f6_arg1].name ),
			image = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".image", f4_local0[f6_arg1].image ),
			deaths = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".deaths", f4_local0[f6_arg1].deaths ),
			headShots = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".headShots", f4_local0[f6_arg1].headShots ),
			hits = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".hits", f4_local0[f6_arg1].hits ),
			kills = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".kills", f4_local0[f6_arg1].kills ),
			shots = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".shots", f4_local0[f6_arg1].shots ),
			kdr = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".kdr", f4_local0[f6_arg1].kdr ),
			accuracy = LUI.DataSourceInGlobalModel.new( f4_local1 .. ".accuracy", f4_local0[f6_arg1].accuracy )
		}
	end
	
	return f4_local2
end

local f0_local3 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = Cac.GetRigStats( f7_arg1 )
	local f7_local1 = f0_local0 .. ".Rig"
	local f7_local2 = LUI.DataSourceFromList.new( #f7_local0 )
	f7_local2.MakeDataSourceAtIndex = function ( f8_arg0, f8_arg1, f8_arg2 )
		f8_arg1 = f8_arg1 + 1
		local f8_local0 = LUI.DataSourceFromList.new( #f7_local0[f8_arg1].superStats )
		f8_local0.MakeDataSourceAtIndex = function ( f9_arg0, f9_arg1, f9_arg2 )
			return {
				score = LUI.DataSourceInGlobalModel.new( GameModeModelPath .. ".superStats" .. gameIndex, f7_local0[f8_arg1].superStats[f9_arg1] )
			}
		end
		
		return {
			ref = LUI.DataSourceInGlobalModel.new( f7_local1 .. ".score", f7_local0[f8_arg1].ref ),
			name = LUI.DataSourceInGlobalModel.new( f7_local1 .. ".name", f7_local0[f8_arg1].name ),
			image = LUI.DataSourceInGlobalModel.new( f7_local1 .. ".image", f7_local0[f8_arg1].image ),
			kills = LUI.DataSourceInGlobalModel.new( f7_local1 .. ".kills", f7_local0[f8_arg1].kills ),
			deaths = LUI.DataSourceInGlobalModel.new( f7_local1 .. ".deaths", f7_local0[f8_arg1].deaths ),
			kdr = LUI.DataSourceInGlobalModel.new( f7_local1 .. ".kdr", f7_local0[f8_arg1].kdr ),
			superStats = f8_local0
		}
	end
	
	return f7_local2
end

local f0_local4 = function ( f10_arg0, f10_arg1 )
	local f10_local0 = Cac.GetLethalStats( f10_arg1 )
	local f10_local1 = f0_local0 .. ".LethalEquipment"
	local f10_local2 = LUI.DataSourceFromList.new( #f10_local0 )
	f10_local2.MakeDataSourceAtIndex = function ( f11_arg0, f11_arg1, f11_arg2 )
		f11_arg1 = f11_arg1 + 1
		return {
			ref = LUI.DataSourceInGlobalModel.new( f10_local1 .. ".ref", f10_local0[f11_arg1].ref ),
			name = LUI.DataSourceInGlobalModel.new( f10_local1 .. ".name", f10_local0[f11_arg1].name ),
			image = LUI.DataSourceInGlobalModel.new( f10_local1 .. ".image", f10_local0[f11_arg1].image ),
			uses = LUI.DataSourceInGlobalModel.new( f10_local1 .. ".uses", f10_local0[f11_arg1].uses ),
			extraStat1 = LUI.DataSourceInGlobalModel.new( f10_local1 .. ".extraStat1", f10_local0[f11_arg1].extraStat1 )
		}
	end
	
	return f10_local2
end

local f0_local5 = function ( f12_arg0, f12_arg1 )
	local f12_local0 = Cac.GetTacticalStats( f12_arg1 )
	local f12_local1 = f0_local0 .. ".TacticalEquipment"
	local f12_local2 = LUI.DataSourceFromList.new( #f12_local0 )
	f12_local2.MakeDataSourceAtIndex = function ( f13_arg0, f13_arg1, f13_arg2 )
		f13_arg1 = f13_arg1 + 1
		return {
			ref = LUI.DataSourceInGlobalModel.new( f12_local1 .. ".ref", f12_local0[f13_arg1].ref ),
			name = LUI.DataSourceInGlobalModel.new( f12_local1 .. ".name", f12_local0[f13_arg1].name ),
			image = LUI.DataSourceInGlobalModel.new( f12_local1 .. ".image", f12_local0[f13_arg1].image ),
			uses = LUI.DataSourceInGlobalModel.new( f12_local1 .. ".uses", f12_local0[f13_arg1].uses ),
			extraStat1 = LUI.DataSourceInGlobalModel.new( f12_local1 .. ".extraStat1", f12_local0[f13_arg1].extraStat1 )
		}
	end
	
	return f12_local2
end

local f0_local6 = function ( f14_arg0, f14_arg1 )
	local f14_local0 = Cac.GetSupportStreakStats( f14_arg1 )
	local f14_local1 = f0_local0 .. ".SupportStreak"
	local f14_local2 = LUI.DataSourceFromList.new( #f14_local0 )
	f14_local2.MakeDataSourceAtIndex = function ( f15_arg0, f15_arg1, f15_arg2 )
		f15_arg1 = f15_arg1 + 1
		return {
			ref = LUI.DataSourceInGlobalModel.new( f14_local1 .. ".ref", f14_local0[f15_arg1].ref ),
			name = LUI.DataSourceInGlobalModel.new( f14_local1 .. ".name", f14_local0[f15_arg1].name ),
			image = LUI.DataSourceInGlobalModel.new( f14_local1 .. ".image", f14_local0[f15_arg1].image ),
			uses = LUI.DataSourceInGlobalModel.new( f14_local1 .. ".uses", f14_local0[f15_arg1].uses ),
			extraStat1 = LUI.DataSourceInGlobalModel.new( f14_local1 .. ".extraStat1", f14_local0[f15_arg1].extraStat1 )
		}
	end
	
	return f14_local2
end

local f0_local7 = function ( f16_arg0, f16_arg1 )
	local f16_local0 = Cac.GetLethalStreakStats( f16_arg1 )
	local f16_local1 = f0_local0 .. ".LethalStreak"
	local f16_local2 = LUI.DataSourceFromList.new( #f16_local0 )
	f16_local2.MakeDataSourceAtIndex = function ( f17_arg0, f17_arg1, f17_arg2 )
		f17_arg1 = f17_arg1 + 1
		return {
			ref = LUI.DataSourceInGlobalModel.new( f16_local1 .. ".ref", f16_local0[f17_arg1].ref ),
			name = LUI.DataSourceInGlobalModel.new( f16_local1 .. ".name", f16_local0[f17_arg1].name ),
			image = LUI.DataSourceInGlobalModel.new( f16_local1 .. ".image", f16_local0[f17_arg1].image ),
			uses = LUI.DataSourceInGlobalModel.new( f16_local1 .. ".uses", f16_local0[f17_arg1].uses ),
			extraStat1 = LUI.DataSourceInGlobalModel.new( f16_local1 .. ".extraStat1", f16_local0[f17_arg1].extraStat1 )
		}
	end
	
	return f16_local2
end

function PostLoadFunc( f18_arg0, f18_arg1 )
	assert( f18_arg0.bindButton )
	f18_arg0.bindButton:addEventHandler( "button_secondary", function ( f19_arg0, f19_arg1 )
		LUI.FlowManager.RequestLeaveMenu( f19_arg0 )
		return true
	end )
	f18_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ) ) )
	local f18_local0 = f0_local0 .. ".BestItems"
	local f18_local1 = f0_local1( f18_arg0, f18_arg1 )
	local f18_local2 = f18_local1[0]
	f18_arg0.BestGameMode:SetDataSource( {
		category = LUI.DataSourceInGlobalModel.new( f18_local0 .. ".gameMode.category", Engine.Localize( "LUA_MENU_MP_SUCC_GAMETYPE" ) ),
		itemName = f18_local2.name,
		count = LUI.DataSourceInGlobalModel.new( f18_local0 .. ".gameMode.topSPM", Engine.Localize( "LUA_MENU_MP_SPM_NUMBER", string.format( "%.2f", f18_local2.spm:GetValue( f18_arg1 ) ) ) ),
		image = f18_local2.image
	}, f18_arg1 )
	local f18_local3 = f0_local2( f18_arg0, f18_arg1 )
	f18_local2 = f18_local3[0]
	f18_arg0.BestWeapon:SetDataSource( {
		category = LUI.DataSourceInGlobalModel.new( f18_local0 .. ".weapon.category", Engine.Localize( "LUA_MENU_MP_BEST_WEAPON" ) ),
		itemName = f18_local2.name,
		count = LUI.DataSourceInGlobalModel.new( f18_local0 .. ".gameMode.topWeaponKills", Engine.Localize( "LUA_MENU_N_KILLS", f18_local2.kills:GetValue( f18_arg1 ) ) ),
		image = f18_local2.image
	}, f18_arg1 )
	local f18_local4 = f0_local3( f18_arg0, f18_arg1 )
	f18_local2 = f18_local4[0]
	f18_arg0.BestRig:SetDataSource( {
		category = LUI.DataSourceInGlobalModel.new( f18_local0 .. ".rig.category", Engine.Localize( "LUA_MENU_MP_BEST_RIG" ) ),
		itemName = f18_local2.name,
		count = LUI.DataSourceInGlobalModel.new( f18_local0 .. ".gameMode.topRigKills", Engine.Localize( "LUA_MENU_N_KILLS", f18_local2.kills:GetValue( f18_arg1 ) ) ),
		image = f18_local2.image
	}, f18_arg1 )
	local f18_local5 = f0_local4( f18_arg0, f18_arg1 )
	f18_local2 = f18_local5[0]
	f18_arg0.BestEquipment:SetDataSource( {
		category = LUI.DataSourceInGlobalModel.new( f18_local0 .. ".lethal.category", Engine.Localize( "LUA_MENU_MP_BEST_LETHAL" ) ),
		itemName = f18_local2.name,
		count = LUI.DataSourceInGlobalModel.new( f18_local0 .. ".gameMode.topLethalKills", Engine.Localize( "LUA_MENU_N_KILLS", f18_local2.extraStat1:GetValue( f18_arg1 ) ) ),
		image = f18_local2.image
	}, f18_arg1 )
	local f18_local6 = f0_local5( f18_arg0, f18_arg1 )
	f18_local2 = f18_local6[0]
	f18_arg0.BestTactical:SetDataSource( {
		category = LUI.DataSourceInGlobalModel.new( f18_local0 .. ".tactical.category", Engine.Localize( "LUA_MENU_MP_BEST_TACTICAL" ) ),
		itemName = f18_local2.name,
		count = LUI.DataSourceInGlobalModel.new( f18_local0 .. ".gameMode.topTacticalUsed", Engine.Localize( "LUA_MENU_MP_N_USED", f18_local2.uses:GetValue( f18_arg1 ) ) ),
		image = f18_local2.image
	}, f18_arg1 )
	local f18_local7 = f0_local7( f18_arg0, f18_arg1 )
	f18_local2 = f18_local7[0]
	f18_arg0.BestScorestreak:SetDataSource( {
		category = LUI.DataSourceInGlobalModel.new( f18_local0 .. ".streak.category", Engine.Localize( "LUA_MENU_MP_BEST_STREAK" ) ),
		itemName = f18_local2.name,
		count = LUI.DataSourceInGlobalModel.new( f18_local0 .. ".gameMode.topLethalStreakKills", Engine.Localize( "LUA_MENU_N_KILLS", f18_local2.extraStat1:GetValue( f18_arg1 ) ) ),
		image = f18_local2.image
	}, f18_arg1 )
	local f18_local8 = f0_local6( f18_arg0, f18_arg1 )
	f18_local2 = f18_local8[0]
	f18_arg0.BestSupportStreak:SetDataSource( {
		category = LUI.DataSourceInGlobalModel.new( f18_local0 .. ".supportStreak.category", Engine.Localize( "LUA_MENU_MP_BEST_SUPPORT_STREAK" ) ),
		itemName = f18_local2.name,
		count = LUI.DataSourceInGlobalModel.new( f18_local0 .. ".gameMode.topSupportStreakUsed", Engine.Localize( "LUA_MENU_MP_N_USED", f18_local2.uses:GetValue( f18_arg1 ) ) ),
		image = f18_local2.image
	}, f18_arg1 )
	f18_arg0.BestGameMode.navigation.up = f18_arg0.BestScorestreak
	if Engine.IsCoreMode() then
		local self = LUI.UIElement.new( {
			worldBlur = 5
		} )
		self:setupWorldBlur()
		self.id = "blur"
		f18_arg0:addElement( self )
	end
	f18_arg0.HeadquartersGlobalRecords:PopulateGlobalRecords( f18_arg1, f18_local1[0] )
end

function HeadquartersCombatRecord( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "HeadquartersCombatRecord"
	local f20_local1 = controller and controller.controllerIndex
	if not f20_local1 and not Engine.InFrontend() then
		f20_local1 = self:getRootController()
	end
	assert( f20_local1 )
	self:playSound( "menu_open" )
	local f20_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f20_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local Friends = nil
	
	Friends = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f20_local1
	} )
	Friends.id = "Friends"
	Friends:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Friends:SetAlignment( LUI.Alignment.Left )
	Friends:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 45 )
	self:addElement( Friends )
	self.Friends = Friends
	
	local f20_local5 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f20_local5 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f20_local1
		} )
		f20_local5.id = "MenuTitle"
		f20_local5.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_COMBAT_RECORD" ) ), 0 )
		f20_local5.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
		f20_local5.Icon:SetTop( _1080p * -28.5, 0 )
		f20_local5.Icon:SetBottom( _1080p * 61.5, 0 )
		f20_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 796, _1080p * 54, _1080p * 134 )
		self:addElement( f20_local5 )
		self.MenuTitle = f20_local5
	end
	local HeadquartersHighScoreRecords = nil
	
	HeadquartersHighScoreRecords = MenuBuilder.BuildRegisteredType( "HeadquartersHighScoreRecords", {
		controllerIndex = f20_local1
	} )
	HeadquartersHighScoreRecords.id = "HeadquartersHighScoreRecords"
	HeadquartersHighScoreRecords:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1290, _1080p * 1790, _1080p * 224.5, _1080p * 855.5 )
	self:addElement( HeadquartersHighScoreRecords )
	self.HeadquartersHighScoreRecords = HeadquartersHighScoreRecords
	
	local BestWeapon = nil
	
	BestWeapon = MenuBuilder.BuildRegisteredType( "HeadquartersCombatRecordUsageTile", {
		controllerIndex = f20_local1
	} )
	BestWeapon.id = "BestWeapon"
	BestWeapon.CaCButtonBaseImage.Image:SetLeft( _1080p * -128, 0 )
	BestWeapon.CaCButtonBaseImage.Image:SetRight( _1080p * 128, 0 )
	BestWeapon.CaCButtonBaseImage.Image:SetTop( _1080p * -152, 0 )
	BestWeapon.CaCButtonBaseImage.Image:SetBottom( _1080p * -24, 0 )
	BestWeapon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 396, _1080p * 154, _1080p * 348 )
	self:addElement( BestWeapon )
	self.BestWeapon = BestWeapon
	
	local BestGameMode = nil
	
	BestGameMode = MenuBuilder.BuildRegisteredType( "HeadquartersCombatRecordUsageTile", {
		controllerIndex = f20_local1
	} )
	BestGameMode.id = "BestGameMode"
	BestGameMode.CaCButtonBaseImage.Image:SetLeft( _1080p * -128, 0 )
	BestGameMode.CaCButtonBaseImage.Image:SetRight( _1080p * 128, 0 )
	BestGameMode.CaCButtonBaseImage.Image:SetTop( _1080p * -218, 0 )
	BestGameMode.CaCButtonBaseImage.Image:SetBottom( _1080p * 40, 0 )
	BestGameMode:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 698, _1080p * 736, _1080p * 930 )
	self:addElement( BestGameMode )
	self.BestGameMode = BestGameMode
	
	local BestScorestreak = nil
	
	BestScorestreak = MenuBuilder.BuildRegisteredType( "HeadquartersCombatRecordUsageTile", {
		controllerIndex = f20_local1
	} )
	BestScorestreak.id = "BestScorestreak"
	BestScorestreak.CaCButtonBaseImage.Image:SetLeft( _1080p * -80, 0 )
	BestScorestreak.CaCButtonBaseImage.Image:SetRight( _1080p * 80, 0 )
	BestScorestreak.CaCButtonBaseImage.Image:SetTop( _1080p * -170, 0 )
	BestScorestreak.CaCButtonBaseImage.Image:SetBottom( _1080p * 0, 0 )
	BestScorestreak:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 396, _1080p * 542, _1080p * 736 )
	self:addElement( BestScorestreak )
	self.BestScorestreak = BestScorestreak
	
	local BestEquipment = nil
	
	BestEquipment = MenuBuilder.BuildRegisteredType( "HeadquartersCombatRecordUsageTile", {
		controllerIndex = f20_local1
	} )
	BestEquipment.id = "BestEquipment"
	BestEquipment.CaCButtonBaseImage.Image:SetLeft( _1080p * -80, 0 )
	BestEquipment.CaCButtonBaseImage.Image:SetRight( _1080p * 80, 0 )
	BestEquipment.CaCButtonBaseImage.Image:SetTop( _1080p * -160, 0 )
	BestEquipment.CaCButtonBaseImage.Image:SetBottom( _1080p * 0, 0 )
	BestEquipment:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 396, _1080p * 348, _1080p * 542 )
	self:addElement( BestEquipment )
	self.BestEquipment = BestEquipment
	
	local BestRig = nil
	
	BestRig = MenuBuilder.BuildRegisteredType( "HeadquartersCombatRecordUsageTile", {
		controllerIndex = f20_local1
	} )
	BestRig.id = "BestRig"
	BestRig.CaCButtonBaseImage.Image:SetLeft( _1080p * -80, 0 )
	BestRig.CaCButtonBaseImage.Image:SetRight( _1080p * 80, 0 )
	BestRig.CaCButtonBaseImage.Image:SetTop( _1080p * -160, 0 )
	BestRig.CaCButtonBaseImage.Image:SetBottom( _1080p * 0, 0 )
	BestRig:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 397, _1080p * 697, _1080p * 154, _1080p * 348 )
	self:addElement( BestRig )
	self.BestRig = BestRig
	
	local HeadquartersGlobalRecords = nil
	
	HeadquartersGlobalRecords = MenuBuilder.BuildRegisteredType( "HeadquartersGlobalRecords", {
		controllerIndex = f20_local1
	} )
	HeadquartersGlobalRecords.id = "HeadquartersGlobalRecords"
	HeadquartersGlobalRecords:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 775, _1080p * 1275, _1080p * 224.5, _1080p * 855.5 )
	self:addElement( HeadquartersGlobalRecords )
	self.HeadquartersGlobalRecords = HeadquartersGlobalRecords
	
	local BestTactical = nil
	
	BestTactical = MenuBuilder.BuildRegisteredType( "HeadquartersCombatRecordUsageTile", {
		controllerIndex = f20_local1
	} )
	BestTactical.id = "BestTactical"
	BestTactical.CaCButtonBaseImage.Image:SetLeft( _1080p * -80, 0 )
	BestTactical.CaCButtonBaseImage.Image:SetRight( _1080p * 80, 0 )
	BestTactical.CaCButtonBaseImage.Image:SetTop( _1080p * -160, 0 )
	BestTactical.CaCButtonBaseImage.Image:SetBottom( _1080p * 0, 0 )
	BestTactical:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 397, _1080p * 697, _1080p * 348, _1080p * 542 )
	self:addElement( BestTactical )
	self.BestTactical = BestTactical
	
	local BestSupportStreak = nil
	
	BestSupportStreak = MenuBuilder.BuildRegisteredType( "HeadquartersCombatRecordUsageTile", {
		controllerIndex = f20_local1
	} )
	BestSupportStreak.id = "BestSupportStreak"
	BestSupportStreak.CaCButtonBaseImage.Image:SetLeft( _1080p * -80, 0 )
	BestSupportStreak.CaCButtonBaseImage.Image:SetRight( _1080p * 80, 0 )
	BestSupportStreak.CaCButtonBaseImage.Image:SetTop( _1080p * -160, 0 )
	BestSupportStreak.CaCButtonBaseImage.Image:SetBottom( _1080p * 0, 0 )
	BestSupportStreak:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 397, _1080p * 697, _1080p * 542, _1080p * 736 )
	self:addElement( BestSupportStreak )
	self.BestSupportStreak = BestSupportStreak
	
	BestWeapon:addEventHandler( "button_action", function ( f21_arg0, f21_arg1 )
		ACTIONS.OpenMenu( "CombatRecordWeapons", true, f21_arg1.controller or f20_local1 )
	end )
	BestGameMode:addEventHandler( "button_action", function ( f22_arg0, f22_arg1 )
		ACTIONS.OpenMenu( "CombatRecordGameModes", true, f22_arg1.controller or f20_local1 )
	end )
	BestScorestreak:addEventHandler( "button_action", function ( f23_arg0, f23_arg1 )
		ACTIONS.OpenMenu( "CombatRecordLethalStreaks", true, f23_arg1.controller or f20_local1 )
	end )
	BestEquipment:addEventHandler( "button_action", function ( f24_arg0, f24_arg1 )
		ACTIONS.OpenMenu( "CombatRecordLethals", true, f24_arg1.controller or f20_local1 )
	end )
	BestRig:addEventHandler( "button_action", function ( f25_arg0, f25_arg1 )
		ACTIONS.OpenMenu( "CombatRecordRig", true, f25_arg1.controller or f20_local1 )
	end )
	BestTactical:addEventHandler( "button_action", function ( f26_arg0, f26_arg1 )
		ACTIONS.OpenMenu( "CombatRecordTacticals", true, f26_arg1.controller or f20_local1 )
	end )
	BestSupportStreak:addEventHandler( "button_action", function ( f27_arg0, f27_arg1 )
		ACTIONS.OpenMenu( "CombatRecordSupportStreaks", true, f27_arg1.controller or f20_local1 )
	end )
	BestWeapon.navigation = {
		right = BestRig,
		down = BestEquipment
	}
	BestGameMode.navigation = {
		up = {
			BestScorestreak,
			BestSupportStreak
		}
	}
	BestScorestreak.navigation = {
		up = BestEquipment,
		right = BestSupportStreak,
		down = BestGameMode
	}
	BestEquipment.navigation = {
		up = BestWeapon,
		right = BestTactical,
		down = BestScorestreak
	}
	BestRig.navigation = {
		left = BestWeapon,
		down = BestTactical
	}
	BestTactical.navigation = {
		left = BestEquipment,
		up = BestRig,
		down = BestSupportStreak
	}
	BestSupportStreak.navigation = {
		left = BestScorestreak,
		up = BestTactical,
		down = BestGameMode
	}
	self.addButtonHelperFunction = function ( f28_arg0, f28_arg1 )
		f28_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f28_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f29_arg0, f29_arg1 )
		local f29_local0 = f29_arg1.controller or f20_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f20_local1, controller )
	return self
end

MenuBuilder.registerType( "HeadquartersCombatRecord", HeadquartersCombatRecord )
LUI.FlowManager.RegisterStackPopBehaviour( "HeadquartersCombatRecord", PopFunc )
LockTable( _M )
