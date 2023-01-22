local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 3
f0_local1 = 2
function PostLoadFunc( f1_arg0, f1_arg1 )
	assert( f1_arg0.VoteOptions )
	local f1_local0 = false
	local f1_local1 = LUI.DataSourceFromList.new( f0_local0 )
	f1_local1.MakeDataSourceAtIndex = function ( f2_arg0, f2_arg1, f2_arg2 )
		local f2_local0 = "frontEnd.lobby.mapVoting." .. f2_arg1
		if f2_arg1 == f0_local1 then
			local f2_local1 = "frontEnd.lobby.randomMapVoting." .. f2_arg1
			return {
				mapName = LUI.DataSourceInGlobalModel.new( f2_local1 .. ".map.name", Engine.Localize( "GAME_VOTE_RANDOM" ) ),
				mapImage = LUI.DataSourceInGlobalModel.new( f2_local1 .. ".map.image", "image_mp_map_classified_vote" ),
				modeName = LUI.DataSourceInGlobalModel.new( f2_local1 .. ".gameType.name", "" ),
				modeImage = LUI.DataSourceInGlobalModel.new( f2_local1 .. ".gameType.image", "gamemode_generic" ),
				votes = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".votes" ),
				voteLabel = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".voteLabel" ),
				refIndex = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".refIndex" )
			}
		else
			return {
				mapName = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".map.name" ),
				mapImage = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".map.image" ),
				modeName = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".gameType.name" ),
				modeImage = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".gameType.image" ),
				votes = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".votes" ),
				voteLabel = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".voteLabel" ),
				refIndex = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".refIndex" )
			}
		end
	end
	
	f1_arg0.VoteOptions:SetGridDataSource( f1_local1 )
	local f1_local2 = LUI.AggregateDataSource.new( DataSources.frontEnd.lobby.mapName, {
		DataSources.frontEnd.lobby.votingComplete,
		DataSources.frontEnd.lobby.mapName
	}, "votingDisplayName", function ( f3_arg0 )
		if DataSources.frontEnd.lobby.votingComplete:GetValue( f3_arg0 ) ~= nil and DataSources.frontEnd.lobby.votingComplete:GetValue( f3_arg0 ) == true then
			return DataSources.frontEnd.lobby.mapName:GetValue( f3_arg0 )
		else
			return Engine.Localize( "MENU_VOTE_TITLE" )
		end
	end )
	f1_arg0:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), function ()
		local f4_local0 = function ( f5_arg0, f5_arg1 )
			f1_arg0.Title.VoteTitle:setText( f1_local2:GetValue( f1_arg1 ), 0 )
		end
		
		f4_local0( f1_arg0, {
			name = "datasource_event"
		} )
	end )
	local f1_local3 = function ()
		local f6_local0 = f1_arg0:GetCurrentMenu()
		ACTIONS.LoseFocus( f1_arg0, "VoteOptions", f1_arg1 )
		ACTIONS.GainFocus( f6_local0.LobbyMissionButtons.LobbyMissionVerticalLayout, "CAC", f1_arg1 )
		f6_local0.LobbyMissionButtons:saveState()
	end
	
	local f1_local4 = function ()
		if DataSources.frontEnd.lobby.votingComplete:GetValue( f1_arg1 ) then
			if #f1_arg0.VoteOptions:getAllFocusedChildren() > 0 then
				f1_local3()
			end
			f1_arg0.VoteOptions:SetGridDataSource( LUI.DataSourceFromList.new( 0 ) )
			if f1_local0 == true then
				local f7_local0 = MissionDirector.GetActiveMissionTeam( f1_arg1 )
				local f7_local1 = "voting_complete"
				if f7_local0 == 0 then
					f7_local1 = f7_local1 .. "_jtf"
				end
				f1_arg0:dispatchEventToRoot( {
					name = "show_commander_message",
					eventID = f7_local1
				} )
			end
		else
			f1_arg0.VoteOptions:SetGridDataSource( f1_local1 )
			f1_local0 = true
		end
	end
	
	f1_arg0.VoteOptions:addEventHandler( "restore_focus", function ( f8_arg0, f8_arg1 )
		if f8_arg0.id == f8_arg1.id then
			if f1_arg0.VoteOptions:GetNumChildren() == 0 then
				f1_local3()
			end
			return true
		else
			
		end
	end )
	f1_arg0:SubscribeToModel( DataSources.frontEnd.lobby.votingComplete:GetModel( f1_arg1 ), f1_local4 )
