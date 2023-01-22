local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PersonalizeItemGrid( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 621 * _1080p, 0, 694 * _1080p )
	self.id = "PersonalizeItemGrid"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local blackbar = nil
	
	blackbar = LUI.UIImage.new()
	blackbar.id = "blackbar"
	blackbar:SetRGBFromInt( 6710886, 0 )
	blackbar:SetAlpha( 0.6, 0 )
	blackbar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 620, _1080p * 631, _1080p * 655 )
	self:addElement( blackbar )
	self.blackbar = blackbar
	
	local ItemGrid = nil
	
	ItemGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 4,
		maxVisibleRows = 4,
		controllerIndex = f1_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "PersonalizeItem", {
				controllerIndex = f1_local1
			} )
		end,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 8,
		spacingY = _1080p * 8,
		columnWidth = _1080p * 149,
		rowHeight = _1080p * 149,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	ItemGrid.id = "ItemGrid"
	ItemGrid:setUseStencil( true )
	ItemGrid:SetGridDataSourceThroughElement( self, "attachments" )
	ItemGrid:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 620, 0, _1080p * 620 )
	self:addElement( ItemGrid )
	self.ItemGrid = ItemGrid
	
	local Scrollbar = nil
	
	Scrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f1_local1
	} )
	Scrollbar.id = "Scrollbar"
	Scrollbar:SetAlpha( 0, 0 )
	Scrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -16, 0, 0, _1080p * 630 )
	self:addElement( Scrollbar )
	self.Scrollbar = Scrollbar
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f1_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 382.5, _1080p * 402.5, _1080p * 624, _1080p * 664 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f1_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 217.5, _1080p * 237.5, _1080p * 623, _1080p * 663 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 237.5, _1080p * 382.5, _1080p * 631, _1080p * 655 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		blackbar:RegisterAnimationSequence( "CamoSelect", {
			{
				function ()
					return self.blackbar:SetAlpha( 0.8, 0 )
				end
			}
		} )
		ItemGrid:RegisterAnimationSequence( "CamoSelect", {
			{
				function ()
					return self.ItemGrid:SetAlpha( 1, 0 )
				end
			}
		} )
		ArrowUp:RegisterAnimationSequence( "CamoSelect", {
			{
				function ()
					return self.ArrowUp:SetAlpha( 1, 0 )
				end
			}
		} )
		ArrowDown:RegisterAnimationSequence( "CamoSelect", {
			{
				function ()
					return self.ArrowDown:SetAlpha( 1, 0 )
				end
			}
		} )
		ListCount:RegisterAnimationSequence( "CamoSelect", {
			{
				function ()
					return self.ListCount:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.CamoSelect = function ()
			blackbar:AnimateSequence( "CamoSelect" )
			ItemGrid:AnimateSequence( "CamoSelect" )
			ArrowUp:AnimateSequence( "CamoSelect" )
			ArrowDown:AnimateSequence( "CamoSelect" )
			ListCount:AnimateSequence( "CamoSelect" )
		end
		
		blackbar:RegisterAnimationSequence( "WeaponPersonalize", {
			{
				function ()
					return self.blackbar:SetAlpha( 0, 0 )
				end
			}
		} )
		ItemGrid:RegisterAnimationSequence( "WeaponPersonalize", {
			{
				function ()
					return self.ItemGrid:SetAlpha( 0, 0 )
				end
			}
		} )
		ArrowUp:RegisterAnimationSequence( "WeaponPersonalize", {
			{
				function ()
					return self.ArrowUp:SetAlpha( 0, 0 )
				end
			}
		} )
		ArrowDown:RegisterAnimationSequence( "WeaponPersonalize", {
			{
				function ()
					return self.ArrowDown:SetAlpha( 0, 0 )
				end
			}
		} )
		ListCount:RegisterAnimationSequence( "WeaponPersonalize", {
			{
				function ()
					return self.ListCount:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.WeaponPersonalize = function ()
			blackbar:AnimateSequence( "WeaponPersonalize" )
			ItemGrid:AnimateSequence( "WeaponPersonalize" )
			ArrowUp:AnimateSequence( "WeaponPersonalize" )
			ArrowDown:AnimateSequence( "WeaponPersonalize" )
			ListCount:AnimateSequence( "WeaponPersonalize" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f1_local9 = LUI.UIScrollbar.new
	local f1_local10 = {
		direction = LUI.DIRECTION.vertical,
		eventListener = Scrollbar,
		startCap = Scrollbar.startCap,
		endCap = Scrollbar.endCap
	}
	local f1_local11 = Scrollbar.sliderArea
	if f1_local11 then
		f1_local11 = Scrollbar.sliderArea.slider
	end
	f1_local10.slider = f1_local11
	f1_local11 = Scrollbar.sliderArea
	if f1_local11 then
		f1_local11 = Scrollbar.sliderArea.fixedSizeSlider
	end
	f1_local10.fixedSizeSlider = f1_local11
	ItemGrid:AddScrollbar( f1_local9( f1_local10 ) )
	ItemGrid:AddArrow( ArrowUp )
	ItemGrid:AddArrow( ArrowDown )
	ItemGrid:AddItemNumbers( ListCount )
	return self
end

MenuBuilder.registerType( "PersonalizeItemGrid", PersonalizeItemGrid )
LockTable( _M )
