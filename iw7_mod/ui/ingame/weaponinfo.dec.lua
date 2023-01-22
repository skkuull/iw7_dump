local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	assert( f1_arg0.WeaponInfoAmmoBar )
	assert( f1_arg0.TextRightClipAmmo )
	assert( f1_arg0.TextLeftClipAmmo )
	assert( f1_arg0.TextStockAmmo )
	local f1_local0 = DataSources.inGame.player.currentWeapon.clipAmmoRight
	local f1_local1 = DataSources.inGame.player.currentWeapon.clipAmmoLeft
	local f1_local2 = DataSources.inGame.player.currentWeapon.clipAmmoRightDisplay
	local f1_local3 = DataSources.inGame.player.currentWeapon.clipAmmoLeftDisplay
	local f1_local4 = DataSources.inGame.player.currentWeapon.clipAmmoMax
	local f1_local5 = DataSources.inGame.player.currentWeapon.lowAmmoThreshold
	local f1_local6 = DataSources.inGame.player.currentWeapon.isDualWielding
	f1_arg0.clipAmmoMax = f1_local4:GetValue( f1_arg1 )
	f1_arg0.lowAmmoThreshold = f1_local5:GetValue( f1_arg1 )
	local f1_local7 = function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		local f2_local1 = f1_local2:GetValue( f1_arg1 )
		local f2_local2 = f1_local6:GetValue( f1_arg1 )
		if f1_arg0.lastClipAmmoDisplayRight ~= f2_local1 then
			f1_arg0.TextRightClipAmmo:SetScale( 0.25, 0 )
			f1_arg0.TextRightClipAmmo:SetScale( 0, 100 )
			f1_arg0.lastClipAmmoDisplayRight = f2_local1
		end
		local f2_local3, f2_local4 = nil
		if f2_local0 <= f1_arg0.lowAmmoThreshold * f1_arg0.clipAmmoMax then
			f2_local3 = "NoRightClipAmmo"
			f2_local4 = "WarningOn"
		else
			f2_local3 = "HasRightClipAmmo"
			f2_local4 = "WarningOff"
		end
		if f1_arg0.currentRightClipAmmoSequence ~= f2_local3 then
			ACTIONS.AnimateSequence( f1_arg0, f2_local3 )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "WarningGlow",
				sequenceName = f2_local4,
				elementPath = "WarningGlow"
			} )
			f1_arg0.currentRightClipAmmoSequence = f2_local3
		end
	end
	
	local f1_local8 = function ( f3_arg0 )
		local f3_local0 = f1_local1:GetValue( f1_arg1 )
		local f3_local1 = f1_local3:GetValue( f1_arg1 )
		local f3_local2 = f1_local6:GetValue( f1_arg1 )
		if f1_arg0.lastClipAmmoDisplayLeft ~= f3_local1 then
			f1_arg0.TextLeftClipAmmo:SetScale( 0.25, 0 )
			f1_arg0.TextLeftClipAmmo:SetScale( 0, 100 )
			f1_arg0.lastClipAmmoDisplayLeft = f3_local1
		end
		local f3_local3, f3_local4 = nil
		if f3_local2 and f3_local0 <= f1_arg0.lowAmmoThreshold * f1_arg0.clipAmmoMax then
			f3_local3 = "NoLeftClipAmmo"
			f3_local4 = "WarningOn"
		else
			f3_local3 = "HasLeftClipAmmo"
			f3_local4 = "WarningOff"
		end
		if f1_arg0.currentLeftClipAmmoSequence ~= f3_local3 then
			ACTIONS.AnimateSequence( f1_arg0, f3_local3 )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "WarningGlowLeft",
				sequenceName = f3_local4,
				elementPath = "WarningGlowLeft"
			} )
			f1_arg0.currentLeftClipAmmoSequence = f3_local3
		end
	end
	
	local f1_local9 = function ( f4_arg0 )
		f1_arg0.clipAmmoMax = DataModel.GetModelValue( f4_arg0 )
		f1_local8( f1_local1:GetModel( f1_arg1 ) )
		f1_local7( f1_local0:GetModel( f1_arg1 ) )
	end
	
	local f1_local10 = function ( f5_arg0 )
		f1_arg0.lowAmmoThreshold = DataModel.GetModelValue( f5_arg0 )
		f1_local8( f1_local1:GetModel( f1_arg1 ) )
		f1_local7( f1_local0:GetModel( f1_arg1 ) )
	end
	
	f1_arg0.TextRightClipAmmo:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), f1_local7 )
	f1_arg0.TextLeftClipAmmo:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), f1_local8 )
	f1_arg0.TextRightClipAmmo:SubscribeToModel( f1_local4:GetModel( f1_arg1 ), f1_local9 )
	f1_arg0.TextRightClipAmmo:SubscribeToModel( f1_local5:GetModel( f1_arg1 ), f1_local10 )
	f1_arg0.TextLeftClipAmmo:SetWordWrap( false )
	f1_arg0.TextRightClipAmmo:SetWordWrap( false )
	f1_arg0.TextRightClipAmmo:SetShadowUOffset( -0 )
	f1_arg0.TextRightClipAmmo:SetShadowVOffset( -0 )
	f1_arg0.TextLeftClipAmmo:SetShadowUOffset( -0 )
	f1_arg0.TextLeftClipAmmo:SetShadowVOffset( -0 )
	f1_arg0.TextStockAmmo:SetShadowUOffset( -0 )
	f1_arg0.TextStockAmmo:SetShadowVOffset( -0 )
