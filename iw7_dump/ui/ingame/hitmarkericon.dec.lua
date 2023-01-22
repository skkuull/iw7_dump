local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	if f1_arg0 ~= nil then
		return Engine.TableLookup( CSV.hitMarkerIcons.file, CSV.hitMarkerIcons.cols.ref, f1_arg0, CSV.hitMarkerIcons.cols.material )
	else
		
	end
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f0_local0( f2_arg1 )
	if f2_local0 and f2_local0 ~= "" then
		f2_arg0.HitMarkerIcon:setImage( RegisterMaterial( f2_local0 ), 0 )
	end
	f2_arg0.iconMaterial = f2_local0
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.HitMarkerIcon )
	f3_arg0:SubscribeToModel( DataSources.inGame.HUD.hitMarker.iconType:GetModel( f3_arg1 ), function ()
		f0_local1( f3_arg0, DataSources.inGame.HUD.hitMarker.iconType:GetValue( f3_arg1 ) )
	end )
	local f3_local0 = function ()
		local f5_local0 = DataSources.inGame.HUD.hitMarker.iconType:GetValue( f3_arg1 )
		if not f3_arg0.iconMaterial then
			f0_local1( f3_arg0, f5_local0 )
		end
		if f5_local0 and string.lower( f5_local0 ) ~= "default" and not CONDITIONS.IsCinematicCameraActive( f3_arg0 ) and f3_arg0.iconMaterial and f3_arg0.iconMaterial ~= "" then
			ACTIONS.AnimateSequence( f3_arg0, "Hit" )
		end
	end
	
	f3_arg0.iconMaterial = nil
	f3_arg0:SubscribeToModel( DataSources.inGame.HUD.hitMarker.iconTypeNotifySource:GetModel( f3_arg1 ), f3_local0, true )
end

function HitMarkerIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 48 * _1080p, 0, 48 * _1080p )
	self.id = "HitMarkerIcon"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local HitMarkerIcon = nil
	
	HitMarkerIcon = LUI.UIImage.new()
	HitMarkerIcon.id = "HitMarkerIcon"
	HitMarkerIcon:SetAlpha( 0, 0 )
	self:addElement( HitMarkerIcon )
	self.HitMarkerIcon = HitMarkerIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		HitMarkerIcon:RegisterAnimationSequence( "Hit", {
			{
				function ()
					return self.HitMarkerIcon:SetAlpha( 1, 100 )
				end,
				function ()
					return self.HitMarkerIcon:SetAlpha( 0, 900 )
				end
			}
		} )
		self._sequences.Hit = function ()
			HitMarkerIcon:AnimateSequence( "Hit" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local2( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "HitMarkerIcon", HitMarkerIcon )
LockTable( _M )
