local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARUnlockItemImage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 150 * _1080p )
	self.id = "AARUnlockItemImage"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local unlockImage = nil
	
	unlockImage = LUI.UIImage.new()
	unlockImage.id = "unlockImage"
	unlockImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -144, _1080p * 144, _1080p * -72, _1080p * 72 )
	unlockImage:SubscribeToModelThroughElement( self, "image", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.image:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			unlockImage:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( unlockImage )
	self.unlockImage = unlockImage
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		unlockImage:RegisterAnimationSequence( "Weapon", {
			{
				function ()
					return self.unlockImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -144, _1080p * 144, _1080p * -72, _1080p * 72, 0 )
				end
			}
		} )
		self._sequences.Weapon = function ()
			unlockImage:AnimateSequence( "Weapon" )
		end
		
		unlockImage:RegisterAnimationSequence( "Attachment", {
			{
				function ()
					return self.unlockImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -72, _1080p * 72, _1080p * -72, _1080p * 72, 0 )
				end
			}
		} )
		self._sequences.Attachment = function ()
			unlockImage:AnimateSequence( "Attachment" )
		end
		
		unlockImage:RegisterAnimationSequence( "Rig", {
			{
				function ()
					return self.unlockImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -170, _1080p * 170, _1080p * -42, _1080p * 42, 0 )
				end
			}
		} )
		self._sequences.Rig = function ()
			unlockImage:AnimateSequence( "Rig" )
		end
		
		unlockImage:RegisterAnimationSequence( "Power", {
			{
				function ()
					return self.unlockImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -72, _1080p * 72, _1080p * -72, _1080p * 72, 0 )
				end
			}
		} )
		self._sequences.Power = function ()
			unlockImage:AnimateSequence( "Power" )
		end
		
		unlockImage:RegisterAnimationSequence( "Killstreak", {
			{
				function ()
					return self.unlockImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -72, _1080p * 72, _1080p * -72, _1080p * 72, 0 )
				end
			}
		} )
		self._sequences.Killstreak = function ()
			unlockImage:AnimateSequence( "Killstreak" )
		end
		
		unlockImage:RegisterAnimationSequence( "Challenge", {
			{
				function ()
					return self.unlockImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -72, _1080p * 72, _1080p * -72, _1080p * 72, 0 )
				end
			}
		} )
		self._sequences.Challenge = function ()
			unlockImage:AnimateSequence( "Challenge" )
		end
		
		unlockImage:RegisterAnimationSequence( "Perk", {
			{
				function ()
					return self.unlockImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -72, _1080p * 72, _1080p * -72, _1080p * 72, 0 )
				end
			}
		} )
		self._sequences.Perk = function ()
			unlockImage:AnimateSequence( "Perk" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "type", function ()
		local f19_local0 = self:GetDataSource()
		if f19_local0.type:GetValue( f1_local1 ) ~= nil then
			f19_local0 = self:GetDataSource()
			if f19_local0.type:GetValue( f1_local1 ) == "weapon" then
				ACTIONS.AnimateSequence( self, "Weapon" )
			end
		end
		f19_local0 = self:GetDataSource()
		if f19_local0.isAttachment:GetValue( f1_local1 ) ~= nil then
			f19_local0 = self:GetDataSource()
			if f19_local0.isAttachment:GetValue( f1_local1 ) == true then
				ACTIONS.AnimateSequence( self, "Attachment" )
			end
		end
		f19_local0 = self:GetDataSource()
		if f19_local0.type:GetValue( f1_local1 ) ~= nil then
			f19_local0 = self:GetDataSource()
			if f19_local0.type:GetValue( f1_local1 ) == "rig" then
				ACTIONS.AnimateSequence( self, "Rig" )
			end
		end
		f19_local0 = self:GetDataSource()
		if f19_local0.type:GetValue( f1_local1 ) ~= nil then
			f19_local0 = self:GetDataSource()
			if f19_local0.type:GetValue( f1_local1 ) == "power" then
				ACTIONS.AnimateSequence( self, "Power" )
			end
		end
		f19_local0 = self:GetDataSource()
		if f19_local0.type:GetValue( f1_local1 ) ~= nil then
			f19_local0 = self:GetDataSource()
			if f19_local0.type:GetValue( f1_local1 ) == "killstreak" then
				ACTIONS.AnimateSequence( self, "Killstreak" )
			end
		end
		f19_local0 = self:GetDataSource()
		if f19_local0.type:GetValue( f1_local1 ) ~= nil then
			f19_local0 = self:GetDataSource()
			if f19_local0.type:GetValue( f1_local1 ) == "challenge" then
				ACTIONS.AnimateSequence( self, "Challenge" )
			end
		end
		f19_local0 = self:GetDataSource()
		if f19_local0.type:GetValue( f1_local1 ) ~= nil then
			f19_local0 = self:GetDataSource()
			if f19_local0.type:GetValue( f1_local1 ) == "perk" then
				ACTIONS.AnimateSequence( self, "Perk" )
			end
		end
		f19_local0 = self:GetDataSource()
		if f19_local0.type:GetValue( f1_local1 ) ~= nil then
			f19_local0 = self:GetDataSource()
			if f19_local0.type:GetValue( f1_local1 ) == "loot_weapon" then
				ACTIONS.AnimateSequence( self, "Weapon" )
			end
		end
		f19_local0 = self:GetDataSource()
		if f19_local0.type:GetValue( f1_local1 ) ~= nil then
			f19_local0 = self:GetDataSource()
			if f19_local0.type:GetValue( f1_local1 ) == "loot_killstreak" then
				ACTIONS.AnimateSequence( self, "Killstreak" )
			end
		end
		f19_local0 = self:GetDataSource()
		if f19_local0.type:GetValue( f1_local1 ) ~= nil then
			f19_local0 = self:GetDataSource()
			if f19_local0.type:GetValue( f1_local1 ) == "loot_power" then
				ACTIONS.AnimateSequence( self, "Power" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "AARUnlockItemImage", AARUnlockItemImage )
LockTable( _M )
