local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.ItemDescription )
	if Engine.IsSingleplayer() then
		f1_arg0.ItemDescription:SetMaxVisibleLines( 2 )
	end
	f1_arg0.UpdateRarityInfo = function ( f2_arg0, f2_arg1 )
		if Engine.IsMultiplayer() then
			assert( f2_arg0.Quality )
			assert( f2_arg0.Background )
			if CONDITIONS.IsCoreMultiplayer( f2_arg0 ) then
				assert( f2_arg0.MPStrip )
			end
			local f2_local0 = f2_arg1.quality:GetValue( f1_arg1 )
			f2_arg0.QualityIcon:SetDisplayQuality( f2_local0 )
			local f2_local1 = Cac.GetLootQualityColor( f2_local0 )
			f2_arg0.Quality:SetRGBFromInt( f2_local1, 0 )
			f2_arg0.Background:SetRGBFromInt( f2_local1, 0 )
			if CONDITIONS.IsCoreMultiplayer( f2_arg0 ) then
				f2_arg0.MPStrip:SetRGBFromInt( f2_local1, 0 )
			end
			local f2_local2 = Cac.GetLootQualityImage( f2_local0 )
			f2_arg0.Quality:setText( ToUpperCase( Cac.GetLootQualityString( f2_local0 ) ) )
			if f2_local0 > Cac.LowestQuality then
				ACTIONS.AnimateSequence( f2_arg0, "ShowQuality" )
			else
				ACTIONS.AnimateSequence( f2_arg0, "HideQuality" )
			end
		end
	end
	
end

