local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function SetMouseNavigationEnabled( f1_arg0, f1_arg1 )
	f1_arg0:SetHandleMouseTree( f1_arg1 )
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = f2_arg0.WeaponOne
	local f2_local1 = f2_arg0.WeaponTwo
	f2_arg0.Equipment.PowerSlotOne.PowerButton.navigation = {}
	f2_arg0.Equipment.PowerSlotOne.PowerButton.navigation.up = f2_local1.WeaponButton
	f2_arg0.Equipment.PowerSlotOne.PowerButton.navigation.left = nil
	f2_arg0.Equipment.PowerSlotOne.PowerButton.navigation.right = f2_arg0.Equipment.PowerSlotTwo.PowerButton
	f2_arg0.Equipment.PowerSlotOne.ExtraPowerButton.navigation = {}
	f2_arg0.Equipment.PowerSlotOne.ExtraPowerButton.navigation.down = f2_local0.WeaponButton
	f2_arg0.Equipment.PowerSlotOne.ExtraPowerButton.navigation.left = nil
	f2_arg0.Equipment.PowerSlotOne.ExtraPowerButton.navigation.right = f2_arg0.Equipment.PowerSlotTwo.ExtraPowerButton
	f2_arg0.Equipment.PowerSlotTwo.PowerButton.navigation = {}
	f2_arg0.Equipment.PowerSlotTwo.PowerButton.navigation.up = f2_local1.WeaponButton
	f2_arg0.Equipment.PowerSlotTwo.PowerButton.navigation.left = f2_arg0.Equipment.PowerSlotOne.PowerButton
	f2_arg0.Equipment.PowerSlotTwo.PowerButton.navigation.right = f2_arg0.PerkOne.Perk
	f2_arg0.Equipment.PowerSlotTwo.ExtraPowerButton.navigation = {}
	f2_arg0.Equipment.PowerSlotTwo.ExtraPowerButton.navigation.down = f2_local0.WeaponButton
	f2_arg0.Equipment.PowerSlotTwo.ExtraPowerButton.navigation.left = f2_arg0.Equipment.PowerSlotOne.ExtraPowerButton
	f2_arg0.Equipment.PowerSlotTwo.ExtraPowerButton.navigation.right = f2_arg0.PerkOne.ExtraPerk
	f2_local0.WeaponButton.navigation = {}
	f2_local0.WeaponButton.navigation.up = f2_arg0.Equipment.PowerSlotOne.ExtraPowerButton
	f2_local0.WeaponButton.navigation.down = f2_local1.WeaponButton
	f2_local0.WeaponButton.navigation.left = nil
	f2_local0.WeaponButton.navigation.right = f2_local0.AttachmentsOne.SlotOne
	f2_local1.WeaponButton.navigation = {}
	f2_local1.WeaponButton.navigation.up = f2_local0.WeaponButton
	f2_local1.WeaponButton.navigation.down = f2_arg0.Equipment.PowerSlotOne.PowerButton
	f2_local1.WeaponButton.navigation.left = nil
	f2_local1.WeaponButton.navigation.right = f2_local1.AttachmentsOne.SlotOne
	local f2_local2 = function ( f3_arg0, f3_arg1 )
		f3_arg0.AttachmentsOne.SlotOne:SetDataSourceThroughElement( f3_arg0, "attachments.attachmentSlotOne" )
		f3_arg0.AttachmentsOne.SlotTwo:SetDataSourceThroughElement( f3_arg0, "attachments.attachmentSlotTwo" )
		f3_arg0.AttachmentsOne.SlotThree:SetDataSourceThroughElement( f3_arg0, "attachments.attachmentSlotThree" )
		f3_arg0.AttachmentsOne.SlotOne.navigation.left = f3_arg0.WeaponButton
		f3_arg0.AttachmentsOne.SlotTwo.navigation.down = f3_arg0.AttachmentsTwo.SlotTwo
		f3_arg0.AttachmentsOne.SlotThree.navigation.down = f3_arg0.AttachmentsTwo.SlotThree
		f3_arg0.AttachmentsOne.SlotThree.navigation.right = nil
		f3_arg0.AttachmentsTwo.SlotTwo.navigation.up = f3_arg0.AttachmentsOne.SlotTwo
		f3_arg0.AttachmentsTwo.SlotThree.navigation.up = f3_arg0.AttachmentsOne.SlotThree
		f3_arg0.AttachmentsTwo.SlotThree.navigation.right = nil
		if f3_arg1 then
			f3_arg0.Overkill:SetDataSourceThroughElement( f2_arg0, "overkill" )
			f3_arg0.AttachmentsTwo.SlotTwo:SetDataSourceThroughElement( f3_arg0, "attachments.attachmentSlotFour" )
			f3_arg0.AttachmentsTwo.SlotThree:SetDataSourceThroughElement( f3_arg0, "attachments.attachmentSlotFive" )
			f3_arg0.AttachmentsOne.SlotOne.navigation.down = f3_arg0.Overkill
			f3_arg0.Overkill.navigation = {}
			f3_arg0.Overkill.navigation.up = f3_arg0.AttachmentsOne.SlotOne
			f3_arg0.Overkill.navigation.left = f3_arg0.WeaponButton
			f3_arg0.Overkill.navigation.right = f3_arg0.AttachmentsTwo.SlotTwo
			f3_arg0.AttachmentsTwo.SlotTwo.navigation.left = f3_arg0.Overkill
		else
			f3_arg0.AttachmentsTwo.SlotOne:SetDataSourceThroughElement( f3_arg0, "attachments.attachmentSlotFour" )
			f3_arg0.AttachmentsTwo.SlotTwo:SetDataSourceThroughElement( f3_arg0, "attachments.attachmentSlotFive" )
			f3_arg0.AttachmentsTwo.SlotThree:SetDataSourceThroughElement( f3_arg0, "attachments.attachmentSlotSix" )
			f3_arg0.AttachmentsOne.SlotOne.navigation.down = f3_arg0.AttachmentsTwo.SlotOne
			f3_arg0.AttachmentsTwo.SlotOne.navigation.up = f3_arg0.AttachmentsOne.SlotOne
			f3_arg0.AttachmentsTwo.SlotOne.navigation.left = f3_arg0.WeaponButton
		end
		f3_arg0.AttachmentsOne.SlotOne:UpdateWeaponButtonRef( f2_arg1, f3_arg0.WeaponButton )
	end
	
	f2_local2( f2_local0, false )
	f2_local2( f2_local1, true )
	f2_local0.AttachmentsOne.SlotOne.navigation.up = f2_arg0.PerkOne.ExtraPerk
	f2_local0.AttachmentsOne.SlotTwo.navigation.up = f2_arg0.PerkTwo.ExtraPerk
	f2_local0.AttachmentsOne.SlotThree.navigation.up = f2_arg0.PerkThree.ExtraPerk
	f2_local0.AttachmentsTwo.SlotOne.navigation.down = f2_local1.AttachmentsOne.SlotOne
	f2_local0.AttachmentsTwo.SlotTwo.navigation.down = f2_local1.AttachmentsOne.SlotTwo
	f2_local0.AttachmentsTwo.SlotThree.navigation.down = f2_local1.AttachmentsOne.SlotThree
	f2_local1.AttachmentsOne.SlotOne.navigation.up = f2_local0.AttachmentsTwo.SlotOne
	f2_local1.AttachmentsOne.SlotTwo.navigation.up = f2_local0.AttachmentsTwo.SlotTwo
	f2_local1.AttachmentsOne.SlotThree.navigation.up = f2_local0.AttachmentsTwo.SlotThree
	f2_local1.Overkill.navigation.down = f2_arg0.PerkOne.Perk
	f2_local1.AttachmentsTwo.SlotTwo.navigation.down = f2_arg0.PerkTwo.Perk
	f2_local1.AttachmentsTwo.SlotThree.navigation.down = f2_arg0.PerkThree.Perk
	f2_arg0.PerkOne.Perk.navigation = {}
	f2_arg0.PerkOne.Perk.navigation.up = f2_local1.Overkill
	f2_arg0.PerkOne.Perk.navigation.left = f2_arg0.Equipment.PowerSlotTwo.PowerButton
	f2_arg0.PerkOne.Perk.navigation.right = f2_arg0.PerkTwo.Perk
	f2_arg0.PerkOne.ExtraPerk.navigation = {}
	f2_arg0.PerkOne.ExtraPerk.navigation.down = f2_local0.AttachmentsOne.SlotOne
	f2_arg0.PerkOne.ExtraPerk.navigation.left = f2_arg0.Equipment.PowerSlotTwo.ExtraPowerButton
	f2_arg0.PerkOne.ExtraPerk.navigation.right = f2_arg0.PerkTwo.ExtraPerk
	f2_arg0.PerkTwo.Perk.navigation = {}
	f2_arg0.PerkTwo.Perk.navigation.up = f2_local1.AttachmentsTwo.SlotTwo
	f2_arg0.PerkTwo.Perk.navigation.left = f2_arg0.PerkOne.Perk
	f2_arg0.PerkTwo.Perk.navigation.right = f2_arg0.PerkThree.Perk
	f2_arg0.PerkTwo.ExtraPerk.navigation = {}
	f2_arg0.PerkTwo.ExtraPerk.navigation.down = f2_local0.AttachmentsOne.SlotTwo
	f2_arg0.PerkTwo.ExtraPerk.navigation.left = f2_arg0.PerkOne.ExtraPerk
	f2_arg0.PerkTwo.ExtraPerk.navigation.right = f2_arg0.PerkThree.ExtraPerk
	f2_arg0.PerkThree.Perk.navigation = {}
	f2_arg0.PerkThree.Perk.navigation.up = f2_local1.AttachmentsTwo.SlotThree
	f2_arg0.PerkThree.Perk.navigation.left = f2_arg0.PerkTwo.Perk
	f2_arg0.PerkThree.Perk.navigation.right = nil
	f2_arg0.PerkThree.ExtraPerk.navigation = {}
	f2_arg0.PerkThree.ExtraPerk.navigation.down = f2_local0.AttachmentsOne.SlotThree
	f2_arg0.PerkThree.ExtraPerk.navigation.left = f2_arg0.PerkTwo.ExtraPerk
	f2_arg0.PerkThree.ExtraPerk.navigation.right = nil
	if Engine.IsPC() then
		f2_arg0:addEventHandler( "open_loadout_edit_menu", function ( f4_arg0, f4_arg1 )
			SetMouseNavigationEnabled( f4_arg0, true )
		end )
		f2_arg0:addEventHandler( "close_loadout_edit_menu", function ( f5_arg0, f5_arg1 )
			SetMouseNavigationEnabled( f5_arg0, false )
		end )
		f2_arg0:addEventHandler( "restored_loadout", function ( f6_arg0, f6_arg1 )
			SetMouseNavigationEnabled( f6_arg0, true )
		end )
		SetMouseNavigationEnabled( f2_arg0, false )
	end
