local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = DataSources.inGame.player.currentWeapon.clipAmmoMax
	local f1_local1 = function ()
		local f2_local0 = f1_arg0:GetDataSource()
		if not f2_local0 then
			return 
		else
			local f2_local1 = f2_local0:GetValue( f1_arg1 )
			local f2_local2 = f1_local0:GetValue( f1_arg1 )
			if not f2_local1 or not f2_local2 or f2_local2 == 0 then
				return 
			else
				f1_arg0.AmmoBarFill:SetLeftAnchor( 1 - (f2_local1 - f2_local2) / f2_local2 )
			end
		end
	end
	
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, nil, f1_local1 )
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.isDualWielding:GetModel( f1_arg1 ), f1_local1 )
end

function WeaponInfoAmmoBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 8 * _1080p )
	self.id = "WeaponInfoAmmoBar"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.6, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Gradient = nil
	
	Gradient = LUI.UIImage.new()
	Gradient.id = "Gradient"
	Gradient:SetRGBFromInt( 41727, 0 )
	Gradient:SetAlpha( 0.2, 0 )
	Gradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	Gradient:SetBlendMode( BLEND_MODE.addWithAlpha )
	Gradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 50 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local AmmoBarFill = nil
	
	AmmoBarFill = LUI.UIImage.new()
	AmmoBarFill.id = "AmmoBarFill"
	AmmoBarFill:SetRGBFromInt( 41727, 0 )
	AmmoBarFill:setImage( RegisterMaterial( "widg_gradient_left_to_right_opaque" ), 0 )
	AmmoBarFill:SetUseAA( true )
	AmmoBarFill:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * -1, 0, _1080p * -1 )
	self:addElement( AmmoBarFill )
	self.AmmoBarFill = AmmoBarFill
	
	local Frame = nil
	
	Frame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	} )
	Frame.id = "Frame"
	Frame:SetBorderThicknessTop( _1080p * 0, 0 )
	self:addElement( Frame )
	self.Frame = Frame
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AmmoBarFill:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.AmmoBarFill:SetRGBFromInt( 5949695, 80 )
				end,
				function ()
					return self.AmmoBarFill:SetRGBFromInt( 41727, 120, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Update = function ()
			AmmoBarFill:AnimateSequence( "Update" )
		end
		
		Gradient:RegisterAnimationSequence( "EnergyOn", {
			{
				function ()
					return self.Gradient:SetAlpha( 0.3, 400, LUI.EASING.outBack )
				end,
				function ()
					return self.Gradient:SetAlpha( 0.2, 200 )
				end
			},
			{
				function ()
					return self.Gradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, 0, 300 )
				end,
				function ()
					return self.Gradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 50, 99, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.EnergyOn = function ()
			Gradient:AnimateSequence( "EnergyOn" )
		end
		
		Gradient:RegisterAnimationSequence( "EnergyOff", {
			{
				function ()
					return self.Gradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 50, 0 )
				end,
				function ()
					return self.Gradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, 0, 200, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.EnergyOff = function ()
			Gradient:AnimateSequence( "EnergyOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "WeaponInfoAmmoBar", WeaponInfoAmmoBar )
LockTable( _M )
