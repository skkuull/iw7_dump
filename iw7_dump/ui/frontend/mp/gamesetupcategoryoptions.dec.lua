local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetAlignment( LUI.Alignment.Top )
	f1_arg0:SetIgnoreStretchingChildren( true )
	f1_arg0:SetAdjustSizeToContent( true )
end

function GameSetupCategoryOptions( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 800 * _1080p, 0, 800 * _1080p )
	self.id = "GameSetupCategoryOptions"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	self:SetSpacing( 7 )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "GameSetupCategoryOptions", GameSetupCategoryOptions )
LockTable( _M )
