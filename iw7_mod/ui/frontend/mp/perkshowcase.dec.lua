local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PerkShowcase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "PerkShowcase"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ChipBacking = nil
	
	ChipBacking = LUI.UIImage.new()
	ChipBacking.id = "ChipBacking"
	ChipBacking:SetDotPitchEnabled( true )
	ChipBacking:SetDotPitchX( 0, 0 )
	ChipBacking:SetDotPitchY( 0, 0 )
	ChipBacking:SetDotPitchContrast( 0, 0 )
	ChipBacking:SetDotPitchMode( 0 )
	ChipBacking:setImage( RegisterMaterial( "icon_perk_showcase_chip_backing" ), 0 )
	ChipBacking:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 512 )
	self:addElement( ChipBacking )
	self.ChipBacking = ChipBacking
	
	local Showcase = nil
	
	Showcase = LUI.UIImage.new()
	Showcase.id = "Showcase"
	Showcase:SetDotPitchEnabled( true )
	Showcase:SetDotPitchX( 0, 0 )
	Showcase:SetDotPitchY( 0, 0 )
	Showcase:SetDotPitchContrast( 0, 0 )
	Showcase:SetDotPitchMode( 0 )
	Showcase:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 97, _1080p * -156, _1080p * 74, _1080p * -179 )
	Showcase:SubscribeToModelThroughElement( self, "fullImage", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.fullImage:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Showcase:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( Showcase )
	self.Showcase = Showcase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ChipBacking:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.ChipBacking:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.ChipBacking:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.ChipBacking:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.ChipBacking:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.ChipBacking:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.ChipBacking:SetDotPitchContrast( 0, 300 )
				end
			},
			{
				function ()
					return self.ChipBacking:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ChipBacking:SetAlpha( 1, 30 )
				end,
				function ()
					return self.ChipBacking:SetAlpha( 0, 30 )
				end,
				function ()
					return self.ChipBacking:SetAlpha( 1, 30 )
				end,
				function ()
					return self.ChipBacking:SetAlpha( 0, 30 )
				end,
				function ()
					return self.ChipBacking:SetAlpha( 1, 30 )
				end
			}
		} )
		Showcase:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.Showcase:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.Showcase:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.Showcase:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.Showcase:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.Showcase:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.Showcase:SetDotPitchContrast( 0, 300 )
				end
			},
			{
				function ()
					return self.Showcase:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Showcase:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Showcase:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Showcase:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Showcase:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Showcase:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.Update = function ()
			ChipBacking:AnimateSequence( "Update" )
			Showcase:AnimateSequence( "Update" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "PerkShowcase", PerkShowcase )
LockTable( _M )
