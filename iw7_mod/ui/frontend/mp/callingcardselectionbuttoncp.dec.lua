local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	CallingCardUtils.SetupCallingCardSelectionButtonHandlers( f1_arg0, f1_arg1 )
end

function CallingCardSelectionButtonCP( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 294 * _1080p, 0, 171 * _1080p )
	self.id = "CallingCardSelectionButtonCP"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetBlurStrength( 1.5, 0 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local GradientBackgroundInGameOnlyCopy0 = nil
	
	GradientBackgroundInGameOnlyCopy0 = LUI.UIImage.new()
	GradientBackgroundInGameOnlyCopy0.id = "GradientBackgroundInGameOnlyCopy0"
	GradientBackgroundInGameOnlyCopy0:SetRGBFromInt( 0, 0 )
	GradientBackgroundInGameOnlyCopy0:SetAlpha( 0.75, 0 )
	GradientBackgroundInGameOnlyCopy0:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 1, _1080p * -1 )
	self:addElement( GradientBackgroundInGameOnlyCopy0 )
	self.GradientBackgroundInGameOnlyCopy0 = GradientBackgroundInGameOnlyCopy0
	
	local GradientBackgroundInGameOnly = nil
	
	GradientBackgroundInGameOnly = LUI.UIImage.new()
	GradientBackgroundInGameOnly.id = "GradientBackgroundInGameOnly"
	GradientBackgroundInGameOnly:SetRGBFromInt( 0, 0 )
	GradientBackgroundInGameOnly:SetAlpha( 0.5, 0 )
	GradientBackgroundInGameOnly:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1, _1080p * -1, _1080p * 23, _1080p * 142 )
	self:addElement( GradientBackgroundInGameOnly )
	self.GradientBackgroundInGameOnly = GradientBackgroundInGameOnly
	
	local CallingCardTexture = nil
	
	CallingCardTexture = LUI.UIImage.new()
	CallingCardTexture.id = "CallingCardTexture"
	CallingCardTexture:SetAlpha( 0.3, 0 )
	CallingCardTexture:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1, _1080p * -1, _1080p * 23, _1080p * 142 )
	CallingCardTexture:SubscribeToModelThroughElement( self, "texture", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.texture:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			CallingCardTexture:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( CallingCardTexture )
	self.CallingCardTexture = CallingCardTexture
	
	local LockedBackground = nil
	
	LockedBackground = LUI.UIImage.new()
	LockedBackground.id = "LockedBackground"
	LockedBackground:SetAlpha( 0, 0 )
	LockedBackground:setImage( RegisterMaterial( "widg_disabled" ), 0 )
	LockedBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 23, _1080p * -29 )
	self:addElement( LockedBackground )
	self.LockedBackground = LockedBackground
	
	local Darkening = nil
	
	Darkening = LUI.UIImage.new()
	Darkening.id = "Darkening"
	Darkening:SetRGBFromInt( 0, 0 )
	Darkening:SetAlpha( 0, 0 )
	Darkening:setImage( RegisterMaterial( "widg_disabled" ), 0 )
	Darkening:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 23, _1080p * -29 )
	self:addElement( Darkening )
	self.Darkening = Darkening
	
	local CaCButtonRectrictionOverlay = nil
	
	CaCButtonRectrictionOverlay = MenuBuilder.BuildRegisteredType( "CaCButtonRectrictionOverlay", {
		controllerIndex = f2_local1
	} )
	CaCButtonRectrictionOverlay.id = "CaCButtonRectrictionOverlay"
	CaCButtonRectrictionOverlay:SetAlpha( 0.01, 0 )
	CaCButtonRectrictionOverlay:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 11, _1080p * -19 )
	self:addElement( CaCButtonRectrictionOverlay )
	self.CaCButtonRectrictionOverlay = CaCButtonRectrictionOverlay
	
	local TierLabel = nil
	
	TierLabel = LUI.UIText.new()
	TierLabel.id = "TierLabel"
	TierLabel:SetFontSize( 19 * _1080p )
	TierLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TierLabel:SetAlignment( LUI.Alignment.Right )
	TierLabel:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -142, _1080p * -5, _1080p * -23.75, _1080p * -4.75 )
	TierLabel:SubscribeToModelThroughElement( self, "challengeInfo.currentTierLabel", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.challengeInfo.currentTierLabel:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			TierLabel:setText( f4_local0, 0 )
		end
	end )
	self:addElement( TierLabel )
	self.TierLabel = TierLabel
	
	local ProgressBar = nil
	
	ProgressBar = MenuBuilder.BuildRegisteredType( "ChallengeInfoProgressBar", {
		controllerIndex = f2_local1
	} )
	ProgressBar.id = "ProgressBar"
	ProgressBar:SetAlpha( 0, 0 )
	ProgressBar:SetDataSourceThroughElement( self, "challengeInfo" )
	ProgressBar.black:SetAlpha( 0, 0 )
	ProgressBar:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 10, _1080p * 162, _1080p * -28.5, _1080p * -2 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local BorderSelectedCP = nil
	
	BorderSelectedCP = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	BorderSelectedCP.id = "BorderSelectedCP"
	BorderSelectedCP:SetAlpha( 0.2, 0 )
	self:addElement( BorderSelectedCP )
	self.BorderSelectedCP = BorderSelectedCP
	
	local NameCP = nil
	
	NameCP = LUI.UIStyledText.new()
	NameCP.id = "NameCP"
	NameCP:SetFontSize( 19 * _1080p )
	NameCP:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	NameCP:SetAlignment( LUI.Alignment.Center )
	NameCP:SetStartupDelay( 2000 )
	NameCP:SetLineHoldTime( 500 )
	NameCP:SetAnimMoveTime( 1000 )
	NameCP:SetEndDelay( 1000 )
	NameCP:SetCrossfadeTime( 500 )
	NameCP:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	NameCP:SetMaxVisibleLines( 1 )
	NameCP:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 2.5, _1080p * 21.5 )
	NameCP:SubscribeToModelThroughElement( self, "challengeInfo.name", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.challengeInfo.name:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			NameCP:setText( ToUpperCase( LocalizeString( f5_local0 ) ), 0 )
		end
	end )
	self:addElement( NameCP )
	self.NameCP = NameCP
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f2_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon:SetAlpha( 0, 0 )
	QualityIcon:SetScale( -0.5, 0 )
	QualityIcon.IconShadow:SetAlpha( 0.2, 0 )
	QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 69, _1080p * 86, _1080p * 150 )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	local NewIcon = nil
	
	NewIcon = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
		controllerIndex = f2_local1
	} )
	NewIcon.id = "NewIcon"
	NewIcon:SetAlpha( 0, 0 )
	NewIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 115, _1080p * 179, _1080p * 53.5, _1080p * 117.5 )
	self:addElement( NewIcon )
	self.NewIcon = NewIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		LockedBackground:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LockedBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			LockedBackground:AnimateSequence( "DefaultSequence" )
		end
		
		LockedBackground:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.LockedBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		Darkening:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Darkening:SetAlpha( 0, 0 )
				end
			}
		} )
		CaCButtonRectrictionOverlay:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.CaCButtonRectrictionOverlay:SetAlpha( 0, 0 )
				end
			}
		} )
		BorderSelectedCP:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.BorderSelectedCP:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetBorderThicknessLeft( _1080p * 3, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetBorderThicknessRight( _1080p * 3, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetBorderThicknessTop( _1080p * 23, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetBorderThicknessBottom( _1080p * 3, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			LockedBackground:AnimateSequence( "ButtonOver" )
			Darkening:AnimateSequence( "ButtonOver" )
			CaCButtonRectrictionOverlay:AnimateSequence( "ButtonOver" )
			BorderSelectedCP:AnimateSequence( "ButtonOver" )
		end
		
		LockedBackground:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.LockedBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		Darkening:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Darkening:SetAlpha( 0, 0 )
				end
			}
		} )
		CaCButtonRectrictionOverlay:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.CaCButtonRectrictionOverlay:SetAlpha( 0, 0 )
				end
			}
		} )
		BorderSelectedCP:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.BorderSelectedCP:SetAlpha( 0.2, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetBorderThicknessLeft( _1080p * 1, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetBorderThicknessRight( _1080p * 1, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetBorderThicknessTop( _1080p * 1, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetBorderThicknessBottom( _1080p * 1, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			LockedBackground:AnimateSequence( "ButtonUp" )
			Darkening:AnimateSequence( "ButtonUp" )
			CaCButtonRectrictionOverlay:AnimateSequence( "ButtonUp" )
			BorderSelectedCP:AnimateSequence( "ButtonUp" )
		end
		
		LockedBackground:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.LockedBackground:SetAlpha( 0.8, 0 )
				end
			}
		} )
		Darkening:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Darkening:SetAlpha( 0.4, 0 )
				end
			}
		} )
		CaCButtonRectrictionOverlay:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.CaCButtonRectrictionOverlay:SetAlpha( 1, 0 )
				end
			}
		} )
		BorderSelectedCP:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.BorderSelectedCP:SetAlpha( 0.2, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetBorderThicknessLeft( _1080p * 1, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetBorderThicknessRight( _1080p * 1, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetBorderThicknessTop( _1080p * 1, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetBorderThicknessBottom( _1080p * 1, 0 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			LockedBackground:AnimateSequence( "ButtonUpDisabled" )
			Darkening:AnimateSequence( "ButtonUpDisabled" )
			CaCButtonRectrictionOverlay:AnimateSequence( "ButtonUpDisabled" )
			BorderSelectedCP:AnimateSequence( "ButtonUpDisabled" )
		end
		
		LockedBackground:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.LockedBackground:SetAlpha( 0.8, 0 )
				end
			}
		} )
		Darkening:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Darkening:SetAlpha( 0.4, 0 )
				end
			}
		} )
		CaCButtonRectrictionOverlay:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.CaCButtonRectrictionOverlay:SetAlpha( 1, 0 )
				end
			}
		} )
		BorderSelectedCP:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.BorderSelectedCP:SetBorderThicknessLeft( _1080p * 3, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetBorderThicknessRight( _1080p * 3, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetBorderThicknessTop( _1080p * 23, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetBorderThicknessBottom( _1080p * 3, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BorderSelectedCP:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			LockedBackground:AnimateSequence( "ButtonOverDisabled" )
			Darkening:AnimateSequence( "ButtonOverDisabled" )
			CaCButtonRectrictionOverlay:AnimateSequence( "ButtonOverDisabled" )
			BorderSelectedCP:AnimateSequence( "ButtonOverDisabled" )
		end
		
		CallingCardTexture:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.CallingCardTexture:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.CallingCardTexture:SetGlitchBlockWidth( 25, 0 )
				end,
				function ()
					return self.CallingCardTexture:SetGlitchBlockWidth( 60, 290 )
				end,
				function ()
					return self.CallingCardTexture:SetGlitchBlockWidth( 25, 210 )
				end
			},
			{
				function ()
					return self.CallingCardTexture:SetGlitchBlockHeight( 45, 0 )
				end,
				function ()
					return self.CallingCardTexture:SetGlitchBlockHeight( 15, 290 )
				end,
				function ()
					return self.CallingCardTexture:SetGlitchBlockHeight( 45, 210 )
				end
			},
			{
				function ()
					return self.CallingCardTexture:SetGlitchDistortionRange( 80, 0 )
				end,
				function ()
					return self.CallingCardTexture:SetGlitchDistortionRange( 34, 290 )
				end,
				function ()
					return self.CallingCardTexture:SetGlitchDistortionRange( 80, 210 )
				end
			},
			{
				function ()
					return self.CallingCardTexture:SetGlitchAmount( 0.6, 0 )
				end,
				function ()
					return self.CallingCardTexture:SetGlitchAmount( 1, 290 )
				end,
				function ()
					return self.CallingCardTexture:SetGlitchAmount( 0.6, 210 )
				end
			},
			{
				function ()
					return self.CallingCardTexture:SetGlitchMaskPitch( 1, 0 )
				end
			},
			{
				function ()
					return self.CallingCardTexture:SetGlitchScanlinePitch( 1, 0 )
				end
			}
		} )
		LockedBackground:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.LockedBackground:SetAlpha( 0.8, 0 )
				end
			}
		} )
		Darkening:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Darkening:SetAlpha( 0.4, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			CallingCardTexture:AnimateLoop( "Locked" )
			LockedBackground:AnimateLoop( "Locked" )
			Darkening:AnimateLoop( "Locked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ProgressBar:SetDataSourceThroughElement( self, "challengeInfo" )
	self:addEventHandler( "button_over", function ( f67_arg0, f67_arg1 )
		local f67_local0 = f67_arg1.controller or f2_local1
		local f67_local1 = self:GetDataSource()
		if f67_local1.challengeInfo.isCompleted:GetValue( f67_local0 ) ~= nil then
			f67_local1 = self:GetDataSource()
			if f67_local1.challengeInfo.isCompleted:GetValue( f67_local0 ) == true then
				ACTIONS.AnimateSequence( self, "ButtonOver" )
			end
		end
		f67_local1 = self:GetDataSource()
		if f67_local1.challengeInfo.isCompleted:GetValue( f67_local0 ) ~= nil then
			f67_local1 = self:GetDataSource()
			if f67_local1.challengeInfo.isCompleted:GetValue( f67_local0 ) == false then
				ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "challengeInfo.isCompleted", function ()
		local f68_local0 = self:GetDataSource()
		if f68_local0.challengeInfo.isCompleted:GetValue( f2_local1 ) ~= nil then
			f68_local0 = self:GetDataSource()
			if f68_local0.challengeInfo.isCompleted:GetValue( f2_local1 ) == false then
				ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
			end
		end
		f68_local0 = self:GetDataSource()
		if f68_local0.challengeInfo.isCompleted:GetValue( f2_local1 ) ~= nil then
			f68_local0 = self:GetDataSource()
			if f68_local0.challengeInfo.isCompleted:GetValue( f2_local1 ) == true then
				ACTIONS.AnimateSequence( self, "ButtonUp" )
			end
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "CallingCardSelectionButtonCP", CallingCardSelectionButtonCP )
LockTable( _M )
