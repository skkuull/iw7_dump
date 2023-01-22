local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.LimitText )
	if CONDITIONS.IsArabic( f1_arg0 ) then
		f1_arg0.LimitText:SetAlignment( LUI.Alignment.Left )
	end
end

function FeatureItemBanner( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 680 * _1080p, 0, 200 * _1080p )
	self.id = "FeatureItemBanner"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local MainBannerBG = nil
	
	MainBannerBG = LUI.UIImage.new()
	MainBannerBG.id = "MainBannerBG"
	MainBannerBG:SetRGBFromInt( 0, 0 )
	MainBannerBG:SetAlpha( 0.4, 0 )
	MainBannerBG:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 )
	self:addElement( MainBannerBG )
	self.MainBannerBG = MainBannerBG
	
	local Divider = nil
	
	Divider = LUI.UIImage.new()
	Divider.id = "Divider"
	Divider:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 30, _1080p * 32 )
	self:addElement( Divider )
	self.Divider = Divider
	
	local LimitBG = nil
	
	LimitBG = LUI.UIImage.new()
	LimitBG.id = "LimitBG"
	LimitBG:SetRGBFromInt( 0, 0 )
	LimitBG:SetAlpha( 0.6, 0 )
	LimitBG:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -280, 0, 0, _1080p * 30 )
	self:addElement( LimitBG )
	self.LimitBG = LimitBG
	
	local LimitAngle = nil
	
	LimitAngle = LUI.UIImage.new()
	LimitAngle.id = "LimitAngle"
	LimitAngle:SetRGBFromInt( 0, 0 )
	LimitAngle:SetAlpha( 0.6, 0 )
	LimitAngle:SetZRotation( -90, 0 )
	LimitAngle:setImage( RegisterMaterial( "wdg_slot_cut_out_1" ), 0 )
	LimitAngle:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -310, _1080p * -280, 0, _1080p * 30 )
	self:addElement( LimitAngle )
	self.LimitAngle = LimitAngle
	
	local FeatureHighlight = nil
	
	FeatureHighlight = LUI.UIImage.new()
	FeatureHighlight.id = "FeatureHighlight"
	FeatureHighlight:SetRGBFromInt( 3716169, 0 )
	FeatureHighlight:SetAlpha( 0, 0 )
	FeatureHighlight:setImage( RegisterMaterial( "event_crate_highlight" ), 0 )
	FeatureHighlight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -64, 0, 0, _1080p * 64 )
	self:addElement( FeatureHighlight )
	self.FeatureHighlight = FeatureHighlight
	
	local OfferText = nil
	
	OfferText = LUI.UIStyledText.new()
	OfferText.id = "OfferText"
	OfferText:setText( "", 0 )
	OfferText:SetFontSize( 22 * _1080p )
	OfferText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	OfferText:SetAlignment( LUI.Alignment.Left )
	OfferText:SetStartupDelay( 1000 )
	OfferText:SetLineHoldTime( 400 )
	OfferText:SetAnimMoveTime( 150 )
	OfferText:SetEndDelay( 1000 )
	OfferText:SetCrossfadeTime( 400 )
	OfferText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	OfferText:SetMaxVisibleLines( 1 )
	OfferText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 370, _1080p * 4, _1080p * 26 )
	self:addElement( OfferText )
	self.OfferText = OfferText
	
	local LimitText = nil
	
	LimitText = LUI.UIText.new()
	LimitText.id = "LimitText"
	LimitText:setText( "", 0 )
	LimitText:SetFontSize( 19 * _1080p )
	LimitText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LimitText:SetAlignment( LUI.Alignment.Right )
	LimitText:SetOptOutRightToLeftAlignmentFlip( true )
	LimitText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 26, _1080p * -10, _1080p * -21.5, _1080p * -2.5 )
	self:addElement( LimitText )
	self.LimitText = LimitText
	
	local EventTimer = nil
	
	EventTimer = MenuBuilder.BuildRegisteredType( "EventCrateTimer", {
		controllerIndex = f2_local1
	} )
	EventTimer.id = "EventTimer"
	EventTimer:SetAlpha( 0, 0 )
	EventTimer:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -276, _1080p * -77, _1080p * 5, _1080p * 25 )
	self:addElement( EventTimer )
	self.EventTimer = EventTimer
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MainBannerBG:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.MainBannerBG:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 0 )
				end,
				function ()
					return self.MainBannerBG:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 6, 0, 0, _1080p * 30, 70 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Divider:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 30, _1080p * 32, 0 )
				end,
				function ()
					return self.Divider:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 6, 0, _1080p * 30, _1080p * 32, 70 )
				end
			}
		} )
		LimitText:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.LimitText:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			MainBannerBG:AnimateSequence( "ButtonOver" )
			Divider:AnimateSequence( "ButtonOver" )
			LimitText:AnimateSequence( "ButtonOver" )
		end
		
		MainBannerBG:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.MainBannerBG:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 6, 0, 0, _1080p * 30, 0 )
				end,
				function ()
					return self.MainBannerBG:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30, 70 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Divider:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 6, 0, _1080p * 30, _1080p * 32, 0 )
				end,
				function ()
					return self.Divider:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 30, _1080p * 32, 70 )
				end
			}
		} )
		LimitText:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.LimitText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			MainBannerBG:AnimateSequence( "ButtonUp" )
			Divider:AnimateSequence( "ButtonUp" )
			LimitText:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f17_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "FeatureItemBanner", FeatureItemBanner )
LockTable( _M )
