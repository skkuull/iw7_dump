local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:SetNoWrap( true )
end

function TwoFramedAttachments( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 192 * _1080p, 0, 90 * _1080p )
	self.id = "TwoFramedAttachments"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local SlotTwo = nil
	
	SlotTwo = MenuBuilder.BuildRegisteredType( "FramedAttachment", {
		controllerIndex = f2_local1
	} )
	SlotTwo.id = "SlotTwo"
	SlotTwo.OpticsIcon:SetAlpha( 0, 0 )
	SlotTwo:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 95, 0, _1080p * 90 )
	self:addElement( SlotTwo )
	self.SlotTwo = SlotTwo
	
	local SlotThree = nil
	
	SlotThree = MenuBuilder.BuildRegisteredType( "FramedAttachment", {
		controllerIndex = f2_local1
	} )
	SlotThree.id = "SlotThree"
	SlotThree.OpticsIcon:SetAlpha( 0, 0 )
	SlotThree:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 97, _1080p * 192, 0, _1080p * 90 )
	self:addElement( SlotThree )
	self.SlotThree = SlotThree
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_left", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg1.controller or f2_local1
		local f3_local1 = f3_arg0:getParent()
		if #f3_local1:getAllFocusedChildren() <= 0 then
			f3_local1 = f3_arg0:getParent()
			if f3_local1:isInFocus() then
				if CONDITIONS.IsSingleplayer( self ) then
					ACTIONS.CloseLoadoutEditMenu( self )
				end
				return true
			end
			return false
		end
		if CONDITIONS.IsSingleplayer( self ) then
			ACTIONS.CloseLoadoutEditMenu( self )
		end
		return true
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "TwoFramedAttachments", TwoFramedAttachments )
LockTable( _M )
