local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MenuFillBar( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 225 * _1080p, 0, 18 * _1080p )
	self.id = "MenuFillBar"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetAlpha( 0.6, 0 )
	Fill:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, 0, 0 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local FillBorder = nil
	
	FillBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	FillBorder.id = "FillBorder"
	FillBorder:SetAlpha( 0.85, 0 )
	FillBorder:SetBorderThicknessLeft( _1080p * 2, 0 )
	FillBorder:SetBorderThicknessRight( _1080p * 2, 0 )
	FillBorder:SetBorderThicknessTop( _1080p * 2, 0 )
	FillBorder:SetBorderThicknessBottom( _1080p * 2, 0 )
	self:addElement( FillBorder )
	self.FillBorder = FillBorder
	
	local TickMarker = nil
	
	TickMarker = LUI.UIImage.new()
	TickMarker.id = "TickMarker"
	TickMarker:SetAlpha( 0, 0 )
	TickMarker:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 50, _1080p * 52, _1080p * -4, _1080p * 4 )
	self:addElement( TickMarker )
	self.TickMarker = TickMarker
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Fill:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Fill:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Fill:SetAlpha( 0.6, 0 )
				end
			}
		} )
		FillBorder:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.FillBorder:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		TickMarker:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.TickMarker:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Fill:AnimateSequence( "ButtonOver" )
			FillBorder:AnimateSequence( "ButtonOver" )
			TickMarker:AnimateSequence( "ButtonOver" )
		end
		
		Fill:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Fill:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		FillBorder:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.FillBorder:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.FillBorder:SetAlpha( 0.85, 0 )
				end
			}
		} )
		TickMarker:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.TickMarker:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Fill:AnimateSequence( "ButtonUp" )
			FillBorder:AnimateSequence( "ButtonUp" )
			TickMarker:AnimateSequence( "ButtonUp" )
		end
		
		self._sequences.Locked = function ()
			
		end
		
		self._sequences.NewNotification = function ()
			
		end
		
		self._sequences.ButtonOverDisabled = function ()
			
		end
		
		self._sequences.ButtonUpDisabled = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "MenuFillBar", MenuFillBar )
LockTable( _M )
