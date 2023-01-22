local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questRecorderWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 312 * _1080p, 0, 106 * _1080p )
	self.id = "questRecorderWidget"
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
	Backing:SetRGBFromInt( 0, 0 )
	Backing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -7.35, _1080p * 386.62, _1080p * -9.06, _1080p * 117.44 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local CalculatorBackground = nil
	
	CalculatorBackground = LUI.UIImage.new()
	CalculatorBackground.id = "CalculatorBackground"
	CalculatorBackground:SetAlpha( 0.7, 0 )
	CalculatorBackground:setImage( RegisterMaterial( "cp_zmb_sticker_calculator_empty" ), 0 )
	CalculatorBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -16.37, _1080p * 111.63, _1080p * -12.34, _1080p * 115.66 )
	self:addElement( CalculatorBackground )
	self.CalculatorBackground = CalculatorBackground
	
	local Calculator = nil
	
	Calculator = LUI.UIImage.new()
	Calculator.id = "Calculator"
	Calculator:setImage( RegisterMaterial( "cp_zmb_sticker_calculator" ), 0 )
	Calculator:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -16.37, _1080p * 111.63, _1080p * -12.34, _1080p * 115.66 )
	Calculator:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetModel( f1_local1 ) )
	self:addElement( Calculator )
	self.Calculator = Calculator
	
	local RadioBackground = nil
	
	RadioBackground = LUI.UIImage.new()
	RadioBackground.id = "RadioBackground"
	RadioBackground:SetAlpha( 0.7, 0 )
	RadioBackground:SetScale( 0.2, 0 )
	RadioBackground:setImage( RegisterMaterial( "cp_zmb_sticker_radio_empty" ), 0 )
	RadioBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 119, _1080p * 247, _1080p * -21.34, _1080p * 106.66 )
	self:addElement( RadioBackground )
	self.RadioBackground = RadioBackground
	
	local Radio = nil
	
	Radio = LUI.UIImage.new()
	Radio.id = "Radio"
	Radio:SetScale( 0.2, 0 )
	Radio:setImage( RegisterMaterial( "cp_zmb_sticker_radio" ), 0 )
	Radio:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 118.24, _1080p * 246.24, _1080p * -21.34, _1080p * 106.66 )
	Radio:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetModel( f1_local1 ) )
	self:addElement( Radio )
	self.Radio = Radio
	
	local UmbrellaBackground = nil
	
	UmbrellaBackground = LUI.UIImage.new()
	UmbrellaBackground.id = "UmbrellaBackground"
	UmbrellaBackground:SetAlpha( 0.7, 0 )
	UmbrellaBackground:setImage( RegisterMaterial( "cp_zmb_sticker_umbrella_empty" ), 0 )
	UmbrellaBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 247, _1080p * 375, _1080p * -12.06, _1080p * 115.94 )
	self:addElement( UmbrellaBackground )
	self.UmbrellaBackground = UmbrellaBackground
	
	local Umbrella = nil
	
	Umbrella = LUI.UIImage.new()
	Umbrella.id = "Umbrella"
	Umbrella:setImage( RegisterMaterial( "cp_zmb_sticker_umbrella" ), 0 )
	Umbrella:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 248, _1080p * 376, _1080p * -12.34, _1080p * 115.66 )
	Umbrella:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetModel( f1_local1 ) )
	self:addElement( Umbrella )
	self.Umbrella = Umbrella
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CalculatorBackground:RegisterAnimationSequence( "Part1", {
			{
				function ()
					return self.CalculatorBackground:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CalculatorBackground:SetAlpha( 0, 350 )
				end,
				function ()
					return self.CalculatorBackground:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.CalculatorBackground:SetAlpha( 1, 200 )
				end
			}
		} )
		Calculator:RegisterAnimationSequence( "Part1", {
			{
				function ()
					return self.Calculator:SetScale( 0, 350 )
				end,
				function ()
					return self.Calculator:SetScale( 0.5, 200 )
				end,
				function ()
					return self.Calculator:SetScale( 0, 200 )
				end,
				function ()
					return self.Calculator:SetScale( 0.25, 200 )
				end,
				function ()
					return self.Calculator:SetScale( 0, 200 )
				end,
				function ()
					return self.Calculator:SetScale( 0.13, 200 )
				end,
				function ()
					return self.Calculator:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.Part1 = function ()
			CalculatorBackground:AnimateSequence( "Part1" )
			Calculator:AnimateSequence( "Part1" )
		end
		
		RadioBackground:RegisterAnimationSequence( "Part2", {
			{
				function ()
					return self.RadioBackground:SetAlpha( 1, 0 )
				end,
				function ()
					return self.RadioBackground:SetAlpha( 0, 350 )
				end,
				function ()
					return self.RadioBackground:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.RadioBackground:SetAlpha( 1, 200 )
				end
			}
		} )
		Radio:RegisterAnimationSequence( "Part2", {
			{
				function ()
					return self.Radio:SetScale( 0.2, 350 )
				end,
				function ()
					return self.Radio:SetScale( 0.6, 200 )
				end,
				function ()
					return self.Radio:SetScale( 0.2, 200 )
				end,
				function ()
					return self.Radio:SetScale( 0.45, 200 )
				end,
				function ()
					return self.Radio:SetScale( 0.2, 200 )
				end,
				function ()
					return self.Radio:SetScale( 0.3, 200 )
				end,
				function ()
					return self.Radio:SetScale( 0.2, 200 )
				end
			}
		} )
		self._sequences.Part2 = function ()
			RadioBackground:AnimateSequence( "Part2" )
			Radio:AnimateSequence( "Part2" )
		end
		
		UmbrellaBackground:RegisterAnimationSequence( "Part3", {
			{
				function ()
					return self.UmbrellaBackground:SetAlpha( 1, 0 )
				end,
				function ()
					return self.UmbrellaBackground:SetAlpha( 0, 350 )
				end,
				function ()
					return self.UmbrellaBackground:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.UmbrellaBackground:SetAlpha( 1, 200 )
				end
			}
		} )
		Umbrella:RegisterAnimationSequence( "Part3", {
			{
				function ()
					return self.Umbrella:SetScale( 0, 350 )
				end,
				function ()
					return self.Umbrella:SetScale( 0.5, 200 )
				end,
				function ()
					return self.Umbrella:SetScale( 0, 200 )
				end,
				function ()
					return self.Umbrella:SetScale( 0.25, 200 )
				end,
				function ()
					return self.Umbrella:SetScale( 0, 200 )
				end,
				function ()
					return self.Umbrella:SetScale( 0.13, 200 )
				end,
				function ()
					return self.Umbrella:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.Part3 = function ()
			UmbrellaBackground:AnimateSequence( "Part3" )
			Umbrella:AnimateSequence( "Part3" )
		end
		
		self._sequences.questComplete = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Part1" )
		end
		if DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) == 1 and DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) == 1 and DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "questComplete" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Part2" )
		end
		if DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) == 1 and DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) == 1 and DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "questComplete" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Part3" )
		end
		if DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) == 1 and DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) == 1 and DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "questComplete" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questRecorderWidget", questRecorderWidget )
LockTable( _M )
