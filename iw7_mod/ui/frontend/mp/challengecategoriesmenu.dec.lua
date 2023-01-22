local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	if Engine.IsAliensMode() then
		f1_arg0:SetDataSource( DataSources.alwaysLoaded.playerData.CP, f1_arg1 )
	else
		f1_arg0:SetDataSource( DataSources.alwaysLoaded.playerData.MP.ranked, f1_arg1 )
	end
end

function ChallengeCategoriesMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "ChallengeCategoriesMenu"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	self:playSound( "menu_open" )
	local f2_local2 = self
	local ButtonHelperBar0 = nil
	
	ButtonHelperBar0 = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f2_local1
	} )
	ButtonHelperBar0.id = "ButtonHelperBar0"
	ButtonHelperBar0:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar0 )
	self.ButtonHelperBar0 = ButtonHelperBar0
	
	local GridLayout0 = nil
	
	GridLayout0 = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		controllerIndex = f2_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ChallengeCategoryButton", {
				controllerIndex = f2_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 2,
		spacingY = _1080p * 2,
		columnWidth = _1080p * 700,
		rowHeight = _1080p * 85,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	GridLayout0.id = "GridLayout0"
	GridLayout0:setUseStencil( true )
	GridLayout0:SetGridDataSource( DataSources.frontEnd.MP.challengeCategories, f2_local1 )
	GridLayout0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 160, _1080p * 860, _1080p * 352, _1080p * 872 )
	self:addElement( GridLayout0 )
	self.GridLayout0 = GridLayout0
	
	local ChallengeScoreLabel = nil
	
	ChallengeScoreLabel = LUI.UIText.new()
	ChallengeScoreLabel.id = "ChallengeScoreLabel"
	ChallengeScoreLabel:setText( Engine.Localize( "LUA_MENU_CHALLENGE_SCORE" ), 0 )
	ChallengeScoreLabel:SetFontSize( 48 * _1080p )
	ChallengeScoreLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ChallengeScoreLabel:SetAlignment( LUI.Alignment.Left )
	ChallengeScoreLabel:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -329, _1080p * 110, _1080p * 205, _1080p * 253 )
	self:addElement( ChallengeScoreLabel )
	self.ChallengeScoreLabel = ChallengeScoreLabel
	
	local ChallengeScoreValue = nil
	
	ChallengeScoreValue = LUI.UIText.new()
	ChallengeScoreValue.id = "ChallengeScoreValue"
	ChallengeScoreValue:SetFontSize( 45 * _1080p )
	ChallengeScoreValue:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	ChallengeScoreValue:SetAlignment( LUI.Alignment.Right )
	ChallengeScoreValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 960, _1080p * 1180, _1080p * 205, _1080p * 250 )
	ChallengeScoreValue:SubscribeToModelThroughElement( self, "challengeScore", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.challengeScore:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			ChallengeScoreValue:setText( f4_local0, 0 )
		end
	end )
	self:addElement( ChallengeScoreValue )
	self.ChallengeScoreValue = ChallengeScoreValue
	
	self.addButtonHelperFunction = function ( f5_arg0, f5_arg1 )
		f5_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "right",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f6_arg0, f6_arg1 )
		local f6_local0 = f6_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "ChallengeCategoriesMenu", ChallengeCategoriesMenu )
LockTable( _M )
