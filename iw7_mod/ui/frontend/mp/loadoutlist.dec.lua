local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LoadoutList( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 360 * _1080p, 0, 354 * _1080p )
	self.id = "LoadoutList"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Loadouts = nil
	
	Loadouts = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 10,
		controllerIndex = f1_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "SelectLoadoutButtonWrapper", {
				controllerIndex = f1_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 360,
		rowHeight = _1080p * 30,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Loadouts.id = "Loadouts"
	Loadouts:setUseStencil( false )
	Loadouts:SetGridDataSourceThroughElement( self, nil )
	Loadouts:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 360, 0, 0 )
	self:addElement( Loadouts )
	self.Loadouts = Loadouts
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Loadouts:RegisterAnimationSequence( "OpenLoadoutEdit", {
			{
				function ()
					return self.Loadouts:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1036.93, _1080p * -516.93, _1080p * 66, _1080p * 957, 500 )
				end
			}
		} )
		self._sequences.OpenLoadoutEdit = function ()
			Loadouts:AnimateSequence( "OpenLoadoutEdit" )
		end
		
		Loadouts:RegisterAnimationSequence( "CloseLoadoutEdit", {
			{
				function ()
					return self.Loadouts:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 143.07, _1080p * 663.07, _1080p * 66, _1080p * 957, 500 )
				end
			}
		} )
		self._sequences.CloseLoadoutEdit = function ()
			Loadouts:AnimateSequence( "CloseLoadoutEdit" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "LoadoutList", LoadoutList )
LockTable( _M )
