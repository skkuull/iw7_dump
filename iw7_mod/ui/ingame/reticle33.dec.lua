local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.75
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f1_arg0.isVisible ~= true and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible ~= false and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			f1_arg0.isVisible = false
		end
	end )
end

function Reticle33( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "Reticle33"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local BottomS = nil
	
	BottomS = LUI.UIImage.new()
	BottomS.id = "BottomS"
	BottomS:SetZRotation( 90, 0 )
	BottomS:setImage( RegisterMaterial( "hud_reticle_33" ), 0 )
	BottomS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * 18, _1080p * 22 )
	BottomS:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f3_local1 ) )
	self:addElement( BottomS )
	self.BottomS = BottomS
	
	local RightS = nil
	
	RightS = LUI.UIImage.new()
	RightS.id = "RightS"
	RightS:SetZRotation( 180, 0 )
	RightS:setImage( RegisterMaterial( "hud_reticle_33" ), 0 )
	RightS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 1, _1080p * 17, _1080p * -2, _1080p * 2 )
	RightS:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f3_local1 ) )
	self:addElement( RightS )
	self.RightS = RightS
	
	local LeftS = nil
	
	LeftS = LUI.UIImage.new()
	LeftS.id = "LeftS"
	LeftS:setImage( RegisterMaterial( "hud_reticle_33" ), 0 )
	LeftS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -17, _1080p * -1, _1080p * -2, _1080p * 2 )
	LeftS:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f3_local1 ) )
	self:addElement( LeftS )
	self.LeftS = LeftS
	
	local Bottom = nil
	
	Bottom = LUI.UIImage.new()
	Bottom.id = "Bottom"
	Bottom:SetZRotation( 90, 0 )
	Bottom:setImage( RegisterMaterial( "hud_reticle_33" ), 0 )
	Bottom:SetBlendMode( BLEND_MODE.addWithAlpha )
	Bottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * 18, _1080p * 22 )
	Bottom:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f3_local1 ) )
	self:addElement( Bottom )
	self.Bottom = Bottom
	
	local Right = nil
	
	Right = LUI.UIImage.new()
	Right.id = "Right"
	Right:SetZRotation( 180, 0 )
	Right:setImage( RegisterMaterial( "hud_reticle_33" ), 0 )
	Right:SetBlendMode( BLEND_MODE.addWithAlpha )
	Right:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 1, _1080p * 17, _1080p * -2, _1080p * 2 )
	Right:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f3_local1 ) )
	self:addElement( Right )
	self.Right = Right
	
	local Left = nil
	
	Left = LUI.UIImage.new()
	Left.id = "Left"
	Left:setImage( RegisterMaterial( "hud_reticle_33" ), 0 )
	Left:SetBlendMode( BLEND_MODE.addWithAlpha )
	Left:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -17, _1080p * -1, _1080p * -2, _1080p * 2 )
	Left:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f3_local1 ) )
	self:addElement( Left )
	self.Left = Left
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BottomS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.BottomS:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.BottomS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -17, _1080p * 17, _1080p * 13, _1080p * 18, 59 )
				end
			}
		} )
		RightS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RightS:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.RightS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 18, _1080p * -3, _1080p * 2, 59 )
				end
			}
		} )
		LeftS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LeftS:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.LeftS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, 0, _1080p * -3, _1080p * 2, 59 )
				end
			}
		} )
		Bottom:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Bottom:SetAlpha( 0.8, 60 )
				end
			},
			{
				function ()
					return self.Bottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -15, _1080p * 15, _1080p * 13, _1080p * 16, 59 )
				end
			}
		} )
		Right:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Right:SetAlpha( 0.8, 60 )
				end
			},
			{
				function ()
					return self.Right:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 1, _1080p * 17, _1080p * -2, _1080p * 1, 59 )
				end
			}
		} )
		Left:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Left:SetAlpha( 0.8, 60 )
				end
			},
			{
				function ()
					return self.Left:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -17, _1080p * -1, _1080p * -2, _1080p * 1, 59 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			BottomS:AnimateSequence( "ADSIN" )
			RightS:AnimateSequence( "ADSIN" )
			LeftS:AnimateSequence( "ADSIN" )
			Bottom:AnimateSequence( "ADSIN" )
			Right:AnimateSequence( "ADSIN" )
			Left:AnimateSequence( "ADSIN" )
		end
		
		BottomS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.BottomS:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.BottomS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * 18, _1080p * 19, _1080p * 23, 59 )
				end
			}
		} )
		RightS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RightS:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.RightS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 6, _1080p * 18, _1080p * -3, _1080p * 1, 59 )
				end
			}
		} )
		LeftS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.LeftS:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.LeftS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * -6, _1080p * -3, _1080p * 1, 59 )
				end
			}
		} )
		Bottom:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Bottom:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Bottom:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.Bottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * 18, _1080p * 19, _1080p * 23, 59 )
				end
			}
		} )
		Right:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Right:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Right:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.Right:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 6, _1080p * 18, _1080p * -3, _1080p * 1, 59 )
				end
			}
		} )
		Left:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Left:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Left:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.Left:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * -6, _1080p * -3, _1080p * 1, 59 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			BottomS:AnimateLoop( "ADSOUT" )
			RightS:AnimateLoop( "ADSOUT" )
			LeftS:AnimateLoop( "ADSOUT" )
			Bottom:AnimateLoop( "ADSOUT" )
			Right:AnimateLoop( "ADSOUT" )
			Left:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle33", Reticle33 )
LockTable( _M )
