local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ()
	Engine.NotifyServer( "taunt_reset", 1 )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0.previewAnim
	local f2_local1 = f2_arg0.index
	local f2_local2 = Cac.GetAltTauntAnim( f2_local1, f2_arg1, true )
	if f2_local2 then
		f2_local0 = f2_local2
	end
	if f2_local0 ~= nil and #f2_local0 > 0 then
		local f2_local3 = Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.index, f2_local1, CSV.taunts.cols.useGunIdle ) == "Y"
		local f2_local4 = nil
		local f2_local5 = false
		if f2_local3 then
			local f2_local6 = string.gsub( Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.ref, Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f2_arg1, CSV.battleRigs.cols.tauntGunOut ), CSV.taunts.cols.anim ), " ", "" )
			f2_local4 = string.gsub( Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.ref, Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.ref, f2_arg1, CSV.battleRigs.cols.tauntGunIn ), CSV.taunts.cols.anim ), " ", "" )
		end
		if f2_local5 then
			ClientCharacter.QueueCharacterAnim( FrontEndScene.ClientCharacters.Customization, f2_local0, nil, 0.1 )
		else
			ClientCharacter.PlayCharacterAnim( FrontEndScene.ClientCharacters.Customization, f2_local0, 0.1 )
		end
		if f2_local4 then
			ClientCharacter.QueueCharacterAnim( FrontEndScene.ClientCharacters.Customization, f2_local4, nil, 0.1 )
		end
		ClientCharacter.QueueCharacterAnim( FrontEndScene.ClientCharacters.Customization, Cac.GetRigFrontEndCustomizationArmsDownIdleAnim( f2_arg1 ), nil, 0.1 )
		local f2_local6 = Engine.TableLookupGetRowNum( CSV.taunts.file, CSV.taunts.cols.previewAnim, f2_local0 )
		if f2_local6 == -1 then
			f2_local6 = Engine.TableLookupGetRowNum( CSV.taunts.file, CSV.taunts.cols.altPreviewAnim, f2_local0 )
		end
		Engine.NotifyServer( "taunt_started", f2_local6 )
	else
		Engine.NotifyServer( "taunt_reset", 1 )
	end
end

f0_local2 = function ( f3_arg0 )
	assert( f3_arg0._currentTauntData )
	f3_arg0.Details:SetName( Engine.Localize( f3_arg0._currentTauntData.name ) )
	f3_arg0.Details:SetQuality( f3_arg0._currentTauntData.quality )
	local f3_local0 = f3_arg0._currentTauntData.customUnlockString
	if f3_arg0._currentTauntData.isLocked then
		f3_local0 = f3_arg0._currentTauntData.howToUnlock
	end
	f3_arg0.Details:SetDescription( f3_local0, f3_arg0._currentTauntData.unlockTextParam )
end

