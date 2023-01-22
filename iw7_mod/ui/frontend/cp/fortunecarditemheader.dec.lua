local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function fortuneCardItemHeader( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1107 * _1080p, 0, 322 * _1080p )
	self.id = "fortuneCardItemHeader"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ScreenBacking = nil
	
	ScreenBacking = LUI.UIImage.new()
	ScreenBacking.id = "ScreenBacking"
	ScreenBacking:SetAlpha( 0.5, 0 )
	ScreenBacking:setImage( RegisterMaterial( "cp_faf_card_screen_backing_grad" ), 0 )
	ScreenBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -90.08, _1080p * 978.92, _1080p * 181, _1080p * 417 )
	self:addElement( ScreenBacking )
	self.ScreenBacking = ScreenBacking
	
	local f1_local4 = nil
	if CONDITIONS.IsAliensOnline( self ) then
		f1_local4 = LUI.UIText.new()
		f1_local4.id = "ItemUnlockCriteria"
		f1_local4:setText( "ITEM UNLOCK CRITERIA", 0 )
		f1_local4:SetFontSize( 20 * _1080p )
		f1_local4:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f1_local4:SetAlignment( LUI.Alignment.Left )
		f1_local4:SetOptOutRightToLeftAlignmentFlip( true )
		f1_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 18, _1080p * 1026.92, _1080p * 114, _1080p * 134 )
		self:addElement( f1_local4 )
		self.ItemUnlockCriteria = f1_local4
	end
	local Duration = nil
	
	Duration = LUI.UIText.new()
	Duration.id = "Duration"
	Duration:setText( Engine.Localize( "LUA_MENU_ZM_DURATION_CAPS" ), 0 )
	Duration:SetFontSize( 20 * _1080p )
	Duration:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Duration:SetAlignment( LUI.Alignment.Left )
	Duration:SetOptOutRightToLeftAlignmentFlip( true )
	Duration:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 322, _1080p * 190, _1080p * 210 )
	self:addElement( Duration )
	self.Duration = Duration
	
	local Uses = nil
	
	Uses = LUI.UIText.new()
	Uses.id = "Uses"
	Uses:SetAlpha( 0, 0 )
	Uses:setText( Engine.Localize( "LUA_MENU_ZM_USES_CAPS" ), 0 )
	Uses:SetFontSize( 20 * _1080p )
	Uses:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Uses:SetAlignment( LUI.Alignment.Left )
	Uses:SetOptOutRightToLeftAlignmentFlip( true )
	Uses:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 1079, _1080p * 225, _1080p * 245 )
	self:addElement( Uses )
	self.Uses = Uses
	
	local Owned = nil
	
	Owned = LUI.UIText.new()
	Owned.id = "Owned"
	Owned:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_CARDS_REMAINING_CAPS" ) ), 0 )
	Owned:SetFontSize( 20 * _1080p )
	Owned:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Owned:SetAlignment( LUI.Alignment.Left )
	Owned:SetOptOutRightToLeftAlignmentFlip( true )
	Owned:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 1079, _1080p * 161, _1080p * 181 )
	self:addElement( Owned )
	self.Owned = Owned
	
	local ItemName = nil
	
	ItemName = LUI.UIStyledText.new()
	ItemName.id = "ItemName"
	ItemName:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	ItemName:setText( "CARD NAME", 0 )
	ItemName:SetFontSize( 80 * _1080p )
	ItemName:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	ItemName:SetAlignment( LUI.Alignment.Left )
	ItemName:SetOptOutRightToLeftAlignmentFlip( true )
	ItemName:SetStartupDelay( 1000 )
	ItemName:SetLineHoldTime( 400 )
	ItemName:SetAnimMoveTime( 150 )
	ItemName:SetEndDelay( 1000 )
	ItemName:SetCrossfadeTime( 400 )
	ItemName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	ItemName:SetMaxVisibleLines( 1 )
	ItemName:SetDecodeLetterLength( 30 )
	ItemName:SetDecodeMaxRandChars( 6 )
	ItemName:SetDecodeUpdatesPerLetter( 4 )
	ItemName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 904.92, _1080p * 11, _1080p * 83 )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	local ItemDescription = nil
	
	ItemDescription = LUI.UIText.new()
	ItemDescription.id = "ItemDescription"
	ItemDescription:setText( "CARD DESCRIPTION", 0 )
	ItemDescription:SetFontSize( 20 * _1080p )
	ItemDescription:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ItemDescription:SetAlignment( LUI.Alignment.Left )
	ItemDescription:SetOptOutRightToLeftAlignmentFlip( true )
	ItemDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 18, _1080p * 1026.92, _1080p * 89, _1080p * 109 )
	self:addElement( ItemDescription )
	self.ItemDescription = ItemDescription
	
	local RarityIcon = nil
	
	RarityIcon = LUI.UIImage.new()
	RarityIcon.id = "RarityIcon"
	RarityIcon:SetAlpha( 0, 0 )
	RarityIcon:SetScale( -0.38, 0 )
	RarityIcon:setImage( RegisterMaterial( "icon_item_quality_0" ), 0 )
	RarityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5.32, _1080p * 122.68, _1080p * 200.68, _1080p * 328.68 )
	self:addElement( RarityIcon )
	self.RarityIcon = RarityIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if CONDITIONS.IsAliensOnline( self ) then
			f1_local4:RegisterAnimationSequence( "Locked", {
				{
					function ()
						return self.ItemUnlockCriteria:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.Locked = function ()
			if CONDITIONS.IsAliensOnline( self ) then
				f1_local4:AnimateSequence( "Locked" )
			end
		end
		
		if CONDITIONS.IsAliensOnline( self ) then
			f1_local4:RegisterAnimationSequence( "Unlocked", {
				{
					function ()
						return self.ItemUnlockCriteria:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.Unlocked = function ()
			if CONDITIONS.IsAliensOnline( self ) then
				f1_local4:AnimateSequence( "Unlocked" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "fortuneCardItemHeader", fortuneCardItemHeader )
LockTable( _M )
