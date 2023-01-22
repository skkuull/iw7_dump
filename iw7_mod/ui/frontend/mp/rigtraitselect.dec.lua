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
			local f1_local1 = Cac.GetRigSelectDataSources( "frontEnd.MP.CAC.rigSelect", f1_arg2.rigDataSource, f1_arg2.squadMemberDataSource, f1_arg1 )
			local f1_local2 = f1_arg2.rigDataSource.rigRef:GetValue( f1_arg1 )
			assert( f1_local2 and #f1_local2 > 0 )
			local f1_local3 = f1_local1:GetDataSourceAtIndex( Cac.GetRigIndex( f1_local2 ) )
			f1_arg2.selectedRig = f1_local3.rig
		end
	end
	assert( f1_arg2.selectedRig )
	assert( f1_arg2.rigDataSource )
	assert( f1_arg2.squadMemberDataSource )
	assert( f1_arg0.ShowcaseLock )
	f1_arg0.selectedRig = f1_arg2.selectedRig
	f1_arg0.rigDataSource = f1_arg2.rigDataSource
	f1_arg0.squadMemberDataSource = f1_arg2.squadMemberDataSource
	FrontEndScene.SetScene( "rig_trait_select" )
	f1_arg0:SetDataSource( f1_arg0.selectedRig, f1_arg1 )
	f1_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_INGAME_RIG_PERK_SELECT" ) ), 0 )
	f1_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumbCreateAClass(), 0 )
	local f1_local0 = MenuBuilder.BuildRegisteredType( "LobbyStatus", {
		controllerIndex = f1_arg1
	} )
	f1_local0:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -800, _1080p * -40, _1080p * -114, _1080p * -80 )
	f1_local0:Minimize()
	f1_arg0:addElement( f1_local0 )
	f1_arg0.TraitLabelBackground:ButtonOverAnims()
	f1_arg0:SubscribeToModelThroughElement( f1_arg0.RigTraits, "rigPerk.isUnlocked", function ()
		local f2_local0 = f1_arg0.RigTraits:GetDataSource()
		if f2_local0.rigPerk.isUnlocked:GetValue( f1_arg1 ) ~= nil then
			f2_local0 = f1_arg0.RigTraits:GetDataSource()
			if f2_local0.rigPerk.isUnlocked:GetValue( f1_arg1 ) == true then
				ACTIONS.AnimateSequence( f1_arg0.ShowcaseLock, "HideCriteria" )
			end
		end
		ACTIONS.AnimateSequence( f1_arg0.ShowcaseLock, "ShowCriteria" )
	end )
	if CONDITIONS.IsDraftEnabled( f1_arg0 ) then
		assert( f1_arg0.LoadoutDraftTimer )
		Cac.SetupLoadoutDraftTimerRefresh( f1_arg0.LoadoutDraftTimer )
	end
end

function RigTraitSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "RigTraitSelect"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self:playSound( "menu_open" )
	local f3_local2 = self
	local VerticalFluff = nil
	
	VerticalFluff = LUI.UIImage.new()
	VerticalFluff.id = "VerticalFluff"
	VerticalFluff:SetAlpha( 0.4, 0 )
	VerticalFluff:setImage( RegisterMaterial( "wdg_rig_item_fluff" ), 0 )
	VerticalFluff:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -150, _1080p * -118, _1080p * -556, _1080p * 468 )
	self:addElement( VerticalFluff )
	self.VerticalFluff = VerticalFluff
	
	local f3_local4 = nil
	if Engine.InFrontend() then
		f3_local4 = LUI.UIBlur.new()
		f3_local4.id = "Blur"
		f3_local4:SetBlurStrength( 2.75, 0 )
		f3_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 772, _1080p * 216, _1080p * 390 )
		self:addElement( f3_local4 )
		self.Blur = f3_local4
	end
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f3_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f3_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_INGAME_RIG_PERK_SELECT" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local RigTraits = nil
	
	RigTraits = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 3,
		maxVisibleRows = 1,
		controllerIndex = f3_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "RigPerkButton", {
				controllerIndex = f3_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 210,
		rowHeight = _1080p * 150,
		scrollingThresholdX = 0,
		scrollingThresholdY = 0,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	RigTraits.id = "RigTraits"
	RigTraits:setUseStencil( true )
	RigTraits:SetGridDataSourceThroughElement( self, "decoratedRigPerks" )
	RigTraits:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 772, _1080p * 240, _1080p * 390 )
	self:addElement( RigTraits )
	self.RigTraits = RigTraits
	
	local TraitLabelBackground = nil
	
	TraitLabelBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f3_local1
	} )
	TraitLabelBackground.id = "TraitLabelBackground"
	TraitLabelBackground.DropShadow:SetAlpha( 0, 0 )
	TraitLabelBackground:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 130, _1080p * 772, _1080p * -864, _1080p * -840 )
	self:addElement( TraitLabelBackground )
	self.TraitLabelBackground = TraitLabelBackground
	
	local TraitLabel = nil
	
	TraitLabel = LUI.UIText.new()
	TraitLabel.id = "TraitLabel"
	TraitLabel:SetRGBFromInt( 0, 0 )
	TraitLabel:setText( Engine.Localize( "LUA_MENU_MP_SELECT_TRAIT" ), 0 )
	TraitLabel:SetFontSize( 19 * _1080p )
	TraitLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TraitLabel:SetAlignment( LUI.Alignment.Left )
	TraitLabel:SetOptOutRightToLeftAlignmentFlip( true )
	TraitLabel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 150, _1080p * 320, _1080p * -861.5, _1080p * -842.5 )
	self:addElement( TraitLabel )
	self.TraitLabel = TraitLabel
	
	local TraitImage = nil
	
	TraitImage = LUI.UIImage.new()
	TraitImage.id = "TraitImage"
	TraitImage:SetDotPitchEnabled( true )
	TraitImage:SetDotPitchX( 0, 0 )
	TraitImage:SetDotPitchY( 0, 0 )
	TraitImage:SetDotPitchContrast( 0, 0 )
	TraitImage:SetDotPitchMode( 0 )
	TraitImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1110, _1080p * 1622, _1080p * 257, _1080p * 769 )
	TraitImage:SubscribeToModelThroughElement( RigTraits, "rigPerk.fullImage", function ()
		local f5_local0 = RigTraits:GetDataSource()
		f5_local0 = f5_local0.rigPerk.fullImage:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			TraitImage:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( TraitImage )
	self.TraitImage = TraitImage
	
	local ManufacturerImage = nil
	
	ManufacturerImage = LUI.UIImage.new()
	ManufacturerImage.id = "ManufacturerImage"
	ManufacturerImage:SetAlpha( 0.4, 0 )
	ManufacturerImage:SetZRotation( 90, 0 )
	ManufacturerImage:SetDotPitchEnabled( true )
	ManufacturerImage:SetDotPitchX( 0, 0 )
	ManufacturerImage:SetDotPitchY( 0, 0 )
	ManufacturerImage:SetDotPitchContrast( 0, 0 )
	ManufacturerImage:SetDotPitchMode( 0 )
	ManufacturerImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1568, _1080p * 2080, _1080p * 481, _1080p * 545 )
	ManufacturerImage:SubscribeToModelThroughElement( self, "manufacturersImage", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.manufacturersImage:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			ManufacturerImage:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( ManufacturerImage )
	self.ManufacturerImage = ManufacturerImage
	
	local RigItemInfo = nil
	
	RigItemInfo = MenuBuilder.BuildRegisteredType( "RigItemInfo", {
		controllerIndex = f3_local1
	} )
	RigItemInfo.id = "RigItemInfo"
	RigItemInfo:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -950, 0, _1080p * -287, _1080p * -147 )
	RigItemInfo:SubscribeToModelThroughElement( RigTraits, "rigPerk.name", function ()
		local f7_local0 = RigTraits:GetDataSource()
		f7_local0 = f7_local0.rigPerk.name:GetValue( f3_local1 )
		if f7_local0 ~= nil then
			RigItemInfo.ItemName:setText( ToUpperCase( f7_local0 ), 0 )
		end
	end )
	RigItemInfo:SubscribeToModelThroughElement( RigTraits, "rigPerk.desc", function ()
		local f8_local0 = RigTraits:GetDataSource()
		f8_local0 = f8_local0.rigPerk.desc:GetValue( f3_local1 )
		if f8_local0 ~= nil then
			RigItemInfo.ItemDescription:setText( f8_local0, 0 )
		end
	end )
	self:addElement( RigItemInfo )
	self.RigItemInfo = RigItemInfo
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f3_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local UnlockCriteria = nil
	
	UnlockCriteria = MenuBuilder.BuildRegisteredType( "UnlockCriteria", {
		controllerIndex = f3_local1
	} )
	UnlockCriteria.id = "UnlockCriteria"
	UnlockCriteria:SetDataSourceThroughElement( RigTraits, "rigPerk" )
	UnlockCriteria.UnlockDesc:SetRight( _1080p * 450, 0 )
	UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 970, _1080p * 1313, _1080p * 758, _1080p * 790 )
	UnlockCriteria:SubscribeToModelThroughElement( RigTraits, "rigPerk.ref", function ()
		local f9_local0 = RigTraits:GetDataSource()
		f9_local0 = f9_local0.rigPerk.ref:GetValue( f3_local1 )
		if f9_local0 ~= nil then
			UnlockCriteria.UnlockDesc:setText( GetTraitUnlockText( f9_local0 ), 0 )
		end
	end )
	self:addElement( UnlockCriteria )
	self.UnlockCriteria = UnlockCriteria
	
	local ShowcaseLock = nil
	
	ShowcaseLock = MenuBuilder.BuildRegisteredType( "ShowcaseLock", {
		controllerIndex = f3_local1
	} )
	ShowcaseLock.id = "ShowcaseLock"
	ShowcaseLock:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1110, _1080p * 1622, _1080p * 257, _1080p * 769 )
	self:addElement( ShowcaseLock )
	self.ShowcaseLock = ShowcaseLock
	
	local f3_local16 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f3_local16 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f3_local1
		} )
		f3_local16.id = "CRMMain"
		f3_local16:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f3_local16 )
		self.CRMMain = f3_local16
	end
	local f3_local17 = nil
	if CONDITIONS.IsDraftEnabled( self ) then
		f3_local17 = MenuBuilder.BuildRegisteredType( "LoadoutDraftTimer", {
			controllerIndex = f3_local1
		} )
		f3_local17.id = "LoadoutDraftTimer"
		f3_local17:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, 0, _1080p * 64 )
		self:addElement( f3_local17 )
		self.LoadoutDraftTimer = f3_local17
	end
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
		
		TraitImage:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.TraitImage:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.TraitImage:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.TraitImage:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.TraitImage:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.TraitImage:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.TraitImage:SetDotPitchContrast( 0, 300 )
				end
			},
			{
				function ()
					return self.TraitImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TraitImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.TraitImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.TraitImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.TraitImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.TraitImage:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.UpdateImage = function ()
			TraitImage:AnimateSequence( "UpdateImage" )
		end
		
		ManufacturerImage:RegisterAnimationSequence( "OpenMenu", {
			{
				function ()
					return self.ManufacturerImage:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.ManufacturerImage:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.ManufacturerImage:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.ManufacturerImage:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.ManufacturerImage:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.ManufacturerImage:SetDotPitchContrast( 0, 300 )
				end
			},
			{
				function ()
					return self.ManufacturerImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ManufacturerImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.ManufacturerImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.ManufacturerImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.ManufacturerImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.ManufacturerImage:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.OpenMenu = function ()
			ManufacturerImage:AnimateSequence( "OpenMenu" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	UnlockCriteria:SetDataSourceThroughElement( RigTraits, "rigPerk" )
	self.addButtonHelperFunction = function ( f45_arg0, f45_arg1 )
		f45_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f45_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f46_arg0, f46_arg1 )
		local f46_local0 = f46_arg1.controller or f3_local1
		ACTIONS.LeaveMenu( self )
	end )
	self:SubscribeToModelThroughElement( RigTraits, "rigPerk.fullImage", function ()
		ACTIONS.AnimateSequence( self, "UpdateImage" )
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "TraitLabelBackground",
		sequenceName = "ButtonOver",
		elementPath = "TraitLabelBackground"
	} )
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

MenuBuilder.registerType( "RigTraitSelect", RigTraitSelect )
LockTable( _M )
