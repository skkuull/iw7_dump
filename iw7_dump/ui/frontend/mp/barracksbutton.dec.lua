local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if CONDITIONS.UseCACBreadCrumbs() and CONDITIONS.IsPublicMatch() then
		local f1_local0 = Rewards.IsTypeNew( f1_arg1, "callingCard" )
		if not f1_local0 then
			f1_local0 = CallingCardUtils.HasAnyNewLootCards( f1_arg1 )
		end
		if f1_local0 then
			f1_arg0.NewItemNotification:SetAlpha( 1, 0 )
		end
	end
end

function BarracksButton( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "BarracksButton"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Barracks = nil
	
	Barracks = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f2_local1
	} )
	Barracks.id = "Barracks"
	Barracks.buttonDescription = Engine.Localize( "LUA_MENU_DESC_BARRACKS_PLAYLIST" )
	Barracks.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_BARRACKS_CAPS" ) ), 0 )
	Barracks:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 )
	self:addElement( Barracks )
	self.Barracks = Barracks
	
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
	Barracks:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
		ACTIONS.OpenMenu( "Headquarters", true, f7_arg1.controller or f2_local1 )
	end )
	if CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "Arabic" )
	end
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "BarracksButton", BarracksButton )
LockTable( _M )
