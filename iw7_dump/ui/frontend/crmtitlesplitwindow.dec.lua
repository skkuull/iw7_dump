local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CRMTitleSplitWindow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 919 * _1080p, 0, 60 * _1080p )
	self.id = "CRMTitleSplitWindow"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local HeaderText = nil
	
	HeaderText = LUI.UIStyledText.new()
	HeaderText.id = "HeaderText"
	HeaderText:SetRGBFromTable( SWATCHES.genericMenu.title, 0 )
	HeaderText:SetFontSize( 60 * _1080p )
	HeaderText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	HeaderText:SetAlignment( LUI.Alignment.Center )
	HeaderText:SetShadowMinDistance( -0.2, 0 )
	HeaderText:SetShadowMaxDistance( 0.2, 0 )
	HeaderText:SetShadowRGBFromInt( 0, 0 )
	HeaderText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, 0, 0, _1080p * 60 )
	HeaderText:SubscribeToModelThroughElement( self, "title", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.title:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			HeaderText:setText( f2_local0, 0 )
		end
	end )
	self:addElement( HeaderText )
	self.HeaderText = HeaderText
	
	return self
end

MenuBuilder.registerType( "CRMTitleSplitWindow", CRMTitleSplitWindow )
LockTable( _M )
