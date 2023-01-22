local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HeadquartersCombatRecordUsageTile( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 194 * _1080p )
	self.id = "HeadquartersCombatRecordUsageTile"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:setUseStencil( true )
	local CaCButtonBaseImage = nil
	CaCButtonBaseImage = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f1_local1
	} )
	CaCButtonBaseImage.id = "CaCButtonBaseImage"
	CaCButtonBaseImage.Image:SetLeft( _1080p * -128, 0 )
	CaCButtonBaseImage.Image:SetRight( _1080p * 128, 0 )
	CaCButtonBaseImage.Image:SetTop( _1080p * -152, 0 )
	CaCButtonBaseImage.Image:SetBottom( _1080p * -24, 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		CaCButtonBaseImage.Level:setText( "Level: 3", 0 )
	end
	CaCButtonBaseImage.Name:SetAlignment( LUI.Alignment.Left )
	CaCButtonBaseImage:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	CaCButtonBaseImage:SubscribeToModelThroughElement( self, "image", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.image:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			CaCButtonBaseImage.Image:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	CaCButtonBaseImage:SubscribeToModelThroughElement( self, "category", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.category:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			CaCButtonBaseImage.Name:setText( ToUpperCase( f3_local0 ), 0 )
		end
	end )
	self:addElement( CaCButtonBaseImage )
	self.CaCButtonBaseImage = CaCButtonBaseImage
	
	local TitleLabel = nil
	
	TitleLabel = LUI.UIStyledText.new()
	TitleLabel.id = "TitleLabel"
	TitleLabel:SetFontSize( 18 * _1080p )
	TitleLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TitleLabel:SetAlignment( LUI.Alignment.Left )
	TitleLabel:SetStartupDelay( 1000 )
	TitleLabel:SetLineHoldTime( 400 )
	TitleLabel:SetAnimMoveTime( 150 )
	TitleLabel:SetEndDelay( 1000 )
	TitleLabel:SetCrossfadeTime( 400 )
	TitleLabel:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	TitleLabel:SetMaxVisibleLines( 1 )
	TitleLabel:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 17.5, _1080p * -18, _1080p * -51, _1080p * -33 )
	TitleLabel:SubscribeToModelThroughElement( self, "itemName", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.itemName:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			TitleLabel:setText( ToUpperCase( f4_local0 ), 0 )
		end
	end )
	self:addElement( TitleLabel )
	self.TitleLabel = TitleLabel
	
	local CountLabel = nil
	
	CountLabel = LUI.UIStyledText.new()
	CountLabel.id = "CountLabel"
	CountLabel:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	CountLabel:SetFontSize( 18 * _1080p )
	CountLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CountLabel:SetAlignment( LUI.Alignment.Left )
	CountLabel:SetStartupDelay( 1000 )
	CountLabel:SetLineHoldTime( 400 )
	CountLabel:SetAnimMoveTime( 150 )
	CountLabel:SetEndDelay( 1000 )
	CountLabel:SetCrossfadeTime( 400 )
	CountLabel:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	CountLabel:SetMaxVisibleLines( 1 )
	CountLabel:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 17.5, _1080p * -18, _1080p * -28, _1080p * -10 )
	CountLabel:SubscribeToModelThroughElement( self, "count", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.count:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			CountLabel:setText( ToUpperCase( f5_local0 ), 0 )
		end
	end )
	self:addElement( CountLabel )
	self.CountLabel = CountLabel
	
	return self
end

MenuBuilder.registerType( "HeadquartersCombatRecordUsageTile", HeadquartersCombatRecordUsageTile )
LockTable( _M )
