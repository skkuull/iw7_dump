local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.CompassElement, "WARNING: Compass HUD Items Are Missing..." )
	f1_arg0:SetDotPitchEnabled( true )
	f1_arg0:SetDotPitchX( 6, 0 )
	f1_arg0:SetDotPitchY( 3, 0 )
	f1_arg0:SetDotPitchContrast( 0.15, 0 )
	local f1_local0 = Engine.TableLookup( CSV.levels.file, CSV.levels.cols.name, Game.GetMapName(), CSV.levels.cols.isShipCrib )
	local f1_local1 = DataSources.inGame.SP.inSpace
	local f1_local2 = DataSources.inGame.SP.helmetState
	local f1_local3 = DataSources.inGame.player.currentWeapon.hideWeaponInfo
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), function ()
		if f1_local1:GetValue( f1_arg1 ) or f1_local0 then
			f1_arg0.CompassElement:setImage( RegisterMaterial( "compass_tickertape_space" ), 0 )
		else
			f1_arg0.CompassElement:setImage( RegisterMaterial( "compass_tickertape" ), 0 )
		end
	end )
	f1_arg0:registerOmnvarHandler( "ui_hide_hud", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f1_local2:GetValue( f1_arg1 ) == 1
		local f3_local1 = Game.GetOmnvar( "ui_hide_hud" ) == true
		if f3_local0 then
			local f3_local2
			if f3_local1 then
				f3_local2 = 0
				if not f3_local2 then
				
				else
					f3_arg0:SetAlpha( f3_local2, 200 )
				end
			end
			f3_local2 = 1
		end
	end )
	f1_arg0:SubscribeToModel( f1_local3:GetModel( f1_arg1 ), function ()
		local f4_local0 = f1_local2:GetValue( f1_arg1 ) == 1
		local f4_local1 = f1_local3:GetValue( f1_arg1 )
		if f4_local0 then
			local f4_local2
			if f4_local1 then
				f4_local2 = 0
				if not f4_local2 then
				
				else
					f1_arg0:SetAlpha( f4_local2, 200 )
				end
			end
			f4_local2 = 1
		end
	end )
	f1_arg0:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), function ()
		local f5_local0 = f1_local2:GetValue( f1_arg1 )
		if f5_local0 ~= nil then
			f1_arg0:SetAlpha( f5_local0, 200 )
		end
	end )
end

function CompassHUD( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 450 * _1080p, 0, 24 * _1080p )
	self.id = "CompassHUD"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local CompassElement = nil
	
	CompassElement = MenuBuilder.BuildRegisteredType( "Compass", {
		stretch = 0.85,
		controllerIndex = f6_local1
	} )
	CompassElement.id = "CompassElement"
	CompassElement:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	CompassElement:SetAlpha( 0.05, 0 )
	CompassElement:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -14, 0 )
	self:addElement( CompassElement )
	self.CompassElement = CompassElement
	
	local Accent = nil
	
	Accent = LUI.UIImage.new()
	Accent.id = "Accent"
	Accent:SetAlpha( 0.7, 0 )
	Accent:setImage( RegisterMaterial( "hud_sp_compass_accent" ), 0 )
	Accent:SetUseAA( true )
	Accent:SetBlendMode( BLEND_MODE.addWithAlpha )
	Accent:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -178, _1080p * 178, 0, _1080p * 8 )
	self:addElement( Accent )
	self.Accent = Accent
	
	f0_local0( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "CompassHUD", CompassHUD )
LockTable( _M )
