local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function fortuneCardSlotButtton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 159 * _1080p, 0, 226 * _1080p )
	self.id = "fortuneCardSlotButtton"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local base = nil
	
	base = LUI.UIImage.new()
	base.id = "base"
	base:SetScale( -0.33, 0 )
	base:setImage( RegisterMaterial( "zm_wc_fate_card_base" ), 0 )
	base:SetUseAA( true )
	base:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -50.88, _1080p * 205.12, _1080p * -86, _1080p * 426 )
	self:addElement( base )
	self.base = base
	
	local CardIcon = nil
	
	CardIcon = LUI.UIImage.new()
	CardIcon.id = "CardIcon"
	CardIcon:SetScale( -0.58, 0 )
	CardIcon:setImage( RegisterMaterial( "fnf_cant_miss" ), 0 )
	CardIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -49.5, _1080p * 206.5, _1080p * -22.88, _1080p * 233.12 )
	self:addElement( CardIcon )
	self.CardIcon = CardIcon
	
	local Highlight = nil
	
	Highlight = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 6,
		borderThicknessRight = _1080p * 6,
		borderThicknessTop = _1080p * 6,
		borderThicknessBottom = _1080p * 6
	} )
	Highlight.id = "Highlight"
	Highlight:SetRGBFromInt( 16717568, 0 )
	Highlight:SetAlpha( 0, 0 )
	Highlight:SetBorderThicknessLeft( _1080p * 6, 0 )
	Highlight:SetBorderThicknessRight( _1080p * 6, 0 )
	Highlight:SetBorderThicknessTop( _1080p * 6, 0 )
	Highlight:SetBorderThicknessBottom( _1080p * 6, 0 )
	Highlight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -3, _1080p * 159, _1080p * -1, _1080p * 221 )
	self:addElement( Highlight )
	self.Highlight = Highlight
	
	local HighlightGlow = nil
	
	HighlightGlow = LUI.UIImage.new()
	HighlightGlow.id = "HighlightGlow"
	HighlightGlow:SetAlpha( 0, 0 )
	HighlightGlow:setImage( RegisterMaterial( "cp_faf_card_selected_highlight" ), 0 )
	HighlightGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -75.61, _1080p * 227.39, _1080p * -84.5, _1080p * 298.5 )
	self:addElement( HighlightGlow )
	self.HighlightGlow = HighlightGlow
	
	local CardName = nil
	
	CardName = LUI.UIText.new()
	CardName.id = "CardName"
	CardName:SetRGBFromInt( 16777215, 0 )
	CardName:setText( "KILLING JOY", 0 )
	CardName:SetFontSize( 20 * _1080p )
	CardName:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	CardName:SetAlignment( LUI.Alignment.Center )
	CardName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 153.24, _1080p * 7, _1080p * 27 )
	self:addElement( CardName )
	self.CardName = CardName
	
	self._animationSets.DefaultAnimationSet = function ()
		Highlight:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Highlight:SetAlpha( 0, 0 )
				end
			}
		} )
		HighlightGlow:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.HighlightGlow:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Highlight:AnimateSequence( "DefaultSequence" )
			HighlightGlow:AnimateSequence( "DefaultSequence" )
		end
		
		Highlight:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Highlight:SetAlpha( 1, 0 )
				end
			}
		} )
		HighlightGlow:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.HighlightGlow:SetAlpha( 0.7, 0 )
				end,
				function ()
					return self.HighlightGlow:SetAlpha( 0.4, 1000, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.HighlightGlow:SetAlpha( 0.7, 1000, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Highlight:AnimateLoop( "ButtonOver" )
			HighlightGlow:AnimateLoop( "ButtonOver" )
		end
		
		Highlight:RegisterAnimationSequence( "ButtonOff", {
			{
				function ()
					return self.Highlight:SetAlpha( 0, 0 )
				end
			}
		} )
		HighlightGlow:RegisterAnimationSequence( "ButtonOff", {
			{
				function ()
					return self.HighlightGlow:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOff = function ()
			Highlight:AnimateSequence( "ButtonOff" )
			HighlightGlow:AnimateSequence( "ButtonOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f14_arg0, f14_arg1 )
		local f14_local0 = f14_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOff" )
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "fortuneCardSlotButtton", fortuneCardSlotButtton )
LockTable( _M )
