local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function VariantsButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 28 * _1080p, 0, 28 * _1080p )
	self.id = "VariantsButton"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:setImage( RegisterMaterial( "icon_cac_pc_streak_rarity" ), 0 )
	self:addElement( Icon )
	self.Icon = Icon
	
	return self
end

MenuBuilder.registerType( "VariantsButton", VariantsButton )
LockTable( _M )
