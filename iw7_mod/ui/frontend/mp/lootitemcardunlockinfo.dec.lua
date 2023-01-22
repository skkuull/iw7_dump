local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg2 )
	ACTIONS.AnimateSequence( f1_arg0, "Intro" )
	f1_arg0.AmountText:setText( Engine.Localize( "LUA_MENU_MP_ARMORY_AVAILABLE_AT_LEVEL", f1_arg2.baseWeaponUnlockLevel ) )
end

function LootItemCardUnlockInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 30 * _1080p )
	self.id = "LootItemCardUnlockInfo"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.8, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local AmountText = nil
	
	AmountText = LUI.UIStyledText.new()
	AmountText.id = "AmountText"
	AmountText:setText( "", 0 )
	AmountText:SetFontSize( 16 * _1080p )
	AmountText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	AmountText:SetAlignment( LUI.Alignment.Left )
	AmountText:SetDecodeLetterLength( 25 )
	AmountText:SetDecodeMaxRandChars( 3 )
	AmountText:SetDecodeUpdatesPerLetter( 4 )
	AmountText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 29, _1080p * -6, _1080p * -8, _1080p * 8 )
	self:addElement( AmountText )
	self.AmountText = AmountText
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Icon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 6, _1080p * 26, _1080p * -10, _1080p * 10 )
	self:addElement( Icon )
	self.Icon = Icon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AmountText:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.AmountText:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.AmountText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Intro = function ()
			AmountText:AnimateSequence( "Intro" )
		end
		
		Background:RegisterAnimationSequence( "ShowSalvage", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.8, 200 )
				end
			}
		} )
		AmountText:RegisterAnimationSequence( "ShowSalvage", {
			{
				function ()
					return self.AmountText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AmountText:SetAlpha( 0, 390 )
				end,
				function ()
					return self.AmountText:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.AmountText:SetScale( 0.5, 400 )
				end,
				function ()
					return self.AmountText:SetScale( 0, 250, LUI.EASING.outBack )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "ShowSalvage", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Icon:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Icon:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Icon:SetScale( 1, 0 )
				end,
				function ()
					return self.Icon:SetScale( 1, 200 )
				end,
				function ()
					return self.Icon:SetScale( 0, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Icon:setImage( RegisterMaterial( "currency_parts_icon" ), 0 )
				end
			}
		} )
		self._sequences.ShowSalvage = function ()
			Background:AnimateSequence( "ShowSalvage" )
			AmountText:AnimateSequence( "ShowSalvage" )
			Icon:AnimateSequence( "ShowSalvage" )
		end
		
		Background:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		AmountText:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.AmountText:SetAlpha( 0, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hide = function ()
			Background:AnimateSequence( "Hide" )
			AmountText:AnimateSequence( "Hide" )
			Icon:AnimateSequence( "Hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "LootItemCardUnlockInfo", LootItemCardUnlockInfo )
LockTable( _M )
