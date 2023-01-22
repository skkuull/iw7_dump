local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.5
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

function ReticleLauncherGrid( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 375 * _1080p, 0, 175 * _1080p )
	self.id = "ReticleLauncherGrid"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local GridShadow = nil
	
	GridShadow = LUI.UIImage.new()
	GridShadow.id = "GridShadow"
	GridShadow:SetRGBFromInt( 32013, 0 )
	GridShadow:SetAlpha( 0.4, 0 )
	GridShadow:SetYRotation( -10, 0 )
	GridShadow:SetZRotation( -3, 0 )
	GridShadow:SetScale( 0.15, 0 )
	GridShadow:setImage( RegisterMaterial( "hud_reticle_launcher_grid" ), 0 )
	GridShadow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -1, _1080p * 1, _1080p * -0.5, _1080p * 0.5 )
	self:addElement( GridShadow )
	self.GridShadow = GridShadow
	
	local Grid = nil
	
	Grid = LUI.UIImage.new()
	Grid.id = "Grid"
	Grid:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	Grid:SetAlpha( 0.6, 0 )
	Grid:SetYRotation( -10, 0 )
	Grid:SetZRotation( -3, 0 )
	Grid:SetScale( 0.15, 0 )
	Grid:setImage( RegisterMaterial( "hud_reticle_launcher_grid" ), 0 )
	Grid:SetBlendMode( BLEND_MODE.addWithAlpha )
	Grid:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Grid )
	self.Grid = Grid
	
	local RightShadow = nil
	
	RightShadow = LUI.UIImage.new()
	RightShadow.id = "RightShadow"
	RightShadow:SetRGBFromInt( 32013, 0 )
	RightShadow:SetAlpha( 0.4, 0 )
	RightShadow:SetZRotation( 87, 0 )
	RightShadow:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	RightShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9, _1080p * 29, _1080p * -1.5, _1080p * 1.5 )
	self:addElement( RightShadow )
	self.RightShadow = RightShadow
	
	local BottomShadow = nil
	
	BottomShadow = LUI.UIImage.new()
	BottomShadow.id = "BottomShadow"
	BottomShadow:SetRGBFromInt( 32013, 0 )
	BottomShadow:SetAlpha( 0.4, 0 )
	BottomShadow:SetZRotation( -3, 0 )
	BottomShadow:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	BottomShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * 17, _1080p * 20 )
	self:addElement( BottomShadow )
	self.BottomShadow = BottomShadow
	
	local LeftShadow = nil
	
	LeftShadow = LUI.UIImage.new()
	LeftShadow.id = "LeftShadow"
	LeftShadow:SetRGBFromInt( 32013, 0 )
	LeftShadow:SetAlpha( 0.4, 0 )
	LeftShadow:SetZRotation( 87, 0 )
	LeftShadow:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	LeftShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -29, _1080p * 9, _1080p * -1.5, _1080p * 1.5 )
	self:addElement( LeftShadow )
	self.LeftShadow = LeftShadow
	
	local TopShadow = nil
	
	TopShadow = LUI.UIImage.new()
	TopShadow.id = "TopShadow"
	TopShadow:SetRGBFromInt( 32013, 0 )
	TopShadow:SetAlpha( 0.4, 0 )
	TopShadow:SetZRotation( -3, 0 )
	TopShadow:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	TopShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * -20, _1080p * -17 )
	self:addElement( TopShadow )
	self.TopShadow = TopShadow
	
	local Top = nil
	
	Top = LUI.UIImage.new()
	Top.id = "Top"
	Top:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	Top:SetAlpha( 0.6, 0 )
	Top:SetZRotation( -3, 0 )
	Top:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	Top:SetUseAA( true )
	Top:SetBlendMode( BLEND_MODE.addWithAlpha )
	Top:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * -20, _1080p * -17 )
	self:addElement( Top )
	self.Top = Top
	
	local Left = nil
	
	Left = LUI.UIImage.new()
	Left.id = "Left"
	Left:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	Left:SetAlpha( 0.6, 0 )
	Left:SetZRotation( 87, 0 )
	Left:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	Left:SetUseAA( true )
	Left:SetBlendMode( BLEND_MODE.addWithAlpha )
	Left:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -29, _1080p * 9, _1080p * -1.5, _1080p * 1.5 )
	self:addElement( Left )
	self.Left = Left
	
	local Right = nil
	
	Right = LUI.UIImage.new()
	Right.id = "Right"
	Right:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	Right:SetAlpha( 0.6, 0 )
	Right:SetZRotation( 87, 0 )
	Right:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	Right:SetUseAA( true )
	Right:SetBlendMode( BLEND_MODE.addWithAlpha )
	Right:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9, _1080p * 29, _1080p * -1.5, _1080p * 1.5 )
	self:addElement( Right )
	self.Right = Right
	
	local Bottom = nil
	
	Bottom = LUI.UIImage.new()
	Bottom.id = "Bottom"
	Bottom:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	Bottom:SetAlpha( 0.6, 0 )
	Bottom:SetZRotation( -3, 0 )
	Bottom:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	Bottom:SetUseAA( true )
	Bottom:SetBlendMode( BLEND_MODE.addWithAlpha )
	Bottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * 17, _1080p * 20 )
	self:addElement( Bottom )
	self.Bottom = Bottom
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		GridShadow:RegisterAnimationSequence( "EnemyAim", {
			{
				function ()
					return self.GridShadow:SetRGBFromTable( SWATCHES.Reticles.DarkRed, 100 )
				end
			},
			{
				function ()
					return self.GridShadow:SetBlendMode( BLEND_MODE.disabled )
				end
			},
			{
				function ()
					return self.GridShadow:SetAlpha( 0.8, 100 )
				end
			}
		} )
		Grid:RegisterAnimationSequence( "EnemyAim", {
			{
				function ()
					return self.Grid:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.Grid:SetAlpha( 0.6, 100 )
				end
			}
		} )
		RightShadow:RegisterAnimationSequence( "EnemyAim", {
			{
				function ()
					return self.RightShadow:SetRGBFromTable( SWATCHES.Reticles.DarkRed, 100 )
				end
			},
			{
				function ()
					return self.RightShadow:SetAlpha( 0.8, 100 )
				end
			},
			{
				function ()
					return self.RightShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 15, _1080p * -1.5, _1080p * 1.5, 100 )
				end
			}
		} )
		BottomShadow:RegisterAnimationSequence( "EnemyAim", {
			{
				function ()
					return self.BottomShadow:SetRGBFromTable( SWATCHES.Reticles.DarkRed, 100 )
				end
			},
			{
				function ()
					return self.BottomShadow:SetAlpha( 0.8, 100 )
				end
			},
			{
				function ()
					return self.BottomShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -7, _1080p * 7, _1080p * 7, _1080p * 10, 100 )
				end
			}
		} )
		LeftShadow:RegisterAnimationSequence( "EnemyAim", {
			{
				function ()
					return self.LeftShadow:SetRGBFromTable( SWATCHES.Reticles.DarkRed, 100 )
				end
			},
			{
				function ()
					return self.LeftShadow:SetAlpha( 0.8, 100 )
				end
			},
			{
				function ()
					return self.LeftShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -15, _1080p * 3, _1080p * -1.5, _1080p * 1.5, 100 )
				end
			}
		} )
		TopShadow:RegisterAnimationSequence( "EnemyAim", {
			{
				function ()
					return self.TopShadow:SetRGBFromTable( SWATCHES.Reticles.DarkRed, 100 )
				end
			},
			{
				function ()
					return self.TopShadow:SetAlpha( 0.8, 100 )
				end
			},
			{
				function ()
					return self.TopShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -6, _1080p * 6, _1080p * -10, _1080p * -7, 100 )
				end
			}
		} )
		Top:RegisterAnimationSequence( "EnemyAim", {
			{
				function ()
					return self.Top:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.Top:SetAlpha( 0.2, 100 )
				end
			},
			{
				function ()
					return self.Top:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -7, _1080p * 7, _1080p * -10, _1080p * -7, 100 )
				end
			}
		} )
		Left:RegisterAnimationSequence( "EnemyAim", {
			{
				function ()
					return self.Left:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.Left:SetAlpha( 0.2, 100 )
				end
			},
			{
				function ()
					return self.Left:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -15, _1080p * 3, _1080p * -1.5, _1080p * 1.5, 100 )
				end
			}
		} )
		Right:RegisterAnimationSequence( "EnemyAim", {
			{
				function ()
					return self.Right:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.Right:SetAlpha( 0.2, 100 )
				end
			},
			{
				function ()
					return self.Right:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 15, _1080p * -1.5, _1080p * 1.5, 100 )
				end
			}
		} )
		Bottom:RegisterAnimationSequence( "EnemyAim", {
			{
				function ()
					return self.Bottom:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.Bottom:SetAlpha( 0.2, 100 )
				end
			},
			{
				function ()
					return self.Bottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -7, _1080p * 7, _1080p * 7, _1080p * 10, 100 )
				end
			}
		} )
		self._sequences.EnemyAim = function ()
			GridShadow:AnimateSequence( "EnemyAim" )
			Grid:AnimateSequence( "EnemyAim" )
			RightShadow:AnimateSequence( "EnemyAim" )
			BottomShadow:AnimateSequence( "EnemyAim" )
			LeftShadow:AnimateSequence( "EnemyAim" )
			TopShadow:AnimateSequence( "EnemyAim" )
			Top:AnimateSequence( "EnemyAim" )
			Left:AnimateSequence( "EnemyAim" )
			Right:AnimateSequence( "EnemyAim" )
			Bottom:AnimateSequence( "EnemyAim" )
		end
		
		GridShadow:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.GridShadow:SetRGBFromInt( 32013, 120 )
				end
			}
		} )
		Grid:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.Grid:SetAlpha( 0.4, 60 )
				end,
				function ()
					return self.Grid:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.Grid:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 120 )
				end
			}
		} )
		RightShadow:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.RightShadow:SetRGBFromInt( 32013, 120 )
				end
			},
			{
				function ()
					return self.RightShadow:SetAlpha( 0.4, 120 )
				end
			},
			{
				function ()
					return self.RightShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9, _1080p * 29, _1080p * -1.5, _1080p * 1.5, 119 )
				end
			}
		} )
		BottomShadow:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.BottomShadow:SetRGBFromInt( 32013, 120 )
				end
			},
			{
				function ()
					return self.BottomShadow:SetAlpha( 0.4, 120 )
				end
			},
			{
				function ()
					return self.BottomShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * 17, _1080p * 20, 119 )
				end
			}
		} )
		LeftShadow:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.LeftShadow:SetRGBFromInt( 32013, 120 )
				end
			},
			{
				function ()
					return self.LeftShadow:SetAlpha( 0.4, 120 )
				end
			},
			{
				function ()
					return self.LeftShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -29, _1080p * 9, _1080p * -1.5, _1080p * 1.5, 119 )
				end
			}
		} )
		TopShadow:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.TopShadow:SetRGBFromInt( 32013, 120 )
				end
			},
			{
				function ()
					return self.TopShadow:SetAlpha( 0.4, 120 )
				end
			},
			{
				function ()
					return self.TopShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * -20, _1080p * -17, 119 )
				end
			}
		} )
		Top:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.Top:SetAlpha( 0.4, 60 )
				end,
				function ()
					return self.Top:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.Top:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 120 )
				end
			},
			{
				function ()
					return self.Top:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * -20, _1080p * -17, 119 )
				end
			}
		} )
		Left:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.Left:SetAlpha( 0.4, 60 )
				end,
				function ()
					return self.Left:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.Left:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 120 )
				end
			},
			{
				function ()
					return self.Left:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -29, _1080p * 9, _1080p * -1.5, _1080p * 1.5, 119 )
				end
			}
		} )
		Right:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.Right:SetAlpha( 0.4, 60 )
				end,
				function ()
					return self.Right:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.Right:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 120 )
				end
			},
			{
				function ()
					return self.Right:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9, _1080p * 29, _1080p * -1.5, _1080p * 1.5, 119 )
				end
			}
		} )
		Bottom:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.Bottom:SetAlpha( 0.4, 60 )
				end,
				function ()
					return self.Bottom:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.Bottom:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 120 )
				end
			},
			{
				function ()
					return self.Bottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * 17, _1080p * 20, 119 )
				end
			}
		} )
		self._sequences.Idle = function ()
			GridShadow:AnimateLoop( "Idle" )
			Grid:AnimateLoop( "Idle" )
			RightShadow:AnimateLoop( "Idle" )
			BottomShadow:AnimateLoop( "Idle" )
			LeftShadow:AnimateLoop( "Idle" )
			TopShadow:AnimateLoop( "Idle" )
			Top:AnimateLoop( "Idle" )
			Left:AnimateLoop( "Idle" )
			Right:AnimateLoop( "Idle" )
			Bottom:AnimateLoop( "Idle" )
		end
		
		GridShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.GridShadow:SetZRotation( -0.8, 60 )
				end
			},
			{
				function ()
					return self.GridShadow:SetYRotation( 0, 60 )
				end
			}
		} )
		Grid:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Grid:SetZRotation( -0.8, 60 )
				end
			},
			{
				function ()
					return self.Grid:SetYRotation( 0, 60 )
				end
			}
		} )
		RightShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RightShadow:SetZRotation( 89.2, 60 )
				end
			}
		} )
		BottomShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.BottomShadow:SetZRotation( -0.8, 60 )
				end
			}
		} )
		LeftShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LeftShadow:SetZRotation( 89.2, 60 )
				end
			}
		} )
		TopShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.TopShadow:SetZRotation( -0.8, 60 )
				end
			}
		} )
		Top:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Top:SetZRotation( -0.8, 60 )
				end
			}
		} )
		Left:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Left:SetZRotation( 89.2, 60 )
				end
			}
		} )
		Right:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Right:SetZRotation( 89.2, 60 )
				end
			}
		} )
		Bottom:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Bottom:SetZRotation( -0.8, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			GridShadow:AnimateSequence( "ADSIN" )
			Grid:AnimateSequence( "ADSIN" )
			RightShadow:AnimateSequence( "ADSIN" )
			BottomShadow:AnimateSequence( "ADSIN" )
			LeftShadow:AnimateSequence( "ADSIN" )
			TopShadow:AnimateSequence( "ADSIN" )
			Top:AnimateSequence( "ADSIN" )
			Left:AnimateSequence( "ADSIN" )
			Right:AnimateSequence( "ADSIN" )
			Bottom:AnimateSequence( "ADSIN" )
		end
		
		GridShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.GridShadow:SetZRotation( -3, 60 )
				end
			},
			{
				function ()
					return self.GridShadow:SetYRotation( -10, 60 )
				end
			}
		} )
		Grid:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Grid:SetZRotation( -3, 60 )
				end
			},
			{
				function ()
					return self.Grid:SetYRotation( -10, 60 )
				end
			}
		} )
		RightShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RightShadow:SetZRotation( 87, 60 )
				end
			}
		} )
		BottomShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.BottomShadow:SetZRotation( -4, 60 )
				end
			}
		} )
		LeftShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.LeftShadow:SetZRotation( 87, 60 )
				end
			}
		} )
		TopShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.TopShadow:SetZRotation( -4, 60 )
				end
			}
		} )
		Top:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Top:SetZRotation( -4, 60 )
				end
			}
		} )
		Left:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Left:SetZRotation( 87, 60 )
				end
			}
		} )
		Right:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Right:SetZRotation( 87, 60 )
				end
			}
		} )
		Bottom:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Bottom:SetZRotation( -4, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			GridShadow:AnimateSequence( "ADSOUT" )
			Grid:AnimateSequence( "ADSOUT" )
			RightShadow:AnimateSequence( "ADSOUT" )
			BottomShadow:AnimateSequence( "ADSOUT" )
			LeftShadow:AnimateSequence( "ADSOUT" )
			TopShadow:AnimateSequence( "ADSOUT" )
			Top:AnimateSequence( "ADSOUT" )
			Left:AnimateSequence( "ADSOUT" )
			Right:AnimateSequence( "ADSOUT" )
			Bottom:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.weaponIsLockedOn:GetModel( f3_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.weaponIsLockedOn:GetValue( f3_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.weaponIsLockedOn:GetValue( f3_local1 ) == true then
			ACTIONS.AnimateSequence( self, "EnemyAim" )
		end
		if DataSources.inGame.player.currentWeapon.weaponIsLockedOn:GetValue( f3_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.weaponIsLockedOn:GetValue( f3_local1 ) == false then
			ACTIONS.AnimateSequence( self, "Idle" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "Idle" )
	return self
end

MenuBuilder.registerType( "ReticleLauncherGrid", ReticleLauncherGrid )
LockTable( _M )
