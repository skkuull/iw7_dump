local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if Engine.IsMultiplayer() then
		f1_arg0.MK2Pattern:processEvent( {
			name = "mk2_wide_pattern"
		} )
		f1_arg0.CACItemHeader:SubscribeToModelThroughElement( f1_arg0, "qualityColor", function ()
			local f2_local0 = f1_arg0:GetDataSource()
			f2_local0 = f2_local0.qualityColor:GetValue( f1_arg1 )
			if f2_local0 ~= nil then
				f1_arg0.CACItemHeader.Background:SetRGBFromInt( f2_local0, 0 )
			end
		end )
		local f1_local0 = function ()
			local f3_local0 = f1_arg0.WeaponLevelInfo:GetDataSource()
			local f3_local1 = f3_local0.alpha:GetValue( f1_arg1 )
			local f3_local2 = f1_arg0:GetDataSource()
			f3_local2 = f3_local2.weaponRef:GetValue( f1_arg1 )
			if f3_local2 ~= nil then
				f1_arg0.WeaponLevelInfo:SetAlpha( f3_local1 or 1, 0 )
				f3_local0.weaponRef:SetValue( f1_arg1, f3_local2 )
			else
				f1_arg0.WeaponLevelInfo:SetAlpha( 0, 0 )
			end
		end
		
		if f1_arg0.WeaponLevelInfo then
			f1_arg0.WeaponLevelInfo:SubscribeToModelThroughElement( f1_arg0, "name", f1_local0 )
		end
		local f1_local1 = function ()
			local f4_local0 = f1_arg0:GetDataSource()
			if f4_local0.weaponRef:GetValue( f1_arg1 ) ~= nil then
				f1_arg0.FireModes:SetAlpha( 1, 0 )
			else
				f1_arg0.FireModes:SetAlpha( 0, 0 )
			end
		end
		
		if f1_arg0.FireModes then
			f1_arg0.FireModes:SubscribeToModelThroughElement( f1_arg0, "name", f1_local1 )
		end
		f1_arg0.UnlockCriteria:SubscribeToModelThroughElement( f1_arg0, "name", function ()
			local f5_local0 = f1_arg0:GetDataSource()
			local f5_local1 = f5_local0.weaponRef:GetValue( f1_arg1 )
			local f5_local2 = f1_arg0:GetDataSource()
			f5_local2 = f5_local2.ref:GetValue( f1_arg1 )
			local f5_local3 = f1_arg0.ShowcaseLock
			if f5_local1 == nil and f5_local2 ~= Cac.overkillRef then
				local f5_local4 = f1_arg0:GetDataSource()
				f5_local4 = f5_local4.slotLocked:GetValue( f1_arg1 )
				local f5_local5 = f1_arg0:GetDataSource()
				if f5_local4 == true or CONDITIONS.UseLoadoutRestrictions() and f5_local5.esportsLocked then
					f1_arg0.UnlockCriteria.UnlockDesc:setText( GetPick10UnlockText( f5_local2 ), 0 )
					f1_arg0.UnlockCriteria:SetAlpha( 1, 0 )
					ACTIONS.AnimateSequence( f5_local3, "ShowCriteria" )
				else
					f1_arg0.UnlockCriteria:SetAlpha( 0, 0 )
					ACTIONS.AnimateSequence( f5_local3, "HideCriteria" )
				end
			else
				f1_arg0.UnlockCriteria:SetAlpha( 0, 0 )
				ACTIONS.AnimateSequence( f5_local3, "HideCriteria" )
			end
		end )
		f1_arg0.CACItemHeader:SubscribeToModelThroughElement( f1_arg0, "desc", function ()
			local f6_local0 = f1_arg0:GetDataSource()
			f6_local0 = f6_local0.desc:GetValue( f1_arg1 )
			if f6_local0 ~= nil then
				Cac.PositionUnlockCriteria( f6_local0, f1_arg0.CACItemHeader.ItemDescription, f1_arg0.UnlockCriteria )
			end
		end )
		f1_arg0.QualityIcon:SubscribeToModelThroughElement( f1_arg0, "isMk2", function ()
			local f7_local0 = f1_arg0:GetDataSource()
			f7_local0 = f7_local0.isMk2:GetValue( f1_arg1 )
			local f7_local1 = f1_arg0:GetDataSource()
			f7_local1 = f7_local1.qualityImage:GetValue( f1_arg1 )
			if f7_local1 ~= nil then
				f1_arg0.QualityIcon.IconDuplicate:setImage( RegisterMaterial( f7_local1 .. "_mk2" ), 0 )
			end
			if f7_local0 then
				f1_arg0.MK2:SetAlpha( 0.5, 0 )
				f1_arg0.MK2Pattern:SetAlpha( 1, 0 )
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "MK2BonusText",
					sequenceName = "MK2On",
					elementPath = "MK2BonusText"
				} )
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "QualityIcon",
					sequenceName = "LegendaryPulse",
					elementPath = "QualityIcon"
				} )
			else
				f1_arg0.QualityIcon.IconDuplicate:SetAlpha( 0, 0 )
				f1_arg0.MK2:SetAlpha( 0, 0 )
				f1_arg0.MK2Pattern:SetAlpha( 0, 0 )
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "MK2BonusText",
					sequenceName = "MK2Off",
					elementPath = "MK2BonusText"
				} )
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "QualityIcon",
					sequenceName = "StopPulse",
					elementPath = "QualityIcon"
				} )
			end
			local f7_local2 = f1_arg0:GetDataSource()
			f7_local2 = f7_local2.weaponRef:GetValue( f1_arg1 )
			if f7_local2 then
				local f7_local3 = Cac.GetWeaponMk2BonusString( f1_arg1, f7_local2 )
				assert( f1_arg0.MK2BonusText )
				assert( f1_arg0.MK2BonusText.BonusText )
				f1_arg0.MK2BonusText.BonusText:setText( f7_local3 )
			end
		end )
	end
	if Engine.IsSingleplayer() then
		f1_arg0.UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 7, _1080p * 445, _1080p * 306, _1080p * 336, 0 )
	end
	local f1_local2 = function ( f8_arg0 )
		if f8_arg0 ~= nil then
			return Engine.TableLookup( CSV.perks.file, CSV.perks.cols.fullImage, f8_arg0, CSV.perks.cols.ref )
		else
			return ""
		end
	end
	
	local f1_local0 = function ( f9_arg0 )
		if f9_arg0 ~= nil then
			return Engine.TableLookup( CSV.jackalDecals.file, CSV.jackalDecals.cols.fullImage, f9_arg0, CSV.jackalDecals.cols.ref )
		else
			return ""
		end
	end
	
	local f1_local1 = function ( f10_arg0 )
		if f10_arg0 ~= nil then
			return Engine.TableLookup( CSV.SPWeapons.file, CSV.SPWeapons.cols.fullImage, f10_arg0, CSV.SPWeapons.cols.ref )
		else
			return ""
		end
	end
	
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "fullImage", function ()
		local f11_local0 = f1_arg0:GetDataSource()
		ACTIONS.AnimateSequence( f1_arg0, "HidePerkChip" )
		ACTIONS.AnimateSequence( f1_arg0, "HideJackalBase" )
		if Engine.IsMultiplayer() then
			local f11_local1 = f11_local0.weaponRef:GetValue( f1_arg1 )
			local f11_local2 = f11_local0.fullImage:GetValue( f1_arg1 )
			if f11_local1 == nil and f11_local2 ~= nil then
				ACTIONS.AnimateSequence( f1_arg0, "UpdateImage" )
				local f11_local3 = f1_local2( f11_local2 )
				if f11_local3 ~= "" then
					if f11_local3 ~= Cac.perkNoneValue then
						ACTIONS.AnimateSequence( f1_arg0, "ShowPerkChip" )
						ACTIONS.AnimateSequence( f1_arg0, "UpdatePerkChip" )
					else
						ACTIONS.AnimateSequence( f1_arg0, "ImageHidden" )
					end
				end
			end
		elseif Engine.IsSingleplayer() then
			local f11_local1 = f11_local0.fullImage:GetValue( f1_arg1 )
			local f11_local2 = f1_local1( f11_local1 )
			if f11_local2 == nil or f11_local2 == "" then
				local f11_local3 = f1_local0( f11_local1 )
				local f11_local4 = f11_local0.fullImage:GetValue( f1_arg1 )
				if f11_local3 ~= "" and f11_local4 ~= "specialty_ks_null" then
					if f11_local3 ~= Cac.jackalEquipNone then
						ACTIONS.AnimateSequence( f1_arg0, "UpdateImage" )
						ACTIONS.AnimateSequence( f1_arg0, "ShowJackalBase" )
					else
						ACTIONS.AnimateSequence( f1_arg0, "ImageHidden" )
					end
				elseif f11_local4 ~= "specialty_ks_null" then
					ACTIONS.AnimateSequence( f1_arg0, "UpdateImage" )
				else
					ACTIONS.AnimateSequence( f1_arg0, "ImageHidden" )
				end
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "CACItemHeader",
					sequenceName = "HideEnergy",
					elementPath = "CACItemHeader"
				} )
			elseif Cac.GetIsEnergyWeapon( f11_local2 ) then
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "CACItemHeader",
					sequenceName = "ShowEnergy",
					elementPath = "CACItemHeader"
				} )
			else
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "CACItemHeader",
					sequenceName = "HideEnergy",
					elementPath = "CACItemHeader"
				} )
			end
		end
	end )
