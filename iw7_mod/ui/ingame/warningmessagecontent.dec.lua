local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WarningMessageContent( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 90 * _1080p )
	self.id = "WarningMessageContent"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local WarningText = nil
	
	WarningText = LUI.UIText.new()
	WarningText.id = "WarningText"
	WarningText:SetFontSize( 30 * _1080p )
	WarningText:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	WarningText:SetAlignment( LUI.Alignment.Center )
	WarningText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 31 )
	WarningText:BindColorToModel( DataSources.inGame.HUD.hints.warning.color:GetModel( f1_local1 ) )
	WarningText:SubscribeToModel( DataSources.inGame.HUD.hints.warning.text:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.HUD.hints.warning.text:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			WarningText:setText( f2_local0, 0 )
		end
	end )
	self:addElement( WarningText )
	self.WarningText = WarningText
	
	local WarningIcon = nil
	
	WarningIcon = LUI.UIImage.new()
	WarningIcon.id = "WarningIcon"
	WarningIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -30, _1080p * 30, _1080p * 31, _1080p * 90 )
	WarningIcon:BindColorToModel( DataSources.inGame.HUD.hints.warning.color:GetModel( f1_local1 ) )
	WarningIcon:BindAlphaToModel( DataSources.inGame.HUD.hints.warning.iconAlpha:GetModel( f1_local1 ) )
	WarningIcon:SubscribeToModel( DataSources.inGame.HUD.hints.warning.icon:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.HUD.hints.warning.icon:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			WarningIcon:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( WarningIcon )
	self.WarningIcon = WarningIcon
	
	WarningIcon:SubscribeToModel( DataSources.inGame.HUD.hints.warning.icon:GetModel( f1_local1 ), function ()
		if DataSources.inGame.HUD.hints.warning.icon:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.hints.warning.icon:GetValue( f1_local1 ) == "" then
			ACTIONS.SetAlpha( self, 0, 0, 0 )
		end
		if DataSources.inGame.HUD.hints.warning.icon:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.hints.warning.icon:GetValue( f1_local1 ) ~= "" then
			ACTIONS.SetAlpha( self, 1, 0, 0 )
		end
	end )
	return self
end

MenuBuilder.registerType( "WarningMessageContent", WarningMessageContent )
LockTable( _M )
