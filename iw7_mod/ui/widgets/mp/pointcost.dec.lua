local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	f1_arg0.PointEmpty:SetScale( 0, 0 )
	f1_arg0.PointEmpty:SetRGBFromInt( 0, 0 )
	f1_arg0.PointEmpty:SetAlpha( 0.5, 0 )
	f1_arg0.Point:SetAlpha( 1, 0 )
	f1_arg0.GlowImage:SetAlpha( 1, 0 )
end

f0_local1 = function ( f2_arg0 )
	f2_arg0.PointEmpty:SetRGBFromInt( 0, 0 )
	f2_arg0.PointEmpty:SetAlpha( 0.5, 0 )
	f2_arg0.PointEmpty:SetScale( 0, 0 )
	f2_arg0.Point:SetAlpha( 0, 0 )
	f2_arg0.Point:SetRGBFromTable( SWATCHES.CAC.abilityText, 0 )
	f2_arg0.GlowImage:SetAlpha( 0, 0 )
end

f0_local2 = function ( f3_arg0 )
	f3_arg0.GlowImage:SetAlpha( 0, 0 )
end

local f0_local3 = function ( f4_arg0 )
	f4_arg0.PointEmpty:SetRGBFromInt( 0, 0 )
	f4_arg0.PointEmpty:SetAlpha( 0.5, 0 )
	f4_arg0.PointEmpty:SetScale( 0, 0 )
	f4_arg0.GlowImage:SetAlpha( 0, 0 )
end

local f0_local4 = function ( f5_arg0 )
	f5_arg0.PointEmpty:SetRGBFromInt( 1710618, 0 )
	f5_arg0.PointEmpty:SetAlpha( 0.8, 0 )
end

local f0_local5 = function ( f6_arg0 )
	f6_arg0.PointEmpty:SetRGBFromInt( 0, 0 )
	f6_arg0.PointEmpty:SetAlpha( 0.5, 0 )
	f6_arg0.PointEmpty:SetScale( 0, 0 )
end

function PostLoadFunc( f7_arg0, f7_arg1, f7_arg2 )
	f7_arg0:SubscribeToModelThroughElement( f7_arg0, "isActive", function ()
		local f8_local0 = LUI.FlowManager.GetScopedData( f7_arg0:GetCurrentMenu() )
		local f8_local1 = f7_arg0:GetDataSource()
		f8_local1 = f8_local1.isActive:GetValue( f7_arg1 )
		if f8_local1 ~= nil then
			if f8_local1 then
				if f8_local0.staticPointAnimation then
					if f7_arg0._lastState ~= "activeStatic" then
						f7_arg0._lastState = "activeStatic"
						f0_local0( f7_arg0 )
						ACTIONS.AnimateSequence( f7_arg0, "Glow" )
					end
				elseif f8_local0.openedLoadoutEdit then
					if f7_arg0._lastState ~= "activeDynamic" then
						f7_arg0._lastState = "activeDynamic"
						ACTIONS.AnimateSequence( f7_arg0, "Active" )
						ACTIONS.AnimateSequence( f7_arg0, "Glow" )
					end
				elseif f7_arg0._lastState ~= "activeStatic" then
					f7_arg0._lastState = "activeStatic"
					f0_local0( f7_arg0 )
					ACTIONS.AnimateSequence( f7_arg0, "Glow" )
				end
			elseif f8_local0.staticPointAnimation then
				if f7_arg0._lastState ~= "inactiveStatic" then
					f7_arg0._lastState = "inactiveStatic"
					f0_local1( f7_arg0 )
					f0_local2( f7_arg0 )
				end
			elseif f8_local0.openedLoadoutEdit then
				if f7_arg0._lastState ~= "inactiveDynamic" then
					f7_arg0._lastState = "inactiveDynamic"
					ACTIONS.AnimateSequence( f7_arg0, "Inactive" )
					f0_local3( f7_arg0 )
					f0_local2( f7_arg0 )
				end
			elseif f7_arg0._lastState ~= "inactiveStatic" then
				f7_arg0._lastState = "inactiveStatic"
				f0_local1( f7_arg0 )
				f0_local2( f7_arg0 )
			end
		end
	end )
	f7_arg0:addEventHandler( "animate_points", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg0:GetDataSource()
		f9_local0 = f9_local0.isActive:GetValue( f7_arg1 )
		if f9_local0 ~= nil and f9_local0 and f9_arg0._lastState ~= "active" then
			f9_arg0._lastState = "active"
			ACTIONS.AnimateSequence( f9_arg0, "Active" )
		end
	end )
	f7_arg0:addEventHandler( "button_over", function ( f10_arg0, f10_arg1 )
		if f7_arg0._lastState ~= "over" then
			f7_arg0._lastState = "over"
			f0_local4( f7_arg0 )
		end
	end )
	f7_arg0:addEventHandler( "button_over_disable", function ( f11_arg0, f11_arg1 )
		if f7_arg0._lastState ~= "over" then
			f7_arg0._lastState = "over"
			f0_local4( f7_arg0 )
		end
	end )
	f7_arg0:addEventHandler( "button_up", function ( f12_arg0, f12_arg1 )
		if f7_arg0._lastState ~= "up" then
			f7_arg0._lastState = "up"
			f0_local5( f7_arg0 )
		end
	end )
	f7_arg0:addEventHandler( "button_disable", function ( f13_arg0, f13_arg1 )
		if f7_arg0._lastState ~= "up" then
			f7_arg0._lastState = "up"
			f0_local5( f7_arg0 )
		end
	end )
