local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Button )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "ref", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.permUnlockRef:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			if (tonumber( Cac.GetPick10UnlockRank( f2_local0 ) ) == 0) or Prestige.IsItemUnlocked( f1_arg1, f2_local0, "pick10" ) then
				f1_arg0.PrestigeLock:SetAlpha( 0 )
			else
				f1_arg0.PrestigeLock:SetAlpha( 1 )
			end
		end
	end )
	f1_arg0.Button:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f1_arg0:GetDataSource()
		local f3_local1 = f3_local0.ref:GetValue( controller )
		local f3_local2 = f3_local0.permUnlockRef:GetValue( controller )
		local f3_local3 = f3_local0.name:GetValue( controller )
		local f3_local4 = function ()
			Prestige.UsePermanentUnlockToken( f1_arg1, f3_local2, "pick10" )
			f1_arg0:dispatchEventToCurrentMenu( {
				name = "update_token_count"
			} )
		end
		
		local f3_local5 = nil
		if f3_local1 == f3_local2 then
			f3_local5 = Cac.GetPick10UnlockRank( f3_local1 )
		end
		Prestige.PermanentUnlockTokenSpendAction( f1_arg1, f3_local2, f3_local3, "pick10", f3_local5, f3_local4 )
	end )
end

function Pick10PermanentUnlockButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "Pick10PermanentUnlockButton"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local Button = nil
	
	Button = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f5_local1
	} )
	Button.id = "Button"
	Button:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 30 )
	Button:SubscribeToModelThroughElement( self, "name", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.name:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			Button.Text:setText( LocalizeString( ToUpperCase( f6_local0 ) ), 0 )
		end
	end )
	self:addElement( Button )
	self.Button = Button
	
	local PrestigeLock = nil
	
	PrestigeLock = LUI.UIImage.new()
	PrestigeLock.id = "PrestigeLock"
	PrestigeLock:SetRGBFromInt( 12566463, 0 )
	PrestigeLock:SetAlpha( 0, 0 )
	PrestigeLock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	PrestigeLock:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -82, _1080p * -56, _1080p * -13, _1080p * 13 )
	self:addElement( PrestigeLock )
	self.PrestigeLock = PrestigeLock
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		PrestigeLock:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.PrestigeLock:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			PrestigeLock:AnimateSequence( "ButtonOver" )
		end
		
		PrestigeLock:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.PrestigeLock:SetRGBFromInt( 12566463, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			PrestigeLock:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f13_arg0, f13_arg1 )
		local f13_local0 = f13_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f14_arg0, f14_arg1 )
		local f14_local0 = f14_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	PostLoadFunc( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "Pick10PermanentUnlockButton", Pick10PermanentUnlockButton )
LockTable( _M )
