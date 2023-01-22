local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RigVariantList( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 340 * _1080p, 0, 734 * _1080p )
	self.id = "RigVariantList"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local RigVariants = nil
	
	RigVariants = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		controllerIndex = f1_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "RigVariant", {
				controllerIndex = f1_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 18,
		spacingY = _1080p * 18,
		columnWidth = _1080p * 340,
		rowHeight = _1080p * 170,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	RigVariants.id = "RigVariants"
	RigVariants:setUseStencil( true )
	RigVariants:SetGridDataSourceThroughElement( self, nil )
	self:addElement( RigVariants )
	self.RigVariants = RigVariants
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RigVariants:RegisterAnimationSequence( "CloseEditRigItems", {
			{
				function ()
					return self.RigVariants:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 436, _1080p * 160, _1080p * 894, 500 )
				end
			}
		} )
		self._sequences.CloseEditRigItems = function ()
			RigVariants:AnimateSequence( "CloseEditRigItems" )
		end
		
		RigVariants:RegisterAnimationSequence( "OpenEditRigItems", {
			{
				function ()
					return self.RigVariants:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -617, _1080p * -277, _1080p * 160, _1080p * 894, 500 )
				end
			}
		} )
		self._sequences.OpenEditRigItems = function ()
			RigVariants:AnimateSequence( "OpenEditRigItems" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "RigVariantList", RigVariantList )
LockTable( _M )
