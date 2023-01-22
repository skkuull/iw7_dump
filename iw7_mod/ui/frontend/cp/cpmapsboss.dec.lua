local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ()
	Engine.SetFrontEndSceneSection( "zm_map_selection", 1 )
end

f0_local1 = "frontEnd.maps"
f0_local2 = function ()
	WipeGlobalModelsAtPath( f0_local1 )
end

local f0_local3 = function ( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0:SetDataSource( ZombiesUtils.GetMapsDataSources( f0_local1, f3_arg1, true ), f3_arg1 )
	f3_arg0:addEventHandler( "boss_ID", function ( f4_arg0, f4_arg1 )
		if f4_arg1.bossSelection == 1 then
			ACTIONS.AnimateSequence( f3_arg0, "bossAlien" )
		elseif f4_arg1.bossSelection == 2 then
			ACTIONS.AnimateSequence( f3_arg0, "bossSlasher" )
		elseif f4_arg1.bossSelection == 3 then
			ACTIONS.AnimateSequence( f3_arg0, "bossRatking" )
		elseif f4_arg1.bossSelection == 4 then
			ACTIONS.AnimateSequence( f3_arg0, "bossCrog" )
		elseif f4_arg1.bossSelection == 5 then
			ACTIONS.AnimateSequence( f3_arg0, "bossRhino" )
		elseif f4_arg1.bossSelection == 6 then
			ACTIONS.AnimateSequence( f3_arg0, "bossMeph" )
		end
	end )
	local MapButtons = nil
	
	MapButtons = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 7,
		controllerIndex = f3_arg1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CPMapsBossButton", {
				controllerIndex = f3_arg1
			} )
		end,
		wrapX = true,
		wrapY = true,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 30,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = true,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	MapButtons.id = "MapButtons"
	MapButtons:setUseStencil( false )
	MapButtons:SetGridDataSourceThroughElement( f3_arg0, nil )
	MapButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 200, _1080p * 470 )
	f3_arg0:addElement( MapButtons )
	f3_arg0.MapButtons = MapButtons
	
end

