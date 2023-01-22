local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RigSuperDisplay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 210 * _1080p, 0, 60 * _1080p )
	self.id = "RigSuperDisplay"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local SuperImage = nil
	
	SuperImage = LUI.UIImage.new()
	SuperImage.id = "SuperImage"
	SuperImage:SetDotPitchEnabled( true )
	SuperImage:SetDotPitchX( 0, 0 )
	SuperImage:SetDotPitchY( 0, 0 )
	SuperImage:SetDotPitchContrast( 0, 0 )
	SuperImage:SetDotPitchMode( 0 )
	SuperImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 5, _1080p * 105, _1080p * -50, _1080p * 50 )
	SuperImage:SubscribeToModelThroughElement( self, "rigSuper.icon", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.rigSuper.icon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			SuperImage:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( SuperImage )
	self.SuperImage = SuperImage
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		SuperImage:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.SuperImage:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.SuperImage:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.SuperImage:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.SuperImage:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.SuperImage:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.SuperImage:SetDotPitchContrast( 0, 300 )
				end
			},
			{
				function ()
					return self.SuperImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SuperImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.SuperImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.SuperImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.SuperImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.SuperImage:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.UpdateImage = function ()
			SuperImage:AnimateSequence( "UpdateImage" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	SuperImage:SubscribeToModelThroughElement( self, "rigSuper.fullImage", function ()
		ACTIONS.AnimateSequence( self, "UpdateImage" )
	end )
	return self
end

MenuBuilder.registerType( "RigSuperDisplay", RigSuperDisplay )
LockTable( _M )
