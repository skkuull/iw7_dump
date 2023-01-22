local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = assert
	local f1_local1 = f1_arg0.BonusIcon1
	if f1_local1 then
		f1_local1 = f1_arg0.BonusIcon2
		if f1_local1 then
			f1_local1 = f1_arg0.BonusIcon3
			if f1_local1 then
				f1_local1 = f1_arg0.BonusText1
				if f1_local1 then
					f1_local1 = f1_arg0.BonusText2 and f1_arg0.BonusText3
				end
			end
		end
	end
	f1_local0( f1_local1, "Warning: Mission Honors Items Missing..." )
	f1_local0 = f1_arg0.BonusText1:GetCurrentFont()
	local f1_local1, f1_local2, f1_local3, f1_local4 = f1_arg0.BonusText1:getLocalRect()
	local f1_local5 = math.abs( f1_local2 - f1_local4 )
	local f1_local6 = {
		f1_arg1,
		f1_arg2,
		f1_arg3
	}
	local f1_local7 = {
		f1_arg0.BonusText1,
		f1_arg0.BonusText2,
		f1_arg0.BonusText3
	}
	for f1_local8 = 1, 3, 1 do
		local f1_local11 = f1_local6[f1_local8]
		local f1_local12 = f1_local7[f1_local8]
		local f1_local13, f1_local14, f1_local15, f1_local16 = GetTextDimensions( f1_local11, f1_local0, f1_local5 )
		local f1_local17 = f1_local15 - f1_local13
		if f1_local12:getText() == Engine.MarkLocalized( f1_local11 ) then
			return 
		end
		f1_local12:setText( Engine.MarkLocalized( f1_local11 ) )
		f1_local12:SetLeftAnchor( 1 )
		f1_local12:SetRightAnchor( 0 )
		f1_local12:SetLeft( 0 )
		f1_local12:SetRight( f1_local17 )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0:SetAlignment( LUI.Alignment.Center )
	f2_arg0.UpdateHonors = f0_local0
	local f2_local0 = {
		f2_arg0.BonusIcon1,
		f2_arg0.BonusIcon2,
		f2_arg0.BonusIcon3
	}
	for f2_local1 = 1, 3, 1 do
		local f2_local4 = f2_local0[f2_local1]
		f2_local4:SetLeftAnchor( 1 )
		f2_local4:SetRightAnchor( 0 )
		f2_local4:SetLeft( 0 )
		f2_local4:SetRight( 20 * _1080p )
	end
end

function MissionsHonours( menu, controller )
	local self = LUI.UIHorizontalStackedLayout.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 180 * _1080p, 0, 20 * _1080p )
	self.id = "MissionsHonours"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local BonusIcon1 = nil
	
	BonusIcon1 = LUI.UIImage.new()
	BonusIcon1.id = "BonusIcon1"
	BonusIcon1:SetRGBFromTable( SWATCHES.Rank.thirdPlace, 0 )
	BonusIcon1:setImage( RegisterMaterial( "mission_medal_bronze" ), 0 )
	BonusIcon1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 20, 0, _1080p * 20 )
	self:addElement( BonusIcon1 )
	self.BonusIcon1 = BonusIcon1
	
	local BonusText1 = nil
	
	BonusText1 = LUI.UIStyledText.new()
	BonusText1.id = "BonusText1"
	BonusText1:setText( ToUpperCase( "9999" ), 0 )
	BonusText1:SetFontSize( 20 * _1080p )
	BonusText1:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	BonusText1:SetAlignment( LUI.Alignment.Left )
	BonusText1:SetOutlineRGBFromInt( 0, 0 )
	BonusText1:SetDecodeLetterLength( 20 )
	BonusText1:SetDecodeMaxRandChars( 3 )
	BonusText1:SetDecodeUpdatesPerLetter( 4 )
	BonusText1:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -120, 0, _1080p * 20 )
	self:addElement( BonusText1 )
	self.BonusText1 = BonusText1
	
	local BonusIcon2 = nil
	
	BonusIcon2 = LUI.UIImage.new()
	BonusIcon2.id = "BonusIcon2"
	BonusIcon2:SetRGBFromTable( SWATCHES.Rank.secondPlace, 0 )
	BonusIcon2:setImage( RegisterMaterial( "mission_medal_silver" ), 0 )
	BonusIcon2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -120, _1080p * -100, 0, _1080p * 20 )
	self:addElement( BonusIcon2 )
	self.BonusIcon2 = BonusIcon2
	
	local BonusText2 = nil
	
	BonusText2 = LUI.UIStyledText.new()
	BonusText2.id = "BonusText2"
	BonusText2:setText( ToUpperCase( "9999" ), 0 )
	BonusText2:SetFontSize( 20 * _1080p )
	BonusText2:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	BonusText2:SetAlignment( LUI.Alignment.Left )
	BonusText2:SetOutlineRGBFromInt( 0, 0 )
	BonusText2:SetDecodeLetterLength( 20 )
	BonusText2:SetDecodeMaxRandChars( 3 )
	BonusText2:SetDecodeUpdatesPerLetter( 4 )
	BonusText2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 87, _1080p * 127, 0, _1080p * 20 )
	self:addElement( BonusText2 )
	self.BonusText2 = BonusText2
	
	local BonusIcon3 = nil
	
	BonusIcon3 = LUI.UIImage.new()
	BonusIcon3.id = "BonusIcon3"
	BonusIcon3:SetRGBFromInt( 14860562, 0 )
	BonusIcon3:setImage( RegisterMaterial( "mission_medal_gold" ), 0 )
	BonusIcon3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -60, _1080p * -40, 0, _1080p * 20 )
	self:addElement( BonusIcon3 )
	self.BonusIcon3 = BonusIcon3
	
	local BonusText3 = nil
	
	BonusText3 = LUI.UIStyledText.new()
	BonusText3.id = "BonusText3"
	BonusText3:setText( ToUpperCase( "9999" ), 0 )
	BonusText3:SetFontSize( 20 * _1080p )
	BonusText3:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	BonusText3:SetAlignment( LUI.Alignment.Left )
	BonusText3:SetOutlineRGBFromInt( 0, 0 )
	BonusText3:SetDecodeLetterLength( 20 )
	BonusText3:SetDecodeMaxRandChars( 3 )
	BonusText3:SetDecodeUpdatesPerLetter( 4 )
	BonusText3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -40, 0, 0, _1080p * 20 )
	self:addElement( BonusText3 )
	self.BonusText3 = BonusText3
	
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "MissionsHonours", MissionsHonours )
LockTable( _M )
