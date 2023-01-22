local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg2 )
	if Engine.IsDevelopmentBuild() then
		if not f1_arg2.squadMemberDataSource then
			DebugPrint( "WARNING: Missing \"squadMemberDataSource\" option for RigSelect menu. Only OK after a MyChanges." )
			f1_arg2.squadMemberDataSource = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers
		end
		if not f1_arg2.rigDataSource then
			DebugPrint( "WARNING: Missing \"rigDataSource\" option for RigSelect menu. Only OK after a MyChanges." )
			local f1_local0 = GetCACPlayerDataDataSource( f1_arg2.squadMemberDataSource )
			f1_arg2.rigDataSource = f1_local0.rig
		end
		if not f1_arg2.selectedRig then
			DebugPrint( "WARNING: Missing \"selectedRig\" option for RigSelect menu. Only OK after a MyChanges." )
			f1_arg2.decoratedRigs = Cac.GetRigSelectDataSources( "frontEnd.MP.CAC.rigSelect", f1_arg2.rigDataSource, f1_arg2.squadMemberDataSource, f1_arg1 )
		end
	end
	FrontEndScene.SetScene( "rig_pick" )
	assert( f1_arg2.decoratedRigs )
	assert( f1_arg2.rigDataSource )
	assert( f1_arg2.squadMemberDataSource )
	f1_arg0.decoratedRigs = f1_arg2.decoratedRigs
	f1_arg0.rigDataSource = f1_arg2.rigDataSource
	f1_arg0.squadMemberDataSource = f1_arg2.squadMemberDataSource
	f1_arg0.XUID = f1_arg2.XUID
	f1_arg0.RigList.XUID = f1_arg2.XUID
	if CONDITIONS.IsDraftEnabled() and f1_arg0.XUID then
		f1_arg0:addElement( LUI.UITimer.new( nil, {
			interval = 1000,
			event = {
				name = "update_drafted"
			}
		} ) )
		f1_arg0:processEvent( {
			name = "update_drafted"
		} )
	end
	f1_arg0:SetDataSource( f1_arg0.decoratedRigs, f1_arg1 )
	assert( f1_arg0.bindButton )
	f1_arg0.bindButton:addEventHandler( "button_secondary", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f1_arg0.rigDataSource.rigRef:GetValue( f1_arg1 )
		FrontEndScene.SetCharacterToRig( FrontEndScene.ClientCharacters.Self, f2_local0, f1_arg0.squadMemberDataSource.archetypePreferences, f1_arg1 )
		local f2_local1 = Cac.GetPreferencesForRig( f1_arg0.squadMemberDataSource.archetypePreferences, f2_local0, f1_arg1 )
		FrontEndScene.SetWeaponForSuper( FrontEndScene.ClientCharacters.Self, f2_local1.archetypeSuper:GetValue( f1_arg1 ), f2_local0 )
		ACTIONS.LeaveMenu( f1_arg0 )
	end )
	assert( f1_arg0.RigList )
	assert( f1_arg0.CharacterRotator )
	f1_arg0.CharacterRotator:SetClientCharacterIndex( FrontEndScene.ClientCharacters.Customization )
	if Engine.IsConsoleGame() and not Engine.GetDvarBool( "killswitch_character_rotation" ) then
		f1_arg0:AddButtonHelperTextToElement( f1_arg0, {
			helper_text = Engine.Localize( "LUA_MENU_ROTATE" ),
			button_ref = "button_stickr_updown_noswap",
			priority = 10,
			side = "left",
			clickable = false
		} )
	end
	if not Onboarding:IsFlowInProgress( Onboarding.RigTutorial ) then
		f1_arg0.bindButton:addEventHandler( "button_alt1", function ( f3_arg0, f3_arg1 )
			local f3_local0 = f1_arg0.RigList:GetDataSource( f1_arg1 )
			f3_local0 = f3_local0.rig
			if f3_local0.isUnlocked:GetValue( f1_arg1 ) then
				Cac.PlayRigCapacityBink( f3_local0.ref:GetValue( f1_arg1 ), true, f1_arg1 )
			end
		end )
		f1_arg0:addEventHandler( "selection_changed", function ( f4_arg0, f4_arg1 )
			f1_arg0.CharacterRotator:ResetRotation()
			assert( f4_arg1.enable ~= nil )
			if f4_arg1.enable then
				f1_arg0:AddButtonHelperText( {
					helper_text = Engine.Localize( "LUA_MENU_MP_RIG_PLAY_VIDEO" ),
					button_ref = "button_alt1",
					side = "left",
					clickable = true
				} )
			else
				f1_arg0:RemoveButtonHelperText( "button_alt1", "left" )
			end
		end )
	end
	f1_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_INGAME_RIG_SELECT_TITLE" ) ), 0 )
	local f1_local1 = MenuBuilder.BuildRegisteredType( "LobbyStatus", {
		controllerIndex = f1_arg1
	} )
	f1_local1:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -800, _1080p * -40, _1080p * -114, _1080p * -80 )
	f1_local1:Minimize()
	f1_arg0:addElement( f1_local1 )
	f1_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumbCreateAClass(), 0 )
	if CONDITIONS.IsDraftEnabled( f1_arg0 ) then
		assert( f1_arg0.LoadoutDraftTimer )
		Cac.SetupLoadoutDraftTimerRefresh( f1_arg0.LoadoutDraftTimer )
	end
