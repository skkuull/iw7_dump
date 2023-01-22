local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function StreakSelected( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 132 * _1080p, 0, 20 * _1080p )
	self.id = "StreakSelected"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Message = nil
	
	Message = MenuBuilder.BuildRegisteredType( "CaCSelectedMessage", {
		controllerIndex = f1_local1
	} )
	Message.id = "Message"
	Message:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 20 )
	self:addElement( Message )
	self.Message = Message
	
	self:SubscribeToModelThroughElement( self, "isSelected", function ()
		local f2_local0 = self:GetDataSource()
		if f2_local0.isSelected:GetValue( f1_local1 ) ~= nil then
			f2_local0 = self:GetDataSource()
			if f2_local0.isSelected:GetValue( f1_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Message",
					sequenceName = "Activate",
					elementPath = "Message"
				} )
			end
		end
		f2_local0 = self:GetDataSource()
		if f2_local0.isSelected:GetValue( f1_local1 ) ~= nil then
			f2_local0 = self:GetDataSource()
			if f2_local0.isSelected:GetValue( f1_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Message",
					sequenceName = "Inactive",
					elementPath = "Message"
				} )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "StreakSelected", StreakSelected )
LockTable( _M )
