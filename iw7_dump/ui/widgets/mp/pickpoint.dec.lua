local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "isActive", function ()
		local f2_local0 = f1_arg0:GetCurrentMenu()
		local f2_local1 = LUI.FlowManager.GetScopedData( f2_local0 )
		local f2_local2 = f1_arg0:GetDataSource()
		f2_local2 = f2_local2.isActive:GetValue( f1_arg1 )
		local f2_local3, f2_local4 = nil
		if f2_local1.openedLoadoutEdit then
			local f2_local5 = f1_arg0:GetDataSource()
			f2_local3 = f2_local5.gridIndex
			f2_local5 = f2_local0.LoadoutList.Loadouts:GetDataSource()
			f2_local4 = f2_local5.pointCount:GetValue( f1_arg1 )
		end
		if f2_local2 ~= nil then
			if f2_local2 then
				if f2_local1.loadoutPointsUsed ~= nil and f2_local4 ~= nil and f2_local3 ~= nil then
					if f2_local1.loadoutPointsUsed < f2_local4 and f2_local1.loadoutPointsUsed < f2_local3 + 1 then
						f1_arg0._lastState = "activeDynamic"
						ACTIONS.AnimateSequence( f1_arg0, "Active" )
						ACTIONS.AnimateSequence( f1_arg0, "Glow" )
					else
						f1_arg0._lastState = "activeStatic"
						ACTIONS.AnimateSequence( f1_arg0, "ActiveStatic" )
						ACTIONS.AnimateSequence( f1_arg0, "Glow" )
					end
				elseif f2_local1.staticPointAnimation then
					f1_arg0._lastState = "activeStatic"
					ACTIONS.AnimateSequence( f1_arg0, "ActiveStatic" )
					ACTIONS.AnimateSequence( f1_arg0, "Glow" )
				elseif f2_local1.openedLoadoutEdit then
					f1_arg0._lastState = "activeDynamic"
					ACTIONS.AnimateSequence( f1_arg0, "Active" )
					ACTIONS.AnimateSequence( f1_arg0, "Glow" )
				else
					f1_arg0._lastState = "activeStatic"
					ACTIONS.AnimateSequence( f1_arg0, "ActiveStatic" )
					ACTIONS.AnimateSequence( f1_arg0, "Glow" )
				end
			elseif f2_local1.staticPointAnimation then
				if f1_arg0._lastState ~= "inactiveStatic" then
					f1_arg0._lastState = "inactiveStatic"
					ACTIONS.AnimateSequence( f1_arg0, "InactiveStatic" )
					ACTIONS.AnimateSequence( f1_arg0, "GlowStop" )
				end
			elseif f2_local1.openedLoadoutEdit then
				if f1_arg0._lastState ~= "inactiveDynamic" then
					f1_arg0._lastState = "inactiveDynamic"
					ACTIONS.AnimateSequence( f1_arg0, "Inactive" )
					ACTIONS.AnimateSequence( f1_arg0, "GlowStop" )
				end
			elseif f1_arg0._lastState ~= "inactiveStatic" then
				f1_arg0._lastState = "inactiveStatic"
				ACTIONS.AnimateSequence( f1_arg0, "InactiveStatic" )
				ACTIONS.AnimateSequence( f1_arg0, "GlowStop" )
			end
		end
	end )
end

