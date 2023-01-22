local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questWOR3Widget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 205 * _1080p, 0, 114 * _1080p )
	self.id = "questWOR3Widget"
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
	Backing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -32.5, _1080p * 333, _1080p * -6, _1080p * 124 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local crystalBacking = nil
	
	crystalBacking = LUI.UIImage.new()
	crystalBacking.id = "crystalBacking"
	crystalBacking:SetAlpha( 0.7, 0 )
	crystalBacking:SetZRotation( 15, 0 )
	crystalBacking:setImage( RegisterMaterial( "cp_zmb_sticker_crystal_green_empty" ), 0 )
	crystalBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 226.47, _1080p * 354.47, 0, _1080p * 128 )
	self:addElement( crystalBacking )
	self.crystalBacking = crystalBacking
	
	local crystal = nil
	
	crystal = LUI.UIImage.new()
	crystal.id = "crystal"
	crystal:SetZRotation( 15, 0 )
	crystal:setImage( RegisterMaterial( "cp_zmb_sticker_crystal_green" ), 0 )
	crystal:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 227.47, _1080p * 355.47, 0, _1080p * 128 )
	crystal:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha:GetModel( f1_local1 ) )
	self:addElement( crystal )
	self.crystal = crystal
	
	local batteryBacking = nil
	
	batteryBacking = LUI.UIImage.new()
	batteryBacking.id = "batteryBacking"
	batteryBacking:SetAlpha( 0.7, 0 )
	batteryBacking:SetZRotation( -19, 0 )
	batteryBacking:setImage( RegisterMaterial( "cp_zmb_sticker_battery_empty" ), 0 )
	batteryBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -37.5, _1080p * 90.5, _1080p * -6, _1080p * 122 )
	self:addElement( batteryBacking )
	self.batteryBacking = batteryBacking
	
	local battery = nil
	
	battery = LUI.UIImage.new()
	battery.id = "battery"
	battery:SetZRotation( -19, 0 )
	battery:setImage( RegisterMaterial( "cp_zmb_sticker_battery" ), 0 )
	battery:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -37.5, _1080p * 90.5, _1080p * -6, _1080p * 122 )
	battery:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetModel( f1_local1 ) )
	self:addElement( battery )
	self.battery = battery
	
	local discoBacking = nil
	
	discoBacking = LUI.UIImage.new()
	discoBacking.id = "discoBacking"
	discoBacking:SetAlpha( 0.7, 0 )
	discoBacking:setImage( RegisterMaterial( "cp_zmb_sticker_discoball_empty" ), 0 )
	discoBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 104.47, _1080p * 232.47, _1080p * -7, _1080p * 121 )
	self:addElement( discoBacking )
	self.discoBacking = discoBacking
	
	local disco = nil
	
	disco = LUI.UIImage.new()
	disco.id = "disco"
	disco:setImage( RegisterMaterial( "cp_zmb_sticker_discoball" ), 0 )
	disco:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 104.47, _1080p * 232.47, _1080p * -7, _1080p * 121 )
	disco:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetModel( f1_local1 ) )
	self:addElement( disco )
	self.disco = disco
	
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
					return self.crystal:SetScale( 0.25, 200 )
				end,
				function ()
					return self.crystal:SetScale( 0, 200 )
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
		
		disco:RegisterAnimationSequence( "foundPart1", {
			{
				function ()
					return self.disco:SetScale( 0, 0 )
				end,
				function ()
					return self.disco:SetScale( 0.5, 200 )
				end,
				function ()
					return self.disco:SetScale( 0, 200 )
				end,
				function ()
					return self.disco:SetScale( 0.25, 210 )
				end,
				function ()
					return self.disco:SetScale( 0, 190 )
				end,
				function ()
					return self.disco:SetScale( 0.13, 200 )
				end,
				function ()
					return self.disco:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.foundPart1 = function ()
			disco:AnimateSequence( "foundPart1" )
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
					return self.battery:SetScale( 0.25, 200 )
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
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundPart3" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundPart2" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundPart1" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questWOR3Widget", questWOR3Widget )
LockTable( _M )
