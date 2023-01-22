local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questWOR4Widget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 205 * _1080p, 0, 114 * _1080p )
	self.id = "questWOR4Widget"
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
	Backing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -15.5, _1080p * 351.5, _1080p * -11.8, _1080p * 128.2 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local crystalBacking = nil
	
	crystalBacking = LUI.UIImage.new()
	crystalBacking.id = "crystalBacking"
	crystalBacking:SetAlpha( 0.7, 0 )
	crystalBacking:SetZRotation( 10, 0 )
	crystalBacking:setImage( RegisterMaterial( "cp_zmb_sticker_crystal_red_empty" ), 0 )
	crystalBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 250, _1080p * 378, _1080p * -4.8, _1080p * 123.2 )
	self:addElement( crystalBacking )
	self.crystalBacking = crystalBacking
	
	local crystal = nil
	
	crystal = LUI.UIImage.new()
	crystal.id = "crystal"
	crystal:SetZRotation( 10, 0 )
	crystal:setImage( RegisterMaterial( "cp_zmb_sticker_crystal_red" ), 0 )
	crystal:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 251, _1080p * 379, _1080p * -5, _1080p * 123 )
	crystal:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha:GetModel( f1_local1 ) )
	self:addElement( crystal )
	self.crystal = crystal
	
	local angryMikeBacking = nil
	
	angryMikeBacking = LUI.UIImage.new()
	angryMikeBacking.id = "angryMikeBacking"
	angryMikeBacking:SetAlpha( 0.7, 0 )
	angryMikeBacking:SetZRotation( -25, 0 )
	angryMikeBacking:SetScale( 0.2, 0 )
	angryMikeBacking:setImage( RegisterMaterial( "cp_zmb_sticker_angry_mike_empty" ), 0 )
	angryMikeBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 141, _1080p * 269, _1080p * -21, _1080p * 107 )
	self:addElement( angryMikeBacking )
	self.angryMikeBacking = angryMikeBacking
	
	local angryMike = nil
	
	angryMike = LUI.UIImage.new()
	angryMike.id = "angryMike"
	angryMike:SetZRotation( -25, 0 )
	angryMike:SetScale( 0.2, 0 )
	angryMike:setImage( RegisterMaterial( "cp_zmb_sticker_angry_mike" ), 0 )
	angryMike:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 141, _1080p * 269, _1080p * -21, _1080p * 107 )
	angryMike:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetModel( f1_local1 ) )
	self:addElement( angryMike )
	self.angryMike = angryMike
	
	local batteryBacking = nil
	
	batteryBacking = LUI.UIImage.new()
	batteryBacking.id = "batteryBacking"
	batteryBacking:SetAlpha( 0.7, 0 )
	batteryBacking:SetZRotation( 23, 0 )
	batteryBacking:setImage( RegisterMaterial( "cp_zmb_sticker_battery_empty" ), 0 )
	batteryBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -16.5, _1080p * 111.5, _1080p * -7, _1080p * 121 )
	self:addElement( batteryBacking )
	self.batteryBacking = batteryBacking
	
	local battery = nil
	
	battery = LUI.UIImage.new()
	battery.id = "battery"
	battery:SetZRotation( 23, 0 )
	battery:setImage( RegisterMaterial( "cp_zmb_sticker_battery" ), 0 )
	battery:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -16.5, _1080p * 111.5, _1080p * -7, _1080p * 121 )
	battery:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetModel( f1_local1 ) )
	self:addElement( battery )
	self.battery = battery
	
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
		
		battery:RegisterAnimationSequence( "foundPart1", {
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
		self._sequences.foundPart1 = function ()
			battery:AnimateSequence( "foundPart1" )
		end
		
		angryMike:RegisterAnimationSequence( "foundPart2", {
			{
				function ()
					return self.angryMike:SetScale( 0.2, 0 )
				end,
				function ()
					return self.angryMike:SetScale( 0.6, 200 )
				end,
				function ()
					return self.angryMike:SetScale( 0.2, 200 )
				end,
				function ()
					return self.angryMike:SetScale( 0.45, 200 )
				end,
				function ()
					return self.angryMike:SetScale( 0.2, 200 )
				end,
				function ()
					return self.angryMike:SetScale( 0.3, 200 )
				end,
				function ()
					return self.angryMike:SetScale( 0.2, 200 )
				end
			}
		} )
		self._sequences.foundPart2 = function ()
			angryMike:AnimateSequence( "foundPart2" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundPart3" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundPart2" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundPart1" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questWOR4Widget", questWOR4Widget )
LockTable( _M )
