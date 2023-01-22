local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CRMListItem( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 311 * _1080p, 0, 194 * _1080p )
	self.id = "CRMListItem"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.genericButton.background, 0 )
	Background:SubscribeToModelThroughElement( self, "smallImage", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.smallImage:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Background:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( Background )
	self.Background = Background
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 4,
		borderThicknessRight = _1080p * 4,
		borderThicknessTop = _1080p * 4,
		borderThicknessBottom = _1080p * 4
	} )
	Border.id = "Border"
	Border:SetBorderThicknessLeft( _1080p * 4, 0 )
	Border:SetBorderThicknessRight( _1080p * 4, 0 )
	Border:SetBorderThicknessTop( _1080p * 4, 0 )
	Border:SetBorderThicknessBottom( _1080p * 4, 0 )
	self:addElement( Border )
	self.Border = Border
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Border:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.Border:SetRGBFromInt( 16776704, 0 )
				end
			}
		} )
		self._sequences.Focused = function ()
			Border:AnimateSequence( "Focused" )
		end
		
		Border:RegisterAnimationSequence( "Unfocused", {
			{
				function ()
					return self.Border:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.Unfocused = function ()
			Border:AnimateSequence( "Unfocused" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Focused" )
	end )
	self:addEventHandler( "button_up", function ( f10_arg0, f10_arg1 )
		local f10_local0 = f10_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Unfocused" )
	end )
	return self
end

MenuBuilder.registerType( "CRMListItem", CRMListItem )
LockTable( _M )
