local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RigItem( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 256 * _1080p, 0, 250 * _1080p )
	self.id = "RigItem"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:SubscribeToModelThroughElement( self, "rig.isDisabled", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.rig.isDisabled:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			self:SetButtonDisabled( f2_local0 )
		end
	end )
	local StreakImage = nil
	
	StreakImage = LUI.UIImage.new()
	StreakImage.id = "StreakImage"
	StreakImage:SetAlpha( 0.2, 0 )
	StreakImage:SubscribeToModelThroughElement( self, "rig.image", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.rig.image:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			StreakImage:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( StreakImage )
	self.StreakImage = StreakImage
	
	local Disabled = nil
	
	Disabled = LUI.UIImage.new()
	Disabled.id = "Disabled"
	Disabled:SetAlpha( 0, 0 )
	Disabled:setImage( RegisterMaterial( "alien_perk_engineer" ), 0 )
	Disabled:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -3.89, _1080p * 256, 0, _1080p * 250 )
	self:addElement( Disabled )
	self.Disabled = Disabled
	
	local RigUnlocked = nil
	
	RigUnlocked = MenuBuilder.BuildRegisteredType( "RigUnlocked", {
		controllerIndex = f1_local1
	} )
	RigUnlocked.id = "RigUnlocked"
	RigUnlocked:SetDataSourceThroughElement( self, "rig" )
	RigUnlocked:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 221.01, _1080p * 243.01, _1080p * 207.4, _1080p * 231.4 )
	self:addElement( RigUnlocked )
	self.RigUnlocked = RigUnlocked
	
	local RigSelected = nil
	
	RigSelected = MenuBuilder.BuildRegisteredType( "RigSelected", {
		controllerIndex = f1_local1
	} )
	RigSelected.id = "RigSelected"
	RigSelected:SetDataSourceThroughElement( self, "rig" )
	RigSelected:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 9.28, _1080p * 44.28, _1080p * 195.4, _1080p * 231.4 )
	self:addElement( RigSelected )
	self.RigSelected = RigSelected
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		StreakImage:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.StreakImage:SetAlpha( 1, 0 )
				end
			}
		} )
		Disabled:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Disabled:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			StreakImage:AnimateSequence( "ButtonOver" )
			Disabled:AnimateSequence( "ButtonOver" )
		end
		
		StreakImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.StreakImage:SetAlpha( 0.2, 0 )
				end
			}
		} )
		Disabled:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Disabled:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			StreakImage:AnimateSequence( "ButtonUp" )
			Disabled:AnimateSequence( "ButtonUp" )
		end
		
		Disabled:RegisterAnimationSequence( "ButtonDisabled", {
			{
				function ()
					return self.Disabled:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonDisabled = function ()
			Disabled:AnimateSequence( "ButtonDisabled" )
		end
		
		StreakImage:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.StreakImage:SetAlpha( 1, 0 )
				end
			}
		} )
		Disabled:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Disabled:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			StreakImage:AnimateSequence( "ButtonOverDisabled" )
			Disabled:AnimateSequence( "ButtonOverDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	RigUnlocked:SetDataSourceThroughElement( self, "rig" )
	RigSelected:SetDataSourceThroughElement( self, "rig" )
	self:addEventHandler( "button_over", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f17_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_action", function ( f19_arg0, f19_arg1 )
		ACTIONS.EquipRig( self, f19_arg0, f19_arg1.controller or f1_local1 )
		ACTIONS.LeaveMenu( self )
	end )
	self:addEventHandler( "button_disable", function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonDisabled" )
	end )
	self:addEventHandler( "button_over_disable", function ( f21_arg0, f21_arg1 )
		local f21_local0 = f21_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
	end )
	return self
end

MenuBuilder.registerType( "RigItem", RigItem )
LockTable( _M )
