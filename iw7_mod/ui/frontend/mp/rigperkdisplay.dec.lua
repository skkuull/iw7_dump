local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RigPerkDisplay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 210 * _1080p, 0, 60 * _1080p )
	self.id = "RigPerkDisplay"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local RigPerkImage = nil
	
	RigPerkImage = LUI.UIImage.new()
	RigPerkImage.id = "RigPerkImage"
	RigPerkImage:SetDotPitchEnabled( true )
	RigPerkImage:SetDotPitchX( 0, 0 )
	RigPerkImage:SetDotPitchY( 0, 0 )
	RigPerkImage:SetDotPitchContrast( 0, 0 )
	RigPerkImage:SetDotPitchMode( 0 )
	RigPerkImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 5, _1080p * 105, _1080p * -50, _1080p * 50 )
	RigPerkImage:SubscribeToModelThroughElement( self, "rigPerk.icon", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.rigPerk.icon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			RigPerkImage:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( RigPerkImage )
	self.RigPerkImage = RigPerkImage
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RigPerkImage:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.RigPerkImage:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.RigPerkImage:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.RigPerkImage:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.RigPerkImage:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.RigPerkImage:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.RigPerkImage:SetDotPitchContrast( 0, 300 )
				end
			},
			{
				function ()
					return self.RigPerkImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RigPerkImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.RigPerkImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.RigPerkImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.RigPerkImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.RigPerkImage:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.UpdateImage = function ()
			RigPerkImage:AnimateSequence( "UpdateImage" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	RigPerkImage:SubscribeToModelThroughElement( self, "rigPerk.fullImage", function ()
		ACTIONS.AnimateSequence( self, "UpdateImage" )
	end )
	return self
end

MenuBuilder.registerType( "RigPerkDisplay", RigPerkDisplay )
LockTable( _M )
