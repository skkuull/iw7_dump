local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.playlists"
f0_local1 = f0_local0 .. ".category"
f0_local2 = function ()
	Lobby.PopulatePlaylistDataModel( f0_local1 )
end

local f0_local3 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

local f0_local4 = function ( f3_arg0, f3_arg1 )
	if f3_arg0 ~= nil then
		return f3_arg0 .. "_small"
	else
		return f3_arg0
	end
end

local f0_local5 = function ( f4_arg0, f4_arg1, f4_arg2 )
	assert( f4_arg0.Tabs )
	assert( f4_arg0.Tabs.Tabs )
	assert( f4_arg0.PlaylistList )
	assert( f4_arg0.PlaylistList.PlaylistButtons )
	CheckTURequirement( f4_arg0, f4_arg1 )
	Engine.SetFrontEndSceneSection( "zm_map_selection", 1 )
	local f4_local0 = Playlist.GetPreselectedCategory()
	local f4_local1 = Playlist.GetPreselectedIndexInCategory()
	local f4_local2 = f0_local1
	local f4_local3 = LUI.DataSourceFromList.new( LUI.DataSourceInGlobalModel.new( f4_local2 .. ".count" ) )
	f4_local3.MakeDataSourceAtIndex = function ( f5_arg0, f5_arg1 )
		local f5_local0 = LUI.DataSourceInGlobalModel.new( f4_local2 .. ".index." .. f5_arg1 )
		local f5_local1 = f4_local2 .. "." .. f5_arg1 .. ".playlist"
		local f5_local2 = LUI.DataSourceFromList.new( LUI.DataSourceInGlobalModel.new( f5_local1 .. ".count" ) )
		f5_local2.MakeDataSourceAtIndex = function ( f6_arg0, f6_arg1 )
			return {
				name = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".name." .. f6_arg1 ),
				disabled = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".disabled." .. f6_arg1 ),
				hasDLC = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".hasDLC." .. f6_arg1 ),
				image = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".image." .. f6_arg1 ),
				smallImage = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".smallImage." .. f6_arg1 ),
				desc = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".desc." .. f6_arg1 ),
				categoryIndex = f5_local0,
				playlistIndex = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".index." .. f6_arg1 ),
				minPlayerSize = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".minPlayerSize." .. f6_arg1 ),
				maxPlayerSize = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".maxPlayerSize." .. f6_arg1 ),
				minPartySize = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".minPartySize." .. f6_arg1 ),
				maxPartySize = LUI.DataSourceInGlobalModel.new( f5_local1 .. ".maxPartySize." .. f6_arg1 ),
				listIndex = f6_arg1
			}
		end
		
		f5_local2.GetDefaultFocusIndex = function ()
			if f5_local0:GetValue( f4_arg1 ) == f4_local0 then
				for f7_local0 = 0, f5_local2:GetCountValue( f4_arg1 ) - 1, 1 do
					local f7_local3 = f4_local1
					local f7_local4 = f5_local2:GetDataSourceAtIndex( f7_local0 )
					if f7_local3 == f7_local4.playlistIndex:GetValue( f4_arg1 ) + 1 then
						return f7_local0
					end
				end
			end
		end
		
		return {
			name = LUI.DataSourceInGlobalModel.new( f4_local2 .. ".name." .. f5_arg1 ),
			disabled = LUI.DataSourceInGlobalModel.new( f4_local2 .. ".disabled." .. f5_arg1 ),
			index = f5_local0,
			focusFunction = function ()
				
			end
			,
			playlists = f5_local2
		}
	end
	
	f4_local3.GetDefaultFocusIndex = function ()
		for f9_local0 = 0, f4_local3:GetCountValue( f4_arg1 ) - 1, 1 do
			local f9_local3 = f4_local0
			local f9_local4 = f4_local3:GetDataSourceAtIndex( f9_local0 )
			if f9_local3 == f9_local4.index:GetValue( f4_arg1 ) + 1 then
				return f9_local0
			end
		end
	end
	
	f4_arg0.Tabs.Tabs:SetTabManagerDataSource( f4_local3, f4_arg1 )
	f4_arg0.PlaylistList.PlaylistButtons:SetGridDataSourceThroughElement( f4_arg0.Tabs.Tabs, "playlists" )
	f4_arg0:addEventHandler( "boss_ID", function ( f10_arg0, f10_arg1 )
		if f10_arg1.bossSelection == "grey" then
			ACTIONS.AnimateSequence( f4_arg0, "bossAlien" )
		elseif f10_arg1.bossSelection == "superslasher" then
			ACTIONS.AnimateSequence( f4_arg0, "bossSlasher" )
		elseif f10_arg1.bossSelection == "ratking" then
			ACTIONS.AnimateSequence( f4_arg0, "bossRatking" )
		elseif f10_arg1.bossSelection == "crog" then
			ACTIONS.AnimateSequence( f4_arg0, "bossCrog" )
		elseif f10_arg1.bossSelection == "mammoth" then
			ACTIONS.AnimateSequence( f4_arg0, "bossRhino" )
		elseif f10_arg1.bossSelection == "meph" then
			ACTIONS.AnimateSequence( f4_arg0, "bossMeph" )
		else
			ACTIONS.AnimateSequence( f4_arg0, "DefaultSequence" )
		end
	end )
