local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.conquest.Headquarters.callingCard"
f0_local1 = "frontEnd.MP.challenges"
function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
	WipeGlobalModelsAtPath( f0_local1 )
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	WipeGlobalModelsAtPath( f0_local0 )
	WipeGlobalModelsAtPath( f0_local1 )
	assert( f2_arg2.cardCategoryRef )
	local f2_local0 = {}
	for f2_local1 = 0, Engine.TableGetRowCount( CSV.callingCards.file ) - 1, 1 do
		if CallingCardUtils.GetCardChallengeCategoryRefByCardID( CallingCardUtils.GetCardIDByRow( f2_local1 ), f2_arg1 ) == f2_arg2.cardCategoryRef then
			local f2_local4 = CallingCardUtils.GetCallingCardDataSources( f0_local0 .. ".card" .. f2_local1, CallingCardUtils.GetCardIDByRow( f2_local1 ) )
			if f2_local4 ~= nil then
				table.insert( f2_local0, f2_local4 )
			end
		end
	end
	local f2_local1 = {}
	for f2_local2 = 1, #f2_local0, 1 do
		local f2_local4 = f2_local0[f2_local2]
		local f2_local6 = CallingCardUtils.GetCardChallengeSubCategoryRef( f2_local4, f2_arg1 )
		if f2_local6 == nil or f2_local6 == "" then
			f2_local1 = {}
			if f2_local2 > 1 then
				DebugPrint( "ERROR - in callingCards.csv, playercard idx [" .. f2_local4.index:GetValue( f2_arg1 ) .. "] is in a category with subcategories, but is missing it's subcategory. Please add a value to the subcategory column." )
				break
			end
		elseif not f2_local1[f2_local6] then
			f2_local1[f2_local6] = {
				f2_local4
			}
		else
			table.insert( f2_local1[f2_local6], f2_local4 )
		end
	end
	assert( f2_arg0.SubCategoryTabs )
	local f2_local2 = CountTableKeys( f2_local1 )
	if f2_local2 ~= 0 then
		local f2_local3 = {}
		local f2_local5 = LUI.DataSourceFromList.new( f2_local2 )
		f2_local5.MakeDataSourceAtIndex = function ( f3_arg0, f3_arg1 )
			return f2_local3[f3_arg1 + 1]
		end
		
		f2_local5.GetDefaultFocusIndex = function ()
			return 0
		end
		
		for f2_local8, f2_local9 in pairs( f2_local1 ) do
			local f2_local10 = CallingCardUtils.BuildChallengeEntriesDataSources( CallingCardUtils.GetCardChallengeSubCategoryRef( f2_local9[1], f2_arg1 ), f0_local1, false, f2_arg1 )
			table.insert( f2_local3, {
				name = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".tabs." .. f2_local8, CallingCardUtils.GetChallengeSubcatName( f2_local8 ) ),
				focusFunction = function ( f5_arg0, f5_arg1, f5_arg2 )
					SetCallingCardsGridSource( f2_arg0, f2_local9, f2_local10, f5_arg1 )
				end,
				cards = f2_local9
			} )
		end
		table.sort( f2_local3, function ( f6_arg0, f6_arg1 )
			return f6_arg0.name:GetValue( f2_arg1 ) < f6_arg1.name:GetValue( f2_arg1 )
		end )
		f2_arg0.SubCategoryTabs:SetAlpha( 1, 0 )
		f2_arg0.SubCategoryTabs:AddBacker()
		f2_arg0.SubCategoryTabs:ShowTabs()
		f2_arg0.SubCategoryTabs:SetTabManagerDataSource( f2_local5 )
	else
		f2_arg0.SubCategoryTabs:SetAlpha( 0, 0 )
		f2_arg0.SubCategoryTabs:HideTabs()
		SetCallingCardsGridSource( f2_arg0, f2_local0, nil, f2_arg1 )
	end
	if not CONDITIONS.IsThirdGameMode() then
		if #f2_local0 > 1 then
			f2_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( f2_local0[1].category:GetValue( f2_arg1 ) ), 0 )
		else
			f2_arg0.MenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_MP_CALLING_CARD" ), 0 )
		end
		f2_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ), 0 ) )
	end
end

