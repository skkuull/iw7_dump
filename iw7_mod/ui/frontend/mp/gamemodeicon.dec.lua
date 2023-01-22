local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	assert( f1_arg1 )
	if f1_arg1 then
		f1_arg0.Icon:setImage( f1_arg1, 0 )
		ACTIONS.AnimateSequence( f1_arg0, "Update" )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.SetIcon = f0_local0
end

function GameModeIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "GameModeIcon"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:setImage( RegisterMaterial( "gamemode_generic" ), 0 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 5,
		borderThicknessRight = _1080p * 5,
		borderThicknessTop = _1080p * 5,
		borderThicknessBottom = _1080p * 5
	} )
	Border.id = "Border"
	Border:SetRGBFromInt( 0, 0 )
	Border:SetZRotation( 45, 0 )
	Border:SetBorderThicknessLeft( _1080p * 5, 0 )
	Border:SetBorderThicknessRight( _1080p * 5, 0 )
	Border:SetBorderThicknessTop( _1080p * 5, 0 )
	Border:SetBorderThicknessBottom( _1080p * 5, 0 )
	Border:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 36, _1080p * -36, _1080p * 36, _1080p * -36 )
	self:addElement( Border )
	self.Border = Border
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Icon:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.Icon:SetScale( -0.25, 0 )
				end,
				function ()
					return self.Icon:SetScale( 0, 300, LUI.EASING.outBack )
				end
			}
		} )
		Border:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.Border:SetScale( -0.5, 0 )
				end,
				function ()
					return self.Border:SetScale( 0, 400, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Update = function ()
			Icon:AnimateSequence( "Update" )
			Border:AnimateSequence( "Update" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "GameModeIcon", GameModeIcon )
LockTable( _M )
