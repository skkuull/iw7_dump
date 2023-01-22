local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.ref:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			if (tonumber( Cac.GetPerkUnlockRank( f2_local0 ) ) == 0) or Prestige.IsItemUnlocked( f1_arg1, f2_local0, "perk" ) then
				f1_arg0.Base.RectrictionOverlay:SetAlpha( 0 )
				f1_arg0.Base.PrestigeBG:SetAlpha( 0 )
			else
				f1_arg0.Base.RectrictionOverlay:SetAlpha( 1 )
				f1_arg0.Base.PrestigeBG:SetAlpha( 0.4 )
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
				name = "perk_select_alternate"
			} )
		end )
	end
end

function PermanentUnlockBasePerk( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 192.67 * _1080p, 0, 200 * _1080p )
	self.id = "PermanentUnlockBasePerk"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local Base = nil
	Base = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f5_local1
	} )
	Base.id = "Base"
	Base.Image:SetLeft( _1080p * -60, 0 )
	Base.Image:SetRight( _1080p * 60, 0 )
	Base.Image:SetTop( _1080p * -146, 0 )
	Base.Image:SetBottom( _1080p * -26, 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.LevelBacker:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.LevelFrame:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.Level:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.Level:setText( "", 0 )
	end
	Base.Name:SetAlignment( LUI.Alignment.Center )
	Base:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	Base:SubscribeToModelThroughElement( self, "icon", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.icon:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			Base.Image:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	Base:SubscribeToModelThroughElement( self, "name", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.name:GetValue( f5_local1 )
		if f7_local0 ~= nil then
			Base.Name:setText( LocalizeString( f7_local0 ), 0 )
		end
	end )
	self:addElement( Base )
	self.Base = Base
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetRGBFromInt( 13421772, 0 )
	Image:SetAlpha( 0, 0 )
	Image:setImage( RegisterMaterial( "widg_disabled" ), 0 )
	self:addElement( Image )
	self.Image = Image
	
	PostLoadFunc( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "PermanentUnlockBasePerk", PermanentUnlockBasePerk )
LockTable( _M )
