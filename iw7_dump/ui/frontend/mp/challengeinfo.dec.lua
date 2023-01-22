local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addEventHandler( "button_over", function ( f2_arg0, f2_arg1 )
		f2_arg0:dispatchEventToCurrentMenu( {
			name = "selection_changed",
			newSelection = f2_arg0
		} )
	end )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "isCompleted", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		if f3_local0.isCompleted:GetValue( f1_arg1 ) then
			ACTIONS.AnimateSequence( f1_arg0, "Unlocked" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "Locked" )
		end
		local f3_local1 = f1_arg0:GetDataSource()
		if f3_local1.isHiddenChallenge:GetValue( f1_arg1 ) then
			ACTIONS.AnimateSequence( f1_arg0, "Hidden" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "NotHidden" )
		end
	end )
end

function ChallengeInfo( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 294 * _1080p, 0, 171 * _1080p )
	self.id = "ChallengeInfo"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	self:SubscribeToModelThroughElement( self, "desc", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.desc:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			self.buttonDescription = f5_local0
		end
	end )
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
	GradientBackgroundInGameOnlyCopy0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -147, _1080p * 147, _1080p * -85.5, _1080p * 85.5 )
	self:addElement( GradientBackgroundInGameOnlyCopy0 )
	self.GradientBackgroundInGameOnlyCopy0 = GradientBackgroundInGameOnlyCopy0
	
	local GradientBackgroundInGameOnly = nil
	
	GradientBackgroundInGameOnly = LUI.UIImage.new()
	GradientBackgroundInGameOnly.id = "GradientBackgroundInGameOnly"
	GradientBackgroundInGameOnly:SetRGBFromInt( 0, 0 )
	GradientBackgroundInGameOnly:SetAlpha( 0.5, 0 )
	GradientBackgroundInGameOnly:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -147, _1080p * 147, _1080p * -60, _1080p * 57 )
	self:addElement( GradientBackgroundInGameOnly )
	self.GradientBackgroundInGameOnly = GradientBackgroundInGameOnly
	
	local TierLabel = nil
	
	TierLabel = LUI.UIText.new()
	TierLabel.id = "TierLabel"
	TierLabel:SetFontSize( 19 * _1080p )
	TierLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TierLabel:SetAlignment( LUI.Alignment.Right )
	TierLabel:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -142, _1080p * -7.98, _1080p * -23.75, _1080p * -4.75 )
	TierLabel:SubscribeToModelThroughElement( self, "currentTierLabel", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.currentTierLabel:GetValue( f4_local1 )
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
	ProgressBar:SetDataSourceThroughElement( self, nil )
	ProgressBar.black:SetAlpha( 0, 0 )
	ProgressBar:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 152, _1080p * -27.5, _1080p * -1 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 294, _1080p * 26, _1080p * 142 )
	Image:SubscribeToModelThroughElement( self, "image", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.image:GetValue( f4_local1 )
		if f7_local0 ~= nil then
			Image:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local LockedBackground = nil
	
	LockedBackground = LUI.UIImage.new()
	LockedBackground.id = "LockedBackground"
	LockedBackground:SetAlpha( 0, 0 )
	LockedBackground:setImage( RegisterMaterial( "widg_disabled" ), 0 )
	LockedBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 23, _1080p * -29 )
	self:addElement( LockedBackground )
	self.LockedBackground = LockedBackground
	
	local Darken = nil
	
	Darken = LUI.UIImage.new()
	Darken.id = "Darken"
	Darken:SetRGBFromInt( 0, 0 )
	Darken:SetAlpha( 0, 0 )
	Darken:setImage( RegisterMaterial( "widg_disabled" ), 0 )
	Darken:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 1, _1080p * -1 )
	self:addElement( Darken )
	self.Darken = Darken
	
	local f4_local11 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local11 = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
			controllerIndex = f4_local1
		} )
		f4_local11.id = "GenericButtonSelection"
		f4_local11:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 26, _1080p * -29 )
		self:addElement( f4_local11 )
		self.GenericButtonSelection = f4_local11
	end
	local f4_local12 = nil
	if not Engine.InFrontend() then
		f4_local12 = LUI.UIImage.new()
		f4_local12.id = "InGameBackground"
		f4_local12:SetRGBFromInt( 0, 0 )
		f4_local12:SetAlpha( 0.8, 0 )
		f4_local12:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
		self:addElement( f4_local12 )
		self.InGameBackground = f4_local12
	end
	local f4_local13 = nil
	if Engine.InFrontend() and not CONDITIONS.IsThirdGameMode( self ) then
		f4_local13 = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
			controllerIndex = f4_local1
		} )
		f4_local13.id = "Background"
		f4_local13.DropShadow:SetAlpha( 0, 0 )
		f4_local13:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
		self:addElement( f4_local13 )
		self.Background = f4_local13
	end
	local f4_local14 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local14 = LUI.UIBorder.new( {
			borderThicknessLeft = _1080p * 1,
			borderThicknessRight = _1080p * 1,
			borderThicknessTop = _1080p * 1,
			borderThicknessBottom = _1080p * 1
		} )
		f4_local14.id = "BorderSelectedCP"
		f4_local14:SetAlpha( 0.2, 0 )
		self:addElement( f4_local14 )
		self.BorderSelectedCP = f4_local14
	end
	local f4_local15 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local15 = LUI.UIStyledText.new()
		f4_local15.id = "Name"
		f4_local15:SetFontSize( 19 * _1080p )
		f4_local15:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f4_local15:SetAlignment( LUI.Alignment.Left )
		f4_local15:SetStartupDelay( 2000 )
		f4_local15:SetLineHoldTime( 500 )
		f4_local15:SetAnimMoveTime( 1000 )
		f4_local15:SetEndDelay( 1000 )
		f4_local15:SetCrossfadeTime( 500 )
		f4_local15:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
		f4_local15:SetMaxVisibleLines( 1 )
		f4_local15:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 286, _1080p * 2.5, _1080p * 21.5 )
		f4_local15:SubscribeToModelThroughElement( self, "name", function ()
			local f8_local0 = self:GetDataSource()
			f8_local0 = f8_local0.name:GetValue( f4_local1 )
			if f8_local0 ~= nil then
				f4_local15:setText( LocalizeString( f8_local0 ), 0 )
			end
		end )
		self:addElement( f4_local15 )
		self.Name = f4_local15
	end
	local f4_local16 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f4_local16 = LUI.UIStyledText.new()
		f4_local16.id = "NameCP"
		f4_local16:SetFontSize( 19 * _1080p )
		f4_local16:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f4_local16:SetAlignment( LUI.Alignment.Center )
		f4_local16:SetStartupDelay( 2000 )
		f4_local16:SetLineHoldTime( 500 )
		f4_local16:SetAnimMoveTime( 1000 )
		f4_local16:SetEndDelay( 1000 )
		f4_local16:SetCrossfadeTime( 500 )
		f4_local16:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
		f4_local16:SetMaxVisibleLines( 1 )
		f4_local16:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 2.5, _1080p * 21.5 )
		f4_local16:SubscribeToModelThroughElement( self, "name", function ()
			local f9_local0 = self:GetDataSource()
			f9_local0 = f9_local0.name:GetValue( f4_local1 )
			if f9_local0 ~= nil then
				f4_local16:setText( ToUpperCase( LocalizeString( f9_local0 ) ), 0 )
			end
		end )
		self:addElement( f4_local16 )
		self.NameCP = f4_local16
	end
	local RectrictionOverlay = nil
	
	RectrictionOverlay = MenuBuilder.BuildRegisteredType( "CaCButtonRectrictionOverlay", {
		controllerIndex = f4_local1
	} )
	RectrictionOverlay.id = "RectrictionOverlay"
	RectrictionOverlay:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 25.5, _1080p * -28.5 )
	self:addElement( RectrictionOverlay )
	self.RectrictionOverlay = RectrictionOverlay
	
	local f4_local18 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local18 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
			controllerIndex = f4_local1
		} )
		f4_local18.id = "Line"
		f4_local18:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 24.5, _1080p * 25.5 )
		self:addElement( f4_local18 )
		self.Line = f4_local18
	end
	local f4_local19 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f4_local19 = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
			controllerIndex = f4_local1
		} )
		f4_local19.id = "LineCopy1"
		f4_local19:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -28.5, _1080p * -27.5 )
		self:addElement( f4_local19 )
		self.LineCopy1 = f4_local19
	end
	self._animationSets.DefaultAnimationSet = function ()
		if not CONDITIONS.IsThirdGameMode( self ) then
			f4_local15:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.Name:SetRGBFromInt( 16777215, 0 )
					end
				}
			} )
		end
		RectrictionOverlay:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.RectrictionOverlay:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			if not CONDITIONS.IsThirdGameMode( self ) then
				f4_local15:AnimateSequence( "DefaultSequence" )
			end
			RectrictionOverlay:AnimateSequence( "DefaultSequence" )
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f4_local14:RegisterAnimationSequence( "Selected", {
				{
					function ()
						return self.BorderSelectedCP:SetAlpha( 1, 0 )
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
				},
				{
					function ()
						return self.BorderSelectedCP:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
					end
				}
			} )
		end
		if not CONDITIONS.IsThirdGameMode( self ) then
			f4_local15:RegisterAnimationSequence( "Selected", {
				{
					function ()
						return self.Name:SetRGBFromInt( 0, 0 )
					end
				}
			} )
		end
		self._sequences.Selected = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f4_local14:AnimateSequence( "Selected" )
			end
			if not CONDITIONS.IsThirdGameMode( self ) then
				f4_local15:AnimateSequence( "Selected" )
			end
		end
		
		if CONDITIONS.IsThirdGameMode( self ) then
			f4_local14:RegisterAnimationSequence( "Deselect", {
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
		end
		if not CONDITIONS.IsThirdGameMode( self ) then
			f4_local15:RegisterAnimationSequence( "Deselect", {
				{
					function ()
						return self.Name:SetRGBFromInt( 16777215, 0 )
					end
				}
			} )
		end
		self._sequences.Deselect = function ()
			if CONDITIONS.IsThirdGameMode( self ) then
				f4_local14:AnimateSequence( "Deselect" )
			end
			if not CONDITIONS.IsThirdGameMode( self ) then
				f4_local15:AnimateSequence( "Deselect" )
			end
		end
		
		Image:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Image:SetAlpha( 1, 0 )
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
		Darken:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Darken:SetAlpha( 0.4, 0 )
				end
			}
		} )
		RectrictionOverlay:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.RectrictionOverlay:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Image:AnimateSequence( "Locked" )
			LockedBackground:AnimateSequence( "Locked" )
			Darken:AnimateSequence( "Locked" )
			RectrictionOverlay:AnimateSequence( "Locked" )
		end
		
		Image:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Image:SetAlpha( 1, 0 )
				end
			}
		} )
		LockedBackground:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.LockedBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		Darken:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Darken:SetAlpha( 0, 0 )
				end
			}
		} )
		RectrictionOverlay:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.RectrictionOverlay:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			Image:AnimateSequence( "Unlocked" )
			LockedBackground:AnimateSequence( "Unlocked" )
			Darken:AnimateSequence( "Unlocked" )
			RectrictionOverlay:AnimateSequence( "Unlocked" )
		end
		
		TierLabel:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.TierLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		ProgressBar:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.ProgressBar:SetAlpha( 0, 0 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.Image:SetAlpha( 1, 0 )
				end
			}
		} )
		LockedBackground:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.LockedBackground:SetAlpha( 0.8, 0 )
				end
			}
		} )
		Darken:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.Darken:SetAlpha( 0.4, 0 )
				end
			}
		} )
		RectrictionOverlay:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.RectrictionOverlay:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Hidden = function ()
			TierLabel:AnimateSequence( "Hidden" )
			ProgressBar:AnimateSequence( "Hidden" )
			Image:AnimateSequence( "Hidden" )
			LockedBackground:AnimateSequence( "Hidden" )
			Darken:AnimateSequence( "Hidden" )
			RectrictionOverlay:AnimateSequence( "Hidden" )
		end
		
		ProgressBar:RegisterAnimationSequence( "DefaultCP", {
			{
				function ()
					return self.ProgressBar:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 10, _1080p * 162, _1080p * -28.5, _1080p * -2, 0 )
				end
			}
		} )
		if not CONDITIONS.IsThirdGameMode( self ) then
			f4_local11:RegisterAnimationSequence( "DefaultCP", {
				{
					function ()
						return self.GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
					end
				}
			} )
		end
		self._sequences.DefaultCP = function ()
			ProgressBar:AnimateSequence( "DefaultCP" )
			if not CONDITIONS.IsThirdGameMode( self ) then
				f4_local11:AnimateSequence( "DefaultCP" )
			end
		end
		
		TierLabel:RegisterAnimationSequence( "NotHidden", {
			{
				function ()
					return self.TierLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		ProgressBar:RegisterAnimationSequence( "NotHidden", {
			{
				function ()
					return self.ProgressBar:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.NotHidden = function ()
			TierLabel:AnimateSequence( "NotHidden" )
			ProgressBar:AnimateSequence( "NotHidden" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ProgressBar:SetDataSourceThroughElement( self, nil )
	self:addEventHandler( "button_over", function ( f53_arg0, f53_arg1 )
		local f53_local0 = f53_arg1.controller or f4_local1
		ACTIONS.AnimateSequence( self, "Selected" )
	end )
	self:addEventHandler( "button_up", function ( f54_arg0, f54_arg1 )
		local f54_local0 = f54_arg1.controller or f4_local1
		ACTIONS.AnimateSequence( self, "Deselect" )
	end )
	PostLoadFunc( self, f4_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "DefaultCP" )
	end
	return self
end

MenuBuilder.registerType( "ChallengeInfo", ChallengeInfo )
LockTable( _M )
