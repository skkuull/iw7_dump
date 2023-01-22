local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questWOR2Widget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 205 * _1080p, 0, 114 * _1080p )
	self.id = "questWOR2Widget"
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
	Backing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -46.5, _1080p * 343, _1080p * -5, _1080p * 123.2 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local crystalBacking = nil
	
	crystalBacking = LUI.UIImage.new()
	crystalBacking.id = "crystalBacking"
	crystalBacking:SetAlpha( 0.7, 0 )
	crystalBacking:setImage( RegisterMaterial( "cp_zmb_sticker_crystal_blue_empty" ), 0 )
	crystalBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 240, _1080p * 368, 0, _1080p * 128 )
	self:addElement( crystalBacking )
	self.crystalBacking = crystalBacking
	
	local crystal = nil
	
	crystal = LUI.UIImage.new()
	crystal.id = "crystal"
	crystal:setImage( RegisterMaterial( "cp_zmb_sticker_crystal_blue" ), 0 )
	crystal:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241, _1080p * 369, 0, _1080p * 128 )
	crystal:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part3Alpha:GetModel( f1_local1 ) )
	self:addElement( crystal )
	self.crystal = crystal
	
	local batteryBacking = nil
	
	batteryBacking = LUI.UIImage.new()
	batteryBacking.id = "batteryBacking"
	batteryBacking:SetAlpha( 0.7, 0 )
	batteryBacking:SetZRotation( 26, 0 )
	batteryBacking:setImage( RegisterMaterial( "cp_zmb_sticker_battery_empty" ), 0 )
	batteryBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -46.5, _1080p * 81.5, _1080p * -4.8, _1080p * 123.2 )
	self:addElement( batteryBacking )
	self.batteryBacking = batteryBacking
	
	local battery = nil
	
	battery = LUI.UIImage.new()
	battery.id = "battery"
	battery:SetZRotation( 26, 0 )
	battery:setImage( RegisterMaterial( "cp_zmb_sticker_battery" ), 0 )
	battery:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -45.86, _1080p * 82.14, _1080p * -4.8, _1080p * 123.2 )
	battery:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetModel( f1_local1 ) )
	self:addElement( battery )
	self.battery = battery
	
	local shuttleBacking = nil
	
	shuttleBacking = LUI.UIImage.new()
	shuttleBacking.id = "shuttleBacking"
	shuttleBacking:SetAlpha( 0.7, 0 )
	shuttleBacking:SetZRotation( 45, 0 )
	shuttleBacking:SetScale( 0.5, 0 )
	shuttleBacking:setImage( RegisterMaterial( "cp_zmb_sticker_space_shuttle_empty" ), 0 )
	shuttleBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 93.1, _1080p * 221.1, _1080p * -18, _1080p * 110 )
	self:addElement( shuttleBacking )
	self.shuttleBacking = shuttleBacking
	
	local shuttle = nil
	
	shuttle = LUI.UIImage.new()
	shuttle.id = "shuttle"
	shuttle:SetZRotation( 45, 0 )
	shuttle:SetScale( 0.5, 0 )
	shuttle:setImage( RegisterMaterial( "cp_zmb_sticker_space_shuttle" ), 0 )
	shuttle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95.1, _1080p * 223.1, _1080p * -18, _1080p * 110 )
	shuttle:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetModel( f1_local1 ) )
	self:addElement( shuttle )
	self.shuttle = shuttle
	
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
		
		shuttle:RegisterAnimationSequence( "foundPart1", {
			{
				function ()
					return self.shuttle:SetScale( 0.5, 0 )
				end,
				function ()
					return self.shuttle:SetScale( 1, 200 )
				end,
				function ()
					return self.shuttle:SetScale( 0.5, 200 )
				end,
				function ()
					return self.shuttle:SetScale( 0.8, 200 )
				end,
				function ()
					return self.shuttle:SetScale( 0.5, 200 )
				end,
				function ()
					return self.shuttle:SetScale( 0.65, 200 )
				end,
				function ()
					return self.shuttle:SetScale( 0.5, 200 )
				end
			}
		} )
		self._sequences.foundPart1 = function ()
			shuttle:AnimateSequence( "foundPart1" )
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
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundPart3" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundPart2" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundPart1" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questWOR2Widget", questWOR2Widget )
LockTable( _M )
