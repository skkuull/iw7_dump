local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.conquest.Headquarters.Rig"
f0_local1 = function ()
	FrontEndScene.SetCharacterVisible( FrontEndScene.ClientCharacters.Self, true )
	WipeGlobalModelsAtPath( f0_local0 )
	Engine.NotifyServer( "taunt_reset", 1 )
end

f0_local2 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	local f2_local0 = {
		sceneName = f2_arg1,
		customizationType = f2_arg2,
		rigRef = f2_arg0.rigDataSource.rigRef:GetValue( f2_arg3 )
	}
	local f2_local1 = nil
	if f2_arg2 == Cac.CustomizationTypes.GESTURE then
		f2_local1 = "RigCustomizationGestureSelection"
	else
		f2_local1 = "RigCustomizationAppearanceSelection"
	end
	LUI.FlowManager.RequestAddMenu( f2_local1, true, f2_arg3, nil, f2_local0, true )
end

local f0_local3 = function ( f3_arg0, f3_arg1, f3_arg2 )
	FrontEndScene.SetScene( "rig_select" )
	local f3_local0 = GetSquadMemberDataSource()
	local f3_local1 = GetCACPlayerDataDataSource( f3_local0 )
	f3_arg0.squadMemberDataSource = f3_local1.statsGroup
	f3_arg0.rigDataSource = f3_local1.rig
	local f3_local2 = f3_arg0.rigDataSource.rigRef:GetValue( f3_arg1 )
	assert( f3_local2 and #f3_local2 > 0 )
	local f3_local3 = Cac.GetPreferencesForRig( f3_local0.archetypePreferences, f3_local2, f3_arg1 )
	assert( f3_local3 )
	local f3_local4 = LUI.FlowManager.GetScopedData( f3_arg0 )
	if not f3_local4.comingFromTauntMenu then
		Cac.RequestAndSetRig( f3_local2, f3_local3.head:GetValue( f3_arg1 ), f3_local3.body:GetValue( f3_arg1 ), f3_local3.archetypeSuper:GetValue( f3_arg1 ) )
	end
	f3_local4.comingFromTauntMenu = nil
	f3_arg0.bindButton:addEventHandler( "button_secondary", function ( f4_arg0, f4_arg1 )
		FrontEndScene.SetCharacterToRig( FrontEndScene.ClientCharacters.Customization, f3_local2, f3_local0.archetypePreferences, f3_arg1 )
		ACTIONS.LeaveMenu( f3_arg0 )
	end )
	assert( f3_arg0.HeadAppearenceButton )
	assert( f3_arg0.BodyAppearenceButton )
	assert( f3_arg0.TauntButton )
	assert( f3_arg0.GestureButton )
	local f3_local5 = f3_local3.head:GetValue( f3_arg1 )
	local f3_local6 = f3_local3.body:GetValue( f3_arg1 )
	local f3_local7 = f3_local3.gesture:GetValue( f3_arg1 )
	local f3_local8 = Engine.TableLookup( CSV.heads.file, CSV.heads.cols.ref, f3_local5, CSV.heads.cols.name )
	local f3_local9 = Engine.TableLookup( CSV.bodies.file, CSV.bodies.cols.ref, f3_local6, CSV.bodies.cols.name )
	local f3_local10 = Engine.TableLookup( CSV.gestures.file, CSV.gestures.cols.ref, f3_local7, CSV.gestures.cols.name )
	f3_arg0.HeadAppearenceButton.Name:setText( Engine.Localize( f3_local8 ) )
	f3_arg0.BodyAppearenceButton.Name:setText( Engine.Localize( f3_local9 ) )
	f3_arg0.GestureButton.Name:setText( Engine.Localize( f3_local10 ) )
	f3_arg0.HeadAppearenceButton:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
		f0_local2( f3_arg0, "rig_head_select", Cac.CustomizationTypes.HEAD, f5_arg1.controller )
	end )
	f3_arg0.BodyAppearenceButton:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
		f0_local2( f3_arg0, "rig_select", Cac.CustomizationTypes.BODY, f6_arg1.controller )
	end )
	f3_arg0.TauntButton:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
		f3_local4.comingFromTauntMenu = true
		LUI.FlowManager.RequestAddMenu( "RigCustomizationTauntSlots", true, f3_arg1, nil, {
			squadMemberDataSource = f3_arg0.squadMemberDataSource,
			rigRef = f3_local2
		}, true )
	end )
	f3_arg0.GestureButton:addEventHandler( "button_action", function ( f8_arg0, f8_arg1 )
		f0_local2( f3_arg0, "rig_trait_select", Cac.CustomizationTypes.GESTURE, f8_arg1.controller )
	end )
	assert( f3_arg0.GenderToggle )
	OPTIONS.CreateGender( f3_arg0.GenderToggle, f3_arg1 )
	if Engine.TableLookupGetRowNum( CSV.cosmeticHeroesLootMaster.file, CSV.cosmeticHeroesLootMaster.cols.headModel, Engine.TableLookup( CSV.heads.file, CSV.heads.cols.ref, f3_local5, CSV.heads.cols.model ) ) >= 0 then
		f3_arg0.GenderToggle:SetButtonDisabled( true )
	end
	assert( f3_arg0.CharacterRotator )
	f3_arg0.CharacterRotator:SetClientCharacterIndex( FrontEndScene.ClientCharacters.Customization )
	if Engine.IsConsoleGame() and not Engine.GetDvarBool( "killswitch_character_rotation" ) then
		f3_arg0:AddButtonHelperTextToElement( f3_arg0, {
			helper_text = Engine.Localize( "LUA_MENU_ROTATE" ),
			button_ref = "button_stickr_updown_noswap",
			priority = 10,
			side = "left",
			clickable = false
		} )
	end
	f3_arg0.MenuTitle.MenuBreadcrumbs:setText( CoD.GetBreadcrumbCreateAClass(), 0 )
