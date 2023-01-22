local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MatchDetails( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 140 * _1080p )
	self.id = "MatchDetails"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local GameType = nil
	
	GameType = LUI.UIStyledText.new()
	GameType.id = "GameType"
	GameType:SetAlpha( 0.5, 0 )
	GameType:SetFontSize( 32 * _1080p )
	GameType:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GameType:SetAlignment( LUI.Alignment.Left )
	GameType:SetDecodeLetterLength( 25 )
	GameType:SetDecodeMaxRandChars( 3 )
	GameType:SetDecodeUpdatesPerLetter( 4 )
	GameType:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 15, 0, _1080p * 24, _1080p * 56 )
	GameType:SubscribeToModel( DataSources.frontEnd.lobby.gameTypeName:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.frontEnd.lobby.gameTypeName:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			GameType:setText( ToUpperCase( f2_local0 ), 0 )
		end
	end )
	self:addElement( GameType )
	self.GameType = GameType
	
	local MapName = nil
	
	MapName = LUI.UIStyledText.new()
	MapName.id = "MapName"
	MapName:SetAlpha( 0.5, 0 )
	MapName:SetFontSize( 32 * _1080p )
	MapName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MapName:SetAlignment( LUI.Alignment.Left )
	MapName:SetStartupDelay( 1000 )
	MapName:SetLineHoldTime( 400 )
	MapName:SetAnimMoveTime( 150 )
	MapName:SetEndDelay( 1000 )
	MapName:SetCrossfadeTime( 400 )
	MapName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	MapName:SetMaxVisibleLines( 1 )
	MapName:SetDecodeLetterLength( 25 )
	MapName:SetDecodeMaxRandChars( 3 )
	MapName:SetDecodeUpdatesPerLetter( 4 )
	MapName:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 15, 0, _1080p * 89, _1080p * 121 )
	MapName:SubscribeToModel( DataSources.frontEnd.lobby.mapName:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.frontEnd.lobby.mapName:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			MapName:setText( ToUpperCase( f3_local0 ), 0 )
		end
	end )
	self:addElement( MapName )
	self.MapName = MapName
	
	local GameModeHeader = nil
	
	GameModeHeader = LUI.UIStyledText.new()
	GameModeHeader.id = "GameModeHeader"
	GameModeHeader:setText( ToUpperCase( Engine.Localize( "MENU_GAME_TYPE" ) ), 0 )
	GameModeHeader:SetFontSize( 24 * _1080p )
	GameModeHeader:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	GameModeHeader:SetAlignment( LUI.Alignment.Left )
	GameModeHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 15, 0, 0, _1080p * 24 )
	self:addElement( GameModeHeader )
	self.GameModeHeader = GameModeHeader
	
	local MapHeader = nil
	
	MapHeader = LUI.UIStyledText.new()
	MapHeader.id = "MapHeader"
	MapHeader:setText( ToUpperCase( Engine.Localize( "GAME_VOTE_MAP" ) ), 0 )
	MapHeader:SetFontSize( 24 * _1080p )
	MapHeader:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MapHeader:SetAlignment( LUI.Alignment.Left )
	MapHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 15, 0, _1080p * 65, _1080p * 89 )
	self:addElement( MapHeader )
	self.MapHeader = MapHeader
	
	local Node1 = nil
	
	Node1 = LUI.UIImage.new()
	Node1.id = "Node1"
	Node1:SetAlpha( 0.5, 0 )
	Node1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 10, 0, _1080p * 50 )
	self:addElement( Node1 )
	self.Node1 = Node1
	
	local Node2 = nil
	
	Node2 = LUI.UIImage.new()
	Node2.id = "Node2"
	Node2:SetAlpha( 0.5, 0 )
	Node2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 10, _1080p * 64, _1080p * 114 )
	self:addElement( Node2 )
	self.Node2 = Node2
	
	local ArabicNode1 = nil
	
	ArabicNode1 = LUI.UIImage.new()
	ArabicNode1.id = "ArabicNode1"
	ArabicNode1:SetAlpha( 0, 0 )
	ArabicNode1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 6, _1080p * 16, 0, _1080p * 50 )
	self:addElement( ArabicNode1 )
	self.ArabicNode1 = ArabicNode1
	
	local ArabicNode2 = nil
	
	ArabicNode2 = LUI.UIImage.new()
	ArabicNode2.id = "ArabicNode2"
	ArabicNode2:SetAlpha( 0, 0 )
	ArabicNode2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 6, _1080p * 16, _1080p * 64, _1080p * 114 )
	self:addElement( ArabicNode2 )
	self.ArabicNode2 = ArabicNode2
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Node1:RegisterAnimationSequence( "IsArabic", {
			{
				function ()
					return self.Node1:SetAlpha( 0, 0 )
				end
			}
		} )
		Node2:RegisterAnimationSequence( "IsArabic", {
			{
				function ()
					return self.Node2:SetAlpha( 0, 0 )
				end
			}
		} )
		ArabicNode1:RegisterAnimationSequence( "IsArabic", {
			{
				function ()
					return self.ArabicNode1:SetAlpha( 0.5, 0 )
				end
			}
		} )
		ArabicNode2:RegisterAnimationSequence( "IsArabic", {
			{
				function ()
					return self.ArabicNode2:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.IsArabic = function ()
			Node1:AnimateSequence( "IsArabic" )
			Node2:AnimateSequence( "IsArabic" )
			ArabicNode1:AnimateSequence( "IsArabic" )
			ArabicNode2:AnimateSequence( "IsArabic" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "IsArabic" )
	end
	return self
end

MenuBuilder.registerType( "MatchDetails", MatchDetails )
LockTable( _M )
