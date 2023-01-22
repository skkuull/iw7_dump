local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ItemCardQuality( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 203 * _1080p, 0, 45 * _1080p )
	self.id = "ItemCardQuality"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Rarity = nil
	
	Rarity = LUI.UIStyledText.new()
	Rarity.id = "Rarity"
	Rarity:SetFontSize( 22 * _1080p )
	Rarity:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Rarity:SetAlignment( LUI.Alignment.Left )
	Rarity:SetOptOutRightToLeftAlignmentFlip( true )
	Rarity:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 38, _1080p * 239, _1080p * -11, _1080p * 11 )
	Rarity:SubscribeToModelThroughElement( self, "color", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.color:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Rarity:SetRGBFromInt( f2_local0, 0 )
		end
	end )
	Rarity:SubscribeToModelThroughElement( self, "text", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.text:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Rarity:setText( ToUpperCase( f3_local0 ), 0 )
		end
	end )
	self:addElement( Rarity )
	self.Rarity = Rarity
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f1_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 32, _1080p * -16, _1080p * 16 )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	return self
end

MenuBuilder.registerType( "ItemCardQuality", ItemCardQuality )
LockTable( _M )
