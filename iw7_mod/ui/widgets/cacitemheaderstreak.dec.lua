local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CACItemHeaderStreak( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1300 * _1080p, 0, 100 * _1080p )
	self.id = "CACItemHeaderStreak"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "CACItemHeaderBackground", {
		controllerIndex = f1_local1
	} )
	Background.id = "Background"
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local ItemDescription = nil
	
	ItemDescription = LUI.UIText.new()
	ItemDescription.id = "ItemDescription"
	ItemDescription:SetAlpha( 0.75, 0 )
	ItemDescription:setText( Engine.Localize( "MENU_NEW" ), 0 )
	ItemDescription:SetFontSize( 20 * _1080p )
	ItemDescription:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ItemDescription:SetAlignment( LUI.Alignment.Left )
	ItemDescription:SetOptOutRightToLeftAlignmentFlip( true )
	ItemDescription:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 250, _1080p * -225, _1080p * 624, _1080p * 644 )
	self:addElement( ItemDescription )
	self.ItemDescription = ItemDescription
	
	local ItemName = nil
	
	ItemName = LUI.UIStyledText.new()
	ItemName.id = "ItemName"
	ItemName:setText( Engine.Localize( "MENU_NEW" ), 0 )
	ItemName:SetFontSize( 45 * _1080p )
	ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ItemName:SetAlignment( LUI.Alignment.Left )
	ItemName:SetOptOutRightToLeftAlignmentFlip( true )
	ItemName:SetDecodeLetterLength( 30 )
	ItemName:SetDecodeMaxRandChars( 6 )
	ItemName:SetDecodeUpdatesPerLetter( 4 )
	ItemName:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * 5, _1080p * 4, _1080p * 46 )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ItemDescription:RegisterAnimationSequence( "UpdateDescription", {
			{
				function ()
					return self.ItemDescription:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ItemDescription:SetAlpha( 0.75, 300, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ItemDescription:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 250, _1080p * -225, _1080p * 644, _1080p * 664, 0 )
				end,
				function ()
					return self.ItemDescription:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 250, _1080p * -225, _1080p * 624, _1080p * 644, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.UpdateDescription = function ()
			ItemDescription:AnimateSequence( "UpdateDescription" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "CACItemHeaderStreak", CACItemHeaderStreak )
LockTable( _M )
