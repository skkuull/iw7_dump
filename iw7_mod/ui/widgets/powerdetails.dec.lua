local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.CACItemHeader:SubscribeToModelThroughElement( f1_arg0, "desc", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.desc:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			Cac.PositionUnlockCriteria( ToUpperCase( LocalizeString( f2_local0 ) ), f1_arg0.CACItemHeader.ItemDescription, f1_arg0.UnlockCriteria )
		end
	end )
end

function PowerDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1507 * _1080p, 0, 200 * _1080p )
	self.id = "PowerDetails"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local CACItemHeader = nil
	
	CACItemHeader = MenuBuilder.BuildRegisteredType( "CACItemHeader", {
		controllerIndex = f3_local1
	} )
	CACItemHeader.id = "CACItemHeader"
	CACItemHeader.ItemDescription:SetRight( _1080p * 1300, 0 )
	CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100 )
	CACItemHeader:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.qualityColor:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			CACItemHeader.Background:SetRGBFromInt( f4_local0, 0 )
		end
	end )
	CACItemHeader:SubscribeToModelThroughElement( self, "desc", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.desc:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			CACItemHeader.ItemDescription:setText( LocalizeString( f5_local0 ), 0 )
		end
	end )
	CACItemHeader:SubscribeToModelThroughElement( self, "name", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.name:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			CACItemHeader.ItemName:setText( ToUpperCase( LocalizeString( f6_local0 ) ), 0 )
		end
	end )
	self:addElement( CACItemHeader )
	self.CACItemHeader = CACItemHeader
	
	local f3_local4 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f3_local4 = LUI.UIText.new()
		f3_local4.id = "Quality"
		f3_local4:SetAlpha( 0, 0 )
		f3_local4:SetFontSize( 32 * _1080p )
		f3_local4:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f3_local4:SetAlignment( LUI.Alignment.Left )
		f3_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 55, _1080p * 2621, _1080p * 59, _1080p * 91 )
		f3_local4:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f7_local0 = self:GetDataSource()
			f7_local0 = f7_local0.qualityColor:GetValue( f3_local1 )
			if f7_local0 ~= nil then
				f3_local4:SetRGBFromInt( f7_local0, 0 )
			end
		end )
		f3_local4:SubscribeToModelThroughElement( self, "qualityString", function ()
			local f8_local0 = self:GetDataSource()
			f8_local0 = f8_local0.qualityString:GetValue( f3_local1 )
			if f8_local0 ~= nil then
				f3_local4:setText( ToUpperCase( f8_local0 ), 0 )
			end
		end )
		self:addElement( f3_local4 )
		self.Quality = f3_local4
	end
	local Quip = nil
	
	Quip = LUI.UIText.new()
	Quip.id = "Quip"
	Quip:SetFontSize( 20 * _1080p )
	Quip:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Quip:SetAlignment( LUI.Alignment.Right )
	Quip:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -593, _1080p * -66, _1080p * 100, _1080p * 123 )
	Quip:SubscribeToModelThroughElement( self, "quip", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.quip:GetValue( f3_local1 )
		if f9_local0 ~= nil then
			Quip:setText( f9_local0, 0 )
		end
	end )
	self:addElement( Quip )
	self.Quip = Quip
	
	local f3_local6 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f3_local6 = LUI.UIDataSourceGrid.new( nil, {
			maxVisibleColumns = 3,
			maxVisibleRows = 1,
			controllerIndex = f3_local1,
			buildChild = function ()
				return MenuBuilder.BuildRegisteredType( "Passive", {
					controllerIndex = f3_local1
				} )
			end,
			wrapX = true,
			wrapY = true,
			spacingX = _1080p * 4,
			spacingY = _1080p * 4,
			columnWidth = _1080p * 240,
			rowHeight = _1080p * 80,
			scrollingThresholdX = 1,
			scrollingThresholdY = 1,
			adjustSizeToContent = false,
			horizontalAlignment = LUI.Alignment.Right,
			verticalAlignment = LUI.Alignment.Top,
			springCoefficient = 400,
			maxVelocity = 5000
		} )
		f3_local6.id = "PassiveGrid"
		f3_local6:setUseStencil( false )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local6:SetGridDataSourceThroughElement( self, "passives" )
		end
		f3_local6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 643, _1080p * 1371, _1080p * 18, _1080p * 98 )
		self:addElement( f3_local6 )
		self.PassiveGrid = f3_local6
	end
	local f3_local7 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsMultiplayer( self ) then
		f3_local7 = LUI.UIImage.new()
		f3_local7.id = "MPStrip"
		f3_local7:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100 )
		f3_local7:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f11_local0 = self:GetDataSource()
			f11_local0 = f11_local0.qualityColor:GetValue( f3_local1 )
			if f11_local0 ~= nil then
				f3_local7:SetRGBFromInt( f11_local0, 0 )
			end
		end )
		self:addElement( f3_local7 )
		self.MPStrip = f3_local7
	end
	local f3_local8 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f3_local8 = MenuBuilder.BuildRegisteredType( "QualityIcon", {
			controllerIndex = f3_local1
		} )
		f3_local8.id = "QualityIcon"
		f3_local8:SetAlpha( 0, 0 )
		f3_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 51, _1080p * 59, _1080p * 92 )
		f3_local8:SubscribeToModelThroughElement( self, "qualityImage", function ()
			local f12_local0 = self:GetDataSource()
			f12_local0 = f12_local0.qualityImage:GetValue( f3_local1 )
			if f12_local0 ~= nil then
				f3_local8.IconShadow:setImage( RegisterMaterial( f12_local0 ), 0 )
			end
		end )
		f3_local8:SubscribeToModelThroughElement( self, "qualityImage", function ()
			local f13_local0 = self:GetDataSource()
			f13_local0 = f13_local0.qualityImage:GetValue( f3_local1 )
			if f13_local0 ~= nil then
				f3_local8.IconDuplicate:setImage( RegisterMaterial( f13_local0 ), 0 )
			end
		end )
		f3_local8:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f14_local0 = self:GetDataSource()
			f14_local0 = f14_local0.qualityColor:GetValue( f3_local1 )
			if f14_local0 ~= nil then
				f3_local8.Icon:SetRGBFromInt( f14_local0, 0 )
			end
		end )
		f3_local8:SubscribeToModelThroughElement( self, "qualityImage", function ()
			local f15_local0 = self:GetDataSource()
			f15_local0 = f15_local0.qualityImage:GetValue( f3_local1 )
			if f15_local0 ~= nil then
				f3_local8.Icon:setImage( RegisterMaterial( f15_local0 ), 0 )
			end
		end )
		self:addElement( f3_local8 )
		self.QualityIcon = f3_local8
	end
	local f3_local9 = nil
	if not Engine.IsMultiplayer() and CONDITIONS.IsSingleplayer( self ) then
		f3_local9 = LUI.UIImage.new()
		f3_local9.id = "SPStrip"
		f3_local9:SetRGBFromTable( SWATCHES.itemRarity.quality0, 0 )
		f3_local9:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100 )
		self:addElement( f3_local9 )
		self.SPStrip = f3_local9
	end
	local UnlockCriteria = nil
	
	UnlockCriteria = MenuBuilder.BuildRegisteredType( "UnlockCriteria", {
		controllerIndex = f3_local1
	} )
	UnlockCriteria.id = "UnlockCriteria"
	UnlockCriteria:SetDataSourceThroughElement( self, nil )
	UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 380, _1080p * 188, _1080p * 220 )
	UnlockCriteria:SubscribeToModelThroughElement( self, "ref", function ()
		local f16_local0 = self:GetDataSource()
		f16_local0 = f16_local0.ref:GetValue( f3_local1 )
		if f16_local0 ~= nil then
			UnlockCriteria.UnlockDesc:setText( GetPowerUnlockText( f16_local0 ), 0 )
		end
	end )
	self:addElement( UnlockCriteria )
	self.UnlockCriteria = UnlockCriteria
	
	local f3_local11 = nil
	if not Engine.IsMultiplayer() and not Engine.InFrontend() then
		f3_local11 = LUI.UIText.new()
		f3_local11.id = "UpgradeState"
		f3_local11:SetRGBFromInt( 10921638, 0 )
		f3_local11:setText( "", 0 )
		f3_local11:SetFontSize( 32 * _1080p )
		f3_local11:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f3_local11:SetAlignment( LUI.Alignment.Left )
		f3_local11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 2585, _1080p * 59, _1080p * 91 )
		self:addElement( f3_local11 )
		self.UpgradeState = f3_local11
	end
	local ShowcaseLock = nil
	
	ShowcaseLock = MenuBuilder.BuildRegisteredType( "ShowcaseLock", {
		controllerIndex = f3_local1
	} )
	ShowcaseLock.id = "ShowcaseLock"
	ShowcaseLock:SetDataSourceThroughElement( self, nil )
	ShowcaseLock:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -245, _1080p * 267, _1080p * 130, _1080p * 642 )
	self:addElement( ShowcaseLock )
	self.ShowcaseLock = ShowcaseLock
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CACItemHeader:RegisterAnimationSequence( "OpenMenu", {
			{
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 323, 0, 0, _1080p * 100, 0 )
				end,
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local4:RegisterAnimationSequence( "OpenMenu", {
				{
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 379, _1080p * 2945, _1080p * 59, _1080p * 91, 0 )
					end,
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 56, _1080p * 2622, _1080p * 59, _1080p * 91, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local6:RegisterAnimationSequence( "OpenMenu", {
				{
					function ()
						return self.PassiveGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 964, _1080p * 1539, _1080p * 18, _1080p * 82, 0 )
					end,
					function ()
						return self.PassiveGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 643, _1080p * 1218, _1080p * 18, _1080p * 82, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsMultiplayer( self ) then
			f3_local7:RegisterAnimationSequence( "OpenMenu", {
				{
					function ()
						return self.MPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 323, _1080p * 335, 0, _1080p * 100, 0 )
					end,
					function ()
						return self.MPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local8:RegisterAnimationSequence( "OpenMenu", {
				{
					function ()
						return self.QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 342, _1080p * 374, _1080p * 59, _1080p * 92, 0 )
					end,
					function ()
						return self.QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 51, _1080p * 59, _1080p * 92, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if not Engine.IsMultiplayer() and CONDITIONS.IsSingleplayer( self ) then
			f3_local9:RegisterAnimationSequence( "OpenMenu", {
				{
					function ()
						return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 323, _1080p * 335, 0, _1080p * 100, 0 )
					end,
					function ()
						return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if not Engine.IsMultiplayer() and not Engine.InFrontend() then
			f3_local11:RegisterAnimationSequence( "OpenMenu", {
				{
					function ()
						return self.UpgradeState:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 342, _1080p * 2908, _1080p * 59, _1080p * 91, 0 )
					end,
					function ()
						return self.UpgradeState:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 2585, _1080p * 59, _1080p * 91, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		self._sequences.OpenMenu = function ()
			CACItemHeader:AnimateSequence( "OpenMenu" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local4:AnimateSequence( "OpenMenu" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local6:AnimateSequence( "OpenMenu" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsMultiplayer( self ) then
				f3_local7:AnimateSequence( "OpenMenu" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local8:AnimateSequence( "OpenMenu" )
			end
			if not Engine.IsMultiplayer() and CONDITIONS.IsSingleplayer( self ) then
				f3_local9:AnimateSequence( "OpenMenu" )
			end
			if not Engine.IsMultiplayer() and not Engine.InFrontend() then
				f3_local11:AnimateSequence( "OpenMenu" )
			end
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local4:RegisterAnimationSequence( "ShowQuality", {
				{
					function ()
						return self.Quality:SetAlpha( 0, 0 )
					end,
					function ()
						return self.Quality:SetAlpha( 0, 200 )
					end,
					function ()
						return self.Quality:SetAlpha( 1, 150 )
					end
				},
				{
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 51, _1080p * 2617, _1080p * 59, _1080p * 91, 0 )
					end,
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 51, _1080p * 2617, _1080p * 59, _1080p * 91, 200 )
					end,
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 55, _1080p * 2621, _1080p * 59, _1080p * 91, 149 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local8:RegisterAnimationSequence( "ShowQuality", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 1, 0 )
					end
				},
				{
					function ()
						return self.QualityIcon:SetScale( 0, 0 )
					end,
					function ()
						return self.QualityIcon:SetScale( 0.2, 200 )
					end,
					function ()
						return self.QualityIcon:SetScale( 0, 150 )
					end
				}
			} )
		end
		self._sequences.ShowQuality = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local4:AnimateSequence( "ShowQuality" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local8:AnimateSequence( "ShowQuality" )
			end
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local4:RegisterAnimationSequence( "HideQuality", {
				{
					function ()
						return self.Quality:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local8:RegisterAnimationSequence( "HideQuality", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideQuality = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local4:AnimateSequence( "HideQuality" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local8:AnimateSequence( "HideQuality" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f3_local8:SubscribeToModelThroughElement( self, "quality", function ()
			local f48_local0 = self:GetDataSource()
			if f48_local0.quality:GetValue( f3_local1 ) ~= nil then
				f48_local0 = self:GetDataSource()
				if f48_local0.quality:GetValue( f3_local1 ) == 0 then
					ACTIONS.AnimateSequence( self, "HideQuality" )
				end
			end
			f48_local0 = self:GetDataSource()
			if f48_local0.quality:GetValue( f3_local1 ) ~= nil then
				f48_local0 = self:GetDataSource()
				if f48_local0.quality:GetValue( f3_local1 ) ~= 0 then
					ACTIONS.AnimateSequence( self, "ShowQuality" )
				end
			end
		end )
		f3_local8:SubscribeToModelThroughElement( self, "qualityImage", function ()
			local f49_local0 = self:GetDataSource()
			if f49_local0.qualityImage:GetValue( f3_local1 ) ~= nil then
				f49_local0 = self:GetDataSource()
				if f49_local0.qualityImage:GetValue( f3_local1 ) == "icon_item_quality_3" then
					ACTIONS.AnimateSequenceByElement( self, {
						elementName = "QualityIcon",
						sequenceName = "LegendaryShine",
						elementPath = "QualityIcon"
					} )
				end
			end
			f49_local0 = self:GetDataSource()
			if f49_local0.qualityImage:GetValue( f3_local1 ) ~= nil then
				f49_local0 = self:GetDataSource()
				if f49_local0.qualityImage:GetValue( f3_local1 ) ~= "icon_item_quality_3" then
					ACTIONS.AnimateSequenceByElement( self, {
						elementName = "QualityIcon",
						sequenceName = "StopShine",
						elementPath = "QualityIcon"
					} )
				end
			end
		end )
	end
	UnlockCriteria:SetDataSourceThroughElement( self, nil )
	ShowcaseLock:SetDataSourceThroughElement( self, nil )
	self:SubscribeToModelThroughElement( self, "desc", function ()
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CACItemHeader",
			sequenceName = "UpdateDescription",
			elementPath = "CACItemHeader"
		} )
	end )
	self:addEventHandler( "menu_create", function ( f51_arg0, f51_arg1 )
		local f51_local0 = f51_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "OpenMenu" )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "PowerDetails", PowerDetails )
LockTable( _M )
