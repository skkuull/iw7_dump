local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.conquest.missionTeamSelect"
function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
end

function HighlightTeam( f2_arg0, f2_arg1 )
	local f2_local0 = 200
	if f2_arg1 == 0 then
		f2_arg0.MissionTeamCursor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 933, _1080p * 1061, _1080p * 302, _1080p * 430, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineN:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 36.5, _1080p * 37.5, 0, _1080p * 302, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineS:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 36.5, _1080p * 37.5, _1080p * -650, 0, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineE:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -859, 0, _1080p * -174.5, _1080p * -173.5, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineW:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 933, _1080p * -174.5, _1080p * -173.5, f2_local0, LUI.EASING.outQuadratic )
	elseif f2_arg1 == 1 then
		f2_arg0.MissionTeamCursor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 739, _1080p * 867, _1080p * 463, _1080p * 591, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineN:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -157.5, _1080p * -156.5, 0, _1080p * 463, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineS:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -157.5, _1080p * -156.5, _1080p * -489, 0, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineE:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -1053, 0, _1080p * -13.5, _1080p * -12.5, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineW:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 739, _1080p * -13.5, _1080p * -12.5, f2_local0, LUI.EASING.outQuadratic )
	elseif f2_arg1 == 2 then
		f2_arg0.MissionTeamCursor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1195, _1080p * 1323, _1080p * 211, _1080p * 339, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineN:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 298.5, _1080p * 299.5, 0, _1080p * 211, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineS:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 298.5, _1080p * 299.5, _1080p * -741, 0, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineE:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -597, 0, _1080p * -265.5, _1080p * -264.5, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineW:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 1195, _1080p * -265.5, _1080p * -264.5, f2_local0, LUI.EASING.outQuadratic )
	elseif f2_arg1 == 3 then
		f2_arg0.MissionTeamCursor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1161, _1080p * 1289, _1080p * 302, _1080p * 430, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineN:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 264.5, _1080p * 265.5, 0, _1080p * 302, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineS:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 264.5, _1080p * 265.5, _1080p * -650, 0, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineE:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -631, 0, _1080p * -174.5, _1080p * -173.5, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineW:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 1161, _1080p * -174.5, _1080p * -173.5, f2_local0, LUI.EASING.outQuadratic )
	elseif f2_arg1 == 4 then
		f2_arg0.MissionTeamCursor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1097, _1080p * 1225, _1080p * 277, _1080p * 405, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineN:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 200.5, _1080p * 201.5, 0, _1080p * 277, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineS:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 200.5, _1080p * 201.5, _1080p * -675, 0, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineE:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -695, 0, _1080p * -199.5, _1080p * -198.5, f2_local0, LUI.EASING.outQuadratic )
		f2_arg0.CursorLineW:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 1097, _1080p * -199.5, _1080p * -198.5, f2_local0, LUI.EASING.outQuadratic )
	end
	ACTIONS.AnimateSequenceByElement( f2_arg0, {
		elementName = "MissionTeamCursor",
		sequenceName = "Update",
		elementPath = "MissionTeamCursor"
	} )
end

