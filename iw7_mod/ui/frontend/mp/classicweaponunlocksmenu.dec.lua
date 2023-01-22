local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.classicWeapons"
f0_local1 = "frontEnd.MP.classicWeaponsList"
function PopFunc()
	WipeControllerModelsAtPath( f0_local0 )
	WipeControllerModelsAtPath( f0_local1 )
	ClientWeapon.SetWeaponVisible( 0, false )
	ClientWeapon.SetWeaponVisible( 1, false )
	ClientWeapon.SetWeaponVisible( 2, false )
	ClientWeapon.SetWeaponRotation( 0, 0, 0, 0 )
	ClientWeapon.SetWeaponRotation( 1, 0, 0, 0 )
	ClientWeapon.SetWeaponRotation( 2, 0, 0, 0 )
	Streaming.SetStreamingEnabled( false )
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = {}
	DataSources.frontEnd.MP.classicWeapons = {}
	f2_local0.classicWeaponTokenCount = LUI.DataSourceInControllerModel.new( f0_local0 .. ".classicWeaponTokenCount", Prestige.GetClassicWeaponUnlockTokenCount( f2_arg1 ) )
	local f2_local1 = LUI.DataSourceFromList.new( Engine.TableGetRowCount( CSV.classicWeapons.file ) )
	f2_local1.MakeDataSourceAtIndex = function ( f3_arg0, f3_arg1, f3_arg2 )
		local f3_local0 = CSV.ReadRow( CSV.classicWeapons, f3_arg1 )
		return {
			name = LUI.DataSourceInControllerModel.new( f0_local1 .. ".weapon" .. f3_arg1 .. ".name", Engine.Localize( f3_local0.name ) ),
			isUnlocked = LUI.DataSourceInControllerModel.new( f0_local1 .. ".weapon" .. f3_arg1 .. ".isUnlocked", Engine.IsUnlocked( f3_arg2, "weapon", f3_local0.weaponRef ) ),
			weaponRef = f3_local0.weaponRef,
			image = LUI.DataSourceInControllerModel.new( f0_local1 .. ".weapon" .. f3_arg1 .. ".image", Cac.GetWeaponImage( f3_local0.weaponRef ) ),
			desc = LUI.DataSourceInControllerModel.new( f0_local1 .. ".weapon" .. f3_arg1 .. ".desc", Cac.GetWeaponDesc( f3_local0.weaponRef ) )
		}
	end
	
	f2_local0.classicWeaponsList = f2_local1
	f2_arg0:SetDataSource( f2_local0, f2_arg1 )
	f2_arg0:SubscribeToModelThroughElement( f2_arg0.ButtonList, "name", function ()
		local f4_local0 = f2_arg0.ButtonList:GetDataSource()
		local f4_local1 = f4_local0.weaponRef
		local f4_local2 = Cac.GetCompleteWeaponModelName( f4_local1, f4_local1, Cac.LowestQuality, -1, nil )
		if f4_local0.isUnlocked:GetValue( f2_arg1 ) then
			f2_arg0.ClassicWeaponUnlockItemDetails.ItemCost:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_ALREADY_UNLOCKED" ) ), 0 )
			f2_arg0.ClassicWeaponUnlockItemDetails.TokenIcon:SetAlpha( 0 )
			f2_arg0.ClassicWeaponUnlockItemDetails.ItemCost:SetLeft( _1080p * 20 )
		else
			f2_arg0.ClassicWeaponUnlockItemDetails.ItemCost:setText( ToUpperCase( Engine.Localize( "PRESTIGE_CLASSIC_WEAPON_UNLOCKS_COST", 1 ) ) )
			f2_arg0.ClassicWeaponUnlockItemDetails.TokenIcon:SetAlpha( 1 )
			f2_arg0.ClassicWeaponUnlockItemDetails.ItemCost:SetLeft( _1080p * 75 )
		end
		Streaming.RequestWeaponViewModels( {
			f4_local2
		}, f2_arg1 )
		FrontEndScene.SetWeaponModel( 0, f4_local2, true )
		ClientWeapon.SetWeaponVisible( 0, true )
		ClientWeapon.SetWeaponRotation( 0, 0, 0, 0 )
		ClientWeapon.SetWeaponRotation( 1, 0, 0, 0 )
		ClientWeapon.SetWeaponRotation( 2, 0, 0, 0 )
	end )
	f2_arg0.ClassicWeaponUnlockTokens:processEvent( {
		name = "update_token_count",
		tokenType = "classic"
	} )
	local f2_local2 = function ( f5_arg0 )
		local f5_local0 = f2_arg0.ButtonList:GetDataSource()
		local f5_local1 = f5_local0.weaponRef
		ACTIONS.SpendClassicWeaponToken( f2_arg0.ButtonList, f5_arg0 )
	end
	
	f2_arg0.bindButton:addEventHandler( "button_primary", function ( f6_arg0, f6_arg1 )
		f2_local2( f6_arg1.controller or f2_arg1 )
	end )
	if Engine.IsPC() then
		f2_arg0:addEventHandler( "classic_weapon_select_alternate", function ( f7_arg0, f7_arg1 )
			f2_local2( f7_arg1.controller or f2_arg1 )
		end )
	end
	f2_arg0.ClassicWeaponUnlockTokens:SubscribeToModelThroughElement( f2_arg0, "classicWeaponTokenCount", function ()
		f2_arg0.ClassicWeaponUnlockTokens:processEvent( {
			name = "update_token_count",
			tokenType = "classic"
		} )
	end )
	Streaming.SetStreamingEnabled( true )
	ClientWeapon.SetWeaponRotation( 0, 0, 0, 0 )
	ClientWeapon.SetWeaponRotation( 1, 0, 0, 0 )
	ClientWeapon.SetWeaponRotation( 2, 0, 0, 0 )
	FrontEndScene.SetScene( "weapon_select" )
