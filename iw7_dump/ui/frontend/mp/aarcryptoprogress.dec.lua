local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARCryptoProgress( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 45 * _1080p )
	self.id = "AARCryptoProgress"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local cryptoLevelBg = nil
	
	cryptoLevelBg = LUI.UIImage.new()
	cryptoLevelBg.id = "cryptoLevelBg"
	cryptoLevelBg:SetRGBFromInt( 14387733, 0 )
	cryptoLevelBg:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 25, _1080p * -20, 0 )
	self:addElement( cryptoLevelBg )
	self.cryptoLevelBg = cryptoLevelBg
	
	local cryptoLevelLabel = nil
	
	cryptoLevelLabel = LUI.UIText.new()
	cryptoLevelLabel.id = "cryptoLevelLabel"
	cryptoLevelLabel:SetFontSize( 20 * _1080p )
	cryptoLevelLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	cryptoLevelLabel:SetAlignment( LUI.Alignment.Center )
	cryptoLevelLabel:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 25, _1080p * -19.5, _1080p * 0.5 )
	cryptoLevelLabel:SubscribeToModelThroughElement( self, "inGameCurrency", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.inGameCurrency:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			cryptoLevelLabel:setText( f2_local0, 0 )
		end
	end )
	self:addElement( cryptoLevelLabel )
	self.cryptoLevelLabel = cryptoLevelLabel
	
	local NextCryptoText = nil
	
	NextCryptoText = LUI.UIText.new()
	NextCryptoText.id = "NextCryptoText"
	NextCryptoText:setText( "Next Cryptokey", 0 )
	NextCryptoText:SetFontSize( 20 * _1080p )
	NextCryptoText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	NextCryptoText:SetAlignment( LUI.Alignment.Left )
	NextCryptoText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 35, 0, 0, _1080p * 20 )
	self:addElement( NextCryptoText )
	self.NextCryptoText = NextCryptoText
	
	local ProgressBar = nil
	
	ProgressBar = MenuBuilder.BuildRegisteredType( "GenericProgressBar", {
		controllerIndex = f1_local1
	} )
	ProgressBar.id = "ProgressBar"
	ProgressBar:SetDataSourceThroughElement( self, "percentToNextInGameDollar" )
	ProgressBar.Fill:SetRGBFromTable( SWATCHES.CAC.yellowLight, 0 )
	ProgressBar:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 35, 0, _1080p * 25, _1080p * 45 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	ProgressBar:SetDataSourceThroughElement( self, "percentToNextInGameDollar" )
	return self
end

MenuBuilder.registerType( "AARCryptoProgress", AARCryptoProgress )
LockTable( _M )
