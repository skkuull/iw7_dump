local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	return function ()
		local f2_local0 = LUI.FlowManager.GetScopedData( f1_arg0 )
		return {
			x = (f2_local0.contentOffset or 0) + (f1_arg0.Items:GetContentOffset( LUI.DIRECTION.horizontal ) or 0),
			y = 0
		}
	end
	
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	assert( f3_arg0.Items )
	local f3_local0 = LOADOUT.GetWeaponLootVariantData( f3_arg1 )
	assert( f3_local0 )
	assert( f3_local0.rows )
	local f3_local1 = {}
	local f3_local2 = Engine.GetDvarInt( "online_sub_license" )
	for f3_local7, f3_local8 in pairs( f3_local0.rows ) do
		local f3_local9 = CSV.ReadRow( {
			file = f3_local0.file,
			cols = CSV.weaponLoot.cols
		}, f3_local8 )
		local f3_local10 = Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.ref, f3_local9.ref, CSV.weaponLootMaster.cols.missionTeam )
		local f3_local11 = Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.ref, f3_local9.ref, CSV.weaponLootMaster.cols.sublicense )
		local f3_local12 = Engine.TableLookup( CSV.weaponLootMaster.file, CSV.weaponLootMaster.cols.ref, f3_local9.ref, CSV.weaponLootMaster.cols.index )
		local f3_local6 = false
		if f3_arg0._isMk2 then
			if f3_local10 ~= MissionDirector.teamNoneValue and f3_local10 ~= MissionDirector.teamRnGValue then
				f3_local6 = false
			else
				f3_local6 = true
			end
			if f3_local6 then
				f3_local6 = Cac.IsWeaponRefMk2( f3_local9.ref )
			end
		else
			if f3_local10 ~= MissionDirector.teamNoneValue then
				if f3_local10 == MissionDirector.teamRnGValue then
					f3_local6 = not ARMORY.IsWeaponRnG( f3_local12, f3_local10 )
				else
					f3_local6 = false
				end
			else
				f3_local6 = true
			end
			if f3_local6 then
				f3_local6 = not Cac.IsWeaponRefMk2( f3_local9.ref )
			end
		end
		if f3_local2 < tonumber( f3_local11 ) then
			f3_local6 = false
		end
		if f3_local6 then
			table.insert( f3_local1, f3_local9 )
		end
	end
	assert( #f3_local1 > 0 )
	f3_arg0.inventoryWeapons = f3_local1
	table.sort( f3_arg0.inventoryWeapons, function ( f4_arg0, f4_arg1 )
		return tonumber( f4_arg0.displayOrder ) < tonumber( f4_arg1.displayOrder )
	end )
	f3_arg0.variantFile = f3_local0.file
	f3_arg0.Items:SetNumColumns( #f3_local1 )
	f3_arg0.Items:SetNumRows( 1 )
	f3_arg0.Items:RefreshContent()
end

f0_local2 = function ( f5_arg0, f5_arg1 )
	assert( f5_arg0.Items )
	local f5_local0 = #f5_arg1.variants
	f5_arg0.streakData = f5_arg1.variants
	f5_arg0.Items:SetNumColumns( f5_local0 )
	f5_arg0.Items:SetNumRows( 1 )
	f5_arg0.Items:RefreshContent()
end

local f0_local3 = function ( f6_arg0, f6_arg1, f6_arg2 )
	assert( f6_arg0.Items )
	local f6_local0 = #f6_arg2.weapons
	f6_arg0.currentMissionTeam = f6_arg1
	f6_arg0.missionTeamData = f6_arg2
	f6_arg0.Items:SetNumColumns( f6_local0 )
	f6_arg0.Items:SetNumRows( 1 )
	f6_arg0.Items:RefreshContent()
end

local f0_local4 = function ( f7_arg0, f7_arg1, f7_arg2 )
	local Items = nil
	
	Items = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 5,
		maxVisibleRows = 1,
		controllerIndex = f7_arg1,
		buildChild = function ()
			local f8_local0 = f7_arg2.isMk2 and "ArmoryMk2Button" or "ArmoryPrototypeButton"
			assert( f7_arg2.context )
			if f7_arg2.context == ARMORY.inventoryContext.MISSION_TEAM then
				f8_local0 = "ArmoryMissionTeamsButton"
			elseif f7_arg2.context == ARMORY.inventoryContext.STREAK_PROTOTYPE then
				f8_local0 = "ArmoryStreakPrototypeButton"
			end
			return MenuBuilder.BuildRegisteredType( f8_local0, {
				controllerIndex = f7_arg1
			} )
		end,
		refreshChild = function ( f9_arg0, f9_arg1, f9_arg2 )
			assert( f7_arg2.context )
			if f7_arg2.context == ARMORY.inventoryContext.PROTOTYPE then
				f9_arg0:SetupVariantData( f7_arg1, f7_arg0.variantFile, f7_arg0.inventoryWeapons[f9_arg1 + 1] )
			elseif f7_arg2.context == ARMORY.inventoryContext.MK2 then
				f9_arg0:SetupVariantData( f7_arg1, f7_arg0.variantFile, f7_arg0.inventoryWeapons[f9_arg1 + 1] )
			elseif f7_arg2.context == ARMORY.inventoryContext.MISSION_TEAM then
				f9_arg0:SetupMissionTeamData( f7_arg1, f7_arg0.missionTeamData.weapons[f9_arg1 + 1] )
			elseif f7_arg2.context == ARMORY.inventoryContext.STREAK_PROTOTYPE then
				f9_arg0:SetupVariantData( f7_arg1, f7_arg0.streakData[f9_arg1 + 1] )
			end
		end,
		numRows = 0,
		numColumns = 0,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 200,
		rowHeight = _1080p * 100,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Items.id = "Items"
	Items:setUseStencil( true )
	Items:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1016, 0, _1080p * 100 )
	f7_arg0:addElement( Items )
	f7_arg0.Items = Items
	
	f7_arg0._isMk2 = f7_arg2.isMk2
	local f7_local1 = LUI.DataSourceInGlobalModel.new( "frontEnd.MP.armory.items.gridFocus" )
	f7_arg0.Items:SetLastFocusIndexDataSource( f7_local1 )
	f7_arg0.Items.FocusChanged = function ( f10_arg0 )
		LUI.UIGrid.FocusChanged( f10_arg0 )
		local f10_local0 = LUI.FlowManager.GetScopedData( f10_arg0 )
		f10_local0.contentOffset = f7_local1:GetValue( f7_arg1 ) - f10_arg0:GetContentOffset( LUI.DIRECTION.horizontal )
	end
	
	f7_arg0.SetupWeaponRowData = f0_local1
	f7_arg0.SetupStreakRowData = f0_local2
	f7_arg0.SetupMissionTeamData = f0_local3
	f7_arg0.Items:SetDefaultFocus( f0_local0( f7_arg0 ) )
	f7_arg0.Items:addEventHandler( "gain_focus", function ( f11_arg0, f11_arg1 )
		ACTIONS.AnimateSequence( f7_arg0, "ButtonOver" )
		f11_arg0:dispatchEventToCurrentMenu( {
			name = "update_armory_focus"
		} )
	end )
	f7_arg0.Items:addEventHandler( "lose_focus", function ( f12_arg0, f12_arg1 )
		ACTIONS.AnimateSequence( f7_arg0, "ButtonUp" )
	end )
end

function ArmoryItems( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1016 * _1080p, 0, 100 * _1080p )
	self.id = "ArmoryItems"
	self._animationSets = {}
	self._sequences = {}
	local f13_local1 = controller and controller.controllerIndex
	if not f13_local1 and not Engine.InFrontend() then
		f13_local1 = self:getRootController()
	end
	assert( f13_local1 )
	local f13_local2 = self
	local f13_local3 = nil
	if Engine.InFrontend() then
		f13_local3 = LUI.UIBlur.new()
		f13_local3.id = "Blur"
		f13_local3:SetRGBFromInt( 12566463, 0 )
		f13_local3:SetBlurStrength( 2.75, 0 )
		self:addElement( f13_local3 )
		self.Blur = f13_local3
	end
	local BlurLeft = nil
	
	BlurLeft = LUI.UIBlur.new()
	BlurLeft.id = "BlurLeft"
	BlurLeft:SetRGBFromInt( 12566463, 0 )
	BlurLeft:setImage( RegisterMaterial( "widg_gradient_right_to_left" ), 0 )
	BlurLeft:SetBlurStrength( 2.75, 0 )
	BlurLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -200, 0, 0, 0 )
	self:addElement( BlurLeft )
	self.BlurLeft = BlurLeft
	
	local f13_local5 = nil
	if Engine.InFrontend() then
		f13_local5 = LUI.UIImage.new()
		f13_local5.id = "DropShadow"
		f13_local5:SetRGBFromInt( 0, 0 )
		f13_local5:SetAlpha( 0.3, 0 )
		f13_local5:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f13_local5:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f13_local5 )
		self.DropShadow = f13_local5
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if Engine.InFrontend() then
			f13_local3:RegisterAnimationSequence( "ButtonOver", {
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
		BlurLeft:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.BlurLeft:SetRGBFromInt( 8421504, 0 )
				end,
				function ()
					return self.BlurLeft:SetRGBFromInt( 12566463, 300, LUI.EASING.inSine )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			if Engine.InFrontend() then
				f13_local3:AnimateSequence( "ButtonOver" )
			end
			BlurLeft:AnimateSequence( "ButtonOver" )
		end
		
		if Engine.InFrontend() then
			f13_local3:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.Blur:SetRGBFromInt( 12566463, 0 )
					end
				}
			} )
		end
		BlurLeft:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.BlurLeft:SetRGBFromInt( 12566463, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			if Engine.InFrontend() then
				f13_local3:AnimateSequence( "ButtonUp" )
			end
			BlurLeft:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f24_arg0, f24_arg1 )
		local f24_local0 = f24_arg1.controller or f13_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f25_arg0, f25_arg1 )
		local f25_local0 = f25_arg1.controller or f13_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local4( self, f13_local1, controller )
	return self
end

MenuBuilder.registerType( "ArmoryItems", ArmoryItems )
LockTable( _M )
