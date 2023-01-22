local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f1_arg0.streakToEquipButton:GetCurrentMenu()
		local f2_local1 = f2_local0.statsGroupDataSource
		Cac.ClearStreakSlot( f2_local1.statsGroup, f1_arg1, f1_arg0.index, f2_local1, true )
		ACTIONS.OnSelectStreak( f1_arg0.streakToEquipButton, f1_arg1, f1_arg0.onStreakEquippedFunc )
		ACTIONS.LeaveMenu( f1_arg0 )
	end )
end

function StreakReplaceButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 150 * _1080p, 0, 150 * _1080p )
	self.id = "StreakReplaceButton"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local SelectedBackground = nil
	
	SelectedBackground = LUI.UIImage.new()
	SelectedBackground.id = "SelectedBackground"
	SelectedBackground:SetRGBFromInt( 0, 0 )
	self:addElement( SelectedBackground )
	self.SelectedBackground = SelectedBackground
	
	local Base = nil
	Base = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f3_local1
	} )
	Base.id = "Base"
	Base.Image:SetLeft( _1080p * -50, 0 )
	Base.Image:SetRight( _1080p * 50, 0 )
	Base.Image:SetTop( _1080p * -111, 0 )
	Base.Image:SetBottom( _1080p * -11, 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.Level:setText( "", 0 )
	end
	Base.Name:SetAlignment( LUI.Alignment.Center )
	Base:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	Base:SubscribeToModelThroughElement( self, "fullImage", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.fullImage:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Base.Image:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	Base:SubscribeToModelThroughElement( self, "name", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.name:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			Base.Name:setText( f5_local0, 0 )
		end
	end )
	self:addElement( Base )
	self.Base = Base
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f3_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon.IconShadow:SetAlpha( 0.2, 0 )
	QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12, _1080p * 44, _1080p * 114, _1080p * 146 )
	QualityIcon:SubscribeToModelThroughElement( self, "qualityImage", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.qualityImage:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			QualityIcon.IconShadow:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.qualityColor:GetValue( f3_local1 )
		if f7_local0 ~= nil then
			QualityIcon.Icon:SetRGBFromInt( f7_local0, 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "qualityImage", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.qualityImage:GetValue( f3_local1 )
		if f8_local0 ~= nil then
			QualityIcon.Icon:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.qualityColor:GetValue( f3_local1 )
		if f9_local0 ~= nil then
			QualityIcon.IconDuplicate:SetRGBFromInt( f9_local0, 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "qualityImage", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.qualityImage:GetValue( f3_local1 )
		if f10_local0 ~= nil then
			QualityIcon.IconDuplicate:setImage( RegisterMaterial( f10_local0 ), 0 )
		end
	end )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	local ScoreLabel = nil
	
	ScoreLabel = LUI.UIText.new()
	ScoreLabel.id = "ScoreLabel"
	ScoreLabel:SetFontSize( 16 * _1080p )
	ScoreLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ScoreLabel:SetAlignment( LUI.Alignment.Left )
	ScoreLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12, _1080p * 145, _1080p * 34, _1080p * 51 )
	ScoreLabel:SubscribeToModelThroughElement( self, "score", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.score:GetValue( f3_local1 )
		if f11_local0 ~= nil then
			ScoreLabel:setText( LocalizeIntoString( f11_local0, "LUA_MENU_SCORE_WITH_VALUE" ), 0 )
		end
	end )
	self:addElement( ScoreLabel )
	self.ScoreLabel = ScoreLabel
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.ButtonOver = function ()
			
		end
		
		self._sequences.ButtonUp = function ()
			
		end
		
		self._sequences.ButtonDisabled = function ()
			
		end
		
		self._sequences.ButtonOverDisabled = function ()
			
		end
		
		self._sequences.ButtonOverVariant = function ()
			
		end
		
		QualityIcon:RegisterAnimationSequence( "ShowQuality", {
			{
				function ()
					return self.QualityIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowQuality = function ()
			QualityIcon:AnimateSequence( "ShowQuality" )
		end
		
		QualityIcon:RegisterAnimationSequence( "HideQuality", {
			{
				function ()
					return self.QualityIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideQuality = function ()
			QualityIcon:AnimateSequence( "HideQuality" )
		end
		
		SelectedBackground:RegisterAnimationSequence( "ShowSelected", {
			{
				function ()
					return self.SelectedBackground:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowSelected = function ()
			SelectedBackground:AnimateSequence( "ShowSelected" )
		end
		
		SelectedBackground:RegisterAnimationSequence( "HideSelected", {
			{
				function ()
					return self.SelectedBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideSelected = function ()
			SelectedBackground:AnimateSequence( "HideSelected" )
		end
		
		Base:RegisterAnimationSequence( "ImageDisabled", {
			{
				function ()
					return self.Base.Image:SetAlpha( 0.3, 0 )
				end
			}
		} )
		self._sequences.ImageDisabled = function ()
			Base:AnimateSequence( "ImageDisabled" )
		end
		
		Base:RegisterAnimationSequence( "ImageEnabled", {
			{
				function ()
					return self.Base.Image:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ImageEnabled = function ()
			Base:AnimateSequence( "ImageEnabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	QualityIcon:SubscribeToModelThroughElement( self, "quality", function ()
		local f31_local0 = self:GetDataSource()
		if f31_local0.quality:GetValue( f3_local1 ) ~= nil then
			f31_local0 = self:GetDataSource()
			if f31_local0.quality:GetValue( f3_local1 ) == 0 then
				ACTIONS.AnimateSequence( self, "HideQuality" )
			end
		end
		f31_local0 = self:GetDataSource()
		if f31_local0.quality:GetValue( f3_local1 ) ~= nil then
			f31_local0 = self:GetDataSource()
			if f31_local0.quality:GetValue( f3_local1 ) ~= 0 then
				ACTIONS.AnimateSequence( self, "ShowQuality" )
			end
		end
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "Message",
		sequenceName = "Inactive",
		elementPath = "Base.Message"
	} )
	ACTIONS.AnimateSequence( self, "ImageEnabled" )
	return self
end

MenuBuilder.registerType( "StreakReplaceButton", StreakReplaceButton )
LockTable( _M )
