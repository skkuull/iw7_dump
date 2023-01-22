local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FramedRigPerk( menu, controller )
	local self = LUI.UIButton.new( {
		left = 0 * _1080p,
		right = 140 * _1080p,
		top = 0 * _1080p,
		bottom = 133 * _1080p,
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false
	} )
	self.id = "FramedRigPerk"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller or {}
	local f1_local2 = nil
	if Engine.InFrontend() then
		f1_local2 = f1_local1.controllerIndex
		if not f1_local2 then
			local f1_local3 = LUI.FlowManager.GetScopedData( self )
			assert( f1_local3 )
			f1_local2 = f1_local3.controllerIndex
		end
	else
		f1_local2 = self:getRootController()
	end
	if PreLoadFunc then
		PreLoadFunc( self, f1_local2, f1_local1 )
	end
	local f1_local3 = self
	local TitleBackground = nil
	
	TitleBackground = LUI.UIImage.new()
	TitleBackground.id = "TitleBackground"
	TitleBackground:SetAnchors( 0, 0, 0, 1, 0 )
	TitleBackground:SetLeft( _1080p * 0, 0 )
	TitleBackground:SetRight( _1080p * 0, 0 )
	TitleBackground:SetTop( _1080p * 0, 0 )
	TitleBackground:SetBottom( _1080p * 31, 0 )
	TitleBackground:SetRGBFromTable( SWATCHES.CAC.powerBoxFrame, 0 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local Border = nil
	
	Border = MenuBuilder.BuildRegisteredType( "GenericBorderFrame", {
		controllerIndex = f1_local2
	} )
	Border.id = "Border"
	Border:SetAnchors( 0, 0, 1, 0, 0 )
	Border:SetLeft( _1080p * 0, 0 )
	Border:SetRight( _1080p * 0, 0 )
	Border:SetTop( _1080p * -102, 0 )
	Border:SetBottom( _1080p * 0, 0 )
	Border:SetRGBFromTable( SWATCHES.CAC.powerBoxFrame, 0 )
	Border.Left:SetRight( _1080p * 1, 0 )
	Border.Left:SetRGBFromInt( 16777215, 0 )
	Border.Right:SetLeft( _1080p * -1, 0 )
	Border.Right:SetRGBFromInt( 16777215, 0 )
	Border.Top:SetBottom( _1080p * 1, 0 )
	Border.Top:SetRGBFromInt( 16777215, 0 )
	Border.Bottom:SetTop( _1080p * -1, 0 )
	Border.Bottom:SetRGBFromInt( 16777215, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local TitleString = nil
	
	TitleString = LUI.UIText.new()
	TitleString.id = "TitleString"
	TitleString:SetAnchors( 0, 0, 0, 1, 0 )
	TitleString:SetLeft( _1080p * 0, 0 )
	TitleString:SetRight( _1080p * 0, 0 )
	TitleString:SetTop( _1080p * 6, 0 )
	TitleString:SetBottom( _1080p * 25, 0 )
	TitleString:SetRGBFromInt( 0, 0 )
	TitleString:setText( Engine.Localize( "LUA_MENU_MP_RIG_PERK" ), 0 )
	TitleString:SetFontSize( 19 * _1080p )
	TitleString:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	TitleString:SetAlignment( LUI.Alignment.Center )
	self:addElement( TitleString )
	self.TitleString = TitleString
	
	local RigPerkImage = nil
	
	RigPerkImage = LUI.UIImage.new()
	RigPerkImage.id = "RigPerkImage"
	RigPerkImage:SetAnchors( 0, 0, 0, 0, 0 )
	RigPerkImage:SetLeft( _1080p * 30, 0 )
	RigPerkImage:SetRight( _1080p * -30, 0 )
	RigPerkImage:SetTop( _1080p * 43, 0 )
	RigPerkImage:SetBottom( _1080p * -12, 0 )
	RigPerkImage:SetRGBFromInt( 16777215, 0 )
	RigPerkImage:SubscribeToModelThroughElement( self, "image", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.image:GetValue( f1_local2 )
		if f2_local0 ~= nil then
			RigPerkImage:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( RigPerkImage )
	self.RigPerkImage = RigPerkImage
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_local2, f1_local1 )
	end
	return self
end

MenuBuilder.registerType( "FramedRigPerk", FramedRigPerk )
if PushFunc then
	LUI.FlowManager.RegisterStackPushBehaviour( "FramedRigPerk", PushFunc )
end
if PopFunc then
	LUI.FlowManager.RegisterStackPopBehaviour( "FramedRigPerk", PopFunc )
end
LockTable( _M )
