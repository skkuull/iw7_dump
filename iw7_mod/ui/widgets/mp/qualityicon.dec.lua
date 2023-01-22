local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.SetDisplayQuality = function ( f2_arg0, f2_arg1, f2_arg2 )
		assert( f2_arg0.IconShadow )
		assert( f2_arg0.IconDuplicate )
		assert( f2_arg0.Icon )
		if f2_arg1 ~= nil and (f2_arg2 or f2_arg1 > Cac.LowestQuality) then
			local f2_local0 = Cac.GetLootQualityColor( f2_arg1 )
			f2_arg0.IconDuplicate:SetRGBFromInt( f2_local0, 0 )
			f2_arg0.Icon:SetRGBFromInt( f2_local0, 0 )
			local f2_local1 = Cac.GetLootQualityImage( f2_arg1 )
			f2_arg0.IconShadow:setImage( RegisterMaterial( f2_local1 ), 0 )
			f2_arg0.IconDuplicate:setImage( RegisterMaterial( f2_local1 .. "_mk2" ), 0 )
			f2_arg0.Icon:setImage( RegisterMaterial( f2_local1 ), 0 )
			f2_arg0:SetAlpha( 1, 0 )
		else
			f2_arg0:SetAlpha( 0, 0 )
		end
	end
	
end

function QualityIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "QualityIcon"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local IconShadow = nil
	
	IconShadow = LUI.UIImage.new()
	IconShadow.id = "IconShadow"
	IconShadow:SetRGBFromInt( 0, 0 )
	IconShadow:SetAlpha( 0, 0 )
	IconShadow:setImage( RegisterMaterial( "icon_item_quality_3" ), 0 )
	IconShadow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * 1, _1080p * 1, _1080p * 1 )
	self:addElement( IconShadow )
	self.IconShadow = IconShadow
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:setImage( RegisterMaterial( "icon_item_quality_3" ), 0 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local IconDuplicate = nil
	
	IconDuplicate = LUI.UIImage.new()
	IconDuplicate.id = "IconDuplicate"
	IconDuplicate:SetAlpha( 0, 0 )
	IconDuplicate:setImage( RegisterMaterial( "icon_item_quality_3_mk2" ), 0 )
	IconDuplicate:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( IconDuplicate )
	self.IconDuplicate = IconDuplicate
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		IconDuplicate:RegisterAnimationSequence( "LegendaryPulse", {
			{
				function ()
					return self.IconDuplicate:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.IconDuplicate:SetAlpha( 0.2, 1200, LUI.EASING.inSine )
				end,
				function ()
					return self.IconDuplicate:SetAlpha( 0.5, 1220, LUI.EASING.outSine )
				end,
				function ()
					return self.IconDuplicate:SetAlpha( 0.3, 960, LUI.EASING.inSine )
				end,
				function ()
					return self.IconDuplicate:SetAlpha( 0.5, 1290, LUI.EASING.outSine )
				end
			}
		} )
		self._sequences.LegendaryPulse = function ()
			IconDuplicate:AnimateLoop( "LegendaryPulse" )
		end
		
		IconDuplicate:RegisterAnimationSequence( "StopPulse", {
			{
				function ()
					return self.IconDuplicate:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.IconDuplicate:SetScale( 0, 0 )
				end
			}
		} )
		self._sequences.StopPulse = function ()
			IconDuplicate:AnimateSequence( "StopPulse" )
		end
		
		IconDuplicate:RegisterAnimationSequence( "LegendaryShine", {
			{
				function ()
					return self.IconDuplicate:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.LegendaryShine = function ()
			IconDuplicate:AnimateSequence( "LegendaryShine" )
		end
		
		IconDuplicate:RegisterAnimationSequence( "StopShine", {
			{
				function ()
					return self.IconDuplicate:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.StopShine = function ()
			IconDuplicate:AnimateSequence( "StopShine" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "QualityIcon", QualityIcon )
LockTable( _M )
