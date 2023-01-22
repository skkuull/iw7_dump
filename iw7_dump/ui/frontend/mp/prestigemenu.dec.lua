local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PreLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	InitPrestigeMenuDataSources()
end

function PrestigeMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "PrestigeMenu"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	PreLoadFunc( self, f2_local1, controller )
	self:playSound( "menu_open" )
	local f2_local2 = self
	local ActivatePrestigeButton0 = nil
	
	ActivatePrestigeButton0 = MenuBuilder.BuildRegisteredType( "ActivatePrestigeButton", {
		controllerIndex = f2_local1
	} )
	ActivatePrestigeButton0.id = "ActivatePrestigeButton0"
	ActivatePrestigeButton0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 625.11, _1080p * 1225.11, _1080p * 213.75, _1080p * 813.75 )
	self:addElement( ActivatePrestigeButton0 )
	self.ActivatePrestigeButton0 = ActivatePrestigeButton0
	
	local LockImage = nil
	
	LockImage = LUI.UIImage.new()
	LockImage.id = "LockImage"
	LockImage:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	LockImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 625.11, _1080p * 1177.11, _1080p * 213.75, _1080p * 813.75 )
	self:addElement( LockImage )
	self.LockImage = LockImage
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LockImage:RegisterAnimationSequence( "HideLock", {
			{
				function ()
					return self.LockImage:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideLock = function ()
			LockImage:AnimateSequence( "HideLock" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f7_arg0, f7_arg1 )
		f7_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:addEventHandler( "menu_create", function ( f8_arg0, f8_arg1 )
		local f8_local0 = f8_arg1.controller or f2_local1
		if CONDITIONS.IsCoreMultiplayer( self ) and DataSources.frontEnd.MP.prestigeMenu.canActivate:GetValue( f8_local0 ) ~= nil and DataSources.frontEnd.MP.prestigeMenu.canActivate:GetValue( f8_local0 ) == true then
			ACTIONS.AnimateSequence( self, "HideLock" )
		end
		if CONDITIONS.IsThirdGameMode( self ) and DataSources.frontEnd.CP.prestigeMenu.canActivate:GetValue( f8_local0 ) ~= nil and DataSources.frontEnd.CP.prestigeMenu.canActivate:GetValue( f8_local0 ) == true then
			ACTIONS.AnimateSequence( self, "HideLock" )
		end
	end )
	self.bindButton:addEventHandler( "button_secondary", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	return self
end

MenuBuilder.registerType( "PrestigeMenu", PrestigeMenu )
LockTable( _M )