end

function RigEditMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "RigEditMenu"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	self:playSound( "menu_open" )
	local f5_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f5_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f5_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_INGAME_RIG_SELECT_TITLE" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local RigList = nil
	
	RigList = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		controllerIndex = f5_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "RigSelectButton", {
				controllerIndex = f5_local1
			} )
		end,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 426,
		rowHeight = _1080p * 125,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	RigList.id = "RigList"
	RigList:setUseStencil( false )
	RigList:SetGridDataSourceThroughElement( self, nil )
	RigList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 556, _1080p * 154, _1080p * 934 )
	self:addElement( RigList )
	self.RigList = RigList
	
	local ManufacturersImage = nil
	
	ManufacturersImage = LUI.UIImage.new()
	ManufacturersImage.id = "ManufacturersImage"
	ManufacturersImage:SetAlpha( 0.4, 0 )
	ManufacturersImage:SetZRotation( 90, 0 )
	ManufacturersImage:SetDotPitchEnabled( true )
	ManufacturersImage:SetDotPitchX( 0, 0 )
	ManufacturersImage:SetDotPitchY( 0, 0 )
	ManufacturersImage:SetDotPitchContrast( 0, 0 )
	ManufacturersImage:SetDotPitchMode( 0 )
	ManufacturersImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1568, _1080p * 2080, _1080p * 481, _1080p * 545 )
	ManufacturersImage:SubscribeToModelThroughElement( RigList, "rig.manufacturersImage", function ()
		local f7_local0 = RigList:GetDataSource()
		f7_local0 = f7_local0.rig.manufacturersImage:GetValue( f5_local1 )
		if f7_local0 ~= nil then
			ManufacturersImage:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	self:addElement( ManufacturersImage )
	self.ManufacturersImage = ManufacturersImage
	
	local TraitBacker = nil
	
	TraitBacker = LUI.UIImage.new()
	TraitBacker.id = "TraitBacker"
	TraitBacker:SetAlpha( 0.4, 0 )
	TraitBacker:setImage( RegisterMaterial( "wdg_rig_item_backer" ), 0 )
	TraitBacker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1642, _1080p * 1790, _1080p * 875, _1080p * 579 )
	self:addElement( TraitBacker )
	self.TraitBacker = TraitBacker
	
	local SuperBacker = nil
	
	SuperBacker = LUI.UIImage.new()
	SuperBacker.id = "SuperBacker"
	SuperBacker:SetAlpha( 0.4, 0 )
	SuperBacker:setImage( RegisterMaterial( "wdg_rig_item_backer" ), 0 )
	SuperBacker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1642, _1080p * 1790, _1080p * 195, _1080p * 491 )
	self:addElement( SuperBacker )
	self.SuperBacker = SuperBacker
	
	local RigSupers = nil
	
	RigSupers = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 3,
		controllerIndex = f5_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "RigSuperDisplay", {
				controllerIndex = f5_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 35,
		spacingY = _1080p * 35,
		columnWidth = _1080p * 210,
		rowHeight = _1080p * 60,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	RigSupers.id = "RigSupers"
	RigSupers:setUseStencil( false )
	RigSupers:SetGridDataSourceThroughElement( RigList, "rig.decoratedSupers" )
	RigSupers:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1528, _1080p * 1738, _1080p * 224, _1080p * 474 )
	self:addElement( RigSupers )
	self.RigSupers = RigSupers
	
	local RigTraits = nil
	
	RigTraits = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 3,
		controllerIndex = f5_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "RigPerkDisplay", {
				controllerIndex = f5_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 35,
		spacingY = _1080p * 35,
		columnWidth = _1080p * 210,
		rowHeight = _1080p * 60,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	RigTraits.id = "RigTraits"
	RigTraits:setUseStencil( false )
	RigTraits:SetGridDataSourceThroughElement( RigList, "rig.decoratedRigPerks" )
	RigTraits:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1528, _1080p * 1738, _1080p * 594, _1080p * 844 )
	self:addElement( RigTraits )
	self.RigTraits = RigTraits
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f5_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local VerticalFluff = nil
	
	VerticalFluff = LUI.UIImage.new()
	VerticalFluff.id = "VerticalFluff"
	VerticalFluff:SetAlpha( 0.4, 0 )
	VerticalFluff:setImage( RegisterMaterial( "wdg_rig_item_fluff" ), 0 )
	VerticalFluff:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -150, _1080p * -120, _1080p * -556, _1080p * 468 )
	self:addElement( VerticalFluff )
	self.VerticalFluff = VerticalFluff
	
	local f5_local13 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f5_local13 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f5_local1
		} )
		f5_local13.id = "CRMMain"
		f5_local13:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f5_local13 )
		self.CRMMain = f5_local13
	end
	local f5_local14 = nil
	if CONDITIONS.IsDraftEnabled( self ) then
		f5_local14 = MenuBuilder.BuildRegisteredType( "LoadoutDraftTimer", {
			controllerIndex = f5_local1
		} )
		f5_local14.id = "LoadoutDraftTimer"
		f5_local14:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, 0, _1080p * 64 )
		self:addElement( f5_local14 )
		self.LoadoutDraftTimer = f5_local14
	end
	local CharacterRotator = nil
	
	CharacterRotator = MenuBuilder.BuildRegisteredType( "CharacterRotator", {
		controllerIndex = f5_local1
	} )
	CharacterRotator.id = "CharacterRotator"
	CharacterRotator:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 667.63, _1080p * 1615.63, _1080p * 266, _1080p * 892 )
	self:addElement( CharacterRotator )
	self.CharacterRotator = CharacterRotator
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.CloseEditRigItems = function ()
			
		end
		
		self._sequences.OpenEditRigItems = function ()
			
		end
		
		self._sequences.OpenedEditRigItems = function ()
			
		end
		
		self._sequences.NoPrev = function ()
			
		end
		
		self._sequences.NoNext = function ()
			
		end
		
		self._sequences.YesPrev = function ()
			
		end
		
		self._sequences.YesNext = function ()
			
		end
		
		ManufacturersImage:RegisterAnimationSequence( "OpenMenu", {
			{
				function ()
					return self.ManufacturersImage:SetAlpha( 0, 200 )
				end,
				function ()
					return self.ManufacturersImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.ManufacturersImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.ManufacturersImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.ManufacturersImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.ManufacturersImage:SetAlpha( 1, 30 )
				end
			}
		} )
		TraitBacker:RegisterAnimationSequence( "OpenMenu", {
			{
				function ()
					return self.TraitBacker:SetAlpha( 0, 120 )
				end,
				function ()
					return self.TraitBacker:SetAlpha( 0.4, 50 )
				end
			},
			{
				function ()
					return self.TraitBacker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1642, _1080p * 1790, _1080p * 875, _1080p * 579, 119 )
				end,
				function ()
					return self.TraitBacker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1622, _1080p * 1770, _1080p * 875, _1080p * 579, 50 )
				end,
				function ()
					return self.TraitBacker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1622, _1080p * 1770, _1080p * 875, _1080p * 579, 149, LUI.EASING.outSine )
				end
			}
		} )
		SuperBacker:RegisterAnimationSequence( "OpenMenu", {
			{
				function ()
					return self.SuperBacker:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SuperBacker:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.SuperBacker:SetAlpha( 0.4, 150, LUI.EASING.outSine )
				end
			},
			{
				function ()
					return self.SuperBacker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1642, _1080p * 1790, _1080p * 195, _1080p * 491, 0 )
				end,
				function ()
					return self.SuperBacker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1622, _1080p * 1770, _1080p * 195, _1080p * 491, 50 )
				end,
				function ()
					return self.SuperBacker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1622, _1080p * 1770, _1080p * 195, _1080p * 491, 150, LUI.EASING.outSine )
				end
			}
		} )
		RigSupers:RegisterAnimationSequence( "OpenMenu", {
			{
				function ()
					return self.RigSupers:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RigSupers:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.RigSupers:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1528, _1080p * 1738, _1080p * 222, _1080p * 472, 0 )
				end,
				function ()
					return self.RigSupers:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1517, _1080p * 1727, _1080p * 224, _1080p * 474, 50 )
				end,
				function ()
					return self.RigSupers:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1500, _1080p * 1710, _1080p * 224, _1080p * 474, 150, LUI.EASING.outSine )
				end
			}
		} )
		RigTraits:RegisterAnimationSequence( "OpenMenu", {
			{
				function ()
					return self.RigTraits:SetAlpha( 0, 120 )
				end,
				function ()
					return self.RigTraits:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.RigTraits:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1528, _1080p * 1738, _1080p * 594, _1080p * 844, 119 )
				end,
				function ()
					return self.RigTraits:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1517, _1080p * 1727, _1080p * 594, _1080p * 844, 50 )
				end,
				function ()
					return self.RigTraits:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1500, _1080p * 1710, _1080p * 594, _1080p * 844, 149, LUI.EASING.outSine )
				end
			}
		} )
		self._sequences.OpenMenu = function ()
			ManufacturersImage:AnimateSequence( "OpenMenu" )
			TraitBacker:AnimateSequence( "OpenMenu" )
			SuperBacker:AnimateSequence( "OpenMenu" )
			RigSupers:AnimateSequence( "OpenMenu" )
			RigTraits:AnimateSequence( "OpenMenu" )
		end
		
		ManufacturersImage:RegisterAnimationSequence( "UpdateManufacturer", {
			{
				function ()
					return self.ManufacturersImage:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.ManufacturersImage:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.ManufacturersImage:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.ManufacturersImage:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.ManufacturersImage:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.ManufacturersImage:SetDotPitchContrast( 0, 300 )
				end
			},
			{
				function ()
					return self.ManufacturersImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ManufacturersImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.ManufacturersImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.ManufacturersImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.ManufacturersImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.ManufacturersImage:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.UpdateManufacturer = function ()
			ManufacturersImage:AnimateSequence( "UpdateManufacturer" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f60_arg0, f60_arg1 )
		f60_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f60_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -1,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:SubscribeToModelThroughElement( RigList, "rig.manufacturersImage", function ()
		ACTIONS.AnimateSequence( self, "UpdateManufacturer" )
	end )
	f0_local0( self, f5_local1, controller )
	ACTIONS.AnimateSequence( self, "OpenMenu" )
	if CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end
	return self
end

MenuBuilder.registerType( "RigEditMenu", RigEditMenu )
LockTable( _M )
