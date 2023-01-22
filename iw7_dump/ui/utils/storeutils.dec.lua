STORE = STORE or {}
STORE.CRMCategory = "CRM"
STORE.CODPointsCategory = "currency"
STORE.Normal = "NORMAL"
STORE.PSN = "PSN"
STORE.XBL = "XBL"
STORE.STEAM = "STEAM"
STORE.UWP = "UWP"
STORE.PSNOnline = "PSN-ONLINE"
STORE.XBLOnline = "XBL-ONLINE"
STORE.STEAMOnline = "STEAM-ONLINE"
STORE.UWPOnline = "UWP-ONLINE"
STORE.GetStoreProductString = function ()
	local f1_local0 = ""
	if Engine.IsPS4() then
		f1_local0 = "IW7ALL"
	else
		local f1_local1 = Engine.TableGetRowCount( "mp/ingamestore/igs_items.csv" )
		local f1_local2 = 0
		if Engine.IsXB3() then
			f1_local2 = 2
		elseif Engine.IsPCApp() then
			f1_local2 = 9
		elseif Engine.IsPC() then
			f1_local2 = 3
		end
		for f1_local3 = 0, f1_local1 - 1, 1 do
			local f1_local6 = Engine.TableLookupByRow( "mp/ingamestore/igs_items.csv", f1_local3, f1_local2 )
			if #f1_local6 and Engine.TableLookupByRow( "mp/ingamestore/igs_items.csv", f1_local3, 6 ) == "1" then
				f1_local0 = f1_local0 .. f1_local6 .. " "
			end
		end
	end
	return f1_local0
end

STORE.GetStoreMenu = function ( f2_arg0 )
	if f2_arg0 then
		return "MainMenuStore"
	else
		return Engine.IsAliensMode() and "CPStore" or "MPStore"
	end
end

STORE.EnterStore = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4 )
	if not CONDITIONS.IsStoreAllowed() then
		return 
	elseif Engine.UserIsGuest( f3_arg0 ) then
		LUI.FlowManager.RequestPopupMenu( nil, "generic_error_popup", false, false, false, {
			message = Engine.Localize( "PATCH_MENU_NO_GUEST" )
		}, nil, false, true )
	elseif Engine.UserIsAgeRestricted( f3_arg0 ) then
		LUI.FlowManager.RequestPopupMenu( nil, "generic_error_popup", false, false, false, {
			message = Engine.Localize( "XBOXLIVE_MPNOTALLOWED" )
		}, nil, false, true )
	elseif not Engine.IsUserSignedInToLive( f3_arg0 ) then
		LUI.FlowManager.RequestPopupMenu( nil, "generic_error_popup", false, false, false, {
			message = Engine.Localize( "PLATFORM_COMMERCE_NO_ONLINE_ERROR" )
		}, nil, false, true )
	elseif CONDITIONS.IsTrialLicense() then
		if CONDITIONS.IsPS4() then
			Commerce.ShowFirstPartyStore( f3_arg0 )
		elseif CONDITIONS.IsXboxOne() then
			LUI.FlowManager.RequestPopupMenu( nil, "ShowUpsellXboxStore", false, false, false, {}, nil, false, true )
		end
	else
		LUI.FlowManager.RequestAddMenu( f3_arg4, true, f3_arg0, false, f3_arg3 )
		Engine.StoreOpened( f3_arg0, f3_arg1 or "None", f3_arg2 or "None" )
	end
end

STORE.GoToStore = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4 )
	local f4_local0 = nil
	if f4_arg3 then
		f4_local0 = {
			defaultItem = f4_arg3,
			andPurchase = f4_arg4
		}
	end
	STORE.EnterStore( f4_arg0, f4_arg1, f4_arg2, f4_local0, STORE.GetStoreMenu( false ) )
end

STORE.GoToStoreFromMainMenu = function ( f5_arg0, f5_arg1, f5_arg2 )
	STORE.EnterStore( f5_arg0, f5_arg1, f5_arg2, {
		fromMainMenu = true
	}, STORE.GetStoreMenu( true ) )
end

STORE.GoToCODPointsOnlyStore = function ( f6_arg0, f6_arg1, f6_arg2 )
	STORE.EnterStore( f6_arg0, f6_arg1, f6_arg2, {
		onlyCODPoints = true
	}, STORE.GetStoreMenu( false ) )
end

STORE.GetStoreDescription = function ()
	return CONDITIONS.AreCODPointsEnabled() and Engine.Localize( "LUA_MENU_STORE_DESC" ) or Engine.Localize( "LUA_MENU_STORE_DESC_NO_COD_POINTS" )
end

