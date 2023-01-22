local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.CAC.attachmentSelect"
f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = function ( f2_arg0 )
		return function ( f3_arg0 )
			return Cac.GetAttachmentSlotDataSourceByEquippedRef( f3_arg0, f1_arg1, f2_arg0 ) ~= nil
		end
		
	end
	
	local f1_local1 = function ( f4_arg0, f4_arg1 )
		return function ( f5_arg0 )
			local f5_local0 = f1_arg0.attachmentDataSources
			local f5_local1 = f1_arg2
			return f5_local0[REG2:GetValue( f5_arg0 ) + 1].pointCost:GetCountValue( f5_arg0 )
		end
		
	end
	
	local f1_local2 = function ( f6_arg0 )
		return function ( f7_arg0 )
			local f7_local0 = Cac.GetAttachmentSlotDataSourceByEquippedRef( f7_arg0, f1_arg1, f6_arg0 )
			if f7_local0 and f7_local0 == f1_arg0.attachmentDataSources[f1_arg2:GetValue( f7_arg0 ) + 1] then
				return 1
			elseif f7_local0 then
				return 0.5
			else
				return 0
			end
		end
		
	end
	
	local f1_local3 = function ( f8_arg0, f8_arg1, f8_arg2 )
		local f8_local0 = Cac.GetAttachmentSlotDataSourceByEquippedRef( f8_arg0, f8_arg1, f8_arg2 )
		return f8_local0 and f8_local0 ~= f1_arg0.attachmentDataSources[f1_arg2:GetValue( f8_arg0 ) + 1]
	end
	
	local f1_local4 = function ( f9_arg0, f9_arg1, f9_arg2 )
		return function ( f10_arg0 )
			return f9_arg2:GetValue( f10_arg0 ) or not f9_arg1:GetValue( f10_arg0 )
		end
		
	end
	
	local f1_local5 = function ( f11_arg0 )
		return function ( f12_arg0 )
			local f12_local0 = f1_arg0.attachmentDataSources[f1_arg2:GetValue( f12_arg0 ) + 1]
			local f12_local1 = Cac.CanAffordItem( f1_arg0.loadoutDataSource, f12_local0.pointCost, f12_arg0 )
			local f12_local2
			if not f12_local0.used:GetValue( f12_arg0 ) then
				f12_local2 = not f12_local1
			else
				f12_local2 = false
			end
			local f12_local3
			if not f1_local3( f12_arg0, f1_arg1, f11_arg0 ) then
				f12_local3 = f12_local2
			else
				f12_local3 = false
			end
			return f12_local3
		end
		
	end
	
	local f1_local6 = Cac.GetCategorizedAttachmentList( f1_arg1, f1_arg3 )
	local f1_local7 = f1_arg1.weapon:GetValue( f1_arg3 )
	local f1_local8 = Cac.GetAttachmentUnlockTable( f1_local7 )
	local f1_local9 = function ( f13_arg0, f13_arg1 )
		local f13_local0 = f1_local7 .. "+" .. Cac.GetAttachmentBaseRef( f13_arg0.ref )
		local f13_local1 = f1_local7 .. "+" .. Cac.GetAttachmentBaseRef( f13_arg1.ref )
		local f13_local2 = Engine.TableLookup( f1_local8, CSV.attachmentUnlockTable.cols.weaponAttachRef, f13_local0, CSV.attachmentUnlockTable.cols.unlockRank )
		local f13_local3 = Engine.TableLookup( f1_local8, CSV.attachmentUnlockTable.cols.weaponAttachRef, f13_local1, CSV.attachmentUnlockTable.cols.unlockRank )
		if f13_local2 ~= "" and f13_local3 ~= "" then
			return tonumber( f13_local2 ) < tonumber( f13_local3 )
		else
			return false
		end
	end
	
	for f1_local13, f1_local14 in pairs( Cac.AttachmentCategories ) do
		if f1_local6[f1_local14] ~= nil then
			table.sort( f1_local6[f1_local14].attachments, f1_local9 )
		end
	end
	f1_arg0.attachments = {
		categories = {}
	}
	f1_local10 = {
		f1_arg1.attachments.attachmentSlotOne,
		f1_arg1.attachments.attachmentSlotTwo,
		f1_arg1.attachments.attachmentSlotThree,
		f1_arg1.attachments.attachmentSlotFour,
		f1_arg1.attachments.attachmentSlotFive,
		f1_arg2
	}
	if Engine.IsAliensMode or f1_arg1.slot:GetValue( f1_arg3 ) == 0 then
		table.insert( f1_local10, f1_arg1.attachments.attachmentSlotSix )
	end
	f1_local11 = nil
	if Engine.IsCoreMode() then
		f1_local11 = LUI.ShallowCopy( f1_local10 )
		table.insert( f1_local11, f1_arg0.loadoutDataSource.pointCount )
	end
	for f1_local31, f1_local32 in pairs( f1_local6 ) do
		f1_arg0.attachments.categories[f1_local31] = {}
		f1_arg0.attachments.categories[f1_local31].attachmentList = LUI.DataSourceFromList.new( f1_local32.attachmentCount )
		f1_arg0.attachments.categories[f1_local31].attachmentList:SetCachingEnabled( true )
		f1_arg0.attachments.categories[f1_local31].categoryName = f1_local31
		f1_arg0.attachments.categories[f1_local31].attachmentList.MakeDataSourceAtIndex = function ( f14_arg0, f14_arg1, f14_arg2 )
			return f1_arg0.attachments.categories[f1_local31].attachmentList["weapon" .. f14_arg1]
		end
		
		local f1_local29 = 0
		for f1_local30 = 1, f1_local32.attachmentCount, 1 do
			local f1_local15 = f1_local32.attachments[f1_local30]
			local f1_local16 = f1_local15.ref
			local f1_local17 = Cac.GetAttachmentBaseRef( f1_local16 )
			local f1_local18 = f0_local0 .. ".attachments." .. f1_local31 .. "." .. f1_local17
			local f1_local19 = Cac.IsAttachmentUnlocked( f1_local17, f1_arg1.weapon:GetValue( f1_arg3 ), f1_arg3 )
			local f1_local20 = Cac.IsUnlockedEsports( Cac.IsAttachmentEsportsUnlocked( f1_local17, f1_arg1.weapon:GetValue( f1_arg3 ), f1_arg3 ) )
			if Engine.IsAliensMode() then
				f1_local19 = true
			end
			local f1_local21 = LUI.DataSourceInGlobalModel.new( f1_local18 .. ".unlocked", f1_local19 and f1_local20 )
			local f1_local22 = Cac.GetAttachmentUnlockText( f1_local17, f1_arg1.weapon:GetValue( f1_arg3 ), f1_arg3, not f1_local20 )
			local f1_local23 = LUI.ShallowCopy( f1_local10 )
			local f1_local24 = nil
			if Engine.IsCoreMode() then
				f1_local24 = LUI.AggregateDataSource.new( f1_arg0.menuDataModel, f1_local11, "attachments." .. f1_local31 .. "." .. f1_local16 .. ".disabledByPointCount", f1_local5( f1_local16 ) )
				table.insert( f1_local23, f1_local24 )
			end
			local f1_local25 = LUI.AggregateDataSource.new( f1_arg0.menuDataModel, f1_local10, "attachments." .. f1_local31 .. "." .. f1_local16 .. ".isEquipped", f1_local0( f1_local16 ) )
			local f1_local26 = LUI.DataSourceFromList.new( LUI.AggregateDataSource.new( f1_arg0.menuDataModel, f1_local10, "attachments." .. f1_local31 .. "." .. f1_local16 .. ".nodeCount", f1_local1( self, f1_arg3 ) ) )
			f1_local26.MakeDataSourceAtIndex = function ( f15_arg0, f15_arg1, f15_arg2 )
				return {
					isActive = f1_local25
				}
			end
			
			f1_arg0.attachments.categories[f1_local31].attachmentList["weapon" .. f1_local29] = {
				ref = f1_local16,
				baseRef = f1_local17,
				unlockText = LUI.DataSourceInGlobalModel.new( f1_local18 .. ".unlockText", f1_local22 ),
				name = LUI.DataSourceInGlobalModel.new( f1_local18 .. ".name", f1_local15.name ),
				desc = LUI.DataSourceInGlobalModel.new( f1_local18 .. ".desc", f1_local15.desc ),
				icon = LUI.DataSourceInGlobalModel.new( f1_local18 .. ".icon", f1_local15.image ),
				imageFull = LUI.DataSourceInGlobalModel.new( f1_local18 .. ".largeIcon", f1_local15.fullImage ),
				equipped = f1_local25,
				equipIconAlpha = LUI.AggregateDataSource.new( f1_arg0.menuDataModel, f1_local10, "attachments." .. f1_local31 .. "." .. f1_local16 .. ".equipAlpha", f1_local2( f1_local16 ) ),
				isUnlocked = f1_local21,
				isScanned = LUI.DataSourceInGlobalModel.new( f1_local18 .. ".scanned", nil ),
				costNodes = f1_local26,
				stats = {
					accuracy = LUI.DataSourceInGlobalModel.new( f1_local18 .. ".stats.accuracy", Cac.GetAttachmentStatAccuracy( f1_local16 ) ),
					damage = LUI.DataSourceInGlobalModel.new( f1_local18 .. ".stats.damage", Cac.GetAttachmentStatDamage( f1_local16 ) ),
					range = LUI.DataSourceInGlobalModel.new( f1_local18 .. ".stats.range", Cac.GetAttachmentStatRange( f1_local16 ) ),
					fireRate = LUI.DataSourceInGlobalModel.new( f1_local18 .. ".stats.fireRate", Cac.GetAttachmentStatFireRate( f1_local16 ) ),
					mobility = LUI.DataSourceInGlobalModel.new( f1_local18 .. ".stats.mobility", Cac.GetAttachmentStatMobility( f1_local16 ) )
				},
				weaponRef = f1_arg1.weapon:GetValue( f1_arg3 )
			}
			if Engine.IsCoreMode() then
				local f1_local27 = f1_arg0.attachments.categories[f1_local31].attachmentList
				local f1_local28 = "weapon"
				f1_local27["weapon" .. f1_local29].disabledByPointCount = f1_local24
				f1_arg0.attachments.categories[f1_local31].attachmentList["weapon" .. f1_local29].disabled = LUI.AggregateDataSource.new( f1_arg0.menuDataModel, f1_local23, "attachments." .. f1_local31 .. "." .. f1_local16 .. ".disabled", f1_local4( f1_local16, f1_local21, f1_local24 ) )
				f1_arg0.attachments.categories[f1_local31].attachmentList["weapon" .. f1_local29].weaponSlot = f1_arg1.slot:GetValue( f1_arg3 )
			else
				f1_arg0.attachments.categories[f1_local31].attachmentList["weapon" .. f1_local29].disabled = f1_local21:Filter( "disabled", Not )
			end
			f1_local29 = f1_local29 + 1
		end
	end
	for f1_local31, f1_local32 in pairs( Cac.AttachmentCategories ) do
		if not f1_arg0.attachments.categories[f1_local32] then
			f1_arg0.attachments.categories[f1_local32] = {}
			f1_arg0.attachments.categories[f1_local32].attachmentList = LUI.DataSourceFromList.new( 0 )
		end
	end
