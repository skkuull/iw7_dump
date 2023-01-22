local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if CONDITIONS.IsSplitscreen() then
		f1_arg0.Background:SetDepth( 0, 0 )
		f1_arg0.Frame:SetDepth( 0, 0 )
		if f1_arg0.Charges then
			f1_arg0.Charges:SetDepth( 0, 0 )
		end
	end
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "equipped", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		if f2_local0.equipped:GetValue( f1_arg1 ) then
			ACTIONS.AnimateSequence( f1_arg0, "Equipped" )
			f1_arg0:SetScale( 0, 150, LUI.EASING.outBack )
		else
			ACTIONS.AnimateSequence( f1_arg0, "Unequipped" )
			f1_arg0:SetScale( -0.1, 150, LUI.EASING.outBack )
		end
	end, true )
end

function PlayerEquipmentBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 60 * _1080p, 0, 60 * _1080p )
	self.id = "PlayerEquipmentBase"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIBlur.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 11776947, 0 )
	Background:SetZRotation( 90, 0 )
	Background:SetDepth( 2, 0 )
	Background:SetUseAA( true )
	Background:SetBlurStrength( 1, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetUseAA( true )
	Icon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * 24, _1080p * -24, _1080p * 24 )
	Icon:SubscribeToModelThroughElement( self, "iconColor", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.iconColor:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Icon:SetRGBFromInt( f4_local0, 0 )
		end
	end )
	Icon:SubscribeToModelThroughElement( self, "icon", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.icon:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			Icon:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Cross = nil
	
	Cross = LUI.UIImage.new()
	Cross.id = "Cross"
	Cross:SetAlpha( 0, 0 )
	Cross:setImage( RegisterMaterial( "hud_x_marker" ), 0 )
	Cross:SetUseAA( true )
	Cross:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -42, _1080p * 42, _1080p * -42, _1080p * 42 )
	self:addElement( Cross )
	self.Cross = Cross
	
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:SetDepth( -2, 0 )
	Frame:setImage( RegisterMaterial( "hud_equipment_slot_frame" ), 0 )
	Frame:SetUseAA( true )
	self:addElement( Frame )
	self.Frame = Frame
	
	local f3_local7 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f3_local7 = MenuBuilder.BuildRegisteredType( "PlayerEquipmentCharges", {
			controllerIndex = f3_local1
		} )
		f3_local7.id = "Charges"
		f3_local7:SetDepth( -2, 0 )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local7:SetDataSourceThroughElement( self, nil )
		end
		f3_local7:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 60, _1080p * -8, _1080p * -3 )
		self:addElement( f3_local7 )
		self.Charges = f3_local7
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Icon:RegisterAnimationSequence( "Equipped", {
			{
				function ()
					return self.Icon:SetAlpha( 1, 0 )
				end
			}
		} )
		Cross:RegisterAnimationSequence( "Equipped", {
			{
				function ()
					return self.Cross:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Equipped = function ()
			Icon:AnimateSequence( "Equipped" )
			Cross:AnimateSequence( "Equipped" )
		end
		
		Icon:RegisterAnimationSequence( "Unequipped", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		Cross:RegisterAnimationSequence( "Unequipped", {
			{
				function ()
					return self.Cross:SetAlpha( 0.25, 0 )
				end
			}
		} )
		self._sequences.Unequipped = function ()
			Icon:AnimateSequence( "Unequipped" )
			Cross:AnimateSequence( "Unequipped" )
		end
		
		Cross:RegisterAnimationSequence( "CrossOn", {
			{
				function ()
					return self.Cross:SetAlpha( 0.25, 0 )
				end
			}
		} )
		self._sequences.CrossOn = function ()
			Cross:AnimateSequence( "CrossOn" )
		end
		
		Cross:RegisterAnimationSequence( "CrossOff", {
			{
				function ()
					return self.Cross:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.CrossOff = function ()
			Cross:AnimateSequence( "CrossOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f3_local7:SetDataSourceThroughElement( self, nil )
	end
	self:SubscribeToModelThroughElement( self, "numCharges", function ()
		local f18_local0 = self:GetDataSource()
		if f18_local0.numCharges:GetValue( f3_local1 ) ~= nil then
			f18_local0 = self:GetDataSource()
			if f18_local0.numCharges:GetValue( f3_local1 ) == 0 then
				ACTIONS.AnimateSequence( self, "CrossOn" )
			end
		end
		f18_local0 = self:GetDataSource()
		if f18_local0.numCharges:GetValue( f3_local1 ) ~= nil then
			f18_local0 = self:GetDataSource()
			if f18_local0.numCharges:GetValue( f3_local1 ) > 0 then
				ACTIONS.AnimateSequence( self, "CrossOff" )
			end
		end
	end )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "PlayerEquipmentBase", PlayerEquipmentBase )
LockTable( _M )
