local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questWOR1Widget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 205 * _1080p, 0, 114 * _1080p )
	self.id = "questWOR1Widget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Backing = nil
	
	Backing = LUI.UIImage.new()
	Backing.id = "Backing"
	Backing:SetRGBFromInt( 2302755, 0 )
	Backing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -41.5, _1080p * 376, _1080p * -7, _1080p * 123.2 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local crystalBacking = nil
	
	crystalBacking = LUI.UIImage.new()
	crystalBacking.id = "crystalBacking"
	crystalBacking:SetAlpha( 0.7, 0 )
	crystalBacking:SetZRotation( -26, 0 )
	crystalBacking:setImage( RegisterMaterial( "cp_zmb_sticker_crystal_yellow_empty" ), 0 )
	crystalBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 263, _1080p * 391, _1080p * -4.8, _1080p * 123.2 )
	self:addElement( crystalBacking )
	self.crystalBacking = crystalBacking
	
	local crystal = nil
	
	crystal = LUI.UIImage.new()
	crystal.id = "crystal"
	crystal:SetZRotation( -26, 0 )
	crystal:setImage( RegisterMaterial( "cp_zmb_sticker_crystal_yellow" ), 0 )
	crystal:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 263, _1080p * 391, _1080p * -4.8, _1080p * 123.2 )
	crystal:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetModel( f1_local1 ) )
	self:addElement( crystal )
	self.crystal = crystal
	
	local batteryBacking = nil
	
	batteryBacking = LUI.UIImage.new()
	batteryBacking.id = "batteryBacking"
	batteryBacking:SetAlpha( 0.7, 0 )
	batteryBacking:SetZRotation( -25, 0 )
	batteryBacking:setImage( RegisterMaterial( "cp_zmb_sticker_battery_empty" ), 0 )
	batteryBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -41.5, _1080p * 85.5, _1080p * -7, _1080p * 121 )
	self:addElement( batteryBacking )
	self.batteryBacking = batteryBacking
	
	local battery = nil
	
	battery = LUI.UIImage.new()
	battery.id = "battery"
	battery:SetZRotation( -25, 0 )
	battery:setImage( RegisterMaterial( "cp_zmb_sticker_battery" ), 0 )
	battery:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -41.5, _1080p * 86.5, _1080p * -7, _1080p * 121 )
	battery:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetModel( f1_local1 ) )
	self:addElement( battery )
	self.battery = battery
	
	local monsterBacking = nil
	
	monsterBacking = LUI.UIImage.new()
	monsterBacking.id = "monsterBacking"
	monsterBacking:SetAlpha( 0.7, 0 )
	monsterBacking:SetZRotation( 41, 0 )
	monsterBacking:SetScale( 0.4, 0 )
	monsterBacking:setImage( RegisterMaterial( "cp_zmb_sticker_monster_toy_empty" ), 0 )
	monsterBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 112.1, _1080p * 240.1, _1080p * -17, _1080p * 111 )
	self:addElement( monsterBacking )
	self.monsterBacking = monsterBacking
	
	local monster = nil
	
	monster = LUI.UIImage.new()
	monster.id = "monster"
	monster:SetZRotation( 41, 0 )
	monster:SetScale( 0.4, 0 )
	monster:setImage( RegisterMaterial( "cp_zmb_sticker_monster_toy" ), 0 )
	monster:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 112.1, _1080p * 240.1, _1080p * -17, _1080p * 111 )
	monster:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetModel( f1_local1 ) )
	self:addElement( monster )
	self.monster = monster
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		crystal:RegisterAnimationSequence( "foundPart3", {
			{
				function ()
					return self.crystal:SetScale( 0, 0 )
				end,
				function ()
					return self.crystal:SetScale( 0.5, 200 )
				end,
				function ()
					return self.crystal:SetScale( 0, 200 )
				end,
				function ()
					return self.crystal:SetScale( 0.25, 210 )
				end,
				function ()
					return self.crystal:SetScale( 0, 190 )
				end,
				function ()
					return self.crystal:SetScale( 0.13, 200 )
				end,
				function ()
					return self.crystal:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.foundPart3 = function ()
			crystal:AnimateSequence( "foundPart3" )
		end
		
		monster:RegisterAnimationSequence( "foundPart1", {
			{
				function ()
					return self.monster:SetScale( 0.4, 0 )
				end,
				function ()
					return self.monster:SetScale( 0.8, 200 )
				end,
				function ()
					return self.monster:SetScale( 0.4, 200 )
				end,
				function ()
					return self.monster:SetScale( 0.7, 200 )
				end,
				function ()
					return self.monster:SetScale( 0.4, 200 )
				end,
				function ()
					return self.monster:SetScale( 0.6, 200 )
				end,
				function ()
					return self.monster:SetScale( 0.4, 200 )
				end
			}
		} )
		self._sequences.foundPart1 = function ()
			monster:AnimateSequence( "foundPart1" )
		end
		
		battery:RegisterAnimationSequence( "foundPart2", {
			{
				function ()
					return self.battery:SetScale( 0, 0 )
				end,
				function ()
					return self.battery:SetScale( 0.5, 200 )
				end,
				function ()
					return self.battery:SetScale( 0, 200 )
				end,
				function ()
					return self.battery:SetScale( 0.13, 200 )
				end,
				function ()
					return self.battery:SetScale( 0, 200 )
				end,
				function ()
					return self.battery:SetScale( 0.13, 200 )
				end,
				function ()
					return self.battery:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.foundPart2 = function ()
			battery:AnimateSequence( "foundPart2" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundPart3" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundPart2" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundPart1" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questWOR1Widget", questWOR1Widget )
LockTable( _M )
