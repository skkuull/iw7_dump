local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.CamoButton )
	assert( f1_arg0.AccessoryButton )
	f1_arg0.AccessoryButton:SubscribeToModelThroughElement( f1_arg0, "cosmeticAttachmentInfo.name", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.cosmeticAttachmentInfo.name:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			f1_arg0.AccessoryButton.Name:setText( LocalizeString( f2_local0 ), 0 )
			f1_arg0.AccessoryButton:PositionQualityIcon()
		end
	end )
	f1_arg0.CamoButton:SubscribeToModelThroughElement( f1_arg0, "camoInfo.name", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		f3_local0 = f3_local0.camoInfo.name:GetValue( f1_arg1 )
		if f3_local0 ~= nil then
			f1_arg0.CamoButton.Name:setText( LocalizeString( f3_local0 ), 0 )
			f1_arg0.CamoButton:PositionQualityIcon()
		end
	end )
	if CONDITIONS.IsMultiplayer( f1_arg0 ) then
		local self = LUI.UIBindButton.new()
		self.id = "camoButtonBindButton"
		f1_arg0.CamoButton:addElement( self )
		f1_arg0.CamoButton.bindButton = self
		f1_arg0.CamoButton.bindButton:addEventHandler( "button_alt1", function ( f4_arg0, f4_arg1 )
			local f4_local0 = f4_arg0:getParent()
			if #f4_local0:getAllFocusedChildren() <= 0 then
				f4_local0 = f4_arg0:getParent()
				if f4_local0:isInFocus() then
				
				else
					return false
				end
			end
			ACTIONS.PlaySoundSetSound( f1_arg0, "selectAlt", false )
			ACTIONS.RemoveCamo( f1_arg0, f1_arg1 )
			f4_local0 = Cac.UpdateFrontendWeaponModel
			local f4_local1 = f4_arg0:GetCurrentMenu()
			f4_local0( f4_local1.weaponDataSource, nil, f1_arg1 )
			f1_arg0.CamoButton.QualityIcon:SetAlpha( 0, 0 )
			return true
		end )
		local f1_local1 = LUI.UIBindButton.new()
		f1_local1.id = "accessoryBindButton"
		f1_arg0.AccessoryButton:addElement( f1_local1 )
		f1_arg0.AccessoryButton.bindButton = f1_local1
		f1_arg0.AccessoryButton.bindButton:addEventHandler( "button_alt1", function ( f5_arg0, f5_arg1 )
			local f5_local0 = f5_arg0:getParent()
			if #f5_local0:getAllFocusedChildren() <= 0 then
				f5_local0 = f5_arg0:getParent()
				if f5_local0:isInFocus() then
				
				else
					return false
				end
			end
			ACTIONS.PlaySoundSetSound( f1_arg0, "selectAlt", false )
			ACTIONS.RemoveCosmeticAttachment( f1_arg0, f1_arg1 )
			f5_local0 = Cac.UpdateFrontendWeaponModel
			local f5_local1 = f5_arg0:GetCurrentMenu()
			f5_local0( f5_local1.weaponDataSource, nil, f1_arg1 )
			f1_arg0.AccessoryButton.QualityIcon:SetAlpha( 0, 0 )
			return true
		end )
		f1_arg0:SubscribeToModelThroughElement( f1_arg0, "ref", function ()
			local f6_local0 = f1_arg0:GetDataSource()
			f6_local0 = f6_local0.ref:GetValue( f1_arg1 )
			assert( f6_local0 )
			local f6_local1 = Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f6_local0, CSV.weapons.cols.class )
			local f6_local2 = f1_arg0:GetDataSource()
			local f6_local3 = tonumber( Engine.TableLookup( CSV.cosmeticCamosLootMaster.file, CSV.cosmeticCamosLootMaster.cols.ref, f6_local1 .. "+" .. f6_local2.camoInfo.ref:GetValue( f1_arg1 ), CSV.cosmeticCamosLootMaster.cols.quality ) )
			if f6_local3 then
				f1_arg0.CamoButton.QualityIcon:SetAlpha( 1, 0 )
				f1_arg0.CamoButton.QualityIcon:SetDisplayQuality( f6_local3 )
			end
			local f6_local4 = f1_arg0:GetDataSource()
			local f6_local5 = tonumber( Engine.TableLookup( CSV.cosmeticAttachmentsLootMaster.file, CSV.cosmeticAttachmentsLootMaster.cols.ref, f6_local4.cosmeticAttachmentInfo.ref:GetValue( f1_arg1 ), CSV.cosmeticAttachmentsLootMaster.cols.quality ) )
			if f6_local5 then
				f1_arg0.AccessoryButton.QualityIcon:SetAlpha( 1, 0 )
				f1_arg0.AccessoryButton.QualityIcon:SetDisplayQuality( f6_local5 )
			end
			if CONDITIONS.InFrontendPublicMP( f1_arg0 ) then
				local f6_local6 = Cac.GetWeaponMaxRank( f6_local0 )
				if f6_local6 and f6_local6 > 0 then
					local PersonalizeWeaponPrestigeBtn = MenuBuilder.BuildRegisteredType( "Personalize_WeaponPrestigeBtn", {
						controllerIndex = f1_arg1
					} )
					PersonalizeWeaponPrestigeBtn.id = "PersonalizeWeaponPrestigeBtn"
					if CONDITIONS.InFrontendPublicMP( f1_arg0 ) then
						PersonalizeWeaponPrestigeBtn:SetDataSourceThroughElement( f1_arg0, nil )
					end
					PersonalizeWeaponPrestigeBtn.BGImage:setImage( RegisterMaterial( "icon_weapon_accessory" ), 0 )
					PersonalizeWeaponPrestigeBtn.Name:setText( Engine.Localize( "PRESTIGE_CURRENT_WEAPON_PRESTIGE_LEVEL" ), 0 )
					PersonalizeWeaponPrestigeBtn.TitleText:setText( ToUpperCase( Engine.Localize( "PRESTIGE_ENTER_WEAPON_PRESTIGE" ) ), 0 )
					PersonalizeWeaponPrestigeBtn:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 622, _1080p * 358, _1080p * 516 )
					f1_arg0:addElement( PersonalizeWeaponPrestigeBtn )
					f1_arg0.PersonalizeWeaponPrestigeBtn = PersonalizeWeaponPrestigeBtn
					
					f1_arg0.AccessoryButton.navigation.down = PersonalizeWeaponPrestigeBtn
					PersonalizeWeaponPrestigeBtn.navigation = {
						up = f1_arg0.AccessoryButton
					}
				else
					if f1_arg0.PersonalizeWeaponPrestigeBtn then
						f1_arg0.PersonalizeWeaponPrestigeBtn:close()
					end
					f1_arg0.PersonalizeWeaponPrestigeBtn = nil
					f1_arg0.AccessoryButton.navigation.down = nil
				end
			end
		end )
	end