function CACItemHeader( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1300 * _1080p, 0, 100 * _1080p )
	self.id = "CACItemHeader"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local GradientDown = nil
	
	GradientDown = LUI.UIImage.new()
	GradientDown.id = "GradientDown"
	GradientDown:SetRGBFromInt( 0, 0 )
	GradientDown:SetAlpha( 0.5, 0 )
	GradientDown:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	GradientDown:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 100, _1080p * 160 )
	self:addElement( GradientDown )
	self.GradientDown = GradientDown
	
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "CACItemHeaderBackground", {
		controllerIndex = f3_local1
	} )
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.itemRarity.quality0, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local f3_local6 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f3_local6 = LUI.UIImage.new()
		f3_local6.id = "ItemDescriptionNub"
		f3_local6:SetAlpha( 0, 0 )
		f3_local6:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1, _1080p * 9, _1080p * 5, _1080p * 20 )
		self:addElement( f3_local6 )
		self.ItemDescriptionNub = f3_local6
	end
	local ItemDescription = nil
	
	ItemDescription = LUI.UIStyledText.new()
	ItemDescription.id = "ItemDescription"
	ItemDescription:SetAlpha( 0.75, 0 )
	ItemDescription:setText( Engine.Localize( "MENU_NEW" ), 0 )
	ItemDescription:SetFontSize( 18 * _1080p )
	ItemDescription:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ItemDescription:SetAlignment( LUI.Alignment.Left )
	ItemDescription:SetOptOutRightToLeftAlignmentFlip( true )
	ItemDescription:SetStartupDelay( 1250 )
	ItemDescription:SetLineHoldTime( 500 )
	ItemDescription:SetAnimMoveTime( 500 )
	ItemDescription:SetEndDelay( 1000 )
	ItemDescription:SetCrossfadeTime( 500 )
	ItemDescription:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	ItemDescription:SetMaxVisibleLines( 10 )
	ItemDescription:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 20, _1080p * 750, _1080p * 19, _1080p * 37 )
	self:addElement( ItemDescription )
	self.ItemDescription = ItemDescription
	
	local ItemName = nil
	
	ItemName = LUI.UIStyledText.new()
	ItemName.id = "ItemName"
	ItemName:setText( Engine.Localize( "MENU_NEW" ), 0 )
	ItemName:SetFontSize( 60 * _1080p )
	ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ItemName:SetAlignment( LUI.Alignment.Left )
	ItemName:SetOptOutRightToLeftAlignmentFlip( true )
	ItemName:SetStartupDelay( 1250 )
	ItemName:SetLineHoldTime( 400 )
	ItemName:SetAnimMoveTime( 300 )
	ItemName:SetEndDelay( 1000 )
	ItemName:SetCrossfadeTime( 500 )
	ItemName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	ItemName:SetMaxVisibleLines( 1 )
	ItemName:SetDecodeLetterLength( 30 )
	ItemName:SetDecodeMaxRandChars( 6 )
	ItemName:SetDecodeUpdatesPerLetter( 4 )
	ItemName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 490, _1080p * 4, _1080p * 46 )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	local f3_local9 = nil
	if not Engine.IsMultiplayer() then
		f3_local9 = LUI.UIImage.new()
		f3_local9.id = "SPStrip"
		f3_local9:SetRGBFromTable( SWATCHES.itemRarity.quality0, 0 )
		f3_local9:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100 )
		self:addElement( f3_local9 )
		self.SPStrip = f3_local9
	end
	local f3_local10 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsCoreMultiplayer( self ) then
		f3_local10 = LUI.UIImage.new()
		f3_local10.id = "MPStrip"
		f3_local10:SetRGBFromInt( 6908265, 0 )
		f3_local10:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100 )
		self:addElement( f3_local10 )
		self.MPStrip = f3_local10
	end
	local f3_local11 = nil
	if not Engine.IsMultiplayer() and not Engine.InFrontend() then
		f3_local11 = LUI.UIImage.new()
		f3_local11.id = "EnergyBolt"
		f3_local11:SetRGBFromTable( SWATCHES.HUD.statusFill_Active, 0 )
		f3_local11:SetAlpha( 0, 0 )
		f3_local11:setImage( RegisterMaterial( "hud_weapon_info_energy_bolt" ), 0 )
		f3_local11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 480, _1080p * 528, 0, _1080p * 48 )
		self:addElement( f3_local11 )
		self.EnergyBolt = f3_local11
	end
	local f3_local12 = nil
	if Engine.IsMultiplayer() then
		f3_local12 = MenuBuilder.BuildRegisteredType( "QualityIcon", {
			controllerIndex = f3_local1
		} )
		f3_local12.id = "QualityIcon"
		f3_local12:SetAlpha( 0, 0 )
		f3_local12:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 52, _1080p * 59, _1080p * 91 )
		self:addElement( f3_local12 )
		self.QualityIcon = f3_local12
	end
	local f3_local13 = nil
	if Engine.IsMultiplayer() then
		f3_local13 = LUI.UIStyledText.new()
		f3_local13.id = "Quality"
		f3_local13:SetAlpha( 0, 0 )
		f3_local13:setText( ToUpperCase( "" ), 0 )
		f3_local13:SetFontSize( 32 * _1080p )
		f3_local13:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f3_local13:SetAlignment( LUI.Alignment.Left )
		f3_local13:SetOptOutRightToLeftAlignmentFlip( true )
		f3_local13:SetDecodeLetterLength( 20 )
		f3_local13:SetDecodeMaxRandChars( 6 )
		f3_local13:SetDecodeUpdatesPerLetter( 4 )
		f3_local13:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 60, _1080p * -730, _1080p * 59, _1080p * 91 )
		self:addElement( f3_local13 )
		self.Quality = f3_local13
	end
	self._animationSets.DefaultAnimationSet = function ()
		ItemName:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ItemName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 490, _1080p * 4, _1080p * 46, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			ItemName:AnimateSequence( "DefaultSequence" )
		end
		
		ItemDescription:RegisterAnimationSequence( "UpdateDescription", {
			{
				function ()
					return self.ItemDescription:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ItemDescription:SetAlpha( 0.75, 300, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ItemDescription:SetAnchors( 0, 1, 1, 0, 0 )
				end,
				function ()
					return self.ItemDescription:SetAnchors( 0, 1, 1, 0, 300, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ItemDescription:SetLeft( _1080p * 20, 0 )
				end,
				function ()
					return self.ItemDescription:SetLeft( _1080p * 20, 300, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ItemDescription:SetRight( _1080p * 750, 0 )
				end,
				function ()
					return self.ItemDescription:SetRight( _1080p * 750, 300, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ItemDescription:SetTop( _1080p * 19, 0 )
				end,
				function ()
					return self.ItemDescription:SetTop( _1080p * 4, 300, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ItemDescription:SetBottom( _1080p * 39, 0 )
				end,
				function ()
					return self.ItemDescription:SetBottom( _1080p * 24, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		if Engine.IsMultiplayer() then
			f3_local12:RegisterAnimationSequence( "UpdateDescription", {
				{
					function ()
						return self.QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 52, _1080p * 59, _1080p * 91, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f3_local13:RegisterAnimationSequence( "UpdateDescription", {
				{
					function ()
						return self.Quality:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 60, _1080p * -730, _1080p * 59, _1080p * 91, 0 )
					end
				}
			} )
		end
		self._sequences.UpdateDescription = function ()
			ItemDescription:AnimateSequence( "UpdateDescription" )
			if Engine.IsMultiplayer() then
				f3_local12:AnimateSequence( "UpdateDescription" )
			end
			if Engine.IsMultiplayer() then
				f3_local13:AnimateSequence( "UpdateDescription" )
			end
		end
		
		if not Engine.IsMultiplayer() and not Engine.InFrontend() then
			f3_local11:RegisterAnimationSequence( "ShowEnergy", {
				{
					function ()
						return self.EnergyBolt:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.ShowEnergy = function ()
			if not Engine.IsMultiplayer() and not Engine.InFrontend() then
				f3_local11:AnimateSequence( "ShowEnergy" )
			end
		end
		
		if not Engine.IsMultiplayer() and not Engine.InFrontend() then
			f3_local11:RegisterAnimationSequence( "HideEnergy", {
				{
					function ()
						return self.EnergyBolt:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideEnergy = function ()
			if not Engine.IsMultiplayer() and not Engine.InFrontend() then
				f3_local11:AnimateSequence( "HideEnergy" )
			end
		end
		
		if Engine.IsMultiplayer() then
			f3_local12:RegisterAnimationSequence( "ShowQuality", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f3_local13:RegisterAnimationSequence( "ShowQuality", {
				{
					function ()
						return self.Quality:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.ShowQuality = function ()
			if Engine.IsMultiplayer() then
				f3_local12:AnimateSequence( "ShowQuality" )
			end
			if Engine.IsMultiplayer() then
				f3_local13:AnimateSequence( "ShowQuality" )
			end
		end
		
		if Engine.IsMultiplayer() then
			f3_local12:RegisterAnimationSequence( "HideQuality", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f3_local13:RegisterAnimationSequence( "HideQuality", {
				{
					function ()
						return self.Quality:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideQuality = function ()
			if Engine.IsMultiplayer() then
				f3_local12:AnimateSequence( "HideQuality" )
			end
			if Engine.IsMultiplayer() then
				f3_local13:AnimateSequence( "HideQuality" )
			end
		end
		
	end
	
	self._animationSets.CP = function ()
		ItemName:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ItemName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 580, _1080p * 20, _1080p * 80, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			ItemName:AnimateSequence( "DefaultSequence" )
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f3_local6:RegisterAnimationSequence( "UpdateDescription", {
				{
					function ()
						return self.ItemDescriptionNub:SetAlpha( 0, 0 )
					end,
					function ()
						return self.ItemDescriptionNub:SetAlpha( 1, 300 )
					end
				},
				{
					function ()
						return self.ItemDescriptionNub:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 3, _1080p * 7, _1080p * 25, _1080p * 38, 0 )
					end,
					function ()
						return self.ItemDescriptionNub:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 3, _1080p * 7, _1080p * 6, _1080p * 19, 300 )
					end
				}
			} )
		end
		ItemDescription:RegisterAnimationSequence( "UpdateDescription", {
			{
				function ()
					return self.ItemDescription:SetAnchors( 0, 1, 0, 1, 0 )
				end,
				function ()
					return self.ItemDescription:SetAnchors( 0, 1, 0, 1, 300 )
				end
			},
			{
				function ()
					return self.ItemDescription:SetLeft( _1080p * 20, 0 )
				end,
				function ()
					return self.ItemDescription:SetLeft( _1080p * 20, 300 )
				end
			},
			{
				function ()
					return self.ItemDescription:SetRight( _1080p * 750, 0 )
				end,
				function ()
					return self.ItemDescription:SetRight( _1080p * 750, 300 )
				end
			},
			{
				function ()
					return self.ItemDescription:SetTop( _1080p * 119, 0 )
				end,
				function ()
					return self.ItemDescription:SetTop( _1080p * 104, 300 )
				end
			},
			{
				function ()
					return self.ItemDescription:SetBottom( _1080p * 137, 0 )
				end,
				function ()
					return self.ItemDescription:SetBottom( _1080p * 122, 300 )
				end
			},
			{
				function ()
					return self.ItemDescription:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ItemDescription:SetAlpha( 0.75, 300 )
				end
			}
		} )
		self._sequences.UpdateDescription = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f3_local6:AnimateSequence( "UpdateDescription" )
			end
			ItemDescription:AnimateSequence( "UpdateDescription" )
		end
		
		ItemName:RegisterAnimationSequence( "ShowQuality", {
			{
				function ()
					return self.ItemName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 580, 0, _1080p * 60, 0 )
				end
			}
		} )
		if Engine.IsMultiplayer() then
			f3_local12:RegisterAnimationSequence( "ShowQuality", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f3_local13:RegisterAnimationSequence( "ShowQuality", {
				{
					function ()
						return self.Quality:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.ShowQuality = function ()
			ItemName:AnimateSequence( "ShowQuality" )
			if Engine.IsMultiplayer() then
				f3_local12:AnimateSequence( "ShowQuality" )
			end
			if Engine.IsMultiplayer() then
				f3_local13:AnimateSequence( "ShowQuality" )
			end
		end
		
		ItemName:RegisterAnimationSequence( "HideQuality", {
			{
				function ()
					return self.ItemName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 580, _1080p * 20, _1080p * 80, 0 )
				end
			}
		} )
		if Engine.IsMultiplayer() then
			f3_local12:RegisterAnimationSequence( "HideQuality", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() then
			f3_local13:RegisterAnimationSequence( "HideQuality", {
				{
					function ()
						return self.Quality:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideQuality = function ()
			ItemName:AnimateSequence( "HideQuality" )
			if Engine.IsMultiplayer() then
				f3_local12:AnimateSequence( "HideQuality" )
			end
			if Engine.IsMultiplayer() then
				f3_local13:AnimateSequence( "HideQuality" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "CP" )
	end
	return self
end

MenuBuilder.registerType( "CACItemHeader", CACItemHeader )
LockTable( _M )
