local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = 7
	local f1_local1 = 1
	local f1_local2 = 8
	local f1_local3 = {}
	local f1_local4 = RegisterMaterial( "hud_reticle_48" )
	local f1_local5 = RegisterMaterial( "hud_reticle_48b" )
	local f1_local6 = RegisterMaterial( "hud_reticle_48c" )
	local f1_local7 = RegisterMaterial( "hud_reticle_48d" )
	f1_local3 = f1_local4
	f1_local4 = {}
	for f1_local5 = 1, f1_local0, 1 do
		local f1_local8 = f1_local5
		table.insert( f1_local4, LUI.UIImage.new() )
	end
	f1_local5 = f1_local1 / f1_local2
	f1_local6 = f1_local5 * 1000
	f1_local7 = 200
	local f1_local8 = 100
	local f1_local9 = {}
	for f1_local10 = 1, 25, 1 do
		local f1_local13 = f1_local10
		local f1_local14 = {
			f1_local8
		}
		local f1_local15 = math.random( -190, -190 )
		for f1_local16 = 1, f1_local2, 1 do
			local f1_local19 = f1_local16
			f1_local15 = f1_local15 + f1_local5 * f1_local7
			table.insert( f1_local14, f1_local14[#f1_local14] + f1_local5 * f1_local15 )
		end
		table.insert( f1_local9, f1_local14 )
	end
	local f1_local10 = DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 )
	local f1_local11 = function ()
		if #f1_local4 == 0 then
			return 
		elseif DataModel.GetModelValue( f1_local10 ) < 0.75 then
			return 
		end
		local f2_local0 = f1_local4[#f1_local4]
		f1_local4[#f1_local4] = nil
		f1_arg0:addElement( f2_local0 )
		local f2_local1, f2_local2 = nil
		if math.random( 1, 4 ) == 1 then
			f2_local1 = f1_local3[math.random( 2, #f1_local3 )]
			f2_local2 = BLEND_MODE.disabled
		else
			f2_local1 = f1_local3[1]
			f2_local2 = BLEND_MODE.addWithAlpha
		end
		f2_local0:setImage( f2_local1 )
		f2_local0:SetBlendMode( f2_local2 )
		f2_local0:SetZRotation( -1080 + math.random() * 2160, 1200, LUI.EASING.outQuadratic )
		f2_local0:SetAlpha( 1 )
		local f2_local3 = f2_local0:SetAlpha( 0, f1_local1 * 1000, LUI.EASING.inQuartic )
		f2_local3.onComplete = function ()
			f1_arg0:removeElement( f2_local0 )
			table.insert( f1_local4, f2_local0 )
		end
		
		local f2_local4 = math.random( 5, 15 )
		f2_local0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, -f2_local4, f2_local4, f1_local8 + -f2_local4, f1_local8 + f2_local4 )
		local f2_local5 = math.random( -100, 100 )
		if math.random() > 0.5 then
			f2_local5 = -f2_local5
		end
		f2_local0.curve = f1_local9[math.random( 1, #f1_local9 )]
		f2_local0.dx = f2_local5
		f2_local0.step = 1
		f2_local0.size = f2_local4
	end
	
	f1_arg0:addElement( LUI.UITimer.new( nil, {
		interval = f1_local6,
		event = "updateBalls"
	} ) )
	f1_arg0:addEventHandler( "updateBalls", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg0:getFirstChild()
		while f4_local0 do
			if f4_local0.curve then
				f4_local0.step = f4_local0.step + 1
				local f4_local1 = f4_local0.curve[f4_local0.step]
				if f4_local1 then
					local f4_local2 = f4_local0.size
					f4_local0:SetTop( f4_local1 - f4_local2, f1_local6 )
					f4_local0:SetBottom( f4_local1 + f4_local2, f1_local6 )
					local f4_local3 = (f4_local0.step - 1) * f4_local0.dx * f1_local5
					f4_local0:SetLeft( f4_local3 - f4_local2, f1_local6 )
					f4_local0:SetRight( f4_local3 + f4_local2, f1_local6 )
				end
			end
			f4_local0 = f4_local0:getNextSibling()
		end
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f1_arg1 ), f1_local11, true )
end

function Reticle48( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "Reticle48"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local YellowDot = nil
	
	YellowDot = MenuBuilder.BuildRegisteredType( "YellowDot", {
		controllerIndex = f5_local1
	} )
	YellowDot.id = "YellowDot"
	YellowDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5 )
	self:addElement( YellowDot )
	self.YellowDot = YellowDot
	
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	Frame:setImage( RegisterMaterial( "hud_reticle_42" ), 0 )
	Frame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8 )
	Frame:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f5_local1 ), function ()
		local f6_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			Frame:SetAlpha( Add( f6_local0, -0.6 ), 0 )
		end
	end )
	self:addElement( Frame )
	self.Frame = Frame
	
	local Image0 = nil
	
	Image0 = LUI.UIImage.new()
	Image0.id = "Image0"
	Image0:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	Image0:setImage( RegisterMaterial( "hud_reticle_faded_dot" ), 0 )
	Image0:SetVMin( 0.5, 0 )
	Image0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -143, _1080p * 143, _1080p * 24, _1080p * 128 )
	Image0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f5_local1 ), function ()
		local f7_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f5_local1 )
		if f7_local0 ~= nil then
			Image0:SetAlpha( Add( f7_local0, -0.8 ), 0 )
		end
	end )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image0Copy0 = nil
	
	Image0Copy0 = LUI.UIImage.new()
	Image0Copy0.id = "Image0Copy0"
	Image0Copy0:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	Image0Copy0:SetZRotation( 180, 0 )
	Image0Copy0:setImage( RegisterMaterial( "hud_reticle_faded_dot" ), 0 )
	Image0Copy0:SetVMin( 0.5, 0 )
	Image0Copy0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -143, _1080p * 143, _1080p * 14, _1080p * 24 )
	Image0Copy0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f5_local1 ), function ()
		local f8_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f5_local1 )
		if f8_local0 ~= nil then
			Image0Copy0:SetAlpha( Add( f8_local0, -0.8 ), 0 )
		end
	end )
	self:addElement( Image0Copy0 )
	self.Image0Copy0 = Image0Copy0
	
	PostLoadFunc( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle48", Reticle48 )
LockTable( _M )