end

function PersonalizeButtonList( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 641 * _1080p, 0, 704 * _1080p )
	self.id = "PersonalizeButtonList"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local f7_local3 = nil
	if CONDITIONS.IsMultiplayer( self ) then
		f7_local3 = MenuBuilder.BuildRegisteredType( "Personalize_RigCustomizationAppearenceBtn", {
			controllerIndex = f7_local1
		} )
		f7_local3.id = "CamoButton"
		if CONDITIONS.IsMultiplayer( self ) then
			f7_local3.buttonDescription = Engine.Localize( "LUA_MENU_MP_WEAPON_PERSONALIZE_CAMO" )
		end
		f7_local3.BGImage:setImage( RegisterMaterial( "icon_weapon_camo" ), 0 )
		f7_local3.Icon:setImage( RegisterMaterial( "icon_weapon_camo_small" ), 0 )
		f7_local3.Name:setText( LocalizeString( Engine.Localize( "MENU_NEW" ) ), 0 )
		f7_local3.TitleText:setText( ToUpperCase( Engine.Localize( "MENU_CAMO_CAPS" ) ), 0 )
		f7_local3:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 622, 0, _1080p * 158 )
		self:addElement( f7_local3 )
		self.CamoButton = f7_local3
	end
	local AccessoryButton = nil
	
	AccessoryButton = MenuBuilder.BuildRegisteredType( "Personalize_RigCustomizationAppearenceBtn", {
		controllerIndex = f7_local1
	} )
	AccessoryButton.id = "AccessoryButton"
	AccessoryButton.buttonDescription = Engine.Localize( "LUA_MENU_MP_WEAPON_PERSONALIZE_ACCESSORY" )
	AccessoryButton.BGImage:setImage( RegisterMaterial( "icon_weapon_paintjob" ), 0 )
	AccessoryButton.Name:setText( LocalizeString( Engine.Localize( "MENU_NEW" ) ), 0 )
	AccessoryButton.TitleText:setText( ToUpperCase( Engine.Localize( "MENU_ACCESSORY" ) ), 0 )
	AccessoryButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 622, _1080p * 177, _1080p * 335 )
	self:addElement( AccessoryButton )
	self.AccessoryButton = AccessoryButton
	
	local ButtonDescription = nil
	
	ButtonDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f7_local1
	} )
	ButtonDescription.id = "ButtonDescription"
	ButtonDescription.Description:SetRight( _1080p * 415, 0 )
	ButtonDescription:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 515, _1080p * 528, _1080p * 628 )
	self:addElement( ButtonDescription )
	self.ButtonDescription = ButtonDescription
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.CamoSelect = function ()
			
		end
		
		self._sequences.WeaponPersonalize = function ()
			
		end
		
		self._sequences.ReticleSelect = function ()
			
		end
		
		if CONDITIONS.IsMultiplayer( self ) then
			f7_local3:RegisterAnimationSequence( "GridOpen", {
				{
					function ()
						return self.CamoButton:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		AccessoryButton:RegisterAnimationSequence( "GridOpen", {
			{
				function ()
					return self.AccessoryButton:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.GridOpen = function ()
			if CONDITIONS.IsMultiplayer( self ) then
				f7_local3:AnimateSequence( "GridOpen" )
			end
			AccessoryButton:AnimateSequence( "GridOpen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsMultiplayer( self ) then
		f7_local3.navigation = {
			down = AccessoryButton
		}
	end
	AccessoryButton.navigation = {
		up = f7_local3
	}
	f0_local0( self, f7_local1, controller )
	return self
end

MenuBuilder.registerType( "PersonalizeButtonList", PersonalizeButtonList )
LockTable( _M )
