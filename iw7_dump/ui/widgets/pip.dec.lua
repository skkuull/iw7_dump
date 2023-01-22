local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function Pip( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p )
	self.id = "Pip"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	self:addElement( Border )
	self.Border = Border
	
	local FillImage = nil
	
	FillImage = LUI.UIImage.new()
	FillImage.id = "FillImage"
	FillImage:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * -3 )
	self:addElement( FillImage )
	self.FillImage = FillImage
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		FillImage:RegisterAnimationSequence( "Highlighted", {
			{
				function ()
					return self.FillImage:SetRGBFromTable( SWATCHES.CAC.node, 0 )
				end
			},
			{
				function ()
					return self.FillImage:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Highlighted = function ()
			FillImage:AnimateSequence( "Highlighted" )
		end
		
		FillImage:RegisterAnimationSequence( "NotHighlighted", {
			{
				function ()
					return self.FillImage:SetRGBFromTable( SWATCHES.CAC.node, 0 )
				end
			},
			{
				function ()
					return self.FillImage:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NotHighlighted = function ()
			FillImage:AnimateSequence( "NotHighlighted" )
		end
		
		FillImage:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.FillImage:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FillImage:SetRGBFromTable( SWATCHES.CAC.streakSelected, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			FillImage:AnimateSequence( "Default" )
		end
		
		FillImage:RegisterAnimationSequence( "NotDefault", {
			{
				function ()
					return self.FillImage:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.FillImage:SetRGBFromTable( SWATCHES.CAC.node, 0 )
				end
			}
		} )
		self._sequences.NotDefault = function ()
			FillImage:AnimateSequence( "NotDefault" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "scrollbar_pip_highlighted", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Highlighted" )
	end )
	self:addEventHandler( "scrollbar_pip_not_highlighted", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f17_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "NotHighlighted" )
	end )
	self:addEventHandler( "scrollbar_pip_is_default", function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Default" )
	end )
	self:addEventHandler( "scrollbar_pip_is_not_default", function ( f19_arg0, f19_arg1 )
		local f19_local0 = f19_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "NotDefault" )
	end )
	return self
end

MenuBuilder.registerType( "Pip", Pip )
LockTable( _M )
