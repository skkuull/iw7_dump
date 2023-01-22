local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.ItemCost:setText( ToUpperCase( Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS_COST", 1 ) ) )
end

function PermanentUnlockItemDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1300 * _1080p, 0, 100 * _1080p )
	self.id = "PermanentUnlockItemDetails"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "CACItemHeaderBackground", {
		controllerIndex = f2_local1
	} )
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.itemRarity.quality0, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local f2_local4 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f2_local4 = LUI.UIImage.new()
		f2_local4.id = "ItemDescriptionNub"
		f2_local4:SetAlpha( 0, 0 )
		f2_local4:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1, _1080p * 9, _1080p * 5, _1080p * 20 )
		self:addElement( f2_local4 )
		self.ItemDescriptionNub = f2_local4
	end
	local ItemDescription = nil
	
	ItemDescription = LUI.UIText.new()
	ItemDescription.id = "ItemDescription"
	ItemDescription:SetAlpha( 0.75, 0 )
	ItemDescription:setText( Engine.Localize( "MENU_NEW" ), 0 )
	ItemDescription:SetFontSize( 18 * _1080p )
	ItemDescription:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ItemDescription:SetAlignment( LUI.Alignment.Left )
	ItemDescription:SetOptOutRightToLeftAlignmentFlip( true )
	ItemDescription:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 20, _1080p * 620, _1080p * 4, _1080p * 22 )
	self:addElement( ItemDescription )
	self.ItemDescription = ItemDescription
	
	local ItemName = nil
	
	ItemName = LUI.UIStyledText.new()
	ItemName.id = "ItemName"
	ItemName:setText( Engine.Localize( "MENU_NEW" ), 0 )
	ItemName:SetFontSize( 60 * _1080p )
	ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ItemName:SetAlignment( LUI.Alignment.Left )
	ItemName:SetOptOutRightToLeftAlignmentFlip( true )
	ItemName:SetDecodeLetterLength( 30 )
	ItemName:SetDecodeMaxRandChars( 6 )
	ItemName:SetDecodeUpdatesPerLetter( 4 )
	ItemName:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -157, _1080p * 4, _1080p * 46 )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	local f2_local7 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
		f2_local7 = LUI.UIImage.new()
		f2_local7.id = "MPStrip"
		f2_local7:SetRGBFromTable( SWATCHES.itemRarity.quality0, 0 )
		f2_local7:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100 )
		self:addElement( f2_local7 )
		self.MPStrip = f2_local7
	end
	local TokenIcon = nil
	
	TokenIcon = LUI.UIImage.new()
	TokenIcon.id = "TokenIcon"
	TokenIcon:setImage( RegisterMaterial( "icon_prestige_unlocktoken" ), 0 )
	TokenIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 64, _1080p * 51, _1080p * 95 )
	self:addElement( TokenIcon )
	self.TokenIcon = TokenIcon
	
	local ItemCost = nil
	
	ItemCost = LUI.UIStyledText.new()
	ItemCost.id = "ItemCost"
	ItemCost:setText( ToUpperCase( Engine.Localize( "PRESTIGE_PERMANENT_UNLOCKS_COST" ) ), 0 )
	ItemCost:SetFontSize( 28 * _1080p )
	ItemCost:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ItemCost:SetAlignment( LUI.Alignment.Left )
	ItemCost:SetOptOutRightToLeftAlignmentFlip( true )
	ItemCost:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 75, _1080p * 1143, _1080p * 59, _1080p * 87 )
	self:addElement( ItemCost )
	self.ItemCost = ItemCost
	
	local PermanentUnlockItemUnlockInfo = nil
	
	PermanentUnlockItemUnlockInfo = MenuBuilder.BuildRegisteredType( "PermanentUnlockItemUnlockInfo", {
		controllerIndex = f2_local1
	} )
	PermanentUnlockItemUnlockInfo.id = "PermanentUnlockItemUnlockInfo"
	PermanentUnlockItemUnlockInfo:SetAlpha( 0, 0 )
	PermanentUnlockItemUnlockInfo.UnlockDesc:setText( "", 0 )
	PermanentUnlockItemUnlockInfo:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 480, _1080p * 175, _1080p * 207 )
	self:addElement( PermanentUnlockItemUnlockInfo )
	self.PermanentUnlockItemUnlockInfo = PermanentUnlockItemUnlockInfo
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		PermanentUnlockItemUnlockInfo:RegisterAnimationSequence( "ShowUnlockInfo", {
			{
				function ()
					return self.PermanentUnlockItemUnlockInfo:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.PermanentUnlockItemUnlockInfo:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 480, _1080p * 162, _1080p * 194, 0 )
				end
			}
		} )
		self._sequences.ShowUnlockInfo = function ()
			PermanentUnlockItemUnlockInfo:AnimateSequence( "ShowUnlockInfo" )
		end
		
		PermanentUnlockItemUnlockInfo:RegisterAnimationSequence( "HideUnlockInfo", {
			{
				function ()
					return self.PermanentUnlockItemUnlockInfo:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideUnlockInfo = function ()
			PermanentUnlockItemUnlockInfo:AnimateSequence( "HideUnlockInfo" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "PermanentUnlockItemDetails", PermanentUnlockItemDetails )
LockTable( _M )