end

function PointCost( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 31 * _1080p, 0, 4 * _1080p )
	self.id = "PointCost"
	self._animationSets = {}
	self._sequences = {}
	local f14_local1 = controller and controller.controllerIndex
	if not f14_local1 and not Engine.InFrontend() then
		f14_local1 = self:getRootController()
	end
	assert( f14_local1 )
	local f14_local2 = self
	local PointEmpty = nil
	
	PointEmpty = LUI.UIImage.new()
	PointEmpty.id = "PointEmpty"
	PointEmpty:SetRGBFromInt( 1710618, 0 )
	PointEmpty:SetAlpha( 0.5, 0 )
	self:addElement( PointEmpty )
	self.PointEmpty = PointEmpty
	
	local Point = nil
	
	Point = LUI.UIImage.new()
	Point.id = "Point"
	Point:SetRGBFromTable( SWATCHES.CAC.abilityText, 0 )
	self:addElement( Point )
	self.Point = Point
	
	local GlowImage = nil
	
	GlowImage = LUI.UIImage.new()
	GlowImage.id = "GlowImage"
	GlowImage:SetRGBFromInt( 12381682, 0 )
	GlowImage:setImage( RegisterMaterial( "wdg_ellipse_glow" ), 0 )
	GlowImage:SetBlendMode( BLEND_MODE.addWithAlpha )
	GlowImage:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -5, _1080p * 5 )
	self:addElement( GlowImage )
	self.GlowImage = GlowImage
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		PointEmpty:RegisterAnimationSequence( "Active", {
			{
				function ()
					return self.PointEmpty:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.PointEmpty:SetAlpha( 0.8, 140 )
				end,
				function ()
					return self.PointEmpty:SetAlpha( 0.5, 10 )
				end,
				function ()
					return self.PointEmpty:SetAlpha( 0, 450, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.PointEmpty:SetAlpha( 0.8, 10 )
				end
			},
			{
				function ()
					return self.PointEmpty:SetRGBFromInt( 0, 0 )
				end,
				function ()
					return self.PointEmpty:SetRGBFromInt( 0, 140 )
				end,
				function ()
					return self.PointEmpty:SetRGBFromInt( 16777215, 10 )
				end,
				function ()
					return self.PointEmpty:SetRGBFromInt( 16777215, 450, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.PointEmpty:SetRGBFromInt( 0, 10 )
				end
			},
			{
				function ()
					return self.PointEmpty:SetScale( 0, 0 )
				end,
				function ()
					return self.PointEmpty:SetScale( 0, 150 )
				end,
				function ()
					return self.PointEmpty:SetScale( 1, 450, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.PointEmpty:SetScale( 0, 10 )
				end
			}
		} )
		Point:RegisterAnimationSequence( "Active", {
			{
				function ()
					return self.Point:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Point:SetAlpha( 0.5, 50, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.Point:SetAlpha( 0.5, 90 )
				end,
				function ()
					return self.Point:SetAlpha( 1, 10, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.Point:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.Point:SetRGBFromInt( 16777215, 140 )
				end,
				function ()
					return self.Point:SetRGBFromTable( SWATCHES.CAC.abilityText, 10, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.Point:SetScale( 1, 0 )
				end,
				function ()
					return self.Point:SetScale( 0, 150, LUI.EASING.inQuadratic )
				end
			}
		} )
		GlowImage:RegisterAnimationSequence( "Active", {
			{
				function ()
					return self.GlowImage:SetAlpha( 0, 140 )
				end,
				function ()
					return self.GlowImage:SetAlpha( 1, 10 )
				end
			}
		} )
		self._sequences.Active = function ()
			PointEmpty:AnimateSequence( "Active" )
			Point:AnimateSequence( "Active" )
			GlowImage:AnimateSequence( "Active" )
		end
		
		Point:RegisterAnimationSequence( "Inactive", {
			{
				function ()
					return self.Point:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Point:SetAlpha( 0.3, 30 )
				end,
				function ()
					return self.Point:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Point:SetAlpha( 0.3, 30 )
				end,
				function ()
					return self.Point:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Point:SetAlpha( 0, 30 )
				end
			}
		} )
		self._sequences.Inactive = function ()
			Point:AnimateSequence( "Inactive" )
		end
		
		GlowImage:RegisterAnimationSequence( "GlowLoop", {
			{
				function ()
					return self.GlowImage:SetUMin( 0, 0 )
				end,
				function ()
					return self.GlowImage:SetUMin( 1, 750 )
				end,
				function ()
					return self.GlowImage:SetUMin( 1, 2240 )
				end
			},
			{
				function ()
					return self.GlowImage:SetUMax( 0, 0 )
				end,
				function ()
					return self.GlowImage:SetUMax( 0, 750 )
				end,
				function ()
					return self.GlowImage:SetUMax( 1, 2240 )
				end
			}
		} )
		self._sequences.GlowLoop = function ()
			GlowImage:AnimateLoop( "GlowLoop" )
		end
		
		GlowImage:RegisterAnimationSequence( "Glow", {
			{
				function ()
					return self.GlowImage:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Glow = function ()
			GlowImage:AnimateSequence( "Glow" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f14_local1, controller )
	ACTIONS.AnimateSequence( self, "GlowLoop" )
	return self
end

MenuBuilder.registerType( "PointCost", PointCost )
LockTable( _M )
