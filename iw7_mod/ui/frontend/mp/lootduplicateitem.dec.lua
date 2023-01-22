local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:registerEventHandler( "reveal_duplicate_info", function ( element, event )
		ACTIONS.AnimateSequence( element, "Show" )
	end )
end

function LootDuplicateItem( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 50 * _1080p )
	self.id = "LootDuplicateItem"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.8, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -25, _1080p * 25 )
	self:addElement( Background )
	self.Background = Background
	
	local MessageText = nil
	
	MessageText = LUI.UIStyledText.new()
	MessageText.id = "MessageText"
	MessageText:setText( Engine.Localize( "LOOT_MP_DUPLICATE" ), 0 )
	MessageText:SetFontSize( 38 * _1080p )
	MessageText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	MessageText:SetAlignment( LUI.Alignment.Center )
	MessageText:SetDecodeLetterLength( 25 )
	MessageText:SetDecodeMaxRandChars( 3 )
	MessageText:SetDecodeUpdatesPerLetter( 4 )
	MessageText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -19, _1080p * 19 )
	self:addElement( MessageText )
	self.MessageText = MessageText
	
	self._animationSets.DefaultAnimationSet = function ()
		Background:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.MessageText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Background:AnimateSequence( "DefaultSequence" )
			MessageText:AnimateSequence( "DefaultSequence" )
		end
		
		Background:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.8, 200 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.MessageText:SetScale( 1, 0 )
				end,
				function ()
					return self.MessageText:SetScale( 0, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MessageText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MessageText:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Show = function ()
			Background:AnimateSequence( "Show" )
			MessageText:AnimateSequence( "Show" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "LootDuplicateItem", LootDuplicateItem )
LockTable( _M )
