local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MLGScheduleTeams( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1150 * _1080p, 0, 263 * _1080p )
	self.id = "MLGScheduleTeams"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TeamABackground = nil
	
	TeamABackground = LUI.UIImage.new()
	TeamABackground.id = "TeamABackground"
	TeamABackground:SetRGBFromInt( 0, 0 )
	TeamABackground:SetAlpha( 0.75, 0 )
	TeamABackground:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 550, 0, _1080p * 49 )
	self:addElement( TeamABackground )
	self.TeamABackground = TeamABackground
	
	local TeamBBackground = nil
	
	TeamBBackground = LUI.UIImage.new()
	TeamBBackground.id = "TeamBBackground"
	TeamBBackground:SetRGBFromInt( 0, 0 )
	TeamBBackground:SetAlpha( 0.75, 0 )
	TeamBBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 600, _1080p * 1150, 0, _1080p * 49 )
	self:addElement( TeamBBackground )
	self.TeamBBackground = TeamBBackground
	
	local TeamAMembers = nil
	
	TeamAMembers = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		controllerIndex = f1_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "MLGScheduleTeamMember", {
				controllerIndex = f1_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 550,
		rowHeight = _1080p * 32,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	TeamAMembers.id = "TeamAMembers"
	TeamAMembers:setUseStencil( true )
	TeamAMembers:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 550, _1080p * 49, _1080p * 261 )
	self:addElement( TeamAMembers )
	self.TeamAMembers = TeamAMembers
	
	local TeamAName = nil
	
	TeamAName = LUI.UIText.new()
	TeamAName.id = "TeamAName"
	TeamAName:setText( "TEAM SOLOMID", 0 )
	TeamAName:SetFontSize( 45 * _1080p )
	TeamAName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TeamAName:SetAlignment( LUI.Alignment.Left )
	TeamAName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 9, _1080p * 509, 0, _1080p * 45 )
	self:addElement( TeamAName )
	self.TeamAName = TeamAName
	
	local TeamBMembers = nil
	
	TeamBMembers = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		controllerIndex = f1_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "MLGScheduleTeamMember", {
				controllerIndex = f1_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 550,
		rowHeight = _1080p * 32,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	TeamBMembers.id = "TeamBMembers"
	TeamBMembers:setUseStencil( true )
	TeamBMembers:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 600, _1080p * 1150, _1080p * 49, _1080p * 261 )
	self:addElement( TeamBMembers )
	self.TeamBMembers = TeamBMembers
	
	local TeamBName = nil
	
	TeamBName = LUI.UIText.new()
	TeamBName.id = "TeamBName"
	TeamBName:setText( "TEAM SOLOMID", 0 )
	TeamBName:SetFontSize( 45 * _1080p )
	TeamBName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TeamBName:SetAlignment( LUI.Alignment.Left )
	TeamBName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 608, _1080p * 1150, 0, _1080p * 45 )
	self:addElement( TeamBName )
	self.TeamBName = TeamBName
	
	return self
end

MenuBuilder.registerType( "MLGScheduleTeams", MLGScheduleTeams )
LockTable( _M )
