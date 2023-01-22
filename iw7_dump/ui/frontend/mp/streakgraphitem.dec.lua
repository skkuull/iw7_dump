local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.StreakName )
	if IsLanguageOversizedFont() then
		f1_arg0.StreakName:SetFontSize( 16 * _1080p )
		f1_arg0.StreakName:SetTop( -8 * _1080p )
		f1_arg0.StreakName:SetBottom( 8 * _1080p )
	end
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "streak.quality", function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f2_local0 == nil or f2_local0 == Cac.LowestQuality then
			f1_arg0.QualityIcon:SetAlpha( 0, 0 )
		else
			f1_arg0.QualityIcon:SetAlpha( 1, 0 )
		end
	end )
end

function StreakGraphItem( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 60 * _1080p )
	self.id = "StreakGraphItem"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local BackgroundFill = nil
	
	BackgroundFill = LUI.UIImage.new()
	BackgroundFill.id = "BackgroundFill"
	BackgroundFill:SetRGBFromInt( 0, 0 )
	BackgroundFill:SetAlpha( 0.2, 0 )
	BackgroundFill:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * 4.19, _1080p * 103.81, _1080p * -56, _1080p * 39 )
	self:addElement( BackgroundFill )
	self.BackgroundFill = BackgroundFill
	
	local Background = nil
	
	Background = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Background.id = "Background"
	Background:SetRGBFromInt( 12566463, 0 )
	Background:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * 4.19, _1080p * 103.81, _1080p * -56, _1080p * 39 )
	self:addElement( Background )
	self.Background = Background
	
	local StreakName = nil
	
	StreakName = LUI.UIStyledText.new()
	StreakName.id = "StreakName"
	StreakName:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	StreakName:SetAlpha( 0.6, 0 )
	StreakName:SetFontSize( 16 * _1080p )
	StreakName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	StreakName:SetAlignment( LUI.Alignment.Right )
	StreakName:SetStartupDelay( 1500 )
	StreakName:SetLineHoldTime( 400 )
	StreakName:SetAnimMoveTime( 300 )
	StreakName:SetEndDelay( 1000 )
	StreakName:SetCrossfadeTime( 500 )
	StreakName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	StreakName:SetMaxVisibleLines( 1 )
	StreakName:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -110, _1080p * 50, 0, _1080p * 16 )
	StreakName:SubscribeToModelThroughElement( self, "streak.name", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.streak.name:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			StreakName:setText( f4_local0, 0 )
		end
	end )
	self:addElement( StreakName )
	self.StreakName = StreakName
	
	local Score = nil
	
	Score = LUI.UIText.new()
	Score.id = "Score"
	Score:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
	Score:SetFontSize( 22 * _1080p )
	Score:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Score:SetAlignment( LUI.Alignment.Right )
	Score:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -64, 0, _1080p * 18, _1080p * 40 )
	Score:SubscribeToModelThroughElement( self, "streak.score", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.streak.score:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			Score:setText( f5_local0, 0 )
		end
	end )
	self:addElement( Score )
	self.Score = Score
	
	local StreakImage = nil
	
	StreakImage = LUI.UIImage.new()
	StreakImage.id = "StreakImage"
	StreakImage:SetRGBFromTable( SWATCHES.CAC.greenIcon, 0 )
	StreakImage:SetAlpha( 0.6, 0 )
	StreakImage:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * 22, _1080p * 86, _1080p * -42.75, _1080p * 20.75 )
	StreakImage:SubscribeToModelThroughElement( self, "streak.icon", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.streak.icon:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			StreakImage:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( StreakImage )
	self.StreakImage = StreakImage
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f3_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * 10.5, _1080p * 33.5, _1080p * 9.25, _1080p * 32.25 )
	QualityIcon:SubscribeToModelThroughElement( self, "streak.qualityImage", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.streak.qualityImage:GetValue( f3_local1 )
		if f7_local0 ~= nil then
			QualityIcon.IconShadow:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "streak.qualityColor", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.streak.qualityColor:GetValue( f3_local1 )
		if f8_local0 ~= nil then
			QualityIcon.Icon:SetRGBFromInt( f8_local0, 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "streak.qualityImage", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.streak.qualityImage:GetValue( f3_local1 )
		if f9_local0 ~= nil then
			QualityIcon.Icon:setImage( RegisterMaterial( f9_local0 ), 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "streak.qualityColor", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.streak.qualityColor:GetValue( f3_local1 )
		if f10_local0 ~= nil then
			QualityIcon.IconDuplicate:SetRGBFromInt( f10_local0, 0 )
		end
	end )
	QualityIcon:SubscribeToModelThroughElement( self, "streak.qualityImage", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.streak.qualityImage:GetValue( f3_local1 )
		if f11_local0 ~= nil then
			QualityIcon.IconDuplicate:setImage( RegisterMaterial( f11_local0 ), 0 )
		end
	end )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BackgroundFill:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.BackgroundFill:SetAlpha( 0.15, 0 )
				end
			}
		} )
		Background:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.Background:SetAlpha( 0.3, 0 )
				end
			}
		} )
		StreakName:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.StreakName:SetAlpha( 0, 0 )
				end
			}
		} )
		Score:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.Score:SetAlpha( 0, 0 )
				end
			}
		} )
		StreakImage:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.StreakImage:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hidden = function ()
			BackgroundFill:AnimateSequence( "Hidden" )
			Background:AnimateSequence( "Hidden" )
			StreakName:AnimateSequence( "Hidden" )
			Score:AnimateSequence( "Hidden" )
			StreakImage:AnimateSequence( "Hidden" )
		end
		
		BackgroundFill:RegisterAnimationSequence( "Visible", {
			{
				function ()
					return self.BackgroundFill:SetAlpha( 0.2, 0 )
				end
			}
		} )
		Background:RegisterAnimationSequence( "Visible", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end
			}
		} )
		StreakName:RegisterAnimationSequence( "Visible", {
			{
				function ()
					return self.StreakName:SetAlpha( 1, 0 )
				end
			}
		} )
		Score:RegisterAnimationSequence( "Visible", {
			{
				function ()
					return self.Score:SetAlpha( 1, 0 )
				end
			}
		} )
		StreakImage:RegisterAnimationSequence( "Visible", {
			{
				function ()
					return self.StreakImage:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Visible = function ()
			BackgroundFill:AnimateSequence( "Visible" )
			Background:AnimateSequence( "Visible" )
			StreakName:AnimateSequence( "Visible" )
			Score:AnimateSequence( "Visible" )
			StreakImage:AnimateSequence( "Visible" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "streak.baseRef", function ()
		local f26_local0 = self:GetDataSource()
		if f26_local0.streak.baseRef:GetValue( f3_local1 ) ~= nil then
			f26_local0 = self:GetDataSource()
			if f26_local0.streak.baseRef:GetValue( f3_local1 ) == "none" then
				ACTIONS.AnimateSequence( self, "Hidden" )
			end
		end
		f26_local0 = self:GetDataSource()
		if f26_local0.streak.baseRef:GetValue( f3_local1 ) ~= nil then
			f26_local0 = self:GetDataSource()
			if f26_local0.streak.baseRef:GetValue( f3_local1 ) ~= "none" then
				ACTIONS.AnimateSequence( self, "Visible" )
			end
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "StreakGraphItem", StreakGraphItem )
LockTable( _M )