local f0_local3 = function ( f4_arg0, f4_arg1, f4_arg2 )
	assert( f4_arg2 )
	if Engine.IsDevelopmentBuild() then
		if not f4_arg2.rigRef then
			DebugPrint( "WARNING: Missing \"rigRef\" option for RigCustomizationActionSelection menu. Only OK after a MyChanges." )
			f4_arg2.rigRef = "archetype_assault"
		end
		if not f4_arg2.tauntSlot then
			DebugPrint( "WARNING: Missing \"tauntSlot\" option for RigCustomizationActionSelection menu. Only OK after a MyChanges." )
			f4_arg2.tauntSlot = 0
		end
		if not f4_arg2.squadMemberDataSource then
			DebugPrint( "WARNING: Missing \"squadMemberDataSource\" option for RigCustomizationActionSelection menu. Only OK after a MyChanges." )
			f4_arg2.squadMemberDataSource = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers
		end
	end
	assert( f4_arg2.rigRef )
	assert( f4_arg2.tauntSlot )
	assert( f4_arg2.squadMemberDataSource )
	assert( f4_arg0.ItemList )
	assert( f4_arg0.Details )
	FrontEndScene.SetScene( "rig_taunt_select" )
	local f4_local0, f4_local1 = Cac.GetRigFrontEndTauntTransitionAnims( f4_arg2.rigRef )
	local f4_local2 = Cac.GetRigFrontEndCustomizationArmsDownIdleAnim( f4_arg2.rigRef )
	ClientCharacter.PlayCharacterAnim( FrontEndScene.ClientCharacters.Customization, f4_local0, 0.1 )
	ClientCharacter.QueueCharacterAnim( FrontEndScene.ClientCharacters.Customization, f4_local2, nil, 0.1 )
	local f4_local3 = {}
	local f4_local4 = f4_arg2.squadMemberDataSource.taunts[f4_arg2.tauntSlot]:GetValue( f4_arg1 )
	local f4_local5 = 0
	local f4_local6 = Engine.TableGetRowCount( CSV.taunts.file )
	for f4_local7 = 0, f4_local6, 1 do
		if not (Engine.TableLookupByRow( CSV.taunts.file, f4_local7, CSV.taunts.cols.releaseKillswitch ) == "1") then
			local f4_local10 = Engine.TableLookupByRow( CSV.taunts.file, f4_local7, CSV.taunts.cols.rigRef )
			local f4_local11 = f4_arg2.rigRef == f4_local10
			local f4_local12 = f4_local10 == "allRigs"
			local f4_local13
			if f4_arg2.rigRef == "archetype_scout" or f4_local10 ~= "allRigsButC6" then
				f4_local13 = false
			else
				f4_local13 = true
			end
			if f4_local11 or f4_local12 or f4_local13 then
				local f4_local14 = CSV.ReadRow( {
					file = CSV.taunts.file,
					cols = CSV.taunts.cols
				}, f4_local7 )
				f4_local14.isLocked = Cac.IsTauntLocked( f4_arg1, f4_local14.ref )
				local f4_local15 = Engine.TableLookupByRow( CSV.taunts.file, f4_local7, CSV.taunts.cols.hideUnlessUnlocked ) == "1"
				local f4_local16
				if f4_local14.isLocked then
					f4_local16 = not f4_local15
				else
					f4_local16 = true
				end
				if f4_local16 then
					if f4_local14.isLocked then
						f4_local14.quality = Cac.LowestQuality
					else
						f4_local14.quality = Cac.GetLootQualityFromFile( CSV.cosmeticEmotesLootMaster, f4_local14, f4_local14.ref )
					end
					f4_local14.isSelected = f4_local14.ref == f4_local4
					if f4_local14.isSelected then
						f4_local5 = #f4_local3
					end
					table.insert( f4_local3, f4_local14 )
				end
			end
		end
	end
	local f4_local7 = Cac.GetPreferencesForRig( f4_arg2.squadMemberDataSource.archetypePreferences, f4_arg2.rigRef, f4_arg1 )
	f4_arg0.ItemList:SetRefreshChild( function ( f5_arg0, f5_arg1, f5_arg2 )
		local f5_local0 = f4_local3[1 + f5_arg2]
		assert( f5_local0 )
		f5_arg0:SetData( {
			rigRef = f4_arg2.rigRef,
			writeTo = {
				f4_arg2.squadMemberDataSource.taunts[f4_arg2.tauntSlot],
				f4_local7.taunts[f4_arg2.tauntSlot]
			},
			tauntData = f5_local0
		} )
	end )
	f4_arg0.ItemList:SetNumRows( #f4_local3 )
	f4_arg0.ItemList:SetDefaultFocus( {
		x = 0,
		y = f4_local5
	} )
	f4_arg0:addEventHandler( "highlight_taunt", function ( f6_arg0, f6_arg1 )
		assert( f6_arg1.tauntData )
		f4_arg0._currentTauntData = f6_arg1.tauntData
		if f4_arg0._currentTauntData.isLocked then
			ACTIONS.AnimateSequence( f4_arg0.ShowcaseLock, "ShowCriteria" )
			f4_arg0:RemoveButtonHelperText( "button_alt2", "left" )
		else
			ACTIONS.AnimateSequence( f4_arg0.ShowcaseLock, "HideCriteria" )
			f4_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "PATCH_MENU_PREVIEW" ),
				button_ref = "button_alt2",
				side = "left",
				priority = 4,
				clickable = false
			} )
		end
		if f4_arg0._currentTauntData.quality then
			ACTIONS.AnimateSequence( f4_arg0.Details, "ShowQuality" )
		else
			ACTIONS.AnimateSequence( f4_arg0.Details, "HideQuality" )
		end
		f0_local2( f4_arg0 )
		return true
	end )
	f4_arg0.bindButton:addEventHandler( "button_secondary", function ( f7_arg0, f7_arg1 )
		ClientCharacter.PlayCharacterAnim( FrontEndScene.ClientCharacters.Customization, f4_local1, 0.1 )
		ClientCharacter.QueueCharacterAnim( FrontEndScene.ClientCharacters.Customization, Cac.GetRigFrontEndCustomizationIdleAnim( f4_arg2.rigRef ), nil, 0.1 )
	end )
	f4_arg0.bindButton:addEventHandler( "button_alt2", function ( f8_arg0, f8_arg1 )
		if not f4_arg0._currentTauntData then
			return 
		elseif not f4_arg0._currentTauntData.isLocked then
			f0_local1( f4_arg0._currentTauntData, f4_arg2.rigRef )
		end
	end )
	ClientCharacter.SetCharacterRotation( FrontEndScene.ClientCharacters.Customization, 0, 0, 0 )