end

function PushFunc()
	WipeGlobalModelsAtPath( f0_local0 )
end

function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local2 = function ( f18_arg0, f18_arg1, f18_arg2 )
	if Engine.IsDevelopmentBuild() then
		f18_arg2.attachmentSlot = f18_arg2.attachmentSlot or 0
		if Engine.IsCoreMode() then
			local f18_local0 = f18_arg2.squadMemberDataSource
			if not f18_local0 then
				f18_local0 = DataSources.alwaysLoaded.playerData.MP.rankedloadouts.squadMembers
			end
			f18_arg2.squadMemberDataSource = f18_local0
			f18_local0 = GetCACPlayerDataDataSource( f18_arg2.squadMemberDataSource )
			local f18_local1 = f18_arg2.currentWeaponDataSource
			if not f18_local1 then
				f18_local1 = f18_local0.loadouts[0].weaponSlotOne
			end
			f18_arg2.currentWeaponDataSource = f18_local1
			f18_local1 = f18_arg2.loadoutDataSource
			if not f18_local1 then
				f18_local1 = f18_local0.loadouts[0]
			end
			f18_arg2.loadoutDataSource = f18_local1
		else
			local f18_local0 = f18_arg2.currentWeaponDataSource
			if not f18_local0 then
				f18_local0 = GetCACPlayerDataDataSource( DataSources.alwaysLoaded.playerData.MP.rankedloadouts.squadMembers )
				f18_local0 = f18_local0.loadouts[0].weaponSlotOne
			end
			f18_arg2.currentWeaponDataSource = f18_local0
		end
	end
	assert( f18_arg2.currentWeaponDataSource )
	assert( f18_arg2.attachmentSlot )
	if Engine.IsCoreMode() then
		assert( f18_arg2.loadoutDataSource )
		f18_arg0.loadoutDataSource = f18_arg2.loadoutDataSource
		assert( f18_arg2.squadMemberDataSource )
		f18_arg0.statsGroupDataSource = GetCACPlayerDataDataSource( f18_arg2.squadMemberDataSource )
		FrontEndScene.SetTeamAndScene( "loadout_select", f18_arg1 )
	end
	local f18_local0 = f18_arg2.currentWeaponDataSource
	f18_arg0.playerDataWeaponDataSource = f18_arg2.currentWeaponDataSource
	f18_arg0.menuDataModel = LUI.DataSourceInGlobalModel.new( f0_local0 )
	f18_arg0.loadoutDataSource = f18_arg2.loadoutDataSource
	f18_arg0.attachmentSlot = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".attachmentSlot", f18_arg2.attachmentSlot )
	f18_arg0.attachmentSlot:SetValue( f18_arg1, f18_arg2.attachmentSlot )
	local f18_local1 = LUI.FlowManager.GetScopedData( f18_arg0 )
	if f18_local1.updateOnRemoval then
		if f18_arg2.attachmentSlot > 1 then
			f18_arg0.attachmentSlot:SetValue( f18_arg1, f18_arg2.attachmentSlot - 1 )
		end
		f18_local1.updateOnRemoval = nil
	end
	if Engine.IsAliensMode() then
		if f18_arg2.attachmentSlot == 0 then
			f18_arg0.CPMenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_TITLE_OPTICS" ) ), 0 )
		else
			f18_arg0.CPMenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_TITLE_ATTACHMENTS" ) ), 0 )
		end
	elseif f18_arg2.attachmentSlot == 0 then
		f18_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_TITLE_OPTICS" ) ), 0 )
	else
		f18_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_TITLE_ATTACHMENTS" ) ), 0 )
	end
	f0_local1( f18_arg0, f18_local0, f18_arg0.attachmentSlot, f18_arg1 )
	if Engine.IsCoreMode() then
		local f18_local2 = f18_arg0.loadoutDataSource.name:GetValue( f18_arg1 )
		f18_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumbCreateAClass(), 0 )
	end
	f18_arg0.attachmentDataSources = {}
	table.insert( f18_arg0.attachmentDataSources, f18_local0.attachments.attachmentSlotOne )
	table.insert( f18_arg0.attachmentDataSources, f18_local0.attachments.attachmentSlotTwo )
	table.insert( f18_arg0.attachmentDataSources, f18_local0.attachments.attachmentSlotThree )
	table.insert( f18_arg0.attachmentDataSources, f18_local0.attachments.attachmentSlotFour )
	table.insert( f18_arg0.attachmentDataSources, f18_local0.attachments.attachmentSlotFive )
	if Engine.IsAliensMode() or f18_local0.slot:GetValue( f18_arg1 ) == 0 then
		table.insert( f18_arg0.attachmentDataSources, f18_local0.attachments.attachmentSlotSix )
	end
	f18_arg0.selectedStatsInfo = {
		accuracy = LUI.DataSourceInGlobalModel.new( f0_local0 .. "selectedAttachment.accuracy", 0 ),
		damage = LUI.DataSourceInGlobalModel.new( f0_local0 .. "selectedAttachment.damage", 0 ),
		range = LUI.DataSourceInGlobalModel.new( f0_local0 .. "selectedAttachment.range", 0 ),
		fireRate = LUI.DataSourceInGlobalModel.new( f0_local0 .. "selectedAttachment.fireRate", 0 ),
		mobility = LUI.DataSourceInGlobalModel.new( f0_local0 .. "selectedAttachment.mobility", 0 )
	}
	local f18_local2 = f18_local0.attachments
	local f18_local3 = {}
	local f18_local4 = f18_arg0.attachments.categories
	local f18_local5 = Cac.GetCategoryBySlotIndex
	local f18_local6 = f18_arg0.attachmentSlot
	f18_local3.content = f18_local4[f18_local5( REG9:GetValue( f18_arg1 ) )].attachmentList
	f18_local3.currentWeapon = {
		weaponRef = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".statsData.baseWeaponRef", f18_local0.weapon:GetValue( f18_arg1 ) ),
		weaponLootID = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".statsData.weaponLootID", f18_local0.lootItemID:GetValue( f18_arg1 ) ),
		attachmentOneRef = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".statsData.attachment0", f18_local0.attachments.attachmentSlotOne:GetValue( f18_arg1 ) ),
		attachmentTwoRef = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".statsData.attachment1", f18_local0.attachments.attachmentSlotTwo:GetValue( f18_arg1 ) ),
		attachmentThreeRef = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".statsData.attachment2", f18_local0.attachments.attachmentSlotThree:GetValue( f18_arg1 ) ),
		attachmentFourRef = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".statsData.attachment3", f18_local0.attachments.attachmentSlotFour:GetValue( f18_arg1 ) ),
		attachmentFiveRef = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".statsData.attachment4", f18_local0.attachments.attachmentSlotFive:GetValue( f18_arg1 ) ),
		attachmentSixRef = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".statsData.attachment5", f18_local0.attachments.attachmentSlotSix:GetValue( f18_arg1 ) )
	}
	if Engine.IsCoreMode() then
		f18_local3.points = f18_arg0.loadoutDataSource.points
		f18_local3.pointCountText = f18_arg2.loadoutDataSource.pointCountText
	end
	f18_arg0:SetDataSource( f18_local3, f18_arg1 )
	f18_arg0:SubscribeToModelThroughElement( f18_arg0.AttachmentList, "name", function ()
		local f19_local0 = f18_arg0.AttachmentList:GetDataSource()
		local f19_local1 = f18_arg0.attachmentSlot:GetValue( f18_arg1 )
		local f19_local2 = f19_local0.ref
		local f19_local3 = f18_local3.currentWeapon.attachmentOneRef
		local f19_local4 = f19_local3
		f19_local3 = f19_local3.SetValue
		local f19_local5 = f18_arg1
		if f19_local1 == 0 then
			local f19_local6 = f19_local2
		end
		f19_local3( f19_local4, f19_local5, f19_local6 or f18_local0.attachments.attachmentSlotOne:GetValue( f18_arg1 ) )
		f19_local3 = f18_local3.currentWeapon.attachmentTwoRef
		f19_local4 = f19_local3
		f19_local3 = f19_local3.SetValue
		f19_local5 = f18_arg1
		if f19_local1 == 1 then
			local f19_local7 = f19_local2
		end
		f19_local3( f19_local4, f19_local5, f19_local7 or f18_local0.attachments.attachmentSlotTwo:GetValue( f18_arg1 ) )
		f19_local3 = f18_local3.currentWeapon.attachmentThreeRef
		f19_local4 = f19_local3
		f19_local3 = f19_local3.SetValue
		f19_local5 = f18_arg1
		if f19_local1 == 2 then
			local f19_local8 = f19_local2
		end
		f19_local3( f19_local4, f19_local5, f19_local8 or f18_local0.attachments.attachmentSlotThree:GetValue( f18_arg1 ) )
		f19_local3 = f18_local3.currentWeapon.attachmentFourRef
		f19_local4 = f19_local3
		f19_local3 = f19_local3.SetValue
		f19_local5 = f18_arg1
		if f19_local1 == 3 then
			local f19_local9 = f19_local2
		end
		f19_local3( f19_local4, f19_local5, f19_local9 or f18_local0.attachments.attachmentSlotFour:GetValue( f18_arg1 ) )
		f19_local3 = f18_local3.currentWeapon.attachmentFiveRef
		f19_local4 = f19_local3
		f19_local3 = f19_local3.SetValue
		f19_local5 = f18_arg1
		if f19_local1 == 4 then
			local f19_local10 = f19_local2
		end
		f19_local3( f19_local4, f19_local5, f19_local10 or f18_local0.attachments.attachmentSlotFive:GetValue( f18_arg1 ) )
		if Engine.IsAliensMode() or f18_local0.slot:GetValue( f18_arg1 ) == 0 then
			f19_local3 = f18_local3.currentWeapon.attachmentSixRef
			f19_local4 = f19_local3
			f19_local3 = f19_local3.SetValue
			f19_local5 = f18_arg1
			if f19_local1 == 5 then
				local f19_local11 = f19_local2
			end
			f19_local3( f19_local4, f19_local5, f19_local11 or f18_local0.attachments.attachmentSlotSix:GetValue( f18_arg1 ) )
		end
	end )
	f18_arg0:addEventHandler( "restore_focus", function ( f20_arg0, f20_arg1 )
		if not f18_local0.used:GetValue( f18_arg1 ) then
			ACTIONS.LeaveMenu( f18_arg0 )
		end
	end )
	f18_local5 = MenuBuilder.BuildRegisteredType( "LobbyStatus", {
		controllerIndex = f18_arg1
	} )
	f18_local5:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -800, _1080p * -40, _1080p * -114, _1080p * -80 )
	f18_local5:Minimize()
	f18_arg0:addElement( f18_local5 )
	if Engine.IsAliensMode() then
		ClientWeapon.SetWeaponVisible( 0, false )
		assert( f18_arg0.bindButton )
		f18_arg0.bindButton:addEventHandler( "button_secondary", function ( f21_arg0, f21_arg1 )
			ClientWeapon.SetWeaponVisible( 0, true )
		end )
	end
	if CONDITIONS.IsDraftEnabled( f18_arg0 ) then
		assert( f18_arg0.LoadoutDraftTimer )
		Cac.SetupLoadoutDraftTimerRefresh( f18_arg0.LoadoutDraftTimer )
	end
