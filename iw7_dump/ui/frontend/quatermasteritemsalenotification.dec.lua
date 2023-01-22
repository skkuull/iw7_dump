local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.SaleText )
	f1_arg0.SaleText:SetShadowUOffset( -0 )
	f1_arg0.SaleText:SetShadowVOffset( -0 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "cost", function ()
		local f2_local0 = ""
		local f2_local1 = f1_arg0:GetDataSource()
		f2_local1 = f2_local1.premiumCost:GetValue( f1_arg1 )
		local f2_local2 = Engine.GetDvarInt( "loot_crate_cost_overide" )
		if f2_local2 > 0 then
			if CONDITIONS.IsArabic( f1_arg0 ) then
				f2_local0 = math.ceil( f2_local1 - f2_local2 / f2_local1 * 100 ) .. "%-"
			else
				f2_local0 = "-" .. math.ceil( f2_local1 - f2_local2 / f2_local1 * 100 ) .. "%"
			end
		end
		f1_arg0.SaleText:setText( f2_local0 )
	end )
end

function QuatermasterItemSaleNotification( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 32 * _1080p )
	self.id = "QuatermasterItemSaleNotification"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "icon_sale_tag" ), 0 )
	Background:SetUseAA( true )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 64, 0, _1080p * 32 )
	self:addElement( Background )
	self.Background = Background
	
	local SaleText = nil
	
	SaleText = LUI.UIStyledText.new()
	SaleText.id = "SaleText"
	SaleText:setText( Engine.Localize( "LUA_MENU_SALE_CAPS" ), 0 )
	SaleText:SetFontSize( 20 * _1080p )
	SaleText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	SaleText:SetAlignment( LUI.Alignment.Center )
	SaleText:SetStartupDelay( 1000 )
	SaleText:SetLineHoldTime( 400 )
	SaleText:SetAnimMoveTime( 150 )
	SaleText:SetEndDelay( 1000 )
	SaleText:SetCrossfadeTime( 400 )
	SaleText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	SaleText:SetMaxVisibleLines( 1 )
	SaleText:SetShadowMinDistance( -0.2, 0 )
	SaleText:SetShadowMaxDistance( 0.2, 0 )
	SaleText:SetShadowRGBFromInt( 0, 0 )
	SaleText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 3, _1080p * -12, _1080p * -10, _1080p * 10 )
	self:addElement( SaleText )
	self.SaleText = SaleText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "JapaneseSetup", {
			{
				function ()
					return self.Background:SetScale( 0.15, 0 )
				end
			}
		} )
		SaleText:RegisterAnimationSequence( "JapaneseSetup", {
			{
				function ()
					return self.SaleText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, _1080p * -10, _1080p * -12, _1080p * 14, 0 )
				end
			}
		} )
		self._sequences.JapaneseSetup = function ()
			Background:AnimateSequence( "JapaneseSetup" )
			SaleText:AnimateSequence( "JapaneseSetup" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	if CONDITIONS.IsJapanese( self ) then
		ACTIONS.AnimateSequence( self, "JapaneseSetup" )
	end
	return self
end

MenuBuilder.registerType( "QuatermasterItemSaleNotification", QuatermasterItemSaleNotification )
LockTable( _M )
