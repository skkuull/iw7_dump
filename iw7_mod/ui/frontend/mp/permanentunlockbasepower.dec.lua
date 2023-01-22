local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.ref:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			if (tonumber( Cac.GetPowerUnlockRank( f2_local0 ) ) == 0) or Prestige.IsItemUnlocked( f1_arg1, f2_local0, "power" ) then
				f1_arg0.CaCButtonBaseImage.RectrictionOverlay:SetAlpha( 0 )
				f1_arg0.CaCButtonBaseImage.PrestigeBG:SetAlpha( 0 )
			else
				f1_arg0.CaCButtonBaseImage.RectrictionOverlay:SetAlpha( 1 )
				f1_arg0.CaCButtonBaseImage.PrestigeBG:SetAlpha( 0.4 )
			end
		end
	end
	
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "ref", f1_local0 )
	f1_arg0:addEventHandler( "gain_focus", function ()
		f1_local0()
	end )
	if Engine.IsPC() then
		f1_arg0:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
			f1_arg0:dispatchEventToCurrentMenu( {
				name = "power_select_alternate"
			} )
		end )
	end
end

function PermanentUnlockBasePower( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 133.2 * _1080p )
	self.id = "PermanentUnlockBasePower"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local CaCButtonBaseImage = nil
	CaCButtonBaseImage = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f5_local1
	} )
	CaCButtonBaseImage.id = "CaCButtonBaseImage"
	CaCButtonBaseImage.Image:SetLeft( _1080p * -50, 0 )
	CaCButtonBaseImage.Image:SetRight( _1080p * 50, 0 )
	CaCButtonBaseImage.Image:SetTop( _1080p * -108.5, 0 )
	CaCButtonBaseImage.Image:SetBottom( _1080p * -8.5, 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		CaCButtonBaseImage.LevelBacker:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		CaCButtonBaseImage.LevelFrame:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		CaCButtonBaseImage.Level:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		CaCButtonBaseImage.Level:setText( "", 0 )
	end
	CaCButtonBaseImage.Name:SetAlignment( LUI.Alignment.Left )
	CaCButtonBaseImage:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	CaCButtonBaseImage:SubscribeToModelThroughElement( self, "icon", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.icon:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			CaCButtonBaseImage.Image:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	CaCButtonBaseImage:SubscribeToModelThroughElement( self, "name", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.name:GetValue( f5_local1 )
		if f7_local0 ~= nil then
			CaCButtonBaseImage.Name:setText( LocalizeString( f7_local0 ), 0 )
		end
	end )
	self:addElement( CaCButtonBaseImage )
	self.CaCButtonBaseImage = CaCButtonBaseImage
	
	PostLoadFunc( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "PermanentUnlockBasePower", PermanentUnlockBasePower )
LockTable( _M )
