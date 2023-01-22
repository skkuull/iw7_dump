local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = ZombiesUtils.CombatRecordMenuModelPath .. ".weapons"
f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg1.ref:GetValue( f1_arg2 )
	return {
		headshots = LUI.DataSourceInControllerModel.new( f0_local0 .. "." .. f1_local0 .. ".headshots", Engine.GetPlayerDataEx( f1_arg2, CoD.StatsGroup.Coop, "headShots", f1_local0 ) ),
		kills = LUI.DataSourceInControllerModel.new( f0_local0 .. "." .. f1_local0 .. ".kills", Engine.GetPlayerDataEx( f1_arg2, CoD.StatsGroup.Coop, "killsPerWeapon", f1_local0 ) )
	}
end

f0_local2 = function ( f2_arg0, f2_arg1, f2_arg2 )
	return {
		name = f2_arg1.pluralName:Filter( "localized", Engine.Localize ),
		key = f2_arg1.pluralName,
		weapons = f2_arg1.weapons:Decorate( f0_local1 )
	}
end

local f0_local3 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

local f0_local4 = function ()
	Engine.SetFrontEndSceneSection( "weapon_select", 1 )
end

function PostLoadFunc( f5_arg0, f5_arg1, f5_arg2 )
	assert( f5_arg0.WeaponGrid )
	local f5_local0 = LOADOUT.MakeBaseWeaponsListDataSource( f0_local0 .. ".baseWeapons", Cac.GetAllWeaponClasses(), Cac.GetWeaponRowList() )
	local f5_local1 = f5_local0:Decorate( f0_local2 )
	local f5_local2 = {}
	for f5_local3 = 0, f5_local1:GetCountValue( f5_arg1 ) - 1, 1 do
		local f5_local6 = f5_local1:GetDataSourceAtIndex( f5_local3 )
		f5_local6 = f5_local6.weapons
		for f5_local7 = 0, f5_local6:GetCountValue( f5_arg1 ) - 1, 1 do
			table.insert( f5_local2, f5_local6:GetDataSourceAtIndex( f5_local7, f5_arg1 ) )
		end
	end
	local f5_local3 = LUI.DataSourceFromList.new( #f5_local2 )
	f5_local3.MakeDataSourceAtIndex = function ( f6_arg0, f6_arg1 )
		return f5_local2[f6_arg1 + 1]
	end
	
	f5_arg0:SubscribeToModelThroughElement( f5_arg0.WeaponGrid, "name", function ()
		local f7_local0 = f5_arg0.WeaponGrid:GetDataSource( f5_arg1 )
		local f7_local1 = f7_local0.ref:GetValue( f5_arg1 )
		local f7_local2 = Cac.ConvertWeaponMPToZM( Cac.GetCompleteWeaponModelName( f7_local1, f7_local1, nil, -1, nil, nil, nil ) )
		Streaming.RequestWeaponViewModels( {
			f7_local2
		}, f5_arg1 )
		FrontEndScene.SetWeaponModel( 0, f7_local2, true )
		ClientWeapon.SetWeaponVisible( 0, true )
		ClientWeapon.SetWeaponIsViewModel( 0, true )
		ClientWeapon.SetWeaponRotation( 0, 0, 0, 0 )
		f5_arg0.WeaponNameTitle:setText( ToUpperCase( f7_local0.name:GetValue( f5_arg1 ) ), 0 )
		f5_arg0.Description:setText( f7_local0.desc:GetValue( f5_arg1 ), 0 )
		f5_arg0.KillsStat.AmountLabel:setText( f7_local0.kills:GetValue( f5_arg1 ), 0 )
	end )
	local f5_local4 = {
		"all"
	}
	local f5_local5 = {}
	f5_local5 = Engine.Localize( "MENU_ALL_CAPS" )
	for f5_local10 = 0, f5_local1:GetCountValue( f5_arg1 ) - 1, 1 do
		local f5_local9 = f5_local1:GetDataSourceAtIndex( f5_local10 )
		table.insert( f5_local5, f5_local9.name:GetValue( f5_arg1 ) )
		table.insert( f5_local4, f5_local9.key )
	end
	local f5_local10 = function ( f8_arg0 )
		local f8_local0 = nil
		if f8_arg0 == "all" then
			f8_local0 = f5_local3
		else
			for f8_local1 = 0, f5_local1:GetCountValue( f5_arg1 ) - 1, 1 do
				local f8_local4 = f5_local1:GetDataSourceAtIndex( f8_local1 )
				if f8_local4.key == f8_arg0 then
					f8_local0 = f8_local4.weapons
					break
				end
			end
		end
		assert( f8_local0 )
		f5_arg0.WeaponGrid:SetGridDataSource( f8_local0, f5_arg1 )
	end
	
	f5_arg0.bindButton:addEventHandler( "button_alt2", function ( f9_arg0, f9_arg1 )
		LUI.FlowManager.RequestPopupMenu( f5_arg0, "FilterPopup", true, f5_arg1, false, {
			callback = f5_local10,
			labels = f5_local5,
			keys = f5_local4
		}, nil, true )
	end )
	f5_arg0.WeaponGrid:SetGridDataSource( f5_local3 )
end

function CPCombatRecordWeaponListMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "CPCombatRecordWeaponListMenu"
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	f0_local4( self, f10_local1, controller )
	self:playSound( "menu_open" )
	local f10_local2 = self
	self:setUseStencil( true )
	local DescriptionGradientBacking = nil
	
	DescriptionGradientBacking = LUI.UIImage.new()
	DescriptionGradientBacking.id = "DescriptionGradientBacking"
	DescriptionGradientBacking:SetRGBFromInt( 0, 0 )
	DescriptionGradientBacking:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DescriptionGradientBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 665, _1080p * 2165, _1080p * 306, _1080p * 361 )
	self:addElement( DescriptionGradientBacking )
	self.DescriptionGradientBacking = DescriptionGradientBacking
	
	local CardNameBacking = nil
	
	CardNameBacking = LUI.UIImage.new()
	CardNameBacking.id = "CardNameBacking"
	CardNameBacking:SetRGBFromInt( 0, 0 )
	CardNameBacking:SetAlpha( 0.5, 0 )
	CardNameBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 665, _1080p * 2165, _1080p * 206, _1080p * 306 )
	self:addElement( CardNameBacking )
	self.CardNameBacking = CardNameBacking
	
	local CardNameBackingLeftBar = nil
	
	CardNameBackingLeftBar = LUI.UIImage.new()
	CardNameBackingLeftBar.id = "CardNameBackingLeftBar"
	CardNameBackingLeftBar:SetAlpha( 0.5, 0 )
	CardNameBackingLeftBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 665, _1080p * 673, _1080p * 206, _1080p * 306 )
	self:addElement( CardNameBackingLeftBar )
	self.CardNameBackingLeftBar = CardNameBackingLeftBar
	
	local WeaponGrid = nil
	
	WeaponGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 18,
		controllerIndex = f10_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CPCombatRecordWeaponValueButton", {
				controllerIndex = f10_local1
			} )
		end,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 560,
		rowHeight = _1080p * 30,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	WeaponGrid.id = "WeaponGrid"
	WeaponGrid:setUseStencil( true )
	WeaponGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 132, _1080p * 692, _1080p * 200, _1080p * 910 )
	self:addElement( WeaponGrid )
	self.WeaponGrid = WeaponGrid
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f10_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local CPMenuTitle = nil
	
	CPMenuTitle = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
		controllerIndex = f10_local1
	} )
	CPMenuTitle.id = "CPMenuTitle"
	CPMenuTitle.MenuTitle:setText( Engine.Localize( "MENU_WEAPONS_CAPS" ), 0 )
	CPMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( CPMenuTitle )
	self.CPMenuTitle = CPMenuTitle
	
	local scrollBar = nil
	
	scrollBar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f10_local1
	} )
	scrollBar.id = "scrollBar"
	scrollBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 120, _1080p * 136, _1080p * 198, _1080p * 911 )
	self:addElement( scrollBar )
	self.scrollBar = scrollBar
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f10_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 406.5, _1080p * 426.5, _1080p * 937, _1080p * 977 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f10_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.5, _1080p * 261.5, _1080p * 936, _1080p * 976 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 261.5, _1080p * 406.5, _1080p * 944, _1080p * 968 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local WeaponNameTitle = nil
	
	WeaponNameTitle = LUI.UIStyledText.new()
	WeaponNameTitle.id = "WeaponNameTitle"
	WeaponNameTitle:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	WeaponNameTitle:setText( "WEAPON NAME", 0 )
	WeaponNameTitle:SetFontSize( 64 * _1080p )
	WeaponNameTitle:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	WeaponNameTitle:SetAlignment( LUI.Alignment.Left )
	WeaponNameTitle:SetOptOutRightToLeftAlignmentFlip( true )
	WeaponNameTitle:SetStartupDelay( 2000 )
	WeaponNameTitle:SetLineHoldTime( 400 )
	WeaponNameTitle:SetAnimMoveTime( 300 )
	WeaponNameTitle:SetEndDelay( 1500 )
	WeaponNameTitle:SetCrossfadeTime( 750 )
	WeaponNameTitle:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	WeaponNameTitle:SetMaxVisibleLines( 1 )
	WeaponNameTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 700, _1080p * -873, _1080p * 229, _1080p * 293 )
	self:addElement( WeaponNameTitle )
	self.WeaponNameTitle = WeaponNameTitle
	
	local DescriptionBackingLeftBar = nil
	
	DescriptionBackingLeftBar = LUI.UIImage.new()
	DescriptionBackingLeftBar.id = "DescriptionBackingLeftBar"
	DescriptionBackingLeftBar:SetAlpha( 0.5, 0 )
	DescriptionBackingLeftBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 668, _1080p * 672, _1080p * 313, _1080p * 329 )
	self:addElement( DescriptionBackingLeftBar )
	self.DescriptionBackingLeftBar = DescriptionBackingLeftBar
	
	local Description = nil
	
	Description = LUI.UIStyledText.new()
	Description.id = "Description"
	Description:setText( "", 0 )
	Description:SetFontSize( 24 * _1080p )
	Description:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Description:SetAlignment( LUI.Alignment.Left )
	Description:SetOptOutRightToLeftAlignmentFlip( true )
	Description:SetDecodeLetterLength( 20 )
	Description:SetDecodeMaxRandChars( 6 )
	Description:SetDecodeUpdatesPerLetter( 4 )
	Description:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 683, _1080p * -176, _1080p * 310, _1080p * 334 )
	self:addElement( Description )
	self.Description = Description
	
	local KillsStat = nil
	
	KillsStat = MenuBuilder.BuildRegisteredType( "CPCombatRecordStat", {
		controllerIndex = f10_local1
	} )
	KillsStat.id = "KillsStat"
	KillsStat.AmountLabel:setText( "0", 0 )
	KillsStat.Label:setText( ToUpperCase( Engine.Localize( "MENU_KILLS" ) ), 0 )
	KillsStat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1164, _1080p * 1364, _1080p * 201, _1080p * 301 )
	self:addElement( KillsStat )
	self.KillsStat = KillsStat
	
	local WeaponRotator = nil
	
	WeaponRotator = MenuBuilder.BuildRegisteredType( "WeaponRotator", {
		controllerIndex = f10_local1
	} )
	WeaponRotator.id = "WeaponRotator"
	WeaponRotator:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 700, _1080p * -50, _1080p * 350, _1080p * 950 )
	self:addElement( WeaponRotator )
	self.WeaponRotator = WeaponRotator
	
	local f10_local18 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = scrollBar,
		startCap = scrollBar.startCap,
		endCap = scrollBar.endCap
	}
	local f10_local20 = scrollBar.sliderArea
	if f10_local20 then
		f10_local20 = scrollBar.sliderArea.slider
	end
	bindButton.slider = f10_local20
	f10_local20 = scrollBar.sliderArea
	if f10_local20 then
		f10_local20 = scrollBar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f10_local20
	WeaponGrid:AddScrollbar( f10_local18( bindButton ) )
	WeaponGrid:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f12_arg0, f12_arg1 )
		f12_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f12_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_FILTER" ),
			button_ref = "button_alt2",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f13_arg0, f13_arg1 )
		local f13_local0 = f13_arg1.controller or f10_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f10_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "KillsStat",
		sequenceName = "CondensedIcon",
		elementPath = "KillsStat"
	} )
	return self
end

MenuBuilder.registerType( "CPCombatRecordWeaponListMenu", CPCombatRecordWeaponListMenu )
LUI.FlowManager.RegisterStackPopBehaviour( "CPCombatRecordWeaponListMenu", f0_local3 )
LockTable( _M )
