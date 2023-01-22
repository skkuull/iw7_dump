local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local Players = nil
	
	Players = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 9,
		controllerIndex = f1_arg1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ScoreboardRow", {
				controllerIndex = f1_arg1
			} )
		end,
		refreshChild = function ( f3_arg0, f3_arg1, f3_arg2 )
			if f1_arg0._team then
				f3_arg0:SetPlayer( f1_arg0._team, f3_arg2 )
				f3_arg0:RefreshRowContent( false )
				f1_arg0:UpdateIndicatorArrowAlignment()
			end
		end,
		numRows = 9,
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
	Players:setUseStencil( true )
	Players:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 22, 0 )
	f1_arg0:addElement( Players )
	f1_arg0.Players = Players
	
	local TitleRow = nil
	
	TitleRow = MenuBuilder.BuildRegisteredType( "ScoreboardTitleRow", {
		controllerIndex = f1_arg1
	} )
	TitleRow.id = "TitleRow"
	TitleRow:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 22 )
	f1_arg0:addElement( TitleRow )
	f1_arg0.TitleRow = TitleRow
	
	SCOREBOARD.SetupScoreboard( f1_arg0, f1_arg2 )
end

function TeamScores( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 890 * _1080p, 0, 310 * _1080p )
	self.id = "TeamScores"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.75, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 22, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local IndicatorArrow = nil
	
	IndicatorArrow = MenuBuilder.BuildRegisteredType( "IndicatorArrow", {
		controllerIndex = f4_local1
	} )
	IndicatorArrow.id = "IndicatorArrow"
	IndicatorArrow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -10, _1080p * 10, 0, _1080p * 15 )
	self:addElement( IndicatorArrow )
	self.IndicatorArrow = IndicatorArrow
	
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "TeamScores", TeamScores )
LockTable( _M )
