local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FramedAttachmentsSP( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 135 * _1080p, 0, 182.98 * _1080p )
	self.id = "FramedAttachmentsSP"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local SlotOne = nil
	
	SlotOne = MenuBuilder.BuildRegisteredType( "FramedAttachment", {
		controllerIndex = f1_local1
	} )
	SlotOne.id = "SlotOne"
	SlotOne:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 135, 0, _1080p * 59.66 )
	self:addElement( SlotOne )
	self.SlotOne = SlotOne
	
	local SlotTwo = nil
	
	SlotTwo = MenuBuilder.BuildRegisteredType( "FramedAttachment", {
		controllerIndex = f1_local1
	} )
	SlotTwo.id = "SlotTwo"
	SlotTwo.OpticsIcon:SetAlpha( 0, 0 )
	SlotTwo:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 135, _1080p * 61.66, _1080p * 121.32 )
	self:addElement( SlotTwo )
	self.SlotTwo = SlotTwo
	
	local SlotThree = nil
	
	SlotThree = MenuBuilder.BuildRegisteredType( "FramedAttachment", {
		controllerIndex = f1_local1
	} )
	SlotThree.id = "SlotThree"
	SlotThree.OpticsIcon:SetAlpha( 0, 0 )
	SlotThree:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 135, _1080p * 123.32, _1080p * 182.98 )
	self:addElement( SlotThree )
	self.SlotThree = SlotThree
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_left", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg1.controller or f1_local1
		local f2_local1 = f2_arg0:getParent()
		if #f2_local1:getAllFocusedChildren() <= 0 then
			f2_local1 = f2_arg0:getParent()
			if f2_local1:isInFocus() then
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
	return self
end

MenuBuilder.registerType( "FramedAttachmentsSP", FramedAttachmentsSP )
LockTable( _M )