function SetCallingCardsGridSource( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
	local f7_local0 = {}
	local f7_local1 = nil
	Engine.SaveCurrentSPMissions( f7_arg3 )
	for f7_local2 = 1, #f7_arg1, 1 do
		local f7_local5 = f7_arg1[f7_local2]
		if f7_arg2 then
			for f7_local6 = 0, f7_arg2.entries:GetCountValue( f7_arg3 ) - 1, 1 do
				local f7_local9 = f7_arg2.entries:GetDataSourceAtIndex( f7_local6, f7_arg3 )
				if f7_local9.ref:GetValue( f7_arg3 ) == f7_local5.challenge:GetValue( f7_arg3 ) then
					f7_local5.challengeInfo = f7_local9
				end
			end
		else
			local f7_local6 = f0_local1 .. ".current.noChallenge." .. f7_local2
			local f7_local7 = true
			local f7_local8 = Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, f7_local5.index:GetValue( f7_arg3 ), CSV.callingCards.cols.unlockID )
			if f7_local8 and #f7_local8 > 0 then
				f7_local7 = Engine.IsUnlocked( f7_arg3, "callingCard", f7_local8, true )
			else
				local f7_local10 = Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, f7_local5.index:GetValue( f7_arg3 ), CSV.callingCards.cols.lootID )
				if f7_local10 ~= "" and Loot.IsOwned( f7_arg3, tonumber( f7_local10 ) ) == 0 then
					f7_local7 = false
				end
			end
			local f7_local10 = {
				name = LUI.DataSourceInGlobalModel.new( f7_local6 .. ".name", Engine.TableLookup( CSV.callingCards.file, CSV.callingCards.cols.index, f7_local5.index:GetValue( f7_arg3 ), CSV.callingCards.cols.cardName ) ),
				desc = LUI.DataSourceInGlobalModel.new( f7_local6 .. ".desc", "" ),
				ref = LUI.DataSourceInGlobalModel.new( f7_local6 .. ".ref", "" ),
				tierCount = LUI.DataSourceInGlobalModel.new( f7_local6 .. ".tierCount" ),
				isCompleted = LUI.DataSourceInGlobalModel.new( f7_local6 .. ".isCompleted", f7_local7 )
			}
			local f7_local9 = LUI.DataSourceInGlobalModel.new
			local f7_local11 = f7_local6 .. ".isCompletedAlpha"
			local f7_local12
			if f7_local7 then
				f7_local12 = 1
				if not f7_local12 then
				
				else
					f7_local10.isCompletedAlpha = f7_local9( f7_local11, f7_local12 )
					f7_local10.currentTier = LUI.DataSourceInGlobalModel.new( f7_local6 .. ".currentTier", 0 )
					f7_local10.currentTierLabel = LUI.DataSourceInGlobalModel.new( f7_local6 .. ".currentTierLabel", "" )
					f7_local10.currentProgress = LUI.DataSourceInGlobalModel.new( f7_local6 .. ".currentProgress", 0 )
					f7_local10.currentProgressPercent = LUI.DataSourceInGlobalModel.new( f7_local6 .. ".currentProgressPercent", 0 )
					f7_local10.currentTierMax = LUI.DataSourceInGlobalModel.new( f7_local6 .. ".currentTierMax", 0 )
					f7_local10.currentTierXP = LUI.DataSourceInGlobalModel.new( f7_local6 .. ".currentTierXP", 0 )
					f7_local10.currentTierScore = LUI.DataSourceInGlobalModel.new( f7_local6 .. ".currentTierScore", 0 )
					f7_local10.isSecretZombiesMerit = LUI.DataSourceInGlobalModel.new( f7_local6 .. ".isSecretZombiesMerit", false )
					f7_local5.challengeInfo = f7_local10
				end
			end
			f7_local12 = 0
		end
		local f7_local6 = f7_local5.hideIfLocked:GetValue( f7_arg3 )
		if not f7_local6 or f7_local6 and f7_local5.challengeInfo.isCompleted:GetValue( f7_arg3 ) then
			local f7_local7 = f7_local5.isMasterCard:GetValue( f7_arg3 )
			if f7_local7 == nil or f7_local7 ~= "TRUE" then
				table.insert( f7_local0, f7_local5 )
			else
				f7_local1 = f7_local5
			end
		end
	end
	if f7_local1 then
		table.insert( f7_local0, f7_local1 )
	end
	local f7_local2 = LUI.DataSourceFromList.new( #f7_local0 )
	f7_local2.MakeDataSourceAtIndex = function ( f8_arg0, f8_arg1, f8_arg2 )
		return f7_local0[f8_arg1 + 1]
	end
	
	f7_local2.GetDefaultFocusIndex = function ()
		return 0
	end
	
	local f7_local3 = CONDITIONS.IsThirdGameMode( f7_arg0 ) and f7_arg0.CallingCardsGridCP or f7_arg0.CallingCardsGrid
	assert( f7_local3 )
	f7_local3:SetGridDataSource( f7_local2, f7_arg3 )
	f7_arg0.CallingCardChallengeInfo:SetDataSourceThroughElement( f7_local3, nil )
	if #f7_local0 <= 16 then
		f7_arg0.ArrowUp:SetAlpha( 0, 0 )
		f7_arg0.ArrowDown:SetAlpha( 0, 0 )
		f7_arg0.ListCount:SetAlpha( 0, 0 )
	end
	if Engine.IsCoreMode() then
		local self = LUI.UIElement.new( {
			worldBlur = 5
		} )
		self:setupWorldBlur()
		self.id = "blur"
		f7_arg0:addElement( self )
	end
end

function CallingCardSelectionMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "CallingCardSelectionMenu"
	self._animationSets = {}
	self._sequences = {}
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	self:playSound( "menu_open" )
	local f10_local2 = self
	local f10_local3 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f10_local3 = LUI.UIImage.new()
		f10_local3.id = "Spinner"
		f10_local3:SetAlpha( 0.4, 0 )
		f10_local3:SetScale( -0.28, 0 )
		f10_local3:setImage( RegisterMaterial( "zm_tix_arcane_spinner" ), 0 )
		f10_local3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 872.58, _1080p * 2090, _1080p * -116.5, _1080p * 1100.92 )
		self:addElement( f10_local3 )
		self.Spinner = f10_local3
	end
	local f10_local4 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f10_local4 = LUI.UIImage.new()
		f10_local4.id = "RedGlow"
		f10_local4:SetAlpha( 0.8, 0 )
		f10_local4:SetScale( -0.28, 0 )
		f10_local4:setImage( RegisterMaterial( "cp_menu_pause_red_glow" ), 0 )
		f10_local4:SetBlendMode( BLEND_MODE.addWithAlpha )
		f10_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 934.58, _1080p * 2028, _1080p * -45, _1080p * 1048.42 )
		self:addElement( f10_local4 )
		self.RedGlow = f10_local4
	end
	local MainBG = nil
	
	MainBG = LUI.UIImage.new()
	MainBG.id = "MainBG"
	MainBG:SetAlpha( 0.3, 0 )
	MainBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -879, _1080p * 878, _1080p * -323, _1080p * 401 )
	self:addElement( MainBG )
	self.MainBG = MainBG
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f10_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local f10_local7 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f10_local7 = LUI.UIDataSourceGrid.new( nil, {
			maxVisibleColumns = 4,
			maxVisibleRows = 4,
			controllerIndex = f10_local1,
			buildChild = function ()
				return MenuBuilder.BuildRegisteredType( "CallingCardSelectionButton", {
					controllerIndex = f10_local1
				} )
			end,
			wrapX = false,
			wrapY = true,
			primaryAxis = LUI.DIRECTION.horizontal,
			spacingX = _1080p * 11,
			spacingY = _1080p * 11,
			columnWidth = _1080p * 294,
			rowHeight = _1080p * 171,
			scrollingThresholdX = 0,
			scrollingThresholdY = 1,
			adjustSizeToContent = false,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top,
			springCoefficient = 400,
			maxVelocity = 5000
		} )
		f10_local7.id = "CallingCardsGrid"
		f10_local7:setUseStencil( true )
		f10_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 84, _1080p * 1293, _1080p * 221, _1080p * 938 )
		self:addElement( f10_local7 )
		self.CallingCardsGrid = f10_local7
	end
	local f10_local8 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f10_local8 = LUI.UIDataSourceGrid.new( nil, {
			maxVisibleColumns = 4,
			maxVisibleRows = 4,
			controllerIndex = f10_local1,
			buildChild = function ()
				return MenuBuilder.BuildRegisteredType( "CallingCardSelectionButtonCP", {
					controllerIndex = f10_local1
				} )
			end,
			wrapX = false,
			wrapY = true,
			primaryAxis = LUI.DIRECTION.horizontal,
			spacingX = _1080p * 11,
			spacingY = _1080p * 11,
			columnWidth = _1080p * 294,
			rowHeight = _1080p * 171,
			scrollingThresholdX = 0,
			scrollingThresholdY = 1,
			adjustSizeToContent = false,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top,
			springCoefficient = 400,
			maxVelocity = 5000
		} )
		f10_local8.id = "CallingCardsGridCP"
		f10_local8:setUseStencil( true )
		f10_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 84, _1080p * 1293, _1080p * 221, _1080p * 938 )
		self:addElement( f10_local8 )
		self.CallingCardsGridCP = f10_local8
	end
	local f10_local9 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f10_local9 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f10_local1
		} )
		f10_local9.id = "MenuTitle"
		f10_local9.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_CALLING_CARD" ) ), 0 )
		f10_local9.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
		f10_local9.Icon:SetTop( _1080p * -28.5, 0 )
		f10_local9.Icon:SetBottom( _1080p * 61.5, 0 )
		f10_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f10_local9 )
		self.MenuTitle = f10_local9
	end
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f10_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 774.5, _1080p * 794.5, _1080p * 935, _1080p * 975 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f10_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 609.5, _1080p * 629.5, _1080p * 934, _1080p * 974 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 629.5, _1080p * 774.5, _1080p * 942, _1080p * 966 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local SubCategoryTabs = nil
	
	SubCategoryTabs = LUI.TabManager.new( nil, {
		tabHeight = _1080p * 30,
		wrap = false,
		spacing = 2,
		buildTab = function ()
			return MenuBuilder.BuildRegisteredType( "CallingCardTab", {
				controllerIndex = f10_local1
			} )
		end,
		buildSpacer = function ()
			return MenuBuilder.BuildRegisteredType( "TabsSpacer", {
				controllerIndex = f10_local1
			} )
		end,
		controllerIndex = f10_local1
	} )
	SubCategoryTabs.id = "SubCategoryTabs"
	SubCategoryTabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 175 )
	self:addElement( SubCategoryTabs )
	self.SubCategoryTabs = SubCategoryTabs
	
	local MissionTeamInfo = nil
	
	MissionTeamInfo = MenuBuilder.BuildRegisteredType( "MissionTeamInfo", {
		controllerIndex = f10_local1
	} )
	MissionTeamInfo.id = "MissionTeamInfo"
	MissionTeamInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, 0, _1080p * 54, _1080p * 141 )
	self:addElement( MissionTeamInfo )
	self.MissionTeamInfo = MissionTeamInfo
	
	local CallingCardChallengeInfo = nil
	
	CallingCardChallengeInfo = MenuBuilder.BuildRegisteredType( "CallingCardChallengeInfo", {
		controllerIndex = f10_local1
	} )
	CallingCardChallengeInfo.id = "CallingCardChallengeInfo"
	CallingCardChallengeInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -606, _1080p * -86, _1080p * 220, _1080p * 937.5 )
	self:addElement( CallingCardChallengeInfo )
	self.CallingCardChallengeInfo = CallingCardChallengeInfo
	
	local f10_local16 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f10_local16 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f10_local1
		} )
		f10_local16.id = "CPMenuTitle"
		f10_local16.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_CALLING_CARD" ) ), 0 )
		f10_local16:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 83, _1080p * 1043, _1080p * 54, _1080p * 134 )
		self:addElement( f10_local16 )
		self.CPMenuTitle = f10_local16
	end
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f10_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.5, _1080p * 1919.5, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f10_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.MenuOn = function ()
			
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f10_local3:RegisterAnimationSequence( "CPSpinner", {
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
			f10_local4:RegisterAnimationSequence( "CPSpinner", {
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
				f10_local3:AnimateLoop( "CPSpinner" )
			end
			if CONDITIONS.IsThirdGameMode( self ) then
				f10_local4:AnimateLoop( "CPSpinner" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if not CONDITIONS.IsThirdGameMode( self ) then
		f10_local7:AddArrow( ArrowUp )
		f10_local7:AddArrow( ArrowDown )
	end
	if not CONDITIONS.IsThirdGameMode( self ) then
		f10_local7:AddItemNumbers( ListCount )
	end
	if CONDITIONS.IsThirdGameMode( self ) then
		f10_local8:AddArrow( ArrowUp )
		f10_local8:AddArrow( ArrowDown )
	end
	if CONDITIONS.IsThirdGameMode( self ) then
		f10_local8:AddItemNumbers( ListCount )
	end
	self.addButtonHelperFunction = function ( f26_arg0, f26_arg1 )
		f26_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f26_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f27_arg0, f27_arg1 )
		local f27_local0 = f27_arg1.controller or f10_local1
		ACTIONS.LeaveMenu( self )
	end )
	self:addEventHandler( "menu_create", function ( f28_arg0, f28_arg1 )
		local f28_local0 = f28_arg1.controller or f10_local1
		ACTIONS.AnimateSequence( self, "MenuOn" )
	end )
	PostLoadFunc( self, f10_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPSpinner" )
	end
	return self
end

MenuBuilder.registerType( "CallingCardSelectionMenu", CallingCardSelectionMenu )
LUI.FlowManager.RegisterStackPopBehaviour( "CallingCardSelectionMenu", PopFunc )
LockTable( _M )
