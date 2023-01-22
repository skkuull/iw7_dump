local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ChallengeCategoryButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 700 * _1080p, 0, 85 * _1080p )
	self.id = "ChallengeCategoryButton"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.isUnlocked:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			self:SetButtonDisabled( Not( f2_local0 ) )
		end
	end )
	local GenericButton = nil
	
	GenericButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	GenericButton.id = "GenericButton"
	GenericButton:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, _1080p * -70, _1080p * -15, _1080p * 15 )
	GenericButton:SubscribeToModelThroughElement( self, "name", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.name:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			GenericButton.Text:setText( ToUpperCase( f3_local0 ), 0 )
		end
	end )
	self:addElement( GenericButton )
	self.GenericButton = GenericButton
	
	local LevelBarBG = nil
	
	LevelBarBG = LUI.UIImage.new()
	LevelBarBG.id = "LevelBarBG"
	LevelBarBG:setImage( RegisterMaterial( "challenges_progress_circle_bg" ), 0 )
	LevelBarBG:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -106, _1080p * -4, _1080p * -51, _1080p * 51 )
	self:addElement( LevelBarBG )
	self.LevelBarBG = LevelBarBG
	
	local LevelBar = nil
	
	LevelBar = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 2,
		segmentMaterial = "challenges_progress_circle_segment",
		maskMaterial = "dpad_circle_mask",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f1_local1
	} )
	LevelBar.id = "LevelBar"
	LevelBar:setImage( RegisterMaterial( "challenges_progress_circle_segment" ), 0 )
	LevelBar:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -106, _1080p * -6, _1080p * -50, _1080p * 50 )
	LevelBar:SubscribeToModelThroughElement( self, "progress", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.progress:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			LevelBar:SetProgress( f4_local0 )
		end
	end )
	self:addElement( LevelBar )
	self.LevelBar = LevelBar
	
	local PercentCompleteValue = nil
	
	PercentCompleteValue = LUI.UIText.new()
	PercentCompleteValue.id = "PercentCompleteValue"
	PercentCompleteValue:SetFontSize( 19 * _1080p )
	PercentCompleteValue:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PercentCompleteValue:SetAlignment( LUI.Alignment.Center )
	PercentCompleteValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 586.07, _1080p * 705.94, _1080p * 34, _1080p * 53 )
	PercentCompleteValue:SubscribeToModelThroughElement( self, "progressText", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.progressText:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			PercentCompleteValue:setText( f5_local0, 0 )
		end
	end )
	self:addElement( PercentCompleteValue )
	self.PercentCompleteValue = PercentCompleteValue
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		GenericButton:RegisterAnimationSequence( "CPinit", {
			{
				function ()
					return self.GenericButton:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 30, _1080p * -177.94, _1080p * -15, _1080p * 15, 0 )
				end
			}
		} )
		LevelBarBG:RegisterAnimationSequence( "CPinit", {
			{
				function ()
					return self.LevelBarBG:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -294, _1080p * -192, _1080p * -51, _1080p * 51, 0 )
				end
			}
		} )
		LevelBar:RegisterAnimationSequence( "CPinit", {
			{
				function ()
					return self.LevelBar:SetRGBFromInt( 16745216, 0 )
				end
			},
			{
				function ()
					return self.LevelBar:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -294, _1080p * -194, _1080p * -50, _1080p * 50, 0 )
				end
			}
		} )
		PercentCompleteValue:RegisterAnimationSequence( "CPinit", {
			{
				function ()
					return self.PercentCompleteValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 398.07, _1080p * 517.94, _1080p * 34, _1080p * 53, 0 )
				end
			}
		} )
		self._sequences.CPinit = function ()
			GenericButton:AnimateSequence( "CPinit" )
			LevelBarBG:AnimateSequence( "CPinit" )
			LevelBar:AnimateSequence( "CPinit" )
			PercentCompleteValue:AnimateSequence( "CPinit" )
		end
		
		GenericButton:RegisterAnimationSequence( "CPinitArabic", {
			{
				function ()
					return self.GenericButton:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 30, _1080p * -177.94, _1080p * -15, _1080p * 15, 0 )
				end
			}
		} )
		LevelBarBG:RegisterAnimationSequence( "CPinitArabic", {
			{
				function ()
					return self.LevelBarBG:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -245, _1080p * -143, _1080p * -51, _1080p * 51, 0 )
				end
			}
		} )
		LevelBar:RegisterAnimationSequence( "CPinitArabic", {
			{
				function ()
					return self.LevelBar:SetRGBFromInt( 16745216, 0 )
				end
			},
			{
				function ()
					return self.LevelBar:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -245, _1080p * -145, _1080p * -50, _1080p * 50, 0 )
				end
			}
		} )
		PercentCompleteValue:RegisterAnimationSequence( "CPinitArabic", {
			{
				function ()
					return self.PercentCompleteValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 447.07, _1080p * 566.94, _1080p * 34, _1080p * 53, 0 )
				end
			}
		} )
		self._sequences.CPinitArabic = function ()
			GenericButton:AnimateSequence( "CPinitArabic" )
			LevelBarBG:AnimateSequence( "CPinitArabic" )
			LevelBar:AnimateSequence( "CPinitArabic" )
			PercentCompleteValue:AnimateSequence( "CPinitArabic" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	GenericButton.contextMenuWidgetName = GenericButton
	GenericButton.contextMenuWidgetName = GenericButton
	self:addEventHandler( "button_action", function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg1.controller or f1_local1
		local f20_local1 = self:GetDataSource()
		if f20_local1.isUnlocked:GetValue( f20_local0 ) ~= nil then
			f20_local1 = self:GetDataSource()
			if f20_local1.isUnlocked:GetValue( f20_local0 ) == true then
				ACTIONS.LoseFocus( self, "", f20_local0 )
				ACTIONS.OpenChallengesMenu( self, f20_arg0, f20_local0 )
			end
		end
	end )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPinit" )
	end
	if CONDITIONS.IsThirdGameMode( self ) and CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "CPinitArabic" )
	end
	return self
end

MenuBuilder.registerType( "ChallengeCategoryButton", ChallengeCategoryButton )
LockTable( _M )
