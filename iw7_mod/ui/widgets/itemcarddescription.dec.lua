local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg2.itemType )
	assert( f1_arg0.Description, "WARNING: Item Card Description Items Are Missing..." )
	local f1_local0 = f1_arg0.Description
	if not Engine.IsPC() then
		f1_local0:SetShadowMinDistance( -0.2, 0 )
		f1_local0:SetShadowMaxDistance( 0.2, 0 )
		f1_local0:SetShadowRGBFromInt( 0, 0 )
		f1_local0:SetShadowUOffset( -0 )
		f1_local0:SetShadowVOffset( -0 )
	end
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "text", function ()
		local f2_local0 = f1_local0:GetCurrentFont()
		local f2_local1, f2_local2, f2_local3, f2_local4 = f1_local0:getLocalRect()
		local f2_local5 = _1080p * 300
		local f2_local6 = math.abs( f2_local4 - f2_local2 )
		local f2_local7 = f1_arg0:GetDataSource()
		f2_local7 = f2_local7.text:GetValue( f1_arg1 )
		local f2_local8 = f2_local7
		if f1_arg2.itemType == LUI.ItemCard.types.CURRENCY_PACK then
			f2_local8 = Engine.Localize( "MP_FRONTEND_ONLY_ITEMCARD_BONUS_SALVAGE", f2_local7 )
		end
		local f2_local9, f2_local10, f2_local11, f2_local12 = GetTextDimensions( f2_local8, f2_local0, f2_local6, f2_local5 )
		local f2_local13 = math.min( math.ceil( f2_local10 - f2_local12 ), _1080p * 100 ) * -0.5
		f1_local0:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, f2_local13, f2_local13 + f2_local6, 0, LUI.EASING.linear )
		f1_local0:setText( f2_local8, 0 )
	end )
end

function ItemCardDescription( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 120 * _1080p )
	self.id = "ItemCardDescription"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetRGBFromInt( 6710886, 0 )
	Blur:SetBlurStrength( 2.75, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local Description = nil
	
	Description = LUI.UIStyledText.new()
	Description.id = "Description"
	Description:setText( LocalizeString( "" ), 0 )
	Description:SetFontSize( 20 * _1080p )
	Description:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	Description:SetAlignment( LUI.Alignment.Center )
	Description:SetStartupDelay( 1000 )
	Description:SetLineHoldTime( 1000 )
	Description:SetAnimMoveTime( 200 )
	Description:SetEndDelay( 1000 )
	Description:SetCrossfadeTime( 250 )
	Description:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	Description:SetMaxVisibleLines( 6 )
	Description:SetDecodeUseSystemTime( false )
	Description:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -10, _1080p * 10 )
	self:addElement( Description )
	self.Description = Description
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ItemCardDescription", ItemCardDescription )
LockTable( _M )
