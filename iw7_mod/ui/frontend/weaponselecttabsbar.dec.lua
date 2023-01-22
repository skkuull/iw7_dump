local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WeaponSelectTabsBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1300 * _1080p, 0, 40 * _1080p )
	self.id = "WeaponSelectTabsBar"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TabBacker = nil
	
	TabBacker = LUI.UIBlur.new()
	TabBacker.id = "TabBacker"
	TabBacker:SetRGBFromInt( 13421772, 0 )
	TabBacker:setImage( RegisterMaterial( "tab_bar_backer" ), 0 )
	TabBacker:SetBlurStrength( 2.75, 0 )
	TabBacker:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, 0, _1080p * 40 )
	self:addElement( TabBacker )
	self.TabBacker = TabBacker
	
	local Tabs = nil
	
	Tabs = LUI.TabManager.new( nil, {
		tabHeight = _1080p * 30,
		wrap = false,
		spacing = 2,
		buildTab = function ()
			return MenuBuilder.BuildRegisteredType( "WeaponClassTab", {
				controllerIndex = f1_local1
			} )
		end,
		buildSpacer = function ()
			return MenuBuilder.BuildRegisteredType( "TabsSpacer", {
				controllerIndex = f1_local1
			} )
		end,
		controllerIndex = f1_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -540, _1080p * 540, _1080p * 5, _1080p * 35 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetRGBFromInt( 0, 0 )
	Image:SetAlpha( 0.3, 0 )
	Image:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 40, _1080p * 44 )
	self:addElement( Image )
	self.Image = Image
	
	return self
end

MenuBuilder.registerType( "WeaponSelectTabsBar", WeaponSelectTabsBar )
LockTable( _M )
