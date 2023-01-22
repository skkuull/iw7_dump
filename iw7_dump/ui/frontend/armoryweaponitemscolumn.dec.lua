local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	return function ()
		local f2_local0 = LUI.FlowManager.GetScopedData( f1_arg0 )
		return {
			x = 0,
			y = (f2_local0.contentOffset or 0) + (f1_arg0.Items:GetContentOffset( LUI.DIRECTION.vertical ) or 0)
		}
	end
	
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	assert( f3_arg0.Items )
	local f3_local0 = #f3_arg1.weapons
	f3_arg0.qualityData = f3_arg1
	f3_arg0.Items:SetNumColumns( 1 )
	f3_arg0.Items:SetNumRows( f3_local0 )
	f3_arg0.Items:RefreshContent()
end

f0_local2 = function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = LUI.FlowManager.GetScopedData( f4_arg0 )
	local Items = nil
	
	Items = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		controllerIndex = f4_arg1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ArmoryRNGButton", {
				controllerIndex = f4_arg1
			} )
		end,
		refreshChild = function ( f6_arg0, f6_arg1, f6_arg2 )
			f6_arg0:SetupQualityItemData( f4_arg1, f4_arg0.qualityData.weapons[f6_arg2 + 1] )
		end,
		numRows = 0,
		numColumns = 0,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 298.5,
		rowHeight = _1080p * 149,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Items.id = "Items"
	Items:setUseStencil( false )
	Items:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 298.5, 0, _1080p * 918.5 )
	f4_arg0:addElement( Items )
	f4_arg0.Items = Items
	
	local f4_local2 = LUI.DataSourceInGlobalModel.new( "frontEnd.MP.armory.weapons.gridFocus" )
	f4_arg0.Items:SetLastFocusIndexDataSource( f4_local2 )
	f4_arg0.Items.FocusChanged = function ( f7_arg0 )
		LUI.UIGrid.FocusChanged( f7_arg0 )
		local f7_local0 = LUI.FlowManager.GetScopedData( f7_arg0 )
		f7_local0.contentOffset = f4_local2:GetValue( f4_arg1 ) - f7_arg0:GetContentOffset( LUI.DIRECTION.vertical )
	end
	
	f4_arg0.SetupQualityWeaponData = f0_local1
	f4_arg0.Items:SetDefaultFocus( f0_local0( f4_arg0 ) )
	f4_arg0.Items:addEventHandler( "gain_focus", function ( f8_arg0, f8_arg1 )
		ACTIONS.AnimateSequence( f4_arg0, "ButtonOver" )
	end )
	f4_arg0.Items:addEventHandler( "lose_focus", function ( f9_arg0, f9_arg1 )
		ACTIONS.AnimateSequence( f4_arg0, "ButtonUp" )
	end )
end

function ArmoryWeaponItemsColumn( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 298.5 * _1080p, 0, 614 * _1080p )
	self.id = "ArmoryWeaponItemsColumn"
	self._animationSets = {}
	self._sequences = {}
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	local f10_local2 = self
	local f10_local3 = nil
	if Engine.InFrontend() then
		f10_local3 = LUI.UIBlur.new()
		f10_local3.id = "Blur"
		f10_local3:SetRGBFromInt( 12566463, 0 )
		f10_local3:SetBlurStrength( 2.75, 0 )
		self:addElement( f10_local3 )
		self.Blur = f10_local3
	end
	local f10_local4 = nil
	if Engine.InFrontend() then
		f10_local4 = LUI.UIImage.new()
		f10_local4.id = "DropShadow"
		f10_local4:SetRGBFromInt( 0, 0 )
		f10_local4:SetAlpha( 0.3, 0 )
		f10_local4:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f10_local4:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f10_local4 )
		self.DropShadow = f10_local4
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if Engine.InFrontend() then
			f10_local3:RegisterAnimationSequence( "ButtonOver", {
				{
					function ()
						return self.Blur:SetRGBFromInt( 8421504, 0 )
					end,
					function ()
						return self.Blur:SetRGBFromInt( 12566463, 300, LUI.EASING.inSine )
					end
				}
			} )
		end
		self._sequences.ButtonOver = function ()
			if Engine.InFrontend() then
				f10_local3:AnimateSequence( "ButtonOver" )
			end
		end
		
		if Engine.InFrontend() then
			f10_local3:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.Blur:SetRGBFromInt( 12566463, 0 )
					end
				}
			} )
		end
		self._sequences.ButtonUp = function ()
			if Engine.InFrontend() then
				f10_local3:AnimateSequence( "ButtonUp" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg1.controller or f10_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f19_arg0, f19_arg1 )
		local f19_local0 = f19_arg1.controller or f10_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local2( self, f10_local1, controller )
	return self
end

MenuBuilder.registerType( "ArmoryWeaponItemsColumn", ArmoryWeaponItemsColumn )
LockTable( _M )
