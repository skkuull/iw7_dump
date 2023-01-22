local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg2.itemCardData )
	local f1_local0 = tonumber( f1_arg2.itemCardData.quality:GetValue( f1_arg1 ) )
	local f1_local1 = f1_arg0:Wait( f1_arg2.delayOverride and 10 or 250 )
	f1_local1.onComplete = function ()
		if f1_local0 == 1 then
			ACTIONS.AnimateSequence( f1_arg0, "Common" )
		elseif f1_local0 == 2 then
			ACTIONS.AnimateSequence( f1_arg0, "Rare" )
		elseif f1_local0 == 3 then
			ACTIONS.AnimateSequence( f1_arg0, "Legendary" )
		elseif f1_local0 == 4 then
			ACTIONS.AnimateSequence( f1_arg0, "Epic" )
		end
	end
	
end

function LootItemCardBurst( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 320 * _1080p, 0, 472 * _1080p )
	self.id = "LootItemCardBurst"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self.soundSet = "activeReload"
	local f3_local2 = self
	local BurstLines1 = nil
	
	BurstLines1 = LUI.UIImage.new()
	BurstLines1.id = "BurstLines1"
	BurstLines1:SetAlpha( 0, 0 )
	BurstLines1:SetScale( -0.4, 0 )
	BurstLines1:setImage( RegisterMaterial( "loot_item_card_burst_lines_01" ), 0 )
	BurstLines1:SetBlendMode( BLEND_MODE.addWithAlpha )
	BurstLines1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -512, _1080p * 512 )
	self:addElement( BurstLines1 )
	self.BurstLines1 = BurstLines1
	
	local BurstLines2 = nil
	
	BurstLines2 = LUI.UIImage.new()
	BurstLines2.id = "BurstLines2"
	BurstLines2:SetAlpha( 0, 0 )
	BurstLines2:SetScale( -0.4, 0 )
	BurstLines2:setImage( RegisterMaterial( "loot_item_card_burst_lines_02" ), 0 )
	BurstLines2:SetBlendMode( BLEND_MODE.addWithAlpha )
	BurstLines2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -512, _1080p * 512 )
	self:addElement( BurstLines2 )
	self.BurstLines2 = BurstLines2
	
	local StarBurst = nil
	
	StarBurst = LUI.UIImage.new()
	StarBurst.id = "StarBurst"
	StarBurst:SetAlpha( 0, 0 )
	StarBurst:SetScale( -0.15, 0 )
	StarBurst:setImage( RegisterMaterial( "loot_item_card_starbursts" ), 0 )
	StarBurst:SetBlendMode( BLEND_MODE.addWithAlpha )
	StarBurst:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -512, _1080p * 512 )
	self:addElement( StarBurst )
	self.StarBurst = StarBurst
	
	local Sparks = nil
	
	Sparks = LUI.UIImage.new()
	Sparks.id = "Sparks"
	Sparks:SetAlpha( 0, 0 )
	Sparks:setImage( RegisterMaterial( "loot_item_card_sparks" ), 0 )
	Sparks:SetUseAA( true )
	Sparks:SetBlendMode( BLEND_MODE.addWithAlpha )
	Sparks:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -512, _1080p * 512 )
	self:addElement( Sparks )
	self.Sparks = Sparks
	
	local Explosion = nil
	
	Explosion = LUI.UIImage.new()
	Explosion.id = "Explosion"
	Explosion:SetAlpha( 0, 0 )
	Explosion:SetScale( -0.35, 0 )
	Explosion:SetBlendMode( BLEND_MODE.addWithAlpha )
	Explosion:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -512, _1080p * 512 )
	self:addElement( Explosion )
	self.Explosion = Explosion
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BurstLines1:RegisterAnimationSequence( "Common", {
			{
				function ()
					return self.BurstLines1:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BurstLines1:SetAlpha( 0, 500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BurstLines1:SetScale( -0.5, 0 )
				end,
				function ()
					return self.BurstLines1:SetScale( -0.4, 500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BurstLines1:SetRGBFromTable( SWATCHES.loot.common, 0 )
				end
			}
		} )
		self._sequences.Common = function ()
			BurstLines1:AnimateSequence( "Common" )
		end
		
		BurstLines1:RegisterAnimationSequence( "Rare", {
			{
				function ()
					return self.BurstLines1:SetRGBFromTable( SWATCHES.loot.rare, 0 )
				end
			},
			{
				function ()
					return self.BurstLines1:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BurstLines1:SetAlpha( 0, 600, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BurstLines1:SetScale( -0.5, 0 )
				end,
				function ()
					return self.BurstLines1:SetScale( -0.4, 600, LUI.EASING.outQuadratic )
				end
			}
		} )
		BurstLines2:RegisterAnimationSequence( "Rare", {
			{
				function ()
					return self.BurstLines2:SetRGBFromTable( SWATCHES.loot.rare, 0 )
				end
			},
			{
				function ()
					return self.BurstLines2:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BurstLines2:SetAlpha( 0, 400, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BurstLines2:SetScale( -0.5, 0 )
				end,
				function ()
					return self.BurstLines2:SetScale( -0.4, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Rare = function ()
			BurstLines1:AnimateSequence( "Rare" )
			BurstLines2:AnimateSequence( "Rare" )
		end
		
		BurstLines1:RegisterAnimationSequence( "Legendary", {
			{
				function ()
					return self.BurstLines1:SetRGBFromTable( SWATCHES.loot.legendary, 0 )
				end
			},
			{
				function ()
					return self.BurstLines1:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BurstLines1:SetAlpha( 0, 700, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BurstLines1:SetScale( -0.5, 0 )
				end,
				function ()
					return self.BurstLines1:SetScale( -0.4, 700, LUI.EASING.outQuadratic )
				end
			}
		} )
		BurstLines2:RegisterAnimationSequence( "Legendary", {
			{
				function ()
					return self.BurstLines2:SetRGBFromTable( SWATCHES.loot.legendary, 0 )
				end
			},
			{
				function ()
					return self.BurstLines2:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BurstLines2:SetAlpha( 0, 500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BurstLines2:SetScale( -0.5, 0 )
				end,
				function ()
					return self.BurstLines2:SetScale( -0.4, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		StarBurst:RegisterAnimationSequence( "Legendary", {
			{
				function ()
					return self.StarBurst:SetRGBFromTable( SWATCHES.loot.legendary, 0 )
				end
			},
			{
				function ()
					return self.StarBurst:SetAlpha( 1, 0 )
				end,
				function ()
					return self.StarBurst:SetAlpha( 0, 600, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.StarBurst:SetScale( -0.3, 0 )
				end,
				function ()
					return self.StarBurst:SetScale( -0.1, 600, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.Legendary = function ()
			BurstLines1:AnimateSequence( "Legendary" )
			BurstLines2:AnimateSequence( "Legendary" )
			StarBurst:AnimateSequence( "Legendary" )
		end
		
		BurstLines1:RegisterAnimationSequence( "Epic", {
			{
				function ()
					return self.BurstLines1:SetRGBFromTable( SWATCHES.loot.epic, 0 )
				end
			},
			{
				function ()
					return self.BurstLines1:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BurstLines1:SetAlpha( 0, 800, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BurstLines1:SetScale( -0.5, 0 )
				end,
				function ()
					return self.BurstLines1:SetScale( -0.4, 800, LUI.EASING.outQuadratic )
				end
			}
		} )
		BurstLines2:RegisterAnimationSequence( "Epic", {
			{
				function ()
					return self.BurstLines2:SetRGBFromTable( SWATCHES.loot.epic, 0 )
				end
			},
			{
				function ()
					return self.BurstLines2:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BurstLines2:SetAlpha( 0, 600, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BurstLines2:SetScale( -0.5, 0 )
				end,
				function ()
					return self.BurstLines2:SetScale( -0.4, 600, LUI.EASING.outQuadratic )
				end
			}
		} )
		StarBurst:RegisterAnimationSequence( "Epic", {
			{
				function ()
					return self.StarBurst:SetRGBFromTable( SWATCHES.loot.epic, 0 )
				end
			},
			{
				function ()
					return self.StarBurst:SetAlpha( 1, 0 )
				end,
				function ()
					return self.StarBurst:SetAlpha( 0, 400, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.StarBurst:SetScale( -0.3, 0 )
				end,
				function ()
					return self.StarBurst:SetScale( -0.1, 400, LUI.EASING.inQuadratic )
				end
			}
		} )
		Sparks:RegisterAnimationSequence( "Epic", {
			{
				function ()
					return self.Sparks:SetRGBFromTable( SWATCHES.loot.epic, 0 )
				end
			},
			{
				function ()
					return self.Sparks:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Sparks:SetAlpha( 0, 800, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Sparks:SetScale( -0.45, 0 )
				end,
				function ()
					return self.Sparks:SetScale( 0, 800, LUI.EASING.outQuadratic )
				end
			}
		} )
		Explosion:RegisterAnimationSequence( "Epic", {
			{
				function ()
					return self.Explosion:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Explosion:SetAlpha( 1, 390 )
				end,
				function ()
					return self.Explosion:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.Explosion:setImage( RegisterMaterial( "loot_item_card_explosion_000" ), 0 )
				end,
				function ()
					return self.Explosion:setImage( RegisterMaterial( "loot_item_card_explosion_001" ), 30 )
				end,
				function ()
					return self.Explosion:setImage( RegisterMaterial( "loot_item_card_explosion_002" ), 30 )
				end,
				function ()
					return self.Explosion:setImage( RegisterMaterial( "loot_item_card_explosion_003" ), 30 )
				end,
				function ()
					return self.Explosion:setImage( RegisterMaterial( "loot_item_card_explosion_004" ), 30 )
				end,
				function ()
					return self.Explosion:setImage( RegisterMaterial( "loot_item_card_explosion_005" ), 30 )
				end,
				function ()
					return self.Explosion:setImage( RegisterMaterial( "loot_item_card_explosion_006" ), 30 )
				end,
				function ()
					return self.Explosion:setImage( RegisterMaterial( "loot_item_card_explosion_007" ), 30 )
				end,
				function ()
					return self.Explosion:setImage( RegisterMaterial( "loot_item_card_explosion_008" ), 30 )
				end,
				function ()
					return self.Explosion:setImage( RegisterMaterial( "loot_item_card_explosion_009" ), 30 )
				end,
				function ()
					return self.Explosion:setImage( RegisterMaterial( "loot_item_card_explosion_010" ), 30 )
				end,
				function ()
					return self.Explosion:setImage( RegisterMaterial( "loot_item_card_explosion_011" ), 30 )
				end,
				function ()
					return self.Explosion:setImage( RegisterMaterial( "loot_item_card_explosion_012" ), 30 )
				end,
				function ()
					return self.Explosion:setImage( RegisterMaterial( "loot_item_card_explosion_013" ), 30 )
				end
			},
			{
				function ()
					return self.Explosion:SetScale( -0.35, 0 )
				end,
				function ()
					return self.Explosion:SetScale( -0.35, 390 )
				end,
				function ()
					return self.Explosion:SetScale( -1, 10 )
				end
			}
		} )
		self._sequences.Epic = function ()
			BurstLines1:AnimateSequence( "Epic" )
			BurstLines2:AnimateSequence( "Epic" )
			StarBurst:AnimateSequence( "Epic" )
			Sparks:AnimateSequence( "Epic" )
			Explosion:AnimateSequence( "Epic" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "LootItemCardBurst", LootItemCardBurst )
LockTable( _M )
