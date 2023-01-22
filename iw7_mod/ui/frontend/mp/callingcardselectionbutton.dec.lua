local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	CallingCardUtils.SetupCallingCardSelectionButtonHandlers( f1_arg0, f1_arg1 )
	f1_arg0:addEventHandler( "button_over", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.challengeInfo
		local f2_local1 = f2_local0.isCompleted:GetValue( f1_arg1 )
		local f2_local2 = f2_local0.isSecretZombiesMerit:GetValue( f1_arg1 )
		if f2_local1 then
			ACTIONS.AnimateSequence( f1_arg0, "ButtonOver" )
		elseif not f2_local2 then
			ACTIONS.AnimateSequence( f1_arg0, "ButtonOverDisabled" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "ButtonOverDisabledCP" )
		end
	end )
	local f1_local0 = function ()
		local f3_local0 = f1_arg0:GetDataSource()
		f3_local0 = f3_local0.challengeInfo
		local f3_local1 = f3_local0.isCompleted:GetValue( f1_arg1 )
		local f3_local2 = f3_local0.isSecretZombiesMerit:GetValue( f1_arg1 )
		if not f3_local1 and not f3_local2 then
			ACTIONS.AnimateSequence( f1_arg0, "ButtonUpDisabled" )
		elseif f3_local1 then
			ACTIONS.AnimateSequence( f1_arg0, "ButtonUp" )
		elseif f3_local2 then
			ACTIONS.AnimateSequence( f1_arg0, "ButtonUpDisabledCP" )
		end
	end
	
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "challengeInfo.isCompleted", f1_local0 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "challengeInfo.isSecretZombiesMerit", f1_local0 )
end

function CallingCardSelectionButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 294 * _1080p, 0, 171 * _1080p )
	self.id = "CallingCardSelectionButton"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetBlurStrength( 1.5, 0 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local GradientBackgroundInGameOnly = nil
	
	GradientBackgroundInGameOnly = LUI.UIImage.new()
	GradientBackgroundInGameOnly.id = "GradientBackgroundInGameOnly"
	GradientBackgroundInGameOnly:SetRGBFromInt( 0, 0 )
	GradientBackgroundInGameOnly:SetAlpha( 0.5, 0 )
	GradientBackgroundInGameOnly:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 1, _1080p * -1 )
	self:addElement( GradientBackgroundInGameOnly )
	self.GradientBackgroundInGameOnly = GradientBackgroundInGameOnly
	
	local CallingCardTexture = nil
	
	CallingCardTexture = LUI.UIImage.new()
	CallingCardTexture.id = "CallingCardTexture"
	CallingCardTexture:SetAlpha( 0.3, 0 )
	CallingCardTexture:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 23, _1080p * 142 )
	CallingCardTexture:SubscribeToModelThroughElement( self, "texture", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.texture:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			CallingCardTexture:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( CallingCardTexture )
	self.CallingCardTexture = CallingCardTexture
	
	local LockedBackground = nil
	
	LockedBackground = LUI.UIImage.new()
	LockedBackground.id = "LockedBackground"
	LockedBackground:SetAlpha( 0, 0 )
	LockedBackground:setImage( RegisterMaterial( "widg_disabled" ), 0 )
	LockedBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 23, _1080p * -29 )
	self:addElement( LockedBackground )
	self.LockedBackground = LockedBackground
	
	local Darkening = nil
	
	Darkening = LUI.UIImage.new()
	Darkening.id = "Darkening"
	Darkening:SetRGBFromInt( 0, 0 )
	Darkening:SetAlpha( 0, 0 )
	Darkening:setImage( RegisterMaterial( "widg_disabled" ), 0 )
	Darkening:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 23, _1080p * -29 )
	self:addElement( Darkening )
	self.Darkening = Darkening
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f4_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -30 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local CaCButtonRectrictionOverlay = nil
	
	CaCButtonRectrictionOverlay = MenuBuilder.BuildRegisteredType( "CaCButtonRectrictionOverlay", {
		controllerIndex = f4_local1
	} )
	CaCButtonRectrictionOverlay.id = "CaCButtonRectrictionOverlay"
	CaCButtonRectrictionOverlay:SetAlpha( 0, 0 )
	CaCButtonRectrictionOverlay:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 12, _1080p * -18 )
	self:addElement( CaCButtonRectrictionOverlay )
	self.CaCButtonRectrictionOverlay = CaCButtonRectrictionOverlay
	
	local f4_local10 = nil
	if Engine.InFrontend() then
		f4_local10 = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
			controllerIndex = f4_local1
		} )
		f4_local10.id = "Background"
		f4_local10.DropShadow:SetAlpha( 0, 0 )
		f4_local10:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
		self:addElement( f4_local10 )
		self.Background = f4_local10
	end
	local BottomLine = nil
	
	BottomLine = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f4_local1
	} )
	BottomLine.id = "BottomLine"
	BottomLine:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -29, _1080p * -28 )
	self:addElement( BottomLine )
	self.BottomLine = BottomLine
	
	local TopLine = nil
	
	TopLine = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f4_local1
	} )
	TopLine.id = "TopLine"
	TopLine:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 23, _1080p * 25 )
	self:addElement( TopLine )
	self.TopLine = TopLine
	
	local TierLabel = nil
	
	TierLabel = LUI.UIText.new()
	TierLabel.id = "TierLabel"
	TierLabel:SetFontSize( 19 * _1080p )
	TierLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TierLabel:SetAlignment( LUI.Alignment.Right )
	TierLabel:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -142, _1080p * -5, _1080p * -23.75, _1080p * -4.75 )
	TierLabel:SubscribeToModelThroughElement( self, "challengeInfo.currentTierLabel", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.challengeInfo.currentTierLabel:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			TierLabel:setText( f6_local0, 0 )
		end
	end )
	self:addElement( TierLabel )
	self.TierLabel = TierLabel
	
	local ProgressBar = nil
	
	ProgressBar = MenuBuilder.BuildRegisteredType( "ChallengeInfoProgressBar", {
		controllerIndex = f4_local1
	} )
	ProgressBar.id = "ProgressBar"
	ProgressBar:SetAlpha( 0, 0 )
	ProgressBar:SetDataSourceThroughElement( self, "challengeInfo" )
	ProgressBar.black:SetAlpha( 0, 0 )
	ProgressBar:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 152, _1080p * -27.5, _1080p * -1 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local Name = nil
	
	Name = LUI.UIStyledText.new()
	Name.id = "Name"
	Name:SetFontSize( 19 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Name:SetAlignment( LUI.Alignment.Left )
	Name:SetStartupDelay( 2000 )
	Name:SetLineHoldTime( 500 )
	Name:SetAnimMoveTime( 1000 )
	Name:SetEndDelay( 1000 )
	Name:SetCrossfadeTime( 500 )
	Name:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Name:SetMaxVisibleLines( 1 )
	Name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 286, _1080p * 2.5, _1080p * 21.5 )
	Name:SubscribeToModelThroughElement( self, "challengeInfo.name", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.challengeInfo.name:GetValue( f4_local1 )
		if f7_local0 ~= nil then
			Name:setText( LocalizeString( f7_local0 ), 0 )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f4_local1
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
		controllerIndex = f4_local1
	} )
	NewIcon.id = "NewIcon"
	NewIcon:SetAlpha( 0, 0 )
	NewIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 115, _1080p * 179, _1080p * 53.5, _1080p * 117.5 )
	self:addElement( NewIcon )
	self.NewIcon = NewIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CallingCardTexture:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.CallingCardTexture:SetAlpha( 1, 100 )
				end
			}
		} )
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
		Name:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			CallingCardTexture:AnimateSequence( "ButtonOver" )
			LockedBackground:AnimateSequence( "ButtonOver" )
			Darkening:AnimateSequence( "ButtonOver" )
			CaCButtonRectrictionOverlay:AnimateSequence( "ButtonOver" )
			Name:AnimateSequence( "ButtonOver" )
		end
		
		CallingCardTexture:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.CallingCardTexture:SetAlpha( 0.7, 0 )
				end
			}
		} )
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
		Name:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			CallingCardTexture:AnimateSequence( "ButtonUp" )
			LockedBackground:AnimateSequence( "ButtonUp" )
			Darkening:AnimateSequence( "ButtonUp" )
			CaCButtonRectrictionOverlay:AnimateSequence( "ButtonUp" )
			Name:AnimateSequence( "ButtonUp" )
		end
		
		CallingCardTexture:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.CallingCardTexture:SetAlpha( 0.7, 0 )
				end
			}
		} )
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
		Name:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			CallingCardTexture:AnimateSequence( "ButtonUpDisabled" )
			LockedBackground:AnimateSequence( "ButtonUpDisabled" )
			Darkening:AnimateSequence( "ButtonUpDisabled" )
			CaCButtonRectrictionOverlay:AnimateSequence( "ButtonUpDisabled" )
			Name:AnimateSequence( "ButtonUpDisabled" )
		end
		
		CallingCardTexture:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.CallingCardTexture:SetAlpha( 1, 0 )
				end
			}
		} )
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
		Name:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			CallingCardTexture:AnimateSequence( "ButtonOverDisabled" )
			LockedBackground:AnimateSequence( "ButtonOverDisabled" )
			Darkening:AnimateSequence( "ButtonOverDisabled" )
			CaCButtonRectrictionOverlay:AnimateSequence( "ButtonOverDisabled" )
			Name:AnimateSequence( "ButtonOverDisabled" )
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
			},
			{
				function ()
					return self.LockedBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 23, _1080p * -29, 0 )
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
			CallingCardTexture:AnimateSequence( "Locked" )
			LockedBackground:AnimateSequence( "Locked" )
			Darkening:AnimateSequence( "Locked" )
		end
		
		CallingCardTexture:RegisterAnimationSequence( "ButtonOverDisabledCP", {
			{
				function ()
					return self.CallingCardTexture:SetAlpha( 0, 0 )
				end
			}
		} )
		LockedBackground:RegisterAnimationSequence( "ButtonOverDisabledCP", {
			{
				function ()
					return self.LockedBackground:SetAlpha( 0.8, 0 )
				end
			}
		} )
		Darkening:RegisterAnimationSequence( "ButtonOverDisabledCP", {
			{
				function ()
					return self.Darkening:SetAlpha( 0.4, 0 )
				end
			}
		} )
		CaCButtonRectrictionOverlay:RegisterAnimationSequence( "ButtonOverDisabledCP", {
			{
				function ()
					return self.CaCButtonRectrictionOverlay:SetAlpha( 1, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonOverDisabledCP", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisabledCP = function ()
			CallingCardTexture:AnimateSequence( "ButtonOverDisabledCP" )
			LockedBackground:AnimateSequence( "ButtonOverDisabledCP" )
			Darkening:AnimateSequence( "ButtonOverDisabledCP" )
			CaCButtonRectrictionOverlay:AnimateSequence( "ButtonOverDisabledCP" )
			Name:AnimateSequence( "ButtonOverDisabledCP" )
		end
		
		CallingCardTexture:RegisterAnimationSequence( "ButtonUpDisabledCP", {
			{
				function ()
					return self.CallingCardTexture:SetAlpha( 0, 0 )
				end
			}
		} )
		LockedBackground:RegisterAnimationSequence( "ButtonUpDisabledCP", {
			{
				function ()
					return self.LockedBackground:SetAlpha( 0.8, 0 )
				end
			}
		} )
		Darkening:RegisterAnimationSequence( "ButtonUpDisabledCP", {
			{
				function ()
					return self.Darkening:SetAlpha( 0.4, 0 )
				end
			}
		} )
		CaCButtonRectrictionOverlay:RegisterAnimationSequence( "ButtonUpDisabledCP", {
			{
				function ()
					return self.CaCButtonRectrictionOverlay:SetAlpha( 1, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonUpDisabledCP", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUpDisabledCP = function ()
			CallingCardTexture:AnimateSequence( "ButtonUpDisabledCP" )
			LockedBackground:AnimateSequence( "ButtonUpDisabledCP" )
			Darkening:AnimateSequence( "ButtonUpDisabledCP" )
			CaCButtonRectrictionOverlay:AnimateSequence( "ButtonUpDisabledCP" )
			Name:AnimateSequence( "ButtonUpDisabledCP" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ProgressBar:SetDataSourceThroughElement( self, "challengeInfo" )
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "CallingCardSelectionButton", CallingCardSelectionButton )
LockTable( _M )
