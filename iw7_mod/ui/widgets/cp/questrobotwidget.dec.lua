local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questRobotWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 377 * _1080p, 0, 132 * _1080p )
	self.id = "questRobotWidget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local RobotQuestBox = nil
	
	RobotQuestBox = LUI.UIImage.new()
	RobotQuestBox.id = "RobotQuestBox"
	RobotQuestBox:SetRGBFromInt( 2302755, 0 )
	RobotQuestBox:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 377, 0, _1080p * 131 )
	self:addElement( RobotQuestBox )
	self.RobotQuestBox = RobotQuestBox
	
	local powerBacking = nil
	
	powerBacking = LUI.UIImage.new()
	powerBacking.id = "powerBacking"
	powerBacking:SetAlpha( 0.7, 0 )
	powerBacking:setImage( RegisterMaterial( "cp_zmb_sticker_power_adapter_empty" ), 0 )
	powerBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 125.4, _1080p * 253.4, 0, _1080p * 128 )
	self:addElement( powerBacking )
	self.powerBacking = powerBacking
	
	local power = nil
	
	power = LUI.UIImage.new()
	power.id = "power"
	power:setImage( RegisterMaterial( "cp_zmb_sticker_power_adapter" ), 0 )
	power:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 125.4, _1080p * 253.4, 0, _1080p * 128 )
	power:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetModel( f1_local1 ) )
	self:addElement( power )
	self.power = power
	
	local robotBacking = nil
	
	robotBacking = LUI.UIImage.new()
	robotBacking.id = "robotBacking"
	robotBacking:SetAlpha( 0.7, 0 )
	robotBacking:SetScale( 0.2, 0 )
	robotBacking:setImage( RegisterMaterial( "cp_zmb_sticker_robot_head_empty" ), 0 )
	robotBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12, _1080p * 140, _1080p * -5, _1080p * 123 )
	self:addElement( robotBacking )
	self.robotBacking = robotBacking
	
	local robot = nil
	
	robot = LUI.UIImage.new()
	robot.id = "robot"
	robot:SetScale( 0.2, 0 )
	robot:setImage( RegisterMaterial( "cp_zmb_sticker_robot_head" ), 0 )
	robot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12, _1080p * 140, _1080p * -5, _1080p * 123 )
	robot:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetModel( f1_local1 ) )
	self:addElement( robot )
	self.robot = robot
	
	local floppyBacking = nil
	
	floppyBacking = LUI.UIImage.new()
	floppyBacking.id = "floppyBacking"
	floppyBacking:SetAlpha( 0.7, 0 )
	floppyBacking:setImage( RegisterMaterial( "cp_zmb_sticker_floppy_disk_empty" ), 0 )
	floppyBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 244.96, _1080p * 372.96, 0, _1080p * 128 )
	self:addElement( floppyBacking )
	self.floppyBacking = floppyBacking
	
	local floppy = nil
	
	floppy = LUI.UIImage.new()
	floppy.id = "floppy"
	floppy:setImage( RegisterMaterial( "cp_zmb_sticker_floppy_disk" ), 0 )
	floppy:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 244.96, _1080p * 372.96, 0, _1080p * 128 )
	floppy:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetModel( f1_local1 ) )
	self:addElement( floppy )
	self.floppy = floppy
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		robot:RegisterAnimationSequence( "robotHead", {
			{
				function ()
					return self.robot:SetScale( 0.2, 0 )
				end,
				function ()
					return self.robot:SetScale( 0.6, 250 )
				end,
				function ()
					return self.robot:SetScale( 0.2, 250 )
				end,
				function ()
					return self.robot:SetScale( 0.45, 250 )
				end,
				function ()
					return self.robot:SetScale( 0.2, 250 )
				end,
				function ()
					return self.robot:SetScale( 0.3, 250 )
				end,
				function ()
					return self.robot:SetScale( 0.2, 250 )
				end
			}
		} )
		self._sequences.robotHead = function ()
			robot:AnimateSequence( "robotHead" )
		end
		
		power:RegisterAnimationSequence( "robotBattery", {
			{
				function ()
					return self.power:SetScale( 0, 0 )
				end,
				function ()
					return self.power:SetScale( 0.5, 250 )
				end,
				function ()
					return self.power:SetScale( 0, 250 )
				end,
				function ()
					return self.power:SetScale( 0.25, 250 )
				end,
				function ()
					return self.power:SetScale( 0, 250 )
				end,
				function ()
					return self.power:SetScale( 0.13, 250 )
				end,
				function ()
					return self.power:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.robotBattery = function ()
			power:AnimateSequence( "robotBattery" )
		end
		
		floppy:RegisterAnimationSequence( "RobotFloppy", {
			{
				function ()
					return self.floppy:SetScale( 0, 0 )
				end,
				function ()
					return self.floppy:SetScale( 0.5, 250 )
				end,
				function ()
					return self.floppy:SetScale( 0, 250 )
				end,
				function ()
					return self.floppy:SetScale( 0.25, 250 )
				end,
				function ()
					return self.floppy:SetScale( 0, 250 )
				end,
				function ()
					return self.floppy:SetScale( 0.13, 250 )
				end,
				function ()
					return self.floppy:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.RobotFloppy = function ()
			floppy:AnimateSequence( "RobotFloppy" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "robotHead" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "robotBattery" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "RobotFloppy" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questRobotWidget", questRobotWidget )
LockTable( _M )