function CPMapsBoss( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self.id = "CPMapsBoss"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	f0_local0( self, f6_local1, controller )
	self:playSound( "menu_open" )
	local f6_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f6_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f6_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 100, _1080p * 600, _1080p * -60, _1080p * -15 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local CPMenuTitle = nil
	
	CPMenuTitle = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
		controllerIndex = f6_local1
	} )
	CPMenuTitle.id = "CPMenuTitle"
	CPMenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_BOSS_BATTLE" ) ), 0 )
	CPMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( CPMenuTitle )
	self.CPMenuTitle = CPMenuTitle
	
	local spinner = nil
	
	spinner = LUI.UIImage.new()
	spinner.id = "spinner"
	spinner:setImage( RegisterMaterial( "zm_tix_arcane_spinner" ), 0 )
	spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100, _1080p * 612, _1080p * 456, _1080p * 968 )
	self:addElement( spinner )
	self.spinner = spinner
	
	local alien = nil
	
	alien = LUI.UIImage.new()
	alien.id = "alien"
	alien:SetZRotation( 10, 0 )
	alien:SetScale( 0.7, 0 )
	alien:setImage( RegisterMaterial( "cp_final_boss_alien" ), 0 )
	alien:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 230.4, _1080p * 486.4, _1080p * 584, _1080p * 840 )
	self:addElement( alien )
	self.alien = alien
	
	local slasher = nil
	
	slasher = LUI.UIImage.new()
	slasher.id = "slasher"
	slasher:SetZRotation( -20, 0 )
	slasher:SetScale( 0.6, 0 )
	slasher:setImage( RegisterMaterial( "cp_final_boss_slasher" ), 0 )
	slasher:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 232.4, _1080p * 488.4, _1080p * 586, _1080p * 842 )
	self:addElement( slasher )
	self.slasher = slasher
	
	local ratking = nil
	
	ratking = LUI.UIImage.new()
	ratking.id = "ratking"
	ratking:SetZRotation( -18, 0 )
	ratking:SetScale( 0.7, 0 )
	ratking:setImage( RegisterMaterial( "cp_final_boss_ratking" ), 0 )
	ratking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 231.4, _1080p * 487.4, _1080p * 563, _1080p * 819 )
	self:addElement( ratking )
	self.ratking = ratking
	
	local crog = nil
	
	crog = LUI.UIImage.new()
	crog.id = "crog"
	crog:SetZRotation( -15, 0 )
	crog:SetScale( 0.7, 0 )
	crog:setImage( RegisterMaterial( "cp_final_boss_crog" ), 0 )
	crog:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 222, _1080p * 478, _1080p * 584, _1080p * 840 )
	self:addElement( crog )
	self.crog = crog
	
	local rhino = nil
	
	rhino = LUI.UIImage.new()
	rhino.id = "rhino"
	rhino:SetZRotation( 1, 0 )
	rhino:SetScale( 0.7, 0 )
	rhino:setImage( RegisterMaterial( "cp_final_boss_rhino" ), 0 )
	rhino:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 223, _1080p * 479, _1080p * 584, _1080p * 840 )
	self:addElement( rhino )
	self.rhino = rhino
	
	local meph = nil
	
	meph = LUI.UIImage.new()
	meph.id = "meph"
	meph:SetScale( 0.9, 0 )
	meph:setImage( RegisterMaterial( "cp_final_boss_meph" ), 0 )
	meph:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241, _1080p * 497, _1080p * 548.2, _1080p * 804.2 )
	self:addElement( meph )
	self.meph = meph
	
	self._animationSets.DefaultAnimationSet = function ()
		spinner:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.spinner:SetAlpha( 0, 0 )
				end
			}
		} )
		alien:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.alien:SetAlpha( 0, 0 )
				end
			}
		} )
		slasher:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.slasher:SetAlpha( 0, 0 )
				end
			}
		} )
		ratking:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ratking:SetAlpha( 0, 0 )
				end
			}
		} )
		crog:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.crog:SetAlpha( 0, 0 )
				end
			}
		} )
		rhino:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.rhino:SetAlpha( 0, 0 )
				end
			}
		} )
		meph:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.meph:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			spinner:AnimateSequence( "DefaultSequence" )
			alien:AnimateSequence( "DefaultSequence" )
			slasher:AnimateSequence( "DefaultSequence" )
			ratking:AnimateSequence( "DefaultSequence" )
			crog:AnimateSequence( "DefaultSequence" )
			rhino:AnimateSequence( "DefaultSequence" )
			meph:AnimateSequence( "DefaultSequence" )
		end
		
		spinner:RegisterAnimationSequence( "bossAlien", {
			{
				function ()
					return self.spinner:SetAlpha( 0, 0 )
				end,
				function ()
					return self.spinner:SetAlpha( 0.8, 250 )
				end
			}
		} )
		alien:RegisterAnimationSequence( "bossAlien", {
			{
				function ()
					return self.alien:SetAlpha( 0, 0 )
				end,
				function ()
					return self.alien:SetAlpha( 1, 250 )
				end
			}
		} )
		slasher:RegisterAnimationSequence( "bossAlien", {
			{
				function ()
					return self.slasher:SetAlpha( 0, 0 )
				end
			}
		} )
		ratking:RegisterAnimationSequence( "bossAlien", {
			{
				function ()
					return self.ratking:SetAlpha( 0, 0 )
				end
			}
		} )
		crog:RegisterAnimationSequence( "bossAlien", {
			{
				function ()
					return self.crog:SetAlpha( 0, 0 )
				end
			}
		} )
		rhino:RegisterAnimationSequence( "bossAlien", {
			{
				function ()
					return self.rhino:SetAlpha( 0, 0 )
				end
			}
		} )
		meph:RegisterAnimationSequence( "bossAlien", {
			{
				function ()
					return self.meph:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.bossAlien = function ()
			spinner:AnimateSequence( "bossAlien" )
			alien:AnimateSequence( "bossAlien" )
			slasher:AnimateSequence( "bossAlien" )
			ratking:AnimateSequence( "bossAlien" )
			crog:AnimateSequence( "bossAlien" )
			rhino:AnimateSequence( "bossAlien" )
			meph:AnimateSequence( "bossAlien" )
		end
		
		spinner:RegisterAnimationSequence( "bossSlasher", {
			{
				function ()
					return self.spinner:SetAlpha( 0, 0 )
				end,
				function ()
					return self.spinner:SetAlpha( 0.8, 250 )
				end
			}
		} )
		alien:RegisterAnimationSequence( "bossSlasher", {
			{
				function ()
					return self.alien:SetAlpha( 0, 0 )
				end
			}
		} )
		slasher:RegisterAnimationSequence( "bossSlasher", {
			{
				function ()
					return self.slasher:SetAlpha( 0, 0 )
				end,
				function ()
					return self.slasher:SetAlpha( 1, 250 )
				end
			}
		} )
		ratking:RegisterAnimationSequence( "bossSlasher", {
			{
				function ()
					return self.ratking:SetAlpha( 0, 0 )
				end
			}
		} )
		crog:RegisterAnimationSequence( "bossSlasher", {
			{
				function ()
					return self.crog:SetAlpha( 0, 0 )
				end
			}
		} )
		rhino:RegisterAnimationSequence( "bossSlasher", {
			{
				function ()
					return self.rhino:SetAlpha( 0, 0 )
				end
			}
		} )
		meph:RegisterAnimationSequence( "bossSlasher", {
			{
				function ()
					return self.meph:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.bossSlasher = function ()
			spinner:AnimateSequence( "bossSlasher" )
			alien:AnimateSequence( "bossSlasher" )
			slasher:AnimateSequence( "bossSlasher" )
			ratking:AnimateSequence( "bossSlasher" )
			crog:AnimateSequence( "bossSlasher" )
			rhino:AnimateSequence( "bossSlasher" )
			meph:AnimateSequence( "bossSlasher" )
		end
		
		spinner:RegisterAnimationSequence( "bossRatking", {
			{
				function ()
					return self.spinner:SetAlpha( 0, 0 )
				end,
				function ()
					return self.spinner:SetAlpha( 0.8, 250 )
				end
			}
		} )
		alien:RegisterAnimationSequence( "bossRatking", {
			{
				function ()
					return self.alien:SetAlpha( 0, 0 )
				end
			}
		} )
		slasher:RegisterAnimationSequence( "bossRatking", {
			{
				function ()
					return self.slasher:SetAlpha( 0, 0 )
				end
			}
		} )
		ratking:RegisterAnimationSequence( "bossRatking", {
			{
				function ()
					return self.ratking:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ratking:SetAlpha( 1, 250 )
				end
			}
		} )
		crog:RegisterAnimationSequence( "bossRatking", {
			{
				function ()
					return self.crog:SetAlpha( 0, 0 )
				end
			}
		} )
		rhino:RegisterAnimationSequence( "bossRatking", {
			{
				function ()
					return self.rhino:SetAlpha( 0, 0 )
				end
			}
		} )
		meph:RegisterAnimationSequence( "bossRatking", {
			{
				function ()
					return self.meph:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.bossRatking = function ()
			spinner:AnimateSequence( "bossRatking" )
			alien:AnimateSequence( "bossRatking" )
			slasher:AnimateSequence( "bossRatking" )
			ratking:AnimateSequence( "bossRatking" )
			crog:AnimateSequence( "bossRatking" )
			rhino:AnimateSequence( "bossRatking" )
			meph:AnimateSequence( "bossRatking" )
		end
		
		spinner:RegisterAnimationSequence( "bossCrog", {
			{
				function ()
					return self.spinner:SetAlpha( 0, 0 )
				end,
				function ()
					return self.spinner:SetAlpha( 0.8, 250 )
				end
			}
		} )
		alien:RegisterAnimationSequence( "bossCrog", {
			{
				function ()
					return self.alien:SetAlpha( 0, 0 )
				end
			}
		} )
		slasher:RegisterAnimationSequence( "bossCrog", {
			{
				function ()
					return self.slasher:SetAlpha( 0, 0 )
				end
			}
		} )
		ratking:RegisterAnimationSequence( "bossCrog", {
			{
				function ()
					return self.ratking:SetAlpha( 0, 0 )
				end
			}
		} )
		crog:RegisterAnimationSequence( "bossCrog", {
			{
				function ()
					return self.crog:SetAlpha( 0, 0 )
				end,
				function ()
					return self.crog:SetAlpha( 1, 250 )
				end
			}
		} )
		rhino:RegisterAnimationSequence( "bossCrog", {
			{
				function ()
					return self.rhino:SetAlpha( 0, 0 )
				end
			}
		} )
		meph:RegisterAnimationSequence( "bossCrog", {
			{
				function ()
					return self.meph:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.bossCrog = function ()
			spinner:AnimateSequence( "bossCrog" )
			alien:AnimateSequence( "bossCrog" )
			slasher:AnimateSequence( "bossCrog" )
			ratking:AnimateSequence( "bossCrog" )
			crog:AnimateSequence( "bossCrog" )
			rhino:AnimateSequence( "bossCrog" )
			meph:AnimateSequence( "bossCrog" )
		end
		
		spinner:RegisterAnimationSequence( "bossRhino", {
			{
				function ()
					return self.spinner:SetAlpha( 0, 0 )
				end,
				function ()
					return self.spinner:SetAlpha( 0.8, 250 )
				end
			}
		} )
		alien:RegisterAnimationSequence( "bossRhino", {
			{
				function ()
					return self.alien:SetAlpha( 0, 0 )
				end
			}
		} )
		slasher:RegisterAnimationSequence( "bossRhino", {
			{
				function ()
					return self.slasher:SetAlpha( 0, 0 )
				end
			}
		} )
		ratking:RegisterAnimationSequence( "bossRhino", {
			{
				function ()
					return self.ratking:SetAlpha( 0, 0 )
				end
			}
		} )
		crog:RegisterAnimationSequence( "bossRhino", {
			{
				function ()
					return self.crog:SetAlpha( 0, 0 )
				end
			}
		} )
		rhino:RegisterAnimationSequence( "bossRhino", {
			{
				function ()
					return self.rhino:SetAlpha( 0, 0 )
				end,
				function ()
					return self.rhino:SetAlpha( 1, 250 )
				end
			}
		} )
		meph:RegisterAnimationSequence( "bossRhino", {
			{
				function ()
					return self.meph:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.bossRhino = function ()
			spinner:AnimateSequence( "bossRhino" )
			alien:AnimateSequence( "bossRhino" )
			slasher:AnimateSequence( "bossRhino" )
			ratking:AnimateSequence( "bossRhino" )
			crog:AnimateSequence( "bossRhino" )
			rhino:AnimateSequence( "bossRhino" )
			meph:AnimateSequence( "bossRhino" )
		end
		
		spinner:RegisterAnimationSequence( "bossMeph", {
			{
				function ()
					return self.spinner:SetAlpha( 0, 0 )
				end,
				function ()
					return self.spinner:SetAlpha( 0.8, 250 )
				end
			}
		} )
		alien:RegisterAnimationSequence( "bossMeph", {
			{
				function ()
					return self.alien:SetAlpha( 0, 0 )
				end
			}
		} )
		slasher:RegisterAnimationSequence( "bossMeph", {
			{
				function ()
					return self.slasher:SetAlpha( 0, 0 )
				end
			}
		} )
		ratking:RegisterAnimationSequence( "bossMeph", {
			{
				function ()
					return self.ratking:SetAlpha( 0, 0 )
				end
			}
		} )
		crog:RegisterAnimationSequence( "bossMeph", {
			{
				function ()
					return self.crog:SetAlpha( 0, 0 )
				end
			}
		} )
		rhino:RegisterAnimationSequence( "bossMeph", {
			{
				function ()
					return self.rhino:SetAlpha( 0, 0 )
				end
			}
		} )
		meph:RegisterAnimationSequence( "bossMeph", {
			{
				function ()
					return self.meph:SetAlpha( 0, 0 )
				end,
				function ()
					return self.meph:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.bossMeph = function ()
			spinner:AnimateSequence( "bossMeph" )
			alien:AnimateSequence( "bossMeph" )
			slasher:AnimateSequence( "bossMeph" )
			ratking:AnimateSequence( "bossMeph" )
			crog:AnimateSequence( "bossMeph" )
			rhino:AnimateSequence( "bossMeph" )
			meph:AnimateSequence( "bossMeph" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f76_arg0, f76_arg1 )
		f76_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f76_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f77_arg0, f77_arg1 )
		local f77_local0 = f77_arg1.controller or f6_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local3( self, f6_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "CPMapsBoss", CPMapsBoss )
LUI.FlowManager.RegisterStackPopBehaviour( "CPMapsBoss", f0_local2 )
LockTable( _M )
