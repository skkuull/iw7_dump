local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CACItemHeaderSteakBackground( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1069 * _1080p, 0, 100 * _1080p )
	self.id = "CACItemHeaderSteakBackground"
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
		f1_local3:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
		f1_local3:SetBlurStrength( 2.75, 0 )
		f1_local3:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 11, 0, 0, 0 )
		self:addElement( f1_local3 )
		self.BlurGradTopSP = f1_local3
	end
	local f1_local4 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsMultiplayer( self ) then
		f1_local4 = LUI.UIBlur.new()
		f1_local4.id = "BlurGradTopMP"
		f1_local4:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
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
	return self
end

MenuBuilder.registerType( "CACItemHeaderSteakBackground", CACItemHeaderSteakBackground )
LockTable( _M )