end

function RigCustomization( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "RigCustomization"
	self._animationSets = {}
	self._sequences = {}
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	self:playSound( "menu_open" )
	local f9_local2 = self
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f9_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f9_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local FrameLeftHorBottom = nil
	
	FrameLeftHorBottom = LUI.UIImage.new()
	FrameLeftHorBottom.id = "FrameLeftHorBottom"
	FrameLeftHorBottom:SetRGBFromInt( 0, 0 )
	FrameLeftHorBottom:SetAlpha( 0.8, 0 )
	FrameLeftHorBottom:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 713, _1080p * 728, _1080p * -280, _1080p * -281 )
	self:addElement( FrameLeftHorBottom )
	self.FrameLeftHorBottom = FrameLeftHorBottom
	
	local FrameLeftVert = nil
	
	FrameLeftVert = LUI.UIImage.new()
	FrameLeftVert.id = "FrameLeftVert"
	FrameLeftVert:SetRGBFromInt( 0, 0 )
	FrameLeftVert:SetAlpha( 0.8, 0 )
	FrameLeftVert:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 727, _1080p * 728, _1080p * 208, _1080p * -281 )
	self:addElement( FrameLeftVert )
	self.FrameLeftVert = FrameLeftVert
	
	local FrameLeftHor = nil
	
	FrameLeftHor = LUI.UIImage.new()
	FrameLeftHor.id = "FrameLeftHor"
	FrameLeftHor:SetRGBFromInt( 0, 0 )
	FrameLeftHor:SetAlpha( 0.8, 0 )
	FrameLeftHor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 713, _1080p * 728, _1080p * 207, _1080p * 208 )
	self:addElement( FrameLeftHor )
	self.FrameLeftHor = FrameLeftHor
	
	local Fluff = nil
	
	Fluff = LUI.UIStyledText.new()
	Fluff.id = "Fluff"
	Fluff:SetRGBFromInt( 0, 0 )
	Fluff:SetZRotation( -90, 0 )
	Fluff:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_PERSONALIZE" ) ), 0 )
	Fluff:SetFontSize( 20 * _1080p )
	Fluff:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Fluff:SetAlignment( LUI.Alignment.Right )
	Fluff:SetOptOutRightToLeftAlignmentFlip( true )
	Fluff:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 559.71, _1080p * 918.71, _1080p * 573, _1080p * 593 )
	self:addElement( Fluff )
	self.Fluff = Fluff
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f9_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_EDIT_COMBAT_RIG" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( Engine.Localize( "LUA_MENU_CREATE_A_CLASS_CAPS" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local HeadAppearenceButton = nil
	
	HeadAppearenceButton = MenuBuilder.BuildRegisteredType( "RigCustomizationAppearenceButton", {
		controllerIndex = f9_local1
	} )
	HeadAppearenceButton.id = "HeadAppearenceButton"
	HeadAppearenceButton.buttonDescription = Engine.Localize( "LUA_MENU_MP_RIG_APPEARANCE_HEAD" )
	HeadAppearenceButton.Image:setImage( RegisterMaterial( "icon_rig_head" ), 0 )
	HeadAppearenceButton.TitleText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CUSTOMIZATION_FIELD_HEAD_CAPS" ) ), 0 )
	HeadAppearenceButton.Icon:setImage( RegisterMaterial( "icon_rig_head_small" ), 0 )
	HeadAppearenceButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 716, _1080p * 216, _1080p * 346 )
	self:addElement( HeadAppearenceButton )
	self.HeadAppearenceButton = HeadAppearenceButton
	
	local BodyAppearenceButton = nil
	
	BodyAppearenceButton = MenuBuilder.BuildRegisteredType( "RigCustomizationAppearenceButton", {
		controllerIndex = f9_local1
	} )
	BodyAppearenceButton.id = "BodyAppearenceButton"
	BodyAppearenceButton.buttonDescription = Engine.Localize( "LUA_MENU_MP_RIG_APPEARANCE_BODY" )
	BodyAppearenceButton.Image:setImage( RegisterMaterial( "icon_rig_body" ), 0 )
	BodyAppearenceButton.TitleText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CUSTOMIZATION_FIELD_BODY_CAPS" ) ), 0 )
	BodyAppearenceButton.Icon:setImage( RegisterMaterial( "icon_rig_body_small" ), 0 )
	BodyAppearenceButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 716, _1080p * 352, _1080p * 482 )
	self:addElement( BodyAppearenceButton )
	self.BodyAppearenceButton = BodyAppearenceButton
	
	local GestureButton = nil
	
	GestureButton = MenuBuilder.BuildRegisteredType( "RigCustomizationAppearenceButton", {
		controllerIndex = f9_local1
	} )
	GestureButton.id = "GestureButton"
	GestureButton.buttonDescription = Engine.Localize( "LUA_MENU_MP_RIG_APPEARANCE_GESTURE" )
	GestureButton.Image:setImage( RegisterMaterial( "icon_rig_gesture" ), 0 )
	GestureButton.TitleText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_CUSTOMIZE_GESTURE" ) ), 0 )
	GestureButton.Icon:setImage( RegisterMaterial( "icon_rig_gesture_small" ), 0 )
	GestureButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 716, _1080p * 488, _1080p * 618 )
	self:addElement( GestureButton )
	self.GestureButton = GestureButton
	
	local TauntButton = nil
	
	TauntButton = MenuBuilder.BuildRegisteredType( "RigCustomizationAppearenceButton", {
		controllerIndex = f9_local1
	} )
	TauntButton.id = "TauntButton"
	TauntButton.buttonDescription = Engine.Localize( "LUA_MENU_MP_RIG_APPEARANCE_TAUNT" )
	TauntButton.TitleText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_CUSTOMIZE_TAUNT" ) ), 0 )
	TauntButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 716, _1080p * 624, _1080p * 754 )
	self:addElement( TauntButton )
	self.TauntButton = TauntButton
	
	local f9_local14 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f9_local14 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f9_local1
		} )
		f9_local14.id = "CRMMain"
		f9_local14:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f9_local14 )
		self.CRMMain = f9_local14
	end
	local ButtonDescription = nil
	
	ButtonDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f9_local1
	} )
	ButtonDescription.id = "ButtonDescription"
	ButtonDescription.Description:SetRight( _1080p * 415, 0 )
	ButtonDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 645, _1080p * 797, _1080p * 897 )
	self:addElement( ButtonDescription )
	self.ButtonDescription = ButtonDescription
	
	local GenderToggle = nil
	
	GenderToggle = MenuBuilder.BuildRegisteredType( "GenericArrowButton", {
		controllerIndex = f9_local1
	} )
	GenderToggle.id = "GenderToggle"
	GenderToggle.buttonDescription = Engine.Localize( "LUA_MENU_MP_GENDER_DESC" )
	GenderToggle.Title:setText( ToUpperCase( Engine.Localize( "EXE_SV_INFO_VOICE" ) ), 0 )
	GenderToggle.Text:setText( Engine.Localize( "MENU_NEW" ), 0 )
	GenderToggle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 746, _1080p * 762, _1080p * 792 )
	self:addElement( GenderToggle )
	self.GenderToggle = GenderToggle
	
	local CharacterRotator = nil
	
	CharacterRotator = MenuBuilder.BuildRegisteredType( "CharacterRotator", {
		controllerIndex = f9_local1
	} )
	CharacterRotator.id = "CharacterRotator"
	CharacterRotator:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 806.04, _1080p * 1790, _1080p * 231, _1080p * 965 )
	self:addElement( CharacterRotator )
	self.CharacterRotator = CharacterRotator
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.CloseEditRigItems = function ()
			
		end
		
		self._sequences.OpenEditRigItems = function ()
			
		end
		
		self._sequences.OpenedEditRigItems = function ()
			
		end
		
		FrameLeftVert:RegisterAnimationSequence( "NoPrev", {
			{
				function ()
					return self.FrameLeftVert:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 159, _1080p * 160, _1080p * 185, _1080p * 995, 0 )
				end,
				function ()
					return self.FrameLeftVert:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95.5, _1080p * 96.5, _1080p * 185, _1080p * 995, 300, LUI.EASING.inBack )
				end
			}
		} )
		FrameLeftHor:RegisterAnimationSequence( "NoPrev", {
			{
				function ()
					return self.FrameLeftHor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 149, _1080p * 159, _1080p * 185, _1080p * 186, 0 )
				end,
				function ()
					return self.FrameLeftHor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 85.5, _1080p * 95.5, _1080p * 185, _1080p * 186, 300, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.NoPrev = function ()
			FrameLeftVert:AnimateSequence( "NoPrev" )
			FrameLeftHor:AnimateSequence( "NoPrev" )
		end
		
		self._sequences.NoNext = function ()
			
		end
		
		FrameLeftVert:RegisterAnimationSequence( "YesPrev", {
			{
				function ()
					return self.FrameLeftVert:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95.5, _1080p * 96.5, _1080p * 185, _1080p * 995, 0 )
				end,
				function ()
					return self.FrameLeftVert:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 159, _1080p * 160, _1080p * 185, _1080p * 995, 300, LUI.EASING.outBack )
				end
			}
		} )
		FrameLeftHor:RegisterAnimationSequence( "YesPrev", {
			{
				function ()
					return self.FrameLeftHor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 85.5, _1080p * 95.5, _1080p * 185, _1080p * 186, 0 )
				end,
				function ()
					return self.FrameLeftHor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 149, _1080p * 159, _1080p * 185, _1080p * 186, 300, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.YesPrev = function ()
			FrameLeftVert:AnimateSequence( "YesPrev" )
			FrameLeftHor:AnimateSequence( "YesPrev" )
		end
		
		self._sequences.YesNext = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f27_arg0, f27_arg1 )
		f27_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f27_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -1,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	f0_local3( self, f9_local1, controller )
	if CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end
	return self
end

MenuBuilder.registerType( "RigCustomization", RigCustomization )
LUI.FlowManager.RegisterStackPopBehaviour( "RigCustomization", f0_local1 )
LockTable( _M )
