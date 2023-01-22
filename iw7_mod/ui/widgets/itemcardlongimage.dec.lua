local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ItemCardLongImage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 150 * _1080p )
	self.id = "ItemCardLongImage"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetRGBFromInt( 10066329, 0 )
	Blur:SetBlurStrength( 2.75, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local Gradient = nil
	
	Gradient = LUI.UIImage.new()
	Gradient.id = "Gradient"
	Gradient:SetAlpha( 0, 0 )
	Gradient:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	Gradient:SetUseAA( true )
	Gradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -150, 0 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local Highlight = nil
	
	Highlight = LUI.UIImage.new()
	Highlight.id = "Highlight"
	Highlight:SetAlpha( 0, 0 )
	Highlight:SetScale( 0.3, 0 )
	Highlight:setImage( RegisterMaterial( "hud_glow" ), 0 )
	Highlight:SetBlendMode( BLEND_MODE.addWithAlpha )
	Highlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -150, _1080p * 150, _1080p * -75, _1080p * 75 )
	self:addElement( Highlight )
	self.Highlight = Highlight
	
	local UnavailableOverlay = nil
	
	UnavailableOverlay = LUI.UIImage.new()
	UnavailableOverlay.id = "UnavailableOverlay"
	UnavailableOverlay:SetAlpha( 0, 0 )
	UnavailableOverlay:setImage( RegisterMaterial( "inventory_blueprint_grid" ), 0 )
	self:addElement( UnavailableOverlay )
	self.UnavailableOverlay = UnavailableOverlay
	
	local TabLeft = nil
	
	TabLeft = LUI.UIImage.new()
	TabLeft.id = "TabLeft"
	TabLeft:SetRGBFromInt( 0, 0 )
	TabLeft:SetAlpha( 0.6, 0 )
	TabLeft:setImage( RegisterMaterial( "wdg_itemcard_tab" ), 0 )
	TabLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 16, _1080p * -44, _1080p * 44 )
	self:addElement( TabLeft )
	self.TabLeft = TabLeft
	
	local TabRight = nil
	
	TabRight = LUI.UIImage.new()
	TabRight.id = "TabRight"
	TabRight:SetRGBFromInt( 0, 0 )
	TabRight:SetAlpha( 0.6, 0 )
	TabRight:SetZRotation( 180, 0 )
	TabRight:setImage( RegisterMaterial( "wdg_itemcard_tab" ), 0 )
	TabRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -16, 0, _1080p * -44, _1080p * 44 )
	self:addElement( TabRight )
	self.TabRight = TabRight
	
	local ShadowTop = nil
	
	ShadowTop = LUI.UIImage.new()
	ShadowTop.id = "ShadowTop"
	ShadowTop:SetRGBFromInt( 0, 0 )
	ShadowTop:SetAlpha( 0.5, 0 )
	ShadowTop:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	ShadowTop:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 10 )
	self:addElement( ShadowTop )
	self.ShadowTop = ShadowTop
	
	local ShadowBottom = nil
	
	ShadowBottom = LUI.UIImage.new()
	ShadowBottom.id = "ShadowBottom"
	ShadowBottom:SetRGBFromInt( 0, 0 )
	ShadowBottom:SetAlpha( 0.5, 0 )
	ShadowBottom:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	ShadowBottom:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -10, 0 )
	self:addElement( ShadowBottom )
	self.ShadowBottom = ShadowBottom
	
	local LongImage = nil
	
	LongImage = LUI.UIImage.new()
	LongImage.id = "LongImage"
	LongImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -64, _1080p * 64 )
	LongImage:SubscribeToModelThroughElement( self, "image", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.image:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			LongImage:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( LongImage )
	self.LongImage = LongImage
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Highlight:RegisterAnimationSequence( "MK2Highlight", {
			{
				function ()
					return self.Highlight:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.Highlight:SetAlpha( 0.65, 1000, LUI.EASING.inSine )
				end,
				function ()
					return self.Highlight:SetAlpha( 0.6, 1000, LUI.EASING.inSine )
				end
			},
			{
				function ()
					return self.Highlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -134, _1080p * 134, _1080p * -75, _1080p * 75, 0 )
				end,
				function ()
					return self.Highlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -150, _1080p * 150, _1080p * -75, _1080p * 75, 1000, LUI.EASING.inSine )
				end,
				function ()
					return self.Highlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -134, _1080p * 134, _1080p * -75, _1080p * 75, 1000, LUI.EASING.inSine )
				end
			}
		} )
		self._sequences.MK2Highlight = function ()
			Highlight:AnimateLoop( "MK2Highlight" )
		end
		
		LongImage:RegisterAnimationSequence( "StreakRatio", {
			{
				function ()
					return self.LongImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -75, _1080p * 75, _1080p * -75, _1080p * 75, 0 )
				end
			}
		} )
		self._sequences.StreakRatio = function ()
			LongImage:AnimateSequence( "StreakRatio" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "ItemCardLongImage", ItemCardLongImage )
LockTable( _M )
