local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleHipAtomizer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p )
	self.id = "ReticleHipAtomizer"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TopDot = nil
	
	TopDot = LUI.UIImage.new()
	TopDot.id = "TopDot"
	TopDot:SetScale( 0.5, 0 )
	TopDot:setImage( RegisterMaterial( "hud_outlined_dot" ), 0 )
	TopDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -12, _1080p * -8 )
	TopDot:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f1_local1 ) )
	self:addElement( TopDot )
	self.TopDot = TopDot
	
	local RightDot = nil
	
	RightDot = LUI.UIImage.new()
	RightDot.id = "RightDot"
	RightDot:SetScale( 0.5, 0 )
	RightDot:setImage( RegisterMaterial( "hud_outlined_dot" ), 0 )
	RightDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 8, _1080p * 12, _1080p * -2, _1080p * 2 )
	RightDot:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f1_local1 ) )
	self:addElement( RightDot )
	self.RightDot = RightDot
	
	local BottomDot = nil
	
	BottomDot = LUI.UIImage.new()
	BottomDot.id = "BottomDot"
	BottomDot:SetScale( 0.5, 0 )
	BottomDot:setImage( RegisterMaterial( "hud_outlined_dot" ), 0 )
	BottomDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * 8, _1080p * 12 )
	BottomDot:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f1_local1 ) )
	self:addElement( BottomDot )
	self.BottomDot = BottomDot
	
	local LeftDot = nil
	
	LeftDot = LUI.UIImage.new()
	LeftDot.id = "LeftDot"
	LeftDot:SetScale( 0.5, 0 )
	LeftDot:setImage( RegisterMaterial( "hud_outlined_dot" ), 0 )
	LeftDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * -8, _1080p * -2, _1080p * 2 )
	LeftDot:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f1_local1 ) )
	self:addElement( LeftDot )
	self.LeftDot = LeftDot
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TopDot:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TopDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -13, _1080p * -9, 0 )
				end,
				function ()
					return self.TopDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -8, _1080p * -4, 19, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.TopDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -22, _1080p * -18, 109, LUI.EASING.outBack )
				end,
				function ()
					return self.TopDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -12, _1080p * -8, 170, LUI.EASING.inOutBack )
				end
			}
		} )
		RightDot:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.RightDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 9, _1080p * 13, _1080p * -2, _1080p * 2, 0 )
				end,
				function ()
					return self.RightDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 4, _1080p * 8, _1080p * -2, _1080p * 2, 19, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.RightDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 18, _1080p * 22, _1080p * -2, _1080p * 2, 109, LUI.EASING.outBack )
				end,
				function ()
					return self.RightDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 8, _1080p * 12, _1080p * -2, _1080p * 2, 170, LUI.EASING.inOutBack )
				end
			}
		} )
		BottomDot:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.BottomDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * 8.8, _1080p * 12.8, 0 )
				end,
				function ()
					return self.BottomDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * 4, _1080p * 8, 19, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.BottomDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * 17, _1080p * 21, 109, LUI.EASING.outBack )
				end,
				function ()
					return self.BottomDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * 8, _1080p * 12, 170, LUI.EASING.inOutBack )
				end
			}
		} )
		LeftDot:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.LeftDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -13, _1080p * -9, _1080p * -2, _1080p * 2, 0 )
				end,
				function ()
					return self.LeftDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * -4, _1080p * -2, _1080p * 2, 19, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.LeftDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * -20, _1080p * -2, _1080p * 2, 109, LUI.EASING.outBack )
				end,
				function ()
					return self.LeftDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * -8, _1080p * -2, _1080p * 2, 170, LUI.EASING.inOutBack )
				end
			}
		} )
		self._sequences.OnFire = function ()
			TopDot:AnimateSequence( "OnFire" )
			RightDot:AnimateSequence( "OnFire" )
			BottomDot:AnimateSequence( "OnFire" )
			LeftDot:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
	end )
	return self
end

MenuBuilder.registerType( "ReticleHipAtomizer", ReticleHipAtomizer )
LockTable( _M )
