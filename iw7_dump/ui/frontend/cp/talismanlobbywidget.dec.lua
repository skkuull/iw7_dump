local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = nil
	local f1_local1 = Engine.GetDvarString( "ui_mapname" )
	if f1_local1 == "cp_zmb" then
		f1_local0 = "item_1"
	elseif f1_local1 == "cp_rave" then
		f1_local0 = "item_2"
	elseif f1_local1 == "cp_disco" then
		f1_local0 = "item_3"
	elseif f1_local1 == "cp_town" then
		f1_local0 = "item_4"
	elseif f1_local1 == "cp_final" then
		f1_local0 = "item_5"
	end
	if f1_local0 ~= nil and CONDITIONS.HasMapTalisman( f1_arg1, f1_local0 ) then
		f1_arg0.talismanFull:SetAlpha( 1, 0 )
	else
		f1_arg0.talismanFull:SetAlpha( 0, 0 )
	end
end

function TalismanLobbyWidget( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 131 * _1080p, 0, 131 * _1080p )
	self.id = "TalismanLobbyWidget"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	self:setUseStencil( true )
	local f2_local3 = nil
	if CONDITIONS.IsDirectorsCutAvailable( f2_local1 ) then
		f2_local3 = LUI.UIImage.new()
		f2_local3.id = "talismanEmpty"
		f2_local3:SetScale( -0.5, 0 )
		f2_local3:setImage( RegisterMaterial( "zm_directors_cut_talisman_empty" ), 0 )
		f2_local3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -62, _1080p * 194, _1080p * -64, _1080p * 192 )
		self:addElement( f2_local3 )
		self.talismanEmpty = f2_local3
	end
	local talismanFull = nil
	
	talismanFull = LUI.UIImage.new()
	talismanFull.id = "talismanFull"
	talismanFull:SetAlpha( 0, 0 )
	talismanFull:SetScale( -0.5, 0 )
	talismanFull:setImage( RegisterMaterial( "zm_directors_cut_talisman" ), 0 )
	talismanFull:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -62, _1080p * 194, _1080p * -64, _1080p * 192 )
	self:addElement( talismanFull )
	self.talismanFull = talismanFull
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "TalismanLobbyWidget", TalismanLobbyWidget )
LockTable( _M )