end

function CPPlaylistMenu( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self.id = "CPPlaylistMenu"
	self._animationSets = {}
	self._sequences = {}
	local f11_local1 = controller and controller.controllerIndex
	if not f11_local1 and not Engine.InFrontend() then
		f11_local1 = self:getRootController()
	end
	assert( f11_local1 )
	self:playSound( "menu_open" )
	local f11_local2 = self
	local spinner = nil
	
	spinner = LUI.UIImage.new()
	spinner.id = "spinner"
	spinner:SetAlpha( 0, 0 )
	spinner:setImage( RegisterMaterial( "zm_tix_arcane_spinner" ), 0 )
	spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100, _1080p * 612, _1080p * 460.4, _1080p * 972.4 )
	self:addElement( spinner )
	self.spinner = spinner
	
	local alien = nil
	
	alien = LUI.UIImage.new()
	alien.id = "alien"
	alien:SetAlpha( 0, 0 )
	alien:SetZRotation( 10, 0 )
	alien:SetScale( 0.7, 0 )
	alien:setImage( RegisterMaterial( "cp_final_boss_alien" ), 0 )
	alien:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 230.4, _1080p * 486.4, _1080p * 588.4, _1080p * 844.4 )
	self:addElement( alien )
	self.alien = alien
	
	local slasher = nil
	
	slasher = LUI.UIImage.new()
	slasher.id = "slasher"
	slasher:SetAlpha( 0, 0 )
	slasher:SetZRotation( -20, 0 )
	slasher:SetScale( 0.6, 0 )
	slasher:setImage( RegisterMaterial( "cp_final_boss_slasher" ), 0 )
	slasher:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 232.4, _1080p * 488.4, _1080p * 590.4, _1080p * 846.4 )
	self:addElement( slasher )
	self.slasher = slasher
	
	local rhino = nil
	
	rhino = LUI.UIImage.new()
	rhino.id = "rhino"
	rhino:SetZRotation( 1, 0 )
	rhino:SetScale( 0.7, 0 )
	rhino:setImage( RegisterMaterial( "cp_final_boss_rhino" ), 0 )
	rhino:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 223, _1080p * 479, _1080p * 588.4, _1080p * 844.4 )
	self:addElement( rhino )
	self.rhino = rhino
	
	local ratking = nil
	
	ratking = LUI.UIImage.new()
	ratking.id = "ratking"
	ratking:SetAlpha( 0, 0 )
	ratking:SetZRotation( -18, 0 )
	ratking:SetScale( 0.7, 0 )
	ratking:setImage( RegisterMaterial( "cp_final_boss_ratking" ), 0 )
	ratking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 231.4, _1080p * 487.4, _1080p * 567.4, _1080p * 823.4 )
	self:addElement( ratking )
	self.ratking = ratking
	
	local meph = nil
	
	meph = LUI.UIImage.new()
	meph.id = "meph"
	meph:SetScale( 0.9, 0 )
	meph:setImage( RegisterMaterial( "cp_final_boss_meph" ), 0 )
	meph:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241, _1080p * 497, _1080p * 552.6, _1080p * 808.6 )
	self:addElement( meph )
	self.meph = meph
	
	local crog = nil
	
	crog = LUI.UIImage.new()
	crog.id = "crog"
	crog:SetAlpha( 0, 0 )
	crog:SetZRotation( -15, 0 )
	crog:SetScale( 0.7, 0 )
	crog:setImage( RegisterMaterial( "cp_final_boss_crog" ), 0 )
	crog:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 222, _1080p * 478, _1080p * 588.4, _1080p * 844.4 )
	self:addElement( crog )
	self.crog = crog
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f11_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f11_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1386, _1080p * 1886, _1080p * 1035, _1080p * 1080 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local Tabs = nil
	
	Tabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f11_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAlpha( 0, 0 )
	Tabs:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -377.5, _1080p * -332.5 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local CPMenuTitle = nil
	
	CPMenuTitle = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
		controllerIndex = f11_local1
	} )
	CPMenuTitle.id = "CPMenuTitle"
	CPMenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_ZM_PLAYLIST_HEADER" ), 0 )
	CPMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( CPMenuTitle )
	self.CPMenuTitle = CPMenuTitle
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f11_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local PlaylistList = nil
	
	PlaylistList = MenuBuilder.BuildRegisteredType( "PlaylistList", {
		controllerIndex = f11_local1
	} )
	PlaylistList.id = "PlaylistList"
	PlaylistList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 528 )
	self:addElement( PlaylistList )
	self.PlaylistList = PlaylistList
	
	local CRMMain = nil
	
	CRMMain = MenuBuilder.BuildRegisteredType( "CRMMain", {
		controllerIndex = f11_local1
	} )
	CRMMain.id = "CRMMain"
	CRMMain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 137, _1080p * 447, _1080p * 745, _1080p * 1069 )
	self:addElement( CRMMain )
	self.CRMMain = CRMMain
	
	local f11_local17 = nil
	if CONDITIONS.IsDirectorsCutAvailable( f11_local1 ) then
		f11_local17 = MenuBuilder.BuildRegisteredType( "CPMapsTalisman", {
			controllerIndex = f11_local1
		} )
		f11_local17.id = "CPMapsTalisman"
		f11_local17:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 88, _1080p * 130, _1080p * 211.5, _1080p * 413.5 )
		self:addElement( f11_local17 )
		self.CPMapsTalisman = f11_local17
	end
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
		rhino:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.rhino:SetAlpha( 0, 0 )
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
		meph:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.meph:SetAlpha( 0, 0 )
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
		self._sequences.DefaultSequence = function ()
			spinner:AnimateSequence( "DefaultSequence" )
			alien:AnimateSequence( "DefaultSequence" )
			slasher:AnimateSequence( "DefaultSequence" )
			rhino:AnimateSequence( "DefaultSequence" )
			ratking:AnimateSequence( "DefaultSequence" )
			meph:AnimateSequence( "DefaultSequence" )
			crog:AnimateSequence( "DefaultSequence" )
		end
		
		spinner:RegisterAnimationSequence( "bossAlien", {
			{
				function ()
					return self.spinner:SetAlpha( 0.8, 0 )
				end
			}
		} )
		alien:RegisterAnimationSequence( "bossAlien", {
			{
				function ()
					return self.alien:SetAlpha( 1, 0 )
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
		rhino:RegisterAnimationSequence( "bossAlien", {
			{
				function ()
					return self.rhino:SetAlpha( 0, 0 )
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
		meph:RegisterAnimationSequence( "bossAlien", {
			{
				function ()
					return self.meph:SetAlpha( 0, 0 )
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
		self._sequences.bossAlien = function ()
			spinner:AnimateSequence( "bossAlien" )
			alien:AnimateSequence( "bossAlien" )
			slasher:AnimateSequence( "bossAlien" )
			rhino:AnimateSequence( "bossAlien" )
			ratking:AnimateSequence( "bossAlien" )
			meph:AnimateSequence( "bossAlien" )
			crog:AnimateSequence( "bossAlien" )
		end
		
		spinner:RegisterAnimationSequence( "bossSlasher", {
			{
				function ()
					return self.spinner:SetAlpha( 0.8, 0 )
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
					return self.slasher:SetAlpha( 1, 0 )
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
		ratking:RegisterAnimationSequence( "bossSlasher", {
			{
				function ()
					return self.ratking:SetAlpha( 0, 0 )
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
		crog:RegisterAnimationSequence( "bossSlasher", {
			{
				function ()
					return self.crog:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.bossSlasher = function ()
			spinner:AnimateSequence( "bossSlasher" )
			alien:AnimateSequence( "bossSlasher" )
			slasher:AnimateSequence( "bossSlasher" )
			rhino:AnimateSequence( "bossSlasher" )
			ratking:AnimateSequence( "bossSlasher" )
			meph:AnimateSequence( "bossSlasher" )
			crog:AnimateSequence( "bossSlasher" )
		end
		
		spinner:RegisterAnimationSequence( "bossRatking", {
			{
				function ()
					return self.spinner:SetAlpha( 0.8, 0 )
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
		rhino:RegisterAnimationSequence( "bossRatking", {
			{
				function ()
					return self.rhino:SetAlpha( 0, 0 )
				end
			}
		} )
		ratking:RegisterAnimationSequence( "bossRatking", {
			{
				function ()
					return self.ratking:SetAlpha( 1, 0 )
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
		crog:RegisterAnimationSequence( "bossRatking", {
			{
				function ()
					return self.crog:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.bossRatking = function ()
			spinner:AnimateSequence( "bossRatking" )
			alien:AnimateSequence( "bossRatking" )
			slasher:AnimateSequence( "bossRatking" )
			rhino:AnimateSequence( "bossRatking" )
			ratking:AnimateSequence( "bossRatking" )
			meph:AnimateSequence( "bossRatking" )
			crog:AnimateSequence( "bossRatking" )
		end
		
		spinner:RegisterAnimationSequence( "bossCrog", {
			{
				function ()
					return self.spinner:SetAlpha( 0.8, 0 )
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
		rhino:RegisterAnimationSequence( "bossCrog", {
			{
				function ()
					return self.rhino:SetAlpha( 0, 0 )
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
		meph:RegisterAnimationSequence( "bossCrog", {
			{
				function ()
					return self.meph:SetAlpha( 0, 0 )
				end
			}
		} )
		crog:RegisterAnimationSequence( "bossCrog", {
			{
				function ()
					return self.crog:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.bossCrog = function ()
			spinner:AnimateSequence( "bossCrog" )
			alien:AnimateSequence( "bossCrog" )
			slasher:AnimateSequence( "bossCrog" )
			rhino:AnimateSequence( "bossCrog" )
			ratking:AnimateSequence( "bossCrog" )
			meph:AnimateSequence( "bossCrog" )
			crog:AnimateSequence( "bossCrog" )
		end
		
		spinner:RegisterAnimationSequence( "bossRhino", {
			{
				function ()
					return self.spinner:SetAlpha( 0.8, 0 )
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
		rhino:RegisterAnimationSequence( "bossRhino", {
			{
				function ()
					return self.rhino:SetAlpha( 1, 0 )
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
		meph:RegisterAnimationSequence( "bossRhino", {
			{
				function ()
					return self.meph:SetAlpha( 0, 0 )
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
		self._sequences.bossRhino = function ()
			spinner:AnimateSequence( "bossRhino" )
			alien:AnimateSequence( "bossRhino" )
			slasher:AnimateSequence( "bossRhino" )
			rhino:AnimateSequence( "bossRhino" )
			ratking:AnimateSequence( "bossRhino" )
			meph:AnimateSequence( "bossRhino" )
			crog:AnimateSequence( "bossRhino" )
		end
		
		spinner:RegisterAnimationSequence( "bossMeph", {
			{
				function ()
					return self.spinner:SetAlpha( 0.8, 0 )
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
		rhino:RegisterAnimationSequence( "bossMeph", {
			{
				function ()
					return self.rhino:SetAlpha( 0, 0 )
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
		meph:RegisterAnimationSequence( "bossMeph", {
			{
				function ()
					return self.meph:SetAlpha( 1, 0 )
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
		self._sequences.bossMeph = function ()
			spinner:AnimateSequence( "bossMeph" )
			alien:AnimateSequence( "bossMeph" )
			slasher:AnimateSequence( "bossMeph" )
			rhino:AnimateSequence( "bossMeph" )
			ratking:AnimateSequence( "bossMeph" )
			meph:AnimateSequence( "bossMeph" )
			crog:AnimateSequence( "bossMeph" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f69_arg0, f69_arg1 )
		f69_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f69_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f69_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ),
			button_ref = "button_start",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f70_arg0, f70_arg1 )
		local f70_local0 = f70_arg1.controller or f11_local1
		ACTIONS.LeaveMenu( self )
	end )
	self.bindButton:addEventHandler( "button_start", function ( f71_arg0, f71_arg1 )
		ACTIONS.OpenMenu( "OptionsMenu", true, f71_arg1.controller or f11_local1 )
	end )
	f0_local5( self, f11_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "CRMMain",
		sequenceName = "Minimize",
		elementPath = "CRMMain"
	} )
	return self
end

MenuBuilder.registerType( "CPPlaylistMenu", CPPlaylistMenu )
LUI.FlowManager.RegisterStackPushBehaviour( "CPPlaylistMenu", f0_local2 )
LUI.FlowManager.RegisterStackPopBehaviour( "CPPlaylistMenu", f0_local3 )
LockTable( _M )
