local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CACItemHeaderBackground( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1069 * _1080p, 0, 100 * _1080p )
	self.id = "CACItemHeaderBackground"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if not Engine.IsMultiplayer() and CONDITIONS.IsSingleplayer( self ) then
		f1_local3 = LUI.UIBlur.new()
		f1_local3.id = "BlurGradTopSP"
		f1_local3:SetRGBFromTable( SWATCHES.itemRarity.quality0, 0 )
		f1_local3:SetBlurStrength( 2.75, 0 )
		f1_local3:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 11, 0, 0, 0 )
		self:addElement( f1_local3 )
		self.BlurGradTopSP = f1_local3
	end
	local f1_local4 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsMultiplayer( self ) then
		f1_local4 = LUI.UIBlur.new()
		f1_local4.id = "BlurGradTopMP"
		f1_local4:SetBlurStrength( 2.75, 0 )
		f1_local4:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 11, 0, 0, 0 )
		f1_local4:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f2_local0 = self:GetDataSource()
			f2_local0 = f2_local0.qualityColor:GetValue( f1_local1 )
			if f2_local0 ~= nil then
				f1_local4:SetRGBFromInt( f2_local0, 0 )
			end
		end )
		self:addElement( f1_local4 )
		self.BlurGradTopMP = f1_local4
	end
	local f1_local5 = nil
	if Engine.IsAliensMode() and CONDITIONS.IsThirdGameMode( self ) then
		f1_local5 = LUI.UIImage.new()
		f1_local5.id = "CPBG"
		f1_local5:SetAlpha( 0.6, 0 )
		f1_local5:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
		f1_local5:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 11, 0, 0, 0 )
		f1_local5:SubscribeToModelThroughElement( self, "qualityColor", function ()
			local f3_local0 = self:GetDataSource()
			f3_local0 = f3_local0.qualityColor:GetValue( f1_local1 )
			if f3_local0 ~= nil then
				f1_local5:SetRGBFromInt( f3_local0, 0 )
			end
		end )
		self:addElement( f1_local5 )
		self.CPBG = f1_local5
	end
	local f1_local6 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f1_local6 = LUI.UIImage.new()
		f1_local6.id = "DarkenDivider"
		f1_local6:SetRGBFromTable( SWATCHES.HUD.background, 0 )
		f1_local6:SetAlpha( 0.25, 0 )
		f1_local6:SetBlendMode( BLEND_MODE.blend )
		f1_local6:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 11, 0, _1080p * 50, 0 )
		self:addElement( f1_local6 )
		self.DarkenDivider = f1_local6
	end
	local f1_local7 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f1_local7 = LUI.UIImage.new()
		f1_local7.id = "DarkenDividerTop"
		f1_local7:SetRGBFromTable( SWATCHES.HUD.background, 0 )
		f1_local7:SetAlpha( 0.25, 0 )
		f1_local7:SetBlendMode( BLEND_MODE.blend )
		f1_local7:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 550, 0, _1080p * 4, _1080p * -50 )
		self:addElement( f1_local7 )
		self.DarkenDividerTop = f1_local7
	end
	local f1_local8 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f1_local8 = LUI.UIImage.new()
		f1_local8.id = "DarkenDividerAngle"
		f1_local8:SetRGBFromTable( SWATCHES.HUD.background, 0 )
		f1_local8:SetAlpha( 0.25, 0 )
		f1_local8:SetZRotation( 180, 0 )
		f1_local8:setImage( RegisterMaterial( "wdg_slot_cut_out_1" ), 0 )
		f1_local8:SetBlendMode( BLEND_MODE.blend )
		f1_local8:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 504, _1080p * 550, _1080p * 4, _1080p * -50 )
		self:addElement( f1_local8 )
		self.DarkenDividerAngle = f1_local8
	end
	return self
end

MenuBuilder.registerType( "CACItemHeaderBackground", CACItemHeaderBackground )
LockTable( _M )
