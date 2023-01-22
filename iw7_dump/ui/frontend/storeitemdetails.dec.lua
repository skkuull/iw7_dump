local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.CODPointsIcon )
	f1_arg0.CODPointsIcon:SubscribeToModelThroughElement( f1_arg0, "isFirstParty", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		if f2_local0.isFirstParty:GetValue( f1_arg1 ) then
			f1_arg0.CODPointsIcon:SetAlpha( 0, 0 )
		else
			f1_arg0.CODPointsIcon:SetAlpha( 1, 0 )
		end
	end )
end

function StoreItemDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1150 * _1080p, 0, 200 * _1080p )
	self.id = "StoreItemDetails"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local f3_local3 = nil
	if not CONDITIONS.IsArabicSKU( self ) then
		f3_local3 = MenuBuilder.BuildRegisteredType( "GenericItemInfoBG", {
			controllerIndex = f3_local1
		} )
		f3_local3.id = "InfoBackground"
		f3_local3.WhiteOverlay:SetAlpha( 0.25, 0 )
		f3_local3:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		self:addElement( f3_local3 )
		self.InfoBackground = f3_local3
	end
	local f3_local4 = nil
	if not CONDITIONS.IsArabicSKU( self ) then
		f3_local4 = LUI.UIStyledText.new()
		f3_local4.id = "StoreItemDesc"
		f3_local4:SetFontSize( 22 * _1080p )
		f3_local4:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f3_local4:SetAlignment( LUI.Alignment.Left )
		f3_local4:SetStartupDelay( 3000 )
		f3_local4:SetLineHoldTime( 500 )
		f3_local4:SetAnimMoveTime( 750 )
		f3_local4:SetEndDelay( 1000 )
		f3_local4:SetCrossfadeTime( 400 )
		f3_local4:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
		f3_local4:SetMaxVisibleLines( 3 )
		f3_local4:SetDecodeLetterLength( 13 )
		f3_local4:SetDecodeMaxRandChars( 3 )
		f3_local4:SetDecodeUpdatesPerLetter( 4 )
		f3_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 18, _1080p * 1111, _1080p * 69, _1080p * 91 )
		f3_local4:SubscribeToModelThroughElement( self, "desc", function ()
			local f4_local0 = self:GetDataSource()
			f4_local0 = f4_local0.desc:GetValue( f3_local1 )
			if f4_local0 ~= nil then
				f3_local4:setText( f4_local0, 0 )
			end
		end )
		self:addElement( f3_local4 )
		self.StoreItemDesc = f3_local4
	end
	local Price = nil
	
	Price = LUI.UIStyledText.new()
	Price.id = "Price"
	Price:SetFontSize( 45 * _1080p )
	Price:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Price:SetAlignment( LUI.Alignment.Left )
	Price:SetOptOutRightToLeftAlignmentFlip( true )
	Price:SetDecodeLetterLength( 25 )
	Price:SetDecodeMaxRandChars( 3 )
	Price:SetDecodeUpdatesPerLetter( 4 )
	Price:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 946, _1080p * 1147, _1080p * 10, _1080p * 55 )
	Price:SubscribeToModelThroughElement( self, "price", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.price:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			Price:setText( f5_local0, 0 )
		end
	end )
	self:addElement( Price )
	self.Price = Price
	
	local f3_local6 = nil
	if not CONDITIONS.IsArabicSKU( self ) then
		f3_local6 = LUI.UIStyledText.new()
		f3_local6.id = "StoreItemTitle"
		f3_local6:SetFontSize( 45 * _1080p )
		f3_local6:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f3_local6:SetAlignment( LUI.Alignment.Left )
		f3_local6:SetOptOutRightToLeftAlignmentFlip( true )
		f3_local6:SetStartupDelay( 1000 )
		f3_local6:SetLineHoldTime( 500 )
		f3_local6:SetAnimMoveTime( 750 )
		f3_local6:SetEndDelay( 1000 )
		f3_local6:SetCrossfadeTime( 400 )
		f3_local6:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
		f3_local6:SetMaxVisibleLines( 2 )
		f3_local6:SetDecodeLetterLength( 15 )
		f3_local6:SetDecodeMaxRandChars( 3 )
		f3_local6:SetDecodeUpdatesPerLetter( 4 )
		f3_local6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 13, _1080p * 910, _1080p * 10, _1080p * 55 )
		f3_local6:SubscribeToModelThroughElement( self, "name", function ()
			local f6_local0 = self:GetDataSource()
			f6_local0 = f6_local0.name:GetValue( f3_local1 )
			if f6_local0 ~= nil then
				f3_local6:setText( f6_local0, 0 )
			end
		end )
		self:addElement( f3_local6 )
		self.StoreItemTitle = f3_local6
	end
	local CODPointsIcon = nil
	
	CODPointsIcon = LUI.UIImage.new()
	CODPointsIcon.id = "CODPointsIcon"
	CODPointsIcon:setImage( RegisterMaterial( "currency_cod_points_icon" ), 0 )
	CODPointsIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 907, _1080p * 943, _1080p * 14.5, _1080p * 50.5 )
	self:addElement( CODPointsIcon )
	self.CODPointsIcon = CODPointsIcon
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "StoreItemDetails", StoreItemDetails )
LockTable( _M )