function PostLoadFunc( f3_arg0, f3_arg1 )
	WipeGlobalModelsAtPath( f0_local0 )
	local f3_local0 = {}
	for f3_local1 = 0, Engine.TableGetRowCount( CSV.missionTeams.file ) - 1, 1 do
		local f3_local4 = Engine.TableLookup( CSV.missionTeams.file, CSV.missionTeams.cols.index, f3_local1, CSV.missionTeams.cols.killswitch )
		if #f3_local4 == 0 or Engine.GetDvarBool( f3_local4 ) == false then
			local f3_local5 = MissionDirector.GetMissionTeamDataSources( f3_arg1, f0_local0 .. ".missionTeams." .. f3_local1, f3_local1 )
			f3_local5.missions = MissionDirector.GetMissionDataSourcesForTeam( f0_local0, f3_local1, f3_arg1 )
			table.insert( f3_local0, f3_local5 )
		end
	end
	local f3_local1 = LUI.DataSourceFromList.new( #f3_local0 )
	f3_local1.MakeDataSourceAtIndex = function ( f4_arg0, f4_arg1, f4_arg2 )
		return f3_local0[f4_arg1 + 1]
	end
	
	f3_local1.GetDefaultFocusIndex = function ()
		return MissionDirector.GetActiveMissionTeam( f3_arg1 )
	end
	
	assert( f3_arg0.MissionTeamsList )
	f3_arg0.MissionTeamsList:SetGridDataSource( f3_local1, f3_arg1 )
	local f3_local3 = MissionDirector.GetMissionTeamDataSources( f3_arg1, f0_local0 .. ".missionTeamInfo", 0 )
	assert( f3_arg0.MissionTeamCursor )
	assert( f3_arg0.MissionTeamDetails )
	f3_arg0.MissionTeamCursor:SetDataSourceThroughElement( f3_arg0.MissionTeamsList, nil )
	f3_arg0.MissionTeamDetails:SetDataSourceThroughElement( f3_arg0.MissionTeamsList, nil )
	f3_arg0.MissionTeamDetails.MissionGrid:SetDataSourceThroughElement( f3_arg0.MissionTeamsList )
	f3_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BREADCRUMB_2_ITEMS", "MENU_MULTIPLAYER", "LUA_MENU_PUBLIC_MATCH_CAPS" ), 0 ) )
	for f3_local6 = 0, #f3_local0 - 1, 1 do
		local f3_local5 = f3_local6
		local f3_local8 = f3_arg0.MissionTeamsList:GetElementAtPosition( 0, f3_local5 )
		assert( f3_arg0.CursorLineN )
		assert( f3_arg0.CursorLineS )
		assert( f3_arg0.CursorLineE )
		assert( f3_arg0.CursorLineW )
		f3_local8:setGainFocusSFX( CoD.SFX.MissionTeamMouseOver )
		f3_local8:addEventHandler( "gain_focus", function ( f6_arg0, f6_arg1 )
			HighlightTeam( f3_arg0, f3_local5 )
		end )
	end
	assert( f3_arg0.Bink )
	f3_arg0.Bink:setImage( RegisterMaterial( "cinematic" ), 0 )
	f3_arg0.Bink:SetAlpha( 0 )
	local f3_local6 = 250
	f3_arg0.Fade:SetAlpha( 1, f3_local6 )
	local f3_local4 = f3_arg0:Wait( f3_local6 )
	f3_local4.onComplete = function ()
		Engine.PlayMenuVideo( "mp_missionTeamBG_bloodforge", VideoPlaybackFlags.LOOP )
		local f7_local0 = f3_arg0:Wait( 150 )
		f7_local0.onComplete = function ()
			if not f3_arg0.disableAllInputForMenu then
				f3_arg0.Fade:SetAlpha( 0, 100 )
				f3_arg0.Bink:SetAlpha( 1 )
			end
		end
		
	end
	
	f3_arg0.disableAllInputForMenu = false
	f3_arg0:registerEventHandler( "gamepad_button", function ( element, event )
		return element.disableAllInputForMenu
	end )
	f3_arg0.LeaveMenu = function ( f10_arg0, f10_arg1 )
		if f10_arg0.disableAllInputForMenu then
			return 
		else
			f10_arg0.disableAllInputForMenu = true
			local f10_local0 = MissionDirector.GetActiveMissionTeam( f3_arg1 )
			local f10_local1 = function ()
				Engine.PlayMenuVideo( MissionDirector.GetMissionTeamMovie( f10_local0 ), VideoPlaybackFlags.LOOP )
				local f11_local0 = f10_arg1 and 500 or 350
				f10_arg0.MissionTeamDetails:SetAlpha( 0, f11_local0 )
				f10_arg0.MenuTitle:SetAlpha( 0, f11_local0 )
				f10_arg0.MissionTeamsList:SetAlpha( 0, f11_local0 )
				local f11_local1 = f10_arg0:Wait( f11_local0 )
				f11_local1.onComplete = function ()
					f10_arg0.disableAllInputForMenu = false
					LUI.FlowManager.RequestLeaveMenu( f10_arg0, false )
				end
				
			end
			
			f10_arg0.Fade:SetAlpha( 1, 150 )
			local f10_local2 = f10_arg0:Wait( 150 )
			f10_local2.onComplete = function ()
				f10_arg0.Bink:SetAlpha( 0 )
				FrontEndScene.CurrentMissionTeam = f10_local0
				FrontEndScene.SetScene( "mission_team_lobby" )
				if f10_arg1 then
					MissionDirector.PlayMissionTeamVideo( f10_local0, f3_arg1, true, f10_local1 )
					f10_arg0.Fade:SetAlpha( 1 )
					f10_arg0.MissionTeamDetails:SetAlpha( 0 )
					f10_arg0.MenuTitle:SetAlpha( 0 )
					f10_arg0.MissionTeamsList:SetAlpha( 0 )
					f10_arg0.SocialFeed:SetAlpha( 0 )
					f10_arg0.ButtonHelperBar:SetAlpha( 0 )
				else
					f10_local1()
				end
			end
			
		end
	end
	
	f3_arg0.bindButton:addEventHandler( "button_secondary", function ( f14_arg0, f14_arg1 )
		if not f3_arg0.disableAllInputForMenu then
			f3_arg0:LeaveMenu()
		end
		return true
	end )
	f3_arg0.bindButton:addEventHandler( "button_alt1", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f3_arg0.MissionTeamsList:GetElementAtPosition( 0, f3_arg0.MissionTeamsList:GetFocusPositionIndex() )
		f15_local0 = f15_local0:GetDataSource()
		local f15_local1 = not f15_local0.disabled:GetValue( f3_arg1 )
		local f15_local2 = f15_local0.teamID:GetValue( f3_arg1 )
		local f15_local3 = MissionDirector.HasEverBeenMember( f15_local2, f3_arg1 )
		local f15_local4 = function ()
			f3_arg0.disableAllInputForMenu = false
			Engine.PlayMenuVideo( "mp_missionTeamBG", VideoPlaybackFlags.LOOP )
			local f16_local0 = f3_arg0:Wait( 150 )
			f16_local0.onComplete = function ()
				f3_arg0.Fade:SetAlpha( 0, 100 )
				f3_arg0.Bink:SetAlpha( 1 )
			end
			
		end
		
		if f15_local3 and f15_local1 then
			f3_arg0.disableAllInputForMenu = true
			f3_arg0.Fade:SetAlpha( 1, 250 )
			local f15_local5 = f3_arg0:Wait( 250 )
			f15_local5.onComplete = function ()
				MissionDirector.PlayMissionTeamVideo( f15_local2, f3_arg1, true, f15_local4 )
			end
			
		end
	end )
end

function MissionTeamSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "MissionTeamSelect"
	self._animationSets = {}
	self._sequences = {}
	local f19_local1 = controller and controller.controllerIndex
	if not f19_local1 and not Engine.InFrontend() then
		f19_local1 = self:getRootController()
	end
	assert( f19_local1 )
	self:playSound( "menu_open" )
	local f19_local2 = self
	local Bink = nil
	
	Bink = LUI.UIImage.new()
	Bink.id = "Bink"
	self:addElement( Bink )
	self.Bink = Bink
	
	local CursorLineN = nil
	
	CursorLineN = LUI.UIImage.new()
	CursorLineN.id = "CursorLineN"
	CursorLineN:SetAlpha( 0.15, 0 )
	CursorLineN:SetBlendMode( BLEND_MODE.addWithAlpha )
	CursorLineN:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -156.5, _1080p * -155.5, 0, _1080p * 464 )
	self:addElement( CursorLineN )
	self.CursorLineN = CursorLineN
	
	local CursorLineS = nil
	
	CursorLineS = LUI.UIImage.new()
	CursorLineS.id = "CursorLineS"
	CursorLineS:SetAlpha( 0.15, 0 )
	CursorLineS:SetBlendMode( BLEND_MODE.addWithAlpha )
	CursorLineS:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -156.5, _1080p * -155.5, _1080p * -488, 0 )
	self:addElement( CursorLineS )
	self.CursorLineS = CursorLineS
	
	local CursorLineE = nil
	
	CursorLineE = LUI.UIImage.new()
	CursorLineE.id = "CursorLineE"
	CursorLineE:SetAlpha( 0.15, 0 )
	CursorLineE:SetBlendMode( BLEND_MODE.addWithAlpha )
	CursorLineE:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -1052, 0, _1080p * -12.5, _1080p * -11.5 )
	self:addElement( CursorLineE )
	self.CursorLineE = CursorLineE
	
	local CursorLineW = nil
	
	CursorLineW = LUI.UIImage.new()
	CursorLineW.id = "CursorLineW"
	CursorLineW:SetAlpha( 0.15, 0 )
	CursorLineW:SetBlendMode( BLEND_MODE.addWithAlpha )
	CursorLineW:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 740, _1080p * -12.5, _1080p * -11.5 )
	self:addElement( CursorLineW )
	self.CursorLineW = CursorLineW
	
	local MissionTeamCursor = nil
	
	MissionTeamCursor = MenuBuilder.BuildRegisteredType( "MissionTeamCursor", {
		controllerIndex = f19_local1
	} )
	MissionTeamCursor.id = "MissionTeamCursor"
	MissionTeamCursor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 740, _1080p * 868, _1080p * 464, _1080p * 592 )
	self:addElement( MissionTeamCursor )
	self.MissionTeamCursor = MissionTeamCursor
	
	local Fade = nil
	
	Fade = LUI.UIImage.new()
	Fade.id = "Fade"
	Fade:SetRGBFromInt( 855309, 0 )
	self:addElement( Fade )
	self.Fade = Fade
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f19_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f19_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local MissionTeamsList = nil
	
	MissionTeamsList = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		controllerIndex = f19_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "MissionTeamSelectButton", {
				controllerIndex = f19_local1
			} )
		end,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 285,
		rowHeight = _1080p * 96,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	MissionTeamsList.id = "MissionTeamsList"
	MissionTeamsList:setUseStencil( false )
	MissionTeamsList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 415, _1080p * 186, _1080p * 682 )
	self:addElement( MissionTeamsList )
	self.MissionTeamsList = MissionTeamsList
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f19_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_MISSION_TEAMS" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local MissionTeamDetails = nil
	
	MissionTeamDetails = MenuBuilder.BuildRegisteredType( "MissionTeamDetails", {
		controllerIndex = f19_local1
	} )
	MissionTeamDetails.id = "MissionTeamDetails"
	MissionTeamDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1790, _1080p * 719, _1080p * 924 )
	self:addElement( MissionTeamDetails )
	self.MissionTeamDetails = MissionTeamDetails
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CursorLineN:RegisterAnimationSequence( "Wolverines", {
			{
				function ()
					return self.CursorLineN:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 36.5, _1080p * 37.5, 0, _1080p * 302, 0 )
				end
			}
		} )
		CursorLineS:RegisterAnimationSequence( "Wolverines", {
			{
				function ()
					return self.CursorLineS:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 36.5, _1080p * 37.5, _1080p * -650, 0, 0 )
				end
			}
		} )
		CursorLineE:RegisterAnimationSequence( "Wolverines", {
			{
				function ()
					return self.CursorLineE:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -859, 0, _1080p * -174.5, _1080p * -173.5, 0 )
				end
			}
		} )
		CursorLineW:RegisterAnimationSequence( "Wolverines", {
			{
				function ()
					return self.CursorLineW:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 933, _1080p * -174.5, _1080p * -173.5, 0 )
				end
			}
		} )
		MissionTeamCursor:RegisterAnimationSequence( "Wolverines", {
			{
				function ()
					return self.MissionTeamCursor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 933, _1080p * 1061, _1080p * 302, _1080p * 430, 0 )
				end
			}
		} )
		self._sequences.Wolverines = function ()
			CursorLineN:AnimateSequence( "Wolverines" )
			CursorLineS:AnimateSequence( "Wolverines" )
			CursorLineE:AnimateSequence( "Wolverines" )
			CursorLineW:AnimateSequence( "Wolverines" )
			MissionTeamCursor:AnimateSequence( "Wolverines" )
		end
		
		CursorLineN:RegisterAnimationSequence( "Orion", {
			{
				function ()
					return self.CursorLineN:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -157.5, _1080p * -156.5, 0, _1080p * 463, 0 )
				end
			}
		} )
		CursorLineS:RegisterAnimationSequence( "Orion", {
			{
				function ()
					return self.CursorLineS:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -157.5, _1080p * -156.5, _1080p * -489, 0, 0 )
				end
			}
		} )
		CursorLineE:RegisterAnimationSequence( "Orion", {
			{
				function ()
					return self.CursorLineE:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -1053, 0, _1080p * -13.5, _1080p * -12.5, 0 )
				end
			}
		} )
		CursorLineW:RegisterAnimationSequence( "Orion", {
			{
				function ()
					return self.CursorLineW:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 739, _1080p * -13.5, _1080p * -12.5, 0 )
				end
			}
		} )
		MissionTeamCursor:RegisterAnimationSequence( "Orion", {
			{
				function ()
					return self.MissionTeamCursor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 739, _1080p * 867, _1080p * 463, _1080p * 591, 0 )
				end
			}
		} )
		self._sequences.Orion = function ()
			CursorLineN:AnimateSequence( "Orion" )
			CursorLineS:AnimateSequence( "Orion" )
			CursorLineE:AnimateSequence( "Orion" )
			CursorLineW:AnimateSequence( "Orion" )
			MissionTeamCursor:AnimateSequence( "Orion" )
		end
		
		CursorLineN:RegisterAnimationSequence( "Wraith", {
			{
				function ()
					return self.CursorLineN:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 264.5, _1080p * 265.5, 0, _1080p * 302, 0 )
				end
			}
		} )
		CursorLineS:RegisterAnimationSequence( "Wraith", {
			{
				function ()
					return self.CursorLineS:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 264.5, _1080p * 265.5, _1080p * -650, 0, 0 )
				end
			}
		} )
		CursorLineE:RegisterAnimationSequence( "Wraith", {
			{
				function ()
					return self.CursorLineE:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -631, 0, _1080p * -174.5, _1080p * -173.5, 0 )
				end
			}
		} )
		CursorLineW:RegisterAnimationSequence( "Wraith", {
			{
				function ()
					return self.CursorLineW:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 1161, _1080p * -174.5, _1080p * -173.5, 0 )
				end
			}
		} )
		MissionTeamCursor:RegisterAnimationSequence( "Wraith", {
			{
				function ()
					return self.MissionTeamCursor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1161, _1080p * 1289, _1080p * 302, _1080p * 430, 0 )
				end
			}
		} )
		self._sequences.Wraith = function ()
			CursorLineN:AnimateSequence( "Wraith" )
			CursorLineS:AnimateSequence( "Wraith" )
			CursorLineE:AnimateSequence( "Wraith" )
			CursorLineW:AnimateSequence( "Wraith" )
			MissionTeamCursor:AnimateSequence( "Wraith" )
		end
		
		CursorLineN:RegisterAnimationSequence( "Sabre", {
			{
				function ()
					return self.CursorLineN:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 298.5, _1080p * 299.5, 0, _1080p * 211, 0 )
				end
			}
		} )
		CursorLineS:RegisterAnimationSequence( "Sabre", {
			{
				function ()
					return self.CursorLineS:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 298.5, _1080p * 299.5, _1080p * -741, 0, 0 )
				end
			}
		} )
		CursorLineE:RegisterAnimationSequence( "Sabre", {
			{
				function ()
					return self.CursorLineE:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -597, 0, _1080p * -265.5, _1080p * -264.5, 0 )
				end
			}
		} )
		CursorLineW:RegisterAnimationSequence( "Sabre", {
			{
				function ()
					return self.CursorLineW:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 1195, _1080p * -265.5, _1080p * -264.5, 0 )
				end
			}
		} )
		MissionTeamCursor:RegisterAnimationSequence( "Sabre", {
			{
				function ()
					return self.MissionTeamCursor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1195, _1080p * 1323, _1080p * 211, _1080p * 339, 0 )
				end
			}
		} )
		self._sequences.Sabre = function ()
			CursorLineN:AnimateSequence( "Sabre" )
			CursorLineS:AnimateSequence( "Sabre" )
			CursorLineE:AnimateSequence( "Sabre" )
			CursorLineW:AnimateSequence( "Sabre" )
			MissionTeamCursor:AnimateSequence( "Sabre" )
		end
		
		CursorLineN:RegisterAnimationSequence( "Blood", {
			{
				function ()
					return self.CursorLineN:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 200.5, _1080p * 201.5, 0, _1080p * 277, 0 )
				end
			}
		} )
		CursorLineS:RegisterAnimationSequence( "Blood", {
			{
				function ()
					return self.CursorLineS:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 200.5, _1080p * 201.5, _1080p * -675, 0, 0 )
				end
			}
		} )
		CursorLineE:RegisterAnimationSequence( "Blood", {
			{
				function ()
					return self.CursorLineE:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -695, 0, _1080p * -199.5, _1080p * -198.5, 0 )
				end
			}
		} )
		CursorLineW:RegisterAnimationSequence( "Blood", {
			{
				function ()
					return self.CursorLineW:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 1097, _1080p * -199.5, _1080p * -198.5, 0 )
				end
			}
		} )
		MissionTeamCursor:RegisterAnimationSequence( "Blood", {
			{
				function ()
					return self.MissionTeamCursor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1097, _1080p * 1225, _1080p * 277, _1080p * 405, 0 )
				end
			}
		} )
		self._sequences.Blood = function ()
			CursorLineN:AnimateSequence( "Blood" )
			CursorLineS:AnimateSequence( "Blood" )
			CursorLineE:AnimateSequence( "Blood" )
			CursorLineW:AnimateSequence( "Blood" )
			MissionTeamCursor:AnimateSequence( "Blood" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f53_arg0, f53_arg1 )
		f53_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f53_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	PostLoadFunc( self, f19_local1, controller )
	return self
end

MenuBuilder.registerType( "MissionTeamSelect", MissionTeamSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "MissionTeamSelect", PopFunc )
LockTable( _M )
