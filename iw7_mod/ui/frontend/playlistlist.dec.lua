local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PlaylistList( menu, controller )
	local self = LUI.UIVerticalStackedLayout.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 592 * _1080p )
	self.id = "PlaylistList"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:SetSpacing( 10 * _1080p )
	local PlaylistButtons = nil
	
	PlaylistButtons = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 14,
		controllerIndex = f1_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "PlaylistButton", {
				controllerIndex = f1_local1
			} )
		end,
		wrapX = false,
		wrapY = true,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 30,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = true,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	PlaylistButtons.id = "PlaylistButtons"
	PlaylistButtons:setUseStencil( false )
	PlaylistButtons:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 550 )
	self:addElement( PlaylistButtons )
	self.PlaylistButtons = PlaylistButtons
	
	local Description = nil
	
	Description = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f1_local1
	} )
	Description.id = "Description"
	Description.Description:SetRight( _1080p * 500, 0 )
	Description:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 560, _1080p * 592 )
	self:addElement( Description )
	self.Description = Description
	
	return self
end

MenuBuilder.registerType( "PlaylistList", PlaylistList )
LockTable( _M )
