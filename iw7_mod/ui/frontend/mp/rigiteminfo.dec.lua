local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RigItemInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 950 * _1080p, 0, 140 * _1080p )
	self.id = "RigItemInfo"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "GenericItemInfoBG", {
		controllerIndex = f1_local1
	} )
	Background.id = "Background"
	Background.WhiteOverlay:SetAlpha( 0.25, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local ItemName = nil
	
	ItemName = LUI.UIStyledText.new()
	ItemName.id = "ItemName"
	ItemName:SetFontSize( 45 * _1080p )
	ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ItemName:SetAlignment( LUI.Alignment.Left )
	ItemName:SetOptOutRightToLeftAlignmentFlip( true )
	ItemName:SetDecodeLetterLength( 30 )
	ItemName:SetDecodeMaxRandChars( 6 )
	ItemName:SetDecodeUpdatesPerLetter( 4 )
	ItemName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 18, _1080p * 779, _1080p * 10.5, _1080p * 55.5 )
	ItemName:SubscribeToModelThroughElement( self, "name", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.name:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ItemName:setText( ToUpperCase( f2_local0 ), 0 )
		end
	end )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	local ItemDescription = nil
	
	ItemDescription = LUI.UIStyledText.new()
	ItemDescription.id = "ItemDescription"
	ItemDescription:SetFontSize( 22 * _1080p )
	ItemDescription:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ItemDescription:SetAlignment( LUI.Alignment.Left )
	ItemDescription:SetOptOutRightToLeftAlignmentFlip( true )
	ItemDescription:SetStartupDelay( 1250 )
	ItemDescription:SetLineHoldTime( 1250 )
	ItemDescription:SetAnimMoveTime( 3000 )
	ItemDescription:SetEndDelay( 1000 )
	ItemDescription:SetCrossfadeTime( 500 )
	ItemDescription:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	ItemDescription:SetMaxVisibleLines( 3 )
	ItemDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 18, _1080p * 820, _1080p * 69.5, _1080p * 91.5 )
	ItemDescription:SubscribeToModelThroughElement( self, "rigDescription", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.rigDescription:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			ItemDescription:setText( f3_local0, 0 )
		end
	end )
	self:addElement( ItemDescription )
	self.ItemDescription = ItemDescription
	
	return self
end

MenuBuilder.registerType( "RigItemInfo", RigItemInfo )
LockTable( _M )
