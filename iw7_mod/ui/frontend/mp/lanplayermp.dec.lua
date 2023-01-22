local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LANPlayerMP( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "LANPlayerMP"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.6, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local FullName = nil
	
	FullName = LUI.UIStyledText.new()
	FullName.id = "FullName"
	FullName:SetFontSize( 20 * _1080p )
	FullName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FullName:SetAlignment( LUI.Alignment.Left )
	FullName:SetShadowMinDistance( -0.2, 0 )
	FullName:SetShadowMaxDistance( 0.2, 0 )
	FullName:SetShadowRGBFromInt( 0, 0 )
	FullName:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -487.81, _1080p * -15.81, _1080p * -25, _1080p * -5 )
	FullName:SubscribeToModelThroughElement( self, "fullName", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.fullName:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			FullName:setText( f2_local0, 0 )
		end
	end )
	self:addElement( FullName )
	self.FullName = FullName
	
	return self
end

MenuBuilder.registerType( "LANPlayerMP", LANPlayerMP )
LockTable( _M )
