local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = {
	{
		color = SWATCHES.itemRarity.qualityBase,
		icon = "icon_item_quality_0",
		frame = ""
	},
	{
		color = SWATCHES.itemRarity.quality0,
		icon = "icon_item_quality_1",
		frame = "loot_item_card_frame_common"
	},
	{
		color = SWATCHES.itemRarity.quality1,
		icon = "icon_item_quality_2",
		frame = "loot_item_card_frame_rare"
	},
	{
		color = SWATCHES.itemRarity.quality2,
		icon = "icon_item_quality_3",
		frame = "loot_item_card_frame_lengendary"
	},
	{
		color = SWATCHES.itemRarity.quality3,
		icon = "icon_item_quality_4",
		frame = "loot_item_card_frame_epic"
	}
}
f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = assert
	local f1_local1 = f1_arg0.Flare1
	if f1_local1 then
		f1_local1 = f1_arg0.Flare2 and f1_arg0.Flare3
	end
	f1_local0( f1_local1, "WARNING: Loot Item Card Flare Items Are Missing..." )
	f1_arg0.randomize = true
	f1_local0 = function ( f2_arg0 )
		local f2_local0 = nil
		local f2_local1 = function ()
			local f3_local0 = math.random( 0, 360 )
			local f3_local1 = math.random( 1000, 3000 )
			local f3_local2 = math.random( 5, 25 ) * 0.01
			local f3_local3 = math.random( -50, 0 ) * 0.01
			local f3_local4 = math.random( LUI.EASING.linear, LUI.EASING.inOutBack )
			local f3_local5 = math.random( 0, 4 )
			f2_arg0:SetZRotation( f3_local0, f3_local1, f3_local4 )
			f2_arg0:SetAlpha( f3_local2, f3_local1, f3_local4 )
			f2_arg0:SetScale( f3_local3, f3_local1, f3_local4 )
			local f3_local6 = f2_arg0:Wait( f3_local1 )
			f3_local6.onComplete = function ()
				if f1_arg0.randomize then
					f2_local0()
				else
					f2_arg0:SetAlpha( 0 )
				end
			end
			
		end
		
		f2_local1()
	end
	
	f1_local0( f1_arg0.Flare1 )
	f1_local0( f1_arg0.Flare2 )
	f1_local0( f1_arg0.Flare3 )
end

function LootItemCardFlare( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "LootItemCardFlare"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local Flare1 = nil
	
	Flare1 = LUI.UIImage.new()
	Flare1.id = "Flare1"
	Flare1:SetAlpha( 0.05, 0 )
	Flare1:setImage( RegisterMaterial( "loot_item_card_flare" ), 0 )
	Flare1:SetUseAA( true )
	Flare1:SetBlendMode( BLEND_MODE.addWithAlpha )
	Flare1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( Flare1 )
	self.Flare1 = Flare1
	
	local Flare2 = nil
	
	Flare2 = LUI.UIImage.new()
	Flare2.id = "Flare2"
	Flare2:SetAlpha( 0, 0 )
	Flare2:setImage( RegisterMaterial( "loot_item_card_flare" ), 0 )
	Flare2:SetUseAA( true )
	Flare2:SetBlendMode( BLEND_MODE.addWithAlpha )
	Flare2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( Flare2 )
	self.Flare2 = Flare2
	
	local Flare3 = nil
	
	Flare3 = LUI.UIImage.new()
	Flare3.id = "Flare3"
	Flare3:SetAlpha( 0, 0 )
	Flare3:setImage( RegisterMaterial( "loot_item_card_flare" ), 0 )
	Flare3:SetUseAA( true )
	Flare3:SetBlendMode( BLEND_MODE.addWithAlpha )
	Flare3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( Flare3 )
	self.Flare3 = Flare3
	
	f0_local1( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "LootItemCardFlare", LootItemCardFlare )
LockTable( _M )
