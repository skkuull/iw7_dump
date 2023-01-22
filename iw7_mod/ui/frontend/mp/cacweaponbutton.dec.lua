local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CaCWeaponButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 340 * _1080p, 0, 170 * _1080p )
	self.id = "CaCWeaponButton"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local HeaderTab = nil
	
	HeaderTab = LUI.UIImage.new()
	HeaderTab.id = "HeaderTab"
	HeaderTab:SetRGBFromTable( SWATCHES.CAC.ItemBtnHeader_Hover, 0 )
	HeaderTab:SetAnchorsAndPosition( 1, 0, 0, 1, 0, 0, 0, _1080p * 30 )
	self:addElement( HeaderTab )
	self.HeaderTab = HeaderTab
	
	local Base = nil
	Base = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f1_local1
	} )
	Base.id = "Base"
	Base.Name:SetAlignment( LUI.Alignment.Left )
	Base.Image:SetLeft( _1080p * -128, 0 )
	Base.Image:SetRight( _1080p * 128, 0 )
	Base.Image:SetTop( _1080p * -132, 0 )
	Base.Image:SetBottom( _1080p * -4, 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.Level:setText( "Level: 3", 0 )
	end
	Base:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	Base:SubscribeToModelThroughElement( self, "name", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.name:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Base.Name:setText( f2_local0, 0 )
		end
	end )
	Base:SubscribeToModelThroughElement( self, "image", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.image:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Base.Image:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( Base )
	self.Base = Base
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		HeaderTab:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.HeaderTab:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HeaderTab:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.HeaderTab:SetAnchorsAndPosition( 1, 0, 0, 1, 0, 0, 0, _1080p * 29, 0 )
				end,
				function ()
					return self.HeaderTab:SetAnchorsAndPosition( 1, 0, 0, 1, 0, _1080p * 120, 0, _1080p * 30, 300, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			HeaderTab:AnimateSequence( "ButtonOver" )
		end
		
		HeaderTab:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.HeaderTab:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.HeaderTab:SetAnchorsAndPosition( 1, 0, 0, 1, 0, 0, 0, _1080p * 29, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			HeaderTab:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f14_arg0, f14_arg1 )
		local f14_local0 = f14_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	return self
end

MenuBuilder.registerType( "CaCWeaponButton", CaCWeaponButton )
LockTable( _M )
