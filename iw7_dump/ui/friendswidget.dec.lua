local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function CanSomeoneAccessFriendslist()
	if IsOnlineMatch() then
		for f1_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
			if Engine.HasActiveLocalClient( f1_local0 ) then
				return true
			end
		end
	end
	return false
end

function online_friends_widget( f2_arg0, f2_arg1 )
	if not f2_arg1 then
		f2_arg1 = {}
	end
	local self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		right = -130,
		bottom = -28,
		width = 40,
		height = 20,
		alpha = 1
	} )
	self:registerAnimationState( "disabled", {
		alpha = 0
	} )
	self.id = "online_friends_widget"
	self:registerEventHandler( "show_widget", function ( element, event )
		local f3_local0 = element:getParent()
		if f3_local0 then
			local f3_local1 = ButtonHelperText.CommonEvents.addFriendsButton
			f3_local1.ignorePopups = f2_arg1.ignorePopups
			f3_local0:processEvent( f3_local1 )
			element:animateToState( "default", 0 )
			if Engine.IsXB3() or not Engine.IsConsoleGame() then
				Engine.ExecNow( "friends_widget_refresh" )
			end
		end
	end )
	self:registerEventHandler( "hide_widget", function ( element, event )
		local f4_local0 = element:getParent()
		if f4_local0 then
			local f4_local1 = ButtonHelperText.CommonEvents.removeFriendsButton
			f4_local1.dispatchChildren = true
			f4_local0:processEvent( f4_local1 )
			element:animateToState( "disabled", 0 )
		end
	end )
	self:registerEventHandler( "live_connection", function ( element, event )
		if event.signed_in == nil then
			local f5_local0 = Engine.IsNetworkConnected()
			if f5_local0 then
				f5_local0 = Engine.IsUserSignedInToLive()
			end
			event.signed_in = f5_local0
		end
		if event.signed_in and CanSomeoneAccessFriendslist() then
			element:processEvent( {
				name = "show_widget"
			} )
		else
			element:processEvent( {
				name = "hide_widget"
			} )
		end
	end )
	self:registerEventHandler( "network_connection", function ( element, event )
		if not event.plugged_in then
			element:processEvent( {
				name = "hide_widget"
			} )
		elseif Engine.IsUserSignedInToLive() then
			element:processEvent( {
				name = "show_widget"
			} )
		end
	end )
	self:registerEventHandler( "menu_create", function ( element, event )
		element:processEvent( {
			name = "live_connection"
		} )
	end )
	local f2_local1 = LUI.UIBindButton.new()
	f2_local1.id = "friends_bind_buttons_id"
	f2_local1:SetActionSFX( SOUND_SETS.default.selectAlt )
	f2_local1:registerEventHandler( "button_alt2", function ( element, event )
		if IsOnlineMatch() and Engine.IsNetworkConnected() and Engine.IsUserSignedInToLive( event.controller ) then
			if not Engine.IsUserAGuest( event.controller ) then
				if Engine.InFrontend() then
					LUI.FlowManager.RequestPopupMenu( element, "FriendsList", true, event.controller, false, {} )
					Engine.PlaySound( SOUND_SETS.default.popup )
				else
					LUI.FlowManager.RequestAddMenu( "FriendsList", true, event.controller, false, {} )
				end
			else
				LUI.FlowManager.RequestPopupMenu( element, "mp_no_guest_popup", false, event.controller, false )
			end
		end
		return true
	end )
	self:addElement( f2_local1 )
	local f2_local2 = LUI.UIImage.new
	local f2_local3 = {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -12,
		bottom = 12,
		left = 0,
		right = 12,
		material = RegisterMaterial( "wdg_selection_arrow_right_1" )
	}
	if not Engine.InFrontend() then
		local f2_local4 = Engine.GetDvarBool( "dedicated_dhclient" )
		local f2_local5 = 0.6
	end
	f2_local3.alpha = f2_local4 and f2_local5 or 0.4
	f2_local2 = f2_local2( f2_local3 )
	f2_local2.id = "friends_triangle_id"
	self:addElement( f2_local2 )
	if Friends then
		f2_local3 = LUI.UIText.new( CoD.ColorizeState( SWATCHES.buttonHelper.friendsText, {
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = true,
			left = 20,
			right = 0,
			height = CoD.TextSettings.ButtonHelperFont.Height,
			font = CoD.TextSettings.ButtonHelperFont.Font,
			alignment = LUI.Alignment.Left
		} ) )
		f2_local3.id = "friends_number_text"
		f2_local3:setupUIBindText( "CountOnlineFriends" )
		self:addElement( f2_local3 )
		if Engine.IsPC() then
			local f2_local6 = LUI.UIButton.new( {
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				left = -111,
				right = 55,
				top = -4,
				bottom = 2,
				alpha = 0
			} )
			f2_local6.id = "friends_hotspot"
			f2_local6.m_requireFocusType = FocusType.MouseOver
			f2_local6:addEventHandler( "button_over", function ( f9_arg0, f9_arg1 )
				if not CONDITIONS.IsGamepadEnabled() then
					f2_local3:SetRGBFromTable( COLORS.black )
					f2_local2:SetRGBFromTable( COLORS.black )
				end
			end )
			f2_local6:addEventHandler( "button_up", function ( f10_arg0, f10_arg1 )
				if not CONDITIONS.IsGamepadEnabled() then
					f2_local3:SetRGBFromTable( SWATCHES.buttonHelper.friendsText )
					f2_local2:SetRGBFromTable( COLORS.white )
				end
			end )
			self:addElement( f2_local6 )
		end
	end
	return self
end

MenuBuilder.registerType( "online_friends_widget", online_friends_widget )
LockTable( _M )
