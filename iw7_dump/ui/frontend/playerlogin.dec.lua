local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.TextLabel )
	f1_arg0.TextLabel:SubscribeToModel( DataSources.frontEnd.primaryPlayerUserName:GetModel( f1_arg1 ), function ()
		local f2_local0 = DataSources.frontEnd.primaryPlayerUserName:GetValue( f1_arg1 )
		if f2_local0 == nil or f2_local0 == "" then
			f1_arg0.TextLabel:setText( ToUpperCase( Engine.Localize( "XBOXLIVE_NOTSIGNEDIN" ), 0 ) )
		else
			f1_arg0.TextLabel:setText( ToUpperCase( Engine.Localize( "XBOXLIVE_SIGNEDINAS", Engine.MarkLocalized( f2_local0 ) ), 0 ) )
		end
	end )
end

function PlayerLogIn( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 28 * _1080p )
	self.id = "PlayerLogIn"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local TextLabel = nil
	
	TextLabel = LUI.UIText.new()
	TextLabel.id = "TextLabel"
	TextLabel:setText( ToUpperCase( Engine.Localize( "XBOXLIVE_SIGNEDINAS" ) ), 0 )
	TextLabel:SetFontSize( 26 * _1080p )
	TextLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TextLabel:SetAlignment( LUI.Alignment.Left )
	TextLabel:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 26 )
	self:addElement( TextLabel )
	self.TextLabel = TextLabel
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "PlayerLogIn", PlayerLogIn )
LockTable( _M )
