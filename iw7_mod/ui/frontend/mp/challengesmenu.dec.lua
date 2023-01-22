local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.challenges"
f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = CallingCardUtils.BuildChallengeEntriesDataSources( f1_arg1.ref:GetValue(), f0_local0, true, f1_arg2 )
	for f1_local4, f1_local5 in pairs( f1_local0 ) do
		f1_arg1[f1_local4] = f1_local5
	end
	f1_local1 = f1_local0.entries:GetCountValue( f1_arg2 )
	f1_local2 = 0
	for f1_local3 = 1, f1_local1, 1 do
		local f1_local6 = f1_arg1.entries:GetDataSourceAtIndex( f1_local3 - 1 )
		if f1_local6.isCompleted:GetValue( f1_arg2 ) then
			f1_local2 = f1_local2 + 1 or f1_local2
		end
	end
	if f1_local1 <= 12 then
		f1_arg0.ArrowUp:SetAlpha( 0, 0 )
		f1_arg0.ArrowDown:SetAlpha( 0, 0 )
		f1_arg0.ListCount:SetAlpha( 0, 0 )
	end
	f1_arg1.challengeCount = f1_local1
	f1_arg1.completed = f1_local2
	f1_arg0:SetDataSource( f1_arg1, f1_arg2 )
	f1_arg0.MasterChallenge:SetDataSource( f1_arg1.masterChallenge, f1_arg2 )
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.Tabs )
	assert( f2_arg0.Tabs.Tabs )
	if not CONDITIONS.IsThirdGameMode() then
		f2_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ), 0 ) )
	end
	local f2_local0 = f2_arg2.subCategoryDataSource.subCategories
	local f2_local1 = {}
	DataSources.frontEnd.MP.challenges = {}
	for f2_local2 = 1, f2_local0:GetCountValue( f2_arg1 ), 1 do
		local f2_local5 = f2_local0:GetDataSourceAtIndex( f2_local2 - 1 )
		if f2_local5 ~= nil then
			table.insert( f2_local1, {
				name = f2_local5.name,
				focusFunction = function ( f3_arg0, f3_arg1, f3_arg2 )
					local f3_local0 = f2_local0:GetDataSourceAtIndex( f3_arg2 )
					if f3_local0.ref:GetValue( f3_arg1 ) == "secret" or f3_local0.ref:GetValue( f3_arg1 ) == "dc" then
						f2_arg0.MasterChallenge:SetAlpha( 0 )
					else
						f2_arg0.MasterChallenge:SetAlpha( 1 )
					end
					f0_local1( f2_arg0, f3_local0, f3_arg1 )
				end
			} )
		end
	end
	local f2_local2 = LUI.DataSourceFromList.new( #f2_local1 )
	f2_local2.MakeDataSourceAtIndex = function ( f4_arg0, f4_arg1 )
		return f2_local1[f4_arg1 + 1]
	end
	
	f2_local2.GetDefaultFocusIndex = function ()
		return 0
	end
	
	f2_arg0.Tabs.Tabs:SetTabManagerDataSource( f2_local2 )
	if Engine.IsCoreMode() then
		local self = LUI.UIElement.new( {
			worldBlur = 5
		} )
		self:setupWorldBlur()
		self.id = "blur"
		f2_arg0:addElement( self )
	end
end

f0_local2 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

function ChallengesMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "ChallengesMenu"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	self:playSound( "menu_open" )
	local f7_local2 = self
	local MainBG = nil
	
	MainBG = LUI.UIImage.new()
	MainBG.id = "MainBG"
	MainBG:SetAlpha( 0.3, 0 )
	MainBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -879, _1080p * 878, _1080p * -320, _1080p * 399 )
	self:addElement( MainBG )
	self.MainBG = MainBG
	
	local f7_local4 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f7_local4 = LUI.UIImage.new()
		f7_local4.id = "Spinner"
		f7_local4:SetAlpha( 0.4, 0 )
		f7_local4:SetScale( -0.28, 0 )
		f7_local4:setImage( RegisterMaterial( "zm_tix_arcane_spinner" ), 0 )
		f7_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 872.58, _1080p * 2090, _1080p * -116.5, _1080p * 1100.92 )
		self:addElement( f7_local4 )
		self.Spinner = f7_local4
	end
	local f7_local5 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f7_local5 = LUI.UIImage.new()
		f7_local5.id = "RedGlow"
		f7_local5:SetAlpha( 0.8, 0 )
		f7_local5:SetScale( -0.28, 0 )
		f7_local5:setImage( RegisterMaterial( "cp_menu_pause_red_glow" ), 0 )
		f7_local5:SetBlendMode( BLEND_MODE.addWithAlpha )
		f7_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 934.58, _1080p * 2028, _1080p * -45, _1080p * 1048.42 )
		self:addElement( f7_local5 )
		self.RedGlow = f7_local5
	end
	local f7_local6 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f7_local6 = LUI.UIBlur.new()
		f7_local6.id = "ListBlur"
		f7_local6:SetBlurStrength( 2.75, 0 )
		f7_local6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 86, _1080p * 1301, _1080p * 224, _1080p * 763 )
		self:addElement( f7_local6 )
		self.ListBlur = f7_local6
	end
	local ButtonHelperBar0 = nil
	
	ButtonHelperBar0 = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f7_local1
	} )
	ButtonHelperBar0.id = "ButtonHelperBar0"
	ButtonHelperBar0:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar0 )
	self.ButtonHelperBar0 = ButtonHelperBar0
	
	local ChallengeInfoGrid = nil
	
	ChallengeInfoGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 4,
		maxVisibleRows = 3,
		controllerIndex = f7_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ChallengeInfo", {
				controllerIndex = f7_local1
			} )
		end,
		wrapX = true,
		wrapY = false,
		spacingX = _1080p * 13,
		spacingY = _1080p * 13,
		columnWidth = _1080p * 294,
		rowHeight = _1080p * 171,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	ChallengeInfoGrid.id = "ChallengeInfoGrid"
	ChallengeInfoGrid:setUseStencil( true )
	ChallengeInfoGrid:SetGridDataSourceThroughElement( self, "entries" )
	ChallengeInfoGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 86, _1080p * 1301, _1080p * 224, _1080p * 763 )
	self:addElement( ChallengeInfoGrid )
	self.ChallengeInfoGrid = ChallengeInfoGrid
	
	local VerticalScrollbar0 = nil
	
	VerticalScrollbar0 = MenuBuilder.BuildRegisteredType( "VerticalScrollbar", {
		controllerIndex = f7_local1
	} )
	VerticalScrollbar0.id = "VerticalScrollbar0"
	VerticalScrollbar0:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 28, _1080p * 58, _1080p * 179, _1080p * -101 )
	self:addElement( VerticalScrollbar0 )
	self.VerticalScrollbar0 = VerticalScrollbar0
	
	local ChallengeInfoBig = nil
	
	ChallengeInfoBig = MenuBuilder.BuildRegisteredType( "ChallengeInfoBig", {
		controllerIndex = f7_local1
	} )
	ChallengeInfoBig.id = "ChallengeInfoBig"
	ChallengeInfoBig:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1314, _1080p * 1834, _1080p * 224, _1080p * 935 )
	self:addElement( ChallengeInfoBig )
	self.ChallengeInfoBig = ChallengeInfoBig
	
	local MasterChallenge = nil
	
	MasterChallenge = MenuBuilder.BuildRegisteredType( "MasterChallenge", {
		controllerIndex = f7_local1
	} )
	MasterChallenge.id = "MasterChallenge"
	MasterChallenge:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 86, _1080p * 1301, _1080p * 791, _1080p * 935 )
	self:addElement( MasterChallenge )
	self.MasterChallenge = MasterChallenge
	
	local Tabs = nil
	
	Tabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f7_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 155, _1080p * 117 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local f7_local13 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f7_local13 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f7_local1
		} )
		f7_local13.id = "MenuTitle"
		f7_local13.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_CHALLENGES_CAP" ) ), 0 )
		f7_local13.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
		f7_local13.Icon:SetTop( _1080p * -28.5, 0 )
		f7_local13.Icon:SetBottom( _1080p * 61.5, 0 )
		f7_local13:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f7_local13 )
		self.MenuTitle = f7_local13
	end
	local f7_local14 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f7_local14 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f7_local1
		} )
		f7_local14.id = "CPMenuTitle"
		f7_local14.MenuTitle:setText( Engine.Localize( "MENU_CHALLENGES_CAP" ), 0 )
		f7_local14:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 83, _1080p * 1043, _1080p * 54, _1080p * 134 )
		self:addElement( f7_local14 )
		self.CPMenuTitle = f7_local14
	end
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f7_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 774.5, _1080p * 794.5, _1080p * 759, _1080p * 799 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f7_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 609.5, _1080p * 629.5, _1080p * 758, _1080p * 798 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 451, _1080p * 951, _1080p * 766, _1080p * 790 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f7_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.5, _1080p * 1919.5, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f7_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 140, _1080p * 451, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f7_local4:RegisterAnimationSequence( "CPSpinner", {
				{
					function ()
						return self.Spinner:SetZRotation( 0, 0 )
					end,
					function ()
						return self.Spinner:SetZRotation( -360, 25000 )
					end
				}
			} )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			f7_local5:RegisterAnimationSequence( "CPSpinner", {
				{
					function ()
						return self.RedGlow:SetAlpha( 0, 0 )
					end,
					function ()
						return self.RedGlow:SetAlpha( 1, 500 )
					end,
					function ()
						return self.RedGlow:SetAlpha( 0.8, 2500 )
					end,
					function ()
						return self.RedGlow:SetAlpha( 0.8, 19000 )
					end,
					function ()
						return self.RedGlow:SetAlpha( 0, 3000 )
					end
				}
			} )
		end
		self._sequences.CPSpinner = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f7_local4:AnimateLoop( "CPSpinner" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f7_local5:AnimateLoop( "CPSpinner" )
			end
		end
		
		Tabs:RegisterAnimationSequence( "CPTabHeight", {
			{
				function ()
					return self.Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 139, _1080p * 101, 0 )
				end
			}
		} )
		self._sequences.CPTabHeight = function ()
			Tabs:AnimateSequence( "CPTabHeight" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f7_local20 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = VerticalScrollbar0,
		startCap = VerticalScrollbar0.startCap,
		endCap = VerticalScrollbar0.endCap
	}
	local f7_local22 = VerticalScrollbar0.sliderArea
	if f7_local22 then
		f7_local22 = VerticalScrollbar0.sliderArea.slider
	end
	bindButton.slider = f7_local22
	f7_local22 = VerticalScrollbar0.sliderArea
	if f7_local22 then
		f7_local22 = VerticalScrollbar0.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f7_local22
	ChallengeInfoGrid:AddScrollbar( f7_local20( bindButton ) )
	ChallengeInfoGrid:AddArrow( ArrowUp )
	ChallengeInfoGrid:AddArrow( ArrowDown )
	ChallengeInfoGrid:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f21_arg0, f21_arg1 )
		f21_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f22_arg0, f22_arg1 )
		local f22_local0 = f22_arg1.controller or f7_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f7_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPSpinner" )
		ACTIONS.AnimateSequence( self, "CPTabHeight" )
	end
	return self
end

MenuBuilder.registerType( "ChallengesMenu", ChallengesMenu )
LUI.FlowManager.RegisterStackPopBehaviour( "ChallengesMenu", f0_local2 )
LockTable( _M )
