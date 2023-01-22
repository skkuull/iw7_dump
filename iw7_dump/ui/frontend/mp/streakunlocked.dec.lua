local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function StreakUnlocked( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 24 * _1080p, 0, 24 * _1080p )
	self.id = "StreakUnlocked"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local IsUnlocked = nil
	
	IsUnlocked = LUI.UIImage.new()
	IsUnlocked.id = "IsUnlocked"
	IsUnlocked:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	IsUnlocked:SetAlpha( 0.4, 0 )
	IsUnlocked:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	self:addElement( IsUnlocked )
	self.IsUnlocked = IsUnlocked
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		IsUnlocked:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.IsUnlocked:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			IsUnlocked:AnimateSequence( "Unlocked" )
		end
		
		IsUnlocked:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.IsUnlocked:SetAlpha( 0.4, 0 )
				end
			},
			{
				function ()
					return self.IsUnlocked:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			IsUnlocked:AnimateSequence( "Locked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f9_local0 = self:GetDataSource()
		if f9_local0.isUnlocked:GetValue( f1_local1 ) ~= nil then
			f9_local0 = self:GetDataSource()
			if f9_local0.isUnlocked:GetValue( f1_local1 ) == true then
				ACTIONS.AnimateSequence( self, "Unlocked" )
			end
		end
		f9_local0 = self:GetDataSource()
		if f9_local0.isUnlocked:GetValue( f1_local1 ) ~= nil then
			f9_local0 = self:GetDataSource()
			if f9_local0.isUnlocked:GetValue( f1_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Locked" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "StreakUnlocked", StreakUnlocked )
LockTable( _M )
