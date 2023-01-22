local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if CONDITIONS.IsPublicMatch() then
		assert( f1_arg0.NewItemNotification )
		local f1_local0 = Rewards.IsTypeNew( f1_arg1, "weapon" )
		local f1_local1 = LOOT.AreAnyLastLootItemsInCSV( f1_arg1, CSV.weaponLootMaster.file )
		local f1_local2 = CONDITIONS.AreLootStreaksEnabled()
		if f1_local2 then
			f1_local2 = LOOT.AreAnyLastLootItemsInCSV( f1_arg1, CSV.streakLootMaster.file )
		end
		local f1_local3 = Rewards.IsTypeNew( f1_arg1, "super" ) or Rewards.IsTypeNew( f1_arg1, "rig" ) or Rewards.IsTypeNew( f1_arg1, "perk" ) or Rewards.IsTypeNew( f1_arg1, "power" ) or f1_local2 or Rewards.IsTypeNew( f1_arg1, "killstreak" ) or f1_local1 or f1_local0 or Rewards.IsTypeNew( f1_arg1, "trait" )
		for f1_local12, f1_local13 in ipairs( Cac.GetWeaponClassList() ) do
			for f1_local7, f1_local8 in ipairs( f1_local13 ) do
				local f1_local10 = Cac.GetWeaponClassAttachUnlockTablePrefix( f1_local8.ref ) .. "attach"
				local f1_local11 = false
				if not f1_local3 then
					f1_local3 = f1_local11
				end
			end
		end
		if f1_local3 then
			f1_arg0.NewItemNotification:SetAlpha( 1, 0 )
		else
			
		end
	end
end

function CreateAClassButton( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "CreateAClassButton"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local CAC = nil
	
	CAC = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f2_local1
	} )
	CAC.id = "CAC"
	CAC.buttonDescription = Engine.Localize( "LUA_MENU_DESC_CREATE_A_CLASS" )
	CAC.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CREATE_A_CLASS_CAPS" ) ), 0 )
	CAC:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 )
	self:addElement( CAC )
	self.CAC = CAC
	
	local NewItemNotification = nil
	
	NewItemNotification = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
		controllerIndex = f2_local1
	} )
	NewItemNotification.id = "NewItemNotification"
	NewItemNotification:SetAlpha( 0, 0 )
	NewItemNotification:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 385, _1080p * -51, _1080p * -17, _1080p * 47 )
	self:addElement( NewItemNotification )
	self.NewItemNotification = NewItemNotification
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		NewItemNotification:RegisterAnimationSequence( "Arabic", {
			{
				function ()
					return self.NewItemNotification:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -426, _1080p * -17, _1080p * 47, 0 )
				end
			}
		} )
		self._sequences.Arabic = function ()
			NewItemNotification:AnimateSequence( "Arabic" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	CAC:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
		local f7_local0 = f7_arg1.controller or f2_local1
		ACTIONS.OpenCreateAClass( self, f7_arg1 )
	end )
	if CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "Arabic" )
	end
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "CreateAClassButton", CreateAClassButton )
LockTable( _M )
