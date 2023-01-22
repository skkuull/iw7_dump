local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.IsPC()
	if f1_local0 then
		f1_local0 = Engine.IsCoreMode()
		if f1_local0 then
			f1_local0 = not CONDITIONS.IsGamepadEnabled( f1_arg0 )
		end
	end
	if f1_local0 then
		assert( f1_arg0.Confirm )
	end
	f1_arg0.isUnlocked = false
	if Engine.IsSingleplayer() then
		f1_arg0.UnlockCriteria:SubscribeToModelThroughElement( f1_arg0, "weapon.ref", function ()
			f1_arg0.UnlockCriteria.UnlockDesc:setText( Engine.Localize( "LUA_MENU_SCAN_REQUIRED" ) )
		end )
		f1_arg0:SubscribeToModelThroughElement( f1_arg0, "weapon.isScanned", function ()
			local f3_local0 = f1_arg0:GetDataSource()
			if f3_local0.weapon.isScanned:GetValue( f1_arg1 ) ~= nil then
				f3_local0 = f1_arg0:GetDataSource()
				if f3_local0.weapon.isScanned:GetValue( f1_arg1 ) == true then
					ACTIONS.AnimateSequence( f1_arg0, "HideCriteria" )
					ACTIONS.DebugPrint( f1_arg0, "WEAPON SCAN IS TRUE" )
				end
			end
			f3_local0 = f1_arg0:GetDataSource()
			if f3_local0.weapon.isScanned:GetValue( f1_arg1 ) ~= nil then
				f3_local0 = f1_arg0:GetDataSource()
				if f3_local0.weapon.isScanned:GetValue( f1_arg1 ) == false then
					ACTIONS.AnimateSequence( f1_arg0, "ShowCriteria" )
					ACTIONS.DebugPrint( f1_arg0, "WEAPON SCAN IS FALSE" )
				end
			end
		end )
		f1_arg0:SubscribeToModelThroughElement( f1_arg0, "weapon.isEnergyWeapon", function ()
			local f4_local0 = f1_arg0:GetDataSource()
			if f4_local0.weapon.isEnergyWeapon:GetValue( f1_arg1 ) ~= nil then
				f4_local0 = f1_arg0:GetDataSource()
				if f4_local0.weapon.isEnergyWeapon:GetValue( f1_arg1 ) == false then
					ACTIONS.AnimateSequenceByElement( f1_arg0, {
						elementName = "CACItemHeader",
						sequenceName = "HideEnergy",
						elementPath = "CACItemHeader"
					} )
				end
			end
			f4_local0 = f1_arg0:GetDataSource()
			if f4_local0.weapon.isEnergyWeapon:GetValue( f1_arg1 ) ~= nil then
				f4_local0 = f1_arg0:GetDataSource()
				if f4_local0.weapon.isEnergyWeapon:GetValue( f1_arg1 ) == true then
					ACTIONS.AnimateSequenceByElement( f1_arg0, {
						elementName = "CACItemHeader",
						sequenceName = "ShowEnergy",
						elementPath = "CACItemHeader"
					} )
				end
			end
		end )
		f1_arg0.UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5.5, _1080p * 443.5, _1080p * 295, _1080p * 325, 0 )
	else
		f1_arg0.UnlockCriteria:SubscribeToModelThroughElement( f1_arg0, "weapon.ref", function ()
			local f5_local0 = f1_arg0:GetDataSource()
			local f5_local1
			if f5_local0.weapon.isLoot:GetValue( f1_arg1 ) then
				f5_local1 = f1_arg0:GetDataSource()
				f5_local1 = f5_local1.weapon.baseWeaponRef:GetValue( f1_arg1 )
				if not f5_local1 then
				
				else
					if f5_local1 ~= nil then
						local f5_local2 = Cac.GetWeaponIndex( f5_local1 )
						local f5_local3 = f1_arg0:GetCurrentMenu()
						if CONDITIONS.IsDraftEnabled() and f5_local3.XUID then
							if f5_local3.draftSlot then
								local f5_local4 = LoadoutDrafting.GetPlayerXUIDWithWeapon( f1_arg1, f5_local2, 1 )
								local f5_local5 = LoadoutDrafting.GetPlayerXUIDWithWeapon( f1_arg1, f5_local2, 2 )
								if not Engine.IsXUIDInvalid( f5_local4 ) or not Engine.IsXUIDInvalid( f5_local5 ) then
									if f5_local4 == f5_local3.XUID or f5_local5 == f5_local3.XUID then
										f1_arg0.UnlockCriteria.UnlockDesc:setText( Engine.Localize( "MP_FRONTEND_ONLY_YOU_HAVE_DRAFTED" ) )
									else
										f1_arg0.UnlockCriteria.UnlockDesc:setText( Engine.Localize( "MP_FRONTEND_ONLY_ANOTHER_PLAYER_DRAFTED" ) )
									end
									return 
								end
							elseif LoadoutDrafting.GetPlayerXUIDWithWeapon( f1_arg1, f5_local2, 1 ) ~= f5_local3.XUID and LoadoutDrafting.GetPlayerXUIDWithWeapon( f1_arg1, f5_local2, 2 ) ~= f5_local3.XUID then
								f1_arg0.UnlockCriteria.UnlockDesc:setText( Engine.Localize( "MP_FRONTEND_ONLY_YOU_HAVE_NOT_DRAFTED" ) )
								return 
							end
						end
						f1_arg0.UnlockCriteria.UnlockDesc:setText( GetWeaponUnlockText( f5_local1 ), 0 )
					end
				end
			end
			f5_local1 = f1_arg0:GetDataSource()
			f5_local1 = f5_local1.weapon.ref:GetValue( f1_arg1 )
		end )
		f1_arg0:SubscribeToModelThroughElement( f1_arg0, "weapon.isUnlocked", function ()
			local f6_local0 = f1_arg0
			local f6_local1 = f1_arg0:GetDataSource()
			f6_local0.isUnlocked = f6_local1.weapon.isUnlocked:GetValue( f1_arg1 )
			if f1_local0 then
				f1_arg0.Confirm:SetButtonDisabled( not f1_arg0.isUnlocked )
			end
		end )
		f1_arg0.MK2Pattern:processEvent( {
			name = "mk2_wide_pattern"
		} )
		f1_arg0.QualityIcon:SubscribeToModelThroughElement( f1_arg0, "weapon.quality", function ()
			local f7_local0 = f1_arg0:GetDataSource()
			f7_local0 = f7_local0.weapon.ref:GetValue( f1_arg1 )
			local f7_local1 = f1_arg0:GetDataSource()
			f7_local1 = f7_local1.weapon.qualityImage:GetValue( f1_arg1 )
			if f7_local1 ~= nil then
				f1_arg0.QualityIcon.IconDuplicate:setImage( RegisterMaterial( f7_local1 .. "_mk2" ), 0 )
			end
			if Cac.IsWeaponRefMk2( f7_local0 ) then
				f1_arg0.MK2:SetAlpha( 0.5, 0 )
				f1_arg0.MK2Pattern:SetAlpha( 1, 0 )
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "MK2BonusText",
					sequenceName = "MK2On",
					elementPath = "MK2BonusText"
				} )
				if Engine.IsCoreMode() then
					ACTIONS.AnimateSequenceByElement( f1_arg0, {
						elementName = "QualityIcon",
						sequenceName = "LegendaryPulse",
						elementPath = "QualityIcon"
					} )
				end
			else
				f1_arg0.QualityIcon.IconDuplicate:SetAlpha( 0, 0 )
				f1_arg0.MK2:SetAlpha( 0, 0 )
				f1_arg0.MK2Pattern:SetAlpha( 0, 0 )
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "MK2BonusText",
					sequenceName = "MK2Off",
					elementPath = "MK2BonusText"
				} )
				if Engine.IsCoreMode() then
					ACTIONS.AnimateSequenceByElement( f1_arg0, {
						elementName = "QualityIcon",
						sequenceName = "StopPulse",
						elementPath = "QualityIcon"
					} )
				end
			end
		end )
	end
	if Engine.IsAliensMode() then
		f1_arg0.CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	else
		f1_arg0.CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	end
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "weapon.desc", function ()
		ACTIONS.AnimateSequenceByElement( f1_arg0, {
			elementName = "CACItemHeader",
			sequenceName = "UpdateDescription",
			elementPath = "CACItemHeader"
		} )
	end )
	if f1_local0 then
		f1_arg0.Confirm:SetHandleMouse( true )
		f1_arg0.Confirm:addEventHandler( "button_action", function ()
			if CONDITIONS.IsCoreMultiplayer( f1_arg0 ) then
				local f9_local0 = f1_arg0:GetDataSource()
				f9_local0 = f9_local0.weapon.isDisabledByPointCount:GetValue( f1_arg1 )
				if f9_local0 ~= nil and f9_local0 == true then
					ACTIONS.OpenLoadoutRemovalPopup( f1_arg0, "CACLoadoutRemovalPopup", true, f1_arg1 )
				else
					ACTIONS.EquipWeapon( f1_arg0, f1_arg1 )
					LUI.FlowManager.RequestLeaveMenu( f1_arg0, true, true )
				end
			end
		end )
	end