end

function CACLoadout( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 590 * _1080p, 0, 630 * _1080p )
	self.id = "CACLoadout"
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local f7_local3 = nil
	if Engine.InFrontend() then
		f7_local3 = LUI.UIBlur.new()
		f7_local3.id = "LoadoutBlur"
		f7_local3:SetRGBFromInt( 12566463, 0 )
		f7_local3:SetBlurStrength( 2.75, 0 )
		self:addElement( f7_local3 )
		self.LoadoutBlur = f7_local3
	end
	local f7_local4 = nil
	if not CONDITIONS.InGameSPOrFrontendMP( self ) then
		f7_local4 = LUI.UIImage.new()
		f7_local4.id = "AttachmentPrimaryBacker"
		f7_local4:SetRGBFromInt( 5066061, 0 )
		f7_local4:SetAlpha( 0.6, 0 )
		f7_local4:setImage( RegisterMaterial( "pick10_grid_6" ), 0 )
		f7_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 301, _1080p * 590, _1080p * 24, _1080p * 206 )
		self:addElement( f7_local4 )
		self.AttachmentPrimaryBacker = f7_local4
	end
	local f7_local5 = nil
	if not CONDITIONS.InGameSPOrFrontendMP( self ) then
		f7_local5 = LUI.UIImage.new()
		f7_local5.id = "PrimaryWeaponBacker"
		f7_local5:SetRGBFromInt( 5066061, 0 )
		f7_local5:SetAlpha( 0.6, 0 )
		f7_local5:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 295, _1080p * 24, _1080p * 206 )
		self:addElement( f7_local5 )
		self.PrimaryWeaponBacker = f7_local5
	end
	local WeaponOne = nil
	
	WeaponOne = MenuBuilder.BuildRegisteredType( "FramedWeapon", {
		controllerIndex = f7_local1
	} )
	WeaponOne.id = "WeaponOne"
	WeaponOne:SetDataSourceThroughElement( self, "weaponSlotOne" )
	WeaponOne:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 206 )
	self:addElement( WeaponOne )
	self.WeaponOne = WeaponOne
	
	local f7_local7 = nil
	if not CONDITIONS.InGameSPOrFrontendMP( self ) then
		f7_local7 = LUI.UIImage.new()
		f7_local7.id = "AttachmentSecondaryBacker"
		f7_local7:SetRGBFromInt( 5066061, 0 )
		f7_local7:SetAlpha( 0.6, 0 )
		f7_local7:setImage( RegisterMaterial( "pick10_grid_6" ), 0 )
		f7_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 301, _1080p * 590, _1080p * 236, _1080p * 418 )
		self:addElement( f7_local7 )
		self.AttachmentSecondaryBacker = f7_local7
	end
	local f7_local8 = nil
	if not CONDITIONS.InGameSPOrFrontendMP( self ) then
		f7_local8 = LUI.UIImage.new()
		f7_local8.id = "SecondaryWeaponBacker"
		f7_local8:SetRGBFromInt( 5066061, 0 )
		f7_local8:SetAlpha( 0.6, 0 )
		f7_local8:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 295, _1080p * 236, _1080p * 418 )
		self:addElement( f7_local8 )
		self.SecondaryWeaponBacker = f7_local8
	end
	local WeaponTwo = nil
	
	WeaponTwo = MenuBuilder.BuildRegisteredType( "OverkillWeapon", {
		controllerIndex = f7_local1
	} )
	WeaponTwo.id = "WeaponTwo"
	WeaponTwo:SetDataSourceThroughElement( self, "weaponSlotTwo" )
	WeaponTwo.FrameLabel:setText( Engine.Localize( "MPUI_SECONDARY_WEAPON_CAPS" ), 0 )
	WeaponTwo:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 212, _1080p * 418 )
	self:addElement( WeaponTwo )
	self.WeaponTwo = WeaponTwo
	
	local f7_local10 = nil
	if not CONDITIONS.InGameSPOrFrontendMP( self ) then
		f7_local10 = LUI.UIImage.new()
		f7_local10.id = "PerksBacker"
		f7_local10:SetRGBFromInt( 5066061, 0 )
		f7_local10:SetAlpha( 0.6, 0 )
		f7_local10:setImage( RegisterMaterial( "pick10_grid_6" ), 0 )
		f7_local10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 301, _1080p * 590, _1080p * 448, _1080p * 630 )
		self:addElement( f7_local10 )
		self.PerksBacker = f7_local10
	end
	local PerkOne = nil
	
	PerkOne = MenuBuilder.BuildRegisteredType( "FramedPerks", {
		controllerIndex = f7_local1
	} )
	PerkOne.id = "PerkOne"
	PerkOne:SetDataSourceThroughElement( self, "perkSlotOne" )
	PerkOne.FrameLabel:setText( Engine.Localize( "LUA_MENU_MP_PERK_SLOT_ONE_SHORT_CAPS" ), 0 )
	PerkOne:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 301, _1080p * 396, _1080p * 424, _1080p * 630 )
	self:addElement( PerkOne )
	self.PerkOne = PerkOne
	
	local PerkTwo = nil
	
	PerkTwo = MenuBuilder.BuildRegisteredType( "FramedPerks", {
		controllerIndex = f7_local1
	} )
	PerkTwo.id = "PerkTwo"
	PerkTwo:SetDataSourceThroughElement( self, "perkSlotTwo" )
	PerkTwo.FrameLabel:setText( Engine.Localize( "LUA_MENU_MP_PERK_SLOT_TWO_SHORT_CAPS" ), 0 )
	PerkTwo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 398, _1080p * 493, _1080p * 424, _1080p * 630 )
	self:addElement( PerkTwo )
	self.PerkTwo = PerkTwo
	
	local PerkThree = nil
	
	PerkThree = MenuBuilder.BuildRegisteredType( "FramedPerks", {
		controllerIndex = f7_local1
	} )
	PerkThree.id = "PerkThree"
	PerkThree:SetDataSourceThroughElement( self, "perkSlotThree" )
	PerkThree.FrameLabel:setText( Engine.Localize( "LUA_MENU_MP_PERK_SLOT_THREE_SHORT_CAPS" ), 0 )
	PerkThree:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 495, _1080p * 590, _1080p * 424, _1080p * 630 )
	self:addElement( PerkThree )
	self.PerkThree = PerkThree
	
	local f7_local14 = nil
	if not CONDITIONS.InGameSPOrFrontendMP( self ) then
		f7_local14 = LUI.UIImage.new()
		f7_local14.id = "PowersBacker"
		f7_local14:SetRGBFromInt( 5066061, 0 )
		f7_local14:SetAlpha( 0.6, 0 )
		f7_local14:setImage( RegisterMaterial( "pick10_grid_4" ), 0 )
		f7_local14:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 295, _1080p * 448, _1080p * 630 )
		self:addElement( f7_local14 )
		self.PowersBacker = f7_local14
	end
	local Equipment = nil
	
	Equipment = MenuBuilder.BuildRegisteredType( "LoadoutEquipment", {
		controllerIndex = f7_local1
	} )
	Equipment.id = "Equipment"
	Equipment:SetDataSourceThroughElement( self, nil )
	Equipment:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 295, _1080p * 424, _1080p * 630 )
	self:addElement( Equipment )
	self.Equipment = Equipment
	
	WeaponOne:SetDataSourceThroughElement( self, "weaponSlotOne" )
	WeaponTwo:SetDataSourceThroughElement( self, "weaponSlotTwo" )
	PerkOne:SetDataSourceThroughElement( self, "perkSlotOne" )
	PerkTwo:SetDataSourceThroughElement( self, "perkSlotTwo" )
	PerkThree:SetDataSourceThroughElement( self, "perkSlotThree" )
	Equipment:SetDataSourceThroughElement( self, nil )
	PostLoadFunc( self, f7_local1, controller )
	return self
end

MenuBuilder.registerType( "CACLoadout", CACLoadout )
LockTable( _M )