end

function LoadoutSelectHeader( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1184 * _1080p, 0, 750 * _1080p )
	self.id = "LoadoutSelectHeader"
	self._animationSets = {}
	self._sequences = {}
	local f12_local1 = controller and controller.controllerIndex
	if not f12_local1 and not Engine.InFrontend() then
		f12_local1 = self:getRootController()
	end
	assert( f12_local1 )
	local f12_local2 = self
	local f12_local3 = nil
	if not CONDITIONS.IsSingleplayer( self ) then
		f12_local3 = LUI.UIImage.new()
		f12_local3.id = "Darkener"
		f12_local3:SetRGBFromInt( 0, 0 )
		f12_local3:SetAlpha( 0.5, 0 )
		f12_local3:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -110, _1080p * -1 )
		self:addElement( f12_local3 )
		self.Darkener = f12_local3
	end
	local CACItemHeader = nil
	
	CACItemHeader = MenuBuilder.BuildRegisteredType( "CACItemHeader", {
		controllerIndex = f12_local1
	} )
	CACItemHeader.id = "CACItemHeader"
	CACItemHeader.Background:SetRGBFromTable( SWATCHES.itemRarity.qualityBase, 0 )
	CACItemHeader.ItemDescription:SetRight( _1080p * 750, 0 )
	CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100 )
	CACItemHeader:SubscribeToModelThroughElement( self, "desc", function ()
		local f13_local0 = self:GetDataSource()
		f13_local0 = f13_local0.desc:GetValue( f12_local1 )
		if f13_local0 ~= nil then
			CACItemHeader.ItemDescription:setText( f13_local0, 0 )
		end
	end )
	CACItemHeader:SubscribeToModelThroughElement( self, "name", function ()
		local f14_local0 = self:GetDataSource()
		f14_local0 = f14_local0.name:GetValue( f12_local1 )
		if f14_local0 ~= nil then
			CACItemHeader.ItemName:setText( f14_local0, 0 )
		end
	end )
	self:addElement( CACItemHeader )
	self.CACItemHeader = CACItemHeader
	
	local f12_local5 = nil
	if Engine.IsMultiplayer() then
		f12_local5 = MenuBuilder.BuildRegisteredType( "MK2Pattern", {
			controllerIndex = f12_local1
		} )
		f12_local5.id = "MK2Pattern"
		f12_local5:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100 )
		f12_local5:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f15_local0 = self:GetDataSource()
			f15_local0 = f15_local0.qualityColor:GetValue( f12_local1 )
			if f15_local0 ~= nil then
				f12_local5:SetRGBFromInt( f15_local0, 0 )
			end
		end )
		self:addElement( f12_local5 )
		self.MK2Pattern = f12_local5
	end
	local f12_local6 = nil
	if not Engine.IsMultiplayer() then
		f12_local6 = LUI.UIImage.new()
		f12_local6.id = "JackalShowcaseBacking"
		f12_local6:SetDotPitchEnabled( true )
		f12_local6:SetDotPitchX( 0, 0 )
		f12_local6:SetDotPitchY( 0, 0 )
		f12_local6:SetDotPitchContrast( 0, 0 )
		f12_local6:SetDotPitchMode( 0 )
		f12_local6:setImage( RegisterMaterial( "icon_jackal_livery_base" ), 0 )
		f12_local6:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -512, _1080p * 512, _1080p * 130, _1080p * 642 )
		self:addElement( f12_local6 )
		self.JackalShowcaseBacking = f12_local6
	end
	local f12_local7 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f12_local7 = LUI.UIImage.new()
		f12_local7.id = "PerkShowcaseBacking"
		f12_local7:SetDotPitchEnabled( true )
		f12_local7:SetDotPitchX( 0, 0 )
		f12_local7:SetDotPitchY( 0, 0 )
		f12_local7:SetDotPitchContrast( 0, 0 )
		f12_local7:SetDotPitchMode( 0 )
		f12_local7:setImage( RegisterMaterial( "icon_perk_showcase_chip_backing" ), 0 )
		f12_local7:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 136, _1080p * 648 )
		self:addElement( f12_local7 )
		self.PerkShowcaseBacking = f12_local7
	end
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetDotPitchEnabled( true )
	Image:SetDotPitchX( 0, 0 )
	Image:SetDotPitchY( 0, 0 )
	Image:SetDotPitchContrast( 0, 0 )
	Image:SetDotPitchMode( 0 )
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 200, _1080p * 456 )
	Image:SubscribeToModelThroughElement( self, "fullImage", function ()
		local f16_local0 = self:GetDataSource()
		f16_local0 = f16_local0.fullImage:GetValue( f12_local1 )
		if f16_local0 ~= nil then
			Image:setImage( RegisterMaterial( f16_local0 ), 0 )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local f12_local9 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f12_local9 = LUI.UIStyledText.new()
		f12_local9.id = "Quality"
		f12_local9:SetFontSize( 32 * _1080p )
		f12_local9:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f12_local9:SetAlignment( LUI.Alignment.Left )
		f12_local9:SetOptOutRightToLeftAlignmentFlip( true )
		f12_local9:SetDecodeLetterLength( 20 )
		f12_local9:SetDecodeMaxRandChars( 6 )
		f12_local9:SetDecodeUpdatesPerLetter( 4 )
		f12_local9:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 56, _1080p * 23, _1080p * 59, _1080p * 91 )
		f12_local9:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f17_local0 = self:GetDataSource()
			f17_local0 = f17_local0.qualityColor:GetValue( f12_local1 )
			if f17_local0 ~= nil then
				f12_local9:SetRGBFromInt( f17_local0, 0 )
			end
		end )
		f12_local9:SubscribeToModelThroughElement( self, "qualityString", function ()
			local f18_local0 = self:GetDataSource()
			f18_local0 = f18_local0.qualityString:GetValue( f12_local1 )
			if f18_local0 ~= nil then
				f12_local9:setText( ToUpperCase( f18_local0 ), 0 )
			end
		end )
		self:addElement( f12_local9 )
		self.Quality = f12_local9
	end
	local f12_local10 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f12_local10 = MenuBuilder.BuildRegisteredType( "QualityIcon", {
			controllerIndex = f12_local1
		} )
		f12_local10.id = "QualityIcon"
		f12_local10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 51, _1080p * 59, _1080p * 91 )
		f12_local10:SubscribeToModelThroughElement( self, "qualityImage", function ()
			local f19_local0 = self:GetDataSource()
			f19_local0 = f19_local0.qualityImage:GetValue( f12_local1 )
			if f19_local0 ~= nil then
				f12_local10.IconShadow:setImage( RegisterMaterial( f19_local0 ), 0 )
			end
		end )
		f12_local10:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f20_local0 = self:GetDataSource()
			f20_local0 = f20_local0.qualityColor:GetValue( f12_local1 )
			if f20_local0 ~= nil then
				f12_local10.Icon:SetRGBFromInt( f20_local0, 0 )
			end
		end )
		f12_local10:SubscribeToModelThroughElement( self, "qualityImage", function ()
			local f21_local0 = self:GetDataSource()
			f21_local0 = f21_local0.qualityImage:GetValue( f12_local1 )
			if f21_local0 ~= nil then
				f12_local10.Icon:setImage( RegisterMaterial( f21_local0 ), 0 )
			end
		end )
		f12_local10:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f22_local0 = self:GetDataSource()
			f22_local0 = f22_local0.qualityColor:GetValue( f12_local1 )
			if f22_local0 ~= nil then
				f12_local10.IconDuplicate:SetRGBFromInt( f22_local0, 0 )
			end
		end )
		self:addElement( f12_local10 )
		self.QualityIcon = f12_local10
	end
	local f12_local11 = nil
	if not Engine.IsMultiplayer() then
		f12_local11 = LUI.UIImage.new()
		f12_local11.id = "SPStrip"
		f12_local11:SetRGBFromTable( SWATCHES.itemRarity.quality0, 0 )
		f12_local11:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100 )
		self:addElement( f12_local11 )
		self.SPStrip = f12_local11
	end
	local f12_local12 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
		f12_local12 = LUI.UIImage.new()
		f12_local12.id = "MPStrip"
		f12_local12:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100 )
		f12_local12:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f23_local0 = self:GetDataSource()
			f23_local0 = f23_local0.qualityColor:GetValue( f12_local1 )
			if f23_local0 ~= nil then
				f12_local12:SetRGBFromInt( f23_local0, 0 )
			end
		end )
		self:addElement( f12_local12 )
		self.MPStrip = f12_local12
	end
	local f12_local13 = nil
	if Engine.IsMultiplayer() then
		f12_local13 = MenuBuilder.BuildRegisteredType( "Passives", {
			controllerIndex = f12_local1
		} )
		f12_local13.id = "Passives"
		if Engine.IsMultiplayer() then
			f12_local13:SetDataSourceThroughElement( self, "passives" )
		end
		f12_local13.Grid:SetLeft( _1080p * 0, 0 )
		f12_local13:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 1166, _1080p * 12, _1080p * 92 )
		self:addElement( f12_local13 )
		self.Passives = f12_local13
	end
	local f12_local14 = nil
	if Engine.IsMultiplayer() and CONDITIONS.IsPublicMatch( self ) then
		f12_local14 = MenuBuilder.BuildRegisteredType( "LevelInfo", {
			controllerIndex = f12_local1
		} )
		f12_local14.id = "WeaponLevelInfo"
		f12_local14:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -396, _1080p * -96, _1080p * -98.5, _1080p * -12.5 )
		self:addElement( f12_local14 )
		self.WeaponLevelInfo = f12_local14
	end
	local UnlockCriteria = nil
	
	UnlockCriteria = MenuBuilder.BuildRegisteredType( "UnlockCriteria", {
		controllerIndex = f12_local1
	} )
	UnlockCriteria.id = "UnlockCriteria"
	UnlockCriteria.UnlockDesc:SetRight( _1080p * 340, 0 )
	UnlockCriteria.UnlockDesc:setText( "", 0 )
	UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 438, _1080p * 200, _1080p * 230 )
	self:addElement( UnlockCriteria )
	self.UnlockCriteria = UnlockCriteria
	
	local FireModes = nil
	
	FireModes = MenuBuilder.BuildRegisteredType( "FireModes", {
		controllerIndex = f12_local1
	} )
	FireModes.id = "FireModes"
	FireModes:SetDataSourceThroughElement( self, "fireModes" )
	FireModes:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 375, _1080p * 188, _1080p * 227 )
	self:addElement( FireModes )
	self.FireModes = FireModes
	
	local f12_local17 = nil
	if not Engine.IsMultiplayer() and not Engine.InFrontend() then
		f12_local17 = LUI.UIStyledText.new()
		f12_local17.id = "UpgradeState"
		f12_local17:SetRGBFromInt( 10921638, 0 )
		f12_local17:setText( "", 0 )
		f12_local17:SetFontSize( 32 * _1080p )
		f12_local17:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f12_local17:SetAlignment( LUI.Alignment.Left )
		f12_local17:SetOptOutRightToLeftAlignmentFlip( true )
		f12_local17:SetDecodeLetterLength( 20 )
		f12_local17:SetDecodeMaxRandChars( 6 )
		f12_local17:SetDecodeUpdatesPerLetter( 4 )
		f12_local17:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 19, _1080p * -14, _1080p * 59, _1080p * 91 )
		self:addElement( f12_local17 )
		self.UpgradeState = f12_local17
	end
	local ShowcaseLock = nil
	
	ShowcaseLock = MenuBuilder.BuildRegisteredType( "ShowcaseLock", {
		controllerIndex = f12_local1
	} )
	ShowcaseLock.id = "ShowcaseLock"
	ShowcaseLock:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 130, _1080p * 642 )
	self:addElement( ShowcaseLock )
	self.ShowcaseLock = ShowcaseLock
	
	local f12_local19 = nil
	if Engine.IsMultiplayer() then
		f12_local19 = LUI.UIImage.new()
		f12_local19.id = "MK2"
		f12_local19:SetAlpha( 0.5, 0 )
		f12_local19:setImage( RegisterMaterial( "mk2_watermark_1" ), 0 )
		f12_local19:SetBlendMode( BLEND_MODE.addWithAlpha )
		f12_local19:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 406, _1080p * 502, _1080p * 52, _1080p * 100 )
		self:addElement( f12_local19 )
		self.MK2 = f12_local19
	end
	local f12_local20 = nil
	if Engine.IsMultiplayer() then
		f12_local20 = MenuBuilder.BuildRegisteredType( "MK2BonusText", {
			controllerIndex = f12_local1
		} )
		f12_local20.id = "MK2BonusText"
		f12_local20:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -386, 0, _1080p * 104, _1080p * 134 )
		f12_local20:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f24_local0 = self:GetDataSource()
			f24_local0 = f24_local0.qualityColor:GetValue( f12_local1 )
			if f24_local0 ~= nil then
				f12_local20.BlurL:SetRGBFromInt( f24_local0, 0 )
			end
		end )
		f12_local20:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f25_local0 = self:GetDataSource()
			f25_local0 = f25_local0.qualityColor:GetValue( f12_local1 )
			if f25_local0 ~= nil then
				f12_local20.BlurR:SetRGBFromInt( f25_local0, 0 )
			end
		end )
		f12_local20:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f26_local0 = self:GetDataSource()
			f26_local0 = f26_local0.qualityColor:GetValue( f12_local1 )
			if f26_local0 ~= nil then
				f12_local20.Gradient:SetRGBFromInt( f26_local0, 0 )
			end
		end )
		self:addElement( f12_local20 )
		self.MK2BonusText = f12_local20
	end
	self._animationSets.DefaultAnimationSet = function ()
		UnlockCriteria:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			UnlockCriteria:AnimateSequence( "DefaultSequence" )
		end
		
		CACItemHeader:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.CACItemHeader:SetAlpha( 0, 0 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.Image:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hidden = function ()
			CACItemHeader:AnimateSequence( "Hidden" )
			Image:AnimateSequence( "Hidden" )
		end
		
		CACItemHeader:RegisterAnimationSequence( "Visible", {
			{
				function ()
					return self.CACItemHeader:SetAlpha( 1, 0 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "Visible", {
			{
				function ()
					return self.Image:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Visible = function ()
			CACItemHeader:AnimateSequence( "Visible" )
			Image:AnimateSequence( "Visible" )
		end
		
		Image:RegisterAnimationSequence( "RatioStandard", {
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -192, _1080p * 192, _1080p * 200, _1080p * 584, 0 )
				end
			}
		} )
		self._sequences.RatioStandard = function ()
			Image:AnimateSequence( "RatioStandard" )
		end
		
		Image:RegisterAnimationSequence( "RatioWide", {
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -384, _1080p * 384, _1080p * 200, _1080p * 584, 0 )
				end
			}
		} )
		self._sequences.RatioWide = function ()
			Image:AnimateSequence( "RatioWide" )
		end
		
		Image:RegisterAnimationSequence( "RatioLarge", {
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 130, _1080p * 642, 0 )
				end
			}
		} )
		self._sequences.RatioLarge = function ()
			Image:AnimateSequence( "RatioLarge" )
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f12_local9:RegisterAnimationSequence( "ShowQuality", {
				{
					function ()
						return self.Quality:SetAlpha( 0, 0 )
					end,
					function ()
						return self.Quality:SetAlpha( 1, 150, LUI.EASING.outSine )
					end
				},
				{
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 51, _1080p * 18, _1080p * 59, _1080p * 91, 0 )
					end,
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 55, _1080p * 22, _1080p * 59, _1080p * 91, 150, LUI.EASING.outSine )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f12_local10:RegisterAnimationSequence( "ShowQuality", {
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
						return self.QualityIcon:SetScale( 0, 150, LUI.EASING.outSine )
					end
				}
			} )
		end
		self._sequences.ShowQuality = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f12_local9:AnimateSequence( "ShowQuality" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f12_local10:AnimateSequence( "ShowQuality" )
			end
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f12_local9:RegisterAnimationSequence( "HideQuality", {
				{
					function ()
						return self.Quality:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f12_local10:RegisterAnimationSequence( "HideQuality", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideQuality = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f12_local9:AnimateSequence( "HideQuality" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f12_local10:AnimateSequence( "HideQuality" )
			end
		end
		
		if not CONDITIONS.IsSingleplayer( self ) then
			f12_local3:RegisterAnimationSequence( "FromWeaponSelect", {
				{
					function ()
						return self.Darkener:SetAlpha( 0.5, 0 )
					end
				}
			} )
		end
		CACItemHeader:RegisterAnimationSequence( "FromWeaponSelect", {
			{
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -321, 0, 0, _1080p * 100, 0 )
				end,
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f12_local9:RegisterAnimationSequence( "FromWeaponSelect", {
				{
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -265, _1080p * -298, _1080p * 59, _1080p * 91, 0 )
					end,
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 56, _1080p * 23, _1080p * 59, _1080p * 91, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f12_local10:RegisterAnimationSequence( "FromWeaponSelect", {
				{
					function ()
						return self.QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -302, _1080p * -270, _1080p * 59, _1080p * 91, 0 )
					end,
					function ()
						return self.QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 51, _1080p * 59, _1080p * 91, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if not Engine.IsMultiplayer() then
			f12_local11:RegisterAnimationSequence( "FromWeaponSelect", {
				{
					function ()
						return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -321, _1080p * -310, 0, _1080p * 100, 0 )
					end,
					function ()
						return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
			f12_local12:RegisterAnimationSequence( "FromWeaponSelect", {
				{
					function ()
						return self.MPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -321, _1080p * -310, 0, _1080p * 100, 0 )
					end,
					function ()
						return self.MPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f12_local13:RegisterAnimationSequence( "FromWeaponSelect", {
				{
					function ()
						return self.Passives:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 229, _1080p * 845, _1080p * 11, _1080p * 91, 0 )
					end,
					function ()
						return self.Passives:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 1166, _1080p * 12, _1080p * 92, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		self._sequences.FromWeaponSelect = function ()
			if not CONDITIONS.IsSingleplayer( self ) then
				f12_local3:AnimateSequence( "FromWeaponSelect" )
			end
			CACItemHeader:AnimateSequence( "FromWeaponSelect" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f12_local9:AnimateSequence( "FromWeaponSelect" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f12_local10:AnimateSequence( "FromWeaponSelect" )
			end
			if not Engine.IsMultiplayer() then
				f12_local11:AnimateSequence( "FromWeaponSelect" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
				f12_local12:AnimateSequence( "FromWeaponSelect" )
			end
			if Engine.IsMultiplayer() then
				f12_local13:AnimateSequence( "FromWeaponSelect" )
			end
		end
		
		CACItemHeader:RegisterAnimationSequence( "FromPowerSelect", {
			{
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -321, 0, 0, _1080p * 100, 0 )
				end,
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		Image:RegisterAnimationSequence( "FromPowerSelect", {
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -427, _1080p * 85, _1080p * 130, _1080p * 642, 0 )
				end,
				function ()
					return self.Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 130, _1080p * 642, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f12_local9:RegisterAnimationSequence( "FromPowerSelect", {
				{
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -265, _1080p * -298, _1080p * 59, _1080p * 91, 0 )
					end,
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 56, _1080p * 23, _1080p * 59, _1080p * 91, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f12_local10:RegisterAnimationSequence( "FromPowerSelect", {
				{
					function ()
						return self.QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -302, _1080p * -270, _1080p * 59, _1080p * 91, 0 )
					end,
					function ()
						return self.QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 51, _1080p * 59, _1080p * 91, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if not Engine.IsMultiplayer() then
			f12_local11:RegisterAnimationSequence( "FromPowerSelect", {
				{
					function ()
						return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -321, _1080p * -310, 0, _1080p * 100, 0 )
					end,
					function ()
						return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
			f12_local12:RegisterAnimationSequence( "FromPowerSelect", {
				{
					function ()
						return self.MPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -321, _1080p * -310, 0, _1080p * 100, 0 )
					end,
					function ()
						return self.MPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if not Engine.IsMultiplayer() and not Engine.InFrontend() then
			f12_local17:RegisterAnimationSequence( "FromPowerSelect", {
				{
					function ()
						return self.UpgradeState:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -302, _1080p * -335, _1080p * 59, _1080p * 91, 0 )
					end,
					function ()
						return self.UpgradeState:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 19, _1080p * -14, _1080p * 59, _1080p * 91, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		self._sequences.FromPowerSelect = function ()
			CACItemHeader:AnimateSequence( "FromPowerSelect" )
			Image:AnimateSequence( "FromPowerSelect" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f12_local9:AnimateSequence( "FromPowerSelect" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f12_local10:AnimateSequence( "FromPowerSelect" )
			end
			if not Engine.IsMultiplayer() then
				f12_local11:AnimateSequence( "FromPowerSelect" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
				f12_local12:AnimateSequence( "FromPowerSelect" )
			end
			if not Engine.IsMultiplayer() and not Engine.InFrontend() then
				f12_local17:AnimateSequence( "FromPowerSelect" )
			end
		end
		
		CACItemHeader:RegisterAnimationSequence( "FromAttachmentSelect", {
			{
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 47, 0, 0, _1080p * 100, 0 )
				end,
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		Image:RegisterAnimationSequence( "FromAttachmentSelect", {
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -209, _1080p * 303, _1080p * 130, _1080p * 642, 0 )
				end,
				function ()
					return self.Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 130, _1080p * 642, 300 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f12_local9:RegisterAnimationSequence( "FromAttachmentSelect", {
				{
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 103, _1080p * 70, _1080p * 59, _1080p * 91, 0 )
					end,
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 56, _1080p * 23, _1080p * 59, _1080p * 91, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f12_local10:RegisterAnimationSequence( "FromAttachmentSelect", {
				{
					function ()
						return self.QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 66, _1080p * 98, _1080p * 59, _1080p * 91, 0 )
					end,
					function ()
						return self.QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 51, _1080p * 59, _1080p * 91, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if not Engine.IsMultiplayer() then
			f12_local11:RegisterAnimationSequence( "FromAttachmentSelect", {
				{
					function ()
						return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 47, _1080p * 58, 0, _1080p * 100, 0 )
					end,
					function ()
						return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
			f12_local12:RegisterAnimationSequence( "FromAttachmentSelect", {
				{
					function ()
						return self.MPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 47, _1080p * 58, 0, _1080p * 100, 0 )
					end,
					function ()
						return self.MPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		self._sequences.FromAttachmentSelect = function ()
			CACItemHeader:AnimateSequence( "FromAttachmentSelect" )
			Image:AnimateSequence( "FromAttachmentSelect" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f12_local9:AnimateSequence( "FromAttachmentSelect" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f12_local10:AnimateSequence( "FromAttachmentSelect" )
			end
			if not Engine.IsMultiplayer() then
				f12_local11:AnimateSequence( "FromAttachmentSelect" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
				f12_local12:AnimateSequence( "FromAttachmentSelect" )
			end
		end
		
		CACItemHeader:RegisterAnimationSequence( "FromPerkSelect", {
			{
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 41, 0, 0, _1080p * 100, 0 )
				end,
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		Image:RegisterAnimationSequence( "FromPerkSelect", {
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -175.5, _1080p * 336.5, _1080p * 130, _1080p * 642, 0 )
				end,
				function ()
					return self.Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 130, _1080p * 642, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f12_local9:RegisterAnimationSequence( "FromPerkSelect", {
				{
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 97, _1080p * 64, _1080p * 59, _1080p * 91, 0 )
					end,
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 56, _1080p * 23, _1080p * 59, _1080p * 91, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f12_local10:RegisterAnimationSequence( "FromPerkSelect", {
				{
					function ()
						return self.QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 60, _1080p * 92, _1080p * 59, _1080p * 91, 0 )
					end,
					function ()
						return self.QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 51, _1080p * 59, _1080p * 91, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if not Engine.IsMultiplayer() then
			f12_local11:RegisterAnimationSequence( "FromPerkSelect", {
				{
					function ()
						return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.5, _1080p * 51.5, 0, _1080p * 100, 0 )
					end,
					function ()
						return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
			f12_local12:RegisterAnimationSequence( "FromPerkSelect", {
				{
					function ()
						return self.MPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 41, _1080p * 52, 0, _1080p * 100, 0 )
					end,
					function ()
						return self.MPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		self._sequences.FromPerkSelect = function ()
			CACItemHeader:AnimateSequence( "FromPerkSelect" )
			Image:AnimateSequence( "FromPerkSelect" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f12_local9:AnimateSequence( "FromPerkSelect" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f12_local10:AnimateSequence( "FromPerkSelect" )
			end
			if not Engine.IsMultiplayer() then
				f12_local11:AnimateSequence( "FromPerkSelect" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
				f12_local12:AnimateSequence( "FromPerkSelect" )
			end
		end
		
		Image:RegisterAnimationSequence( "ImageHidden", {
			{
				function ()
					return self.Image:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ImageHidden = function ()
			Image:AnimateSequence( "ImageHidden" )
		end
		
		Image:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.Image:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.Image:SetDotPitchContrast( 0, 300 )
				end
			},
			{
				function ()
					return self.Image:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.Image:SetDotPitchX( 36, 150 )
				end,
				function ()
					return self.Image:SetDotPitchX( 0, 150 )
				end
			},
			{
				function ()
					return self.Image:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.Image:SetDotPitchY( 68, 150 )
				end,
				function ()
					return self.Image:SetDotPitchY( 0, 150 )
				end
			},
			{
				function ()
					return self.Image:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Image:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Image:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Image:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Image:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Image:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.UpdateImage = function ()
			Image:AnimateSequence( "UpdateImage" )
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f12_local7:RegisterAnimationSequence( "ShowPerkChip", {
				{
					function ()
						return self.PerkShowcaseBacking:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		Image:RegisterAnimationSequence( "ShowPerkChip", {
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -158, _1080p * 100, _1080p * 211, _1080p * 469, 0 )
				end
			}
		} )
		self._sequences.ShowPerkChip = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f12_local7:AnimateSequence( "ShowPerkChip" )
			end
			Image:AnimateSequence( "ShowPerkChip" )
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f12_local7:RegisterAnimationSequence( "HidePerkChip", {
				{
					function ()
						return self.PerkShowcaseBacking:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HidePerkChip = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f12_local7:AnimateSequence( "HidePerkChip" )
			end
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f12_local7:RegisterAnimationSequence( "UpdatePerkChip", {
				{
					function ()
						return self.PerkShowcaseBacking:SetDotPitchX( 52, 0 )
					end,
					function ()
						return self.PerkShowcaseBacking:SetDotPitchX( 0, 300 )
					end
				},
				{
					function ()
						return self.PerkShowcaseBacking:SetDotPitchY( 42, 0 )
					end,
					function ()
						return self.PerkShowcaseBacking:SetDotPitchY( 0, 300 )
					end
				},
				{
					function ()
						return self.PerkShowcaseBacking:SetDotPitchContrast( 0.8, 0 )
					end,
					function ()
						return self.PerkShowcaseBacking:SetDotPitchContrast( 0, 300 )
					end
				},
				{
					function ()
						return self.PerkShowcaseBacking:SetAlpha( 0, 0 )
					end,
					function ()
						return self.PerkShowcaseBacking:SetAlpha( 1, 30 )
					end,
					function ()
						return self.PerkShowcaseBacking:SetAlpha( 0, 30 )
					end,
					function ()
						return self.PerkShowcaseBacking:SetAlpha( 1, 30 )
					end,
					function ()
						return self.PerkShowcaseBacking:SetAlpha( 0, 30 )
					end,
					function ()
						return self.PerkShowcaseBacking:SetAlpha( 1, 30 )
					end
				}
			} )
		end
		self._sequences.UpdatePerkChip = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f12_local7:AnimateSequence( "UpdatePerkChip" )
			end
		end
		
		if not Engine.IsMultiplayer() then
			f12_local6:RegisterAnimationSequence( "ShowJackalBase", {
				{
					function ()
						return self.JackalShowcaseBacking:SetAlpha( 0, 0 )
					end,
					function ()
						return self.JackalShowcaseBacking:SetAlpha( 1, 30 )
					end,
					function ()
						return self.JackalShowcaseBacking:SetAlpha( 0, 30 )
					end,
					function ()
						return self.JackalShowcaseBacking:SetAlpha( 1, 30 )
					end,
					function ()
						return self.JackalShowcaseBacking:SetAlpha( 0, 30 )
					end,
					function ()
						return self.JackalShowcaseBacking:SetAlpha( 1, 30 )
					end
				},
				{
					function ()
						return self.JackalShowcaseBacking:SetDotPitchX( 50, 0 )
					end,
					function ()
						return self.JackalShowcaseBacking:SetDotPitchX( 0, 300 )
					end
				},
				{
					function ()
						return self.JackalShowcaseBacking:SetDotPitchY( 42, 0 )
					end,
					function ()
						return self.JackalShowcaseBacking:SetDotPitchY( 0, 300 )
					end
				},
				{
					function ()
						return self.JackalShowcaseBacking:SetDotPitchContrast( 0.8, 0 )
					end,
					function ()
						return self.JackalShowcaseBacking:SetDotPitchContrast( 0, 300 )
					end
				}
			} )
		end
		self._sequences.ShowJackalBase = function ()
			if not Engine.IsMultiplayer() then
				f12_local6:AnimateSequence( "ShowJackalBase" )
			end
		end
		
		if not Engine.IsMultiplayer() then
			f12_local6:RegisterAnimationSequence( "HideJackalBase", {
				{
					function ()
						return self.JackalShowcaseBacking:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideJackalBase = function ()
			if not Engine.IsMultiplayer() then
				f12_local6:AnimateSequence( "HideJackalBase" )
			end
		end
		
		CACItemHeader:RegisterAnimationSequence( "FromJackalDecal", {
			{
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 118, 0, 0, _1080p * 100, 0 )
				end,
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		if not Engine.IsMultiplayer() then
			f12_local6:RegisterAnimationSequence( "FromJackalDecal", {
				{
					function ()
						return self.JackalShowcaseBacking:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -512, _1080p * 512, _1080p * 130, _1080p * 642, 0, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		Image:RegisterAnimationSequence( "FromJackalDecal", {
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -394, _1080p * 630, _1080p * 130, _1080p * 642, 0 )
				end,
				function ()
					return self.Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -512, _1080p * 512, _1080p * 130, _1080p * 642, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		if not Engine.IsMultiplayer() then
			f12_local11:RegisterAnimationSequence( "FromJackalDecal", {
				{
					function ()
						return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 118, _1080p * 129, 0, _1080p * 100, 0 )
					end,
					function ()
						return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		self._sequences.FromJackalDecal = function ()
			CACItemHeader:AnimateSequence( "FromJackalDecal" )
			if not Engine.IsMultiplayer() then
				f12_local6:AnimateSequence( "FromJackalDecal" )
			end
			Image:AnimateSequence( "FromJackalDecal" )
			if not Engine.IsMultiplayer() then
				f12_local11:AnimateSequence( "FromJackalDecal" )
			end
		end
		
		Image:RegisterAnimationSequence( "RatioExtraWide", {
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -512, _1080p * 512, _1080p * 130, _1080p * 642, 0 )
				end
			}
		} )
		self._sequences.RatioExtraWide = function ()
			Image:AnimateSequence( "RatioExtraWide" )
		end
		
		FireModes:RegisterAnimationSequence( "MPFireModes", {
			{
				function ()
					return self.FireModes:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -773.5, _1080p * -398.5, _1080p * -99, _1080p * -60, 0 )
				end
			}
		} )
		self._sequences.MPFireModes = function ()
			FireModes:AnimateSequence( "MPFireModes" )
		end
		
		FireModes:RegisterAnimationSequence( "RegFireModes", {
			{
				function ()
					return self.FireModes:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 375, _1080p * 188, _1080p * 227, 0 )
				end
			}
		} )
		self._sequences.RegFireModes = function ()
			FireModes:AnimateSequence( "RegFireModes" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f12_local10:SubscribeToModelThroughElement( self, "quality", function ()
			local f173_local0 = self:GetDataSource()
			if f173_local0.quality:GetValue( f12_local1 ) ~= nil then
				f173_local0 = self:GetDataSource()
				if f173_local0.quality:GetValue( f12_local1 ) == 0 then
					ACTIONS.AnimateSequence( self, "HideQuality" )
				end
			end
			f173_local0 = self:GetDataSource()
			if f173_local0.quality:GetValue( f12_local1 ) ~= nil then
				f173_local0 = self:GetDataSource()
				if f173_local0.quality:GetValue( f12_local1 ) ~= 0 then
					ACTIONS.AnimateSequence( self, "ShowQuality" )
				end
			end
		end )
	end
	if Engine.IsMultiplayer() then
		
	else
		
	end
	if Engine.IsMultiplayer() then
		f12_local13:SetDataSourceThroughElement( self, "passives" )
	end
	FireModes:SetDataSourceThroughElement( self, "fireModes" )
	self:SubscribeToModelThroughElement( self, "desc", function ()
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CACItemHeader",
			sequenceName = "UpdateDescription",
			elementPath = "CACItemHeader"
		} )
	end )
	f0_local0( self, f12_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsCoreMultiplayer( self ) then
		ACTIONS.AnimateSequence( self, "MPFireModes" )
	end
	if not CONDITIONS.IsCoreMultiplayer( self ) then
		ACTIONS.AnimateSequence( self, "RegFireModes" )
	end
	return self
end

MenuBuilder.registerType( "LoadoutSelectHeader", LoadoutSelectHeader )
LockTable( _M )