end

function WeaponDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1507 * _1080p, 0, 200 * _1080p )
	self.id = "WeaponDetails"
	self._animationSets = {}
	self._sequences = {}
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	local f10_local2 = self
	local CACItemHeader = nil
	
	CACItemHeader = MenuBuilder.BuildRegisteredType( "CACItemHeader", {
		controllerIndex = f10_local1
	} )
	CACItemHeader.id = "CACItemHeader"
	CACItemHeader.ItemDescription:SetRight( _1080p * 750, 0 )
	CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 2, _1080p * 102 )
	CACItemHeader:SubscribeToModelThroughElement( self, "weapon.qualityColor", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.weapon.qualityColor:GetValue( f10_local1 )
		if f11_local0 ~= nil then
			CACItemHeader.Background:SetRGBFromInt( f11_local0, 0 )
		end
	end )
	CACItemHeader:SubscribeToModelThroughElement( self, "weapon.desc", function ()
		local f12_local0 = self:GetDataSource()
		f12_local0 = f12_local0.weapon.desc:GetValue( f10_local1 )
		if f12_local0 ~= nil then
			CACItemHeader.ItemDescription:setText( f12_local0, 0 )
		end
	end )
	CACItemHeader:SubscribeToModelThroughElement( self, "weapon.name", function ()
		local f13_local0 = self:GetDataSource()
		f13_local0 = f13_local0.weapon.name:GetValue( f10_local1 )
		if f13_local0 ~= nil then
			CACItemHeader.ItemName:setText( f13_local0, 0 )
		end
	end )
	self:addElement( CACItemHeader )
	self.CACItemHeader = CACItemHeader
	
	local f10_local4 = nil
	if Engine.IsMultiplayer() then
		f10_local4 = MenuBuilder.BuildRegisteredType( "MK2Pattern", {
			controllerIndex = f10_local1
		} )
		f10_local4.id = "MK2Pattern"
		f10_local4:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100 )
		f10_local4:SubscribeToModelThroughElement( self, "weapon.qualityColor", function ()
			local f14_local0 = self:GetDataSource()
			f14_local0 = f14_local0.weapon.qualityColor:GetValue( f10_local1 )
			if f14_local0 ~= nil then
				f10_local4:SetRGBFromInt( f14_local0, 0 )
			end
		end )
		self:addElement( f10_local4 )
		self.MK2Pattern = f10_local4
	end
	local f10_local5 = nil
	if Engine.IsMultiplayer() then
		f10_local5 = MenuBuilder.BuildRegisteredType( "Passives", {
			controllerIndex = f10_local1
		} )
		f10_local5.id = "Passives"
		if Engine.IsMultiplayer() then
			f10_local5:SetDataSourceThroughElement( self, "weapon.passives" )
		end
		f10_local5.Grid:SetLeft( _1080p * 0, 0 )
		f10_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 551, _1080p * 1167, _1080p * 12, _1080p * 92 )
		self:addElement( f10_local5 )
		self.Passives = f10_local5
	end
	local f10_local6 = nil
	if Engine.IsMultiplayer() then
		f10_local6 = LUI.UIStyledText.new()
		f10_local6.id = "Quality"
		f10_local6:SetAlpha( 0, 0 )
		f10_local6:SetFontSize( 32 * _1080p )
		f10_local6:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f10_local6:SetAlignment( LUI.Alignment.Left )
		f10_local6:SetOptOutRightToLeftAlignmentFlip( true )
		f10_local6:SetDecodeLetterLength( 20 )
		f10_local6:SetDecodeMaxRandChars( 6 )
		f10_local6:SetDecodeUpdatesPerLetter( 4 )
		f10_local6:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 55, _1080p * -723, _1080p * 59, _1080p * 91 )
		f10_local6:SubscribeToModelThroughElement( self, "weapon.qualityColor", function ()
			local f15_local0 = self:GetDataSource()
			f15_local0 = f15_local0.weapon.qualityColor:GetValue( f10_local1 )
			if f15_local0 ~= nil then
				f10_local6:SetRGBFromInt( f15_local0, 0 )
			end
		end )
		f10_local6:SubscribeToModelThroughElement( self, "weapon.qualityString", function ()
			local f16_local0 = self:GetDataSource()
			f16_local0 = f16_local0.weapon.qualityString:GetValue( f10_local1 )
			if f16_local0 ~= nil then
				f10_local6:setText( ToUpperCase( f16_local0 ), 0 )
			end
		end )
		self:addElement( f10_local6 )
		self.Quality = f10_local6
	end
	local f10_local7 = nil
	if Engine.IsMultiplayer() then
		f10_local7 = MenuBuilder.BuildRegisteredType( "QualityIcon", {
			controllerIndex = f10_local1
		} )
		f10_local7.id = "QualityIcon"
		f10_local7:SetAlpha( 0, 0 )
		f10_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 51, _1080p * 59, _1080p * 92 )
		f10_local7:SubscribeToModelThroughElement( self, "weapon.qualityImage", function ()
			local f17_local0 = self:GetDataSource()
			f17_local0 = f17_local0.weapon.qualityImage:GetValue( f10_local1 )
			if f17_local0 ~= nil then
				f10_local7.IconShadow:setImage( RegisterMaterial( f17_local0 ), 0 )
			end
		end )
		f10_local7:SubscribeToModelThroughElement( self, "weapon.qualityColor", function ()
			local f18_local0 = self:GetDataSource()
			f18_local0 = f18_local0.weapon.qualityColor:GetValue( f10_local1 )
			if f18_local0 ~= nil then
				f10_local7.Icon:SetRGBFromInt( f18_local0, 0 )
			end
		end )
		f10_local7:SubscribeToModelThroughElement( self, "weapon.qualityImage", function ()
			local f19_local0 = self:GetDataSource()
			f19_local0 = f19_local0.weapon.qualityImage:GetValue( f10_local1 )
			if f19_local0 ~= nil then
				f10_local7.Icon:setImage( RegisterMaterial( f19_local0 ), 0 )
			end
		end )
		f10_local7:SubscribeToModelThroughElement( self, "weapon.qualityColor", function ()
			local f20_local0 = self:GetDataSource()
			f20_local0 = f20_local0.weapon.qualityColor:GetValue( f10_local1 )
			if f20_local0 ~= nil then
				f10_local7.IconDuplicate:SetRGBFromInt( f20_local0, 0 )
			end
		end )
		self:addElement( f10_local7 )
		self.QualityIcon = f10_local7
	end
	local f10_local8 = nil
	if not Engine.IsMultiplayer() and CONDITIONS.IsSingleplayer( self ) then
		f10_local8 = LUI.UIImage.new()
		f10_local8.id = "SPStrip"
		f10_local8:SetRGBFromTable( SWATCHES.itemRarity.quality0, 0 )
		f10_local8:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100 )
		self:addElement( f10_local8 )
		self.SPStrip = f10_local8
	end
	local f10_local9 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsMultiplayer( self ) then
		f10_local9 = LUI.UIImage.new()
		f10_local9.id = "MPStrip"
		f10_local9:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100 )
		f10_local9:SubscribeToModelThroughElement( self, "weapon.qualityColor", function ()
			local f21_local0 = self:GetDataSource()
			f21_local0 = f21_local0.weapon.qualityColor:GetValue( f10_local1 )
			if f21_local0 ~= nil then
				f10_local9:SetRGBFromInt( f21_local0, 0 )
			end
		end )
		self:addElement( f10_local9 )
		self.MPStrip = f10_local9
	end
	local f10_local10 = nil
	if Engine.IsAliensMode() and CONDITIONS.IsThirdGameMode( self ) then
		f10_local10 = LUI.UIImage.new()
		f10_local10.id = "CPStrip"
		f10_local10:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100 )
		f10_local10:SubscribeToModelThroughElement( self, "weapon.qualityColor", function ()
			local f22_local0 = self:GetDataSource()
			f22_local0 = f22_local0.weapon.qualityColor:GetValue( f10_local1 )
			if f22_local0 ~= nil then
				f10_local10:SetRGBFromInt( f22_local0, 0 )
			end
		end )
		self:addElement( f10_local10 )
		self.CPStrip = f10_local10
	end
	local f10_local11 = nil
	if not CONDITIONS.IsCoreMultiplayer( self ) then
		f10_local11 = MenuBuilder.BuildRegisteredType( "FireModes", {
			controllerIndex = f10_local1
		} )
		f10_local11.id = "FireModes"
		if not CONDITIONS.IsCoreMultiplayer( self ) then
			f10_local11:SetDataSourceThroughElement( self, "weapon.fireModes" )
		end
		f10_local11:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 375, _1080p * 188, _1080p * 249 )
		self:addElement( f10_local11 )
		self.FireModes = f10_local11
	end
	local UnlockCriteria = nil
	
	UnlockCriteria = MenuBuilder.BuildRegisteredType( "UnlockCriteria", {
		controllerIndex = f10_local1
	} )
	UnlockCriteria.id = "UnlockCriteria"
	UnlockCriteria:SetDataSourceThroughElement( self, "weapon" )
	UnlockCriteria.UnlockDesc:SetRight( _1080p * 340, 0 )
	UnlockCriteria.UnlockDesc:setText( "", 0 )
	UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 438, _1080p * 204, _1080p * 234 )
	self:addElement( UnlockCriteria )
	self.UnlockCriteria = UnlockCriteria
	
	local ShowcaseLock = nil
	
	ShowcaseLock = MenuBuilder.BuildRegisteredType( "ShowcaseLock", {
		controllerIndex = f10_local1
	} )
	ShowcaseLock.id = "ShowcaseLock"
	ShowcaseLock:SetDataSourceThroughElement( self, "weapon" )
	ShowcaseLock:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -245, _1080p * 267, _1080p * 110, _1080p * 622 )
	self:addElement( ShowcaseLock )
	self.ShowcaseLock = ShowcaseLock
	
	local f10_local14 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and not Engine.IsConsoleGame() and not CONDITIONS.IsGamepadEnabled( self ) then
		f10_local14 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f10_local1
		} )
		f10_local14.id = "Confirm"
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and not Engine.IsConsoleGame() and not CONDITIONS.IsGamepadEnabled( self ) then
			
		else
			
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and not Engine.IsConsoleGame() and not CONDITIONS.IsGamepadEnabled( self ) then
			
		else
			
		end
		f10_local14.Text:setText( ToUpperCase( Engine.Localize( "PLATFORM_UI_CONFIRM_RARITY" ) ), 0 )
		f10_local14:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 993.65, _1080p * 1493.65, _1080p * 529.6, _1080p * 559.6 )
		self:addElement( f10_local14 )
		self.Confirm = f10_local14
	end
	local f10_local15 = nil
	if Engine.IsMultiplayer() and CONDITIONS.InFrontend( self ) then
		f10_local15 = LUI.UIImage.new()
		f10_local15.id = "MK2"
		f10_local15:SetAlpha( 0.5, 0 )
		f10_local15:setImage( RegisterMaterial( "mk2_watermark_1" ), 0 )
		f10_local15:SetBlendMode( BLEND_MODE.addWithAlpha )
		f10_local15:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 408, _1080p * 504, _1080p * 52, _1080p * 100 )
		self:addElement( f10_local15 )
		self.MK2 = f10_local15
	end
	local f10_local16 = nil
	if Engine.IsMultiplayer() then
		f10_local16 = MenuBuilder.BuildRegisteredType( "MK2BonusText", {
			controllerIndex = f10_local1
		} )
		f10_local16.id = "MK2BonusText"
		f10_local16:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -386, 0, _1080p * 104, _1080p * 134 )
		f10_local16:SubscribeToModelThroughElement( self, "weapon.qualityColor", function ()
			local f23_local0 = self:GetDataSource()
			f23_local0 = f23_local0.weapon.qualityColor:GetValue( f10_local1 )
			if f23_local0 ~= nil then
				f10_local16.BlurL:SetRGBFromInt( f23_local0, 0 )
			end
		end )
		f10_local16:SubscribeToModelThroughElement( self, "weapon.qualityColor", function ()
			local f24_local0 = self:GetDataSource()
			f24_local0 = f24_local0.weapon.qualityColor:GetValue( f10_local1 )
			if f24_local0 ~= nil then
				f10_local16.BlurR:SetRGBFromInt( f24_local0, 0 )
			end
		end )
		f10_local16:SubscribeToModelThroughElement( self, "weapon.qualityColor", function ()
			local f25_local0 = self:GetDataSource()
			f25_local0 = f25_local0.weapon.qualityColor:GetValue( f10_local1 )
			if f25_local0 ~= nil then
				f10_local16.Gradient:SetRGBFromInt( f25_local0, 0 )
			end
		end )
		self:addElement( f10_local16 )
		self.MK2BonusText = f10_local16
	end
	self._animationSets.DefaultAnimationSet = function ()
		if Engine.IsMultiplayer() and CONDITIONS.InFrontend( self ) then
			f10_local15:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.MK2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 408, _1080p * 504, _1080p * 52, _1080p * 100, 0 )
					end
				}
			} )
		end
		self._sequences.DefaultSequence = function ()
			if Engine.IsMultiplayer() and CONDITIONS.InFrontend( self ) then
				f10_local15:AnimateSequence( "DefaultSequence" )
			end
		end
		
		if Engine.IsMultiplayer() then
			f10_local6:RegisterAnimationSequence( "HideQuality", {
				{
					function ()
						return self.Quality:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f10_local7:RegisterAnimationSequence( "HideQuality", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideQuality = function ()
			if Engine.IsMultiplayer() then
				f10_local6:AnimateSequence( "HideQuality" )
			end
			if Engine.IsMultiplayer() then
				f10_local7:AnimateSequence( "HideQuality" )
			end
		end
		
		if Engine.IsMultiplayer() then
			f10_local6:RegisterAnimationSequence( "ShowQuality", {
				{
					function ()
						return self.Quality:SetAlpha( 0, 0 )
					end,
					function ()
						return self.Quality:SetAlpha( 1, 150 )
					end
				},
				{
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 51, _1080p * 18, _1080p * 59, _1080p * 91, 0 )
					end,
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 55, _1080p * 22, _1080p * 59, _1080p * 91, 150 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f10_local7:RegisterAnimationSequence( "ShowQuality", {
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
				},
				{
					function ()
						return self.QualityIcon:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.ShowQuality = function ()
			if Engine.IsMultiplayer() then
				f10_local6:AnimateSequence( "ShowQuality" )
			end
			if Engine.IsMultiplayer() then
				f10_local7:AnimateSequence( "ShowQuality" )
			end
		end
		
		CACItemHeader:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 323, 0, 0, _1080p * 100, 0 )
				end,
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		if Engine.IsMultiplayer() then
			f10_local5:RegisterAnimationSequence( "MenuOpen", {
				{
					function ()
						return self.Passives:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 873, _1080p * 1489, _1080p * 12, _1080p * 92, 0 )
					end,
					function ()
						return self.Passives:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 1166, _1080p * 12, _1080p * 92, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f10_local6:RegisterAnimationSequence( "MenuOpen", {
				{
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 391, _1080p * -387, _1080p * 59, _1080p * 91, 0 )
					end,
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 56, _1080p * -722, _1080p * 59, _1080p * 91, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f10_local7:RegisterAnimationSequence( "MenuOpen", {
				{
					function ()
						return self.QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 354, _1080p * 386, _1080p * 59, _1080p * 92, 0 )
					end,
					function ()
						return self.QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 51, _1080p * 59, _1080p * 92, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if not Engine.IsMultiplayer() and CONDITIONS.IsSingleplayer( self ) then
			f10_local8:RegisterAnimationSequence( "MenuOpen", {
				{
					function ()
						return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 323, _1080p * 334, 0, _1080p * 100, 0 )
					end,
					function ()
						return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsMultiplayer( self ) then
			f10_local9:RegisterAnimationSequence( "MenuOpen", {
				{
					function ()
						return self.MPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 323, _1080p * 334, 0, _1080p * 100, 0 )
					end,
					function ()
						return self.MPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsAliensMode() and CONDITIONS.IsThirdGameMode( self ) then
			f10_local10:RegisterAnimationSequence( "MenuOpen", {
				{
					function ()
						return self.CPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 323, _1080p * 334, 0, _1080p * 100, 0 )
					end,
					function ()
						return self.CPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if not CONDITIONS.IsCoreMultiplayer( self ) then
			f10_local11:RegisterAnimationSequence( "MenuOpen", {
				{
					function ()
						return self.FireModes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 323, _1080p * 698, _1080p * 188, _1080p * 249, 0 )
					end,
					function ()
						return self.FireModes:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 375, _1080p * 188, _1080p * 249, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		self._sequences.MenuOpen = function ()
			CACItemHeader:AnimateSequence( "MenuOpen" )
			if Engine.IsMultiplayer() then
				f10_local5:AnimateSequence( "MenuOpen" )
			end
			if Engine.IsMultiplayer() then
				f10_local6:AnimateSequence( "MenuOpen" )
			end
			if Engine.IsMultiplayer() then
				f10_local7:AnimateSequence( "MenuOpen" )
			end
			if not Engine.IsMultiplayer() and CONDITIONS.IsSingleplayer( self ) then
				f10_local8:AnimateSequence( "MenuOpen" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsMultiplayer( self ) then
				f10_local9:AnimateSequence( "MenuOpen" )
			end
			if Engine.IsAliensMode() and CONDITIONS.IsThirdGameMode( self ) then
				f10_local10:AnimateSequence( "MenuOpen" )
			end
			if not CONDITIONS.IsCoreMultiplayer( self ) then
				f10_local11:AnimateSequence( "MenuOpen" )
			end
		end
		
		UnlockCriteria:RegisterAnimationSequence( "HideCriteria", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideCriteria = function ()
			UnlockCriteria:AnimateSequence( "HideCriteria" )
		end
		
		UnlockCriteria:RegisterAnimationSequence( "ShowCriteria", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowCriteria = function ()
			UnlockCriteria:AnimateSequence( "ShowCriteria" )
		end
		
	end
	
	self._animationSets.CP = function ()
		if not CONDITIONS.IsCoreMultiplayer( self ) then
			f10_local11:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.FireModes:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 375, _1080p * 159.5, _1080p * 220.5, 0 )
					end
				}
			} )
		end
		UnlockCriteria:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 444, _1080p * 623, _1080p * 653, 0 )
				end
			}
		} )
		if Engine.IsMultiplayer() and CONDITIONS.InFrontend( self ) then
			f10_local15:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.MK2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 69, _1080p * 75, _1080p * 100, 0 )
					end
				}
			} )
		end
		self._sequences.DefaultSequence = function ()
			if not CONDITIONS.IsCoreMultiplayer( self ) then
				f10_local11:AnimateSequence( "DefaultSequence" )
			end
			UnlockCriteria:AnimateSequence( "DefaultSequence" )
			if Engine.IsMultiplayer() and CONDITIONS.InFrontend( self ) then
				f10_local15:AnimateSequence( "DefaultSequence" )
			end
		end
		
		self._sequences.HideQuality = function ()
			
		end
		
		if Engine.IsMultiplayer() then
			f10_local6:RegisterAnimationSequence( "ShowQuality", {
				{
					function ()
						return self.Quality:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f10_local7:RegisterAnimationSequence( "ShowQuality", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.ShowQuality = function ()
			if Engine.IsMultiplayer() then
				f10_local6:AnimateSequence( "ShowQuality" )
			end
			if Engine.IsMultiplayer() then
				f10_local7:AnimateSequence( "ShowQuality" )
			end
		end
		
		self._sequences.HideCriteria = function ()
			
		end
		
		self._sequences.ShowCriteria = function ()
			
		end
		
		CACItemHeader:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 323, 0, 0, _1080p * 100, 0 )
				end,
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -323, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		if Engine.IsMultiplayer() then
			f10_local5:RegisterAnimationSequence( "MenuOpen", {
				{
					function ()
						return self.Passives:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 964, _1080p * 1580, _1080p * 18, _1080p * 82, 0 )
					end,
					function ()
						return self.Passives:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 641, _1080p * 1257, _1080p * 18, _1080p * 82, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f10_local6:RegisterAnimationSequence( "MenuOpen", {
				{
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 391, _1080p * -387, _1080p * 59, _1080p * 91, 0 )
					end,
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 68, _1080p * -710, _1080p * 59, _1080p * 91, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f10_local7:RegisterAnimationSequence( "MenuOpen", {
				{
					function ()
						return self.QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 354, _1080p * 386, _1080p * 59, _1080p * 92, 0 )
					end,
					function ()
						return self.QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 31, _1080p * 63, _1080p * 59, _1080p * 92, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if not Engine.IsMultiplayer() and CONDITIONS.IsSingleplayer( self ) then
			f10_local8:RegisterAnimationSequence( "MenuOpen", {
				{
					function ()
						return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 323, _1080p * 334, 0, _1080p * 100, 0 )
					end,
					function ()
						return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsMultiplayer( self ) then
			f10_local9:RegisterAnimationSequence( "MenuOpen", {
				{
					function ()
						return self.MPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 323, _1080p * 334, 0, _1080p * 100, 0 )
					end,
					function ()
						return self.MPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsAliensMode() and CONDITIONS.IsThirdGameMode( self ) then
			f10_local10:RegisterAnimationSequence( "MenuOpen", {
				{
					function ()
						return self.CPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 323, _1080p * 334, 0, _1080p * 100, 0 )
					end,
					function ()
						return self.CPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		self._sequences.MenuOpen = function ()
			CACItemHeader:AnimateSequence( "MenuOpen" )
			if Engine.IsMultiplayer() then
				f10_local5:AnimateSequence( "MenuOpen" )
			end
			if Engine.IsMultiplayer() then
				f10_local6:AnimateSequence( "MenuOpen" )
			end
			if Engine.IsMultiplayer() then
				f10_local7:AnimateSequence( "MenuOpen" )
			end
			if not Engine.IsMultiplayer() and CONDITIONS.IsSingleplayer( self ) then
				f10_local8:AnimateSequence( "MenuOpen" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsMultiplayer( self ) then
				f10_local9:AnimateSequence( "MenuOpen" )
			end
			if Engine.IsAliensMode() and CONDITIONS.IsThirdGameMode( self ) then
				f10_local10:AnimateSequence( "MenuOpen" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if Engine.IsMultiplayer() then
		f10_local7:SubscribeToModelThroughElement( self, "weapon.quality", function ()
			local f88_local0 = self:GetDataSource()
			if f88_local0.weapon.quality:GetValue( f10_local1 ) ~= nil then
				f88_local0 = self:GetDataSource()
				if f88_local0.weapon.quality:GetValue( f10_local1 ) == 0 then
					ACTIONS.AnimateSequence( self, "HideQuality" )
				end
			end
			f88_local0 = self:GetDataSource()
			if f88_local0.weapon.quality:GetValue( f10_local1 ) ~= nil then
				f88_local0 = self:GetDataSource()
				if f88_local0.weapon.quality:GetValue( f10_local1 ) ~= 0 then
					ACTIONS.AnimateSequence( self, "ShowQuality" )
				end
			end
		end )
	end
	if Engine.IsMultiplayer() then
		f10_local5:SetDataSourceThroughElement( self, "weapon.passives" )
	end
	if not CONDITIONS.IsCoreMultiplayer( self ) then
		f10_local11:SetDataSourceThroughElement( self, "weapon.fireModes" )
	end
	UnlockCriteria:SetDataSourceThroughElement( self, "weapon" )
	ShowcaseLock:SetDataSourceThroughElement( self, "weapon" )
	PostLoadFunc( self, f10_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	ACTIONS.AnimateSequence( self, "MenuOpen" )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "CP" )
	end
	return self
end

MenuBuilder.registerType( "WeaponDetails", WeaponDetails )
LockTable( _M )
