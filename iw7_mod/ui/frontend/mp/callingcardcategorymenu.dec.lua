local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.conquest.Headquarters.callingCard"
function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
end

function PostLoadFunc( f2_arg0, f2_arg1 )
	WipeGlobalModelsAtPath( f0_local0 )
	local f2_local0 = {}
	local f2_local1 = Engine.TableGetRowCount( CSV.callingCards.file ) - 1
	for f2_local2 = 0, f2_local1, 1 do
		local f2_local5 = Engine.TableLookupByRow( CSV.callingCards.file, f2_local2, CSV.callingCards.cols.index )
		local f2_local6 = CallingCardUtils.GetCardChallengeCategoryFromID( Engine.TableLookupByRow( CSV.callingCards.file, f2_local2, CSV.callingCards.cols.categoryID ), Engine.TableLookupByRow( CSV.callingCards.file, f2_local2, CSV.callingCards.cols.challenge ), f2_arg1 )
		if not f2_local0[f2_local6] then
			f2_local0[f2_local6] = {
				card = f2_local5,
				hasNew = false
			}
		end
		local f2_local7 = Engine.TableLookupByRow( CSV.callingCards.file, f2_local2, CSV.callingCards.cols.unlockID )
		if f2_local7 and f2_local7 ~= "" then
			local f2_local8 = Engine.TableLookupGetRowNum( CSV.callingCardUnlockTable.file, CSV.callingCardUnlockTable.cols.ref, f2_local7 )
			if f2_local8 ~= -1 and Rewards.IsNew( f2_arg1, "callingCard", f2_local8 ) then
				f2_local0[f2_local6].hasNew = true
			end
		end
	end
	for self, f2_local5 in pairs( f2_local0 ) do
		if not f2_local5.hasNew then
			f2_local5.hasNew = CallingCardUtils.HasNewLootCardsByCategory( f2_arg1, self )
		end
	end
	f2_local2 = {}
	for f2_local5, f2_local10 in pairs( f2_local0 ) do
		table.insert( f2_local2, f2_local10.card )
	end
	f2_local3 = {}
	for f2_local4 = 1, #f2_local2, 1 do
		local f2_local11 = f2_local2[f2_local4]
		local f2_local6 = CallingCardUtils.GetCardHideIfLocked( f2_local11 )
		local f2_local7 = CallingCardUtils.GetCardChallenge( f2_local11 )
		if f2_local6 and (f2_local7 == nil or #f2_local7 == 0) then
			local f2_local8 = CallingCardUtils.GetCardChallengeCategoryFromID( CallingCardUtils.GetCardCategoryID( f2_local11 ), CallingCardUtils.GetCardChallenge( f2_local11 ), f2_arg1 )
			local f2_local12 = {}
			for f2_local13 = 0, f2_local1, 1 do
				if CallingCardUtils.GetCardChallengeCategoryFromID( Engine.TableLookupByRow( CSV.callingCards.file, f2_local13, CSV.callingCards.cols.categoryID ), Engine.TableLookupByRow( CSV.callingCards.file, f2_local13, CSV.callingCards.cols.challenge ), f2_arg1 ) == f2_local8 then
					table.insert( f2_local12, CallingCardUtils.GetCardIDByRow( f2_local13 ) )
				end
			end
			local f2_local13 = false
			for f2_local14 = 1, #f2_local12, 1 do
				local f2_local17 = f2_local12[f2_local14]
				local f2_local18 = not CallingCardUtils.GetCardHideIfLocked( f2_local17 )
				if not f2_local18 then
					local f2_local19 = Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, f2_local17, CSV.callingCards.cols.unlockID )
					if f2_local19 and #f2_local19 > 0 then
						f2_local18 = Engine.IsUnlocked( f2_arg1, "callingCard", f2_local19, true )
					else
						local f2_local20 = Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, f2_local17, CSV.callingCards.cols.lootID )
						if f2_local20 ~= "" then
							f2_local18 = Loot.IsOwned( f2_arg1, tonumber( f2_local20 ) ) > 0
						end
					end
				end
				if f2_local18 then
					f2_local13 = true
					break
				end
			end
			if not f2_local13 then
				table.insert( f2_local3, f2_local11 )
			end
		end
	end
	for f2_local4 = 1, #f2_local3, 1 do
		for f2_local11 = #f2_local2, 1, -1 do
			if f2_local2[f2_local11] == f2_local3[f2_local4] then
				table.remove( f2_local2, f2_local11 )
			end
		end
	end
	table.sort( f2_local2, function ( f3_arg0, f3_arg1 )
		return tonumber( f3_arg0 ) < tonumber( f3_arg1 )
	end )
	f2_local4 = LUI.DataSourceFromList.new( #f2_local2 )
	f2_local4.MakeDataSourceAtIndex = function ( f4_arg0, f4_arg1, f4_arg2 )
		local f4_local0 = f0_local0 .. ".card" .. f4_arg1 + 1
		local f4_local1 = CallingCardUtils.GetCardTexture( f2_local2[f4_arg1 + 1] )
		local f4_local2 = Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, f2_local2[f4_arg1 + 1], CSV.callingCards.cols.categoryID )
		local f4_local3 = Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, f2_local2[f4_arg1 + 1], CSV.callingCards.cols.challenge )
		local f4_local4 = CallingCardUtils.GetCardChallengeCategoryStringFromID( f2_local2[f4_arg1 + 1], f4_local2, f4_local3, f4_arg2 )
		if CONDITIONS.IsThirdGameMode() then
			f4_local4 = ToUpperCase( f4_local4 )
		end
		local f4_local5 = CallingCardUtils.GetCardChallengeCategoryFromID
		local f4_local6 = f4_local2
		local f4_local7 = f4_local3
		return {
			category = LUI.DataSourceInGlobalModel.new( f4_local0 .. ".category", f4_local4 ),
			categoryID = LUI.DataSourceInGlobalModel.new( f4_local0 .. ".categoryID", f4_local2 ),
			challenge = LUI.DataSourceInGlobalModel.new( f4_local0 .. ".challenge", f4_local3 ),
			texture = LUI.DataSourceInGlobalModel.new( f4_local0 .. ".texture", f4_local1 ),
			hasNew = LUI.DataSourceInGlobalModel.new( f4_local0 .. ".hasNew", f2_local0[f4_local5( f4_local6, f4_local3, f4_arg2 )].hasNew )
		}
	end
	
	assert( f2_arg0.CardCategoriesList )
	f2_arg0.CardCategoriesList:SetGridDataSource( f2_local4, f2_arg1 )
	if not CONDITIONS.IsThirdGameMode() then
		f2_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ), 0 ) )
	end
	if Engine.IsCoreMode() then
		self = LUI.UIElement.new( {
			worldBlur = 5
		} )
		self:setupWorldBlur()
		self.id = "blur"
		f2_arg0:addElement( self )
	end
