local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.CAC.personalizeWeapon"
function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local1 = function ( f2_arg0 )
	return Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f2_arg0, CSV.weapons.cols.canUseCosmetic ) == "1"
end

function PostLoadFunc( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg2 )
	if Engine.IsDevelopmentBuild() and not f3_arg2.weaponDataSource then
		DebugPrint( "WARNING: Missing \"weaponDataSource\" option for PersonalizeWeapon menu. Only OK after a MyChanges." )
		local f3_local0 = f3_arg2.statsGroupDataSource.loadouts:GetDataSourceAtIndex( 0 )
		f3_arg2.weaponDataSource = f3_local0.weaponSlotOne
	end
	assert( f3_arg2.weaponDataSource )
	f3_arg0.weaponDataSource = f3_arg2.weaponDataSource
	local f3_local0 = f3_arg0.weaponDataSource.weapon:GetValue( f3_arg1 )
	f3_arg0:SetDataSource( f3_arg0.weaponDataSource, f3_arg1 )
	if CONDITIONS.IsCoreMultiplayer( f3_arg0 ) then
		f3_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumbCreateAClass(), 0 )
	end
	if CONDITIONS.IsMultiplayer( f3_arg0 ) then
		if Engine.IsCoreMode() then
			FrontEndScene.SetTeamAndScene( "loadout_select", f3_arg1 )
		end
		local f3_local1 = not Cac.IsWeaponLootIDHoliday( f3_arg0.weaponDataSource.lootItemID:GetValue( f3_arg1 ) )
		assert( f3_arg0.PersonalizeButtonList )
		f3_arg0.PersonalizeButtonList.CamoButton:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
			LUI.FlowManager.RequestAddMenu( "CamoSelect", true, f3_arg1, nil, f3_arg2, true )
		end )
		if f3_local1 then
			f3_arg0.PersonalizeButtonList.CamoButton:addEventHandler( "gain_focus", function ( f5_arg0, f5_arg1 )
				f5_arg0:AddButtonHelperText( {
					helper_text = Engine.Localize( "MENU_REMOVE" ),
					button_ref = "button_alt1",
					side = "left",
					priority = 2,
					clickable = false
				} )
			end )
		else
			f3_arg0.PersonalizeButtonList.CamoButton.buttonDescription = Engine.Localize( "LUA_MENU_MP_WEAPON_PERSONALIZE_CAMO_MK2" )
			f3_arg0.PersonalizeButtonList.CamoButton:SetButtonDisabled( true )
		end
		f3_arg0.PersonalizeButtonList.CamoButton:addEventHandler( "lose_focus", function ( f6_arg0, f6_arg1 )
			f6_arg0:RemoveButtonHelperText( "button_alt1", "left" )
		end )
		f3_arg0.PersonalizeButtonList.AccessoryButton:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
			LUI.FlowManager.RequestAddMenu( "CosmeticAttachmentSelect", true, f3_arg1, nil, f3_arg2, true )
		end )
		f3_arg0.PersonalizeButtonList.AccessoryButton:SetButtonDisabled( not f0_local1( f3_local0 ) )
		if not f3_arg0.PersonalizeButtonList.AccessoryButton:IsDisabled() then
			f3_arg0.PersonalizeButtonList.AccessoryButton:addEventHandler( "gain_focus", function ( f8_arg0, f8_arg1 )
				f8_arg0:AddButtonHelperText( {
					helper_text = Engine.Localize( "MENU_REMOVE" ),
					button_ref = "button_alt1",
					side = "left",
					priority = 2,
					clickable = false
				} )
			end )
			f3_arg0.PersonalizeButtonList.AccessoryButton:addEventHandler( "lose_focus", function ( f9_arg0, f9_arg1 )
				f9_arg0:RemoveButtonHelperText( "button_alt1", "left" )
			end )
		else
			f3_arg0.PersonalizeButtonList.AccessoryButton.buttonDescription = Engine.Localize( "LUA_MENU_MP_WEAPON_PERSONALIZE_ACCESSORY_LOCKED" )
		end
		if Engine.IsAliensMode() then
			f3_arg0.CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
		else
			f3_arg0.CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		end
		if CONDITIONS.InFrontendPublicMP( f3_arg0 ) and f3_arg0.PersonalizeButtonList.PersonalizeWeaponPrestigeBtn then
			f3_arg0.PersonalizeButtonList.PersonalizeWeaponPrestigeBtn:InitFromWeaponDataSource( f3_arg0.weaponDataSource, f3_arg1 )
		end
		ClientWeapon.SetWeaponRotation( 0, 0, 0, 0 )
		if Engine.IsConsoleGame() then
			f3_arg0:AddButtonHelperTextToElement( f3_arg0, {
				helper_text = Engine.Localize( "LUA_MENU_ROTATE" ),
				button_ref = "button_stickr_updown_noswap",
				priority = 10,
				side = "left",
				clickable = false
			} )
		end
		f3_arg0.QualityIcon:SubscribeToModelThroughElement( f3_arg0, "quality", function ()
			local f10_local0 = f3_arg0.weaponDataSource.lootItemID:GetValue( f3_arg1 )
			local f10_local1 = f3_arg0:GetDataSource()
			f10_local1 = f10_local1.qualityImage:GetValue( f3_arg1 )
			if f10_local1 ~= nil then
				f3_arg0.QualityIcon.IconDuplicate:setImage( RegisterMaterial( f10_local1 .. "_mk2" ), 0 )
			end
			if f10_local0 ~= nil and Cac.IsLootIDMk2( f10_local0 ) then
				f3_arg0.MK2:SetAlpha( 0.5, 0 )
				f3_arg0.MK2Pattern:SetAlpha( 1, 0 )
				if Engine.IsCoreMode() then
					ACTIONS.AnimateSequenceByElement( f3_arg0, {
						elementName = "QualityIcon",
						sequenceName = "LegendaryPulse",
						elementPath = "QualityIcon"
					} )
				end
			else
				f3_arg0.QualityIcon.IconDuplicate:SetAlpha( 0, 0 )
				f3_arg0.MK2:SetAlpha( 0, 0 )
				f3_arg0.MK2Pattern:SetAlpha( 0, 0 )
				if Engine.IsCoreMode() then
					ACTIONS.AnimateSequenceByElement( f3_arg0, {
						elementName = "QualityIcon",
						sequenceName = "StopPulse",
						elementPath = "QualityIcon"
					} )
				end
			end
		end )
	end
