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

function Reticle17( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 20 * _1080p, 0, 20 * _1080p )
	self.id = "Reticle17"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local DotBaseL = nil
	
	DotBaseL = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBaseL.id = "DotBaseL"
	DotBaseL.DotShadow:SetRGBFromInt( 11600004, 0 )
	DotBaseL.Dot:SetRGBFromInt( 11600004, 0 )
	DotBaseL.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Highlight, 0 )
	DotBaseL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -5.5, _1080p * 1.5, _1080p * -3.5, _1080p * 3.5 )
	self:addElement( DotBaseL )
	self.DotBaseL = DotBaseL
	
	local DotBaseR = nil
	
	DotBaseR = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBaseR.id = "DotBaseR"
	DotBaseR.DotShadow:SetRGBFromInt( 11600004, 0 )
	DotBaseR.Dot:SetRGBFromInt( 11600004, 0 )
	DotBaseR.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Highlight, 0 )
	DotBaseR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -1.5, _1080p * 5.5, _1080p * -3.5, _1080p * 3.5 )
	self:addElement( DotBaseR )
	self.DotBaseR = DotBaseR
	
	local DotBaseT = nil
	
	DotBaseT = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBaseT.id = "DotBaseT"
	DotBaseT.DotShadow:SetRGBFromInt( 11600004, 0 )
	DotBaseT.Dot:SetRGBFromInt( 11600004, 0 )
	DotBaseT.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Highlight, 0 )
	DotBaseT:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -3.5, _1080p * 3.5, _1080p * -5.5, _1080p * 1.5 )
	self:addElement( DotBaseT )
	self.DotBaseT = DotBaseT
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DotBaseL:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotBaseL:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.DotBaseL.DotHighlight:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.DotBaseL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 2, _1080p * 8, _1080p * -10, _1080p * -4, 59 )
				end
			}
		} )
		DotBaseR:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotBaseR:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.DotBaseR.DotHighlight:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.DotBaseR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -8, _1080p * -2, _1080p * -10, _1080p * -4, 59 )
				end
			}
		} )
		DotBaseT:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotBaseT:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.DotBaseT.DotHighlight:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.DotBaseT:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -3, _1080p * 3, _1080p * 2, _1080p * 8, 59 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			DotBaseL:AnimateSequence( "ADSIN" )
			DotBaseR:AnimateSequence( "ADSIN" )
			DotBaseT:AnimateSequence( "ADSIN" )
		end
		
		DotBaseL:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBaseL:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.DotBaseL:SetAlpha( 0.5, 60 )
				end
			},
			{
				function ()
					return self.DotBaseL.DotHighlight:SetAlpha( 0, 60 )
				end
			},
			{
				function ()
					return self.DotBaseL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -2, _1080p * 4, _1080p * -6, 0, 59 )
				end
			}
		} )
		DotBaseR:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBaseR:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.DotBaseR:SetAlpha( 0.5, 60 )
				end
			},
			{
				function ()
					return self.DotBaseR.DotHighlight:SetAlpha( 0, 60 )
				end
			},
			{
				function ()
					return self.DotBaseR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -4, _1080p * 2, _1080p * -6, 0, 59 )
				end
			}
		} )
		DotBaseT:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBaseT:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.DotBaseT:SetAlpha( 0.5, 60 )
				end
			},
			{
				function ()
					return self.DotBaseT.DotHighlight:SetAlpha( 0, 60 )
				end
			},
			{
				function ()
					return self.DotBaseT:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -3, _1080p * 3, _1080p * -2, _1080p * 4, 59 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			DotBaseL:AnimateLoop( "ADSOUT" )
			DotBaseR:AnimateLoop( "ADSOUT" )
			DotBaseT:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle17", Reticle17 )
LockTable( _M )
