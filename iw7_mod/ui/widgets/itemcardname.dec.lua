local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ItemCardName( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 46 * _1080p )
	self.id = "ItemCardName"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Title = nil
	
	Title = LUI.UIStyledText.new()
	Title.id = "Title"
	Title:SetFontSize( 28 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetStartupDelay( 1250 )
	Title:SetLineHoldTime( 400 )
	Title:SetAnimMoveTime( 300 )
	Title:SetEndDelay( 1000 )
	Title:SetCrossfadeTime( 500 )
	Title:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Title:SetMaxVisibleLines( 1 )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 9, _1080p * 37 )
	Title:SubscribeToModelThroughElement( self, "text", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.text:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Title:setText( f2_local0, 0 )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	return self
end

MenuBuilder.registerType( "ItemCardName", ItemCardName )
LockTable( _M )