end

function AttachmentSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "AttachmentSelect"
	self._animationSets = {}
	self._sequences = {}
	local f22_local1 = controller and controller.controllerIndex
	if not f22_local1 and not Engine.InFrontend() then
		f22_local1 = self:getRootController()
	end
	assert( f22_local1 )
	self:playSound( "menu_open" )
	local f22_local2 = self
	local f22_local3 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f22_local3 = LUI.UIImage.new()
		f22_local3.id = "Darkener"
		f22_local3:SetRGBFromInt( 0, 0 )
		f22_local3:SetAlpha( 0.5, 0 )
		f22_local3:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -1184, 0, _1080p * -224, _1080p * -115 )
		self:addElement( f22_local3 )
		self.Darkener = f22_local3
	end
	local AttachmentList = nil
	
	AttachmentList = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 4,
		maxVisibleRows = 4,
		controllerIndex = f22_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "Attachment", {
				controllerIndex = f22_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 143,
		rowHeight = _1080p * 150,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	AttachmentList.id = "AttachmentList"
	AttachmentList:setUseStencil( true )
	AttachmentList:SetGridDataSourceThroughElement( self, "content" )
	AttachmentList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 720, _1080p * 216, _1080p * 834 )
	self:addElement( AttachmentList )
	self.AttachmentList = AttachmentList
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f22_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local AttachmentImageFull = nil
	
	AttachmentImageFull = LUI.UIImage.new()
	AttachmentImageFull.id = "AttachmentImageFull"
	AttachmentImageFull:SetDotPitchEnabled( true )
	AttachmentImageFull:SetDotPitchX( 0, 0 )
	AttachmentImageFull:SetDotPitchY( 0, 0 )
	AttachmentImageFull:SetDotPitchContrast( 0, 0 )
	AttachmentImageFull:SetDotPitchMode( 0 )
	AttachmentImageFull:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -848, _1080p * -336, _1080p * 346, _1080p * 858 )
	AttachmentImageFull:SubscribeToModelThroughElement( AttachmentList, "imageFull", function ()
		local f24_local0 = AttachmentList:GetDataSource()
		f24_local0 = f24_local0.imageFull:GetValue( f22_local1 )
		if f24_local0 ~= nil then
			AttachmentImageFull:setImage( RegisterMaterial( f24_local0 ), 0 )
		end
	end )
	self:addElement( AttachmentImageFull )
	self.AttachmentImageFull = AttachmentImageFull
	
	local AttachmentDetails = nil
	
	AttachmentDetails = MenuBuilder.BuildRegisteredType( "AttachmentDetails", {
		controllerIndex = f22_local1
	} )
	AttachmentDetails.id = "AttachmentDetails"
	AttachmentDetails:SetDataSourceThroughElement( AttachmentList, nil )
	AttachmentDetails:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 736, 0, _1080p * 216, _1080p * 416 )
	self:addElement( AttachmentDetails )
	self.AttachmentDetails = AttachmentDetails
	
	local StatsPanel = nil
	
	StatsPanel = MenuBuilder.BuildRegisteredType( "WeaponStatsPanel", {
		controllerIndex = f22_local1
	} )
	StatsPanel.id = "StatsPanel"
	StatsPanel:SetDataSourceThroughElement( self, "currentWeapon" )
	StatsPanel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 746, _1080p * 1141, _1080p * -212.5, _1080p * -126.5 )
	self:addElement( StatsPanel )
	self.StatsPanel = StatsPanel
	
	local f22_local9 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f22_local9 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f22_local1
		} )
		f22_local9.id = "MenuTitle"
		f22_local9.MenuTitle:setText( ToUpperCase( "Hello" ), 0 )
		f22_local9.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
		f22_local9.Icon:SetTop( _1080p * -28.5, 0 )
		f22_local9.Icon:SetBottom( _1080p * 61.5, 0 )
		f22_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f22_local9 )
		self.MenuTitle = f22_local9
	end
	local f22_local10 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f22_local10 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f22_local1
		} )
		f22_local10.id = "CPMenuTitle"
		f22_local10.MenuTitle:setText( Engine.Localize( "MENU_NEW" ), 0 )
		f22_local10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f22_local10 )
		self.CPMenuTitle = f22_local10
	end
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:SetAlpha( 0, 0 )
	Lock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Lock:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -616, _1080p * -564, _1080p * 571.5, _1080p * 623.5 )
	self:addElement( Lock )
	self.Lock = Lock
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f22_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f22_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 142 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local f22_local14 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f22_local14 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f22_local1
		} )
		f22_local14.id = "CRMMain"
		f22_local14:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f22_local14 )
		self.CRMMain = f22_local14
	end
	local f22_local15 = nil
	if CONDITIONS.IsDraftEnabled( self ) then
		f22_local15 = MenuBuilder.BuildRegisteredType( "LoadoutDraftTimer", {
			controllerIndex = f22_local1
		} )
		f22_local15.id = "LoadoutDraftTimer"
		f22_local15:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, 0, _1080p * 64 )
		self:addElement( f22_local15 )
		self.LoadoutDraftTimer = f22_local15
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AttachmentImageFull:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.AttachmentImageFull:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -864.5, _1080p * -352.5, _1080p * 346, _1080p * 858, 0 )
				end,
				function ()
					return self.AttachmentImageFull:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -825.5, _1080p * -313.5, _1080p * 346, _1080p * 858, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.MenuOpen = function ()
			AttachmentImageFull:AnimateSequence( "MenuOpen" )
		end
		
		AttachmentImageFull:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.AttachmentImageFull:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.AttachmentImageFull:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.AttachmentImageFull:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.AttachmentImageFull:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.AttachmentImageFull:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.AttachmentImageFull:SetDotPitchContrast( 0, 300 )
				end
			},
			{
				function ()
					return self.AttachmentImageFull:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AttachmentImageFull:SetAlpha( 1, 30 )
				end,
				function ()
					return self.AttachmentImageFull:SetAlpha( 0, 30 )
				end,
				function ()
					return self.AttachmentImageFull:SetAlpha( 1, 30 )
				end,
				function ()
					return self.AttachmentImageFull:SetAlpha( 0, 30 )
				end,
				function ()
					return self.AttachmentImageFull:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.UpdateImage = function ()
			AttachmentImageFull:AnimateSequence( "UpdateImage" )
		end
		
		Lock:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Lock:AnimateSequence( "Locked" )
		end
		
		Lock:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			Lock:AnimateSequence( "Unlocked" )
		end
		
	end
	
	self._animationSets.CP = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AttachmentImageFull:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.AttachmentImageFull:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -864.5, _1080p * -352.5, _1080p * 346, _1080p * 858, 0 )
				end,
				function ()
					return self.AttachmentImageFull:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -825.5, _1080p * -313.5, _1080p * 346, _1080p * 858, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		StatsPanel:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.StatsPanel:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.MenuOpen = function ()
			AttachmentImageFull:AnimateSequence( "MenuOpen" )
			StatsPanel:AnimateSequence( "MenuOpen" )
		end
		
		AttachmentImageFull:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.AttachmentImageFull:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.AttachmentImageFull:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.AttachmentImageFull:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.AttachmentImageFull:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.AttachmentImageFull:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.AttachmentImageFull:SetDotPitchContrast( 0, 300 )
				end
			},
			{
				function ()
					return self.AttachmentImageFull:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AttachmentImageFull:SetAlpha( 1, 30 )
				end,
				function ()
					return self.AttachmentImageFull:SetAlpha( 0, 30 )
				end,
				function ()
					return self.AttachmentImageFull:SetAlpha( 1, 30 )
				end,
				function ()
					return self.AttachmentImageFull:SetAlpha( 0, 30 )
				end,
				function ()
					return self.AttachmentImageFull:SetAlpha( 1, 30 )
				end
			}
		} )
		StatsPanel:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.StatsPanel:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.UpdateImage = function ()
			AttachmentImageFull:AnimateSequence( "UpdateImage" )
			StatsPanel:AnimateSequence( "UpdateImage" )
		end
		
		Lock:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Lock:AnimateSequence( "Locked" )
		end
		
		Lock:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			Lock:AnimateSequence( "Unlocked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	AttachmentDetails:SetDataSourceThroughElement( AttachmentList, nil )
	StatsPanel:SetDataSourceThroughElement( self, "currentWeapon" )
	self.addButtonHelperFunction = function ( f71_arg0, f71_arg1 )
		f71_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f71_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f72_arg0, f72_arg1 )
		local f72_local0 = f72_arg1.controller or f22_local1
		ACTIONS.LeaveMenu( self )
	end )
	self:SubscribeToModelThroughElement( AttachmentList, "desc", function ()
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CACItemHeader",
			sequenceName = "UpdateDescription",
			elementPath = "AttachmentDetails.CACItemHeader"
		} )
	end )
	self:SubscribeToModelThroughElement( AttachmentList, "imageFull", function ()
		ACTIONS.AnimateSequence( self, "UpdateImage" )
	end )
	f0_local2( self, f22_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "CP" )
		ACTIONS.AnimateSequence( self, "MenuOpen" )
	end
	return self
end

MenuBuilder.registerType( "AttachmentSelect", AttachmentSelect )
LUI.FlowManager.RegisterStackPushBehaviour( "AttachmentSelect", PushFunc )
LUI.FlowManager.RegisterStackPopBehaviour( "AttachmentSelect", PopFunc )
LockTable( _M )
