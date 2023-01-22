local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0 )
	SCOREBOARD.SetupScoreboard( f1_arg0 )
	f1_arg0:SetTeam( Teams.free )
end

function FFATeamScores( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 894 * _1080p, 0, 710 * _1080p )
	self.id = "FFATeamScores"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local BackgroundColorTop = nil
	
	BackgroundColorTop = LUI.UIImage.new()
	BackgroundColorTop.id = "BackgroundColorTop"
	BackgroundColorTop:SetAlpha( 0.6, 0 )
	BackgroundColorTop:setImage( RegisterMaterial( "widg_teamscore_background_top" ), 0 )
	BackgroundColorTop:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 37, _1080p * 895, 0, _1080p * -435 )
	self:addElement( BackgroundColorTop )
	self.BackgroundColorTop = BackgroundColorTop
	
	local BackgroundBacking = nil
	
	BackgroundBacking = LUI.UIImage.new()
	BackgroundBacking.id = "BackgroundBacking"
	BackgroundBacking:SetRGBFromInt( 0, 0 )
	BackgroundBacking:SetAlpha( 0.6, 0 )
	BackgroundBacking:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 37, _1080p * 1, _1080p * 275, _1080p * 585 )
	self:addElement( BackgroundBacking )
	self.BackgroundBacking = BackgroundBacking
	
	local BackgroundColor = nil
	
	BackgroundColor = LUI.UIImage.new()
	BackgroundColor.id = "BackgroundColor"
	BackgroundColor:SetAlpha( 0.6, 0 )
	BackgroundColor:SetZRotation( 180, 0 )
	BackgroundColor:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	BackgroundColor:SetBlendMode( BLEND_MODE.addWithAlpha )
	BackgroundColor:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 37, _1080p * 1, _1080p * 275, _1080p * 585 )
	self:addElement( BackgroundColor )
	self.BackgroundColor = BackgroundColor
	
	local ScoreboardTitleRowFriendly = nil
	
	ScoreboardTitleRowFriendly = MenuBuilder.BuildRegisteredType( "ScoreboardTitleRow", {
		controllerIndex = f2_local1
	} )
	ScoreboardTitleRowFriendly.id = "ScoreboardTitleRowFriendly"
	ScoreboardTitleRowFriendly:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 37, _1080p * 895, _1080p * 275, _1080p * 297 )
	self:addElement( ScoreboardTitleRowFriendly )
	self.ScoreboardTitleRowFriendly = ScoreboardTitleRowFriendly
	
	local Players = nil
	
	Players = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 18,
		controllerIndex = f2_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ScoreboardRow", {
				controllerIndex = f2_local1
			} )
		end,
		refreshChild = function ( f4_arg0, f4_arg1, f4_arg2 )
			
		end,
		numRows = 18,
		numColumns = 1,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 858,
		rowHeight = _1080p * 32,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Players.id = "Players"
	Players:setUseStencil( false )
	Players:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 37, _1080p * -63, _1080p * 297, _1080p * 873 )
	self:addElement( Players )
	self.Players = Players
	
	local TeamInfo = nil
	
	TeamInfo = MenuBuilder.BuildRegisteredType( "TeamInfo", {
		controllerIndex = f2_local1
	} )
	TeamInfo.id = "TeamInfo"
	TeamInfo:SetDataSourceThroughElement( self, nil )
	TeamInfo.Score:setText( "100", 0 )
	TeamInfo.TimeToBeat:setText( Engine.Localize( "MENU_NEW" ), 0 )
	TeamInfo:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 115, _1080p * 5, 0, _1080p * 275 )
	self:addElement( TeamInfo )
	self.TeamInfo = TeamInfo
	
	TeamInfo:SetDataSourceThroughElement( self, nil )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "FFATeamScores", FFATeamScores )
LockTable( _M )
