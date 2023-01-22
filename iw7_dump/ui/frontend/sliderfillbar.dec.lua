local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function SliderFillBar( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 225 * _1080p, 0, 18 * _1080p )
	self.id = "SliderFillBar"
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
	
	local SliderFillBarMarker = nil
	
	SliderFillBarMarker = MenuBuilder.BuildRegisteredType( "SliderFillBarMarker", {
		controllerIndex = f1_local1
	} )
	SliderFillBarMarker.id = "SliderFillBarMarker"
	SliderFillBarMarker:SetAlpha( 0.85, 0 )
	SliderFillBarMarker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 80, _1080p * 82, 0, _1080p * 18 )
	self:addElement( SliderFillBarMarker )
	self.SliderFillBarMarker = SliderFillBarMarker
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		FillBorder:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.FillBorder:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			},
			{
				function ()
					return self.FillBorder:SetAlpha( 1, 0 )
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
		SliderFillBarMarker:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.SliderFillBarMarker:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			},
			{
				function ()
					return self.SliderFillBarMarker:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			FillBorder:AnimateSequence( "ButtonOver" )
			TickMarker:AnimateSequence( "ButtonOver" )
			SliderFillBarMarker:AnimateSequence( "ButtonOver" )
		end
		
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
		SliderFillBarMarker:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.SliderFillBarMarker:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.SliderFillBarMarker:SetAlpha( 0.85, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			FillBorder:AnimateSequence( "ButtonUp" )
			TickMarker:AnimateSequence( "ButtonUp" )
			SliderFillBarMarker:AnimateSequence( "ButtonUp" )
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
	self:addEventHandler( "button_over", function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f21_arg0, f21_arg1 )
		local f21_local0 = f21_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	return self
end

MenuBuilder.registerType( "SliderFillBar", SliderFillBar )
LockTable( _M )
