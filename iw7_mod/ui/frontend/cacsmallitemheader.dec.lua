local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.UpdateRarityInfo = function ( f2_arg0, f2_arg1 )
		if Engine.IsMultiplayer() then
			assert( f2_arg0.QualityIcon )
			assert( f2_arg0.Quality )
			assert( f2_arg0.Background )
			assert( f2_arg0.Strip )
			assert( f2_arg0.ItemName )
			if Engine.IsAliensMode() then
				assert( f2_arg0.ItemNameCP )
				f2_arg0.ItemName:SetAlpha( 0, 0 )
			end
			local f2_local0 = f2_arg1.quality:GetValue( f1_arg1 )
			if f2_local0 ~= nil and f2_local0 > Cac.LowestQuality then
				f2_arg0.QualityIcon:SetDisplayQuality( f2_local0 )
				f2_arg0.Quality:setText( ToUpperCase( Cac.GetLootQualityString( f2_local0 ) ) )
				local f2_local1 = Cac.GetLootQualityColor( f2_local0 )
				f2_arg0.Quality:SetRGBFromInt( f2_local1, 0 )
				f2_arg0.Background:SetRGBFromInt( f2_local1, 0 )
				f2_arg0.Strip:SetRGBFromInt( f2_local1, 0 )
				ACTIONS.AnimateSequence( f2_arg0, "ShowQuality" )
			else
				ACTIONS.AnimateSequence( f2_arg0, "HideQuality" )
			end
			local f2_local2 = nil
			if f2_arg1.challengeInfo then
				f2_local2 = f2_arg1.challengeInfo.name
			elseif f2_arg1.emblemName then
				f2_local2 = f2_arg1.emblemName
			end
			if f2_local2 then
				local f2_local1 = f2_local2:GetValue( f1_arg1 )
				if f2_local1 ~= nil then
					f2_arg0.ItemName:setText( LocalizeString( f2_local1 ), 0 )
					if f2_arg0.ItemNameCP then
						f2_arg0.ItemNameCP:setText( LocalizeString( f2_local1 ), 0 )
					end
				end
			end
		end
	end
	
end

function CACSmallItemHeader( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 520 * _1080p, 0, 100 * _1080p )
	self.id = "CACSmallItemHeader"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "CACSmallItemHeaderBackground", {
		controllerIndex = f3_local1
	} )
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.itemRarity.quality0, 0 )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 520, 0, _1080p * 100 )
	self:addElement( Background )
	self.Background = Background
	
	local ItemName = nil
	
	ItemName = LUI.UIStyledText.new()
	ItemName.id = "ItemName"
	ItemName:setText( Engine.Localize( "MENU_NEW" ), 0 )
	ItemName:SetFontSize( 34 * _1080p )
	ItemName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ItemName:SetAlignment( LUI.Alignment.Left )
	ItemName:SetOptOutRightToLeftAlignmentFlip( true )
	ItemName:SetStartupDelay( 1000 )
	ItemName:SetLineHoldTime( 500 )
	ItemName:SetAnimMoveTime( 500 )
	ItemName:SetEndDelay( 1000 )
	ItemName:SetCrossfadeTime( 500 )
	ItemName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	ItemName:SetMaxVisibleLines( 1 )
	ItemName:SetDecodeLetterLength( 30 )
	ItemName:SetDecodeMaxRandChars( 6 )
	ItemName:SetDecodeUpdatesPerLetter( 4 )
	ItemName:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 19, _1080p * -6, _1080p * 8, _1080p * 42 )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	local f3_local5 = nil
	if Engine.IsAliensMode() then
		f3_local5 = LUI.UIStyledText.new()
		f3_local5.id = "ItemNameCP"
		f3_local5:setText( Engine.Localize( "MENU_NEW" ), 0 )
		f3_local5:SetFontSize( 48 * _1080p )
		f3_local5:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
		f3_local5:SetAlignment( LUI.Alignment.Left )
		f3_local5:SetOptOutRightToLeftAlignmentFlip( true )
		f3_local5:SetStartupDelay( 1000 )
		f3_local5:SetLineHoldTime( 500 )
		f3_local5:SetAnimMoveTime( 500 )
		f3_local5:SetEndDelay( 1000 )
		f3_local5:SetCrossfadeTime( 500 )
		f3_local5:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
		f3_local5:SetMaxVisibleLines( 1 )
		f3_local5:SetDecodeLetterLength( 30 )
		f3_local5:SetDecodeMaxRandChars( 6 )
		f3_local5:SetDecodeUpdatesPerLetter( 4 )
		f3_local5:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 19, _1080p * -6, _1080p * 8, _1080p * 56 )
		self:addElement( f3_local5 )
		self.ItemNameCP = f3_local5
	end
	local Strip = nil
	
	Strip = LUI.UIImage.new()
	Strip.id = "Strip"
	Strip:SetRGBFromInt( 6908265, 0 )
	Strip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100 )
	self:addElement( Strip )
	self.Strip = Strip
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f3_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon:SetAlpha( 0, 0 )
	QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 51, _1080p * 59, _1080p * 91 )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	local Quality = nil
	
	Quality = LUI.UIStyledText.new()
	Quality.id = "Quality"
	Quality:setText( "", 0 )
	Quality:SetFontSize( 32 * _1080p )
	Quality:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Quality:SetAlignment( LUI.Alignment.Left )
	Quality:SetOptOutRightToLeftAlignmentFlip( true )
	Quality:SetDecodeLetterLength( 20 )
	Quality:SetDecodeMaxRandChars( 6 )
	Quality:SetDecodeUpdatesPerLetter( 4 )
	Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 57, _1080p * -17, _1080p * 60, _1080p * 92 )
	self:addElement( Quality )
	self.Quality = Quality
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		QualityIcon:RegisterAnimationSequence( "ShowQuality", {
			{
				function ()
					return self.QualityIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		Quality:RegisterAnimationSequence( "ShowQuality", {
			{
				function ()
					return self.Quality:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowQuality = function ()
			QualityIcon:AnimateSequence( "ShowQuality" )
			Quality:AnimateSequence( "ShowQuality" )
		end
		
		QualityIcon:RegisterAnimationSequence( "HideQuality", {
			{
				function ()
					return self.QualityIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		Quality:RegisterAnimationSequence( "HideQuality", {
			{
				function ()
					return self.Quality:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideQuality = function ()
			QualityIcon:AnimateSequence( "HideQuality" )
			Quality:AnimateSequence( "HideQuality" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CACSmallItemHeader", CACSmallItemHeader )
LockTable( _M )
