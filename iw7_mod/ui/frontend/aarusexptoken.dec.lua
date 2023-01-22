local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.ConfirmButton and f1_arg0.DoubleXPIcon, "WARNING: AAR Use XP Token Items Are Missing..." )
	assert( f1_arg2.parent )
	assert( f1_arg2.parentMenu )
	local f1_local0 = false
	f1_arg0.TokensAvailable:setText( Engine.Localize( "MP_FRONTEND_ONLY_NUMBER_AVAILABLE_CAPS", Loot.IsOwned( f1_arg1, LOOT.DoubleXPTokenID ) ), 0 )
	f1_arg0.DoubleXPIcon:SetAlpha( 0 )
	f1_arg0.DoubleXPIcon:SetScale( 1 )
	f1_arg0.DoubleXPIcon:SetAlpha( 1, 200, LUI.EASING.outBack )
	f1_arg0.DoubleXPIcon:SetScale( -0.15, 200, LUI.EASING.outBack )
	f1_arg0.ConfirmButton:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		if f1_local0 then
			ACTIONS.LeaveMenu( f1_arg0 )
			f1_arg2.parentMenu:processEvent( {
				name = "showDoubleXPCeremony"
			} )
		else
			if Loot.IsOwned( f1_arg1, LOOT.DoubleXPTokenID ) == 1 then
				f1_arg2.parentMenu:RemoveButtonHelperTextFromElement( f1_arg2.parentMenu.ButtonHelperBar, "button_alt1", "left" )
			end
			LOOT.UseDoubleXPToken( f1_arg1 )
			f1_arg2.parent.usedDoubleXP = true
			DataSources.frontEnd.MP.usedDoubleXPToken:SetValue( f1_arg1, true )
			f1_arg2.parentMenu:processEvent( {
				name = "doubleXPUsed"
			} )
			f1_local0 = true
			ACTIONS.AnimateSequence( f1_arg0, "ShowNewXP" )
			f1_arg0.CancelButton:SetFocusable( false )
		end
	end )
	f1_arg0:SubscribeToModel( DataSources.alwaysLoaded.playerData.MP.ranked.progression.playerLevel.xp:GetModel( f1_arg1 ), function ()
		local f3_local0 = ""
		local f3_local1 = CoD.GetCommonPlayerDataDataSource()
		f3_local1 = f3_local1.round.totalXp:GetValue( f1_arg1 )
		if f3_local1 ~= nil then
			f3_local0 = f3_local1 * 2
		end
		f1_arg0.XPPopupText:setText( f3_local0, 0 )
	end )
end

