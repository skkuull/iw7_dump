local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if IsLanguageOversizedFont() then
		f1_arg0.RigName:SetTop( _1080p * 10, 0 )
		f1_arg0.RigName:SetBottom( _1080p * 40, 0 )
	end
end

function RigInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 950 * _1080p, 0, 140 * _1080p )
	self.id = "RigInfo"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "GenericItemInfoBG", {
		controllerIndex = f2_local1
	} )
	Background.id = "Background"
	Background.WhiteOverlay:SetAlpha( 0.25, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local RigName = nil
	
	RigName = LUI.UIStyledText.new()
	RigName.id = "RigName"
	RigName:SetFontSize( 45 * _1080p )
	RigName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RigName:SetAlignment( LUI.Alignment.Left )
	RigName:SetOptOutRightToLeftAlignmentFlip( true )
	RigName:SetDecodeLetterLength( 30 )
	RigName:SetDecodeMaxRandChars( 6 )
	RigName:SetDecodeUpdatesPerLetter( 4 )
	RigName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 18, _1080p * 502, _1080p * 10.5, _1080p * 55.5 )
	RigName:SubscribeToModelThroughElement( self, "name", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.name:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			RigName:setText( ToUpperCase( f3_local0 ), 0 )
		end
	end )
	self:addElement( RigName )
	self.RigName = RigName
	
	local RigDescription = nil
	
	RigDescription = LUI.UIStyledText.new()
	RigDescription.id = "RigDescription"
	RigDescription:SetRGBFromInt( 0, 0 )
	RigDescription:SetFontSize( 22 * _1080p )
	RigDescription:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RigDescription:SetAlignment( LUI.Alignment.Left )
	RigDescription:SetOptOutRightToLeftAlignmentFlip( true )
	RigDescription:SetStartupDelay( 1250 )
	RigDescription:SetLineHoldTime( 1250 )
	RigDescription:SetAnimMoveTime( 3000 )
	RigDescription:SetEndDelay( 1000 )
	RigDescription:SetCrossfadeTime( 500 )
	RigDescription:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	RigDescription:SetMaxVisibleLines( 3 )
	RigDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 18, _1080p * 779, _1080p * 69.5, _1080p * 91.5 )
	RigDescription:SubscribeToModelThroughElement( self, "rigDescription", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.rigDescription:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			RigDescription:setText( f4_local0, 0 )
		end
	end )
	self:addElement( RigDescription )
	self.RigDescription = RigDescription
	
	local ManufacturersImage = nil
	
	ManufacturersImage = LUI.UIImage.new()
	ManufacturersImage.id = "ManufacturersImage"
	ManufacturersImage:SetRGBFromInt( 14277081, 0 )
	ManufacturersImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 527, _1080p * 927, _1080p * 8, _1080p * 58 )
	ManufacturersImage:SubscribeToModelThroughElement( self, "manufacturersImage", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.manufacturersImage:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			ManufacturersImage:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( ManufacturersImage )
	self.ManufacturersImage = ManufacturersImage
	
	local BrandAnchor = nil
	
	BrandAnchor = LUI.UIImage.new()
	BrandAnchor.id = "BrandAnchor"
	BrandAnchor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 512, _1080p * 518, _1080p * 8, _1080p * 58 )
	self:addElement( BrandAnchor )
	self.BrandAnchor = BrandAnchor
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "RigInfo", RigInfo )
LockTable( _M )
