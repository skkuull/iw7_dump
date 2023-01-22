local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CaCSelectionNode( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 20 * _1080p, 0, 6 * _1080p )
	self.id = "CaCSelectionNode"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Node = nil
	
	Node = LUI.UIImage.new()
	Node.id = "Node"
	Node:SetRGBFromTable( SWATCHES.CAC.node, 0 )
	self:addElement( Node )
	self.Node = Node
	
	local Frame = nil
	
	Frame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Frame.id = "Frame"
	Frame:SetRGBFromTable( SWATCHES.CAC.nodeFrame, 0 )
	Frame:SetAlpha( 0, 0 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetRGBFromTable( SWATCHES.CAC.nodeGlow, 0 )
	Glow:SetAlpha( 0, 0 )
	Glow:setImage( RegisterMaterial( "wdg_highlight_glow_perk_node" ), 0 )
	Glow:SetBlendMode( BLEND_MODE.addWithAlpha )
	Glow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -22, _1080p * 22, _1080p * -29, _1080p * 29 )
	self:addElement( Glow )
	self.Glow = Glow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Node:RegisterAnimationSequence( "Inactive", {
			{
				function ()
					return self.Node:SetRGBFromTable( SWATCHES.CAC.nodeFrame, 0 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "Inactive", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Inactive = function ()
			Node:AnimateSequence( "Inactive" )
			Glow:AnimateSequence( "Inactive" )
		end
		
		Node:RegisterAnimationSequence( "Active", {
			{
				function ()
					return self.Node:SetRGBFromTable( SWATCHES.CAC.node, 0 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "Active", {
			{
				function ()
					return self.Glow:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Active = function ()
			Node:AnimateSequence( "Active" )
			Glow:AnimateSequence( "Active" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "isEquipped", function ()
		local f10_local0 = self:GetDataSource()
		if f10_local0.isEquipped:GetValue( f1_local1 ) ~= nil then
			f10_local0 = self:GetDataSource()
			if f10_local0.isEquipped:GetValue( f1_local1 ) == true then
				ACTIONS.AnimateSequence( self, "Active" )
			end
		end
		f10_local0 = self:GetDataSource()
		if f10_local0.isEquipped:GetValue( f1_local1 ) ~= nil then
			f10_local0 = self:GetDataSource()
			if f10_local0.isEquipped:GetValue( f1_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Inactive" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "CaCSelectionNode", CaCSelectionNode )
LockTable( _M )
