local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ItemCardHeaderBackground( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 80 * _1080p )
	self.id = "ItemCardHeaderBackground"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetBlurStrength( 2.75, 0 )
	Blur:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 11, 0, 0, 0 )
	Blur:SubscribeToModelThroughElement( self, "color", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.color:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Blur:SetRGBFromInt( f2_local0, 0 )
		end
	end )
	self:addElement( Blur )
	self.Blur = Blur
	
	local f1_local4 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsMultiplayer( self ) then
		f1_local4 = LUI.UIImage.new()
		f1_local4.id = "Tab"
		f1_local4:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 11, 0, 0 )
		f1_local4:SubscribeToModelThroughElement( self, "color", function ()
			local f3_local0 = self:GetDataSource()
			f3_local0 = f3_local0.color:GetValue( f1_local1 )
			if f3_local0 ~= nil then
				f1_local4:SetRGBFromInt( f3_local0, 0 )
			end
		end )
		self:addElement( f1_local4 )
		self.Tab = f1_local4
	end
	local f1_local5 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f1_local5 = LUI.UIImage.new()
		f1_local5.id = "DarkenDivider"
		f1_local5:SetRGBFromTable( SWATCHES.HUD.background, 0 )
		f1_local5:SetAlpha( 0.25, 0 )
		f1_local5:SetBlendMode( BLEND_MODE.blend )
		f1_local5:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 11, 0, _1080p * 40, 0 )
		self:addElement( f1_local5 )
		self.DarkenDivider = f1_local5
	end
	local f1_local6 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f1_local6 = LUI.UIImage.new()
		f1_local6.id = "DarkenDividerTop"
		f1_local6:SetRGBFromTable( SWATCHES.HUD.background, 0 )
		f1_local6:SetAlpha( 0.25, 0 )
		f1_local6:SetBlendMode( BLEND_MODE.blend )
		f1_local6:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -65, 0, _1080p * 3.2, _1080p * -40 )
		self:addElement( f1_local6 )
		self.DarkenDividerTop = f1_local6
	end
	local f1_local7 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f1_local7 = LUI.UIImage.new()
		f1_local7.id = "DarkenDividerAngle"
		f1_local7:SetRGBFromTable( SWATCHES.HUD.background, 0 )
		f1_local7:SetAlpha( 0.25, 0 )
		f1_local7:SetZRotation( 180, 0 )
		f1_local7:setImage( RegisterMaterial( "wdg_slot_cut_out_1" ), 0 )
		f1_local7:SetBlendMode( BLEND_MODE.blend )
		f1_local7:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -101.8, _1080p * -65, _1080p * 3.2, _1080p * -40 )
		self:addElement( f1_local7 )
		self.DarkenDividerAngle = f1_local7
	end
	local f1_local8 = nil
	if Engine.IsMultiplayer() then
		f1_local8 = MenuBuilder.BuildRegisteredType( "MK2Pattern", {
			controllerIndex = f1_local1
		} )
		f1_local8.id = "MK2Pattern"
		f1_local8:SetAlpha( 0, 0 )
		f1_local8:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 12, 0, 0, _1080p * 80 )
		f1_local8:SubscribeToModelThroughElement( self, "color", function ()
			local f4_local0 = self:GetDataSource()
			f4_local0 = f4_local0.color:GetValue( f1_local1 )
			if f4_local0 ~= nil then
				f1_local8:SetRGBFromInt( f4_local0, 0 )
			end
		end )
		self:addElement( f1_local8 )
		self.MK2Pattern = f1_local8
	end
	local f1_local9 = nil
	if Engine.IsMultiplayer() then
		f1_local9 = LUI.UIImage.new()
		f1_local9.id = "MK2"
		f1_local9:SetAlpha( 0, 0 )
		f1_local9:setImage( RegisterMaterial( "mk2_watermark_1" ), 0 )
		f1_local9:SetBlendMode( BLEND_MODE.addWithAlpha )
		f1_local9:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -72, _1080p * -8, _1080p * -36, _1080p * -4 )
		self:addElement( f1_local9 )
		self.MK2 = f1_local9
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Blur:RegisterAnimationSequence( "zombies", {
			{
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end
			}
		} )
		self._sequences.zombies = function ()
			Blur:AnimateSequence( "zombies" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "zombies" )
	end
	return self
end

MenuBuilder.registerType( "ItemCardHeaderBackground", ItemCardHeaderBackground )
LockTable( _M )
