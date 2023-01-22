local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = function ()
		if not f1_arg0.Quartermaster:IsDisabled() then
			local f2_local0 = false
			f2_local0 = Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Common, "newCrateRewards" )
			if not f2_local0 then
				f2_local0 = Engine.GetDvarInt( "loot_crate_cost_overide" ) > 0 and not Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Common, "quartermasterSale" )
			end
			if not f2_local0 and Engine.IsCoreMode() then
				local f2_local1 = -1
				if ARMORY.IsEventCrateEnabled( f1_arg1 ) then
					f2_local1 = ARMORY.GetEventCrateID()
				end
				if f2_local1 == -1 or f2_local1 == Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Common, "quartermasterEventIDs", 0 ) then
					f2_local0 = false
				else
					f2_local0 = true
				end
			end
			if not f2_local0 then
				if Engine.IsAliensMode() then
					local f2_local1 = -1
					if ARMORY.IsBundleEnabled( ARMORY.BundlesData.ZBundle ) then
						f2_local1 = Engine.GetDvarInt( ARMORY.BundlesData.ZBundle.crateID )
					end
					if f2_local1 == -1 or f2_local1 == Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Common, "quartermasterEventIDs", 2 ) then
						f2_local0 = false
					else
						f2_local0 = true
					end
				else
					local f2_local1 = -1
					if ARMORY.IsBundleEnabled( ARMORY.BundlesData.Bundle1 ) then
						f2_local1 = Engine.GetDvarInt( ARMORY.BundlesData.Bundle1.crateID )
					end
					if f2_local1 == -1 or f2_local1 == Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Common, "quartermasterEventIDs", 2 ) then
						f2_local0 = false
					else
						f2_local0 = true
					end
					if not f2_local0 then
						f2_local1 = -1
						if ARMORY.IsBundleEnabled( ARMORY.BundlesData.Bundle2 ) then
							f2_local1 = Engine.GetDvarInt( ARMORY.BundlesData.Bundle2.crateID )
						end
						if f2_local1 == -1 or f2_local1 == Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Common, "quartermasterEventIDs", 3 ) then
							f2_local0 = false
						else
							f2_local0 = true
						end
					end
				end
			end
			local f2_local1 = f1_arg0.SpecialCrateNotification
			local f2_local2 = f2_local1
			f2_local1 = f2_local1.SetAlpha
			local f2_local3
			if f2_local0 then
				f2_local3 = 1
				if not f2_local3 then
				
				else
					f2_local1( f2_local2, f2_local3 )
				end
			end
			f2_local3 = 0
		else
			f1_arg0.SpecialCrateNotification:SetAlpha( 0 )
		end
	end
	
	
	local eventRefreshTimer = LUI.UITimer.new( nil, {
		interval = 1000,
		event = "refreshEventsAndBundles",
		disposable = false,
		broadcastToRoot = false,
		stopped = false,
		controllerIndex = f1_arg1
	} )
	f1_arg0:addElement( eventRefreshTimer )
	f1_arg0.eventRefreshTimer = eventRefreshTimer
	
	f1_arg0:registerEventHandler( "refreshEventsAndBundles", f1_local0 )
	f1_arg0:addEventHandler( "refresh_event_crate", f1_local0 )
	f1_local0()
	f1_arg0.Quartermaster:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		if not Engine.IsUserAGuest( f3_arg1.controller ) then
			ACTIONS.OpenMenu( "Armory", true, f3_arg1.controller or f1_arg1 )
		elseif CONDITIONS.IsXboxOne() then
			LUI.FlowManager.RequestPopupMenu( f1_arg0, "mp_no_guest_popup", false, f1_arg1, false )
		end
	end )
	f1_arg0.Quartermaster:addEventHandler( "button_disable", function ( f4_arg0, f4_arg1 )
		f1_arg0.SpecialCrateNotification:SetAlpha( 0, 0 )
	end )
	f1_arg0.Quartermaster:addEventHandler( "button_over_disable", function ( f5_arg0, f5_arg1 )
		f1_arg0.SpecialCrateNotification:SetAlpha( 0, 0 )
	end )
end

function QuartermasterButton( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "QuartermasterButton"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local Quartermaster = nil
	
	Quartermaster = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f6_local1
	} )
	Quartermaster.id = "Quartermaster"
	Quartermaster.buttonDescription = Engine.Localize( "LUA_MENU_DESC_ARMORY" )
	Quartermaster.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_QUARTERMASTER" ) ), 0 )
	Quartermaster:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 )
	self:addElement( Quartermaster )
	self.Quartermaster = Quartermaster
	
	local SpecialCrateNotification = nil
	
	SpecialCrateNotification = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
		controllerIndex = f6_local1
	} )
	SpecialCrateNotification.id = "SpecialCrateNotification"
	SpecialCrateNotification:SetAlpha( 0, 0 )
	SpecialCrateNotification:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 385, _1080p * -51, _1080p * -17, _1080p * 47 )
	self:addElement( SpecialCrateNotification )
	self.SpecialCrateNotification = SpecialCrateNotification
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		SpecialCrateNotification:RegisterAnimationSequence( "Arabic", {
			{
				function ()
					return self.SpecialCrateNotification:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -426, _1080p * -17, _1080p * 47, 0 )
				end
			}
		} )
		self._sequences.Arabic = function ()
			SpecialCrateNotification:AnimateSequence( "Arabic" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "Arabic" )
	end
	f0_local0( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "QuartermasterButton", QuartermasterButton )
LockTable( _M )
