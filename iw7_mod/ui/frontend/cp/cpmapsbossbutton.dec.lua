local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Button )
	f1_arg0.Button.actionSFX = "ui_select_screen_return"
	f1_arg0.Button:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f1_arg0:GetDataSource()
		assert( f2_local0 )
		if not f2_local0.isOwned:GetValue( f1_arg1 ) then
			local f2_local1 = "vip"
			local f2_local2 = STORE.GoToStore
			local f2_local3 = f1_arg1
			local f2_local4 = f1_arg0:GetCurrentMenu()
			f2_local2( f2_local3, f2_local4.id, f1_arg0.id, f2_local1, false )
			return 
		end
		local f2_local1 = f2_local0.ref
		assert( f2_local1 and #f2_local1 > 0 )
		Engine.SetDvarString( "ui_mapname", f2_local1 )
		Engine.NotifyServer( "boss_set", f2_local0.bossID )
		Engine.ExecNow( "set scr_boss_battles_enabled 1" )
		Engine.SetPlayerDataEx( f1_arg1, CoD.StatsGroup.Coop, "dc", false )
		if not CONDITIONS.IsThirdGameMode( f1_arg0 ) then
			Engine.SetDvarString( "ui_saved_mapname", f2_local1 )
		end
		Engine.ExecNow( "xupdatepartystate" )
		LUI.FlowManager.RequestLeaveMenu( f1_arg0, true, true )
	end )
	f1_arg0.Button:addEventHandler( "button_over", function ( f3_arg0, f3_arg1 )
		if not Engine.IsAliensMode() then
			return 
		end
		local f3_local0 = f1_arg0:GetDataSource()
		assert( f3_local0 )
		local f3_local1 = f3_local0.ref
		assert( f3_local1 )
		local f3_local2 = LUI.FlowManager.GetScopedData( f1_arg0 )
		if f3_local1 ~= f3_local2.mapRef then
			f3_local2.mapRef = f3_local1
			Engine.NotifyServer( f3_local1, 1 )
		end
		f1_arg0.Button:dispatchEventToCurrentMenu( {
			name = "boss_ID",
			bossSelection = f3_local0.bossID + 1
		} )
	end )
	f1_arg0:registerEventHandler( "grid_anim", function ( element, event )
		element:SetAlpha( event.value )
	end )
end

function CPMapsBossButton( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "CPMapsBossButton"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local Button = nil
	
	Button = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f5_local1
	} )
	Button.id = "Button"
	Button:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 500, 0, 0 )
	Button:SubscribeToModelThroughElement( self, "name", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.name:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			Button.Text:setText( ToUpperCase( f6_local0 ), 0 )
		end
	end )
	self:addElement( Button )
	self.Button = Button
	
	local DownloadIcon = nil
	
	DownloadIcon = LUI.UIImage.new()
	DownloadIcon.id = "DownloadIcon"
	DownloadIcon:setImage( RegisterMaterial( "icon_download" ), 0 )
	DownloadIcon:SetUseAA( true )
	DownloadIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -80, _1080p * -54, _1080p * -13, _1080p * 13 )
	self:addElement( DownloadIcon )
	self.DownloadIcon = DownloadIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		DownloadIcon:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.DownloadIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			DownloadIcon:AnimateSequence( "DefaultSequence" )
		end
		
		DownloadIcon:RegisterAnimationSequence( "ShowDownloadIcon", {
			{
				function ()
					return self.DownloadIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowDownloadIcon = function ()
			DownloadIcon:AnimateSequence( "ShowDownloadIcon" )
		end
		
		DownloadIcon:RegisterAnimationSequence( "HideDownloadIcon", {
			{
				function ()
					return self.DownloadIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideDownloadIcon = function ()
			DownloadIcon:AnimateSequence( "HideDownloadIcon" )
		end
		
		DownloadIcon:RegisterAnimationSequence( "isArabic", {
			{
				function ()
					return self.DownloadIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -488, _1080p * -462, _1080p * -13, _1080p * 13, 0 )
				end
			}
		} )
		self._sequences.isArabic = function ()
			DownloadIcon:AnimateSequence( "isArabic" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "isOwned", function ()
		local f16_local0 = self:GetDataSource()
		if f16_local0.isOwned:GetValue( f5_local1 ) ~= nil then
			f16_local0 = self:GetDataSource()
			if f16_local0.isOwned:GetValue( f5_local1 ) == true then
				ACTIONS.AnimateSequence( self, "HideDownloadIcon" )
			end
		end
		f16_local0 = self:GetDataSource()
		if f16_local0.isOwned:GetValue( f5_local1 ) ~= nil then
			f16_local0 = self:GetDataSource()
			if f16_local0.isOwned:GetValue( f5_local1 ) == false then
				ACTIONS.AnimateSequence( self, "ShowDownloadIcon" )
			end
		end
	end )
	f0_local0( self, f5_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "isArabic" )
	end
	return self
end

MenuBuilder.registerType( "CPMapsBossButton", CPMapsBossButton )
LockTable( _M )
