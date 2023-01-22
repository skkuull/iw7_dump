local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.HeaderText:SetShadowUOffset( -0 )
	f1_arg0.HeaderText:SetShadowVOffset( -0 )
	if IsLanguageOversizedFont() then
		f1_arg0.HeaderText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, 0, _1080p * 2, _1080p * 58 )
		f1_arg0.HeaderText:SetFontSize( 56 * _1080p )
	end
end

function CRMTitle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 919 * _1080p, 0, 60 * _1080p )
	self.id = "CRMTitle"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local HeaderText = nil
	
	HeaderText = LUI.UIStyledText.new()
	HeaderText.id = "HeaderText"
	HeaderText:SetRGBFromTable( SWATCHES.genericMenu.title, 0 )
	HeaderText:SetFontSize( 60 * _1080p )
	HeaderText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	HeaderText:SetAlignment( LUI.Alignment.Left )
	HeaderText:SetShadowMinDistance( -0.2, 0 )
	HeaderText:SetShadowMaxDistance( 0.2, 0 )
	HeaderText:SetShadowRGBFromInt( 0, 0 )
	HeaderText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, 0, 0, _1080p * 60 )
	HeaderText:SubscribeToModelThroughElement( self, "title", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.title:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			HeaderText:setText( f3_local0, 0 )
		end
	end )
	self:addElement( HeaderText )
	self.HeaderText = HeaderText
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "CRMTitle", CRMTitle )
LockTable( _M )
