local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.weapon.levelInfo"
f0_local1 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0:GetDataSource()
	local f1_local1 = f1_local0.weaponRef:GetValue( f1_arg1 )
	if not f1_local1 then
		return 
	end
	local f1_local2 = Cac.GetWeaponLevelData( f1_local1, f1_arg1 )
	local f1_local3 = f1_local2.maxLevel + 1 < f1_local2.currentLevel
	f1_local0.currentLevel:SetValue( f1_arg1, f1_local2.currentLevel )
	f1_local0.progressFill:SetValue( f1_arg1, f1_local2.percentToNext )
	local f1_local4 = f1_local0.maxLevelAlpha
	local f1_local5 = f1_local4
	f1_local4 = f1_local4.SetValue
	local f1_local6 = f1_arg1
	local f1_local7
	if f1_local3 then
		f1_local7 = 1
		if not f1_local7 then
		
		else
			f1_local4( f1_local5, f1_local6, f1_local7 )
			f1_local0.prestigeLevelString:SetValue( f1_arg1, Engine.Localize( "PRESTIGE_CURRENT_LEVEL", Prestige.GetPrestigeLevelString( f1_local2.prestigeLevel ) ) )
			f1_local5 = f1_local0.prestigeLevelAlpha
			f1_local6 = f1_local5
			f1_local5 = f1_local5.SetValue
			f1_local7 = f1_arg1
			local f1_local8
			if f1_local2.prestigeLevel > 0 then
				f1_local8 = 1
				if not f1_local8 then
				
				else
					f1_local5( f1_local6, f1_local7, f1_local8 )
					f1_local0.prestigeReadyAlpha:SetValue( f1_arg1, Prestige.CanActivateWeaponPrestige( f1_local1, f1_arg1 ) and 1 or 0 )
					if not f1_local0.nextUnlock then
						f1_local0.nextUnlock = {}
					end
					f1_local0.alpha:SetValue( f1_arg1, 1 )
					if f1_local2.nextLevelUnlock then
						f1_local0.nextUnlock.name:SetValue( f1_arg1, f1_local2.nextLevelUnlock.name )
						f1_local0.nextUnlock.image:SetValue( f1_arg1, f1_local2.nextLevelUnlock.image )
						f1_local0.nextUnlock.alpha:SetValue( f1_arg1, 1 )
					else
						f1_local0.nextUnlock.alpha:SetValue( f1_arg1, 0 )
					end
					if CONDITIONS.IsCoreMultiplayer( f1_arg0 ) then
						f1_local5 = f1_local0.nextUnlock.alpha:GetValue( f1_arg1 )
						f1_local6 = f1_local0.prestigeReadyAlpha:GetValue( f1_arg1 )
						if f1_local5 == 1 then
							ACTIONS.AnimateSequence( f1_arg0, "PrestigeLevelRight" )
						elseif f1_local6 == 1 then
							ACTIONS.AnimateSequence( f1_arg0, "PrestigeLevelBottom" )
						else
							ACTIONS.AnimateSequence( f1_arg0, "PrestigeLevelAligned" )
						end
					end
				end
			end
			f1_local8 = 0
		end
	end
	f1_local7 = 0
end

f0_local2 = function ( f2_arg0, f2_arg1 )
	return function ()
		f0_local1( f2_arg0, f2_arg1 )
	end
	
end

local f0_local3 = function ( f4_arg0, f4_arg1, f4_arg2 )
	assert( f4_arg0.CurrentLevel )
	assert( f4_arg0.LevelBar )
	f4_arg0.modelPath = f0_local0
	f4_arg0:SetDataSource( {
		weaponRef = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".weaponRef" ),
		currentLevel = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".currentLevel" ),
		progressFill = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".progressFill" ),
		maxLevelAlpha = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".maxLevelAlpha" ),
		alpha = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".alpha" ),
		prestigeLevelString = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".prestigeLevelString" ),
		prestigeLevelAlpha = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".prestigeLevelAlpha" ),
		prestigeReadyAlpha = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".prestigeReadyAlpha" ),
		nextUnlock = {
			name = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".nextUnlock.name" ),
			image = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".nextUnlock.image" ),
			alpha = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".nextUnlock.alpha" )
		}
	}, f4_arg1 )
	f4_arg0:SubscribeToModelThroughElement( f4_arg0, "weaponRef", f0_local2( f4_arg0, f4_arg1 ) )
	f4_arg0:SubscribeToModelThroughElement( f4_arg0, "alpha", function ()
		local f5_local0 = f4_arg0:GetDataSource()
		f5_local0 = f5_local0.alpha:GetValue( f4_arg1 )
		if f5_local0 ~= nil and (not CONDITIONS.IsSystemLink( f4_arg0 ) or not CONDITIONS.IsThirdGameMode( f4_arg0 )) then
			f4_arg0:SetAlpha( f5_local0, 0 )
		end
	end )
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence( f4_arg0, "ReadsRightToLeft" )
	end