end

function ClassicWeaponUnlocksMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "ClassicWeaponUnlocksMenu"
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	self:playSound( "menu_open" )
	local f9_local2 = self
	local ButtonList = nil
	
	ButtonList = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		controllerIndex = f9_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ClassicWeaponUnlockButton", {
				controllerIndex = f9_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 250,
		rowHeight = _1080p * 140,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	ButtonList.id = "ButtonList"
	ButtonList:setUseStencil( true )
	ButtonList:SetGridDataSourceThroughElement( self, "classicWeaponsList" )
	ButtonList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 147, _1080p * 397, _1080p * 216, _1080p * 940 )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f9_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local TokenCount = nil
	
	TokenCount = LUI.UIText.new()
	TokenCount.id = "TokenCount"
	TokenCount:SetFontSize( 45 * _1080p )
	TokenCount:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	TokenCount:SetAlignment( LUI.Alignment.Left )
	TokenCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1067.93, _1080p * 1567.93, _1080p * 241.67, _1080p * 286.67 )
	TokenCount:SubscribeToModelThroughElement( self, "classicWeaponTokenCount", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.classicWeaponTokenCount:GetValue( f9_local1 )
		if f11_local0 ~= nil then
			TokenCount:setText( f11_local0, 0 )
		end
	end )
	self:addElement( TokenCount )
	self.TokenCount = TokenCount
	
	local BaseWeaponsScrollbar = nil
	
	BaseWeaponsScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f9_local1
	} )
	BaseWeaponsScrollbar.id = "BaseWeaponsScrollbar"
	BaseWeaponsScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 147, _1080p * 216, _1080p * 906 )
	self:addElement( BaseWeaponsScrollbar )
	self.BaseWeaponsScrollbar = BaseWeaponsScrollbar
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f9_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 100, _1080p * 600, _1080p * -60, _1080p * -15 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f9_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MP_FRONTEND_ONLY_CLASSIC_WEAPONS" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BARRACKS_CAPS" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1096, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f9_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 344.5, _1080p * 364.5, _1080p * 932, _1080p * 972 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f9_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 179.5, _1080p * 199.5, _1080p * 932, _1080p * 972 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 199.5, _1080p * 344.5, _1080p * 940, _1080p * 964 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local ClassicWeaponUnlockItemDetails = nil
	
	ClassicWeaponUnlockItemDetails = MenuBuilder.BuildRegisteredType( "PermanentUnlockItemDetails", {
		controllerIndex = f9_local1
	} )
	ClassicWeaponUnlockItemDetails.id = "ClassicWeaponUnlockItemDetails"
	ClassicWeaponUnlockItemDetails.ItemDescription:SetRight( _1080p * 620, 0 )
	ClassicWeaponUnlockItemDetails.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ClassicWeaponUnlockItemDetails.TokenIcon:setImage( RegisterMaterial( "icon_prestige_classic" ), 0 )
	ClassicWeaponUnlockItemDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 413, _1080p * 1920, _1080p * 216, _1080p * 316 )
	ClassicWeaponUnlockItemDetails:SubscribeToModelThroughElement( ButtonList, "desc", function ()
		local f12_local0 = ButtonList:GetDataSource()
		f12_local0 = f12_local0.desc:GetValue( f9_local1 )
		if f12_local0 ~= nil then
			ClassicWeaponUnlockItemDetails.ItemDescription:setText( LocalizeLongString( f12_local0 ), 0 )
		end
	end )
	ClassicWeaponUnlockItemDetails:SubscribeToModelThroughElement( ButtonList, "name", function ()
		local f13_local0 = ButtonList:GetDataSource()
		f13_local0 = f13_local0.name:GetValue( f9_local1 )
		if f13_local0 ~= nil then
			ClassicWeaponUnlockItemDetails.ItemName:setText( f13_local0, 0 )
		end
	end )
	self:addElement( ClassicWeaponUnlockItemDetails )
	self.ClassicWeaponUnlockItemDetails = ClassicWeaponUnlockItemDetails
	
	local ClassicWeaponUnlockTokens = nil
	
	ClassicWeaponUnlockTokens = MenuBuilder.BuildRegisteredType( "PermanentUnlockTokens", {
		controllerIndex = f9_local1
	} )
	ClassicWeaponUnlockTokens.id = "ClassicWeaponUnlockTokens"
	ClassicWeaponUnlockTokens.Image:setImage( RegisterMaterial( "icon_prestige_classic" ), 0 )
	ClassicWeaponUnlockTokens:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1170, _1080p * 1920, _1080p * 71.5, _1080p * 116.5 )
	self:addElement( ClassicWeaponUnlockTokens )
	self.ClassicWeaponUnlockTokens = ClassicWeaponUnlockTokens
	
	local WeaponRotator = nil
	
	WeaponRotator = MenuBuilder.BuildRegisteredType( "WeaponRotator", {
		controllerIndex = f9_local1
	} )
	WeaponRotator.id = "WeaponRotator"
	WeaponRotator:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 413, 0, _1080p * 316, _1080p * 932 )
	self:addElement( WeaponRotator )
	self.WeaponRotator = WeaponRotator
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f9_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f9_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	local f9_local17 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = BaseWeaponsScrollbar,
		startCap = BaseWeaponsScrollbar.startCap,
		endCap = BaseWeaponsScrollbar.endCap
	}
	local f9_local19 = BaseWeaponsScrollbar.sliderArea
	if f9_local19 then
		f9_local19 = BaseWeaponsScrollbar.sliderArea.slider
	end
	bindButton.slider = f9_local19
	f9_local19 = BaseWeaponsScrollbar.sliderArea
	if f9_local19 then
		f9_local19 = BaseWeaponsScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f9_local19
	ButtonList:AddScrollbar( f9_local17( bindButton ) )
	ButtonList:AddArrow( ArrowUp )
	ButtonList:AddArrow( ArrowDown )
	ButtonList:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f14_arg0, f14_arg1 )
		f14_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f9_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f9_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "ClassicWeaponUnlocksMenu", ClassicWeaponUnlocksMenu )
LUI.FlowManager.RegisterStackPopBehaviour( "ClassicWeaponUnlocksMenu", PopFunc )
LockTable( _M )
