local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "quality", function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f2_local0 == nil or f2_local0 == Cac.LowestQuality then
			f1_arg0.QualityIcon:SetAlpha( 0, 0 )
		else
			f1_arg0.QualityIcon:SetAlpha( 1, 0 )
		end
	end )
end

function FramedStreak( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 77 * _1080p )
	self.id = "FramedStreak"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	self:SetButtonDisabled( true )
	local StreakImage = nil
	
	StreakImage = LUI.UIImage.new()
	StreakImage.id = "StreakImage"
	StreakImage:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -24, _1080p * 24, 0, _1080p * 48 )
	StreakImage:SubscribeToModelThroughElement( self, "icon", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.icon:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			StreakImage:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( StreakImage )
	self.StreakImage = StreakImage
	
	local EmptyLabel = nil
	
	EmptyLabel = LUI.UIText.new()
	EmptyLabel.id = "EmptyLabel"
	EmptyLabel:SetAlpha( 0, 0 )
	EmptyLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_EMPTY" ) ), 0 )
	EmptyLabel:SetFontSize( 48 * _1080p )
	EmptyLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	EmptyLabel:SetAlignment( LUI.Alignment.Center )
	EmptyLabel:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 64, _1080p * -24, _1080p * 24 )
	self:addElement( EmptyLabel )
	self.EmptyLabel = EmptyLabel
	
	local EmptyIcon = nil
	
	EmptyIcon = LUI.UIImage.new()
	EmptyIcon.id = "EmptyIcon"
	EmptyIcon:SetAlpha( 0, 0 )
	EmptyIcon:setImage( RegisterMaterial( "icon_slot_empty" ), 0 )
	EmptyIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 64, _1080p * -32, _1080p * 32 )
	self:addElement( EmptyIcon )
	self.EmptyIcon = EmptyIcon
	
	local Score = nil
	
	Score = LUI.UIText.new()
	Score.id = "Score"
	Score:SetFontSize( 18 * _1080p )
	Score:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Score:SetAlignment( LUI.Alignment.Center )
	Score:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 5, _1080p * -5, _1080p * -22, _1080p * -4 )
	Score:SubscribeToModelThroughElement( self, "score", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.score:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			Score:setText( f5_local0, 0 )
		end
	end )
	self:addElement( Score )
	self.Score = Score
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f3_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -17, _1080p * 7, _1080p * 28, _1080p * 52 )
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
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		StreakImage:RegisterAnimationSequence( "InUse", {
			{
				function ()
					return self.StreakImage:SetAlpha( 1, 0 )
				end
			}
		} )
		EmptyIcon:RegisterAnimationSequence( "InUse", {
			{
				function ()
					return self.EmptyIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.InUse = function ()
			StreakImage:AnimateSequence( "InUse" )
			EmptyIcon:AnimateSequence( "InUse" )
		end
		
		StreakImage:RegisterAnimationSequence( "NotInUse", {
			{
				function ()
					return self.StreakImage:SetAlpha( 0, 0 )
				end
			}
		} )
		EmptyIcon:RegisterAnimationSequence( "NotInUse", {
			{
				function ()
					return self.EmptyIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NotInUse = function ()
			StreakImage:AnimateSequence( "NotInUse" )
			EmptyIcon:AnimateSequence( "NotInUse" )
		end
		
		StreakImage:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.StreakImage:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.StreakImage:SetScale( 0.1, 100 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			StreakImage:AnimateSequence( "ButtonOver" )
		end
		
		StreakImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.StreakImage:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			StreakImage:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f24_arg0, f24_arg1 )
		local f24_local0 = f24_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f25_arg0, f25_arg1 )
		local f25_local0 = f25_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:SubscribeToModelThroughElement( self, "used", function ()
		local f26_local0 = self:GetDataSource()
		if f26_local0.used:GetValue( f3_local1 ) ~= nil then
			f26_local0 = self:GetDataSource()
			if f26_local0.used:GetValue( f3_local1 ) == true then
				ACTIONS.AnimateSequence( self, "InUse" )
			end
		end
		f26_local0 = self:GetDataSource()
		if f26_local0.used:GetValue( f3_local1 ) ~= nil then
			f26_local0 = self:GetDataSource()
			if f26_local0.used:GetValue( f3_local1 ) == false then
				ACTIONS.AnimateSequence( self, "NotInUse" )
			end
		end
	end )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "FramedStreak", FramedStreak )
LockTable( _M )
