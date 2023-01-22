ACTIONS = {
	AnimateSequence = function ( f1_arg0, f1_arg1 )
		f1_arg0._sequences[f1_arg1]()
	end,
	AnimateSequenceByElement = function ( f2_arg0, f2_arg1 )
		if f2_arg0[f2_arg1.elementName] then
			f2_arg0[f2_arg1.elementName]._sequences[f2_arg1.sequenceName]()
		else
			local f2_local0 = f2_arg0
			for f2_local4, f2_local5 in ipairs( LUI.Split( f2_arg1.elementPath, "." ) ) do
				f2_local0 = f2_local0[f2_local5]
			end
			assert( f2_local0 )
			f2_local0._sequences[f2_arg1.sequenceName]()
		end
	end,
	SetAnimationSet = function ( f3_arg0, f3_arg1 )
		f3_arg0._animationSets[f3_arg1]()
		ACTIONS.AnimateSequence( f3_arg0, "DefaultSequence" )
	end,
	SetText = function ( f4_arg0, f4_arg1 )
		f4_arg0:setText( Engine.Localize( f4_arg1 ) )
	end,
	SetAlpha = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		f5_arg0:SetAlpha( f5_arg1, f5_arg2, f5_arg3 )
	end,
	GainFocus = function ( f6_arg0, f6_arg1, f6_arg2 )
		f6_arg0[f6_arg1]:processEvent( {
			name = "gain_focus",
			controller = f6_arg2
		} )
	end,
	LoseFocus = function ( f7_arg0, f7_arg1, f7_arg2 )
		local f7_local0
		if 0 < #f7_arg1 then
			f7_local0 = f7_arg0[f7_arg1]
			if not f7_local0 then
			
			else
				f7_local0:processEvent( {
					name = "lose_focus",
					controller = f7_arg2
				} )
			end
		end
		f7_local0 = f7_arg0
	end,
	DebugPrint = function ( f8_arg0, f8_arg1 )
		DebugPrint( f8_arg1 )
	end,
	PlaySoundSetSound = function ( f9_arg0, f9_arg1, f9_arg2 )
		f9_arg0:playSound( f9_arg1, f9_arg2 )
	end,
	StopSoundSetSound = function ( f10_arg0, f10_arg1 )
		f10_arg0:stopSound( f10_arg1 )
	end,
	AddBlur = function ( f11_arg0, f11_arg1, f11_arg2 )
		local self = LUI.UIElement.new( {
			worldBlur = f11_arg2
		} )
		self:setupWorldBlur()
		self.id = f11_arg1
		f11_arg0:addElement( self )
	end,
	ZombiePauseGame = function ( f12_arg0 )
		Engine.SetDvarInt( "cl_paused", 1 )
	end,
	ZombieResetTutorial = function ( f13_arg0, f13_arg1 )
		if Engine.InFrontend() then
			local f13_local0 = Engine.TableGetRowCount( CSV.zombieTutorialTable.file ) - 1
			for f13_local1 = 0, f13_local0, 1 do
				Engine.SetPlayerDataEx( f13_arg1, CoD.StatsGroup.Coop, "tutorial", Engine.TableLookupByRow( CSV.zombieTutorialTable.file, f13_local1, 1 ), "saw_message", 0 )
			end
		else
			Engine.NotifyServer( "reset_zombies_tutorials", 1 )
		end
	end,
	ZombieTutorialResumeGame = function ( f14_arg0 )
		Engine.Unpause()
		Engine.NotifyServer( "tutorial_unpause", 1 )
	end,
	PauseGame = function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg0:Wait( 1 )
		local f15_local1 = f15_arg1 or false
		f15_local0.onComplete = function ()
			Engine.Pause( f15_local1 )
		end
		
	end,
	ResumeGame = function ( f17_arg0 )
		PreGame.RestoreDuckAudio()
		if Engine.IsVideoPlaying() then
			Engine.ResumeVideo()
			if not LUI.FlowManager.IsInStack( "pre_game" ) then
				Engine.Unpause()
			end
		else
			Engine.Unpause()
		end
	end,
	ReturnToHub = function ( f18_arg0 )
		
	end,
	RunFunctionFromDataSource = function ( f19_arg0, f19_arg1 )
		assert( f19_arg1 )
		assert( type( f19_arg1 ) == "function" )
		f19_arg1()
	end,
	CloseAllMenus = function ( f20_arg0 )
		LUI.FlowManager.RequestCloseAllMenus()
	end,
	CloseChildren = function ( f21_arg0 )
		f21_arg0:closeChildren()
	end,
	LeaveMenu = function ( f22_arg0 )
		LUI.FlowManager.RequestLeaveMenu( f22_arg0, true )
	end,
	LeaveMenuByName = function ( f23_arg0 )
		LUI.FlowManager.RequestLeaveMenuByName( f23_arg0, true )
	end,
	RestoreMenu = function ( f24_arg0, f24_arg1, f24_arg2 )
		LUI.FlowManager.RequestRestoreMenu( f24_arg0, f24_arg1, f24_arg2 )
	end,
	OpenMenu = function ( f25_arg0, f25_arg1, f25_arg2 )
		LUI.FlowManager.RequestAddMenu( f25_arg0, f25_arg1, f25_arg2, nil, nil, true )
	end,
	OpenPopupMenu = function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		LUI.FlowManager.RequestPopupMenu( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
	end,
	OpenLoadoutRemovalPopup = function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		local f27_local0 = f27_arg0:GetCurrentMenu()
		local f27_local1 = f27_arg0:GetDataSource()
		local f27_local2 = f27_local1.weaponSlot
		local f27_local3 = f27_local1.perkSlot
		local f27_local4 = f27_local0.loadoutDataSource
		local f27_local5 = f27_local0.statsGroupDataSource
		local f27_local6 = f27_local1.costNodes
		if not f27_local6 then
			if f27_local1.power then
				f27_local6 = f27_local1.power.pointCost
			elseif f27_local1.weapon then
				f27_local6 = f27_local1.weapon.pointCost
			end
		end
		LUI.FlowManager.RequestAddMenu( f27_arg1, true, f27_arg3, nil, {
			weaponSlot = f27_local2,
			perkSlot = f27_local3,
			desiredItemCost = f27_local6,
			loadoutDataSource = f27_local4,
			statsGroupDataSource = f27_local5
		} )
	end,
	OpenContextualMenu = function ( f28_arg0, f28_arg1, f28_arg2 )
		assert( f28_arg1.ContextualMenuDataSource )
		assert( f28_arg1.contextMenuWidgetName )
		if f28_arg1.contextualMenu ~= nil then
			f28_arg1.contextualMenu:closeTree()
			f28_arg1.contextualMenu = nil
		end
		local f28_local0 = LUI.ContextualMenu.new( {
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			top = 0,
			bottom = 0,
			left = 0,
			right = 0,
			spacing = 2
		}, {
			controllerIndex = f28_arg2,
			buttonsDataSource = f28_arg1.ContextualMenuDataSource,
			ownerButton = f28_arg1
		} )
		f28_arg1.contextMenuWidgetName:addElement( f28_local0 )
		f28_arg1.contextualMenu = f28_local0
		f28_arg1.navigation = {}
		f28_arg1.navigation.right = f28_local0
		f28_arg0:dispatchEventToChildren( {
			name = "button_contextual_menu_open",
			selectedButton = f28_arg1
		} )
	end,
	NextPage = function ( f29_arg0 )
		f29_arg0:dispatchEventToChildren( {
			name = "next_page"
		} )
	end,
	PrevPage = function ( f30_arg0 )
		f30_arg0:dispatchEventToChildren( {
			name = "prev_page"
		} )
	end,
	ScriptNotify = function ( f31_arg0, f31_arg1 )
		Engine.NotifyServer( f31_arg0, f31_arg1 )
	end,
	AdvancePostGame = function ( f32_arg0 )
		PostGameFanfare:advance()
	end,
	PlayMission = function ( f33_arg0, f33_arg1 )
		
	end,
	OpenLoadoutEditMenu = function ( f34_arg0, f34_arg1 )
		f34_arg0:dispatchEventToCurrentMenu( {
			name = "open_loadout_edit_menu",
			focusLoadout = f34_arg1
		} )
	end,
	CloseLoadoutEditMenu = function ( f35_arg0 )
		f35_arg0:dispatchEventToCurrentMenu( {
			name = "close_loadout_edit_menu"
		} )
	end,
	CloseRigSelectMenu = function ( f36_arg0 )
		f36_arg0:dispatchEventToCurrentMenu( {
			name = "close_rig_select_menu"
		} )
	end,
	OnSelectPerk = function ( f37_arg0, f37_arg1 )
		local f37_local0 = f37_arg0:GetCurrentMenu()
		local f37_local1 = f37_local0.loadoutDataSource
		local f37_local2 = f37_arg0:GetDataSource()
		local f37_local3, f37_local4 = Cac.GetPerkSlotDataSourceByEquippedRef( f37_arg1, f37_local1, f37_local2.ref:GetValue( f37_arg1 ) )
		if not f37_local3 then
			local f37_local5 = Cac.GetPerkSlotDataSourceByIndex( f37_arg1, f37_local1, f37_local0.perkSlot )
			if f37_local0.selectedPerkIsExtra:GetValue( f37_arg1 ) then
				f37_local5.extraPerk:SetValue( f37_arg1, f37_local2.ref:GetValue( f37_arg1 ) )
			else
				f37_local5.perk:SetValue( f37_arg1, f37_local2.ref:GetValue( f37_arg1 ) )
			end
		end
	end,
	OnSelectAttachment = function ( f38_arg0, f38_arg1 )
		local f38_local0 = f38_arg0:GetCurrentMenu()
		local f38_local1 = nil
		if Engine.IsMultiplayer() then
			f38_local1 = f38_local0.attachmentSlot:GetValue( f38_arg1 )
		else
			f38_local1 = f38_local0.attachmentSlot
		end
		local f38_local2 = f38_arg0:GetDataSource()
		local f38_local3 = f38_local0.attachmentDataSources[f38_local1 + 1]
		if f38_local3:GetValue( f38_arg1 ) ~= Cac.GetAttachmentBaseRef( f38_local2.ref ) then
			local f38_local4 = Cac.GetAttachmentSlotDataSourceByEquippedRef( f38_arg1, f38_local0.playerDataWeaponDataSource, f38_local2.ref )
			Cac.SetAttachmentDataSource( f38_arg1, f38_local3, f38_local2.baseRef )
			if f38_local4 then
				Cac.ClearAttachment( f38_arg1, f38_local0.playerDataWeaponDataSource, f38_local4 )
			end
			if f38_local1 == 0 then
				Cac.ClearReticle( f38_local0.playerDataWeaponDataSource, f38_arg1 )
			end
		end
		LUI.FlowManager.RequestLeaveMenu( f38_arg0, true, true )
	end,
	OnClearAttachment = function ( f39_arg0, f39_arg1 )
		local f39_local0 = f39_arg0:GetCurrentMenu()
		local f39_local1 = f39_local0.statsGroupDataSource
		local f39_local2 = f39_arg0:GetDataSource()
		local f39_local3 = nil
		if Engine.IsAliensMode() then
			f39_local3 = WEAPON_BUILD.GetWeaponDataSourceForKey( f39_local2.weaponRef:GetValue( f39_arg1 ), f39_arg1 )
		else
			local f39_local4 = nil
			if f39_local0.loadoutDataSource then
				f39_local4 = f39_local0.loadoutDataSource.loadoutIndex
			elseif Engine.IsMultiplayer() then
				assert( f39_local0.LoadoutList )
				assert( f39_local0.LoadoutList.Loadouts )
				local f39_local5 = f39_local0.LoadoutList.Loadouts:GetDataSource()
				f39_local4 = f39_local5.loadoutIndex
			else
				assert( f39_local0.SPLoadout )
				local f39_local5 = f39_local0.SPLoadout:GetDataSource()
				f39_local4 = f39_local5.loadoutIndex
			end
			local f39_local5 = f39_local2.weaponIndex
			local f39_local6 = nil
			if Engine.IsMultiplayer() then
				f39_local6 = f39_local1.loadouts:GetDataSourceAtIndex( f39_local4, f39_arg1 )
			else
				f39_local6 = f39_local0.loadoutsDataSource:GetDataSourceAtIndex( f39_local4, f39_arg1 )
			end
			f39_local3 = f39_local6.weaponSetups[f39_local5]
		end
		Cac.ClearAttachment( f39_arg1, f39_local3, f39_local2 )
		if f39_local2.index == 0 then
			Cac.ClearReticle( f39_local3, f39_arg1 )
		end
		if Engine.IsAliensMode() then
			f39_local0:processEvent( {
				name = "attachment_cleared",
				controller = f39_arg1
			} )
		end
	end,
	OnClearPerk = function ( f40_arg0, f40_arg1 )
		local f40_local0 = f40_arg0:getParent()
		local f40_local1 = f40_arg0:GetDataSource()
		if f40_arg0 == f40_local0.ExtraPerk then
			Cac.ClearPerk( f40_arg1, f40_local1 )
		else
			local f40_local2 = f40_local0.ExtraPerk:GetDataSource()
			f40_local1:SetValue( f40_arg1, f40_local2:GetValue( f40_arg1 ) )
			Cac.ClearPerk( f40_arg1, f40_local2 )
		end
	end,
	OnClearStreaks = function ( f41_arg0, f41_arg1 )
		local f41_local0 = f41_arg0:GetDataSource()
		for f41_local1 = Cac.FirstStreakIndex, Cac.LastStreakIndex, 1 do
			Cac.ClearStreakSlot( f41_local0, f41_arg1, f41_local1 )
		end
	end,
	OnClearWeapon = function ( f42_arg0, f42_arg1 )
		local f42_local0 = f42_arg0:GetDataSource()
		assert( f42_local0 )
		Cac.ClearWeaponAndAttachments( f42_local0, f42_arg1 )
		if Engine.IsMultiplayer() then
			Cac.ClearWeaponCosmetics( f42_local0, f42_arg1 )
		end
	end,
	OnClearPower = function ( f43_arg0, f43_arg1 )
		local f43_local0 = f43_arg0:GetDataSource()
		assert( f43_local0 )
		Cac.ClearPower( f43_local0, f43_arg1 )
	end,
	OnClearExtraPower = function ( f44_arg0, f44_arg1 )
		local f44_local0 = f44_arg0:GetDataSource()
		assert( f44_local0 )
		Cac.ClearExtraPower( f44_local0, f44_arg1 )
	end,
	OnClearSPPower = function ( f45_arg0, f45_arg1 )
		local f45_local0 = f45_arg0:GetCurrentMenu()
		local f45_local1 = f45_arg0:GetDataSource()
		assert( f45_local1 )
		assert( f45_local1.ref )
		assert( f45_local1.slot )
		if f45_local1.slot:GetValue( f45_arg1 ) == 0 then
			local f45_local2 = f45_local0.SPLoadout:GetDataSource()
			assert( f45_local1.handSlot )
			local f45_local3 = Cac.GetSPPowerHandFromSlot( f45_local2, f45_local1.handSlot:GetValue( f45_arg1 ) )
			local f45_local4 = f45_local3.extraPower
			f45_local1.ref:SetValue( f45_arg1, f45_local4.ref:GetValue( f45_arg1 ) )
			f45_local4.ref:SetValue( f45_arg1, Cac.powerNoneValue )
		else
			f45_local1.ref:SetValue( f45_arg1, Cac.powerNoneValue )
		end
	end,
	OnClearRigPerk = function ( f46_arg0, f46_arg1 )
		local f46_local0 = f46_arg0:GetDataSource()
		f46_local0 = f46_local0.ref
		assert( f46_local0 )
		Cac.ClearPerk( f46_arg1, f46_local0 )
	end,
	OpenWeaponSelectMenu = function ( f47_arg0, f47_arg1, f47_arg2 )
		local f47_local0 = f47_arg1:GetDataSource()
		assert( f47_local0 )
		assert( f47_local0.slot )
		local f47_local1 = f47_arg0:GetCurrentMenu()
		local f47_local2 = nil
		if Engine.IsMultiplayer() then
			f47_local2 = f47_local1.squadMemberDataSource
			assert( f47_local2 )
			f47_local2.isProperty = false
			f47_local2.__serializable = false
		end
		local f47_local3 = Engine.IsMultiplayer() and f47_local1.LoadoutList.Loadouts:GetDataSource() or f47_local1.SPLoadout:GetDataSource()
		assert( f47_local3 )
		f47_local0.isProperty = false
		f47_local3.isProperty = false
		f47_local0.__serializable = false
		f47_local3.__serializable = false
		LUI.FlowManager.RequestAddMenu( Engine.IsMultiplayer() and "WeaponSelect" or "SPWeaponSelect", true, f47_arg2, nil, {
			weaponDataSource = f47_local0,
			loadoutDataSource = f47_local3,
			squadMemberDataSource = f47_local2,
			XUID = f47_local1.XUID
		}, true )
	end,
	EquipWeapon = function ( f48_arg0, f48_arg1 )
		local f48_local0 = f48_arg0:GetCurrentMenu()
		local f48_local1 = f48_local0.weaponDataSource
		assert( f48_local1 )
		assert( f48_local1.weapon )
		local f48_local2 = f48_arg0:GetDataSource()
		assert( f48_local2 )
		assert( f48_local2.weapon )
		assert( f48_local2.weapon.baseWeaponRef )
		local f48_local3 = f48_local2.weapon.baseWeaponRef:GetValue( f48_arg1 )
		local f48_local4 = true
		if Engine.IsMultiplayer() then
			assert( f48_local1.lootItemID )
			assert( f48_local1.variantID )
			assert( f48_local2.weapon.ref )
			assert( f48_local2.weapon.variantID )
			local f48_local5 = tonumber( f48_local2.weapon.variantID:GetValue( f48_arg1 ) )
			assert( f48_local5 )
			local f48_local6 = 0
			local f48_local7 = false
			if f48_local5 >= 0 then
				f48_local6 = Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.ref, f48_local2.weapon.ref:GetValue( f48_arg1 ), CSV.weaponLootMaster.cols.index )
				assert( #f48_local6 > 0 )
				assert( tonumber( f48_local6 ) )
				f48_local6 = tonumber( f48_local6 )
				assert( f48_local6 > 0 )
				f48_local7 = Cac.IsLootIDMk2( f48_local6 )
			end
			if f48_local3 == f48_local1.ref:GetValue( f48_arg1 ) then
				f48_local4 = false
				local f48_local8 = f48_local1.variantID:GetValue( f48_arg1 )
				local f48_local9 = f48_local1.lootItemID:GetValue( f48_arg1 )
				if f48_local8 >= 0 then
					local f48_local10 = Cac.IsLootIDMk2( f48_local9 )
				else
					local f48_local10 = false
				end
				if f48_local5 ~= f48_local8 or f48_local6 ~= f48_local9 then
					Cac.ClearLootBlockedAttachments( f48_local1, f48_local2, f48_local6, f48_arg1 )
					local f48_local11 = f48_local1.attachments.attachmentSlotOne.ref:GetValue( f48_arg1 )
					if LOADOUT.GetOpticType( Cac.GetOpticRefForWeapon( f48_local11, f48_local3, f48_local8 ) ) ~= LOADOUT.GetOpticType( Cac.GetOpticRefForWeapon( f48_local11, f48_local3, f48_local5 ) ) then
						Cac.ClearReticle( f48_local1, f48_arg1 )
					end
					if not Cac.DoesWeaponHaveAttachmentsByCategory( f48_local3, f48_local6, f48_arg1, Cac.AttachmentCategories.optics ) then
						Cac.ClearReticle( f48_local1, f48_arg1 )
					end
				end
			else
				f48_local1.camoInfo.ref:SetValue( f48_arg1, Cac.CamoNoneValue )
				f48_local1.reticleInfo.ref:SetValue( f48_arg1, Cac.ReticleNoneValue )
				f48_local1.cosmeticAttachmentInfo.ref:SetValue( f48_arg1, Cac.CosmeticAttachmentNoneValue )
			end
			f48_local1.weapon:SetValue( f48_arg1, f48_local3 )
			f48_local1.lootItemID:SetValue( f48_arg1, f48_local6 )
			f48_local1.variantID:SetValue( f48_arg1, f48_local5 )
		else
			f48_local1.weapon:SetValue( f48_arg1, f48_local3 )
		end
		if not Engine.IsMultiplayer() or f48_local4 then
			Cac.ClearAllAttachments( f48_local1, f48_arg1 )
		elseif Engine.IsMultiplayer() then
			for f48_local8, f48_local9 in pairs( f48_local1.attachments ) do
				local f48_local10 = f48_local9.ref:GetValue( f48_arg1 )
				f48_local9:SetValue( f48_arg1, "none" )
				f48_local9:SetValue( f48_arg1, f48_local10 )
			end
		end
	end,
	OpenWeaponPersonalizeMenu = function ( f49_arg0, f49_arg1, f49_arg2 )
		if not f49_arg2 then
			f49_arg2 = f49_arg0:GetDataSource()
		end
		assert( f49_arg2 )
		f49_arg2.isProperty = false
		f49_arg2.__serializable = false
		LUI.FlowManager.RequestAddMenu( "PersonalizeWeapon", true, f49_arg1, nil, {
			weaponDataSource = f49_arg2
		}, true )
	end,
	OpenReticlePersonalizeMenu = function ( f50_arg0, f50_arg1, f50_arg2 )
		local f50_local0 = f50_arg0:GetDataSource()
		assert( f50_local0 )
		assert( f50_arg2 )
		f50_local0.isProperty = false
		f50_arg2.isProperty = false
		f50_local0.__serializable = false
		f50_arg2.__serializable = false
		LUI.FlowManager.RequestAddMenu( "ReticleSelect", true, f50_arg1, nil, {
			opticDataSource = f50_local0,
			weaponDataSource = f50_arg2
		}, true )
	end,
	OpenStreakSelectMenu = function ( f51_arg0, f51_arg1, f51_arg2 )
		local f51_local0 = f51_arg0:GetCurrentMenu()
		local f51_local1 = f51_local0.squadMemberDataSource
		assert( f51_local1 )
		f51_local1.isProperty = false
		f51_local1.__serializable = false
		LUI.FlowManager.RequestAddMenu( "StreakSelect", true, f51_arg2, nil, {
			squadMemberDataSource = f51_local1
		}, true )
	end,
	OnSelectStreak = function ( f52_arg0, f52_arg1, f52_arg2 )
		local f52_local0 = f52_arg0:GetCurrentMenu()
		local f52_local1 = f52_local0.squadMemberDataSource
		local f52_local2 = f52_local0.statsGroupDataSource
		assert( f52_local1 )
		assert( f52_local2 )
		local f52_local3 = f52_arg0:GetDataSource()
		assert( f52_local3 )
		assert( f52_local3.streak )
		assert( f52_local3.streak.ref )
		assert( f52_local3.streak.baseStreakRef )
		assert( f52_local3.streak.score )
		assert( f52_local3.streak.lootID )
		local f52_local4 = f52_local3.streak.baseStreakRef:GetValue( f52_arg1 )
		local f52_local5 = f52_local3.streak.lootID:GetValue( f52_arg1 )
		assert( f52_local5 )
		if not Cac.TryToEquipStreak( f52_local1, f52_local2, f52_local4, f52_local5, f52_arg1 ) then
			LUI.FlowManager.RequestPopupMenu( f52_arg0, "StreakReplacementPopup", true, f52_arg1, false, {
				streakToEquipButton = f52_arg0,
				onStreakEquippedFunc = f52_arg2
			} )
		elseif f52_arg2 then
			f52_arg2()
		end
		f52_local0.BaseStreaks:RefreshContent()
	end,
	EquipPower = function ( f53_arg0, f53_arg1 )
		local f53_local0 = f53_arg0:GetCurrentMenu()
		local f53_local1 = f53_arg0:GetDataSource()
		assert( f53_local1 )
		assert( f53_local1.power )
		assert( f53_local1.power.ref )
		assert( f53_local1.power.basePowerRef )
		assert( f53_local1.power.lootID )
		local f53_local2 = f53_local1.power.basePowerRef:GetValue( f53_arg1 )
		local f53_local3 = f53_local1.power.lootID:GetValue( f53_arg1 )
		local f53_local4 = f53_local0.equippedSlotDataSource
		assert( f53_local4 )
		assert( f53_local4.power )
		assert( f53_local4.lootItemID )
		f53_local4.power:SetValue( f53_arg1, f53_local2 )
		f53_local4.lootItemID:SetValue( f53_arg1, f53_local3 )
	end,
	EquipSPPower = function ( f54_arg0, f54_arg1 )
		local f54_local0 = f54_arg0:GetCurrentMenu()
		local f54_local1 = f54_local0.equippedSlotDataSource
		local f54_local2 = f54_arg0:GetDataSource()
		assert( f54_local2 )
		assert( f54_local2.power )
		assert( f54_local2.power.ref )
		local f54_local3 = f54_local2.power.ref:GetValue( f54_arg1 )
		local f54_local4 = f54_local0.handDataSource
		local f54_local5 = f54_local1.slot:GetValue( f54_arg1 )
		local f54_local6 = f54_local4.power.ref
		local f54_local7 = f54_local4.extraPower.ref
		if f54_local5 == 0 then
			local f54_local8 = f54_local7
		end
		local f54_local9 = f54_local8 or f54_local6
		if f54_local9:GetValue( f54_arg1 ) == f54_local3 then
			f54_local6:SetValue( f54_arg1, f54_local3 )
			f54_local7:SetValue( f54_arg1, Cac.powerNoneValue )
		else
			f54_local1.ref:SetValue( f54_arg1, f54_local3 )
		end
	end,
	OpenPowerSelectMenu = function ( f55_arg0, f55_arg1, f55_arg2 )
		local f55_local0 = f55_arg0:GetCurrentMenu()
		local f55_local1 = f55_local0.LoadoutList.Loadouts:GetDataSource()
		assert( f55_local1 )
		f55_local1.isProperty = false
		f55_local1.__serializable = false
		local f55_local2 = f55_local0.squadMemberDataSource
		assert( f55_local2 )
		f55_local2.isProperty = false
		f55_local2.__serializable = false
		local f55_local3 = f55_arg1:GetDataSource()
		local f55_local4 = f55_local3.slot:GetValue( f55_arg2 )
		assert( f55_local4 )
		local f55_local5
		if f55_local4 == 0 then
			f55_local5 = f55_local1.powerSlotOne
			if not f55_local5 then
			
			else
				assert( f55_local5 )
				f55_local5.isProperty = false
				f55_local5.__serializable = false
				LUI.FlowManager.RequestAddMenu( "PowerSelect", true, f55_arg2, nil, {
					equippedSlotDataSource = f55_local5,
					loadoutDataSource = f55_local1,
					squadMemberDataSource = f55_local2
				}, true )
			end
		end
		f55_local5 = f55_local1.powerSlotTwo
	end,
	OpenSPPowerSelectMenu = function ( f56_arg0, f56_arg1, f56_arg2 )
		local f56_local0 = f56_arg1:GetDataSource()
		assert( f56_local0 )
		assert( f56_local0.handSlot )
		f56_local0.isProperty = false
		f56_local0.__serializable = false
		local f56_local1 = f56_arg0:GetCurrentMenu()
		local f56_local2 = f56_local1.SPLoadout:GetDataSource()
		assert( f56_local2 )
		assert( f56_local2.powers )
		assert( f56_local2.offhandPowers )
		local f56_local3 = Cac.GetSPPowerHandFromSlot( f56_local2, f56_local0.handSlot:GetValue( f56_arg2 ) )
		assert( f56_local3 )
		f56_local3.isProperty = false
		f56_local3.__serializable = false
		f56_local2.isProperty = false
		f56_local2.__serializable = false
		LUI.FlowManager.RequestAddMenu( "SPPowerSelect", true, f56_arg2, nil, {
			equippedSlotDataSource = f56_local0,
			handDataSource = f56_local3,
			loadoutDataSource = f56_local2
		}, true )
	end,
	OpenJackalEquipMenu = function ( f57_arg0, f57_arg1, f57_arg2 )
		local f57_local0 = f57_arg1:GetDataSource()
		assert( f57_local0 )
		f57_local0.isProperty = false
		f57_local0.__serializable = false
		local f57_local1 = f57_arg0:GetCurrentMenu()
		local f57_local2 = f57_local1.SPLoadout:GetDataSource()
		assert( f57_local2 )
		LUI.FlowManager.RequestAddMenu( "JackalEquipSelect", true, f57_arg2, nil, {
			equippedSlotDataSource = f57_local0,
			loadoutIndex = f57_local2.loadoutIndex
		}, true )
	end,
	EquipJackalItem = function ( f58_arg0, f58_arg1 )
		local f58_local0 = f58_arg0:GetCurrentMenu()
		local f58_local1 = f58_local0.equippedSlotDataSource
		local f58_local2 = f58_arg0:GetDataSource()
		assert( f58_local2 )
		assert( f58_local2.jackalItem )
		assert( f58_local2.jackalItem.ref )
		f58_local1.ref:SetValue( f58_arg1, f58_local2.jackalItem.ref:GetValue( f58_arg1 ) )
	end,
	OpenJackalDecalMenu = function ( f59_arg0, f59_arg1 )
		local f59_local0 = f59_arg0:GetCurrentMenu()
		local f59_local1 = f59_local0.SPLoadout:GetDataSource()
		assert( f59_local1 )
		LUI.FlowManager.RequestAddMenu( "JackalDecalSelect", true, f59_arg1, nil, {
			loadoutIndex = f59_local1.loadoutIndex
		}, true )
	end,
	EquipJackalDecal = function ( f60_arg0, f60_arg1 )
		local f60_local0 = f60_arg0:GetCurrentMenu()
		local f60_local1 = f60_local0.loadoutDataSource
		local f60_local2 = f60_arg0:GetDataSource()
		assert( f60_local2 )
		assert( f60_local2.ref )
		f60_local1.jackalSetup.jackalDecal:SetValue( f60_arg1, f60_local2.ref:GetValue( f60_arg1 ) )
	end,
	EquipRigPerk = function ( f61_arg0, f61_arg1 )
		local f61_local0 = f61_arg0:GetCurrentMenu()
		local f61_local1 = f61_local0.rigDataSource
		assert( f61_local1 )
		assert( f61_local1.archetypePerk )
		assert( f61_local1.archetypePerk.ref )
		local f61_local2 = f61_arg0:GetDataSource()
		assert( f61_local2 )
		assert( f61_local2.ref )
		local f61_local3 = Cac.GetPreferencesForRig( f61_local0.squadMemberDataSource.archetypePreferences, f61_local2.rigPerk.rigRef:GetValue( f61_arg1 ), f61_arg1 )
		assert( f61_local3 )
		local f61_local4 = f61_local2.rigPerk.ref:GetValue( f61_arg1 )
		if CONDITIONS.IsDraftEnabled() then
			LoadoutDrafting.RequestTrait( f61_arg1, Cac.GetPerkIndex( f61_local4 ) )
		end
		if f61_local1.rigRef:GetValue( f61_arg1 ) == f61_local3.archetype:GetValue( f61_arg1 ) then
			f61_local1.archetypePerk.ref:SetValue( f61_arg1, f61_local4 )
		end
		f61_local3.archetypePerk:SetValue( f61_arg1, f61_local4 )
	end,
	EquipRigSuper = function ( f62_arg0, f62_arg1 )
		local f62_local0 = f62_arg0:GetCurrentMenu()
		local f62_local1 = f62_local0.rigDataSource
		assert( f62_local1 )
		assert( f62_local1.archetypeSuper )
		assert( f62_local1.archetypeSuper.ref )
		local f62_local2 = f62_arg0:GetDataSource()
		assert( f62_local2 )
		assert( f62_local2.ref )
		local f62_local3 = Cac.GetPreferencesForRig( f62_local0.squadMemberDataSource.archetypePreferences, f62_local2.rigSuper.rigRef:GetValue( f62_arg1 ), f62_arg1 )
		assert( f62_local3 )
		local f62_local4 = f62_local2.rigSuper.ref:GetValue( f62_arg1 )
		if CONDITIONS.IsDraftEnabled() then
			LoadoutDrafting.RequestSuper( f62_arg1, Cac.GetSuperIndex( f62_local4 ) )
		end
		if f62_local1.rigRef:GetValue( f62_arg1 ) == f62_local3.archetype:GetValue( f62_arg1 ) then
			f62_local1.archetypeSuper.ref:SetValue( f62_arg1, f62_local4 )
		end
		f62_local3.archetypeSuper:SetValue( f62_arg1, f62_local4 )
	end,
	OpenPerkSelectMenu = function ( f63_arg0, f63_arg1, f63_arg2 )
		local f63_local0 = f63_arg0:GetCurrentMenu()
		assert( f63_local0.LoadoutList )
		assert( f63_local0.LoadoutList.Loadouts )
		local f63_local1 = f63_local0.LoadoutList.Loadouts:GetDataSource()
		f63_local1.isProperty = false
		local f63_local2 = f63_local0.squadMemberDataSource
		f63_local2.isProperty = false
		assert( f63_local2 )
		local f63_local3 = f63_arg1:GetDataSource()
		assert( f63_local3 )
		assert( f63_local3.slotIndex )
		LUI.FlowManager.RequestAddMenu( "PerkSelect", true, f63_arg2, nil, {
			loadoutDataSource = f63_local1,
			squadMemberDataSource = f63_local2,
			perkSlot = f63_local3.slotIndex:GetValue( f63_arg2 ),
			selectedPerkIsExtra = f63_local3.isExtra:GetValue( f63_arg2 )
		}, true )
	end,
	OpenCompareFromWeaponSelect = function ( f64_arg0, f64_arg1 )
		local f64_local0 = f64_arg0:GetCurrentMenu()
		LUI.FlowManager.RequestPopupMenu( f64_arg0, "WeaponCompare", true, f64_arg1, false, {
			archetypeDataSource = f64_local0.weaponCompareArchetypeData
		} )
	end,
	EquipRig = function ( f65_arg0, f65_arg1, f65_arg2 )
		local f65_local0 = f65_arg0:GetCurrentMenu()
		local f65_local1 = f65_local0.rigDataSource
		assert( f65_local1 )
		assert( f65_local1.rigRef )
		local f65_local2 = f65_arg0:GetDataSource()
		f65_local2 = f65_local2.rig
		assert( f65_local2 )
		assert( f65_local2.ref )
		Onboarding:AdvanceFlow( Onboarding.RigTutorial, "RIG_SELECT" )
		local f65_local3 = f65_local2.ref:GetValue( f65_arg2 )
		local f65_local4 = f65_local0.squadMemberDataSource
		assert( f65_local4 )
		local f65_local5 = Cac.GetPreferencesForRig( f65_local4.archetypePreferences, f65_local3, f65_arg2 )
		Cac.UpdateRigPreferences( f65_local3, f65_local5, f65_arg2 )
		Cac.ApplyRigPreferences( f65_local3, f65_local5, f65_local1, f65_arg2 )
		Cac.PlayFirstRigCapacityBink( f65_local3, f65_arg2 )
		f65_local1.rigRef:SetValue( f65_arg2, f65_local3 )
		local f65_local6 = f65_local5.body:GetValue( f65_arg2 )
		local f65_local7 = f65_local5.head:GetValue( f65_arg2 )
		local f65_local8 = Engine.TableLookupGetRowNum( CSV.cosmeticHeroesLootMaster.file, CSV.cosmeticHeroesLootMaster.cols.headModel, Engine.TableLookup( CSV.heads.file, CSV.heads.cols.ref, f65_local7, CSV.heads.cols.model ) )
		if f65_local8 >= 0 then
			Engine.SetPlayerDataEx( f65_arg2, CoD.StatsGroup.Common, "gender", Engine.TableLookupByRow( CSV.cosmeticHeroesLootMaster.file, f65_local8, CSV.cosmeticHeroesLootMaster.cols.gender ) == "1" )
		end
		local f65_local9 = Engine.TableLookup( CSV.bodies.file, CSV.bodies.cols.ref, f65_local6, CSV.bodies.cols.index )
		local f65_local10 = Engine.TableLookup( CSV.heads.file, CSV.heads.cols.ref, f65_local7, CSV.heads.cols.index )
		f65_local4.body:SetValue( f65_arg2, f65_local9 )
		f65_local4.head:SetValue( f65_arg2, f65_local10 )
		for f65_local11 = 0, 3, 1 do
			f65_local4.taunts[f65_local11]:SetValue( f65_arg2, f65_local5.taunts[f65_local11]:GetValue( f65_arg2 ) )
		end
		f65_local4.gesture:SetValue( f65_arg2, f65_local5.gesture:GetValue( f65_arg2 ) )
	end,
	OpenRigSelectMenu = function ( f66_arg0, f66_arg1, f66_arg2 )
		local f66_local0 = f66_arg0:GetCurrentMenu()
		assert( f66_local0.LoadoutList )
		assert( f66_local0.LoadoutList.Loadouts )
		local f66_local1 = f66_local0.squadMemberDataSource
		assert( f66_local1 )
		f66_local1.isProperty = false
		f66_local1.__serializable = false
		LUI.FlowManager.RequestAddMenu( "RigSelect", true, f66_arg2, nil, {
			squadMemberDataSource = f66_local1
		}, true )
	end,
	OpenCreateAClass = function ( f67_arg0, f67_arg1 )
		local f67_local0 = nil
		if CONDITIONS.IsPublicMatch() then
			f67_local0 = DataSources.alwaysLoaded.playerData.MP.rankedloadouts.squadMembers
		else
			f67_local0 = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers
		end
		f67_local0.isProperty = false
		f67_local0.__serializable = false
		LUI.FlowManager.RequestAddMenu( "LoadoutSelect", true, f67_arg1.controller, nil, {
			squadMemberDataSource = f67_local0
		}, true )
	end,
	OpenPublicRigCustomization = function ( f68_arg0, f68_arg1 )
		local f68_local0 = DataSources.alwaysLoaded.playerData.MP.rankedloadouts.squadMembers
		f68_local0.isProperty = false
		f68_local0.__serializable = false
		LUI.FlowManager.RequestAddMenu( "RigCustomization", true, f68_arg1, nil, {
			squadMemberDataSource = f68_local0
		}, true )
	end,
	OpenPrivateRigCustomization = function ( f69_arg0, f69_arg1 )
		local f69_local0 = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers
		f69_local0.isProperty = false
		f69_local0.__serializable = false
		LUI.FlowManager.RequestAddMenu( "RigCustomization", true, f69_arg1, nil, {
			squadMemberDataSource = f69_local0
		}, true )
	end,
	UploadStats = function ( f70_arg0, f70_arg1 )
		Engine.Exec( "uploadstats", f70_arg1 )
	end,
	ToggleExtraPower = function ( f71_arg0, f71_arg1, f71_arg2 )
		local f71_local0 = f71_arg0:GetCurrentMenu()
		local f71_local1 = f71_local0.LoadoutList.Loadouts:GetDataSource()
		assert( f71_local1 )
		local f71_local2 = f71_local0.statsGroupDataSource
		local f71_local3 = f71_arg1:GetDataSource()
		assert( f71_local3.slot:GetValue( f71_arg2 ) )
		if f71_local3.used:GetValue( f71_arg2 ) == false then
			return 
		elseif f71_local3.extraPowerPlayerData:GetValue( f71_arg2 ) == 0 then
			if Cac.CanAffordItem( f71_local1, f71_local3.extraPointCost, f71_arg2 ) then
				f71_local3.extraPowerPlayerData:SetValue( f71_arg2, 1 )
			else
				local f71_local4 = LUI.FlowManager.GetScopedData( f71_local0 )
				f71_local4.staticPointAnimation = true
				LUI.FlowManager.RequestAddMenu( "CACLoadoutRemovalPopup", true, f71_arg2, nil, {
					desiredItemCost = f71_local3.extraPointCost,
					loadoutDataSource = f71_local1,
					statsGroupDataSource = f71_local2
				} )
			end
		else
			f71_local3.extraPowerPlayerData:SetValue( f71_arg2, 0 )
		end
	end,
	OnSelectCamo = function ( f72_arg0, f72_arg1 )
		local f72_local0 = f72_arg0:GetCurrentMenu()
		local f72_local1 = f72_local0.weaponDataSource.camoInfo
		local f72_local2 = f72_arg0:GetDataSource()
		assert( f72_local1 )
		assert( f72_local1.ref )
		assert( f72_local2 )
		assert( f72_local2.ref )
		f72_local1.ref:SetValue( f72_arg1, f72_local2.ref:GetValue( f72_arg1 ) )
	end,
	RemoveCamo = function ( f73_arg0, f73_arg1 )
		local f73_local0 = f73_arg0:GetCurrentMenu()
		local f73_local1 = f73_local0.weaponDataSource.camoInfo
		assert( f73_local1 )
		assert( f73_local1.ref )
		f73_local1.ref:SetValue( f73_arg1, Cac.CamoNoneValue )
	end,
	OnSelectReticle = function ( f74_arg0, f74_arg1 )
		local f74_local0 = f74_arg0:GetCurrentMenu()
		local f74_local1 = f74_local0.weaponDataSource.reticleInfo
		local f74_local2 = f74_arg0:GetDataSource()
		assert( f74_local1 )
		assert( f74_local1.ref )
		assert( f74_local2 )
		assert( f74_local2.ref )
		f74_local1.ref:SetValue( f74_arg1, f74_local2.ref:GetValue( f74_arg1 ) )
	end,
	RemoveReticle = function ( f75_arg0, f75_arg1 )
		local f75_local0 = f75_arg0:GetCurrentMenu()
		local f75_local1 = f75_local0.weaponDataSource.reticleInfo
		assert( f75_local1 )
		assert( f75_local1.ref )
		f75_local1.ref:SetValue( f75_arg1, Cac.ReticleNoneValue )
	end,
	OnSelectCosmeticAttachment = function ( f76_arg0, f76_arg1 )
		local f76_local0 = f76_arg0:GetCurrentMenu()
		local f76_local1 = f76_local0.weaponDataSource.cosmeticAttachmentInfo
		local f76_local2 = f76_arg0:GetDataSource()
		assert( f76_local1 )
		assert( f76_local1.ref )
		assert( f76_local2 )
		assert( f76_local2.ref )
		f76_local1.ref:SetValue( f76_arg1, f76_local2.ref:GetValue( f76_arg1 ) )
	end,
	RemoveCosmeticAttachment = function ( f77_arg0, f77_arg1 )
		local f77_local0 = f77_arg0:GetCurrentMenu()
		local f77_local1 = f77_local0.weaponDataSource.cosmeticAttachmentInfo
		assert( f77_local1 )
		assert( f77_local1.ref )
		f77_local1.ref:SetValue( f77_arg1, Cac.CosmeticAttachmentNoneValue )
	end,
	AddLoadoutOptionPrompt = function ( f78_arg0, f78_arg1 )
		if Engine.IsPC() then
			f78_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_LOADOUT_OPTIONS" ),
				button_ref = "button_start",
				side = "left",
				priority = 10,
				clickable = false
			} )
		else
			f78_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_LOADOUT_OPTIONS" ),
				button_ref = "button_start",
				side = "left",
				clickable = false
			} )
		end
	end,
	RemoveLoadoutOptionPrompt = function ( f79_arg0, f79_arg1 )
		f79_arg0:RemoveButtonHelperText( "button_start", "left" )
	end,
	OpenChallengesMenu = function ( f80_arg0, f80_arg1, f80_arg2 )
		local f80_local0 = f80_arg0:GetCurrentMenu()
		LUI.FlowManager.RequestAddMenu( "ChallengesMenu", true, f80_arg2, nil, {
			subCategoryDataSource = f80_arg1:GetDataSource()
		} )
	end,
	ActivatePrestige = function ( f81_arg0, f81_arg1 )
		Prestige.DoPrestigeReset( f81_arg1 )
		LUI.FlowManager.RequestLeaveMenu( f81_arg0, true )
	end,
	SpendClassicWeaponToken = function ( f82_arg0, f82_arg1 )
		local f82_local0 = f82_arg0:GetCurrentMenu()
		local f82_local1 = f82_local0:GetDataSource( f82_arg1 )
		local f82_local2 = f82_local1.classicWeaponTokenCount:GetValue( f82_arg1 )
		local f82_local3 = CoD.GetCommonPlayerDataDataSource()
		local f82_local4 = f82_arg0:GetDataSource( f82_arg1 )
		local f82_local5 = {
			itemName = f82_local4.name:GetValue( f82_arg1 )
		}
		if f82_local4.isUnlocked:GetValue( f82_arg1 ) then
			LUI.FlowManager.RequestPopupMenu( nil, "ClassicWeaponAlreadyUnlockedPopup", true, f82_arg1, false, f82_local5 )
			return 
		elseif f82_local2 <= 0 then
			LUI.FlowManager.RequestPopupMenu( nil, "ClassicWeaponNotEnoughTokensPopup", true, f82_arg1, false, f82_local5 )
			return 
		else
			f82_local5.confirmAction = function ()
				f82_local3.sharedProgression.classicWeapons[f82_local4.weaponRef]:SetValue( f82_arg1, 1 )
				REG4:SetValue( f82_arg1, f82_local2 - 1 )
				f82_local4.isUnlocked:SetValue( f82_arg1, true )
				Engine.InvalidatePermanentClassicWeaponsUnlockCache( f82_arg1 )
			end
			
			LUI.FlowManager.RequestPopupMenu( nil, "ClassicWeaponsYesNoPopup", true, f82_arg1, false, f82_local5 )
		end
	end,
	OpenCardOneSelectMenu = function ( f84_arg0, f84_arg1, f84_arg2 )
		LUI.FlowManager.RequestAddMenu( "FortuneCards", true, f84_arg2, nil, {
			cardSlot = 0
		}, true )
	end,
	OpenCardTwoSelectMenu = function ( f85_arg0, f85_arg1, f85_arg2 )
		LUI.FlowManager.RequestAddMenu( "FortuneCards", true, f85_arg2, nil, {
			cardSlot = 1
		}, true )
	end,
	OpenCardThreeSelectMenu = function ( f86_arg0, f86_arg1, f86_arg2 )
		LUI.FlowManager.RequestAddMenu( "FortuneCards", true, f86_arg2, nil, {
			cardSlot = 2
		}, true )
	end,
	OpenCardFourSelectMenu = function ( f87_arg0, f87_arg1, f87_arg2 )
		LUI.FlowManager.RequestAddMenu( "FortuneCards", true, f87_arg2, nil, {
			cardSlot = 3
		}, true )
	end,
	OpenCardFiveSelectMenu = function ( f88_arg0, f88_arg1, f88_arg2 )
		LUI.FlowManager.RequestAddMenu( "FortuneCards", true, f88_arg2, nil, {
			cardSlot = 4
		}, true )
	end,
	CardSetPlayerData = function ( f89_arg0, f89_arg1, f89_arg2 )
		local f89_local0 = nil
		local f89_local1 = f89_arg1:GetDataSource()
		f89_local1 = f89_local1.ref:GetValue( f89_arg2 )
		local f89_local2 = LUI.FlowManager.GetScopedData( f89_arg0 )
		assert( f89_local2 )
		local f89_local3 = f89_local2.cardSlot
		local f89_local4 = Engine.GetPlayerDataEx( f89_arg2, CoD.StatsGroup.Coop, "consumables_enabled_flags", f89_local1 )
		local f89_local5 = Engine.GetPlayerDataEx( f89_arg2, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombie_consumables", f89_local3 )
		local f89_local6 = Loot.IsOwned( f89_arg2, Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.Ref, f89_local1, CSV.zombieConsumableItems.Cols.LootID ) )
		if f89_local4 then
			local f89_local7 = LUI.FlowManager.GetScopedData( f89_arg0 )
			for f89_local8 = 0, 4, 1 do
				if f89_local1 == Engine.GetPlayerDataEx( f89_arg2, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombie_consumables", f89_local8 ) then
					f89_local0 = f89_local8
				end
			end
			Engine.SetPlayerDataEx( f89_arg2, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombie_consumables", f89_local0, f89_local5 )
			Engine.SetPlayerDataEx( f89_arg2, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombie_consumables", f89_local3, f89_local1 )
		else
			Engine.SetPlayerDataEx( f89_arg2, CoD.StatsGroup.Coop, "consumables_enabled_flags", f89_local5, false )
			Engine.SetPlayerDataEx( f89_arg2, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombie_consumables", f89_local3, f89_local1 )
			Engine.SetPlayerDataEx( f89_arg2, CoD.StatsGroup.Coop, "consumables_enabled_flags", f89_local1, true )
		end
		Engine.SetPlayerDataEx( f89_arg2, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "consumables_counter", f89_local3, f89_local6 )
		ACTIONS.UploadStats( f89_arg0, f89_arg2 )
	end,
	SetZombiesLobbyMusic = function ( f90_arg0, f90_arg1, f90_arg2 )
		Engine.SetPlayerDataEx( f90_arg2, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "lobbySong", f90_arg1 )
		Engine.NotifyServer( "music_changed", f90_arg1 )
		if f90_arg1 == "22" then
			ZombiesUtils.SendShuffleNotifys( f90_arg0 )
		else
			Engine.NotifyServer( "music_changed", f90_arg1 )
		end
	end,
	TurnOffTutorial = function ( f91_arg0, f91_arg1 )
		Engine.NotifyServer( "tutorial_off", 1 )
	end,
	TurnOnTutorial = function ( f92_arg0, f92_arg1 )
		Engine.NotifyServer( "tutorial_on", 1 )
	end,
	TurnOnTutorialInFrontend = function ( f93_arg0, f93_arg1 )
		Engine.SetPlayerDataEx( f93_arg1, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "tutorialOff", 0 )
	end,
	CharacterSelect = function ( f94_arg0, f94_arg1, f94_arg2 )
		Engine.SetPlayerDataEx( f94_arg2, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "characterSelect", tonumber( f94_arg1 ) )
	end,
	SetSeenFateCardTips = function ( f95_arg0 )
		return Engine.SetPlayerDataEx( f95_arg0, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "fateTipsOff", 1 )
	end,
	OpenInGameSuperSelectMenu = function ( f96_arg0, f96_arg1, f96_arg2 )
		local f96_local0 = f96_arg0:GetDataSource()
		LUI.FlowManager.RequestPopupMenu( f96_arg0, "InGameSuperSelect", true, f96_arg2, nil, {
			rigRef = f96_local0.ref:GetValue( f96_arg2 )
		} )
		assert( f96_arg0.NameBackground, "ERROR: OpenInGameRigPerkSelectMenu action called from an element that does not contain a NameBackground child element. This is only intended to be triggered from the InGameRigSelectButton" )
		f96_arg0.NameBackground:ButtonOverAnims()
	end,
	OpenInGameRigPerkSelectMenu = function ( f97_arg0, f97_arg1, f97_arg2 )
		local f97_local0 = f97_arg0:GetDataSource()
		LUI.FlowManager.RequestPopupMenu( f97_arg0, "InGameRigPerkSelect", true, f97_arg2, nil, {
			rigRef = f97_local0.parentRigRef:GetValue( f97_arg2 )
		} )
		assert( f97_arg0.NameBackground, "ERROR: OpenInGameRigPerkSelectMenu action called from an element that does not contain a NameBackground child element. This is only intended to be triggered from the InGameSuperSelectButton" )
		f97_arg0.NameBackground:ButtonOverAnims()
	end,
	NotifyScriptRigSelected = function ( f98_arg0, f98_arg1, f98_arg2 )
		local f98_local0 = f98_arg0:GetDataSource()
		Engine.NotifyServer( "rig_selected", f98_local0.index:GetValue( f98_arg2 ) )
	end,
	NotifyScriptSuperSelected = function ( f99_arg0, f99_arg1, f99_arg2 )
		local f99_local0 = f99_arg0:GetDataSource()
		Engine.NotifyServer( "super_selected", f99_local0.index:GetValue( f99_arg2 ) )
	end,
	FinalizeInGameRigSelect = function ( f100_arg0, f100_arg1, f100_arg2 )
		local f100_local0 = f100_arg0:GetDataSource()
		Engine.NotifyServer( "trait_selected", f100_local0.index:GetValue( f100_arg2 ) )
	end
}
