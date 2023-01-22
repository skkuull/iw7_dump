DLB = DLB or {}
DLB.OpenDLBWindowIfRequired = function ( f1_arg0 )
	if Lobby.IsInPrivateParty() and not Lobby.IsPrivatePartyHost() then
		return 
	elseif not Engine.IsProfileSignedIn( f1_arg0 ) then
		return false
	end
	local f1_local0 = Rewards.GetReward( f1_arg0 )
	if not (not f1_local0.FirstTime or Engine.GetDvarBool( "daily_login_bonus_viewed" )) or Engine.GetDvarBool( "daily_login_bonus_forced" ) == true then
		local f1_local1 = Loot.IsOwned( f1_arg0, 50003 )
		local f1_local2 = f1_local0.Salvage
		local f1_local3 = f1_local0.Keys / 100
		local f1_local4 = f1_local0.items[1]
		local f1_local5 = f1_local0.VIP_Salvage
		local f1_local6 = f1_local0.VIP_Keys / 100
		local f1_local7 = f1_local0.vip_items[1]
		local f1_local8 = {
			isVIP = f1_local1
		}
		local f1_local9 = false
		f1_local8.item0Count = 0
		f1_local8.item0Image = ""
		f1_local8.item0ImageIsWide = false
		f1_local8.item1Count = 0
		f1_local8.item1Image = ""
		f1_local8.item1ImageIsWide = false
		if f1_local2 > 0 then
			f1_local9 = true
			f1_local8.item0Count = f1_local2
			f1_local8.item0Image = "currency_parts_icon_large"
		elseif f1_local3 > 0 then
			f1_local9 = true
			f1_local8.item0Count = f1_local3
			f1_local8.item0Image = "icon_currency_keys"
		end
		if f1_local9 then
			if f1_local4 ~= nil then
				f1_local8.item1Count = #f1_local0.items
				local f1_local10 = LOOT.GetLootData( tonumber( f1_local4 ) )
				f1_local8.item1Image = f1_local10.displayImage
				f1_local8.item1ImageIsWide = true
			end
		elseif f1_local4 ~= nil then
			f1_local8.item0Count = #f1_local0.items
			local f1_local10 = LOOT.GetLootData( tonumber( f1_local4 ) )
			f1_local8.item0Image = f1_local10.displayImage
			f1_local8.item0ImageIsWide = true
		end
		f1_local8.item2Count = 0
		f1_local8.item2Image = ""
		f1_local8.item2ImageIsWide = false
		f1_local8.item3Count = 0
		f1_local8.item3Image = ""
		f1_local8.item3ImageIsWide = false
		if f1_local1 > 0 then
			local f1_local11 = false
			if f1_local5 > 0 then
				f1_local11 = true
				f1_local8.item2Count = f1_local5
				f1_local8.item2Image = "currency_parts_icon_large"
			elseif f1_local6 > 0 then
				f1_local11 = true
				f1_local8.item2Count = f1_local6
				f1_local8.item2Image = "icon_currency_keys"
			end
			if f1_local11 then
				if f1_local7 ~= nil then
					f1_local8.item3Count = #f1_local0.vip_items
					local f1_local12 = LOOT.GetLootData( tonumber( f1_local7 ) )
					f1_local8.item3Image = f1_local12.displayImage
					f1_local8.item3ImageIsWide = true
				end
			elseif f1_local7 ~= nil then
				f1_local8.item2Count = #f1_local0.vip_items
				local f1_local12 = LOOT.GetLootData( tonumber( f1_local7 ) )
				f1_local8.item2Image = f1_local12.displayImage
				f1_local8.item2ImageIsWide = true
			end
		else
			f1_local8.item2Count = 1000
			f1_local8.item2Image = "currency_parts_icon_large"
			f1_local8.item3Count = 10
			local f1_local11 = LOOT.GetLootData( 70001 )
			f1_local8.item3Image = f1_local11.displayImage
			f1_local8.item3ImageIsWide = true
		end
		if f1_local8.item0Count > 0 or f1_local8.item1Count > 0 or f1_local8.item2Count > 0 or f1_local8.item3Count > 0 then
			LUI.FlowManager.RequestPopupMenu( unused, "DailyLoginBonusPopup", false, f1_arg0, false, f1_local8, nil, true, true )
		end
		Engine.SetDvarBool( "daily_login_bonus_viewed", true )
	end
end

