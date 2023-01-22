local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.rigPackages"
f0_local1 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local2 = function ( f2_arg0, f2_arg1, f2_arg2 )
	WipeGlobalModelsAtPath( f0_local0 .. ".rigPackage" )
	f2_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "PRESTIGE_RIG_PACKAGES" ), 0 ) )
	local f2_local0 = {}
	local f2_local1 = Engine.TableGetRowCount( CSV.battleRigs.file )
	for f2_local2 = 0, f2_local1 - 1, 1 do
		local f2_local5 = CSV.ReadRow( CSV.battleRigs, f2_local2 )
		f2_local0[#f2_local0 + 1] = {
			name = Engine.Localize( f2_local5.name ),
			ref = f2_local5.ref
		}
	end
	local f2_local2 = LUI.DataSourceFromList.new( #f2_local0 )
	f2_local2.MakeDataSourceAtIndex = function ( f3_arg0, f3_arg1, f3_arg2 )
		return {
			name = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".tabName." .. f3_arg1, f2_local0[f3_arg1 + 1].name ),
			focusFunction = function ()
				WipeGlobalModelsAtPath( f0_local0 .. ".rigPackage" )
				local f4_local0 = {}
				for f4_local1 = 0, Engine.TableGetRowCount( CSV.rigPackages.file ) - 1, 1 do
					local f4_local4 = CSV.ReadRow( CSV.rigPackages, f4_local1 )
					if f4_local4.archetype == f2_local0[f3_arg1 + 1].ref then
						table.insert( f4_local0, f4_local4 )
					end
				end
				local f4_local1 = LUI.DataSourceFromList.new( #f4_local0 )
				f4_local1.MakeDataSourceAtIndex = function ( f5_arg0, f5_arg1 )
					local f5_local0 = f0_local0 .. ".rigPackage." .. f5_arg1 + 1
					local f5_local1 = f4_local0[f5_arg1 + 1]
					local f5_local2 = Cac.GetRigPackageTrait( f5_local1.ref )
					local f5_local3 = Cac.GetRigTraitItemCardData( f5_local2 )
					local f5_local4 = Cac.GetRigPackageSuper( f5_local1.ref )
					local f5_local5 = Cac.GetRigSuperItemCardData( f5_local4 )
					return {
						ref = LUI.DataSourceInGlobalModel.new( f5_local0 .. ".ref", f5_local1.ref ),
						name = LUI.DataSourceInGlobalModel.new( f5_local0 .. ".name", f5_local1.name ),
						desc = LUI.DataSourceInGlobalModel.new( f5_local0 .. ".desc", f5_local1.desc ),
						traitRef = LUI.DataSourceInGlobalModel.new( f5_local0 .. ".traitRef", f5_local2 ),
						traitImage = LUI.DataSourceInGlobalModel.new( f5_local0 .. ".traitImage", f5_local3.image ),
						traitName = LUI.DataSourceInGlobalModel.new( f5_local0 .. ".traitName", f5_local3.name ),
						traitDesc = LUI.DataSourceInGlobalModel.new( f5_local0 .. ".traitDesc", f5_local3.desc ),
						superRef = LUI.DataSourceInGlobalModel.new( f5_local0 .. ".superRef", f5_local4 ),
						superImage = LUI.DataSourceInGlobalModel.new( f5_local0 .. ".superImage", f5_local5.image ),
						superName = LUI.DataSourceInGlobalModel.new( f5_local0 .. ".superName", f5_local5.name ),
						superDesc = LUI.DataSourceInGlobalModel.new( f5_local0 .. ".superDesc", f5_local5.desc )
					}
				end
				
				f4_local1.GetDefaultFocusIndex = function ()
					return 0
				end
				
				f2_arg0:SetDataSource( f4_local1, f3_arg2 )
			end
			
		}
	end
	
	f2_arg0.Tabs.Tabs:SetTabManagerDataSource( f2_local2, f2_arg1 )
	f2_arg0:SubscribeToModelThroughElement( f2_arg0.RigPackages, "name", function ()
		local f7_local0 = f2_arg0.RigPackages:GetDataSource()
		f7_local0 = f7_local0.ref:GetValue( f2_arg1 )
		if f7_local0 ~= nil then
			local f7_local1 = Cac.GetRigPackageUnlockRank( f7_local0 )
			local f7_local2 = Prestige.IsItemUnlocked( f2_arg1, f7_local0, "rigPackage" )
			if not f7_local2 then
				f7_local2 = tonumber( f7_local1 ) == 0
			end
			if f7_local2 then
				f2_arg0.PermanentUnlockItemDetails.ItemCost:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_ALREADY_UNLOCKED" ) ), 0 )
				ACTIONS.AnimateSequence( f2_arg0.PermanentUnlockItemDetails, "HideUnlockInfo" )
				f2_arg0.PermanentUnlockItemDetails.TokenIcon:SetAlpha( 0 )
				f2_arg0.PermanentUnlockItemDetails.ItemCost:SetLeft( _1080p * 20 )
			else
				f2_arg0.PermanentUnlockItemDetails.ItemCost:setText( ToUpperCase( Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS_COST", 1 ) ) )
				ACTIONS.AnimateSequence( f2_arg0.PermanentUnlockItemDetails, "ShowUnlockInfo" )
				f2_arg0.PermanentUnlockItemDetails.PermanentUnlockItemUnlockInfo.UnlockDesc:setText( ToUpperCase( Engine.Localize( "PRESTIGE_UNLOCKS_AT", Rank.GetRankDisplay( f7_local1 ) ) ) )
				f2_arg0.PermanentUnlockItemDetails.TokenIcon:SetAlpha( 1 )
				f2_arg0.PermanentUnlockItemDetails.ItemCost:SetLeft( _1080p * 75 )
			end
		end
	end )
	local f2_local4 = function ( f8_arg0 )
		local f8_local0 = f2_arg0.RigPackages:GetDataSource()
		local f8_local1 = f8_local0.ref:GetValue( f8_arg0 )
		Prestige.PermanentUnlockTokenSpendAction( f8_arg0, f8_local1, f8_local0.name:GetValue( f8_arg0 ), "rigPackage", Cac.GetRigPackageUnlockRank( f8_local1 ), function ()
			Prestige.UsePermanentUnlockToken( f2_arg1, f8_local1, "rigPackage" )
			f2_arg0.PermanentUnlockTokens:processEvent( {
				name = "update_token_count"
			} )
		end )
	end
	
	f2_arg0.bindButton:addEventHandler( "button_primary", function ( f10_arg0, f10_arg1 )
		f2_local4( f10_arg1.controller or f2_arg1 )
	end )
	if Engine.IsPC() then
		f2_arg0:addEventHandler( "rig_select_alternate", function ( f11_arg0, f11_arg1 )
			f2_local4( f11_arg1.controller or f2_arg1 )
		end )
	end
	if CONDITIONS.IsMultiplayer( f2_arg0 ) then
		local self = LUI.UIElement.new( {
			worldBlur = 5
		} )
		self:setupWorldBlur()
		self.id = "blur"
		f2_arg0:addElement( self )
	end
end

function RigsPermanentUnlocks( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "RigsPermanentUnlocks"
	self._animationSets = {}
	self._sequences = {}
	local f12_local1 = controller and controller.controllerIndex
	if not f12_local1 and not Engine.InFrontend() then
		f12_local1 = self:getRootController()
	end
	assert( f12_local1 )
	self:playSound( "menu_open" )
	local f12_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f12_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local Tabs = nil
	
	Tabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f12_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 185 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local RigPackages = nil
	
	RigPackages = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 3,
		controllerIndex = f12_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "RigPackageButton", {
				controllerIndex = f12_local1
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
	RigPackages.id = "RigPackages"
	RigPackages:setUseStencil( true )
	RigPackages:SetGridDataSourceThroughElement( self, nil )
	RigPackages:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 326 )
	self:addElement( RigPackages )
	self.RigPackages = RigPackages
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f12_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 100, _1080p * 600, _1080p * -60, _1080p * -15 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local PermanentUnlockTokens = nil
	
	PermanentUnlockTokens = MenuBuilder.BuildRegisteredType( "PermanentUnlockTokens", {
		controllerIndex = f12_local1
	} )
	PermanentUnlockTokens.id = "PermanentUnlockTokens"
	PermanentUnlockTokens:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1170, _1080p * 1920, _1080p * 71.5, _1080p * 116.5 )
	self:addElement( PermanentUnlockTokens )
	self.PermanentUnlockTokens = PermanentUnlockTokens
	
	local LoadoutBlur = nil
	
	LoadoutBlur = LUI.UIBlur.new()
	LoadoutBlur.id = "LoadoutBlur"
	LoadoutBlur:SetRGBFromTable( SWATCHES.CAC.defaultItemHeader, 0 )
	LoadoutBlur:SetBlendMode( BLEND_MODE.blend )
	LoadoutBlur:SetBlurStrength( 2.75, 0 )
	LoadoutBlur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 917, _1080p * 1693, _1080p * 463, _1080p * 828 )
	self:addElement( LoadoutBlur )
	self.LoadoutBlur = LoadoutBlur
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f12_local1
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
		controllerIndex = f12_local1
	} )
	PermanentUnlockItemDetails.id = "PermanentUnlockItemDetails"
	PermanentUnlockItemDetails.ItemDescription:SetRight( _1080p * 620, 0 )
	PermanentUnlockItemDetails.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PermanentUnlockItemDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 630, _1080p * 1920, _1080p * 216, _1080p * 316 )
	PermanentUnlockItemDetails:SubscribeToModelThroughElement( RigPackages, "desc", function ()
		local f14_local0 = RigPackages:GetDataSource()
		f14_local0 = f14_local0.desc:GetValue( f12_local1 )
		if f14_local0 ~= nil then
			PermanentUnlockItemDetails.ItemDescription:setText( LocalizeString( f14_local0 ), 0 )
		end
	end )
	PermanentUnlockItemDetails:SubscribeToModelThroughElement( RigPackages, "name", function ()
		local f15_local0 = RigPackages:GetDataSource()
		f15_local0 = f15_local0.name:GetValue( f12_local1 )
		if f15_local0 ~= nil then
			PermanentUnlockItemDetails.ItemName:setText( LocalizeString( f15_local0 ), 0 )
		end
	end )
	self:addElement( PermanentUnlockItemDetails )
	self.PermanentUnlockItemDetails = PermanentUnlockItemDetails
	
	local RigPackageSuper = nil
	
	RigPackageSuper = MenuBuilder.BuildRegisteredType( "RigPackageItemDetails", {
		controllerIndex = f12_local1
	} )
	RigPackageSuper.id = "RigPackageSuper"
	RigPackageSuper.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_SELECT_SUPER" ) ), 0 )
	RigPackageSuper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 927, _1080p * 1693, _1080p * 471, _1080p * 614 )
	RigPackageSuper:SubscribeToModelThroughElement( RigPackages, "superName", function ()
		local f16_local0 = RigPackages:GetDataSource()
		f16_local0 = f16_local0.superName:GetValue( f12_local1 )
		if f16_local0 ~= nil then
			RigPackageSuper.Name:setText( ToUpperCase( f16_local0 ), 0 )
		end
	end )
	RigPackageSuper:SubscribeToModelThroughElement( RigPackages, "superDesc", function ()
		local f17_local0 = RigPackages:GetDataSource()
		f17_local0 = f17_local0.superDesc:GetValue( f12_local1 )
		if f17_local0 ~= nil then
			RigPackageSuper.Desc:setText( f17_local0, 0 )
		end
	end )
	RigPackageSuper:SubscribeToModelThroughElement( RigPackages, "superImage", function ()
		local f18_local0 = RigPackages:GetDataSource()
		f18_local0 = f18_local0.superImage:GetValue( f12_local1 )
		if f18_local0 ~= nil then
			RigPackageSuper.Image:setImage( RegisterMaterial( f18_local0 ), 0 )
		end
	end )
	self:addElement( RigPackageSuper )
	self.RigPackageSuper = RigPackageSuper
	
	local RigPackageTrait = nil
	
	RigPackageTrait = MenuBuilder.BuildRegisteredType( "RigPackageItemDetails", {
		controllerIndex = f12_local1
	} )
	RigPackageTrait.id = "RigPackageTrait"
	RigPackageTrait.Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_SELECT_TRAIT" ) ), 0 )
	RigPackageTrait:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 927, _1080p * 1693, _1080p * 677, _1080p * 820 )
	RigPackageTrait:SubscribeToModelThroughElement( RigPackages, "traitName", function ()
		local f19_local0 = RigPackages:GetDataSource()
		f19_local0 = f19_local0.traitName:GetValue( f12_local1 )
		if f19_local0 ~= nil then
			RigPackageTrait.Name:setText( ToUpperCase( f19_local0 ), 0 )
		end
	end )
	RigPackageTrait:SubscribeToModelThroughElement( RigPackages, "traitDesc", function ()
		local f20_local0 = RigPackages:GetDataSource()
		f20_local0 = f20_local0.traitDesc:GetValue( f12_local1 )
		if f20_local0 ~= nil then
			RigPackageTrait.Desc:setText( f20_local0, 0 )
		end
	end )
	RigPackageTrait:SubscribeToModelThroughElement( RigPackages, "traitImage", function ()
		local f21_local0 = RigPackages:GetDataSource()
		f21_local0 = f21_local0.traitImage:GetValue( f12_local1 )
		if f21_local0 ~= nil then
			RigPackageTrait.Image:setImage( RegisterMaterial( f21_local0 ), 0 )
		end
	end )
	self:addElement( RigPackageTrait )
	self.RigPackageTrait = RigPackageTrait
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f12_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f12_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LoadoutBlur:RegisterAnimationSequence( "UpdatePackage", {
			{
				function ()
					return self.LoadoutBlur:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LoadoutBlur:SetAlpha( 1, 200, LUI.EASING.inSine )
				end
			},
			{
				function ()
					return self.LoadoutBlur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 975, _1080p * 1751, _1080p * 463, _1080p * 828, 0 )
				end,
				function ()
					return self.LoadoutBlur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 917, _1080p * 1693, _1080p * 463, _1080p * 828, 200, LUI.EASING.inSine )
				end
			}
		} )
		RigPackageSuper:RegisterAnimationSequence( "UpdatePackage", {
			{
				function ()
					return self.RigPackageSuper:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RigPackageSuper:SetAlpha( 1, 200, LUI.EASING.inSine )
				end
			},
			{
				function ()
					return self.RigPackageSuper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 985, _1080p * 1751, _1080p * 468.5, _1080p * 611.5, 0 )
				end,
				function ()
					return self.RigPackageSuper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 927, _1080p * 1693, _1080p * 468.5, _1080p * 611.5, 200, LUI.EASING.inSine )
				end
			}
		} )
		RigPackageTrait:RegisterAnimationSequence( "UpdatePackage", {
			{
				function ()
					return self.RigPackageTrait:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RigPackageTrait:SetAlpha( 1, 200, LUI.EASING.inSine )
				end
			},
			{
				function ()
					return self.RigPackageTrait:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 985, _1080p * 1751, _1080p * 677, _1080p * 820, 0 )
				end,
				function ()
					return self.RigPackageTrait:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 927, _1080p * 1693, _1080p * 677, _1080p * 820, 200, LUI.EASING.inSine )
				end
			}
		} )
		self._sequences.UpdatePackage = function ()
			LoadoutBlur:AnimateSequence( "UpdatePackage" )
			RigPackageSuper:AnimateSequence( "UpdatePackage" )
			RigPackageTrait:AnimateSequence( "UpdatePackage" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f37_arg0, f37_arg1 )
		f37_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f37_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f38_arg0, f38_arg1 )
		local f38_local0 = f38_arg1.controller or f12_local1
		ACTIONS.LeaveMenu( self )
	end )
	self:SubscribeToModelThroughElement( RigPackages, "name", function ()
		ACTIONS.AnimateSequence( self, "UpdatePackage" )
	end )
	f0_local2( self, f12_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "RigsPermanentUnlocks", RigsPermanentUnlocks )
LUI.FlowManager.RegisterStackPopBehaviour( "RigsPermanentUnlocks", f0_local1 )
LockTable( _M )