end

function PersonalizeWeapon( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "PersonalizeWeapon"
	self._animationSets = {}
	self._sequences = {}
	local f11_local1 = controller and controller.controllerIndex
	if not f11_local1 and not Engine.InFrontend() then
		f11_local1 = self:getRootController()
	end
	assert( f11_local1 )
	self:playSound( "menu_open" )
	local f11_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f11_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f11_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local f11_local5 = nil
	if CONDITIONS.IsMultiplayer( self ) then
		f11_local5 = LUI.UIImage.new()
		f11_local5.id = "WeaponImage"
		f11_local5:SetAlpha( 0, 0 )
		f11_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1169.05, _1080p * 1580.96, _1080p * 404.48, _1080p * 787.48 )
		f11_local5:SubscribeToModelThroughElement( self, "icon", function ()
			local f12_local0 = self:GetDataSource()
			f12_local0 = f12_local0.icon:GetValue( f11_local1 )
			if f12_local0 ~= nil then
				f11_local5:setImage( RegisterMaterial( f12_local0 ), 0 )
			end
		end )
		self:addElement( f11_local5 )
		self.WeaponImage = f11_local5
	end
	local f11_local6 = nil
	if CONDITIONS.IsMultiplayer( self ) then
		f11_local6 = MenuBuilder.BuildRegisteredType( "PersonalizeButtonList", {
			controllerIndex = f11_local1
		} )
		f11_local6.id = "PersonalizeButtonList"
		if CONDITIONS.IsMultiplayer( self ) then
			f11_local6:SetDataSourceThroughElement( self, nil )
		end
		f11_local6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 97, _1080p * 719, _1080p * 216, _1080p * 911 )
		self:addElement( f11_local6 )
		self.PersonalizeButtonList = f11_local6
	end
	local CACItemHeader = nil
	CACItemHeader = MenuBuilder.BuildRegisteredType( "CACItemHeader", {
		controllerIndex = f11_local1
	} )
	CACItemHeader.id = "CACItemHeader"
	CACItemHeader.ItemDescription:SetRight( _1080p * 750, 0 )
	CACItemHeader.ItemName:SetFontSize( 105 * _1080p )
	CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 736, 0, _1080p * 216, _1080p * 316 )
	CACItemHeader:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f13_local0 = self:GetDataSource()
		f13_local0 = f13_local0.qualityColor:GetValue( f11_local1 )
		if f13_local0 ~= nil then
			CACItemHeader.Background:SetRGBFromInt( f13_local0, 0 )
		end
	end )
	CACItemHeader:SubscribeToModelThroughElement( self, "desc", function ()
		local f14_local0 = self:GetDataSource()
		f14_local0 = f14_local0.desc:GetValue( f11_local1 )
		if f14_local0 ~= nil then
			CACItemHeader.ItemDescription:setText( f14_local0, 0 )
		end
	end )
	CACItemHeader:SubscribeToModelThroughElement( self, "name", function ()
		local f15_local0 = self:GetDataSource()
		f15_local0 = f15_local0.name:GetValue( f11_local1 )
		if f15_local0 ~= nil then
			CACItemHeader.ItemName:setText( f15_local0, 0 )
		end
	end )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
		CACItemHeader:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f16_local0 = self:GetDataSource()
			f16_local0 = f16_local0.qualityColor:GetValue( f11_local1 )
			if f16_local0 ~= nil then
				CACItemHeader.MPStrip:SetRGBFromInt( f16_local0, 0 )
			end
		end )
	end
	self:addElement( CACItemHeader )
	self.CACItemHeader = CACItemHeader
	
	local MK2Pattern = nil
	
	MK2Pattern = MenuBuilder.BuildRegisteredType( "MK2Pattern", {
		controllerIndex = f11_local1
	} )
	MK2Pattern.id = "MK2Pattern"
	MK2Pattern:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 736, 0, _1080p * 215, _1080p * 315 )
	MK2Pattern:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f17_local0 = self:GetDataSource()
		f17_local0 = f17_local0.qualityColor:GetValue( f11_local1 )
		if f17_local0 ~= nil then
			MK2Pattern:SetRGBFromInt( f17_local0, 0 )
		end
	end )
	self:addElement( MK2Pattern )
	self.MK2Pattern = MK2Pattern
	
	local f11_local9 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f11_local9 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f11_local1
		} )
		f11_local9.id = "MenuTitle"
		f11_local9.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_PERSONALIZE" ) ), 0 )
		f11_local9.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
		f11_local9.Icon:SetTop( _1080p * -28.5, 0 )
		f11_local9.Icon:SetBottom( _1080p * 61.5, 0 )
		f11_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f11_local9 )
		self.MenuTitle = f11_local9
	end
	local f11_local10 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f11_local10 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f11_local1
		} )
		f11_local10.id = "CPMenuTitle"
		f11_local10.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_PERSONALIZE" ) ), 0 )
		f11_local10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f11_local10 )
		self.CPMenuTitle = f11_local10
	end
	local f11_local11 = nil
	if Engine.IsMultiplayer() then
		f11_local11 = MenuBuilder.BuildRegisteredType( "Passives", {
			controllerIndex = f11_local1
		} )
		f11_local11.id = "Passives"
		if Engine.IsMultiplayer() then
			f11_local11:SetDataSourceThroughElement( self, "passives" )
		end
		f11_local11.Grid:SetLeft( _1080p * 0, 0 )
		f11_local11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1286, _1080p * 1902, _1080p * 228, _1080p * 308 )
		self:addElement( f11_local11 )
		self.Passives = f11_local11
	end
	local f11_local12 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f11_local12 = LUI.UIStyledText.new()
		f11_local12.id = "Quality"
		f11_local12:SetFontSize( 32 * _1080p )
		f11_local12:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f11_local12:SetAlignment( LUI.Alignment.Left )
		f11_local12:SetDecodeLetterLength( 20 )
		f11_local12:SetDecodeMaxRandChars( 6 )
		f11_local12:SetDecodeUpdatesPerLetter( 4 )
		f11_local12:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 792, _1080p * 759, _1080p * 275, _1080p * 307 )
		f11_local12:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f18_local0 = self:GetDataSource()
			f18_local0 = f18_local0.qualityColor:GetValue( f11_local1 )
			if f18_local0 ~= nil then
				f11_local12:SetRGBFromInt( f18_local0, 0 )
			end
		end )
		f11_local12:SubscribeToModelThroughElement( self, "qualityString", function ()
			local f19_local0 = self:GetDataSource()
			f19_local0 = f19_local0.qualityString:GetValue( f11_local1 )
			if f19_local0 ~= nil then
				f11_local12:setText( ToUpperCase( f19_local0 ), 0 )
			end
		end )
		self:addElement( f11_local12 )
		self.Quality = f11_local12
	end
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f11_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 755, _1080p * 787, _1080p * 275, _1080p * 307 )
	QualityIcon:SubscribeToModelThroughElement( self, "qualityImage", function ()
		local f20_local0 = self:GetDataSource()
		f20_local0 = f20_local0.qualityImage:GetValue( f11_local1 )
		if f20_local0 ~= nil then
			QualityIcon.IconShadow:setImage( RegisterMaterial( f20_local0 ), 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f21_local0 = self:GetDataSource()
		f21_local0 = f21_local0.qualityColor:GetValue( f11_local1 )
		if f21_local0 ~= nil then
			QualityIcon.Icon:SetRGBFromInt( f21_local0, 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "qualityImage", function ()
		local f22_local0 = self:GetDataSource()
		f22_local0 = f22_local0.qualityImage:GetValue( f11_local1 )
		if f22_local0 ~= nil then
			QualityIcon.Icon:setImage( RegisterMaterial( f22_local0 ), 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f23_local0 = self:GetDataSource()
		f23_local0 = f23_local0.qualityColor:GetValue( f11_local1 )
		if f23_local0 ~= nil then
			QualityIcon.IconDuplicate:SetRGBFromInt( f23_local0, 0 )
		end
	end )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f11_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 142 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local f11_local15 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f11_local15 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f11_local1
		} )
		f11_local15.id = "CRMMain"
		f11_local15:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f11_local15 )
		self.CRMMain = f11_local15
	end
	local f11_local16 = nil
	if CONDITIONS.InFrontend( self ) then
		f11_local16 = LUI.UIImage.new()
		f11_local16.id = "MK2"
		f11_local16:SetAlpha( 0.5, 0 )
		f11_local16:setImage( RegisterMaterial( "mk2_watermark_1" ), 0 )
		f11_local16:SetBlendMode( BLEND_MODE.addWithAlpha )
		f11_local16:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1142, _1080p * 1238, _1080p * 267, _1080p * 315 )
		self:addElement( f11_local16 )
		self.MK2 = f11_local16
	end
	local WeaponRotator = nil
	
	WeaponRotator = MenuBuilder.BuildRegisteredType( "WeaponRotator", {
		controllerIndex = f11_local1
	} )
	WeaponRotator.id = "WeaponRotator"
	WeaponRotator:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 750, _1080p * -50, _1080p * 400, _1080p * 950 )
	self:addElement( WeaponRotator )
	self.WeaponRotator = WeaponRotator
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		QualityIcon:RegisterAnimationSequence( "HideQuality", {
			{
				function ()
					return self.QualityIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideQuality = function ()
			QualityIcon:AnimateSequence( "HideQuality" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if Engine.IsMultiplayer() then
		
	else
		
	end
	if CONDITIONS.IsMultiplayer( self ) then
		f11_local6:SetDataSourceThroughElement( self, nil )
	end
	if Engine.IsMultiplayer() then
		f11_local11:SetDataSourceThroughElement( self, "passives" )
	end
	self.addButtonHelperFunction = function ( f28_arg0, f28_arg1 )
		f28_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f28_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f28_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_REMOVE" ),
			button_ref = "button_alt1",
			side = "left",
			priority = 2
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f29_arg0, f29_arg1 )
		local f29_local0 = f29_arg1.controller or f11_local1
		ACTIONS.LeaveMenu( self )
	end )
	self:SubscribeToModelThroughElement( self, "desc", function ()
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CACItemHeader",
			sequenceName = "UpdateDescription",
			elementPath = "CACItemHeader"
		} )
	end )
	self:SubscribeToModelThroughElement( self, "quality", function ()
		local f31_local0 = self:GetDataSource()
		if f31_local0.quality:GetValue( f11_local1 ) ~= nil then
			f31_local0 = self:GetDataSource()
			if f31_local0.quality:GetValue( f11_local1 ) == 0 then
				ACTIONS.AnimateSequence( self, "HideQuality" )
			end
		end
		f31_local0 = self:GetDataSource()
		if f31_local0.quality:GetValue( f11_local1 ) ~= nil then
			f31_local0 = self:GetDataSource()
			if f31_local0.quality:GetValue( f11_local1 ) == 0 and CONDITIONS.IsThirdGameMode( self ) then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "CACItemHeader",
					sequenceName = "HideQuality",
					elementPath = "CACItemHeader"
				} )
			end
		end
		f31_local0 = self:GetDataSource()
		if f31_local0.quality:GetValue( f11_local1 ) ~= nil then
			f31_local0 = self:GetDataSource()
			if f31_local0.quality:GetValue( f11_local1 ) > 0 and CONDITIONS.IsThirdGameMode( self ) then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "CACItemHeader",
					sequenceName = "ShowQuality",
					elementPath = "CACItemHeader"
				} )
			end
		end
	end )
	PostLoadFunc( self, f11_local1, controller )
	if CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end
	return self
end

MenuBuilder.registerType( "PersonalizeWeapon", PersonalizeWeapon )
LUI.FlowManager.RegisterStackPopBehaviour( "PersonalizeWeapon", PopFunc )
LockTable( _M )
