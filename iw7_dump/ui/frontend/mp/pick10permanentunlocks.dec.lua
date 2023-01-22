local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.prestigeMenu.pick10Items"
f0_local1 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local2 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "PRESTIGE_CATEGORY_PICK10" ), 0 ) )
	local f2_local0 = LUI.DataSourceFromList.new( Engine.TableGetRowCount( CSV.pick10Slots.file ) )
	f2_local0.MakeDataSourceAtIndex = function ( f3_arg0, f3_arg1, f3_arg2 )
		local f3_local0 = CSV.ReadRow( CSV.pick10Slots, f3_arg1 )
		return {
			ref = LUI.DataSourceInGlobalModel.new( f0_local0 .. "." .. f3_arg1 .. ".ref", f3_local0.ref ),
			permUnlockRef = LUI.DataSourceInGlobalModel.new( f0_local0 .. "." .. f3_arg1 .. ".permUnlockRef", f3_local0.permUnlockRef ),
			name = LUI.DataSourceInGlobalModel.new( f0_local0 .. "." .. f3_arg1 .. ".name", f3_local0.permUnlockName ),
			desc = LUI.DataSourceInGlobalModel.new( f0_local0 .. "." .. f3_arg1 .. ".desc", f3_local0.desc )
		}
	end
	
	f2_arg0:SetDataSource( f2_local0, f2_arg1 )
	if CONDITIONS.IsMultiplayer( f2_arg0 ) then
		local self = LUI.UIElement.new( {
			worldBlur = 5
		} )
		self:setupWorldBlur()
		self.id = "blur"
		f2_arg0:addElement( self )
	end
end

function Pick10PermanentUnlocks( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "Pick10PermanentUnlocks"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	self:playSound( "menu_open" )
	local f4_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f4_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local Pick10ItemsList = nil
	
	Pick10ItemsList = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 11,
		controllerIndex = f4_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "Pick10PermanentUnlockButton", {
				controllerIndex = f4_local1
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
	Pick10ItemsList.id = "Pick10ItemsList"
	Pick10ItemsList:setUseStencil( true )
	Pick10ItemsList:SetGridDataSourceThroughElement( self, nil )
	Pick10ItemsList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 646 )
	self:addElement( Pick10ItemsList )
	self.Pick10ItemsList = Pick10ItemsList
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f4_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 100, _1080p * 600, _1080p * -60, _1080p * -15 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local PermanentUnlockTokens = nil
	
	PermanentUnlockTokens = MenuBuilder.BuildRegisteredType( "PermanentUnlockTokens", {
		controllerIndex = f4_local1
	} )
	PermanentUnlockTokens.id = "PermanentUnlockTokens"
	PermanentUnlockTokens:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1170, _1080p * 1920, _1080p * 71.5, _1080p * 116.5 )
	self:addElement( PermanentUnlockTokens )
	self.PermanentUnlockTokens = PermanentUnlockTokens
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f4_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "PRESTIGE_RIG_PACKAGES" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local PermanentUnlockItemDetails = nil
	
	PermanentUnlockItemDetails = MenuBuilder.BuildRegisteredType( "PermanentUnlockItemDetails", {
		controllerIndex = f4_local1
	} )
	PermanentUnlockItemDetails.id = "PermanentUnlockItemDetails"
	PermanentUnlockItemDetails.ItemDescription:SetRight( _1080p * 620, 0 )
	PermanentUnlockItemDetails.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PermanentUnlockItemDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 630, _1080p * 1920, _1080p * 216, _1080p * 316 )
	PermanentUnlockItemDetails:SubscribeToModelThroughElement( Pick10ItemsList, "desc", function ()
		local f6_local0 = Pick10ItemsList:GetDataSource()
		f6_local0 = f6_local0.desc:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			PermanentUnlockItemDetails.ItemDescription:setText( LocalizeString( f6_local0 ), 0 )
		end
	end )
	PermanentUnlockItemDetails:SubscribeToModelThroughElement( Pick10ItemsList, "name", function ()
		local f7_local0 = Pick10ItemsList:GetDataSource()
		f7_local0 = f7_local0.name:GetValue( f4_local1 )
		if f7_local0 ~= nil then
			PermanentUnlockItemDetails.ItemName:setText( LocalizeString( f7_local0 ), 0 )
		end
	end )
	self:addElement( PermanentUnlockItemDetails )
	self.PermanentUnlockItemDetails = PermanentUnlockItemDetails
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f4_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f4_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	self.addButtonHelperFunction = function ( f8_arg0, f8_arg1 )
		f8_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f8_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f4_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local2( self, f4_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "Pick10PermanentUnlocks", Pick10PermanentUnlocks )
LUI.FlowManager.RegisterStackPopBehaviour( "Pick10PermanentUnlocks", f0_local1 )
LockTable( _M )
