local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	assert( f1_arg0.QualityIcon )
	f1_arg0.SetData = function ( f2_arg0, f2_arg1 )
		assert( f2_arg1.writeTo )
		assert( f2_arg1.tauntData )
		assert( f2_arg1.tauntData.ref )
		assert( f2_arg1.tauntData.name )
		assert( f2_arg1.tauntData.isLocked ~= nil )
		assert( f2_arg1.tauntData.isSelected ~= nil )
		assert( f2_arg1.rigRef )
		f2_arg0._data = f2_arg1
		assert( f2_arg0.Text )
		f2_arg0.Text:setText( Engine.Localize( f2_arg1.tauntData.name ) )
		f2_arg0:SetButtonDisabled( f2_arg1.tauntData.isLocked )
		if f2_arg1.tauntData.isSelected then
			ACTIONS.AnimateSequence( f2_arg0, "SelectedOn" )
		else
			ACTIONS.AnimateSequence( f2_arg0, "SelectedOff" )
		end
		local f2_local0 = f2_arg1.tauntData.quality
		f2_arg0.QualityIcon:SetDisplayQuality( f2_local0 )
		if f2_local0 > Cac.LowestQuality then
			ACTIONS.AnimateSequence( f2_arg0, "ShowQuality" )
		else
			ACTIONS.AnimateSequence( f2_arg0, "HideQuality" )
		end
	end
	
	local f1_local0 = function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg0:GetCurrentMenu()
		f3_local0:processEvent( {
			name = "highlight_taunt",
			tauntData = f3_arg0._data.tauntData
		} )
	end
	
	f1_arg0:addEventHandler( "button_over", f1_local0 )
	f1_arg0:addEventHandler( "button_over_disable", f1_local0 )
	f1_arg0:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		assert( f1_arg0._data )
		for f4_local3, f4_local4 in ipairs( f1_arg0._data.writeTo ) do
			f4_local4:SetValue( f1_arg1, f1_arg0._data.tauntData.ref )
		end
		f4_local0, f4_local1 = Cac.GetRigFrontEndTauntTransitionAnims( f1_arg0._data.rigRef )
		f4_local2 = Cac.GetRigFrontEndCustomizationIdleAnim( f1_arg0._data.rigRef )
		ClientCharacter.PlayCharacterAnim( FrontEndScene.ClientCharacters.Customization, f4_local1, 0.1 )
		f4_local3 = Cac.GetRigFrontEndCustomizationIdleAnim( f1_arg0._data.rigRef )
		ClientCharacter.QueueCharacterAnim( FrontEndScene.ClientCharacters.Customization, f4_local2, nil, 0.1 )
		LUI.FlowManager.RequestLeaveMenu( f1_arg0, true, true )
	end )
	if IsLanguageArabic() then
		f1_arg0.Lock:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 20, _1080p * 46, _1080p * -13, _1080p * 13 )
		f1_arg0.Selected:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 26, _1080p * 38, _1080p * -6, _1080p * 6 )
		f1_arg0.QualityIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 51.5, _1080p * 75, _1080p * -11.75, _1080p * 11.75 )
	end
end

function RigEditActionButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "RigEditActionButton"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local GenericListButtonBackground = nil
	
	GenericListButtonBackground = MenuBuilder.BuildRegisteredType( "GenericListArrowButtonBackground", {
		controllerIndex = f5_local1
	} )
	GenericListButtonBackground.id = "GenericListButtonBackground"
	GenericListButtonBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -50, 0, 0 )
	self:addElement( GenericListButtonBackground )
	self.GenericListButtonBackground = GenericListButtonBackground
	
	local Text = nil
	
	Text = LUI.UIStyledText.new()
	Text.id = "Text"
	Text:setText( ToUpperCase( "" ), 0 )
	Text:SetFontSize( 22 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetStartupDelay( 2000 )
	Text:SetLineHoldTime( 400 )
	Text:SetAnimMoveTime( 300 )
	Text:SetEndDelay( 1500 )
	Text:SetCrossfadeTime( 750 )
	Text:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Text:SetMaxVisibleLines( 1 )
	Text:SetOutlineRGBFromInt( 0, 0 )
	Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -65, _1080p * -11, _1080p * 11 )
	self:addElement( Text )
	self.Text = Text
	
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
	Lock:SetAlpha( 0, 0 )
	Lock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Lock:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -82, _1080p * -56, _1080p * -13, _1080p * 13 )
	self:addElement( Lock )
	self.Lock = Lock
	
	local Selected = nil
	
	Selected = LUI.UIImage.new()
	Selected.id = "Selected"
	Selected:SetZRotation( 45, 0 )
	Selected:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -75, _1080p * -63, _1080p * -6, _1080p * 6 )
	self:addElement( Selected )
	self.Selected = Selected
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f5_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon:SetAlpha( 0, 0 )
	QualityIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -110.5, _1080p * -87, _1080p * -11.75, _1080p * 11.75 )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Text:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Text:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		Selected:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Selected:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Text:AnimateSequence( "ButtonOver" )
			Lock:AnimateSequence( "ButtonOver" )
			Selected:AnimateSequence( "ButtonOver" )
		end
		
		Text:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Text:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		Selected:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Selected:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Text:AnimateSequence( "ButtonUp" )
			Lock:AnimateSequence( "ButtonUp" )
			Selected:AnimateSequence( "ButtonUp" )
		end
		
		Text:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Text:AnimateSequence( "Locked" )
		end
		
		Text:RegisterAnimationSequence( "NewNotification", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.genericButton.contentFocus, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 0.9, 0 )
				end
			}
		} )
		self._sequences.NewNotification = function ()
			Text:AnimateSequence( "NewNotification" )
		end
		
		Text:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Text:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Lock:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			Text:AnimateSequence( "ButtonOverDisabled" )
			Lock:AnimateSequence( "ButtonOverDisabled" )
		end
		
		Text:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Text:SetRGBFromInt( 12566463, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Lock:SetRGBFromInt( 12566463, 0 )
				end
			},
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			Text:AnimateSequence( "ButtonUpDisabled" )
			Lock:AnimateSequence( "ButtonUpDisabled" )
		end
		
		Selected:RegisterAnimationSequence( "SelectedOn", {
			{
				function ()
					return self.Selected:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.SelectedOn = function ()
			Selected:AnimateSequence( "SelectedOn" )
		end
		
		Selected:RegisterAnimationSequence( "SelectedOff", {
			{
				function ()
					return self.Selected:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.SelectedOff = function ()
			Selected:AnimateSequence( "SelectedOff" )
		end
		
		QualityIcon:RegisterAnimationSequence( "ShowQuality", {
			{
				function ()
					return self.QualityIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowQuality = function ()
			QualityIcon:AnimateSequence( "ShowQuality" )
		end
		
		QualityIcon:RegisterAnimationSequence( "HideQuality", {
			{
				function ()
					return self.QualityIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideQuality = function ()
			QualityIcon:AnimateSequence( "HideQuality" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f42_arg0, f42_arg1 )
		local f42_local0 = f42_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f43_arg0, f43_arg1 )
		local f43_local0 = f43_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_disable", function ( f44_arg0, f44_arg1 )
		local f44_local0 = f44_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonUpDisabled" )
	end )
	self:addEventHandler( "button_over_disable", function ( f45_arg0, f45_arg1 )
		local f45_local0 = f45_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
	end )
	PostLoadFunc( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "RigEditActionButton", RigEditActionButton )
LockTable( _M )
