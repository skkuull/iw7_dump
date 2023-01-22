local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.InfoLabel:SubscribeToModelThroughElement( f1_arg0, "name", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.name:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			f1_arg0.InfoLabel:setText( f2_local0, 0 )
		end
	end )
end

function CRMInfoPanel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 896 * _1080p, 0, 194 * _1080p )
	self.id = "CRMInfoPanel"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local InfoLabel = nil
	
	InfoLabel = LUI.UIText.new()
	InfoLabel.id = "InfoLabel"
	InfoLabel:setText( Engine.Localize( "MENU_NEW" ), 0 )
	InfoLabel:SetFontSize( 45 * _1080p )
	InfoLabel:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	InfoLabel:SetAlignment( LUI.Alignment.Center )
	InfoLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 198, _1080p * 698, _1080p * 74.5, _1080p * 119.5 )
	self:addElement( InfoLabel )
	self.InfoLabel = InfoLabel
	
	local Border = nil
	
	Border = MenuBuilder.BuildRegisteredType( "GenericBorderFrame", {
		controllerIndex = f3_local1
	} )
	Border.id = "Border"
	Border.Left:SetRight( _1080p * 2, 0 )
	Border.Right:SetLeft( _1080p * -2, 0 )
	Border.Top:SetBottom( _1080p * 2, 0 )
	Border.Bottom:SetTop( _1080p * -2, 0 )
	Border:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Border )
	self.Border = Border
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CRMInfoPanel", CRMInfoPanel )
LockTable( _M )