end

function RigCustomizationActionSelection( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "RigCustomizationActionSelection"
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	self:playSound( "menu_open" )
	local f9_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f9_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f9_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_COMBAT_RIG_TAUNT" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( Engine.Localize( "LUA_MENU_CREATE_A_CLASS_CAPS" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 137 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ItemList = nil
	
	ItemList = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 15,
		controllerIndex = f9_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "RigEditActionButton", {
				controllerIndex = f9_local1
			} )
		end,
		refreshChild = function ( f11_arg0, f11_arg1, f11_arg2 )
			
		end,
		numRows = 15,
		numColumns = 1,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 30,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	ItemList.id = "ItemList"
	ItemList:setUseStencil( true )
	ItemList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 806 )
	self:addElement( ItemList )
	self.ItemList = ItemList
	
	local AppearanceScrollbar = nil
	
	AppearanceScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f9_local1
	} )
	AppearanceScrollbar.id = "AppearanceScrollbar"
	AppearanceScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 107, _1080p * 124, _1080p * 216.35, _1080p * 806.35 )
	self:addElement( AppearanceScrollbar )
	self.AppearanceScrollbar = AppearanceScrollbar
	
	local Details = nil
	
	Details = MenuBuilder.BuildRegisteredType( "RigCustomizationAppearenceDetails", {
		controllerIndex = f9_local1
	} )
	Details.id = "Details"
	Details:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -1149, _1080p * -199, _1080p * -277, _1080p * -137 )
	self:addElement( Details )
	self.Details = Details
	
	local ListAnchor = nil
	
	ListAnchor = LUI.UIImage.new()
	ListAnchor.id = "ListAnchor"
	ListAnchor:SetRGBFromInt( 6710886, 0 )
	ListAnchor:SetAlpha( 0.6, 0 )
	ListAnchor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 580, _1080p * 817.35, _1080p * 841.35 )
	self:addElement( ListAnchor )
	self.ListAnchor = ListAnchor
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f9_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 427.5, _1080p * 447.5, _1080p * 810.35, _1080p * 850.35 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f9_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.5, _1080p * 282.5, _1080p * 809.35, _1080p * 849.35 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 282.5, _1080p * 427.5, _1080p * 817.35, _1080p * 841.35 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f9_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local ShowcaseLock = nil
	
	ShowcaseLock = MenuBuilder.BuildRegisteredType( "ShowcaseLock", {
		controllerIndex = f9_local1
	} )
	ShowcaseLock.id = "ShowcaseLock"
	ShowcaseLock:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 96, _1080p * 608, _1080p * 249.98, _1080p * 761.98 )
	self:addElement( ShowcaseLock )
	self.ShowcaseLock = ShowcaseLock
	
	local f9_local14 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f9_local14 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f9_local1
		} )
		f9_local14.id = "CRMMain"
		f9_local14:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f9_local14 )
		self.CRMMain = f9_local14
	end
	local f9_local15 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = AppearanceScrollbar,
		startCap = AppearanceScrollbar.startCap,
		endCap = AppearanceScrollbar.endCap
	}
	local f9_local17 = AppearanceScrollbar.sliderArea
	if f9_local17 then
		f9_local17 = AppearanceScrollbar.sliderArea.slider
	end
	bindButton.slider = f9_local17
	f9_local17 = AppearanceScrollbar.sliderArea
	if f9_local17 then
		f9_local17 = AppearanceScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f9_local17
	ItemList:AddScrollbar( f9_local15( bindButton ) )
	ItemList:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f12_arg0, f12_arg1 )
		f12_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f12_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -1,
			clickable = true
		} )
		f12_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "PATCH_MENU_PREVIEW" ),
			button_ref = "button_alt2",
			side = "left",
			priority = 4
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f13_arg0, f13_arg1 )
		local f13_local0 = f13_arg1.controller or f9_local1
		ACTIONS.LeaveMenu( self )
		ACTIONS.UploadStats( self, f13_local0 )
	end )
	f0_local3( self, f9_local1, controller )
	if CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end
	return self
end

MenuBuilder.registerType( "RigCustomizationActionSelection", RigCustomizationActionSelection )
LUI.FlowManager.RegisterStackPopBehaviour( "RigCustomizationActionSelection", f0_local0 )
LockTable( _M )
