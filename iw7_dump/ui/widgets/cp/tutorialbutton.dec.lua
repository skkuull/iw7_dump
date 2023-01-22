local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.MenuButton )
	ACTIONS.SetAnimationSet( f1_arg0.MenuButton, "ThirdGameMode" )
	f1_arg0.MenuButton:registerEventHandler( "button_action", function ( element, event )
		
	end )
end

function TutorialButton( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 525 * _1080p, 0, 40 * _1080p )
	self.id = "TutorialButton"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local MenuButton = nil
	
	MenuButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f3_local1
	} )
	MenuButton.id = "MenuButton"
	MenuButton:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 25, _1080p * -25, _1080p * 4, _1080p * -6 )
	MenuButton:SubscribeToModelThroughElement( self, "name", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.name:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			MenuButton.Text:setText( ToUpperCase( LocalizeString( f4_local0 ) ), 0 )
		end
	end )
	self:addElement( MenuButton )
	self.MenuButton = MenuButton
	
	local Check = nil
	
	Check = LUI.UIImage.new()
	Check.id = "Check"
	Check:setImage( RegisterMaterial( "zm_tutorial_green_check_small" ), 0 )
	Check:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12.41, _1080p * 44.41, _1080p * 4, _1080p * 36 )
	self:addElement( Check )
	self.Check = Check
	
	self._animationSets.DefaultAnimationSet = function ()
		Check:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Check:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Check:AnimateSequence( "DefaultSequence" )
		end
		
		Check:RegisterAnimationSequence( "ShowCheck", {
			{
				function ()
					return self.Check:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowCheck = function ()
			Check:AnimateSequence( "ShowCheck" )
		end
		
		Check:RegisterAnimationSequence( "HideCheck", {
			{
				function ()
					return self.Check:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideCheck = function ()
			Check:AnimateSequence( "HideCheck" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f12_local0 = self:GetDataSource()
		if f12_local0.isUnlocked:GetValue( f3_local1 ) ~= nil then
			f12_local0 = self:GetDataSource()
			if f12_local0.isUnlocked:GetValue( f3_local1 ) == true then
				ACTIONS.AnimateSequence( self, "ShowCheck" )
			end
		end
		f12_local0 = self:GetDataSource()
		if f12_local0.isUnlocked:GetValue( f3_local1 ) ~= nil then
			f12_local0 = self:GetDataSource()
			if f12_local0.isUnlocked:GetValue( f3_local1 ) == false then
				ACTIONS.AnimateSequence( self, "HideCheck" )
			end
		end
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "TutorialButton", TutorialButton )
LockTable( _M )
