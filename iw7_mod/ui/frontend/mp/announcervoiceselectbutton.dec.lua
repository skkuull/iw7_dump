local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "name", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.name:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			f1_arg0.Button.Text:setText( f2_local0 )
		end
	end )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "isUnlocked", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		if f3_local0.isUnlocked:GetValue( f1_arg1 ) then
			f1_arg0.buttonDescription = Engine.Localize( "LUA_MENU_ANNOUNCER_USE" )
			ACTIONS.AnimateSequence( f1_arg0, "Unlocked" )
		else
			f1_arg0.buttonDescription = Engine.Localize( "LUA_MENU_ANNOUNCER_PURCHASE_DESC" )
			ACTIONS.AnimateSequence( f1_arg0, "Locked" )
		end
	end )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "isSelected", function ()
		local f4_local0 = f1_arg0:GetDataSource()
		f4_local0 = f4_local0.isSelected:GetValue( f1_arg1 )
		local f4_local1 = f1_arg0.CheckBox
		local f4_local2 = f4_local1
		f4_local1 = f4_local1.SetAlpha
		local f4_local3
		if f4_local0 then
			f4_local3 = 1
			if not f4_local3 then
			
			else
				f4_local1( f4_local2, f4_local3 )
			end
		end
		f4_local3 = 0
	end )
	f1_arg0:addEventHandler( "button_over", function ( f5_arg0, f5_arg1 )
		ACTIONS.AnimateSequence( f1_arg0, "ButtonOver" )
	end )
	f1_arg0:addEventHandler( "button_up", function ( f6_arg0, f6_arg1 )
		ACTIONS.AnimateSequence( f1_arg0, "ButtonUp" )
	end )
	f1_arg0:registerEventHandler( "button_action", function ( element, event )
		local f7_local0 = element:GetDataSource()
		if not f7_local0.isUnlocked:GetValue( f1_arg1 ) then
			local f7_local1 = function ()
				local f8_local0 = STORE.GoToStore
				local f8_local1 = f1_arg1
				local f8_local2 = element:GetCurrentMenu()
				f8_local0( f8_local1, f8_local2.id, element.id )
			end
			
			local f7_local2 = element:GetDataSource()
			LUI.FlowManager.RequestPopupMenu( element, "AnnouncerStoreYesNoPopup", false, f1_arg1, false, {
				controllerIndex = f1_arg1,
				confirmAction = f7_local1,
				name = f7_local2.name:GetValue( f1_arg1 )
			} )
		else
			local f7_local1 = element:GetDataSource()
			f7_local1 = f7_local1.announcerId
			assert( f7_local1 )
			Engine.SetPlayerDataEx( f1_arg1, CoD.StatsGroup.Common, "mp_announcer_type", f7_local1 )
			local f7_local2 = "frontEnd.MP.AnnouncerVoice"
			WipeGlobalModelsAtPath( f7_local2 )
			WipeGlobalModelsAtPath( f7_local2 .. "." .. "voice" )
			ACTIONS.LeaveMenu( element )
		end
	end )
end

function AnnouncerVoiceSelectButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "AnnouncerVoiceSelectButton"
	self._animationSets = {}
	self._sequences = {}
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	local f9_local2 = self
	local Button = nil
	
	Button = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f9_local1
	} )
	Button.id = "Button"
	Button.Text:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	Button:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 30 )
	self:addElement( Button )
	self.Button = Button
	
	local CheckBox = nil
	
	CheckBox = MenuBuilder.BuildRegisteredType( "GenericCheckBox", {
		controllerIndex = f9_local1
	} )
	CheckBox.id = "CheckBox"
	CheckBox:SetAlpha( 0, 0 )
	CheckBox:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 428.81, _1080p * 444.81, _1080p * 7, _1080p * 23 )
	self:addElement( CheckBox )
	self.CheckBox = CheckBox
	
	local PurchaseString = nil
	
	PurchaseString = LUI.UIStyledText.new()
	PurchaseString.id = "PurchaseString"
	PurchaseString:SetRGBFromInt( 14277081, 0 )
	PurchaseString:SetAlpha( 0, 0 )
	PurchaseString:setText( Engine.Localize( "LUA_MENU_ANNOUNCER_PURCHASE" ), 0 )
	PurchaseString:SetFontSize( 18 * _1080p )
	PurchaseString:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PurchaseString:SetAlignment( LUI.Alignment.Right )
	PurchaseString:SetStartupDelay( 1000 )
	PurchaseString:SetLineHoldTime( 400 )
	PurchaseString:SetAnimMoveTime( 150 )
	PurchaseString:SetEndDelay( 1000 )
	PurchaseString:SetCrossfadeTime( 400 )
	PurchaseString:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	PurchaseString:SetMaxVisibleLines( 1 )
	PurchaseString:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 257, _1080p * -82, _1080p * -9, _1080p * 9 )
	self:addElement( PurchaseString )
	self.PurchaseString = PurchaseString
	
	local Arrow = nil
	
	Arrow = LUI.UIImage.new()
	Arrow.id = "Arrow"
	Arrow:SetAlpha( 0, 0 )
	Arrow:setImage( RegisterMaterial( "icon_download" ), 0 )
	Arrow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 423.81, _1080p * 449.81, _1080p * 2, _1080p * 28 )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CheckBox:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.CheckBox.Frame:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.CheckBox.Fill:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		PurchaseString:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.PurchaseString:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			CheckBox:AnimateSequence( "ButtonOver" )
			PurchaseString:AnimateSequence( "ButtonOver" )
		end
		
		CheckBox:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.CheckBox.Fill:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.CheckBox.Frame:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		PurchaseString:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.PurchaseString:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			CheckBox:AnimateSequence( "ButtonUp" )
			PurchaseString:AnimateSequence( "ButtonUp" )
		end
		
		CheckBox:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.CheckBox:SetAlpha( 0, 0 )
				end
			}
		} )
		PurchaseString:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.PurchaseString:SetAlpha( 1, 0 )
				end
			}
		} )
		Arrow:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Arrow:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			CheckBox:AnimateSequence( "Locked" )
			PurchaseString:AnimateSequence( "Locked" )
			Arrow:AnimateSequence( "Locked" )
		end
		
		PurchaseString:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.PurchaseString:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			PurchaseString:AnimateSequence( "Unlocked" )
		end
		
		CheckBox:RegisterAnimationSequence( "IsArabic", {
			{
				function ()
					return self.CheckBox:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17.81, _1080p * 33.81, _1080p * 7, _1080p * 23, 0 )
				end
			}
		} )
		PurchaseString:RegisterAnimationSequence( "IsArabic", {
			{
				function ()
					return self.PurchaseString:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 43.81, _1080p * -420.19, _1080p * -9, _1080p * 9, 0 )
				end
			}
		} )
		Arrow:RegisterAnimationSequence( "IsArabic", {
			{
				function ()
					return self.Arrow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12.81, _1080p * 38.81, _1080p * 2, _1080p * 28, 0 )
				end
			}
		} )
		self._sequences.IsArabic = function ()
			CheckBox:AnimateSequence( "IsArabic" )
			PurchaseString:AnimateSequence( "IsArabic" )
			Arrow:AnimateSequence( "IsArabic" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f9_local1, controller )
	if CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "IsArabic" )
	end
	return self
end

MenuBuilder.registerType( "AnnouncerVoiceSelectButton", AnnouncerVoiceSelectButton )
LockTable( _M )
