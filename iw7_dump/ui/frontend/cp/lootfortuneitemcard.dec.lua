local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0._cards = f1_arg2.cards
	if f1_arg0._cards and #f1_arg0._cards > 0 then
		local f1_local0 = f1_arg0:Wait( (f1_arg2.cardIndex + 1) * LOOT.IntroSlamDuration )
		f1_arg0:SetAlpha( 0 )
		f1_arg0:SetScale( 1 )
		f1_arg0:SetZRotation( -3 )
		f1_local0.onComplete = function ()
			f1_arg0:SetAlpha( 1, 200, LUI.EASING.outBack )
			f1_arg0:SetScale( 0, 200, LUI.EASING.outBack )
			Engine.PlaySound( "ui_iw7_loot_roll_slam_right" )
			f1_local0 = f1_arg0:Wait( 3 * LOOT.RandomizeDuration )
			f1_local0.onComplete = function ()
				LUI.FlowManager.RequestLeaveMenu( f1_arg0 )
				LUI.FlowManager.RequestAddMenu( "FortunePackOpening", false, f1_arg1, false, {
					controllerIndex = f1_arg1,
					cards = f1_arg0._cards,
					crateID = f1_arg2.crateID,
					cardIndex = f1_arg2.cardIndex,
					usedCODPoints = f1_arg2.usedCODPoints
				} )
			end
			
		end
		
	end
end

function LootFortuneItemCard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 410 * _1080p )
	self.id = "LootFortuneItemCard"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "cp_card_pack_back_1" ), 0 )
	Background:SetUseAA( true )
	Background:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -256, _1080p * 256 )
	self:addElement( Background )
	self.Background = Background
	
	local Devil = nil
	
	Devil = LUI.UIImage.new()
	Devil.id = "Devil"
	Devil:SetScale( -0.1, 0 )
	Devil:setImage( RegisterMaterial( "zm_wc_devil_head" ), 0 )
	Devil:SetUseAA( true )
	Devil:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -138, _1080p * 118 )
	self:addElement( Devil )
	self.Devil = Devil
	
	local BoosterPackText = nil
	
	BoosterPackText = LUI.UIStyledText.new()
	BoosterPackText.id = "BoosterPackText"
	BoosterPackText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_CARD_BOOSTER_PACK" ) ), 0 )
	BoosterPackText:SetFontSize( 16 * _1080p )
	BoosterPackText:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	BoosterPackText:SetAlignment( LUI.Alignment.Center )
	BoosterPackText:SetOutlineMinDistance( -0.2, 0 )
	BoosterPackText:SetOutlineRGBFromInt( 0, 0 )
	BoosterPackText:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -61, _1080p * -45 )
	self:addElement( BoosterPackText )
	self.BoosterPackText = BoosterPackText
	
	local FateText = nil
	
	FateText = LUI.UIStyledText.new()
	FateText.id = "FateText"
	FateText:SetRGBFromTable( SWATCHES.Zombies.PrimaryColor, 0 )
	FateText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_HEADER_FATE_CAPS" ) ), 0 )
	FateText:SetFontSize( 50 * _1080p )
	FateText:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	FateText:SetAlignment( LUI.Alignment.Center )
	FateText:SetOutlineMinDistance( -0.2, 0 )
	FateText:SetOutlineRGBFromInt( 0, 0 )
	FateText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 65, _1080p * 115 )
	self:addElement( FateText )
	self.FateText = FateText
	
	local FFortuneText = nil
	
	FFortuneText = LUI.UIStyledText.new()
	FFortuneText.id = "FFortuneText"
	FFortuneText:SetRGBFromTable( SWATCHES.Zombies.PrimaryColor, 0 )
	FFortuneText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_HEADER_FORTUNE_CAPS" ) ), 0 )
	FFortuneText:SetFontSize( 50 * _1080p )
	FFortuneText:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	FFortuneText:SetAlignment( LUI.Alignment.Center )
	FFortuneText:SetOutlineMinDistance( -0.2, 0 )
	FFortuneText:SetOutlineRGBFromInt( 0, 0 )
	FFortuneText:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -125, _1080p * -75 )
	self:addElement( FFortuneText )
	self.FFortuneText = FFortuneText
	
	local AndText = nil
	
	AndText = LUI.UIStyledText.new()
	AndText.id = "AndText"
	AndText:SetRGBFromTable( SWATCHES.Zombies.PrimaryColor, 0 )
	AndText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_AND" ) ), 0 )
	AndText:SetFontSize( 24 * _1080p )
	AndText:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	AndText:SetAlignment( LUI.Alignment.Center )
	AndText:SetOutlineMinDistance( -0.2, 0 )
	AndText:SetOutlineRGBFromInt( 0, 0 )
	AndText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 107, _1080p * 131 )
	self:addElement( AndText )
	self.AndText = AndText
	
	local Burn = nil
	
	Burn = LUI.UIImage.new()
	Burn.id = "Burn"
	Burn:SetAlpha( 0, 0 )
	Burn:setImage( RegisterMaterial( "cp_card_pack_back_torn_fx_1" ), 0 )
	Burn:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -128, _1080p * 128, _1080p * -16, _1080p * 240 )
	self:addElement( Burn )
	self.Burn = Burn
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Normal", {
			{
				function ()
					return self.Background:setImage( RegisterMaterial( "cp_card_pack_back_1" ), 0 )
				end
			}
		} )
		Burn:RegisterAnimationSequence( "Normal", {
			{
				function ()
					return self.Burn:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Normal = function ()
			Background:AnimateSequence( "Normal" )
			Burn:AnimateSequence( "Normal" )
		end
		
		Background:RegisterAnimationSequence( "Burnt", {
			{
				function ()
					return self.Background:setImage( RegisterMaterial( "cp_card_pack_back_torn_1" ), 0 )
				end
			}
		} )
		Burn:RegisterAnimationSequence( "Burnt", {
			{
				function ()
					return self.Burn:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Burnt = function ()
			Background:AnimateSequence( "Burnt" )
			Burn:AnimateSequence( "Burnt" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "LootFortuneItemCard", LootFortuneItemCard )
LockTable( _M )