end

function WeaponInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 50 * _1080p )
	self.id = "WeaponInfo"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local StockWarningGlow = nil
	
	StockWarningGlow = MenuBuilder.BuildRegisteredType( "WarningGlow", {
		controllerIndex = f6_local1
	} )
	StockWarningGlow.id = "StockWarningGlow"
	StockWarningGlow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 84, _1080p * 140, _1080p * -56.16, _1080p * 6.16 )
	StockWarningGlow:BindAlphaToModel( DataSources.inGame.player.currentWeapon.ammoReserveAlpha:GetModel( f6_local1 ) )
	self:addElement( StockWarningGlow )
	self.StockWarningGlow = StockWarningGlow
	
	local WarningGlow = nil
	
	WarningGlow = MenuBuilder.BuildRegisteredType( "WarningGlow", {
		controllerIndex = f6_local1
	} )
	WarningGlow.id = "WarningGlow"
	WarningGlow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -16.49, _1080p * 54.49, _1080p * -66, _1080p * 13 )
	WarningGlow:BindAlphaToModel( DataSources.inGame.player.currentWeapon.ammoInfoAlpha:GetModel( f6_local1 ) )
	self:addElement( WarningGlow )
	self.WarningGlow = WarningGlow
	
	local WarningGlowLeft = nil
	
	WarningGlowLeft = MenuBuilder.BuildRegisteredType( "WarningGlow", {
		controllerIndex = f6_local1
	} )
	WarningGlowLeft.id = "WarningGlowLeft"
	WarningGlowLeft:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -117, _1080p * -55, _1080p * -61, _1080p * 8 )
	WarningGlowLeft:BindAlphaToModel( DataSources.inGame.player.currentWeapon.leftAmmoReserveAlpha:GetModel( f6_local1 ) )
	self:addElement( WarningGlowLeft )
	self.WarningGlowLeft = WarningGlowLeft
	
	local TextStockAmmo = nil
	
	TextStockAmmo = LUI.UIStyledText.new()
	TextStockAmmo.id = "TextStockAmmo"
	TextStockAmmo:SetRGBFromInt( 10066329, 0 )
	TextStockAmmo:SetFontSize( 32 * _1080p )
	TextStockAmmo:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TextStockAmmo:SetAlignment( LUI.Alignment.Center )
	TextStockAmmo:SetShadowMinDistance( -0.02, 0 )
	TextStockAmmo:SetShadowMaxDistance( 0.02, 0 )
	TextStockAmmo:SetShadowRGBFromInt( 0, 0 )
	TextStockAmmo:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -76, _1080p * -4, _1080p * -41, _1080p * -9 )
	TextStockAmmo:BindAlphaToModel( DataSources.inGame.player.currentWeapon.ammoReserveAlpha:GetModel( f6_local1 ) )
	TextStockAmmo:SubscribeToModel( DataSources.inGame.player.currentWeapon.stockAmmoDisplay:GetModel( f6_local1 ), function ()
		local f7_local0 = DataSources.inGame.player.currentWeapon.stockAmmoDisplay:GetValue( f6_local1 )
		if f7_local0 ~= nil then
			TextStockAmmo:setText( f7_local0, 0 )
		end
	end )
	self:addElement( TextStockAmmo )
	self.TextStockAmmo = TextStockAmmo
	
	local WeaponInfoAmmoBar = nil
	
	WeaponInfoAmmoBar = MenuBuilder.BuildRegisteredType( "WeaponInfoAmmoBar", {
		controllerIndex = f6_local1
	} )
	WeaponInfoAmmoBar.id = "WeaponInfoAmmoBar"
	WeaponInfoAmmoBar:SetDotPitchEnabled( true )
	WeaponInfoAmmoBar:SetDotPitchX( 0, 0 )
	WeaponInfoAmmoBar:SetDotPitchY( 0, 0 )
	WeaponInfoAmmoBar:SetDotPitchContrast( 0, 0 )
	WeaponInfoAmmoBar:SetDotPitchMode( 1 )
	WeaponInfoAmmoBar:SetDataSource( DataSources.inGame.player.currentWeapon.clipAmmoRightTotal, f6_local1 )
	WeaponInfoAmmoBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 117.5, _1080p * 220, _1080p * -8, 0 )
	self:addElement( WeaponInfoAmmoBar )
	self.WeaponInfoAmmoBar = WeaponInfoAmmoBar
	
	local WeaponInfoAmmoBarLeft = nil
	
	WeaponInfoAmmoBarLeft = MenuBuilder.BuildRegisteredType( "WeaponInfoAmmoBar", {
		controllerIndex = f6_local1
	} )
	WeaponInfoAmmoBarLeft.id = "WeaponInfoAmmoBarLeft"
	WeaponInfoAmmoBarLeft:SetAlpha( 0, 0 )
	WeaponInfoAmmoBarLeft:SetDotPitchEnabled( true )
	WeaponInfoAmmoBarLeft:SetDotPitchX( 0, 0 )
	WeaponInfoAmmoBarLeft:SetDotPitchY( 0, 0 )
	WeaponInfoAmmoBarLeft:SetDotPitchContrast( 0, 0 )
	WeaponInfoAmmoBarLeft:SetDotPitchMode( 0 )
	WeaponInfoAmmoBarLeft:SetDataSource( DataSources.inGame.player.currentWeapon.clipAmmoLeftTotal, f6_local1 )
	WeaponInfoAmmoBarLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 14.25, _1080p * 116.5, _1080p * -8, 0 )
	self:addElement( WeaponInfoAmmoBarLeft )
	self.WeaponInfoAmmoBarLeft = WeaponInfoAmmoBarLeft
	
	local TextLeftClipAmmo = nil
	
	TextLeftClipAmmo = LUI.UIStyledText.new()
	TextLeftClipAmmo.id = "TextLeftClipAmmo"
	TextLeftClipAmmo:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	TextLeftClipAmmo:SetAlpha( 0, 0 )
	TextLeftClipAmmo:SetDotPitchEnabled( true )
	TextLeftClipAmmo:SetDotPitchX( 0, 0 )
	TextLeftClipAmmo:SetDotPitchY( 0, 0 )
	TextLeftClipAmmo:SetDotPitchContrast( 0, 0 )
	TextLeftClipAmmo:SetDotPitchMode( 0 )
	TextLeftClipAmmo:SetFontSize( 48 * _1080p )
	TextLeftClipAmmo:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TextLeftClipAmmo:SetAlignment( LUI.Alignment.Center )
	TextLeftClipAmmo:SetShadowMinDistance( -0.02, 0 )
	TextLeftClipAmmo:SetShadowMaxDistance( 0.02, 0 )
	TextLeftClipAmmo:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -128.25, _1080p * -47.25, _1080p * -49, _1080p * -1 )
	TextLeftClipAmmo:SubscribeToModel( DataSources.inGame.player.currentWeapon.clipAmmoLeftDisplay:GetModel( f6_local1 ), function ()
		local f8_local0 = DataSources.inGame.player.currentWeapon.clipAmmoLeftDisplay:GetValue( f6_local1 )
		if f8_local0 ~= nil then
			TextLeftClipAmmo:setText( f8_local0, 0 )
		end
	end )
	self:addElement( TextLeftClipAmmo )
	self.TextLeftClipAmmo = TextLeftClipAmmo
	
	local TextRightClipAmmo = nil
	
	TextRightClipAmmo = LUI.UIStyledText.new()
	TextRightClipAmmo.id = "TextRightClipAmmo"
	TextRightClipAmmo:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	TextRightClipAmmo:SetDotPitchEnabled( true )
	TextRightClipAmmo:SetDotPitchX( 0, 0 )
	TextRightClipAmmo:SetDotPitchY( 0, 0 )
	TextRightClipAmmo:SetDotPitchContrast( 0, 0 )
	TextRightClipAmmo:SetDotPitchMode( 0 )
	TextRightClipAmmo:SetFontSize( 48 * _1080p )
	TextRightClipAmmo:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TextRightClipAmmo:SetAlignment( LUI.Alignment.Center )
	TextRightClipAmmo:SetShadowMinDistance( -0.03, 0 )
	TextRightClipAmmo:SetShadowMaxDistance( 0.03, 0 )
	TextRightClipAmmo:SetShadowRGBFromInt( 0, 0 )
	TextRightClipAmmo:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -22.5, _1080p * 58.5, _1080p * -49, _1080p * -1 )
	TextRightClipAmmo:BindAlphaToModel( DataSources.inGame.player.currentWeapon.ammoInfoAlpha:GetModel( f6_local1 ) )
	TextRightClipAmmo:SubscribeToModel( DataSources.inGame.player.currentWeapon.clipAmmoRightDisplay:GetModel( f6_local1 ), function ()
		local f9_local0 = DataSources.inGame.player.currentWeapon.clipAmmoRightDisplay:GetValue( f6_local1 )
		if f9_local0 ~= nil then
			TextRightClipAmmo:setText( f9_local0, 0 )
		end
	end )
	self:addElement( TextRightClipAmmo )
	self.TextRightClipAmmo = TextRightClipAmmo
	
	local WeaponInfoDescription = nil
	
	WeaponInfoDescription = MenuBuilder.BuildRegisteredType( "WeaponInfoDescription", {
		controllerIndex = f6_local1
	} )
	WeaponInfoDescription.id = "WeaponInfoDescription"
	WeaponInfoDescription:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 300, _1080p * 59, _1080p * 103 )
	self:addElement( WeaponInfoDescription )
	self.WeaponInfoDescription = WeaponInfoDescription
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TextRightClipAmmo:RegisterAnimationSequence( "NoRightClipAmmo", {
			{
				function ()
					return self.TextRightClipAmmo:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		self._sequences.NoRightClipAmmo = function ()
			TextRightClipAmmo:AnimateSequence( "NoRightClipAmmo" )
		end
		
		TextStockAmmo:RegisterAnimationSequence( "NoStockAmmo", {
			{
				function ()
					return self.TextStockAmmo:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		self._sequences.NoStockAmmo = function ()
			TextStockAmmo:AnimateSequence( "NoStockAmmo" )
		end
		
		TextRightClipAmmo:RegisterAnimationSequence( "HasRightClipAmmo", {
			{
				function ()
					return self.TextRightClipAmmo:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
				end
			}
		} )
		self._sequences.HasRightClipAmmo = function ()
			TextRightClipAmmo:AnimateSequence( "HasRightClipAmmo" )
		end
		
		TextStockAmmo:RegisterAnimationSequence( "HasStockAmmo", {
			{
				function ()
					return self.TextStockAmmo:SetRGBFromInt( 12566463, 0 )
				end
			}
		} )
		self._sequences.HasStockAmmo = function ()
			TextStockAmmo:AnimateSequence( "HasStockAmmo" )
		end
		
		TextRightClipAmmo:RegisterAnimationSequence( "UpdatedRightClipAmmo", {
			{
				function ()
					return self.TextRightClipAmmo:SetDepth( -8, 0 )
				end,
				function ()
					return self.TextRightClipAmmo:SetDepth( 0, 100 )
				end
			},
			{
				function ()
					return self.TextRightClipAmmo:SetScale( 0.25, 0 )
				end,
				function ()
					return self.TextRightClipAmmo:SetScale( 0, 100 )
				end
			},
			{
				function ()
					return self.TextRightClipAmmo:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.TextRightClipAmmo:SetDotPitchX( 0, 100 )
				end
			},
			{
				function ()
					return self.TextRightClipAmmo:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.TextRightClipAmmo:SetDotPitchY( 0, 100 )
				end
			},
			{
				function ()
					return self.TextRightClipAmmo:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.TextRightClipAmmo:SetDotPitchContrast( 0, 100 )
				end
			}
		} )
		self._sequences.UpdatedRightClipAmmo = function ()
			TextRightClipAmmo:AnimateSequence( "UpdatedRightClipAmmo" )
		end
		
		self._sequences.HideAmmo = function ()
			TextRightClipAmmo:AnimateSequence( "HideAmmo" )
		end
		
		self._sequences.ShowAmmo = function ()
			TextRightClipAmmo:AnimateSequence( "ShowAmmo" )
		end
		
		TextLeftClipAmmo:RegisterAnimationSequence( "ShowLeftClipAmmo", {
			{
				function ()
					return self.TextLeftClipAmmo:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowLeftClipAmmo = function ()
			TextLeftClipAmmo:AnimateSequence( "ShowLeftClipAmmo" )
		end
		
		TextLeftClipAmmo:RegisterAnimationSequence( "HideLeftClipAmmo", {
			{
				function ()
					return self.TextLeftClipAmmo:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideLeftClipAmmo = function ()
			TextLeftClipAmmo:AnimateSequence( "HideLeftClipAmmo" )
			TextRightClipAmmo:AnimateSequence( "HideLeftClipAmmo" )
		end
		
		TextLeftClipAmmo:RegisterAnimationSequence( "HasLeftClipAmmo", {
			{
				function ()
					return self.TextLeftClipAmmo:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.HasLeftClipAmmo = function ()
			TextLeftClipAmmo:AnimateSequence( "HasLeftClipAmmo" )
		end
		
		TextLeftClipAmmo:RegisterAnimationSequence( "NoLeftClipAmmo", {
			{
				function ()
					return self.TextLeftClipAmmo:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		self._sequences.NoLeftClipAmmo = function ()
			TextLeftClipAmmo:AnimateSequence( "NoLeftClipAmmo" )
		end
		
		TextLeftClipAmmo:RegisterAnimationSequence( "UpdatedLeftClipAmmo", {
			{
				function ()
					return self.TextLeftClipAmmo:SetDepth( -8, 0 )
				end,
				function ()
					return self.TextLeftClipAmmo:SetDepth( 0, 100 )
				end
			},
			{
				function ()
					return self.TextLeftClipAmmo:SetScale( 0.25, 0 )
				end,
				function ()
					return self.TextLeftClipAmmo:SetScale( 0, 100 )
				end
			},
			{
				function ()
					return self.TextLeftClipAmmo:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.TextLeftClipAmmo:SetDotPitchX( 0, 100 )
				end
			},
			{
				function ()
					return self.TextLeftClipAmmo:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.TextLeftClipAmmo:SetDotPitchY( 0, 100 )
				end
			},
			{
				function ()
					return self.TextLeftClipAmmo:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.TextLeftClipAmmo:SetDotPitchContrast( 0, 100 )
				end
			}
		} )
		self._sequences.UpdatedLeftClipAmmo = function ()
			TextLeftClipAmmo:AnimateSequence( "UpdatedLeftClipAmmo" )
		end
		
		WeaponInfoAmmoBar:RegisterAnimationSequence( "ShowRightEnergyMeter", {
			{
				function ()
					return self.WeaponInfoAmmoBar:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WeaponInfoAmmoBar:SetAlpha( 1, 30 )
				end,
				function ()
					return self.WeaponInfoAmmoBar:SetAlpha( 0, 30 )
				end,
				function ()
					return self.WeaponInfoAmmoBar:SetAlpha( 1, 30 )
				end,
				function ()
					return self.WeaponInfoAmmoBar:SetAlpha( 0, 30 )
				end,
				function ()
					return self.WeaponInfoAmmoBar:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.WeaponInfoAmmoBar:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.WeaponInfoAmmoBar:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.WeaponInfoAmmoBar:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.WeaponInfoAmmoBar:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.WeaponInfoAmmoBar:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.WeaponInfoAmmoBar:SetDotPitchContrast( 0, 300 )
				end
			}
		} )
		self._sequences.ShowRightEnergyMeter = function ()
			WeaponInfoAmmoBar:AnimateSequence( "ShowRightEnergyMeter" )
		end
		
		WeaponInfoAmmoBar:RegisterAnimationSequence( "HideRightEnergyMeter", {
			{
				function ()
					return self.WeaponInfoAmmoBar:SetAlpha( 1, 0 )
				end,
				function ()
					return self.WeaponInfoAmmoBar:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.HideRightEnergyMeter = function ()
			WeaponInfoAmmoBar:AnimateSequence( "HideRightEnergyMeter" )
		end
		
		WeaponInfoAmmoBarLeft:RegisterAnimationSequence( "ShowLeftEnergyMeter", {
			{
				function ()
					return self.WeaponInfoAmmoBarLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WeaponInfoAmmoBarLeft:SetAlpha( 1, 30 )
				end,
				function ()
					return self.WeaponInfoAmmoBarLeft:SetAlpha( 0, 30 )
				end,
				function ()
					return self.WeaponInfoAmmoBarLeft:SetAlpha( 1, 30 )
				end,
				function ()
					return self.WeaponInfoAmmoBarLeft:SetAlpha( 0, 30 )
				end,
				function ()
					return self.WeaponInfoAmmoBarLeft:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.WeaponInfoAmmoBarLeft:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.WeaponInfoAmmoBarLeft:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.WeaponInfoAmmoBarLeft:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.WeaponInfoAmmoBarLeft:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.WeaponInfoAmmoBarLeft:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.WeaponInfoAmmoBarLeft:SetDotPitchContrast( 0, 300 )
				end
			}
		} )
		self._sequences.ShowLeftEnergyMeter = function ()
			WeaponInfoAmmoBarLeft:AnimateSequence( "ShowLeftEnergyMeter" )
		end
		
		WeaponInfoAmmoBarLeft:RegisterAnimationSequence( "HideLeftEnergyMeter", {
			{
				function ()
					return self.WeaponInfoAmmoBarLeft:SetAlpha( 1, 0 )
				end,
				function ()
					return self.WeaponInfoAmmoBarLeft:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.HideLeftEnergyMeter = function ()
			WeaponInfoAmmoBarLeft:AnimateSequence( "HideLeftEnergyMeter" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	TextStockAmmo:SubscribeToModel( DataSources.inGame.player.currentWeapon.stockAmmo:GetModel( f6_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.stockAmmo:GetValue( f6_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.stockAmmo:GetValue( f6_local1 ) <= 0 then
			ACTIONS.AnimateSequence( self, "NoStockAmmo" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "StockWarningGlow",
				sequenceName = "WarningOn",
				elementPath = "StockWarningGlow"
			} )
		end
		if DataSources.inGame.player.currentWeapon.stockAmmo:GetValue( f6_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.stockAmmo:GetValue( f6_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "HasStockAmmo" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "StockWarningGlow",
				sequenceName = "WarningOff",
				elementPath = "StockWarningGlow"
			} )
		end
	end )
	WeaponInfoAmmoBar:SetDataSource( DataSources.inGame.player.currentWeapon.clipAmmoRightTotal, f6_local1 )
	WeaponInfoAmmoBarLeft:SetDataSource( DataSources.inGame.player.currentWeapon.clipAmmoLeftTotal, f6_local1 )
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.isDualWielding:GetModel( f6_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f6_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f6_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ShowLeftClipAmmo" )
		end
		if DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f6_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f6_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideLeftClipAmmo" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.energyBullet:GetModel( f6_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.energyBullet:GetValue( f6_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.energyBullet:GetValue( f6_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ShowRightEnergyMeter" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "WeaponInfoAmmoBar",
				sequenceName = "EnergyOn",
				elementPath = "WeaponInfoAmmoBar"
			} )
		end
		if DataSources.inGame.player.currentWeapon.energyBullet:GetValue( f6_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.energyBullet:GetValue( f6_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideRightEnergyMeter" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "WeaponInfoAmmoBar",
				sequenceName = "EnergyOff",
				elementPath = "WeaponInfoAmmoBar"
			} )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.isEnergyDualWield:GetModel( f6_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.isEnergyDualWield:GetValue( f6_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isEnergyDualWield:GetValue( f6_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ShowLeftEnergyMeter" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "WeaponInfoAmmoBarLeft",
				sequenceName = "EnergyOn",
				elementPath = "WeaponInfoAmmoBarLeft"
			} )
		end
		if DataSources.inGame.player.currentWeapon.isEnergyDualWield:GetValue( f6_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isEnergyDualWield:GetValue( f6_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideLeftEnergyMeter" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "WeaponInfoAmmoBarLeft",
				sequenceName = "EnergyOff",
				elementPath = "WeaponInfoAmmoBarLeft"
			} )
		end
	end )
	PostLoadFunc( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "WeaponInfo", WeaponInfo )
LockTable( _M )