end

function LevelInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 86 * _1080p )
	self.id = "LevelInfo"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local ProgressbarBack = nil
	
	ProgressbarBack = LUI.UIImage.new()
	ProgressbarBack.id = "ProgressbarBack"
	ProgressbarBack:SetRGBFromInt( 0, 0 )
	ProgressbarBack:SetAlpha( 0.6, 0 )
	ProgressbarBack:setImage( RegisterMaterial( "wdg_circle_progressbar_back" ), 0 )
	ProgressbarBack:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -2.1, _1080p * -186.9, _1080p * -14, _1080p * 14 )
	self:addElement( ProgressbarBack )
	self.ProgressbarBack = ProgressbarBack
	
	local ProgressbarBackRim = nil
	
	ProgressbarBackRim = LUI.UIImage.new()
	ProgressbarBackRim.id = "ProgressbarBackRim"
	ProgressbarBackRim:SetAlpha( 0.2, 0 )
	ProgressbarBackRim:setImage( RegisterMaterial( "wdg_rewards_progressbar_whole" ), 0 )
	ProgressbarBackRim:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1.9, _1080p * -190.9, _1080p * -10, _1080p * 10 )
	self:addElement( ProgressbarBackRim )
	self.ProgressbarBackRim = ProgressbarBackRim
	
	local ProgressbarBackCenter = nil
	
	ProgressbarBackCenter = LUI.UIImage.new()
	ProgressbarBackCenter.id = "ProgressbarBackCenter"
	ProgressbarBackCenter:SetAlpha( 0.4, 0 )
	ProgressbarBackCenter:setImage( RegisterMaterial( "wdg_circle_progressbar_back_center" ), 0 )
	ProgressbarBackCenter:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -2.1, _1080p * -186.9, _1080p * -14, _1080p * 14 )
	self:addElement( ProgressbarBackCenter )
	self.ProgressbarBackCenter = ProgressbarBackCenter
	
	local LevelBar = nil
	
	LevelBar = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 2,
		segmentMaterial = "challenges_progress_circle_segment",
		maskMaterial = "dpad_circle_mask",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f6_local1
	} )
	LevelBar.id = "LevelBar"
	LevelBar:setImage( RegisterMaterial( "challenges_progress_circle_segment" ), 0 )
	LevelBar:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -7.1, _1080p * -181.9, _1080p * -19, _1080p * 19 )
	LevelBar:SubscribeToModelThroughElement( self, "progressFill", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.progressFill:GetValue( f6_local1 )
		if f7_local0 ~= nil then
			LevelBar:SetProgress( f7_local0 )
		end
	end )
	self:addElement( LevelBar )
	self.LevelBar = LevelBar
	
	local f6_local7 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f6_local7 = MenuBuilder.BuildRegisteredType( "NextUnlock", {
			controllerIndex = f6_local1
		} )
		f6_local7.id = "NextUnlock"
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f6_local7:SetDataSourceThroughElement( self, "nextUnlock" )
		end
		f6_local7:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 112.1, _1080p * -106.9, _1080p * 3, _1080p * -3 )
		self:addElement( f6_local7 )
		self.NextUnlock = f6_local7
	end
	local WeaponLevelLabel = nil
	
	WeaponLevelLabel = LUI.UIText.new()
	WeaponLevelLabel.id = "WeaponLevelLabel"
	WeaponLevelLabel:setText( Engine.Localize( "MENU_LEVEL_CAPS" ), 0 )
	WeaponLevelLabel:SetFontSize( 18 * _1080p )
	WeaponLevelLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	WeaponLevelLabel:SetAlignment( LUI.Alignment.Center )
	WeaponLevelLabel:SetOptOutRightToLeftAlignmentFlip( true )
	WeaponLevelLabel:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 15.5, _1080p * -204.5, _1080p * -20, _1080p * -2 )
	self:addElement( WeaponLevelLabel )
	self.WeaponLevelLabel = WeaponLevelLabel
	
	local CurrentLevel = nil
	
	CurrentLevel = LUI.UIText.new()
	CurrentLevel.id = "CurrentLevel"
	CurrentLevel:SetFontSize( 28 * _1080p )
	CurrentLevel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	CurrentLevel:SetAlignment( LUI.Alignment.Center )
	CurrentLevel:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 26, _1080p * -215, _1080p * -3, _1080p * 25 )
	CurrentLevel:SubscribeToModelThroughElement( self, "currentLevel", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.currentLevel:GetValue( f6_local1 )
		if f8_local0 ~= nil then
			CurrentLevel:setText( f8_local0, 0 )
		end
	end )
	self:addElement( CurrentLevel )
	self.CurrentLevel = CurrentLevel
	
	local ProgressNode = nil
	
	ProgressNode = LUI.UIImage.new()
	ProgressNode.id = "ProgressNode"
	ProgressNode:SetAlpha( 0.8, 0 )
	ProgressNode:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 54.5, _1080p * -243.5, _1080p * -12, _1080p * -90 )
	self:addElement( ProgressNode )
	self.ProgressNode = ProgressNode
	
	local f6_local11 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f6_local11 = LUI.UIText.new()
		f6_local11.id = "UnlockName"
		f6_local11:SetFontSize( 16 * _1080p )
		f6_local11:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f6_local11:SetAlignment( LUI.Alignment.Left )
		f6_local11:SetOptOutRightToLeftAlignmentFlip( true )
		f6_local11:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 225, _1080p * 71, _1080p * 35, _1080p * -35 )
		f6_local11:SubscribeToModelThroughElement( self, "nextUnlock.alpha", function ()
			local f9_local0 = self:GetDataSource()
			f9_local0 = f9_local0.nextUnlock.alpha:GetValue( f6_local1 )
			if f9_local0 ~= nil then
				f6_local11:SetAlpha( f9_local0, 0 )
			end
		end )
		f6_local11:SubscribeToModelThroughElement( self, "nextUnlock.name", function ()
			local f10_local0 = self:GetDataSource()
			f10_local0 = f10_local0.nextUnlock.name:GetValue( f6_local1 )
			if f10_local0 ~= nil then
				f6_local11:setText( f10_local0, 0 )
			end
		end )
		self:addElement( f6_local11 )
		self.UnlockName = f6_local11
	end
	local f6_local12 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f6_local12 = LUI.UIStyledText.new()
		f6_local12.id = "NextUnlockText"
		f6_local12:SetRGBFromInt( 10921638, 0 )
		f6_local12:setText( ToUpperCase( Engine.Localize( "MPUI_NEXT_UNLOCK" ) ), 0 )
		f6_local12:SetFontSize( 14 * _1080p )
		f6_local12:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f6_local12:SetAlignment( LUI.Alignment.Left )
		f6_local12:SetOptOutRightToLeftAlignmentFlip( true )
		f6_local12:SetStartupDelay( 1250 )
		f6_local12:SetLineHoldTime( 400 )
		f6_local12:SetAnimMoveTime( 300 )
		f6_local12:SetEndDelay( 1000 )
		f6_local12:SetCrossfadeTime( 400 )
		f6_local12:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
		f6_local12:SetMaxVisibleLines( 1 )
		f6_local12:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 201.1, _1080p * 61, _1080p * 13, _1080p * -59 )
		f6_local12:SubscribeToModelThroughElement( self, "nextUnlock.alpha", function ()
			local f11_local0 = self:GetDataSource()
			f11_local0 = f11_local0.nextUnlock.alpha:GetValue( f6_local1 )
			if f11_local0 ~= nil then
				f6_local12:SetAlpha( f11_local0, 0 )
			end
		end )
		self:addElement( f6_local12 )
		self.NextUnlockText = f6_local12
	end
	local f6_local13 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f6_local13 = LUI.UIImage.new()
		f6_local13.id = "LockImage"
		f6_local13:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
		f6_local13:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 201.1, _1080p * -82.9, _1080p * 35, _1080p * -35 )
		f6_local13:SubscribeToModelThroughElement( self, "nextUnlock.alpha", function ()
			local f12_local0 = self:GetDataSource()
			f12_local0 = f12_local0.nextUnlock.alpha:GetValue( f6_local1 )
			if f12_local0 ~= nil then
				f6_local13:SetAlpha( f12_local0, 0 )
			end
		end )
		self:addElement( f6_local13 )
		self.LockImage = f6_local13
	end
	local MaxLevel = nil
	
	MaxLevel = MenuBuilder.BuildRegisteredType( "MaxLevel", {
		controllerIndex = f6_local1
	} )
	MaxLevel.id = "MaxLevel"
	MaxLevel:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 18, _1080p * -207, _1080p * 30, _1080p * -30 )
	MaxLevel:SubscribeToModelThroughElement( self, "maxLevelAlpha", function ()
		local f13_local0 = self:GetDataSource()
		f13_local0 = f13_local0.maxLevelAlpha:GetValue( f6_local1 )
		if f13_local0 ~= nil then
			MaxLevel:SetAlpha( f13_local0, 0 )
		end
	end )
	self:addElement( MaxLevel )
	self.MaxLevel = MaxLevel
	
	local f6_local15 = nil
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f6_local15 = MenuBuilder.BuildRegisteredType( "PrestigeLevel", {
			controllerIndex = f6_local1
		} )
		f6_local15.id = "PrestigeLevel"
		f6_local15:SetRGBFromInt( 10921638, 0 )
		f6_local15:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 193.05, _1080p * 74.95, _1080p * 68, _1080p * 80 )
		f6_local15:SubscribeToModelThroughElement( self, "prestigeLevelAlpha", function ()
			local f14_local0 = self:GetDataSource()
			f14_local0 = f14_local0.prestigeLevelAlpha:GetValue( f6_local1 )
			if f14_local0 ~= nil then
				f6_local15:SetAlpha( f14_local0, 0 )
			end
		end )
		f6_local15:SubscribeToModelThroughElement( self, "prestigeLevelString", function ()
			local f15_local0 = self:GetDataSource()
			f15_local0 = f15_local0.prestigeLevelString:GetValue( f6_local1 )
			if f15_local0 ~= nil then
				f6_local15.Text:setText( f15_local0, 0 )
			end
		end )
		self:addElement( f6_local15 )
		self.PrestigeLevel = f6_local15
	end
	local f6_local16 = nil
	if CONDITIONS.InFrontendPublicMP( self ) then
		f6_local16 = LUI.UIStyledText.new()
		f6_local16.id = "PrestigeReady"
		f6_local16:SetAlpha( 0, 0 )
		f6_local16:setText( Engine.Localize( "PRESTIGE_WEAPON_PRESTIGE_READY" ), 0 )
		f6_local16:SetFontSize( 22 * _1080p )
		f6_local16:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
		f6_local16:SetAlignment( LUI.Alignment.Left )
		f6_local16:SetOptOutRightToLeftAlignmentFlip( true )
		f6_local16:SetStartupDelay( 1000 )
		f6_local16:SetLineHoldTime( 500 )
		f6_local16:SetAnimMoveTime( 500 )
		f6_local16:SetEndDelay( 1000 )
		f6_local16:SetCrossfadeTime( 500 )
		f6_local16:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
		f6_local16:SetMaxVisibleLines( 2 )
		f6_local16:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 118.1, _1080p * 361, _1080p * 34.25, _1080p * 51.75 )
		self:addElement( f6_local16 )
		self.PrestigeReady = f6_local16
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		WeaponLevelLabel:RegisterAnimationSequence( "NotMax", {
			{
				function ()
					return self.WeaponLevelLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		CurrentLevel:RegisterAnimationSequence( "NotMax", {
			{
				function ()
					return self.CurrentLevel:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.NotMax = function ()
			WeaponLevelLabel:AnimateSequence( "NotMax" )
			CurrentLevel:AnimateSequence( "NotMax" )
		end
		
		WeaponLevelLabel:RegisterAnimationSequence( "Max", {
			{
				function ()
					return self.WeaponLevelLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		CurrentLevel:RegisterAnimationSequence( "Max", {
			{
				function ()
					return self.CurrentLevel:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Max = function ()
			WeaponLevelLabel:AnimateSequence( "Max" )
			CurrentLevel:AnimateSequence( "Max" )
		end
		
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f6_local11:RegisterAnimationSequence( "ReadsRightToLeft", {
				{
					function ()
						return self.UnlockName:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 193.1, _1080p * -21.9, _1080p * 35, _1080p * -35, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f6_local12:RegisterAnimationSequence( "ReadsRightToLeft", {
				{
					function ()
						return self.NextUnlockText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 193.1, _1080p * 300, _1080p * -30, _1080p * -16, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f6_local13:RegisterAnimationSequence( "ReadsRightToLeft", {
				{
					function ()
						return self.LockImage:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 284, _1080p * 300, _1080p * -8, _1080p * 8, 0 )
					end
				}
			} )
		end
		self._sequences.ReadsRightToLeft = function ()
			if CONDITIONS.IsCoreMultiplayer( self ) then
				f6_local11:AnimateSequence( "ReadsRightToLeft" )
			end
			if CONDITIONS.IsCoreMultiplayer( self ) then
				f6_local12:AnimateSequence( "ReadsRightToLeft" )
			end
			if CONDITIONS.IsCoreMultiplayer( self ) then
				f6_local13:AnimateSequence( "ReadsRightToLeft" )
			end
		end
		
		if CONDITIONS.InFrontendPublicMP( self ) then
			f6_local16:RegisterAnimationSequence( "ShowPrestigeReady", {
				{
					function ()
						return self.PrestigeReady:SetAlpha( 1, 0 )
					end
				},
				{
					function ()
						return self.PrestigeReady:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 118.1, _1080p * 361, _1080p * 27, _1080p * 44.5, 0 )
					end
				}
			} )
		end
		self._sequences.ShowPrestigeReady = function ()
			if CONDITIONS.InFrontendPublicMP( self ) then
				f6_local16:AnimateSequence( "ShowPrestigeReady" )
			end
		end
		
		if CONDITIONS.InFrontendPublicMP( self ) then
			f6_local16:RegisterAnimationSequence( "HidePrestigeReady", {
				{
					function ()
						return self.PrestigeReady:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HidePrestigeReady = function ()
			if CONDITIONS.InFrontendPublicMP( self ) then
				f6_local16:AnimateSequence( "HidePrestigeReady" )
			end
		end
		
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f6_local15:RegisterAnimationSequence( "PrestigeLevelRight", {
				{
					function ()
						return self.PrestigeLevel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 193.05, _1080p * 374.95, _1080p * 68, _1080p * 80, 0 )
					end
				}
			} )
		end
		self._sequences.PrestigeLevelRight = function ()
			if CONDITIONS.IsCoreMultiplayer( self ) then
				f6_local15:AnimateSequence( "PrestigeLevelRight" )
			end
		end
		
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f6_local15:RegisterAnimationSequence( "PrestigeLevelBottom", {
				{
					function ()
						return self.PrestigeLevel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 118.1, _1080p * 300, _1080p * 83, _1080p * 95, 0 )
					end
				}
			} )
		end
		self._sequences.PrestigeLevelBottom = function ()
			if CONDITIONS.IsCoreMultiplayer( self ) then
				f6_local15:AnimateSequence( "PrestigeLevelBottom" )
			end
		end
		
		if CONDITIONS.IsCoreMultiplayer( self ) then
			f6_local15:RegisterAnimationSequence( "PrestigeLevelAligned", {
				{
					function ()
						return self.PrestigeLevel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 124.05, _1080p * 305.95, _1080p * 37, _1080p * 49, 0 )
					end
				}
			} )
		end
		self._sequences.PrestigeLevelAligned = function ()
			if CONDITIONS.IsCoreMultiplayer( self ) then
				f6_local15:AnimateSequence( "PrestigeLevelAligned" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsCoreMultiplayer( self ) then
		f6_local7:SetDataSourceThroughElement( self, "nextUnlock" )
	end
	self:SubscribeToModelThroughElement( self, "maxLevelAlpha", function ()
		local f39_local0 = self:GetDataSource()
		if f39_local0.maxLevelAlpha:GetValue( f6_local1 ) ~= nil then
			f39_local0 = self:GetDataSource()
			if f39_local0.maxLevelAlpha:GetValue( f6_local1 ) == 1 then
				ACTIONS.AnimateSequence( self, "Max" )
			end
		end
		f39_local0 = self:GetDataSource()
		if f39_local0.maxLevelAlpha:GetValue( f6_local1 ) ~= nil then
			f39_local0 = self:GetDataSource()
			if f39_local0.maxLevelAlpha:GetValue( f6_local1 ) == 0 then
				ACTIONS.AnimateSequence( self, "NotMax" )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "prestigeReadyAlpha", function ()
		local f40_local0 = self:GetDataSource()
		if f40_local0.prestigeReadyAlpha:GetValue( f6_local1 ) ~= nil then
			f40_local0 = self:GetDataSource()
			if f40_local0.prestigeReadyAlpha:GetValue( f6_local1 ) == 1 and CONDITIONS.InFrontendPublicMP( self ) then
				ACTIONS.AnimateSequence( self, "ShowPrestigeReady" )
			end
		end
		f40_local0 = self:GetDataSource()
		if f40_local0.prestigeReadyAlpha:GetValue( f6_local1 ) ~= nil then
			f40_local0 = self:GetDataSource()
			if f40_local0.prestigeReadyAlpha:GetValue( f6_local1 ) == 0 and CONDITIONS.InFrontendPublicMP( self ) then
				ACTIONS.AnimateSequence( self, "HidePrestigeReady" )
			end
		end
	end )
	f0_local3( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "LevelInfo", LevelInfo )
LockTable( _M )
