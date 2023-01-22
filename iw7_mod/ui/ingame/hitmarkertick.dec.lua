local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.HitMarker:SubscribeToModel( DataSources.inGame.HUD.hitMarker.material:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f2_local0 ~= nil then
			f1_arg0.HitMarker:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
end

function HitMarkerTick( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 22 * _1080p, 0, 22 * _1080p )
	self.id = "HitMarkerTick"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local HitMarker = nil
	
	HitMarker = LUI.UIImage.new()
	HitMarker.id = "HitMarker"
	HitMarker:BindColorToModel( DataSources.inGame.HUD.hitMarker.color:GetModel( f3_local1 ) )
	HitMarker:BindScaleToModel( DataSources.inGame.HUD.hitMarker.scale:GetModel( f3_local1 ) )
	self:addElement( HitMarker )
	self.HitMarker = HitMarker
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "HitMarkerTick", HitMarkerTick )
LockTable( _M )
