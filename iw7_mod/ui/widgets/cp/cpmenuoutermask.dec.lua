local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CPMenuOuterMask( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 512 * _1080p )
	self.id = "CPMenuOuterMask"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LargeMaskTop = nil
	
	LargeMaskTop = LUI.UIImage.new()
	LargeMaskTop.id = "LargeMaskTop"
	LargeMaskTop:SetRGBFromInt( 0, 0 )
	LargeMaskTop:SetAlpha( 0.6, 0 )
	self:addElement( LargeMaskTop )
	self.LargeMaskTop = LargeMaskTop
	
	local BorderWhite = nil
	
	BorderWhite = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	BorderWhite.id = "BorderWhite"
	BorderWhite:SetBorderThicknessLeft( _1080p * 2, 0 )
	BorderWhite:SetBorderThicknessRight( _1080p * 2, 0 )
	BorderWhite:SetBorderThicknessTop( _1080p * 2, 0 )
	BorderWhite:SetBorderThicknessBottom( _1080p * 2, 0 )
	BorderWhite:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -2, _1080p * 2, _1080p * -2, _1080p * 2 )
	self:addElement( BorderWhite )
	self.BorderWhite = BorderWhite
	
	local Border0 = nil
	
	Border0 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	Border0.id = "Border0"
	Border0:SetRGBFromInt( 5370369, 0 )
	Border0:SetBorderThicknessLeft( _1080p * 2, 0 )
	Border0:SetBorderThicknessRight( _1080p * 2, 0 )
	Border0:SetBorderThicknessTop( _1080p * 2, 0 )
	Border0:SetBorderThicknessBottom( _1080p * 2, 0 )
	Border0:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -2, _1080p * 2, _1080p * -2, _1080p * 2 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BorderWhite:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.BorderWhite:SetAlpha( 0.25, 0 )
				end,
				function ()
					return self.BorderWhite:SetAlpha( 0.5, 30 )
				end,
				function ()
					return self.BorderWhite:SetAlpha( 0, 50 )
				end,
				function ()
					return self.BorderWhite:SetAlpha( 0.25, 20 )
				end
			}
		} )
		Border0:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.Border0:SetAlpha( 0.95, 0 )
				end
			}
		} )
		self._sequences.Flicker = function ()
			BorderWhite:AnimateLoop( "Flicker" )
			Border0:AnimateLoop( "Flicker" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Flicker" )
	return self
end

MenuBuilder.registerType( "CPMenuOuterMask", CPMenuOuterMask )
LockTable( _M )
