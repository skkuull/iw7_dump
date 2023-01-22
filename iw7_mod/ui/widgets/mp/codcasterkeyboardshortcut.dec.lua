local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CodcasterKeyboardShortcut( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 65 * _1080p )
	self.id = "CodcasterKeyboardShortcut"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local GenericBorderWithNodes0 = nil
	
	GenericBorderWithNodes0 = MenuBuilder.BuildRegisteredType( "GenericBorderWithNodes", {
		controllerIndex = f1_local1
	} )
	GenericBorderWithNodes0.id = "GenericBorderWithNodes0"
	GenericBorderWithNodes0:SetRGBFromInt( 8421504, 0 )
	GenericBorderWithNodes0:SetAlpha( 0.5, 0 )
	GenericBorderWithNodes0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 122, _1080p * 8, _1080p * 58 )
	self:addElement( GenericBorderWithNodes0 )
	self.GenericBorderWithNodes0 = GenericBorderWithNodes0
	
	local GenericBackgroundGlow0 = nil
	
	GenericBackgroundGlow0 = MenuBuilder.BuildRegisteredType( "GenericBackgroundGlow", {
		controllerIndex = f1_local1
	} )
	GenericBackgroundGlow0.id = "GenericBackgroundGlow0"
	GenericBackgroundGlow0:SetRGBFromInt( 1776411, 0 )
	GenericBackgroundGlow0:SetAlpha( 0.75, 0 )
	GenericBackgroundGlow0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 121, _1080p * 9, _1080p * 57 )
	self:addElement( GenericBackgroundGlow0 )
	self.GenericBackgroundGlow0 = GenericBackgroundGlow0
	
	local KeyString = nil
	
	KeyString = LUI.UIText.new()
	KeyString.id = "KeyString"
	KeyString:SetFontSize( 30 * _1080p )
	KeyString:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KeyString:SetAlignment( LUI.Alignment.Center )
	KeyString:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 24.75, _1080p * 102.25, _1080p * 17, _1080p * 47 )
	KeyString:SubscribeToModelThroughElement( self, "keyString", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.keyString:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			KeyString:setText( f2_local0, 0 )
		end
	end )
	self:addElement( KeyString )
	self.KeyString = KeyString
	
	local KeyText = nil
	
	KeyText = LUI.UIText.new()
	KeyText.id = "KeyText"
	KeyText:SetFontSize( 30 * _1080p )
	KeyText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KeyText:SetAlignment( LUI.Alignment.Left )
	KeyText:SetOptOutRightToLeftAlignmentFlip( true )
	KeyText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 133, _1080p * 423, _1080p * 17, _1080p * 47 )
	KeyText:SubscribeToModelThroughElement( self, "keyText", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.keyText:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			KeyText:setText( f3_local0, 0 )
		end
	end )
	self:addElement( KeyText )
	self.KeyText = KeyText
	
	return self
end

MenuBuilder.registerType( "CodcasterKeyboardShortcut", CodcasterKeyboardShortcut )
LockTable( _M )