end

function CallingCardCategoryMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "CallingCardCategoryMenu"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	self:playSound( "menu_open" )
	local f5_local2 = self
	local CardCategoriesList = nil
	
	CardCategoriesList = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 15,
		controllerIndex = f5_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CardCategoryButton", {
				controllerIndex = f5_local1
			} )
		end,
		wrapX = true,
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
	CardCategoriesList.id = "CardCategoriesList"
	CardCategoriesList:setUseStencil( false )
	CardCategoriesList:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 130, _1080p * 630, _1080p * -324, _1080p * 266 )
	self:addElement( CardCategoriesList )
	self.CardCategoriesList = CardCategoriesList
	
	local ButtonHelperBar0 = nil
	
	ButtonHelperBar0 = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f5_local1
	} )
	ButtonHelperBar0.id = "ButtonHelperBar0"
	ButtonHelperBar0:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar0 )
	self.ButtonHelperBar0 = ButtonHelperBar0
	
	local f5_local5 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f5_local5 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f5_local1
		} )
		f5_local5.id = "MenuTitle"
		f5_local5.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_CALLING_CARD" ) ), 0 )
		f5_local5.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
		f5_local5.Icon:SetTop( _1080p * -28.5, 0 )
		f5_local5.Icon:SetBottom( _1080p * 61.5, 0 )
		f5_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f5_local5 )
		self.MenuTitle = f5_local5
	end
	local f5_local6 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f5_local6 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f5_local1
		} )
		f5_local6.id = "CPMenuTitle"
		f5_local6.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_CALLING_CARD" ) ), 0 )
		f5_local6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f5_local6 )
		self.CPMenuTitle = f5_local6
	end
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f5_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f5_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	self.addButtonHelperFunction = function ( f7_arg0, f7_arg1 )
		f7_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f7_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f8_arg0, f8_arg1 )
		local f8_local0 = f8_arg1.controller or f5_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f5_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "CallingCardCategoryMenu", CallingCardCategoryMenu )
LUI.FlowManager.RegisterStackPopBehaviour( "CallingCardCategoryMenu", PopFunc )
LockTable( _M )