function AARUseXPToken( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "AARUseXPToken"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local PopupFrame = nil
	
	PopupFrame = MenuBuilder.BuildRegisteredType( "PopupFrame", {
		controllerIndex = f4_local1
	} )
	PopupFrame.id = "PopupFrame"
	PopupFrame.Title:setText( Engine.Localize( "MP_FRONTEND_ONLY_2XP_TOKEN" ), 0 )
	PopupFrame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -350, _1080p * 350, _1080p * -150, _1080p * 140 )
	self:addElement( PopupFrame )
	self.PopupFrame = PopupFrame
	
	local CancelButton = nil
	
	CancelButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f4_local1
	} )
	CancelButton.id = "CancelButton"
	CancelButton.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CANCEL" ) ), 0 )
	CancelButton.Label:SetAlignment( LUI.Alignment.Left )
	CancelButton:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -350, _1080p * 350, _1080p * 650, _1080p * 680 )
	self:addElement( CancelButton )
	self.CancelButton = CancelButton
	
	local ConfirmButton = nil
	
	ConfirmButton = MenuBuilder.BuildRegisteredType( "PopupButton", {
		controllerIndex = f4_local1
	} )
	ConfirmButton.id = "ConfirmButton"
	ConfirmButton.Label:setText( ToUpperCase( Engine.Localize( "MP_FRONTEND_ONLY_2XP_BTN" ) ), 0 )
	ConfirmButton.Label:SetAlignment( LUI.Alignment.Left )
	ConfirmButton:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -350, _1080p * 350, _1080p * 614, _1080p * 644 )
	self:addElement( ConfirmButton )
	self.ConfirmButton = ConfirmButton
	
	local MessageText = nil
	
	MessageText = LUI.UIStyledText.new()
	MessageText.id = "MessageText"
	MessageText:setText( Engine.Localize( "MP_FRONTEND_ONLY_2XP_MESSAGE" ), 0 )
	MessageText:SetFontSize( 24 * _1080p )
	MessageText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MessageText:SetAlignment( LUI.Alignment.Left )
	MessageText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -340, _1080p * 20, _1080p * 470, _1080p * 494 )
	self:addElement( MessageText )
	self.MessageText = MessageText
	
	local DoubleXPIcon = nil
	
	DoubleXPIcon = LUI.UIImage.new()
	DoubleXPIcon.id = "DoubleXPIcon"
	DoubleXPIcon:SetScale( -0.15, 0 )
	DoubleXPIcon:setImage( RegisterMaterial( "icon_iw7_xp_token" ), 0 )
	DoubleXPIcon:SetUseAA( true )
	DoubleXPIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 84, _1080p * 340, _1080p * 361, _1080p * 617 )
	self:addElement( DoubleXPIcon )
	self.DoubleXPIcon = DoubleXPIcon
	
	local f4_local8 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f4_local8 = LUI.UIImage.new()
		f4_local8.id = "XPPopupScorebar"
		f4_local8:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
		f4_local8:SetAlpha( 0, 0 )
		f4_local8:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 601, _1080p * -601, _1080p * -52, _1080p * 38 )
		self:addElement( f4_local8 )
		self.XPPopupScorebar = f4_local8
	end
	local f4_local9 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f4_local9 = LUI.UIText.new()
		f4_local9.id = "XPPopupText"
		f4_local9:SetRGBFromInt( 0, 0 )
		f4_local9:SetAlpha( 0, 0 )
		f4_local9:setText( "", 0 )
		f4_local9:SetFontSize( 64 * _1080p )
		f4_local9:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f4_local9:SetAlignment( LUI.Alignment.Center )
		f4_local9:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -500, _1080p * 500, _1080p * -21.5, _1080p * 42.5 )
		self:addElement( f4_local9 )
		self.XPPopupText = f4_local9
	end
	local f4_local10 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f4_local10 = LUI.UIText.new()
		f4_local10.id = "XPTotalLabel"
		f4_local10:SetRGBFromInt( 0, 0 )
		f4_local10:SetAlpha( 0, 0 )
		f4_local10:setText( Engine.Localize( "LUA_MENU_TOTAL_XP_EARNED_CAPS" ), 0 )
		f4_local10:SetFontSize( 32 * _1080p )
		f4_local10:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f4_local10:SetAlignment( LUI.Alignment.Center )
		f4_local10:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -500, _1080p * 500, _1080p * -50.5, _1080p * -18.5 )
		self:addElement( f4_local10 )
		self.XPTotalLabel = f4_local10
	end
	local TokensAvailable = nil
	
	TokensAvailable = LUI.UIText.new()
	TokensAvailable.id = "TokensAvailable"
	TokensAvailable:SetAlpha( 0.6, 0 )
	TokensAvailable:setText( "", 0 )
	TokensAvailable:SetFontSize( 22 * _1080p )
	TokensAvailable:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TokensAvailable:SetAlignment( LUI.Alignment.Center )
	TokensAvailable:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -39.5, _1080p * 460.5, _1080p * 585, _1080p * 607 )
	self:addElement( TokensAvailable )
	self.TokensAvailable = TokensAvailable
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CancelButton:RegisterAnimationSequence( "ShowNewXP", {
			{
				function ()
					return self.CancelButton:SetAlpha( 0, 0 )
				end
			}
		} )
		ConfirmButton:RegisterAnimationSequence( "ShowNewXP", {
			{
				function ()
					return self.ConfirmButton.Label:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CLOSE" ) ), 0 )
				end
			},
			{
				function ()
					return self.ConfirmButton:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -350, _1080p * 350, _1080p * 650, _1080p * 680, 0 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "ShowNewXP", {
			{
				function ()
					return self.MessageText:SetAlpha( 0, 0 )
				end
			}
		} )
		DoubleXPIcon:RegisterAnimationSequence( "ShowNewXP", {
			{
				function ()
					return self.DoubleXPIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f4_local8:RegisterAnimationSequence( "ShowNewXP", {
				{
					function ()
						return self.XPPopupScorebar:SetAlpha( 0, 0 )
					end,
					function ()
						return self.XPPopupScorebar:SetAlpha( 1, 250, LUI.EASING.outQuadratic )
					end
				},
				{
					function ()
						return self.XPPopupScorebar:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 601, _1080p * -601, _1080p * -8.5, _1080p * -5.5, 0 )
					end,
					function ()
						return self.XPPopupScorebar:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 601, _1080p * -601, _1080p * -52, _1080p * 38, 250, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f4_local9:RegisterAnimationSequence( "ShowNewXP", {
				{
					function ()
						return self.XPPopupText:SetAlpha( 0, 0 )
					end,
					function ()
						return self.XPPopupText:SetAlpha( 1, 250 )
					end
				}
			} )
		end
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f4_local10:RegisterAnimationSequence( "ShowNewXP", {
				{
					function ()
						return self.XPTotalLabel:SetAlpha( 0, 0 )
					end,
					function ()
						return self.XPTotalLabel:SetAlpha( 1, 250 )
					end
				}
			} )
		end
		TokensAvailable:RegisterAnimationSequence( "ShowNewXP", {
			{
				function ()
					return self.TokensAvailable:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ShowNewXP = function ()
			CancelButton:AnimateSequence( "ShowNewXP" )
			ConfirmButton:AnimateSequence( "ShowNewXP" )
			MessageText:AnimateSequence( "ShowNewXP" )
			DoubleXPIcon:AnimateSequence( "ShowNewXP" )
			if CONDITIONS.IsCoreMultiplayer( self ) then
				f4_local8:AnimateSequence( "ShowNewXP" )
			end
			if CONDITIONS.IsCoreMultiplayer( self ) then
				f4_local9:AnimateSequence( "ShowNewXP" )
			end
			if CONDITIONS.IsCoreMultiplayer( self ) then
				f4_local10:AnimateSequence( "ShowNewXP" )
			end
			TokensAvailable:AnimateSequence( "ShowNewXP" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	CancelButton:addEventHandler( "button_action", function ( f22_arg0, f22_arg1 )
		local f22_local0 = f22_arg1.controller or f4_local1
		ACTIONS.LeaveMenu( self )
	end )
	self.addButtonHelperFunction = function ( f23_arg0, f23_arg1 )
		f23_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f23_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f24_arg0, f24_arg1 )
		local f24_local0 = f24_arg1.controller or f4_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "AARUseXPToken", AARUseXPToken )
LockTable( _M )
