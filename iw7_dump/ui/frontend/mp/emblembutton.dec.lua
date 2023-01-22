local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0:GetDataSource()
	local f1_local1 = f1_local0.emblemIndex:GetValue( f1_arg1 )
	local f1_local2 = f1_local0.isLocked:GetValue( f1_arg1 )
	local f1_local3 = f1_local0.emblemName:GetValue( f1_arg1 )
	local f1_local4 = f1_local0.emblemType:GetValue( f1_arg1 ) == EmblemEditorUtils.EmblemTypes.EMBLEM_TYPE_LAYERED
	if f1_local2 then
		f1_arg0.plusicon:SetAlpha( 0 )
		f1_arg0.EmblemImage:SetAlpha( 0 )
		f1_arg0.RestrictionOverlay:SetAlpha( 1 )
	elseif f1_local1 ~= -1 then
		if f1_local4 then
			EmblemEditor.UpdateEmblemThumbnail( f1_arg1, f1_local1 )
		end
		EmblemEditorUtils.SetupEmblemRendering( f1_arg0.EmblemImage, f1_local0, f1_arg1 )
		f1_arg0.plusicon:SetAlpha( 0 )
		f1_arg0.EmblemImage:SetAlpha( 1 )
		f1_arg0.RestrictionOverlay:SetAlpha( 0 )
	else
		f1_arg0.plusicon:SetAlpha( 1 )
		f1_arg0.EmblemImage:SetAlpha( 0 )
		f1_arg0.RestrictionOverlay:SetAlpha( 0 )
	end
	if not f1_local4 then
		f1_local3 = Engine.Localize( f1_local3 )
	end
	f1_arg0.TitleLabel:setText( f1_local3, 0 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0:SubscribeToModelThroughElement( f2_arg0, "emblemIndex", function ()
		f0_local0( f2_arg0, f2_arg1 )
	end )
	f2_arg0:SubscribeToModelThroughElement( f2_arg0, "isLocked", function ()
		f0_local0( f2_arg0, f2_arg1 )
	end )
	f2_arg0:SubscribeToModelThroughElement( f2_arg0, "emblemName", function ()
		f0_local0( f2_arg0, f2_arg1 )
	end )
	f2_arg0:addEventHandler( "button_over", function ( f6_arg0, f6_arg1 )
		local f6_local0 = f2_arg0:GetDataSource()
		if f6_local0 then
			if f6_local0.emblemIndex:GetValue( f2_arg1 ) > -1 and f6_local0.emblemType:GetValue( f2_arg1 ) == EmblemEditorUtils.EmblemTypes.EMBLEM_TYPE_LAYERED then
				ACTIONS.AnimateSequence( f2_arg0, "ShowPrompt" )
			end
		end
	end )
	f2_arg0:addEventHandler( "button_up", function ( f7_arg0, f7_arg1 )
		local f7_local0 = f2_arg0:GetDataSource()
		if f7_local0 then
			if f7_local0.emblemIndex:GetValue( f2_arg1 ) > -1 and f7_local0.emblemType:GetValue( f2_arg1 ) == EmblemEditorUtils.EmblemTypes.EMBLEM_TYPE_LAYERED then
				ACTIONS.AnimateSequence( f2_arg0, "HidePrompt" )
			end
		end
	end )
	assert( f2_arg0.PersonalizeButton )
	f2_arg0:registerEventHandler( "refresh_button_helper", function ( element, event )
		element.PersonalizeButton:setText( Engine.Localize( "LUA_MENU_PAD_ALT2_BUTTON" ), 0 )
	end )
	if Engine.IsPC() then
		f2_arg0:addEventHandler( "button_action", function ( f9_arg0, f9_arg1 )
			f2_arg0:dispatchEventToCurrentMenu( {
				name = "emblem_selection_alternate"
			} )
		end )
	end
	f2_arg0:SubscribeToModelThroughElement( f2_arg0, "quality", function ()
		assert( f2_arg0.QualityIcon )
		local f10_local0 = f2_arg0:GetDataSource()
		if f10_local0 then
			local f10_local1 = Cac.LowestQuality
			if not f10_local0.isLocked:GetValue( f2_arg1 ) then
				f10_local1 = f10_local0.quality:GetValue( f2_arg1 )
			end
			f2_arg0.QualityIcon:SetDisplayQuality( f10_local1 )
		end
	end )
end

function EmblemButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 194 * _1080p, 0, 219 * _1080p )
	self.id = "EmblemButton"
	self._animationSets = {}
	self._sequences = {}
	local f11_local1 = controller and controller.controllerIndex
	if not f11_local1 and not Engine.InFrontend() then
		f11_local1 = self:getRootController()
	end
	assert( f11_local1 )
	local f11_local2 = self
	self:SubscribeToModelThroughElement( self, "isLocked", function ()
		local f12_local0 = self:GetDataSource()
		f12_local0 = f12_local0.isLocked:GetValue( f11_local1 )
		if f12_local0 ~= nil then
			self:SetButtonDisabled( f12_local0 )
		end
	end )
	local f11_local3 = nil
	if Engine.InFrontend() then
		f11_local3 = LUI.UIImage.new()
		f11_local3.id = "DropShadow"
		f11_local3:SetRGBFromInt( 0, 0 )
		f11_local3:SetAlpha( 0.3, 0 )
		f11_local3:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f11_local3:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f11_local3 )
		self.DropShadow = f11_local3
	end
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetRGBFromTable( SWATCHES.CAC.BarracksBlurLight, 0 )
	ListBlur:SetBlurStrength( 2.75, 0 )
	ListBlur:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local EmblemImage = nil
	
	EmblemImage = LUI.UIImage.new()
	EmblemImage.id = "EmblemImage"
	EmblemImage:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( EmblemImage )
	self.EmblemImage = EmblemImage
	
	local plusicon = nil
	
	plusicon = LUI.UIImage.new()
	plusicon.id = "plusicon"
	plusicon:setImage( RegisterMaterial( "emblem_plus_icon" ), 0 )
	plusicon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 37, _1080p * 157, _1080p * -48, _1080p * 72 )
	self:addElement( plusicon )
	self.plusicon = plusicon
	
	local RestrictionOverlay = nil
	
	RestrictionOverlay = MenuBuilder.BuildRegisteredType( "CaCButtonRectrictionOverlay", {
		controllerIndex = f11_local1
	} )
	RestrictionOverlay.id = "RestrictionOverlay"
	RestrictionOverlay:SetAlpha( 0, 0 )
	RestrictionOverlay:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( RestrictionOverlay )
	self.RestrictionOverlay = RestrictionOverlay
	
	local CustomizeBacker = nil
	
	CustomizeBacker = LUI.UIImage.new()
	CustomizeBacker.id = "CustomizeBacker"
	CustomizeBacker:SetRGBFromInt( 0, 0 )
	CustomizeBacker:SetAlpha( 0, 0 )
	CustomizeBacker:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -24, 0 )
	self:addElement( CustomizeBacker )
	self.CustomizeBacker = CustomizeBacker
	
	local PersonalizeLabel = nil
	
	PersonalizeLabel = LUI.UIText.new()
	PersonalizeLabel.id = "PersonalizeLabel"
	PersonalizeLabel:SetAlpha( 0, 0 )
	PersonalizeLabel:setText( Engine.Localize( "LUA_MENU_EDIT" ), 0 )
	PersonalizeLabel:SetFontSize( 16 * _1080p )
	PersonalizeLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PersonalizeLabel:SetAlignment( LUI.Alignment.Left )
	PersonalizeLabel:SetOptOutRightToLeftAlignmentFlip( true )
	PersonalizeLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 37, _1080p * 186, _1080p * 199, _1080p * 215 )
	self:addElement( PersonalizeLabel )
	self.PersonalizeLabel = PersonalizeLabel
	
	local PersonalizeButton = nil
	
	PersonalizeButton = LUI.UIText.new()
	PersonalizeButton.id = "PersonalizeButton"
	PersonalizeButton:SetAlpha( 0, 0 )
	PersonalizeButton:setText( Engine.Localize( "LUA_MENU_PAD_ALT2_BUTTON" ), 0 )
	PersonalizeButton:SetFontSize( 20 * _1080p )
	PersonalizeButton:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PersonalizeButton:SetAlignment( LUI.Alignment.Right )
	PersonalizeButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -53, _1080p * 32, _1080p * 197, _1080p * 217 )
	self:addElement( PersonalizeButton )
	self.PersonalizeButton = PersonalizeButton
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f11_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local f11_local12 = nil
	if not Engine.InFrontend() then
		f11_local12 = LUI.UIImage.new()
		f11_local12.id = "InGameBackground"
		f11_local12:SetRGBFromInt( 0, 0 )
		f11_local12:SetAlpha( 0.8, 0 )
		f11_local12:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
		self:addElement( f11_local12 )
		self.InGameBackground = f11_local12
	end
	local f11_local13 = nil
	if Engine.InFrontend() then
		f11_local13 = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
			controllerIndex = f11_local1
		} )
		f11_local13.id = "Background"
		f11_local13.DropShadow:SetAlpha( 0, 0 )
		f11_local13:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
		self:addElement( f11_local13 )
		self.Background = f11_local13
	end
	local TitleLabel = nil
	
	TitleLabel = LUI.UIStyledText.new()
	TitleLabel.id = "TitleLabel"
	TitleLabel:setText( "", 0 )
	TitleLabel:SetFontSize( 19 * _1080p )
	TitleLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TitleLabel:SetAlignment( LUI.Alignment.Left )
	TitleLabel:SetStartupDelay( 1000 )
	TitleLabel:SetLineHoldTime( 500 )
	TitleLabel:SetAnimMoveTime( 500 )
	TitleLabel:SetEndDelay( 1000 )
	TitleLabel:SetCrossfadeTime( 500 )
	TitleLabel:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	TitleLabel:SetMaxVisibleLines( 1 )
	TitleLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 186, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( TitleLabel )
	self.TitleLabel = TitleLabel
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f11_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon:SetScale( -0.5, 0 )
	QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4, _1080p * 68, _1080p * 151, _1080p * 215 )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		TitleLabel:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TitleLabel:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			TitleLabel:AnimateSequence( "DefaultSequence" )
		end
		
		CustomizeBacker:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.CustomizeBacker:SetAlpha( 0, 0 )
				end
			}
		} )
		PersonalizeLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.PersonalizeLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		PersonalizeButton:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.PersonalizeButton:SetAlpha( 0, 0 )
				end
			}
		} )
		TitleLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.TitleLabel:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			CustomizeBacker:AnimateSequence( "ButtonOver" )
			PersonalizeLabel:AnimateSequence( "ButtonOver" )
			PersonalizeButton:AnimateSequence( "ButtonOver" )
			TitleLabel:AnimateSequence( "ButtonOver" )
		end
		
		CustomizeBacker:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.CustomizeBacker:SetAlpha( 0, 0 )
				end
			}
		} )
		PersonalizeLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.PersonalizeLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		PersonalizeButton:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.PersonalizeButton:SetAlpha( 0, 0 )
				end
			}
		} )
		TitleLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.TitleLabel:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			CustomizeBacker:AnimateSequence( "ButtonUp" )
			PersonalizeLabel:AnimateSequence( "ButtonUp" )
			PersonalizeButton:AnimateSequence( "ButtonUp" )
			TitleLabel:AnimateSequence( "ButtonUp" )
		end
		
		CustomizeBacker:RegisterAnimationSequence( "ShowPrompt", {
			{
				function ()
					return self.CustomizeBacker:SetAlpha( 0.9, 0 )
				end
			}
		} )
		PersonalizeLabel:RegisterAnimationSequence( "ShowPrompt", {
			{
				function ()
					return self.PersonalizeLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		PersonalizeButton:RegisterAnimationSequence( "ShowPrompt", {
			{
				function ()
					return self.PersonalizeButton:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowPrompt = function ()
			CustomizeBacker:AnimateSequence( "ShowPrompt" )
			PersonalizeLabel:AnimateSequence( "ShowPrompt" )
			PersonalizeButton:AnimateSequence( "ShowPrompt" )
		end
		
		CustomizeBacker:RegisterAnimationSequence( "HidePrompt", {
			{
				function ()
					return self.CustomizeBacker:SetAlpha( 0, 0 )
				end
			}
		} )
		PersonalizeLabel:RegisterAnimationSequence( "HidePrompt", {
			{
				function ()
					return self.PersonalizeLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		PersonalizeButton:RegisterAnimationSequence( "HidePrompt", {
			{
				function ()
					return self.PersonalizeButton:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HidePrompt = function ()
			CustomizeBacker:AnimateSequence( "HidePrompt" )
			PersonalizeLabel:AnimateSequence( "HidePrompt" )
			PersonalizeButton:AnimateSequence( "HidePrompt" )
		end
		
		EmblemImage:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.EmblemImage:SetAlpha( 0, 0 )
				end
			}
		} )
		RestrictionOverlay:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.RestrictionOverlay:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			EmblemImage:AnimateSequence( "Locked" )
			RestrictionOverlay:AnimateSequence( "Locked" )
		end
		
		EmblemImage:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.EmblemImage:SetAlpha( 1, 0 )
				end
			}
		} )
		RestrictionOverlay:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.RestrictionOverlay:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			EmblemImage:AnimateSequence( "Unlocked" )
			RestrictionOverlay:AnimateSequence( "Unlocked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f40_arg0, f40_arg1 )
		local f40_local0 = f40_arg1.controller or f11_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f41_arg0, f41_arg1 )
		local f41_local0 = f41_arg1.controller or f11_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_over_disable", function ( f42_arg0, f42_arg1 )
		local f42_local0 = f42_arg1.controller or f11_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_disable", function ( f43_arg0, f43_arg1 )
		local f43_local0 = f43_arg1.controller or f11_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local1( self, f11_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "EmblemButton", EmblemButton )
LockTable( _M )
