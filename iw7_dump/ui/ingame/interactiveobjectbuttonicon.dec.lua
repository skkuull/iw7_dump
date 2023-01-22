local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "icon", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.icon:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			f1_arg0.Image0:setImage( RegisterMaterial( f2_local0 ), 0 )
			f1_arg0.Image0:SetLeftAnchor( -Engine.GetMaterialAspectRatio( f1_arg0.Image0:GetImage() ) + 1 )
		end
	end )
end

function InteractiveObjectButtonIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "InteractiveObjectButtonIcon"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Image0 = nil
	
	Image0 = LUI.UIImage.new()
	Image0.id = "Image0"
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local HoldButtonPrompt = nil
	
	HoldButtonPrompt = LUI.UIImage.new()
	HoldButtonPrompt.id = "HoldButtonPrompt"
	HoldButtonPrompt:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	HoldButtonPrompt:SetAlpha( 0, 0 )
	HoldButtonPrompt:SetScale( -0.6, 0 )
	HoldButtonPrompt:setImage( RegisterMaterial( "dpad_circle_whole" ), 0 )
	HoldButtonPrompt:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	self:addElement( HoldButtonPrompt )
	self.HoldButtonPrompt = HoldButtonPrompt
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Image0:RegisterAnimationSequence( "Mash", {
			{
				function ()
					return self.Image0:SetScale( 0, 0 )
				end,
				function ()
					return self.Image0:SetScale( 0.3, 60, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Image0:SetScale( 0, 180, LUI.EASING.inOutCubic )
				end
			}
		} )
		self._sequences.Mash = function ()
			Image0:AnimateLoop( "Mash" )
		end
		
		Image0:RegisterAnimationSequence( "DontMash", {
			{
				function ()
					return self.Image0:SetScale( 0, 0 )
				end
			}
		} )
		self._sequences.DontMash = function ()
			Image0:AnimateSequence( "DontMash" )
		end
		
		HoldButtonPrompt:RegisterAnimationSequence( "Hold", {
			{
				function ()
					return self.HoldButtonPrompt:SetScale( -0.6, 0 )
				end,
				function ()
					return self.HoldButtonPrompt:SetScale( -0.4, 880 )
				end
			},
			{
				function ()
					return self.HoldButtonPrompt:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HoldButtonPrompt:SetAlpha( 0, 880 )
				end
			}
		} )
		self._sequences.Hold = function ()
			HoldButtonPrompt:AnimateLoop( "Hold" )
		end
		
		HoldButtonPrompt:RegisterAnimationSequence( "DontHold", {
			{
				function ()
					return self.HoldButtonPrompt:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DontHold = function ()
			HoldButtonPrompt:AnimateSequence( "DontHold" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "InteractiveObjectButtonIcon", InteractiveObjectButtonIcon )
LockTable( _M )
