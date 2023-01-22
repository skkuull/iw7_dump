local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.BodyText:SetShadowUOffset( -0 )
	f1_arg0.BodyText:SetShadowVOffset( -0 )
	if IsLanguageOversizedFont() then
		f1_arg0.BodyText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, 0, _1080p * 15, _1080p * 39 )
	end
end

function CRMBody( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 475 * _1080p )
	self.id = "CRMBody"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	self:setUseStencil( true )
	local BodyText = nil
	
	BodyText = LUI.UIStyledText.new()
	BodyText.id = "BodyText"
	BodyText:SetRGBFromInt( 13750996, 0 )
	BodyText:SetFontSize( 24 * _1080p )
	BodyText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	BodyText:SetAlignment( LUI.Alignment.Left )
	BodyText:SetShadowMinDistance( -0.2, 0 )
	BodyText:SetShadowMaxDistance( 0.2, 0 )
	BodyText:SetShadowRGBFromInt( 0, 0 )
	BodyText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, 0, _1080p * 7, _1080p * 31 )
	BodyText:SubscribeToModelThroughElement( self, "content_long", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.content_long:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			BodyText:setText( f3_local0, 0 )
		end
	end )
	self:addElement( BodyText )
	self.BodyText = BodyText
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "CRMBody", CRMBody )
LockTable( _M )
