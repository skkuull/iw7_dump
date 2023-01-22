local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARMinimap( f1_arg0, f1_arg1 )
	if not f1_arg1 then
		f1_arg1 = {}
	end
	local self = LUI.UIElement.new( {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true
	} )
	self.id = "AARMinimap"
	f1_arg1.killMarkerColor = GetIntForColor( SWATCHES.AAR.KillsColor )
	f1_arg1.deathMarkerColor = GetIntForColor( SWATCHES.AAR.DeathsColor )
	f1_arg1.markerMaterial = f1_arg1.markerMaterial or "icon_slot_buy"
	self:SetupAARMinimap( f1_arg1 )
	return self
end

MenuBuilder.registerType( "AARMinimap", AARMinimap )
LockTable( _M )