function PickPoint( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 42 * _1080p, 0, 6 * _1080p )
	self.id = "PickPoint"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local PointFlash = nil
	
	PointFlash = LUI.UIImage.new()
	PointFlash.id = "PointFlash"
	PointFlash:SetRGBFromTable( SWATCHES.CAC.greenIcon, 0 )
	PointFlash:SetAlpha( 0, 0 )
	PointFlash:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( PointFlash )
	self.PointFlash = PointFlash
	
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
	GlowImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -22, _1080p * 22, _1080p * -8.5, _1080p * 8.5 )
	self:addElement( GlowImage )
	self.GlowImage = GlowImage
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		PointFlash:RegisterAnimationSequence( "Active", {
			{
				function ()
					return self.PointFlash:SetScale( 1, 0 )
				end,
				function ()
					return self.PointFlash:SetScale( 0, 150, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.PointFlash:SetScale( 1, 450, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.PointFlash:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PointFlash:SetAlpha( 0.5, 50, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.PointFlash:SetAlpha( 0.5, 100, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.PointFlash:SetAlpha( 0, 450, LUI.EASING.outQuadratic )
				end
			}
		} )
		Point:RegisterAnimationSequence( "Active", {
			{
				function ()
					return self.Point:SetAlpha( 1, 150 )
				end
			},
			{
				function ()
					return self.Point:SetRGBFromTable( SWATCHES.CAC.abilityText, 150 )
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
			PointFlash:AnimateSequence( "Active" )
			Point:AnimateSequence( "Active" )
			GlowImage:AnimateSequence( "Active" )
		end
		
		PointFlash:RegisterAnimationSequence( "Inactive", {
			{
				function ()
					return self.PointFlash:SetAlpha( 0, 0 )
				end
			}
		} )
		Point:RegisterAnimationSequence( "Inactive", {
			{
				function ()
					return self.Point:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Point:SetAlpha( 0.5, 30 )
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
					return self.Point:SetAlpha( 0.7, 30 )
				end
			},
			{
				function ()
					return self.Point:SetRGBFromTable( SWATCHES.CAC.weaponMeterMain, 0 )
				end,
				function ()
					return self.Point:SetRGBFromInt( 1710618, 30 )
				end,
				function ()
					return self.Point:SetRGBFromInt( 11776947, 30 )
				end,
				function ()
					return self.Point:SetRGBFromInt( 1710618, 30 )
				end,
				function ()
					return self.Point:SetRGBFromInt( 11776947, 30 )
				end,
				function ()
					return self.Point:SetRGBFromInt( 1710618, 30 )
				end
			}
		} )
		GlowImage:RegisterAnimationSequence( "Inactive", {
			{
				function ()
					return self.GlowImage:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Inactive = function ()
			PointFlash:AnimateSequence( "Inactive" )
			Point:AnimateSequence( "Inactive" )
			GlowImage:AnimateSequence( "Inactive" )
		end
		
		Point:RegisterAnimationSequence( "ActiveStatic", {
			{
				function ()
					return self.Point:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Point:SetRGBFromTable( SWATCHES.CAC.abilityText, 0 )
				end
			}
		} )
		GlowImage:RegisterAnimationSequence( "ActiveStatic", {
			{
				function ()
					return self.GlowImage:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ActiveStatic = function ()
			Point:AnimateSequence( "ActiveStatic" )
			GlowImage:AnimateSequence( "ActiveStatic" )
		end
		
		Point:RegisterAnimationSequence( "InactiveStatic", {
			{
				function ()
					return self.Point:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.Point:SetAlpha( 0.7, 150 )
				end
			},
			{
				function ()
					return self.Point:SetRGBFromInt( 1710618, 0 )
				end
			}
		} )
		GlowImage:RegisterAnimationSequence( "InactiveStatic", {
			{
				function ()
					return self.GlowImage:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.InactiveStatic = function ()
			Point:AnimateSequence( "InactiveStatic" )
			GlowImage:AnimateSequence( "InactiveStatic" )
		end
		
		GlowImage:RegisterAnimationSequence( "GlowLoop", {
			{
				function ()
					return self.GlowImage:SetUMax( 0, 0 )
				end,
				function ()
					return self.GlowImage:SetUMax( 0, 750 )
				end,
				function ()
					return self.GlowImage:SetUMax( 1, 2250 )
				end
			},
			{
				function ()
					return self.GlowImage:SetUMin( 0, 0 )
				end,
				function ()
					return self.GlowImage:SetUMin( 1, 750 )
				end,
				function ()
					return self.GlowImage:SetUMin( 1, 2250 )
				end
			}
		} )
		self._sequences.GlowLoop = function ()
			GlowImage:AnimateLoop( "GlowLoop" )
		end
		
		GlowImage:RegisterAnimationSequence( "GlowStop", {
			{
				function ()
					return self.GlowImage:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.GlowStop = function ()
			GlowImage:AnimateSequence( "GlowStop" )
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
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "GlowLoop" )
	return self
end

MenuBuilder.registerType( "PickPoint", PickPoint )
LockTable( _M )
