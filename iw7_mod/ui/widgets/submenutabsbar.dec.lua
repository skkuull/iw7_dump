local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function SubMenuTabsBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1300 * _1080p, 0, 40 * _1080p )
	self.id = "SubMenuTabsBar"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TabBackerImage = nil
	
	TabBackerImage = LUI.UIImage.new()
	TabBackerImage.id = "TabBackerImage"
	TabBackerImage:SetRGBFromInt( 3092271, 0 )
	TabBackerImage:SetAlpha( 0, 0 )
	TabBackerImage:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, 0, _1080p * 40 )
	self:addElement( TabBackerImage )
	self.TabBackerImage = TabBackerImage
	
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
			return MenuBuilder.BuildRegisteredType( "SubMenuTab", {
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
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TabBackerImage:RegisterAnimationSequence( "NoBlur", {
			{
				function ()
					return self.TabBackerImage:SetAlpha( 1, 0 )
				end
			}
		} )
		TabBacker:RegisterAnimationSequence( "NoBlur", {
			{
				function ()
					return self.TabBacker:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NoBlur = function ()
			TabBackerImage:AnimateSequence( "NoBlur" )
			TabBacker:AnimateSequence( "NoBlur" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "SubMenuTabsBar", SubMenuTabsBar )
LockTable( _M )
