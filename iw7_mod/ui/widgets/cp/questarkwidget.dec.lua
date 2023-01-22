local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questArkWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 528 * _1080p, 0, 128 * _1080p )
	self.id = "questArkWidget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ArkQuestBox = nil
	
	ArkQuestBox = LUI.UIImage.new()
	ArkQuestBox.id = "ArkQuestBox"
	ArkQuestBox:SetRGBFromInt( 2302755, 0 )
	ArkQuestBox:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 528, _1080p * -7, _1080p * 138 )
	self:addElement( ArkQuestBox )
	self.ArkQuestBox = ArkQuestBox
	
	local pinkBacking = nil
	
	pinkBacking = LUI.UIImage.new()
	pinkBacking.id = "pinkBacking"
	pinkBacking:SetAlpha( 0.7, 0 )
	pinkBacking:setImage( RegisterMaterial( "cp_zmb_sticker_pink_arcane_empty" ), 0 )
	pinkBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 414, _1080p * 542, _1080p * 2, _1080p * 130 )
	self:addElement( pinkBacking )
	self.pinkBacking = pinkBacking
	
	local pink = nil
	
	pink = LUI.UIImage.new()
	pink.id = "pink"
	pink:setImage( RegisterMaterial( "cp_zmb_sticker_pink_arcane" ), 0 )
	pink:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 414, _1080p * 542, _1080p * 2, _1080p * 130 )
	pink:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetModel( f1_local1 ) )
	self:addElement( pink )
	self.pink = pink
	
	local greenBacking = nil
	
	greenBacking = LUI.UIImage.new()
	greenBacking.id = "greenBacking"
	greenBacking:SetAlpha( 0.7, 0 )
	greenBacking:setImage( RegisterMaterial( "cp_zmb_sticker_green_arcane_empty" ), 0 )
	greenBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 85, _1080p * 213, _1080p * 2, _1080p * 130 )
	self:addElement( greenBacking )
	self.greenBacking = greenBacking
	
	local green = nil
	
	green = LUI.UIImage.new()
	green.id = "green"
	green:setImage( RegisterMaterial( "cp_zmb_sticker_green_arcane" ), 0 )
	green:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 86, _1080p * 214, _1080p * 2, _1080p * 130 )
	green:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetModel( f1_local1 ) )
	self:addElement( green )
	self.green = green
	
	local redBacking = nil
	
	redBacking = LUI.UIImage.new()
	redBacking.id = "redBacking"
	redBacking:SetAlpha( 0.7, 0 )
	redBacking:setImage( RegisterMaterial( "cp_zmb_sticker_red_arcane_empty" ), 0 )
	redBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -11, _1080p * 117, _1080p * 2, _1080p * 130 )
	self:addElement( redBacking )
	self.redBacking = redBacking
	
	local red = nil
	
	red = LUI.UIImage.new()
	red.id = "red"
	red:setImage( RegisterMaterial( "cp_zmb_sticker_red_arcane" ), 0 )
	red:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -11, _1080p * 117, _1080p * 2, _1080p * 130 )
	red:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetModel( f1_local1 ) )
	self:addElement( red )
	self.red = red
	
	local yellowBacking = nil
	
	yellowBacking = LUI.UIImage.new()
	yellowBacking.id = "yellowBacking"
	yellowBacking:SetAlpha( 0.7, 0 )
	yellowBacking:setImage( RegisterMaterial( "cp_zmb_sticker_yellow_arcane_empty" ), 0 )
	yellowBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 183, _1080p * 311, _1080p * 2, _1080p * 130 )
	self:addElement( yellowBacking )
	self.yellowBacking = yellowBacking
	
	local yellow = nil
	
	yellow = LUI.UIImage.new()
	yellow.id = "yellow"
	yellow:setImage( RegisterMaterial( "cp_zmb_sticker_yellow_arcane" ), 0 )
	yellow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 183, _1080p * 311, _1080p * 2, _1080p * 130 )
	yellow:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetModel( f1_local1 ) )
	self:addElement( yellow )
	self.yellow = yellow
	
	local blueBacking = nil
	
	blueBacking = LUI.UIImage.new()
	blueBacking.id = "blueBacking"
	blueBacking:SetAlpha( 0.7, 0 )
	blueBacking:setImage( RegisterMaterial( "cp_zmb_sticker_blue_arcane_empty" ), 0 )
	blueBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 310, _1080p * 438, _1080p * 2, _1080p * 130 )
	self:addElement( blueBacking )
	self.blueBacking = blueBacking
	
	local blue = nil
	
	blue = LUI.UIImage.new()
	blue.id = "blue"
	blue:setImage( RegisterMaterial( "cp_zmb_sticker_blue_arcane" ), 0 )
	blue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 310, _1080p * 438, _1080p * 2, _1080p * 130 )
	blue:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetModel( f1_local1 ) )
	self:addElement( blue )
	self.blue = blue
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		green:RegisterAnimationSequence( "ArkGreenOn", {
			{
				function ()
					return self.green:SetScale( 0, 350 )
				end,
				function ()
					return self.green:SetScale( 0.5, 200 )
				end,
				function ()
					return self.green:SetScale( 0, 200 )
				end,
				function ()
					return self.green:SetScale( 0.25, 200 )
				end,
				function ()
					return self.green:SetScale( 0, 200 )
				end,
				function ()
					return self.green:SetScale( 0.13, 200 )
				end,
				function ()
					return self.green:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.ArkGreenOn = function ()
			green:AnimateSequence( "ArkGreenOn" )
		end
		
		pink:RegisterAnimationSequence( "ArkPinkOn", {
			{
				function ()
					return self.pink:SetScale( 0, 350 )
				end,
				function ()
					return self.pink:SetScale( 0.5, 200 )
				end,
				function ()
					return self.pink:SetScale( 0, 200 )
				end,
				function ()
					return self.pink:SetScale( 0.25, 200 )
				end,
				function ()
					return self.pink:SetScale( 0, 200 )
				end,
				function ()
					return self.pink:SetScale( 0.13, 200 )
				end,
				function ()
					return self.pink:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.ArkPinkOn = function ()
			pink:AnimateSequence( "ArkPinkOn" )
		end
		
		yellow:RegisterAnimationSequence( "ArkYellowOn", {
			{
				function ()
					return self.yellow:SetScale( 0, 350 )
				end,
				function ()
					return self.yellow:SetScale( 0.5, 200 )
				end,
				function ()
					return self.yellow:SetScale( 0, 200 )
				end,
				function ()
					return self.yellow:SetScale( 0.25, 190 )
				end,
				function ()
					return self.yellow:SetScale( 0, 210 )
				end,
				function ()
					return self.yellow:SetScale( 0.13, 200 )
				end,
				function ()
					return self.yellow:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.ArkYellowOn = function ()
			yellow:AnimateSequence( "ArkYellowOn" )
		end
		
		blue:RegisterAnimationSequence( "ArkBlueOn", {
			{
				function ()
					return self.blue:SetScale( 0, 350 )
				end,
				function ()
					return self.blue:SetScale( 0.5, 200 )
				end,
				function ()
					return self.blue:SetScale( 0, 200 )
				end,
				function ()
					return self.blue:SetScale( 0.25, 200 )
				end,
				function ()
					return self.blue:SetScale( 0, 200 )
				end,
				function ()
					return self.blue:SetScale( 0.13, 200 )
				end,
				function ()
					return self.blue:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.ArkBlueOn = function ()
			blue:AnimateSequence( "ArkBlueOn" )
		end
		
		red:RegisterAnimationSequence( "ArkRedOn", {
			{
				function ()
					return self.red:SetScale( 0, 350 )
				end,
				function ()
					return self.red:SetScale( 0.5, 200 )
				end,
				function ()
					return self.red:SetScale( 0, 200 )
				end,
				function ()
					return self.red:SetScale( 0.25, 200 )
				end,
				function ()
					return self.red:SetScale( 0, 200 )
				end,
				function ()
					return self.red:SetScale( 0.13, 200 )
				end,
				function ()
					return self.red:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.ArkRedOn = function ()
			red:AnimateSequence( "ArkRedOn" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "ArkPinkOn" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "ArkBlueOn" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "ArkGreenOn" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "ArkYellowOn" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "ArkRedOn" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questArkWidget", questArkWidget )
LockTable( _M )
