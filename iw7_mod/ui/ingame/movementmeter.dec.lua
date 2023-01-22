local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Fill, "WARNING: Movement Meter Items Are Missing..." )
	local f1_local0 = Engine.IsSingleplayer()
	if f1_local0 then
		f1_arg0:SetDotPitchEnabled( true )
		f1_arg0:SetDotPitchX( 6, 0 )
		f1_arg0:SetDotPitchY( 3, 0 )
		f1_arg0:SetDotPitchContrast( 0.15, 0 )
		f1_arg0:SetDotPitchMode( 0 )
	end
	local f1_local1
	if f1_local0 then
		f1_local1 = SWATCHES.movementMeter.defaultBoost_sp
		if not f1_local1 then
		
		else
			f1_arg0.Fill:SetRGBFromTable( f1_local1, 0 )
			f1_arg0:SubscribeToModel( DataSources.inGame.player.displayMovementEnergy:GetModel( f1_arg1 ), function ( f2_arg0 )
				if DataModel.GetModelValue( f2_arg0 ) then
					f1_arg0:SetAlpha( 1 )
				else
					f1_arg0:SetAlpha( 0 )
				end
			end )
		end
	end
	f1_local1 = SWATCHES.movementMeter.defaultBoost
end

function MovementMeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 220 * _1080p, 0, 5 * _1080p )
	self.id = "MovementMeter"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Rail = nil
	
	Rail = LUI.UIImage.new()
	Rail.id = "Rail"
	Rail:setImage( RegisterMaterial( "hud_boost_meter_rail" ), 0 )
	Rail:SetUseAA( true )
	Rail:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -110, _1080p * 110, _1080p * -3, _1080p * 3 )
	self:addElement( Rail )
	self.Rail = Rail
	
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetAnchors( 0, 1, 0, 0, 0 )
	Fill:SetLeft( _1080p * 0, 0 )
	Fill:SetTop( _1080p * 0, 0 )
	Fill:SetBottom( _1080p * 0, 0 )
	Fill:SetRGBFromTable( SWATCHES.movementMeter.defaultBoost, 0 )
	Fill:SubscribeToModel( DataSources.inGame.player.movementEnergy:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.movementEnergy:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Fill:SetRight( _1080p * Multiply( f4_local0, 220 ), 0 )
		end
	end )
	self:addElement( Fill )
	self.Fill = Fill
	
	local EndNodeRight = nil
	
	EndNodeRight = LUI.UIImage.new()
	EndNodeRight.id = "EndNodeRight"
	EndNodeRight:SetAnchors( 0, 1, 0, 0, 0 )
	EndNodeRight:SetTop( _1080p * 0, 0 )
	EndNodeRight:SetBottom( _1080p * 0, 0 )
	EndNodeRight:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	EndNodeRight:SubscribeToModel( DataSources.inGame.player.movementEnergy:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.movementEnergy:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			EndNodeRight:SetLeft( _1080p * Add( Multiply( f5_local0, 220 ), -5 ), 0 )
		end
	end )
	EndNodeRight:SubscribeToModel( DataSources.inGame.player.movementEnergy:GetModel( f3_local1 ), function ()
		local f6_local0 = DataSources.inGame.player.movementEnergy:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			EndNodeRight:SetRight( _1080p * Multiply( f6_local0, 220 ), 0 )
		end
	end )
	self:addElement( EndNodeRight )
	self.EndNodeRight = EndNodeRight
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Rail:RegisterAnimationSequence( "HideMovementMeter", {
			{
				function ()
					return self.Rail:SetAlpha( 0, 0 )
				end
			}
		} )
		Fill:RegisterAnimationSequence( "HideMovementMeter", {
			{
				function ()
					return self.Fill:SetAlpha( 0, 0 )
				end
			}
		} )
		EndNodeRight:RegisterAnimationSequence( "HideMovementMeter", {
			{
				function ()
					return self.EndNodeRight:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideMovementMeter = function ()
			Rail:AnimateSequence( "HideMovementMeter" )
			Fill:AnimateSequence( "HideMovementMeter" )
			EndNodeRight:AnimateSequence( "HideMovementMeter" )
		end
		
		Rail:RegisterAnimationSequence( "ShowMovementMeter", {
			{
				function ()
					return self.Rail:SetAlpha( 1, 0 )
				end
			}
		} )
		Fill:RegisterAnimationSequence( "ShowMovementMeter", {
			{
				function ()
					return self.Fill:SetAlpha( 1, 0 )
				end
			}
		} )
		EndNodeRight:RegisterAnimationSequence( "ShowMovementMeter", {
			{
				function ()
					return self.EndNodeRight:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowMovementMeter = function ()
			Rail:AnimateSequence( "ShowMovementMeter" )
			Fill:AnimateSequence( "ShowMovementMeter" )
			EndNodeRight:AnimateSequence( "ShowMovementMeter" )
		end
		
		Rail:RegisterAnimationSequence( "HideMovementMeterAnime", {
			{
				function ()
					return self.Rail:SetAlpha( 1, 500 )
				end,
				function ()
					return self.Rail:SetAlpha( 0, 500 )
				end
			}
		} )
		Fill:RegisterAnimationSequence( "HideMovementMeterAnime", {
			{
				function ()
					return self.Fill:SetAlpha( 1, 500 )
				end,
				function ()
					return self.Fill:SetAlpha( 0, 500 )
				end
			}
		} )
		EndNodeRight:RegisterAnimationSequence( "HideMovementMeterAnime", {
			{
				function ()
					return self.EndNodeRight:SetAlpha( 1, 500 )
				end,
				function ()
					return self.EndNodeRight:SetAlpha( 0, 500 )
				end
			}
		} )
		self._sequences.HideMovementMeterAnime = function ()
			Rail:AnimateSequence( "HideMovementMeterAnime" )
			Fill:AnimateSequence( "HideMovementMeterAnime" )
			EndNodeRight:AnimateSequence( "HideMovementMeterAnime" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.displayMovementEnergy:GetModel( f3_local1 ), function ()
		if DataSources.inGame.player.displayMovementEnergy:GetValue( f3_local1 ) ~= nil and DataSources.inGame.player.displayMovementEnergy:GetValue( f3_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ShowMovementMeter" )
		end
		if DataSources.inGame.player.displayMovementEnergy:GetValue( f3_local1 ) ~= nil and DataSources.inGame.player.displayMovementEnergy:GetValue( f3_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideMovementMeterAnime" )
		end
	end )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "MovementMeter", MovementMeter )
LockTable( _M )
