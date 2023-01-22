local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.MapName )
	local f1_local0 = f1_arg0.MapName
	f1_local0:SetShadowUOffset( -0 )
	f1_local0:SetShadowVOffset( -0 )
	assert( f1_arg0.GameTypeName )
	local f1_local1 = f1_arg0.GameTypeName
	f1_local1:SetShadowUOffset( -0 )
	f1_local1:SetShadowVOffset( -0 )
	assert( f1_arg0.VoteLabel )
	local f1_local2 = f1_arg0.VoteLabel
	f1_local2:SetShadowUOffset( -0 )
	f1_local2:SetShadowVOffset( -0 )
	f1_arg0:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		assert( f2_arg1.controller )
		local f2_local0 = f2_arg0:GetDataSource()
		local f2_local1 = f2_local0.refIndex:GetValue( f2_arg1.controller )
		if not IsVotingFinished() then
			VoteForMap( f2_arg0, f1_arg1, f2_local1 + 1 )
		end
	end )
	if IsLanguageArabic() then
		f1_arg0.VoteLabel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -108, _1080p * -14, _1080p * 4, _1080p * 26, 0 )
		f1_arg0.VoteCount:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -157, _1080p * -113, _1080p * 4, _1080p * 26, 0 )
	end
end

function MapVoteButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 504 * _1080p, 0, 80 * _1080p )
	self.id = "MapVoteButton"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	self:setUseStencil( true )
	local MapVoteButtonBackground = nil
	
	MapVoteButtonBackground = MenuBuilder.BuildRegisteredType( "MapVoteButtonBackground", {
		controllerIndex = f3_local1
	} )
	MapVoteButtonBackground.id = "MapVoteButtonBackground"
	MapVoteButtonBackground.MapBackground:SetVMax( 1, 0 )
	MapVoteButtonBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	MapVoteButtonBackground:SubscribeToModelThroughElement( self, "mapImage", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.mapImage:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			MapVoteButtonBackground.MapBackground:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( MapVoteButtonBackground )
	self.MapVoteButtonBackground = MapVoteButtonBackground
	
	local GameTypeName = nil
	
	GameTypeName = LUI.UIStyledText.new()
	GameTypeName.id = "GameTypeName"
	GameTypeName:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	GameTypeName:SetFontSize( 20 * _1080p )
	GameTypeName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	GameTypeName:SetAlignment( LUI.Alignment.Left )
	GameTypeName:SetStartupDelay( 1000 )
	GameTypeName:SetLineHoldTime( 400 )
	GameTypeName:SetAnimMoveTime( 150 )
	GameTypeName:SetEndDelay( 1000 )
	GameTypeName:SetCrossfadeTime( 400 )
	GameTypeName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	GameTypeName:SetMaxVisibleLines( 1 )
	GameTypeName:SetShadowMinDistance( -0.2, 0 )
	GameTypeName:SetShadowMaxDistance( 0.2, 0 )
	GameTypeName:SetShadowRGBFromInt( 0, 0 )
	GameTypeName:SetOutlineRGBFromInt( 0, 0 )
	GameTypeName:SetDecodeLetterLength( 50 )
	GameTypeName:SetDecodeMaxRandChars( 5 )
	GameTypeName:SetDecodeUpdatesPerLetter( 10 )
	GameTypeName:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 106, _1080p * 490, _1080p * 10, _1080p * 30 )
	GameTypeName:SubscribeToModelThroughElement( self, "modeName", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.modeName:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			GameTypeName:setText( ToUpperCase( f5_local0 ), 0 )
		end
	end )
	self:addElement( GameTypeName )
	self.GameTypeName = GameTypeName
	
	local MapName = nil
	
	MapName = LUI.UIStyledText.new()
	MapName.id = "MapName"
	MapName:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	MapName:SetFontSize( 22 * _1080p )
	MapName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MapName:SetAlignment( LUI.Alignment.Left )
	MapName:SetShadowMinDistance( -0.2, 0 )
	MapName:SetShadowMaxDistance( 0.2, 0 )
	MapName:SetShadowRGBFromInt( 0, 0 )
	MapName:SetOutlineRGBFromInt( 0, 0 )
	MapName:SetDecodeLetterLength( 50 )
	MapName:SetDecodeMaxRandChars( 5 )
	MapName:SetDecodeUpdatesPerLetter( 10 )
	MapName:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 106, _1080p * 362, _1080p * -30, _1080p * -8 )
	MapName:SubscribeToModelThroughElement( self, "mapName", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.mapName:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			MapName:setText( ToUpperCase( f6_local0 ), 0 )
		end
	end )
	self:addElement( MapName )
	self.MapName = MapName
	
	local GameTypeBase = nil
	
	GameTypeBase = LUI.UIImage.new()
	GameTypeBase.id = "GameTypeBase"
	GameTypeBase:SetAlpha( 0.4, 0 )
	GameTypeBase:SetScale( -0.01, 0 )
	GameTypeBase:SetUseAA( true )
	GameTypeBase:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 21, _1080p * 99, _1080p * -39, _1080p * 39 )
	GameTypeBase:SubscribeToModelThroughElement( self, "modeImage", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.modeImage:GetValue( f3_local1 )
		if f7_local0 ~= nil then
			GameTypeBase:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	self:addElement( GameTypeBase )
	self.GameTypeBase = GameTypeBase
	
	local GameType = nil
	
	GameType = LUI.UIImage.new()
	GameType.id = "GameType"
	GameType:SetScale( -0.01, 0 )
	GameType:SetUseAA( true )
	GameType:SetBlendMode( BLEND_MODE.addWithAlpha )
	GameType:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 21, _1080p * 99, _1080p * -39, _1080p * 39 )
	GameType:SubscribeToModelThroughElement( self, "modeImage", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.modeImage:GetValue( f3_local1 )
		if f8_local0 ~= nil then
			GameType:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	self:addElement( GameType )
	self.GameType = GameType
	
	local VoteLabel = nil
	
	VoteLabel = LUI.UIStyledText.new()
	VoteLabel.id = "VoteLabel"
	VoteLabel:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	VoteLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_VOTES" ) ), 0 )
	VoteLabel:SetFontSize( 22 * _1080p )
	VoteLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	VoteLabel:SetAlignment( LUI.Alignment.Left )
	VoteLabel:SetShadowMinDistance( -0.2, 0 )
	VoteLabel:SetShadowMaxDistance( 0.2, 0 )
	VoteLabel:SetShadowRGBFromInt( 0, 0 )
	VoteLabel:SetOutlineRGBFromInt( 0, 0 )
	VoteLabel:SetDecodeLetterLength( 50 )
	VoteLabel:SetDecodeMaxRandChars( 5 )
	VoteLabel:SetDecodeUpdatesPerLetter( 10 )
	VoteLabel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -134, _1080p * -40, _1080p * 4, _1080p * 26 )
	self:addElement( VoteLabel )
	self.VoteLabel = VoteLabel
	
	local VoteCount = nil
	
	VoteCount = LUI.UIText.new()
	VoteCount.id = "VoteCount"
	VoteCount:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	VoteCount:SetFontSize( 22 * _1080p )
	VoteCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	VoteCount:SetAlignment( LUI.Alignment.Right )
	VoteCount:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -58, _1080p * -14, _1080p * 4, _1080p * 26 )
	VoteCount:SubscribeToModelThroughElement( self, "votes", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.votes:GetValue( f3_local1 )
		if f9_local0 ~= nil then
			VoteCount:setText( f9_local0, 0 )
		end
	end )
	self:addElement( VoteCount )
	self.VoteCount = VoteCount
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		GameTypeName:RegisterAnimationSequence( "VoteComplete", {
			{
				function ()
					return self.GameTypeName:SetAlpha( 1, 0 )
				end,
				function ()
					return self.GameTypeName:SetAlpha( 0, 400, LUI.EASING.outCubic )
				end
			}
		} )
		MapName:RegisterAnimationSequence( "VoteComplete", {
			{
				function ()
					return self.MapName:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MapName:SetAlpha( 0, 400, LUI.EASING.outCubic )
				end
			}
		} )
		GameTypeBase:RegisterAnimationSequence( "VoteComplete", {
			{
				function ()
					return self.GameTypeBase:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 21, _1080p * 99, _1080p * -39, _1080p * 39, 0 )
				end,
				function ()
					return self.GameTypeBase:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 21, _1080p * 99, 0, 0, 400, LUI.EASING.outCubic )
				end
			}
		} )
		GameType:RegisterAnimationSequence( "VoteComplete", {
			{
				function ()
					return self.GameType:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 21, _1080p * 99, _1080p * -39, _1080p * 39, 0 )
				end,
				function ()
					return self.GameType:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 21, _1080p * 99, 0, 0, 400, LUI.EASING.outCubic )
				end
			}
		} )
		VoteLabel:RegisterAnimationSequence( "VoteComplete", {
			{
				function ()
					return self.VoteLabel:SetAlpha( 0.75, 0 )
				end,
				function ()
					return self.VoteLabel:SetAlpha( 0, 400, LUI.EASING.outCubic )
				end
			}
		} )
		VoteCount:RegisterAnimationSequence( "VoteComplete", {
			{
				function ()
					return self.VoteCount:SetAlpha( 1, 0 )
				end,
				function ()
					return self.VoteCount:SetAlpha( 1, 400, LUI.EASING.outCubic )
				end
			}
		} )
		self._sequences.VoteComplete = function ()
			GameTypeName:AnimateSequence( "VoteComplete" )
			MapName:AnimateSequence( "VoteComplete" )
			GameTypeBase:AnimateSequence( "VoteComplete" )
			GameType:AnimateSequence( "VoteComplete" )
			VoteLabel:AnimateSequence( "VoteComplete" )
			VoteCount:AnimateSequence( "VoteComplete" )
		end
		
		GameTypeName:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.GameTypeName:SetRGBFromTable( SWATCHES.text.primaryText, 0 )
				end,
				function ()
					return self.GameTypeName:SetRGBFromTable( SWATCHES.HUD.normal, 150, LUI.EASING.inCubic )
				end
			},
			{
				function ()
					return self.GameTypeName:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 106, _1080p * 362, _1080p * 10, _1080p * 30, 0 )
				end,
				function ()
					return self.GameTypeName:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 120, _1080p * 380, _1080p * 10, _1080p * 30, 150, LUI.EASING.inCubic )
				end
			}
		} )
		MapName:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.MapName:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end,
				function ()
					return self.MapName:SetRGBFromTable( SWATCHES.HUD.normal, 150, LUI.EASING.inCubic )
				end
			},
			{
				function ()
					return self.MapName:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 106, _1080p * 362, _1080p * -30, _1080p * -8, 0 )
				end,
				function ()
					return self.MapName:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 120, _1080p * 380, _1080p * -30, _1080p * -8, 150, LUI.EASING.inCubic )
				end
			}
		} )
		VoteLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.VoteLabel:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end,
				function ()
					return self.VoteLabel:SetRGBFromTable( SWATCHES.genericButton.textFocus, 150, LUI.EASING.outCubic )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			GameTypeName:AnimateSequence( "ButtonOver" )
			MapName:AnimateSequence( "ButtonOver" )
			VoteLabel:AnimateSequence( "ButtonOver" )
		end
		
		GameTypeName:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.GameTypeName:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
				end,
				function ()
					return self.GameTypeName:SetRGBFromTable( SWATCHES.genericButton.textDefault, 80, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.GameTypeName:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 120, _1080p * 380, _1080p * 10, _1080p * 30, 0 )
				end,
				function ()
					return self.GameTypeName:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 106, _1080p * 362, _1080p * 10, _1080p * 30, 79, LUI.EASING.outQuadratic )
				end
			}
		} )
		MapName:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.MapName:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
				end,
				function ()
					return self.MapName:SetRGBFromTable( SWATCHES.genericButton.textDefault, 80, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.MapName:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 120, _1080p * 380, _1080p * -30, _1080p * -8, 0 )
				end,
				function ()
					return self.MapName:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 106, _1080p * 362, _1080p * -30, _1080p * -8, 79, LUI.EASING.outQuadratic )
				end
			}
		} )
		VoteLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.VoteLabel:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
				end,
				function ()
					return self.VoteLabel:SetRGBFromTable( SWATCHES.genericButton.textDefault, 80, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.VoteLabel:SetAlpha( 1, 80, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			GameTypeName:AnimateSequence( "ButtonUp" )
			MapName:AnimateSequence( "ButtonUp" )
			VoteLabel:AnimateSequence( "ButtonUp" )
		end
		
		GameTypeName:RegisterAnimationSequence( "VoteStart", {
			{
				function ()
					return self.GameTypeName:SetAlpha( 0, 0 )
				end,
				function ()
					return self.GameTypeName:SetAlpha( 1, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		MapName:RegisterAnimationSequence( "VoteStart", {
			{
				function ()
					return self.MapName:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MapName:SetAlpha( 1, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		GameTypeBase:RegisterAnimationSequence( "VoteStart", {
			{
				function ()
					return self.GameTypeBase:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 21, _1080p * 99, 0, 0, 0 )
				end,
				function ()
					return self.GameTypeBase:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 21, _1080p * 99, _1080p * -39, _1080p * 39, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		GameType:RegisterAnimationSequence( "VoteStart", {
			{
				function ()
					return self.GameType:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 21, _1080p * 99, 0, 0, 0 )
				end,
				function ()
					return self.GameType:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 21, _1080p * 99, _1080p * -39, _1080p * 39, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		VoteLabel:RegisterAnimationSequence( "VoteStart", {
			{
				function ()
					return self.VoteLabel:SetAlpha( 0, 0 )
				end,
				function ()
					return self.VoteLabel:SetAlpha( 1, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		VoteCount:RegisterAnimationSequence( "VoteStart", {
			{
				function ()
					return self.VoteCount:SetAlpha( 0, 0 )
				end,
				function ()
					return self.VoteCount:SetAlpha( 1, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.VoteStart = function ()
			GameTypeName:AnimateSequence( "VoteStart" )
			MapName:AnimateSequence( "VoteStart" )
			GameTypeBase:AnimateSequence( "VoteStart" )
			GameType:AnimateSequence( "VoteStart" )
			VoteLabel:AnimateSequence( "VoteStart" )
			VoteCount:AnimateSequence( "VoteStart" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f61_arg0, f61_arg1 )
		local f61_local0 = f61_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f62_arg0, f62_arg1 )
		local f62_local0 = f62_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:SubscribeToModel( DataSources.frontEnd.lobby.votingComplete:GetModel( f3_local1 ), function ()
		if DataSources.frontEnd.lobby.votingComplete:GetValue( f3_local1 ) ~= nil and DataSources.frontEnd.lobby.votingComplete:GetValue( f3_local1 ) == true then
			ACTIONS.AnimateSequence( self, "VoteComplete" )
		end
		if DataSources.frontEnd.lobby.votingComplete:GetValue( f3_local1 ) ~= nil and DataSources.frontEnd.lobby.votingComplete:GetValue( f3_local1 ) == false then
			ACTIONS.AnimateSequence( self, "VoteStart" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "MapVoteButton", MapVoteButton )
LockTable( _M )