end

function MapVoteDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 504 * _1080p, 0, 274 * _1080p )
	self.id = "MapVoteDetails"
	self._animationSets = {}
	self._sequences = {}
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	local f9_local2 = self
	local DetailsBackground = nil
	
	DetailsBackground = LUI.UIImage.new()
	DetailsBackground.id = "DetailsBackground"
	DetailsBackground:SetRGBFromInt( 0, 0 )
	DetailsBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 2, _1080p * 193 )
	self:addElement( DetailsBackground )
	self.DetailsBackground = DetailsBackground
	
	local VotedMap = nil
	
	VotedMap = LUI.UIImage.new()
	VotedMap.id = "VotedMap"
	VotedMap:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 27, _1080p * 264 )
	VotedMap:SubscribeToModel( DataSources.frontEnd.lobby.mapImage:GetModel( f9_local1 ), function ()
		local f10_local0 = DataSources.frontEnd.lobby.mapImage:GetValue( f9_local1 )
		if f10_local0 ~= nil then
			VotedMap:setImage( RegisterMaterial( f10_local0 ), 0 )
		end
	end )
	self:addElement( VotedMap )
	self.VotedMap = VotedMap
	
	local BaseTransition = nil
	
	BaseTransition = LUI.UIImage.new()
	BaseTransition.id = "BaseTransition"
	BaseTransition:SetRGBFromInt( 8421504, 0 )
	BaseTransition:SetGlitchEnabled( true )
	BaseTransition:SetGlitchAmount( 0, 0 )
	BaseTransition:SetGlitchBlockWidth( 50, 0 )
	BaseTransition:SetGlitchBlockHeight( 50, 0 )
	BaseTransition:SetGlitchDistortionRange( 16, 0 )
	BaseTransition:SetGlitchScanlinePitch( 1, 0 )
	BaseTransition:SetGlitchMaskPitch( 1, 0 )
	BaseTransition:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 27, _1080p * 193 )
	self:addElement( BaseTransition )
	self.BaseTransition = BaseTransition
	
	local f9_local6 = nil
	if Engine.InFrontend() then
		f9_local6 = LUI.UIDataSourceGrid.new( nil, {
			maxVisibleColumns = 1,
			maxVisibleRows = 3,
			controllerIndex = f9_local1,
			buildChild = function ()
				return MenuBuilder.BuildRegisteredType( "MapVoteButton", {
					controllerIndex = f9_local1
				} )
			end,
			wrapX = false,
			wrapY = false,
			spacingX = _1080p * 2,
			spacingY = _1080p * 2,
			columnWidth = _1080p * 504,
			rowHeight = _1080p * 80,
			scrollingThresholdX = 0,
			scrollingThresholdY = 0,
			adjustSizeToContent = false,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top,
			springCoefficient = 400,
			maxVelocity = 5000
		} )
		f9_local6.id = "VoteOptions"
		f9_local6:setUseStencil( false )
		f9_local6:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 504, _1080p * 29, _1080p * 273 )
		self:addElement( f9_local6 )
		self.VoteOptions = f9_local6
	end
	local Title = nil
	
	Title = MenuBuilder.BuildRegisteredType( "MapVoteTitle", {
		controllerIndex = f9_local1
	} )
	Title.id = "Title"
	Title.VoteTitle:setText( ToUpperCase( Engine.Localize( "MENU_VOTE_TITLE" ) ), 0 )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 2, _1080p * 25 )
	self:addElement( Title )
	self.Title = Title
	
	local GameTypeNameBG = nil
	
	GameTypeNameBG = LUI.UIImage.new()
	GameTypeNameBG.id = "GameTypeNameBG"
	GameTypeNameBG:SetRGBFromTable( SWATCHES.text.secondaryText, 0 )
	GameTypeNameBG:SetAlpha( 0, 0 )
	GameTypeNameBG:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 49, _1080p * 177, _1080p * 180.5, _1080p * -44.5 )
	self:addElement( GameTypeNameBG )
	self.GameTypeNameBG = GameTypeNameBG
	
	local GameTypeImage = nil
	
	GameTypeImage = LUI.UIImage.new()
	GameTypeImage.id = "GameTypeImage"
	GameTypeImage:SetAlpha( 0, 0 )
	GameTypeImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 116, _1080p * 148, _1080p * 262 )
	GameTypeImage:SubscribeToModel( DataSources.frontEnd.lobby.gameTypeImage:GetModel( f9_local1 ), function ()
		local f12_local0 = DataSources.frontEnd.lobby.gameTypeImage:GetValue( f9_local1 )
		if f12_local0 ~= nil then
			GameTypeImage:setImage( RegisterMaterial( f12_local0 ), 0 )
		end
	end )
	self:addElement( GameTypeImage )
	self.GameTypeImage = GameTypeImage
	
	local GameTypeName = nil
	
	GameTypeName = LUI.UIText.new()
	GameTypeName.id = "GameTypeName"
	GameTypeName:SetAlpha( 0, 0 )
	GameTypeName:SetFontSize( 20 * _1080p )
	GameTypeName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	GameTypeName:SetAlignment( LUI.Alignment.Left )
	GameTypeName:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -379, _1080p * -20, _1080p * 225.75, _1080p * 252.75 )
	GameTypeName:SubscribeToModel( DataSources.frontEnd.lobby.gameTypeName:GetModel( f9_local1 ), function ()
		local f13_local0 = DataSources.frontEnd.lobby.gameTypeName:GetValue( f9_local1 )
		if f13_local0 ~= nil then
			GameTypeName:setText( ToUpperCase( f13_local0 ), 0 )
		end
	end )
	self:addElement( GameTypeName )
	self.GameTypeName = GameTypeName
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DetailsBackground:RegisterAnimationSequence( "VoteStart", {
			{
				function ()
					return self.DetailsBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 2, _1080p * 274, 0 )
				end,
				function ()
					return self.DetailsBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 2, _1080p * 274, 79 )
				end,
				function ()
					return self.DetailsBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 2, _1080p * 273, 90 )
				end
			}
		} )
		VotedMap:RegisterAnimationSequence( "VoteStart", {
			{
				function ()
					return self.VotedMap:SetAlpha( 1, 0 )
				end,
				function ()
					return self.VotedMap:SetAlpha( 0, 80 )
				end
			}
		} )
		BaseTransition:RegisterAnimationSequence( "VoteStart", {
			{
				function ()
					return self.BaseTransition:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BaseTransition:SetAlpha( 1, 310 )
				end
			},
			{
				function ()
					return self.BaseTransition:SetRGBFromInt( 0, 0 )
				end,
				function ()
					return self.BaseTransition:SetRGBFromInt( 0, 310 )
				end,
				function ()
					return self.BaseTransition:SetRGBFromInt( 8421504, 340 )
				end
			},
			{
				function ()
					return self.BaseTransition:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 27, _1080p * 273, 0 )
				end,
				function ()
					return self.BaseTransition:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 27, _1080p * 273, 310 )
				end,
				function ()
					return self.BaseTransition:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 27, _1080p * 193, 9 )
				end
			}
		} )
		if Engine.InFrontend() then
			f9_local6:RegisterAnimationSequence( "VoteStart", {
				{
					function ()
						return self.VoteOptions:SetAlpha( 0, 310 )
					end,
					function ()
						return self.VoteOptions:SetAlpha( 1, 340 )
					end
				}
			} )
		end
		GameTypeNameBG:RegisterAnimationSequence( "VoteStart", {
			{
				function ()
					return self.GameTypeNameBG:SetAlpha( 0, 0 )
				end
			}
		} )
		GameTypeImage:RegisterAnimationSequence( "VoteStart", {
			{
				function ()
					return self.GameTypeImage:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.GameTypeImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 71, _1080p * 86, _1080p * 145.5, _1080p * 145.5, 0 )
				end
			}
		} )
		GameTypeName:RegisterAnimationSequence( "VoteStart", {
			{
				function ()
					return self.GameTypeName:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.VoteStart = function ()
			DetailsBackground:AnimateSequence( "VoteStart" )
			VotedMap:AnimateSequence( "VoteStart" )
			BaseTransition:AnimateSequence( "VoteStart" )
			if Engine.InFrontend() then
				f9_local6:AnimateSequence( "VoteStart" )
			end
			GameTypeNameBG:AnimateSequence( "VoteStart" )
			GameTypeImage:AnimateSequence( "VoteStart" )
			GameTypeName:AnimateSequence( "VoteStart" )
		end
		
		DetailsBackground:RegisterAnimationSequence( "LANVoteComplete", {
			{
				function ()
					return self.DetailsBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 2, _1080p * 273, 0 )
				end,
				function ()
					return self.DetailsBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 2, _1080p * 273, 579 )
				end
			}
		} )
		VotedMap:RegisterAnimationSequence( "LANVoteComplete", {
			{
				function ()
					return self.VotedMap:SetAlpha( 0, 0 )
				end,
				function ()
					return self.VotedMap:SetAlpha( 0, 640 )
				end,
				function ()
					return self.VotedMap:SetAlpha( 1, 230 )
				end
			}
		} )
		BaseTransition:RegisterAnimationSequence( "LANVoteComplete", {
			{
				function ()
					return self.BaseTransition:SetRGBFromInt( 8421504, 0 )
				end,
				function ()
					return self.BaseTransition:SetRGBFromInt( 8421504, 500 )
				end
			},
			{
				function ()
					return self.BaseTransition:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.BaseTransition:SetGlitchScanlinePitch( 10, 0 )
				end,
				function ()
					return self.BaseTransition:SetGlitchScanlinePitch( 5, 500 )
				end
			},
			{
				function ()
					return self.BaseTransition:SetGlitchMaskPitch( 10, 0 )
				end,
				function ()
					return self.BaseTransition:SetGlitchMaskPitch( 10, 500 )
				end
			},
			{
				function ()
					return self.BaseTransition:SetGlitchBlockWidth( 3, 0 )
				end,
				function ()
					return self.BaseTransition:SetGlitchBlockWidth( 1, 500 )
				end,
				function ()
					return self.BaseTransition:SetGlitchBlockWidth( 1, 210 )
				end
			},
			{
				function ()
					return self.BaseTransition:SetGlitchBlockHeight( 3, 0 )
				end,
				function ()
					return self.BaseTransition:SetGlitchBlockHeight( 1, 500 )
				end,
				function ()
					return self.BaseTransition:SetGlitchBlockHeight( 1, 210 )
				end
			},
			{
				function ()
					return self.BaseTransition:SetGlitchDistortionRange( 10, 0 )
				end,
				function ()
					return self.BaseTransition:SetGlitchDistortionRange( 20, 270 )
				end,
				function ()
					return self.BaseTransition:SetGlitchDistortionRange( 30, 230 )
				end,
				function ()
					return self.BaseTransition:SetGlitchDistortionRange( 10, 210 )
				end
			},
			{
				function ()
					return self.BaseTransition:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BaseTransition:SetAlpha( 1, 500 )
				end,
				function ()
					return self.BaseTransition:SetAlpha( 0, 210 )
				end
			},
			{
				function ()
					return self.BaseTransition:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.BaseTransition:SetGlitchAmount( 1, 10 )
				end,
				function ()
					return self.BaseTransition:SetGlitchAmount( 1, 700 )
				end,
				function ()
					return self.BaseTransition:SetGlitchAmount( 0, 20 )
				end
			},
			{
				function ()
					return self.BaseTransition:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 27, _1080p * 273, 0 )
				end,
				function ()
					return self.BaseTransition:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 27, _1080p * 273, 500 )
				end,
				function ()
					return self.BaseTransition:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 27, _1080p * 273, 79 )
				end
			}
		} )
		if Engine.InFrontend() then
			f9_local6:RegisterAnimationSequence( "LANVoteComplete", {
				{
					function ()
						return self.VoteOptions:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		GameTypeNameBG:RegisterAnimationSequence( "LANVoteComplete", {
			{
				function ()
					return self.GameTypeNameBG:SetAlpha( 0.4, 1000 )
				end
			},
			{
				function ()
					return self.GameTypeNameBG:SetRGBFromInt( 1710618, 1080 )
				end
			},
			{
				function ()
					return self.GameTypeNameBG:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, _1080p * 214.5, _1080p * -10, 1000 )
				end,
				function ()
					return self.GameTypeNameBG:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 500, _1080p * 214.5, _1080p * -10, 80 )
				end,
				function ()
					return self.GameTypeNameBG:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 500, _1080p * 214.5, _1080p * -10, 159 )
				end
			}
		} )
		GameTypeImage:RegisterAnimationSequence( "LANVoteComplete", {
			{
				function ()
					return self.GameTypeImage:SetAlpha( 0, 860 )
				end,
				function ()
					return self.GameTypeImage:SetAlpha( 1, 10 )
				end,
				function ()
					return self.GameTypeImage:SetAlpha( 1, 370, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.GameTypeImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 116, _1080p * 210.5, _1080p * 210.5, 889 )
				end,
				function ()
					return self.GameTypeImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 116, _1080p * 210.5, _1080p * 210.5, 40 )
				end,
				function ()
					return self.GameTypeImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 116, _1080p * 148, _1080p * 262, 310, LUI.EASING.outBack )
				end
			}
		} )
		GameTypeName:RegisterAnimationSequence( "LANVoteComplete", {
			{
				function ()
					return self.GameTypeName:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.GameTypeName:SetAlpha( 1, 240 )
				end
			},
			{
				function ()
					return self.GameTypeName:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -379, _1080p * -20, _1080p * 225.75, _1080p * 252.75, 1000 )
				end
			}
		} )
		self._sequences.LANVoteComplete = function ()
			DetailsBackground:AnimateSequence( "LANVoteComplete" )
			VotedMap:AnimateSequence( "LANVoteComplete" )
			BaseTransition:AnimateSequence( "LANVoteComplete" )
			if Engine.InFrontend() then
				f9_local6:AnimateSequence( "LANVoteComplete" )
			end
			GameTypeNameBG:AnimateSequence( "LANVoteComplete" )
			GameTypeImage:AnimateSequence( "LANVoteComplete" )
			GameTypeName:AnimateSequence( "LANVoteComplete" )
		end
		
		DetailsBackground:RegisterAnimationSequence( "VoteComplete", {
			{
				function ()
					return self.DetailsBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 2, _1080p * 273, 0 )
				end,
				function ()
					return self.DetailsBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 2, _1080p * 273, 579 )
				end
			}
		} )
		VotedMap:RegisterAnimationSequence( "VoteComplete", {
			{
				function ()
					return self.VotedMap:SetAlpha( 0, 0 )
				end,
				function ()
					return self.VotedMap:SetAlpha( 0, 640 )
				end,
				function ()
					return self.VotedMap:SetAlpha( 1, 230 )
				end
			}
		} )
		BaseTransition:RegisterAnimationSequence( "VoteComplete", {
			{
				function ()
					return self.BaseTransition:SetRGBFromInt( 8421504, 0 )
				end,
				function ()
					return self.BaseTransition:SetRGBFromInt( 8421504, 500 )
				end
			},
			{
				function ()
					return self.BaseTransition:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.BaseTransition:SetGlitchScanlinePitch( 10, 0 )
				end,
				function ()
					return self.BaseTransition:SetGlitchScanlinePitch( 5, 500 )
				end
			},
			{
				function ()
					return self.BaseTransition:SetGlitchMaskPitch( 10, 0 )
				end,
				function ()
					return self.BaseTransition:SetGlitchMaskPitch( 10, 500 )
				end
			},
			{
				function ()
					return self.BaseTransition:SetGlitchBlockWidth( 3, 0 )
				end,
				function ()
					return self.BaseTransition:SetGlitchBlockWidth( 1, 500 )
				end,
				function ()
					return self.BaseTransition:SetGlitchBlockWidth( 1, 210 )
				end
			},
			{
				function ()
					return self.BaseTransition:SetGlitchBlockHeight( 3, 0 )
				end,
				function ()
					return self.BaseTransition:SetGlitchBlockHeight( 1, 500 )
				end,
				function ()
					return self.BaseTransition:SetGlitchBlockHeight( 1, 210 )
				end
			},
			{
				function ()
					return self.BaseTransition:SetGlitchDistortionRange( 10, 0 )
				end,
				function ()
					return self.BaseTransition:SetGlitchDistortionRange( 20, 270 )
				end,
				function ()
					return self.BaseTransition:SetGlitchDistortionRange( 30, 230 )
				end,
				function ()
					return self.BaseTransition:SetGlitchDistortionRange( 10, 210 )
				end
			},
			{
				function ()
					return self.BaseTransition:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BaseTransition:SetAlpha( 1, 500 )
				end,
				function ()
					return self.BaseTransition:SetAlpha( 0, 210 )
				end
			},
			{
				function ()
					return self.BaseTransition:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.BaseTransition:SetGlitchAmount( 1, 10 )
				end,
				function ()
					return self.BaseTransition:SetGlitchAmount( 1, 700 )
				end,
				function ()
					return self.BaseTransition:SetGlitchAmount( 0, 20 )
				end
			},
			{
				function ()
					return self.BaseTransition:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 27, _1080p * 273, 0 )
				end,
				function ()
					return self.BaseTransition:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 27, _1080p * 273, 500 )
				end,
				function ()
					return self.BaseTransition:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -4, _1080p * 27, _1080p * 273, 79 )
				end
			}
		} )
		if Engine.InFrontend() then
			f9_local6:RegisterAnimationSequence( "VoteComplete", {
				{
					function ()
						return self.VoteOptions:SetAlpha( 1, 30 )
					end,
					function ()
						return self.VoteOptions:SetAlpha( 0, 500 )
					end
				}
			} )
		end
		GameTypeNameBG:RegisterAnimationSequence( "VoteComplete", {
			{
				function ()
					return self.GameTypeNameBG:SetAlpha( 0.4, 1000 )
				end
			},
			{
				function ()
					return self.GameTypeNameBG:SetRGBFromInt( 1710618, 1000 )
				end
			},
			{
				function ()
					return self.GameTypeNameBG:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, _1080p * 214.5, _1080p * -10, 1000 )
				end,
				function ()
					return self.GameTypeNameBG:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 500, _1080p * 214.5, _1080p * -10, 80 )
				end,
				function ()
					return self.GameTypeNameBG:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 500, _1080p * 214.5, _1080p * -10, 159 )
				end
			}
		} )
		GameTypeImage:RegisterAnimationSequence( "VoteComplete", {
			{
				function ()
					return self.GameTypeImage:SetAlpha( 0, 860 )
				end,
				function ()
					return self.GameTypeImage:SetAlpha( 1, 10 )
				end,
				function ()
					return self.GameTypeImage:SetAlpha( 1, 370, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.GameTypeImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 116, _1080p * 210.5, _1080p * 210.5, 889 )
				end,
				function ()
					return self.GameTypeImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 116, _1080p * 210.5, _1080p * 210.5, 40 )
				end,
				function ()
					return self.GameTypeImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 116, _1080p * 148, _1080p * 262, 310, LUI.EASING.outBack )
				end
			}
		} )
		GameTypeName:RegisterAnimationSequence( "VoteComplete", {
			{
				function ()
					return self.GameTypeName:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.GameTypeName:SetAlpha( 1, 240 )
				end
			},
			{
				function ()
					return self.GameTypeName:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -379, _1080p * -20, _1080p * 225.75, _1080p * 252.75, 1289 )
				end
			}
		} )
		self._sequences.VoteComplete = function ()
			DetailsBackground:AnimateSequence( "VoteComplete" )
			VotedMap:AnimateSequence( "VoteComplete" )
			BaseTransition:AnimateSequence( "VoteComplete" )
			if Engine.InFrontend() then
				f9_local6:AnimateSequence( "VoteComplete" )
			end
			GameTypeNameBG:AnimateSequence( "VoteComplete" )
			GameTypeImage:AnimateSequence( "VoteComplete" )
			GameTypeName:AnimateSequence( "VoteComplete" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.frontEnd.lobby.votingComplete:GetModel( f9_local1 ), function ()
		if DataSources.frontEnd.lobby.votingComplete:GetValue( f9_local1 ) ~= nil and DataSources.frontEnd.lobby.votingComplete:GetValue( f9_local1 ) == true then
			ACTIONS.AnimateSequence( self, "VoteComplete" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "Title",
				sequenceName = "VoteComplete",
				elementPath = "Title"
			} )
		end
		if DataSources.frontEnd.lobby.votingComplete:GetValue( f9_local1 ) ~= nil and DataSources.frontEnd.lobby.votingComplete:GetValue( f9_local1 ) == false then
			ACTIONS.AnimateSequence( self, "VoteStart" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "Title",
				sequenceName = "VoteStart",
				elementPath = "Title"
			} )
		end
	end )
	PostLoadFunc( self, f9_local1, controller )
	return self
end

MenuBuilder.registerType( "MapVoteDetails", MapVoteDetails )
LockTable( _M )
