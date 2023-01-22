local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "quality", function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f2_local0 == nil or f2_local0 == Cac.LowestQuality then
			f1_arg0.QualityIcon:SetAlpha( 0, 0 )
			f1_arg0.QualityName:SetAlpha( 0, 0 )
		else
			f1_arg0.QualityIcon:SetAlpha( 1, 0 )
			f1_arg0.QualityName:SetAlpha( 1, 0 )
		end
	end )
end

function ScorestreakPreviewItem( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 230 * _1080p, 0, 143 * _1080p )
	self.id = "ScorestreakPreviewItem"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local StreakBacker = nil
	
	StreakBacker = LUI.UIImage.new()
	StreakBacker.id = "StreakBacker"
	StreakBacker:SetRGBFromInt( 0, 0 )
	StreakBacker:SetAlpha( 0.4, 0 )
	self:addElement( StreakBacker )
	self.StreakBacker = StreakBacker
	
	local StreakBackerGradient = nil
	
	StreakBackerGradient = LUI.UIImage.new()
	StreakBackerGradient.id = "StreakBackerGradient"
	StreakBackerGradient:SetRGBFromInt( 0, 0 )
	StreakBackerGradient:SetAlpha( 0.4, 0 )
	StreakBackerGradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	self:addElement( StreakBackerGradient )
	self.StreakBackerGradient = StreakBackerGradient
	
	local StreakTab = nil
	
	StreakTab = LUI.UIImage.new()
	StreakTab.id = "StreakTab"
	StreakTab:SetRGBFromInt( 14277081, 0 )
	StreakTab:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 15, 0, _1080p * 3 )
	self:addElement( StreakTab )
	self.StreakTab = StreakTab
	
	local StreakImage = nil
	
	StreakImage = LUI.UIImage.new()
	StreakImage.id = "StreakImage"
	StreakImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 43.5, _1080p * 171.5, _1080p * 7.5, _1080p * 135.5 )
	StreakImage:SubscribeToModelThroughElement( self, "fullImage", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.fullImage:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			StreakImage:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( StreakImage )
	self.StreakImage = StreakImage
	
	local StreakName = nil
	
	StreakName = LUI.UIStyledText.new()
	StreakName.id = "StreakName"
	StreakName:SetFontSize( 18 * _1080p )
	StreakName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	StreakName:SetAlignment( LUI.Alignment.Left )
	StreakName:SetStartupDelay( 2000 )
	StreakName:SetLineHoldTime( 400 )
	StreakName:SetAnimMoveTime( 300 )
	StreakName:SetEndDelay( 1500 )
	StreakName:SetCrossfadeTime( 750 )
	StreakName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	StreakName:SetMaxVisibleLines( 1 )
	StreakName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 243.01, _1080p * 433.01, _1080p * 33.66, _1080p * 51.66 )
	StreakName:SubscribeToModelThroughElement( self, "name", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.name:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			StreakName:setText( f5_local0, 0 )
		end
	end )
	self:addElement( StreakName )
	self.StreakName = StreakName
	
	local StreakPoints = nil
	
	StreakPoints = LUI.UIStyledText.new()
	StreakPoints.id = "StreakPoints"
	StreakPoints:SetFontSize( 32 * _1080p )
	StreakPoints:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	StreakPoints:SetAlignment( LUI.Alignment.Left )
	StreakPoints:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 243.01, _1080p * 350.01, _1080p * 1.5, _1080p * 33.5 )
	StreakPoints:SubscribeToModelThroughElement( self, "score", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.score:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			StreakPoints:setText( f6_local0, 0 )
		end
	end )
	self:addElement( StreakPoints )
	self.StreakPoints = StreakPoints
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f3_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 243, _1080p * 267, _1080p * 54, _1080p * 78 )
	QualityIcon:SubscribeToModelThroughElement( self, "qualityImage", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.qualityImage:GetValue( f3_local1 )
		if f7_local0 ~= nil then
			QualityIcon.IconShadow:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.qualityColor:GetValue( f3_local1 )
		if f8_local0 ~= nil then
			QualityIcon.Icon:SetRGBFromInt( f8_local0, 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "qualityImage", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.qualityImage:GetValue( f3_local1 )
		if f9_local0 ~= nil then
			QualityIcon.Icon:setImage( RegisterMaterial( f9_local0 ), 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.qualityColor:GetValue( f3_local1 )
		if f10_local0 ~= nil then
			QualityIcon.IconDuplicate:SetRGBFromInt( f10_local0, 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "qualityImage", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.qualityImage:GetValue( f3_local1 )
		if f11_local0 ~= nil then
			QualityIcon.IconDuplicate:setImage( RegisterMaterial( f11_local0 ), 0 )
		end
	end )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	local QualityName = nil
	
	QualityName = LUI.UIText.new()
	QualityName.id = "QualityName"
	QualityName:SetFontSize( 18 * _1080p )
	QualityName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	QualityName:SetAlignment( LUI.Alignment.Left )
	QualityName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 270, _1080p * 433.01, _1080p * 57, _1080p * 75 )
	QualityName:SubscribeToModelThroughElement( self, "qualityColor", function ()
		local f12_local0 = self:GetDataSource()
		f12_local0 = f12_local0.qualityColor:GetValue( f3_local1 )
		if f12_local0 ~= nil then
			QualityName:SetRGBFromInt( f12_local0, 0 )
		end
	end )
	QualityName:SubscribeToModelThroughElement( self, "qualityString", function ()
		local f13_local0 = self:GetDataSource()
		f13_local0 = f13_local0.qualityString:GetValue( f3_local1 )
		if f13_local0 ~= nil then
			QualityName:setText( ToUpperCase( f13_local0 ), 0 )
		end
	end )
	self:addElement( QualityName )
	self.QualityName = QualityName
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		StreakImage:RegisterAnimationSequence( "HideImage", {
			{
				function ()
					return self.StreakImage:SetAlpha( 0, 0 )
				end
			}
		} )
		StreakName:RegisterAnimationSequence( "HideImage", {
			{
				function ()
					return self.StreakName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 243.01, _1080p * 350.01, 0, _1080p * 18, 0 )
				end
			}
		} )
		StreakPoints:RegisterAnimationSequence( "HideImage", {
			{
				function ()
					return self.StreakPoints:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideImage = function ()
			StreakImage:AnimateSequence( "HideImage" )
			StreakName:AnimateSequence( "HideImage" )
			StreakPoints:AnimateSequence( "HideImage" )
		end
		
		StreakImage:RegisterAnimationSequence( "ShowImage", {
			{
				function ()
					return self.StreakImage:SetAlpha( 1, 0 )
				end
			}
		} )
		StreakName:RegisterAnimationSequence( "ShowImage", {
			{
				function ()
					return self.StreakName:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.StreakName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 243.01, _1080p * 433.01, _1080p * 33.66, _1080p * 51.66, 0 )
				end
			}
		} )
		StreakPoints:RegisterAnimationSequence( "ShowImage", {
			{
				function ()
					return self.StreakPoints:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.StreakPoints:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 243.01, _1080p * 350.01, _1080p * 1.5, _1080p * 33.5, 0 )
				end
			}
		} )
		self._sequences.ShowImage = function ()
			StreakImage:AnimateSequence( "ShowImage" )
			StreakName:AnimateSequence( "ShowImage" )
			StreakPoints:AnimateSequence( "ShowImage" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "used", function ()
		local f26_local0 = self:GetDataSource()
		if f26_local0.used:GetValue( f3_local1 ) ~= nil then
			f26_local0 = self:GetDataSource()
			if f26_local0.used:GetValue( f3_local1 ) == true then
				ACTIONS.AnimateSequence( self, "ShowImage" )
			end
		end
		f26_local0 = self:GetDataSource()
		if f26_local0.used:GetValue( f3_local1 ) ~= nil then
			f26_local0 = self:GetDataSource()
			if f26_local0.used:GetValue( f3_local1 ) == false then
				ACTIONS.AnimateSequence( self, "HideImage" )
			end
		end
	end )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ScorestreakPreviewItem", ScorestreakPreviewItem )
LockTable( _M )
