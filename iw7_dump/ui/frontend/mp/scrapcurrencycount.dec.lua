local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.CurrencyCount:SetShadowVOffset( -0 )
	f1_arg0.CurrencyCount:SetShadowVOffset( -0 )
end

function ScrapCurrencyCount( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 36 * _1080p )
	self.id = "ScrapCurrencyCount"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local CurrencyLogo = nil
	
	CurrencyLogo = LUI.UIImage.new()
	CurrencyLogo.id = "CurrencyLogo"
	CurrencyLogo:setImage( RegisterMaterial( "currency_parts_icon" ), 0 )
	CurrencyLogo:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 36, 0, 0 )
	self:addElement( CurrencyLogo )
	self.CurrencyLogo = CurrencyLogo
	
	local CurrencyCount = nil
	
	CurrencyCount = LUI.UIStyledText.new()
	CurrencyCount.id = "CurrencyCount"
	CurrencyCount:setText( "0000", 0 )
	CurrencyCount:SetFontSize( 24 * _1080p )
	CurrencyCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CurrencyCount:SetAlignment( LUI.Alignment.Left )
	CurrencyCount:SetOptOutRightToLeftAlignmentFlip( true )
	CurrencyCount:SetStartupDelay( 1250 )
	CurrencyCount:SetLineHoldTime( 400 )
	CurrencyCount:SetAnimMoveTime( 300 )
	CurrencyCount:SetEndDelay( 1000 )
	CurrencyCount:SetCrossfadeTime( 500 )
	CurrencyCount:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	CurrencyCount:SetMaxVisibleLines( 1 )
	CurrencyCount:SetShadowMinDistance( -0.2, 0 )
	CurrencyCount:SetShadowMaxDistance( 0.2, 0 )
	CurrencyCount:SetShadowRGBFromInt( 0, 0 )
	CurrencyCount:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 42, 0, _1080p * -12, _1080p * 12 )
	self:addElement( CurrencyCount )
	self.CurrencyCount = CurrencyCount
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CurrencyCount:RegisterAnimationSequence( "Available", {
			{
				function ()
					return self.CurrencyCount:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.Available = function ()
			CurrencyCount:AnimateSequence( "Available" )
		end
		
		CurrencyCount:RegisterAnimationSequence( "Unavailable", {
			{
				function ()
					return self.CurrencyCount:SetRGBFromTable( SWATCHES.MPArmory.PriceCannotBuy, 0 )
				end
			}
		} )
		self._sequences.Unavailable = function ()
			CurrencyCount:AnimateSequence( "Unavailable" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "ScrapCurrencyCount", ScrapCurrencyCount )
LockTable( _M )
