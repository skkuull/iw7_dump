local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.prestigeMenu.streakSelect"
f0_local1 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local2 = function ( f2_arg0 )
	return function ( f3_arg0, f3_arg1, f3_arg2 )
		assert( f3_arg1.name )
		assert( f3_arg1.image )
		assert( f3_arg1.fullImage )
		local f3_local0 = f3_arg1.ref:GetValue( f3_arg2 )
		local f3_local1 = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".streak." .. f3_local0 .. ".variant" )
		local f3_local2 = {}
		local f3_local3 = {}
		local f3_local4 = f0_local0 .. ".loot." .. f3_local0 .. "."
		f3_local2[1] = {
			streak = {
				ref = f3_arg1.ref,
				name = f3_arg1.name,
				image = f3_arg1.smallImage,
				desc = f3_arg1.desc,
				fullImage = f3_arg1.fullImage,
				quip = LUI.DataSourceInGlobalModel.new( f3_local4 .. "quip", "" ),
				quality = LUI.DataSourceInGlobalModel.new( f3_local4 .. "quality", Cac.LowestQuality ),
				qualityColor = LUI.DataSourceInGlobalModel.new( f3_local4 .. "qualityColor", Cac.GetLootQualityColor( Cac.BaseLootID ) ),
				qualityString = LUI.DataSourceInGlobalModel.new( f3_local4 .. "qualityString", Cac.GetLootQualityString( Cac.BaseLootID ) ),
				qualityImage = LUI.DataSourceInGlobalModel.new( f3_local4 .. "qualityImage", Cac.GetLootQualityImage( Cac.BaseLootID ) ),
				baseStreakRef = LUI.DataSourceInGlobalModel.new( f3_local4 .. "baseStreakRef", f3_local0 ),
				lootID = LUI.DataSourceInGlobalModel.new( f3_local4 .. "lootID", Cac.BaseLootID ),
				isUnlocked = isUnlockedDataSource
			}
		}
		f3_local3[Cac.BaseLootID] = f3_local2[1].streak
		local f3_local5 = LUI.DataSourceFromList.new( #f3_local2 )
		f3_local5.GetDataSourceAtIndex = function ( f4_arg0, f4_arg1 )
			return f3_local2[f4_arg1 + 1]
		end
		
		f3_local5.GetDefaultFocusIndex = function ()
			return 0
		end
		
		return {
			variants = f3_local5,
			streak = f3_local3[Cac.BaseLootID],
			ref = f3_arg1.ref,
			name = f3_arg1.name,
			image = f3_arg1.image
		}
	end
	
end

function PostLoadFunc( f6_arg0, f6_arg1, f6_arg2 )
	assert( f6_arg2 )
	FrontEndScene.SetScene( "loadout_select" )
	f6_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_SCORESTREAKS" ) ) )
	f6_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS" ), 0 ) )
	local f6_local0 = DataSources.frontEnd.MP.CAC.streaks:Decorate( f0_local2( f6_arg0 ) )
	f6_local0:SetCachingEnabled( true )
	f6_local0.GetDefaultFocusIndex = function ()
		return 0
	end
	
	f6_arg0:SetDataSource( {
		streakSelectContent = f6_local0
	}, f6_arg1 )
	f6_arg0:SubscribeToModelThroughElement( f6_arg0.BaseStreaks, "ref", function ()
		local f8_local0 = f6_arg0.BaseStreaks:GetDataSource()
		local f8_local1 = f8_local0.ref:GetValue( f6_arg1 )
		local f8_local2 = Cac.GetStreakUnlockRank( f8_local1 )
		local f8_local3 = Prestige.IsItemUnlocked( f6_arg1, f8_local1, "killstreak" )
		if not f8_local3 then
			f8_local3 = tonumber( f8_local2 ) == 0
		end
		if f8_local3 then
			f6_arg0.PermanentUnlockItemDetails.ItemCost:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_ALREADY_UNLOCKED" ) ), 0 )
			ACTIONS.AnimateSequence( f6_arg0.PermanentUnlockItemDetails, "HideUnlockInfo" )
			f6_arg0.PermanentUnlockItemDetails.TokenIcon:SetAlpha( 0 )
			f6_arg0.PermanentUnlockItemDetails.ItemCost:SetLeft( _1080p * 20 )
		else
			f6_arg0.PermanentUnlockItemDetails.ItemCost:setText( ToUpperCase( Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS_COST", 1 ) ) )
			ACTIONS.AnimateSequence( f6_arg0.PermanentUnlockItemDetails, "ShowUnlockInfo" )
			f6_arg0.PermanentUnlockItemDetails.PermanentUnlockItemUnlockInfo.UnlockDesc:setText( ToUpperCase( Engine.Localize( "PRESTIGE_UNLOCKS_AT", Rank.GetRankDisplay( f8_local2 ) ) ) )
			f6_arg0.PermanentUnlockItemDetails.TokenIcon:SetAlpha( 1 )
			f6_arg0.PermanentUnlockItemDetails.ItemCost:SetLeft( _1080p * 75 )
		end
	end )
	f6_arg0.bindButton:addEventHandler( "button_secondary", function ( f9_arg0, f9_arg1 )
		ACTIONS.LeaveMenu( f6_arg0 )
		return true
	end )
	local f6_local1 = function ( f10_arg0 )
		local f10_local0 = f6_arg0.BaseStreaks:GetDataSource()
		local f10_local1 = f10_local0.ref:GetValue( f10_arg0 )
		Prestige.PermanentUnlockTokenSpendAction( f10_arg0, f10_local1, Cac.GetStreakName( f10_local1 ), "killstreak", Cac.GetStreakUnlockRank( f10_local1 ), function ()
			Prestige.UsePermanentUnlockToken( f6_arg1, f10_local1, "killstreak" )
			f6_arg0.PermanentUnlockTokens:processEvent( {
				name = "update_token_count"
			} )
		end )
	end
	
	f6_arg0.bindButton:addEventHandler( "button_primary", function ( f12_arg0, f12_arg1 )
		f6_local1( f12_arg1.controller or f6_arg1 )
	end )
	if Engine.IsPC() then
		f6_arg0:addEventHandler( "streak_select_alternate", function ( f13_arg0, f13_arg1 )
			f6_local1( f13_arg1.controller or f6_arg1 )
		end )
	end
end

function ScorestreaksPermanentUnlocks( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "ScorestreaksPermanentUnlocks"
	self._animationSets = {}
	self._sequences = {}
	local f14_local1 = controller and controller.controllerIndex
	if not f14_local1 and not Engine.InFrontend() then
		f14_local1 = self:getRootController()
	end
	assert( f14_local1 )
	self:playSound( "menu_open" )
	local f14_local2 = self
	local BaseStreaks = nil
	
	BaseStreaks = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 4,
		maxVisibleRows = 4,
		controllerIndex = f14_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "PermanentUnlockBaseStreak", {
				controllerIndex = f14_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 150,
		rowHeight = _1080p * 150,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	BaseStreaks.id = "BaseStreaks"
	BaseStreaks:setUseStencil( false )
	BaseStreaks:SetGridDataSourceThroughElement( self, "streakSelectContent" )
	BaseStreaks:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 748, _1080p * 216, _1080p * 834 )
	self:addElement( BaseStreaks )
	self.BaseStreaks = BaseStreaks
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f14_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetDotPitchEnabled( true )
	Image:SetDotPitchX( 52, 0 )
	Image:SetDotPitchY( 43, 0 )
	Image:SetDotPitchContrast( 0.8, 0 )
	Image:SetDotPitchMode( 0 )
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1056, _1080p * 1594, _1080p * 359, _1080p * 897 )
	Image:SubscribeToModelThroughElement( BaseStreaks, "streak.fullImage", function ()
		local f16_local0 = BaseStreaks:GetDataSource()
		f16_local0 = f16_local0.streak.fullImage:GetValue( f14_local1 )
		if f16_local0 ~= nil then
			Image:setImage( RegisterMaterial( f16_local0 ), 0 )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f14_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 100, _1080p * 600, _1080p * -60, _1080p * -15 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f14_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_STREAK_SELECT" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local PermanentUnlockTokens = nil
	
	PermanentUnlockTokens = MenuBuilder.BuildRegisteredType( "PermanentUnlockTokens", {
		controllerIndex = f14_local1
	} )
	PermanentUnlockTokens.id = "PermanentUnlockTokens"
	PermanentUnlockTokens:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1170, _1080p * 1920, _1080p * 71.5, _1080p * 116.5 )
	self:addElement( PermanentUnlockTokens )
	self.PermanentUnlockTokens = PermanentUnlockTokens
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f14_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local PermanentUnlockItemDetails = nil
	
	PermanentUnlockItemDetails = MenuBuilder.BuildRegisteredType( "PermanentUnlockItemDetails", {
		controllerIndex = f14_local1
	} )
	PermanentUnlockItemDetails.id = "PermanentUnlockItemDetails"
	PermanentUnlockItemDetails.ItemDescription:SetRight( _1080p * 620, 0 )
	PermanentUnlockItemDetails.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PermanentUnlockItemDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 764, _1080p * 1920, _1080p * 216, _1080p * 316 )
	PermanentUnlockItemDetails:SubscribeToModelThroughElement( BaseStreaks, "streak.desc", function ()
		local f17_local0 = BaseStreaks:GetDataSource()
		f17_local0 = f17_local0.streak.desc:GetValue( f14_local1 )
		if f17_local0 ~= nil then
			PermanentUnlockItemDetails.ItemDescription:setText( f17_local0, 0 )
		end
	end )
	PermanentUnlockItemDetails:SubscribeToModelThroughElement( BaseStreaks, "streak.name", function ()
		local f18_local0 = BaseStreaks:GetDataSource()
		f18_local0 = f18_local0.streak.name:GetValue( f14_local1 )
		if f18_local0 ~= nil then
			PermanentUnlockItemDetails.ItemName:setText( f18_local0, 0 )
		end
	end )
	self:addElement( PermanentUnlockItemDetails )
	self.PermanentUnlockItemDetails = PermanentUnlockItemDetails
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f14_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Image:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.Image:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.Image:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.Image:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.Image:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.Image:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.Image:SetDotPitchContrast( 0, 300 )
				end
			},
			{
				function ()
					return self.Image:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Image:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Image:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Image:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Image:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Image:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.UpdateImage = function ()
			Image:AnimateSequence( "UpdateImage" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f34_arg0, f34_arg1 )
		f34_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
		f34_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:SubscribeToModelThroughElement( BaseStreaks, "streak.fullImage", function ()
		ACTIONS.AnimateSequence( self, "UpdateImage" )
	end )
	PostLoadFunc( self, f14_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "ScorestreaksPermanentUnlocks", ScorestreaksPermanentUnlocks )
LUI.FlowManager.RegisterStackPopBehaviour( "ScorestreaksPermanentUnlocks", f0_local1 )
LockTable( _M )
