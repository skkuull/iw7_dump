local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "ref", function ( f2_arg0 )
		local f2_local0 = f1_arg0:GetDataSource()
		local f2_local1 = GetStreakUnlockText( DataModel.GetModelValue( f2_arg0 ) )
		local f2_local2 = f2_local0.quality:GetValue( f1_arg1 )
		if not f2_local0.isBase and f2_local0.isOwned then
			f2_local1 = GetStreakUnlockText( f2_local0.baseStreakRef:GetValue( f1_arg1 ) )
		end
		if f2_local1 == "" and f2_local2 and f2_local2 ~= 0 then
			f1_arg0.UnlockCriteria.UnlockDesc:setText( Engine.Localize( "LUA_MENU_MP_ARMORY_STREAK_UNLOCK_MSG" ), 0 )
		else
			f1_arg0.UnlockCriteria.UnlockDesc:setText( f2_local1, 0 )
		end
	end )
	f1_arg0.PassiveGrid:SubscribeToDataSourceThroughElement( f1_arg0, nil, function ()
		f1_arg0.PassiveGrid:processEvent( {
			name = "update_passives"
		} )
	end )
end

function StreakDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1162 * _1080p, 0, 367 * _1080p )
	self.id = "StreakDetails"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local BaseBackground = nil
	
	BaseBackground = LUI.UIImage.new()
	BaseBackground.id = "BaseBackground"
	BaseBackground:SetRGBFromInt( 0, 0 )
	BaseBackground:SetAlpha( 0.4, 0 )
	BaseBackground:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1162, _1080p * 618, _1080p * 685 )
	self:addElement( BaseBackground )
	self.BaseBackground = BaseBackground
	
	local GradientDown = nil
	
	GradientDown = LUI.UIImage.new()
	GradientDown.id = "GradientDown"
	GradientDown:SetRGBFromInt( 0, 0 )
	GradientDown:SetAlpha( 0.5, 0 )
	GradientDown:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	GradientDown:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1162, _1080p * 100, _1080p * 138.5 )
	self:addElement( GradientDown )
	self.GradientDown = GradientDown
	
	local Score = nil
	
	Score = LUI.UIText.new()
	Score.id = "Score"
	Score:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	Score:setText( ToUpperCase( Engine.Localize( "LUA_MENU_STREAK_SCORE" ) ), 0 )
	Score:SetFontSize( 26 * _1080p )
	Score:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Score:SetAlignment( LUI.Alignment.Left )
	Score:SetOptOutRightToLeftAlignmentFlip( true )
	Score:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 179.25, _1080p * 620.5, _1080p * 646.5 )
	self:addElement( Score )
	self.Score = Score
	
	local ScoreValue = nil
	
	ScoreValue = LUI.UIText.new()
	ScoreValue.id = "ScoreValue"
	ScoreValue:SetFontSize( 32 * _1080p )
	ScoreValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ScoreValue:SetAlignment( LUI.Alignment.Left )
	ScoreValue:SetOptOutRightToLeftAlignmentFlip( true )
	ScoreValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 171, _1080p * 648.5, _1080p * 680.5 )
	ScoreValue:SubscribeToModelThroughElement( self, "score", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.score:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			ScoreValue:setText( f5_local0, 0 )
		end
	end )
	self:addElement( ScoreValue )
	self.ScoreValue = ScoreValue
	
	local ItemHeader = nil
	
	ItemHeader = MenuBuilder.BuildRegisteredType( "CACItemHeaderStreak", {
		controllerIndex = f4_local1
	} )
	ItemHeader.id = "ItemHeader"
	ItemHeader:SetDataSource( DataSources.frontEnd.MP.CAC.perks.perkSelectArchetype, f4_local1 )
	ItemHeader.ItemDescription:SetAlpha( 1, 0 )
	ItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100 )
	ItemHeader:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.qualityColor:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			ItemHeader.Background:SetRGBFromInt( f6_local0, 0 )
		end
	end )
	ItemHeader:SubscribeToModelThroughElement( self, "desc", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.desc:GetValue( f4_local1 )
		if f7_local0 ~= nil then
			ItemHeader.ItemDescription:setText( f7_local0, 0 )
		end
	end )
	ItemHeader:SubscribeToModelThroughElement( self, "name", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.name:GetValue( f4_local1 )
		if f8_local0 ~= nil then
			ItemHeader.ItemName:setText( f8_local0, 0 )
		end
	end )
	self:addElement( ItemHeader )
	self.ItemHeader = ItemHeader
	
	local QualityTab = nil
	
	QualityTab = LUI.UIImage.new()
	QualityTab.id = "QualityTab"
	QualityTab:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 12, 0, _1080p * 100 )
	QualityTab:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.qualityColor:GetValue( f4_local1 )
		if f9_local0 ~= nil then
			QualityTab:SetRGBFromInt( f9_local0, 0 )
		end
	end )
	self:addElement( QualityTab )
	self.QualityTab = QualityTab
	
	local PassiveGrid = nil
	
	PassiveGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 3,
		maxVisibleRows = 1,
		controllerIndex = f4_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "Passive", {
				controllerIndex = f4_local1
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
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	PassiveGrid.id = "PassiveGrid"
	PassiveGrid:setUseStencil( false )
	PassiveGrid:SetGridDataSourceThroughElement( self, "passives" )
	PassiveGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 599, _1080p * 1327, _1080p * 12, _1080p * 92 )
	self:addElement( PassiveGrid )
	self.PassiveGrid = PassiveGrid
	
	local f4_local10 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f4_local10 = LUI.UIStyledText.new()
		f4_local10.id = "QualityCopy0"
		f4_local10:SetAlpha( 0, 0 )
		f4_local10:SetFontSize( 32 * _1080p )
		f4_local10:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f4_local10:SetAlignment( LUI.Alignment.Left )
		f4_local10:SetDecodeLetterLength( 20 )
		f4_local10:SetDecodeMaxRandChars( 6 )
		f4_local10:SetDecodeUpdatesPerLetter( 4 )
		f4_local10:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 56, _1080p * 556, _1080p * 57, _1080p * 89 )
		f4_local10:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f11_local0 = self:GetDataSource()
			f11_local0 = f11_local0.qualityColor:GetValue( f4_local1 )
			if f11_local0 ~= nil then
				f4_local10:SetRGBFromInt( f11_local0, 0 )
			end
		end )
		f4_local10:SubscribeToModelThroughElement( self, "qualityString", function ()
			local f12_local0 = self:GetDataSource()
			f12_local0 = f12_local0.qualityString:GetValue( f4_local1 )
			if f12_local0 ~= nil then
				f4_local10:setText( ToUpperCase( f12_local0 ), 0 )
			end
		end )
		self:addElement( f4_local10 )
		self.QualityCopy0 = f4_local10
	end
	local f4_local11 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f4_local11 = MenuBuilder.BuildRegisteredType( "QualityIcon", {
			controllerIndex = f4_local1
		} )
		f4_local11.id = "QualityIcon"
		f4_local11:SetAlpha( 0, 0 )
		f4_local11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 51, _1080p * 59, _1080p * 92 )
		f4_local11:SubscribeToModelThroughElement( self, "qualityImage", function ()
			local f13_local0 = self:GetDataSource()
			f13_local0 = f13_local0.qualityImage:GetValue( f4_local1 )
			if f13_local0 ~= nil then
				f4_local11.IconShadow:setImage( RegisterMaterial( f13_local0 ), 0 )
			end
		end )
		f4_local11:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f14_local0 = self:GetDataSource()
			f14_local0 = f14_local0.qualityColor:GetValue( f4_local1 )
			if f14_local0 ~= nil then
				f4_local11.Icon:SetRGBFromInt( f14_local0, 0 )
			end
		end )
		f4_local11:SubscribeToModelThroughElement( self, "qualityImage", function ()
			local f15_local0 = self:GetDataSource()
			f15_local0 = f15_local0.qualityImage:GetValue( f4_local1 )
			if f15_local0 ~= nil then
				f4_local11.Icon:setImage( RegisterMaterial( f15_local0 ), 0 )
			end
		end )
		f4_local11:SubscribeToModelThroughElement( self, "qualityImage", function ()
			local f16_local0 = self:GetDataSource()
			f16_local0 = f16_local0.qualityImage:GetValue( f4_local1 )
			if f16_local0 ~= nil then
				f4_local11.IconDuplicate:setImage( RegisterMaterial( f16_local0 ), 0 )
			end
		end )
		self:addElement( f4_local11 )
		self.QualityIcon = f4_local11
	end
	local UnlockCriteria = nil
	
	UnlockCriteria = MenuBuilder.BuildRegisteredType( "UnlockCriteria", {
		controllerIndex = f4_local1
	} )
	UnlockCriteria.id = "UnlockCriteria"
	UnlockCriteria:SetDataSourceThroughElement( self, nil )
	UnlockCriteria.UnlockDesc:SetRight( _1080p * 270, 0 )
	UnlockCriteria.UnlockDesc:setText( GetStreakUnlockText( "ITEM UNLOCK CRITERIA" ), 0 )
	UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 438, _1080p * 204, _1080p * 227.5 )
	self:addElement( UnlockCriteria )
	self.UnlockCriteria = UnlockCriteria
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f4_local10:RegisterAnimationSequence( "ShowQuality", {
				{
					function ()
						return self.QualityCopy0:SetAlpha( 0, 0 )
					end,
					function ()
						return self.QualityCopy0:SetAlpha( 0, 200 )
					end,
					function ()
						return self.QualityCopy0:SetAlpha( 1, 150 )
					end
				},
				{
					function ()
						return self.QualityCopy0:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 51, _1080p * 551, _1080p * 57, _1080p * 89, 0 )
					end,
					function ()
						return self.QualityCopy0:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 51, _1080p * 551, _1080p * 57, _1080p * 89, 200 )
					end,
					function ()
						return self.QualityCopy0:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 55, _1080p * 555, _1080p * 57, _1080p * 89, 149 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f4_local11:RegisterAnimationSequence( "ShowQuality", {
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
				f4_local10:AnimateSequence( "ShowQuality" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f4_local11:AnimateSequence( "ShowQuality" )
			end
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f4_local11:RegisterAnimationSequence( "HideQuality", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideQuality = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f4_local11:AnimateSequence( "HideQuality" )
			end
		end
		
		self._sequences.ReadsRightToLeft = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f4_local11:SubscribeToModelThroughElement( self, "quality", function ()
			local f33_local0 = self:GetDataSource()
			if f33_local0.quality:GetValue( f4_local1 ) ~= nil then
				f33_local0 = self:GetDataSource()
				if f33_local0.quality:GetValue( f4_local1 ) == 0 then
					ACTIONS.AnimateSequence( self, "HideQuality" )
				end
			end
			f33_local0 = self:GetDataSource()
			if f33_local0.quality:GetValue( f4_local1 ) ~= nil then
				f33_local0 = self:GetDataSource()
				if f33_local0.quality:GetValue( f4_local1 ) ~= 0 then
					ACTIONS.AnimateSequence( self, "ShowQuality" )
				end
			end
		end )
	end
	ItemHeader:SetDataSource( DataSources.frontEnd.MP.CAC.perks.perkSelectArchetype, f4_local1 )
	UnlockCriteria:SetDataSourceThroughElement( self, nil )
	self:SubscribeToModelThroughElement( self, "desc", function ()
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "ItemHeader",
			sequenceName = "UpdateDescription",
			elementPath = "ItemHeader"
		} )
	end )
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "StreakDetails", StreakDetails )
LockTable( _M )
