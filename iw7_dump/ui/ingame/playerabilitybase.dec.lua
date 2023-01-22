local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PlayerAbilityBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "PlayerAbilityBase"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local AbilityIcon = nil
	
	AbilityIcon = LUI.UIImage.new()
	AbilityIcon.id = "AbilityIcon"
	AbilityIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	AbilityIcon:SubscribeToModelThroughElement( self, "iconColor", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.iconColor:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			AbilityIcon:SetRGBFromInt( f2_local0, 0 )
		end
	end )
	AbilityIcon:SubscribeToModelThroughElement( self, "icon", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.icon:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			AbilityIcon:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( AbilityIcon )
	self.AbilityIcon = AbilityIcon
	
	local Cross = nil
	
	Cross = LUI.UIImage.new()
	Cross.id = "Cross"
	Cross:SetAlpha( 0, 0 )
	Cross:setImage( RegisterMaterial( "hud_ability_disabled_x" ), 0 )
	Cross:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	Cross:SubscribeToModelThroughElement( self, "color", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.color:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			Cross:SetRGBFromInt( f4_local0, 0 )
		end
	end )
	self:addElement( Cross )
	self.Cross = Cross
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AbilityIcon:RegisterAnimationSequence( "Available", {
			{
				function ()
					return self.AbilityIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AbilityIcon:SetAlpha( 1, 100 )
				end,
				function ()
					return self.AbilityIcon:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.AbilityIcon:SetScale( 0, 0 )
				end,
				function ()
					return self.AbilityIcon:SetScale( 0.25, 100 )
				end,
				function ()
					return self.AbilityIcon:SetScale( 0, 100 )
				end
			}
		} )
		Cross:RegisterAnimationSequence( "Available", {
			{
				function ()
					return self.Cross:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Available = function ()
			AbilityIcon:AnimateSequence( "Available" )
			Cross:AnimateSequence( "Available" )
		end
		
		AbilityIcon:RegisterAnimationSequence( "Unavailable", {
			{
				function ()
					return self.AbilityIcon:SetAlpha( 1, 0 )
				end,
				function ()
					return self.AbilityIcon:SetAlpha( 1, 100 )
				end,
				function ()
					return self.AbilityIcon:SetAlpha( 0.6, 100 )
				end
			},
			{
				function ()
					return self.AbilityIcon:SetScale( 0, 0 )
				end,
				function ()
					return self.AbilityIcon:SetScale( 0.25, 100 )
				end,
				function ()
					return self.AbilityIcon:SetScale( 0, 100 )
				end
			}
		} )
		Cross:RegisterAnimationSequence( "Unavailable", {
			{
				function ()
					return self.Cross:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Cross:SetAlpha( 0, 190 )
				end,
				function ()
					return self.Cross:SetAlpha( 0.5, 10 )
				end
			}
		} )
		self._sequences.Unavailable = function ()
			AbilityIcon:AnimateSequence( "Unavailable" )
			Cross:AnimateSequence( "Unavailable" )
		end
		
		AbilityIcon:RegisterAnimationSequence( "UpdateAbility", {
			{
				function ()
					return self.AbilityIcon:SetScale( 0, 0 )
				end,
				function ()
					return self.AbilityIcon:SetScale( 0.25, 100 )
				end,
				function ()
					return self.AbilityIcon:SetScale( 0, 100 )
				end
			}
		} )
		self._sequences.UpdateAbility = function ()
			AbilityIcon:AnimateSequence( "UpdateAbility" )
		end
		
		AbilityIcon:RegisterAnimationSequence( "AbilityInUse", {
			{
				function ()
					return self.AbilityIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		Cross:RegisterAnimationSequence( "AbilityInUse", {
			{
				function ()
					return self.Cross:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.AbilityInUse = function ()
			AbilityIcon:AnimateSequence( "AbilityInUse" )
			Cross:AnimateSequence( "AbilityInUse" )
		end
		
		AbilityIcon:RegisterAnimationSequence( "AbilityInCooldown", {
			{
				function ()
					return self.AbilityIcon:SetAlpha( 1, 0 )
				end,
				function ()
					return self.AbilityIcon:SetAlpha( 1, 100 )
				end,
				function ()
					return self.AbilityIcon:SetAlpha( 0.75, 100 )
				end
			},
			{
				function ()
					return self.AbilityIcon:SetScale( 0, 0 )
				end,
				function ()
					return self.AbilityIcon:SetScale( 0.25, 100 )
				end,
				function ()
					return self.AbilityIcon:SetScale( 0, 100 )
				end
			}
		} )
		Cross:RegisterAnimationSequence( "AbilityInCooldown", {
			{
				function ()
					return self.Cross:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Cross:SetAlpha( 0, 190 )
				end,
				function ()
					return self.Cross:SetAlpha( 1, 10 )
				end
			}
		} )
		self._sequences.AbilityInCooldown = function ()
			AbilityIcon:AnimateSequence( "AbilityInCooldown" )
			Cross:AnimateSequence( "AbilityInCooldown" )
		end
		
		AbilityIcon:RegisterAnimationSequence( "StoredUnavailable", {
			{
				function ()
					return self.AbilityIcon:SetAlpha( 1, 0 )
				end,
				function ()
					return self.AbilityIcon:SetAlpha( 1, 100 )
				end,
				function ()
					return self.AbilityIcon:SetAlpha( 0.6, 100 )
				end
			},
			{
				function ()
					return self.AbilityIcon:SetScale( 0, 0 )
				end,
				function ()
					return self.AbilityIcon:SetScale( 0.25, 100 )
				end,
				function ()
					return self.AbilityIcon:SetScale( 0, 100 )
				end
			}
		} )
		Cross:RegisterAnimationSequence( "StoredUnavailable", {
			{
				function ()
					return self.Cross:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.StoredUnavailable = function ()
			AbilityIcon:AnimateSequence( "StoredUnavailable" )
			Cross:AnimateSequence( "StoredUnavailable" )
		end
		
		AbilityIcon:RegisterAnimationSequence( "StoredAvailable", {
			{
				function ()
					return self.AbilityIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AbilityIcon:SetAlpha( 1, 100 )
				end,
				function ()
					return self.AbilityIcon:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.AbilityIcon:SetScale( 0, 0 )
				end,
				function ()
					return self.AbilityIcon:SetScale( 0.25, 100 )
				end,
				function ()
					return self.AbilityIcon:SetScale( 0, 100 )
				end
			}
		} )
		Cross:RegisterAnimationSequence( "StoredAvailable", {
			{
				function ()
					return self.Cross:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.StoredAvailable = function ()
			AbilityIcon:AnimateSequence( "StoredAvailable" )
			Cross:AnimateSequence( "StoredAvailable" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "PlayerAbilityBase", PlayerAbilityBase )
LockTable( _M )
