local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ()
	local f1_local0 = LUI.DataSourceFromList.new( LUI.DataSourceInGlobalModel.new( "alwaysLoaded.activeParty.members.count" ) )
	f1_local0.MakeDataSourceAtIndex = GetLobbyMemberDataSourceAtIndex( "alwaysLoaded.activeParty.members" )
	return f1_local0
end

function PostLoadFunc( f2_arg0 )
	assert( f2_arg0.List )
	f2_arg0.List:SetGridDataSource( f0_local0() )
end

function GameBattlesLobbyMembers( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 250 * _1080p )
	self.id = "GameBattlesLobbyMembers"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local StatusBG = nil
	
	StatusBG = LUI.UIImage.new()
	StatusBG.id = "StatusBG"
	StatusBG:SetRGBFromInt( 0, 0 )
	StatusBG:SetAlpha( 0.7, 0 )
	StatusBG:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 45, _1080p * 78 )
	self:addElement( StatusBG )
	self.StatusBG = StatusBG
	
	local TeamNameBG = nil
	
	TeamNameBG = LUI.UIImage.new()
	TeamNameBG.id = "TeamNameBG"
	TeamNameBG:SetRGBFromInt( 0, 0 )
	TeamNameBG:SetAlpha( 0.7, 0 )
	TeamNameBG:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, 0, _1080p * 45 )
	self:addElement( TeamNameBG )
	self.TeamNameBG = TeamNameBG
	
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 79, _1080p * 83 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local Divider = nil
	
	Divider = LUI.UIImage.new()
	Divider.id = "Divider"
	Divider:SetRGBFromTable( SWATCHES.Lobby.memberClanText, 0 )
	Divider:SetAlpha( 0.6, 0 )
	Divider:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4, _1080p * 600, _1080p * 78, _1080p * 79 )
	self:addElement( Divider )
	self.Divider = Divider
	
	local TeamName = nil
	
	TeamName = LUI.UIStyledText.new()
	TeamName.id = "TeamName"
	TeamName:setText( "", 0 )
	TeamName:SetFontSize( 45 * _1080p )
	TeamName:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	TeamName:SetAlignment( LUI.Alignment.Left )
	TeamName:SetStartupDelay( 1000 )
	TeamName:SetLineHoldTime( 400 )
	TeamName:SetAnimMoveTime( 600 )
	TeamName:SetEndDelay( 1000 )
	TeamName:SetCrossfadeTime( 400 )
	TeamName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	TeamName:SetMaxVisibleLines( 1 )
	TeamName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 43, _1080p * 599, 0, _1080p * 45 )
	self:addElement( TeamName )
	self.TeamName = TeamName
	
	local StatusLabel = nil
	
	StatusLabel = LUI.UIText.new()
	StatusLabel.id = "StatusLabel"
	StatusLabel:setText( "", 0 )
	StatusLabel:SetFontSize( 20 * _1080p )
	StatusLabel:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	StatusLabel:SetAlignment( LUI.Alignment.Left )
	StatusLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 9.25, _1080p * 590.75, _1080p * 51.5, _1080p * 71.5 )
	self:addElement( StatusLabel )
	self.StatusLabel = StatusLabel
	
	local List = nil
	
	List = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		controllerIndex = f3_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "GameBattlesLobbyMember", {
				controllerIndex = f3_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 600,
		rowHeight = _1080p * 32,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = true,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	List.id = "List"
	List:setUseStencil( false )
	List:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 83, _1080p * 295 )
	self:addElement( List )
	self.List = List
	
	local WinsCountDigit = nil
	
	WinsCountDigit = LUI.UIText.new()
	WinsCountDigit.id = "WinsCountDigit"
	WinsCountDigit:setText( "8", 0 )
	WinsCountDigit:SetFontSize( 45 * _1080p )
	WinsCountDigit:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	WinsCountDigit:SetAlignment( LUI.Alignment.Left )
	WinsCountDigit:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4, _1080p * 30.64, _1080p * 1, _1080p * 44 )
	self:addElement( WinsCountDigit )
	self.WinsCountDigit = WinsCountDigit
	
	local Gradient = nil
	
	Gradient = LUI.UIImage.new()
	Gradient.id = "Gradient"
	Gradient:SetRGBFromInt( 7434609, 0 )
	Gradient:SetAlpha( 0.5, 0 )
	Gradient:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	Gradient:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, _1080p * 43, _1080p * 44 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		StatusBG:RegisterAnimationSequence( "NoTeamName", {
			{
				function ()
					return self.StatusBG:SetAlpha( 0, 0 )
				end
			}
		} )
		TeamNameBG:RegisterAnimationSequence( "NoTeamName", {
			{
				function ()
					return self.TeamNameBG:SetAlpha( 0, 0 )
				end
			}
		} )
		DropShadow:RegisterAnimationSequence( "NoTeamName", {
			{
				function ()
					return self.DropShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "NoTeamName", {
			{
				function ()
					return self.Divider:SetAlpha( 0, 0 )
				end
			}
		} )
		WinsCountDigit:RegisterAnimationSequence( "NoTeamName", {
			{
				function ()
					return self.WinsCountDigit:SetAlpha( 0, 0 )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "NoTeamName", {
			{
				function ()
					return self.Gradient:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NoTeamName = function ()
			StatusBG:AnimateSequence( "NoTeamName" )
			TeamNameBG:AnimateSequence( "NoTeamName" )
			DropShadow:AnimateSequence( "NoTeamName" )
			Divider:AnimateSequence( "NoTeamName" )
			WinsCountDigit:AnimateSequence( "NoTeamName" )
			Gradient:AnimateSequence( "NoTeamName" )
		end
		
		StatusBG:RegisterAnimationSequence( "WithTeamName", {
			{
				function ()
					return self.StatusBG:SetAlpha( 0.7, 0 )
				end
			}
		} )
		TeamNameBG:RegisterAnimationSequence( "WithTeamName", {
			{
				function ()
					return self.TeamNameBG:SetAlpha( 0.7, 0 )
				end
			}
		} )
		DropShadow:RegisterAnimationSequence( "WithTeamName", {
			{
				function ()
					return self.DropShadow:SetAlpha( 0.3, 0 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "WithTeamName", {
			{
				function ()
					return self.Divider:SetAlpha( 0.6, 0 )
				end
			}
		} )
		WinsCountDigit:RegisterAnimationSequence( "WithTeamName", {
			{
				function ()
					return self.WinsCountDigit:SetAlpha( 1, 0 )
				end
			}
		} )
		Gradient:RegisterAnimationSequence( "WithTeamName", {
			{
				function ()
					return self.Gradient:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.WithTeamName = function ()
			StatusBG:AnimateSequence( "WithTeamName" )
			TeamNameBG:AnimateSequence( "WithTeamName" )
			DropShadow:AnimateSequence( "WithTeamName" )
			Divider:AnimateSequence( "WithTeamName" )
			WinsCountDigit:AnimateSequence( "WithTeamName" )
			Gradient:AnimateSequence( "WithTeamName" )
		end
		
		StatusBG:RegisterAnimationSequence( "CODCasters", {
			{
				function ()
					return self.StatusBG:SetAlpha( 0, 0 )
				end
			}
		} )
		DropShadow:RegisterAnimationSequence( "CODCasters", {
			{
				function ()
					return self.DropShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "CODCasters", {
			{
				function ()
					return self.Divider:SetAlpha( 0, 0 )
				end
			}
		} )
		TeamName:RegisterAnimationSequence( "CODCasters", {
			{
				function ()
					return self.TeamName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 9.25, _1080p * 590.75, 0, _1080p * 45, 0 )
				end
			}
		} )
		StatusLabel:RegisterAnimationSequence( "CODCasters", {
			{
				function ()
					return self.StatusLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		List:RegisterAnimationSequence( "CODCasters", {
			{
				function ()
					return self.List:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 50, _1080p * 295, 0 )
				end
			}
		} )
		WinsCountDigit:RegisterAnimationSequence( "CODCasters", {
			{
				function ()
					return self.WinsCountDigit:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.CODCasters = function ()
			StatusBG:AnimateSequence( "CODCasters" )
			DropShadow:AnimateSequence( "CODCasters" )
			Divider:AnimateSequence( "CODCasters" )
			TeamName:AnimateSequence( "CODCasters" )
			StatusLabel:AnimateSequence( "CODCasters" )
			List:AnimateSequence( "CODCasters" )
			WinsCountDigit:AnimateSequence( "CODCasters" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "GameBattlesLobbyMembers", GameBattlesLobbyMembers )
LockTable( _M )
