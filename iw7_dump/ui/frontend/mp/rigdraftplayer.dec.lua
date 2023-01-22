local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = LoadoutDrafting.GetRigDraftInfoForPlayer( f1_arg3 )
	if f1_local0 then
		assert( f1_local0.gamertag )
		assert( f1_local0.rigIndex )
		assert( f1_local0.superIndex )
		assert( f1_local0.traitIndex )
		f1_arg0.Gamertag:setText( f1_local0.gamertag )
		if f1_local0.rigIndex == Cac.noDraftedRigIndex then
			f1_arg0.RigName:setText( "" )
			f1_arg0.RigImage:setImage( RegisterMaterial( "ui_default_white_multiply" ) )
			f1_arg0.RigSpinner:SetAlpha( 1, 0 )
		else
			f1_arg0.RigName:setText( Engine.Localize( Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.index, f1_local0.rigIndex, CSV.battleRigs.cols.name ) ) )
			f1_arg0.RigImage:setImage( RegisterMaterial( Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.index, f1_local0.rigIndex, CSV.battleRigs.cols.portrait ) ) )
			f1_arg0.RigSpinner:SetAlpha( 0, 0 )
		end
		if f1_local0.superIndex == Cac.noDraftedSuperIndex then
			f1_arg0.SuperName:setText( Engine.Localize( "MP_FRONTEND_ONLY_NOT_SELECTED" ) )
			f1_arg0.SuperImage:setImage( RegisterMaterial( "ui_default_white_multiply" ) )
			f1_arg0.SuperSpinner:SetAlpha( 1, 0 )
		else
			f1_arg0.SuperImage:setImage( RegisterMaterial( Engine.TableLookup( CSV.supers.file, CSV.supers.cols.index, f1_local0.superIndex, CSV.supers.cols.uiImageSmall ) ) )
			f1_arg0.SuperName:setText( ToUpperCase( Engine.Localize( Engine.TableLookup( CSV.supers.file, CSV.supers.cols.index, f1_local0.superIndex, CSV.supers.cols.uiName ) ) ) )
			f1_arg0.SuperSpinner:SetAlpha( 0, 0 )
		end
		if f1_local0.traitIndex == Cac.noDraftedTraitIndex then
			f1_arg0.TraitName:setText( Engine.Localize( "MP_FRONTEND_ONLY_NOT_SELECTED" ) )
			f1_arg0.TraitImage:setImage( RegisterMaterial( "ui_default_white_multiply" ) )
			f1_arg0.TraitSpinner:SetAlpha( 1, 0 )
		else
			f1_arg0.TraitImage:setImage( RegisterMaterial( Engine.TableLookup( CSV.perks.file, CSV.perks.cols.index, f1_local0.traitIndex, CSV.perks.cols.image ) ) )
			f1_arg0.TraitName:setText( ToUpperCase( Engine.Localize( Engine.TableLookup( CSV.perks.file, CSV.perks.cols.index, f1_local0.traitIndex, CSV.perks.cols.name ) ) ) )
			f1_arg0.TraitSpinner:SetAlpha( 0, 0 )
		end
		if f1_arg0.currentSequence ~= "Enabled" then
			f1_arg0.currentSequence = "Enabled"
			ACTIONS.AnimateSequence( f1_arg0, "Enabled" )
		end
	elseif f1_arg0.currentSequence ~= "Disabled" then
		f1_arg0.currentSequence = "Disabled"
		ACTIONS.AnimateSequence( f1_arg0, "Disabled" )
		f1_arg0.RigSpinner:SetAlpha( 0, 0 )
		f1_arg0.SuperSpinner:SetAlpha( 0, 0 )
		f1_arg0.TraitSpinner:SetAlpha( 0, 0 )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local RigSpinner = MenuBuilder.BuildRegisteredType( "Spinner", {
		controllerIndex = f2_arg1
	} )
	RigSpinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 118, _1080p * 182, _1080p * 56, _1080p * 120 )
	RigSpinner.id = "RigSpinner"
	RigSpinner:SetScale( -0.25 )
	f2_arg0:addElement( RigSpinner )
	f2_arg0.RigSpinner = RigSpinner
	
	local SuperSpinner = MenuBuilder.BuildRegisteredType( "Spinner", {
		controllerIndex = f2_arg1
	} )
	SuperSpinner:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -263, _1080p * -199, _1080p * -84, _1080p * -20 )
	SuperSpinner.id = "SuperSpinner"
	SuperSpinner:SetScale( -0.25 )
	f2_arg0:addElement( SuperSpinner )
	f2_arg0.SuperSpinner = SuperSpinner
	
	local TraitSpinner = MenuBuilder.BuildRegisteredType( "Spinner", {
		controllerIndex = f2_arg1
	} )
	TraitSpinner:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -109, _1080p * -45, _1080p * -84, _1080p * -20 )
	TraitSpinner.id = "TraitSpinner"
	TraitSpinner:SetScale( -0.25 )
	f2_arg0:addElement( TraitSpinner )
	f2_arg0.TraitSpinner = TraitSpinner
	
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = Engine.GetTeamForLocalClient()
	if f3_local0 == Teams.spectator then
		f3_arg0:SetFocusable( false )
	end
	f3_arg0.RigImage:SetMask( f3_arg0.Mask )
	f0_local1( f3_arg0, f3_arg1 )
	local f3_local1 = nil
	f3_arg0.RefreshPlayerInfo = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		local f4_local0 = f4_arg0:Wait( 1000 )
		f4_local0.onComplete = function ()
			return f3_local1( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		end
		
		f0_local0( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	end
	
	f3_arg0:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
		if f3_local0 ~= Teams.spectator then
			local f6_local0 = f3_arg0:GetCurrentMenu()
			assert( f6_local0.myXUID )
			local f6_local1 = f6_local0.squadMemberDataSource
			assert( f6_local1 )
			f6_local1.isProperty = false
			f6_local1.__serializable = false
			LUI.FlowManager.RequestAddMenu( "RigSelect", true, f3_arg1, nil, {
				squadMemberDataSource = f6_local1,
				XUID = f6_local0.myXUID
			}, true )
		end
	end )
end

function RigDraftPlayer( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 640 * _1080p, 0, 150 * _1080p )
	self.id = "RigDraftPlayer"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local RigItemsBacker = nil
	
	RigItemsBacker = LUI.UIBlur.new()
	RigItemsBacker.id = "RigItemsBacker"
	RigItemsBacker:SetBlurStrength( 2.75, 0 )
	RigItemsBacker:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -308, 0, _1080p * -122, 0 )
	self:addElement( RigItemsBacker )
	self.RigItemsBacker = RigItemsBacker
	
	local SuperBacker = nil
	
	SuperBacker = LUI.UIImage.new()
	SuperBacker.id = "SuperBacker"
	SuperBacker:SetRGBFromInt( 1710618, 0 )
	SuperBacker:SetAlpha( 0.4, 0 )
	SuperBacker:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -306, _1080p * -156, _1080p * -102, _1080p * -2 )
	self:addElement( SuperBacker )
	self.SuperBacker = SuperBacker
	
	local SuperBackerGradient = nil
	
	SuperBackerGradient = LUI.UIImage.new()
	SuperBackerGradient.id = "SuperBackerGradient"
	SuperBackerGradient:SetRGBFromInt( 0, 0 )
	SuperBackerGradient:SetAlpha( 0.4, 0 )
	SuperBackerGradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	SuperBackerGradient:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -306, _1080p * -156, _1080p * -102, _1080p * -2 )
	self:addElement( SuperBackerGradient )
	self.SuperBackerGradient = SuperBackerGradient
	
	local TraitBacker = nil
	
	TraitBacker = LUI.UIImage.new()
	TraitBacker.id = "TraitBacker"
	TraitBacker:SetRGBFromInt( 1710618, 0 )
	TraitBacker:SetAlpha( 0.4, 0 )
	TraitBacker:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -152, _1080p * -2, _1080p * -102, _1080p * -2 )
	self:addElement( TraitBacker )
	self.TraitBacker = TraitBacker
	
	local TraitBackerGradient = nil
	
	TraitBackerGradient = LUI.UIImage.new()
	TraitBackerGradient.id = "TraitBackerGradient"
	TraitBackerGradient:SetRGBFromInt( 0, 0 )
	TraitBackerGradient:SetAlpha( 0.4, 0 )
	TraitBackerGradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	TraitBackerGradient:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -152, _1080p * -2, _1080p * -102, _1080p * -2 )
	self:addElement( TraitBackerGradient )
	self.TraitBackerGradient = TraitBackerGradient
	
	local GenericItemBackground = nil
	
	GenericItemBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f7_local1
	} )
	GenericItemBackground.id = "GenericItemBackground"
	GenericItemBackground:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 300, 0, _1080p * 150 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local RigImage = nil
	
	RigImage = LUI.UIImage.new()
	RigImage.id = "RigImage"
	RigImage:setImage( RegisterMaterial( "rig_warfighter_v1_lg" ), 0 )
	RigImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -14, _1080p * 264, _1080p * -35, _1080p * 242 )
	self:addElement( RigImage )
	self.RigImage = RigImage
	
	local RigNameBacker = nil
	
	RigNameBacker = LUI.UIImage.new()
	RigNameBacker.id = "RigNameBacker"
	RigNameBacker:SetRGBFromInt( 0, 0 )
	RigNameBacker:SetAlpha( 0.6, 0 )
	RigNameBacker:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	RigNameBacker:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 300, _1080p * 26, _1080p * 56 )
	self:addElement( RigNameBacker )
	self.RigNameBacker = RigNameBacker
	
	local RigName = nil
	
	RigName = LUI.UIText.new()
	RigName.id = "RigName"
	RigName:setText( "", 0 )
	RigName:SetFontSize( 26 * _1080p )
	RigName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RigName:SetAlignment( LUI.Alignment.Right )
	RigName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 290, _1080p * 28, _1080p * 54 )
	self:addElement( RigName )
	self.RigName = RigName
	
	local SuperImage = nil
	
	SuperImage = LUI.UIImage.new()
	SuperImage.id = "SuperImage"
	SuperImage:setImage( RegisterMaterial( "icon_super_weapon_claw" ), 0 )
	SuperImage:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -291, _1080p * -171, _1080p * -112, _1080p * 8 )
	self:addElement( SuperImage )
	self.SuperImage = SuperImage
	
	local TraitImage = nil
	
	TraitImage = LUI.UIImage.new()
	TraitImage.id = "TraitImage"
	TraitImage:setImage( RegisterMaterial( "icon_trait_ping" ), 0 )
	TraitImage:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -137, _1080p * -17, _1080p * -112, _1080p * 8 )
	self:addElement( TraitImage )
	self.TraitImage = TraitImage
	
	local TitleBackground = nil
	
	TitleBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f7_local1
	} )
	TitleBackground.id = "TitleBackground"
	TitleBackground.DropShadow:SetAlpha( 0, 0 )
	TitleBackground:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 300, 0, _1080p * 26 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local Gamertag = nil
	
	Gamertag = LUI.UIText.new()
	Gamertag.id = "Gamertag"
	Gamertag:setText( "", 0 )
	Gamertag:SetFontSize( 18 * _1080p )
	Gamertag:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Gamertag:SetAlignment( LUI.Alignment.Left )
	Gamertag:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 13, _1080p * 300, _1080p * 4, _1080p * 22 )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local Mask = nil
	
	Mask = LUI.UIImage.new()
	Mask.id = "Mask"
	Mask:setImage( RegisterMaterial( "wdg_large_mask" ), 0 )
	Mask:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 300, _1080p * 26, _1080p * 150 )
	self:addElement( Mask )
	self.Mask = Mask
	
	local TraitName = nil
	
	TraitName = LUI.UIStyledText.new()
	TraitName.id = "TraitName"
	TraitName:setText( "", 0 )
	TraitName:SetFontSize( 16 * _1080p )
	TraitName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TraitName:SetAlignment( LUI.Alignment.Left )
	TraitName:SetStartupDelay( 1000 )
	TraitName:SetLineHoldTime( 400 )
	TraitName:SetAnimMoveTime( 150 )
	TraitName:SetEndDelay( 1000 )
	TraitName:SetCrossfadeTime( 400 )
	TraitName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	TraitName:SetMaxVisibleLines( 1 )
	TraitName:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -152, _1080p * -2, _1080p * -120, _1080p * -104 )
	self:addElement( TraitName )
	self.TraitName = TraitName
	
	local SuperName = nil
	
	SuperName = LUI.UIStyledText.new()
	SuperName.id = "SuperName"
	SuperName:setText( "", 0 )
	SuperName:SetFontSize( 16 * _1080p )
	SuperName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SuperName:SetAlignment( LUI.Alignment.Left )
	SuperName:SetStartupDelay( 1000 )
	SuperName:SetLineHoldTime( 400 )
	SuperName:SetAnimMoveTime( 150 )
	SuperName:SetEndDelay( 1000 )
	SuperName:SetCrossfadeTime( 400 )
	SuperName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	SuperName:SetMaxVisibleLines( 1 )
	SuperName:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -306, _1080p * -156, _1080p * -120, _1080p * -104 )
	self:addElement( SuperName )
	self.SuperName = SuperName
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f7_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 300, _1080p * 26, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local Banner = nil
	
	Banner = LUI.UIImage.new()
	Banner.id = "Banner"
	Banner:SetRGBFromInt( 0, 0 )
	Banner:SetAlpha( 0, 0 )
	Banner:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	Banner:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 80, _1080p * 112 )
	self:addElement( Banner )
	self.Banner = Banner
	
	local BannerText = nil
	
	BannerText = LUI.UIStyledText.new()
	BannerText.id = "BannerText"
	BannerText:SetAlpha( 0, 0 )
	BannerText:setText( ToUpperCase( "" ), 0 )
	BannerText:SetFontSize( 30 * _1080p )
	BannerText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	BannerText:SetAlignment( LUI.Alignment.Center )
	BannerText:SetDecodeLetterLength( 25 )
	BannerText:SetDecodeMaxRandChars( 3 )
	BannerText:SetDecodeUpdatesPerLetter( 4 )
	BannerText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 81, _1080p * 111 )
	self:addElement( BannerText )
	self.BannerText = BannerText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Gamertag:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Gamertag:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Gamertag:AnimateSequence( "ButtonOver" )
		end
		
		Gamertag:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Gamertag:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Gamertag:AnimateSequence( "ButtonUp" )
		end
		
		SuperBackerGradient:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.SuperBackerGradient:setImage( RegisterMaterial( "widg_disabled" ), 0 )
				end
			},
			{
				function ()
					return self.SuperBackerGradient:SetRGBFromInt( 13421772, 0 )
				end
			},
			{
				function ()
					return self.SuperBackerGradient:SetAlpha( 0.3, 0 )
				end
			}
		} )
		TraitBackerGradient:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.TraitBackerGradient:setImage( RegisterMaterial( "widg_disabled" ), 0 )
				end
			},
			{
				function ()
					return self.TraitBackerGradient:SetRGBFromInt( 13421772, 0 )
				end
			},
			{
				function ()
					return self.TraitBackerGradient:SetAlpha( 0.3, 0 )
				end
			}
		} )
		RigImage:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.RigImage:SetAlpha( 0.3, 0 )
				end
			}
		} )
		SuperImage:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.SuperImage:SetAlpha( 0.3, 0 )
				end
			}
		} )
		TraitImage:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.TraitImage:SetAlpha( 0.3, 0 )
				end
			}
		} )
		Banner:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.Banner:SetAlpha( 0.75, 0 )
				end
			}
		} )
		BannerText:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.BannerText:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BannerText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_DRAFT_PLAYER_LEFT" ) ), 0 )
				end
			}
		} )
		self._sequences.Disabled = function ()
			SuperBackerGradient:AnimateSequence( "Disabled" )
			TraitBackerGradient:AnimateSequence( "Disabled" )
			RigImage:AnimateSequence( "Disabled" )
			SuperImage:AnimateSequence( "Disabled" )
			TraitImage:AnimateSequence( "Disabled" )
			Banner:AnimateSequence( "Disabled" )
			BannerText:AnimateSequence( "Disabled" )
		end
		
		SuperBackerGradient:RegisterAnimationSequence( "Enabled", {
			{
				function ()
					return self.SuperBackerGradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
				end
			},
			{
				function ()
					return self.SuperBackerGradient:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.SuperBackerGradient:SetAlpha( 0.4, 0 )
				end
			}
		} )
		TraitBackerGradient:RegisterAnimationSequence( "Enabled", {
			{
				function ()
					return self.TraitBackerGradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
				end
			},
			{
				function ()
					return self.TraitBackerGradient:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.TraitBackerGradient:SetAlpha( 0.4, 0 )
				end
			}
		} )
		RigImage:RegisterAnimationSequence( "Enabled", {
			{
				function ()
					return self.RigImage:SetAlpha( 1, 0 )
				end
			}
		} )
		SuperImage:RegisterAnimationSequence( "Enabled", {
			{
				function ()
					return self.SuperImage:SetAlpha( 1, 0 )
				end
			}
		} )
		TraitImage:RegisterAnimationSequence( "Enabled", {
			{
				function ()
					return self.TraitImage:SetAlpha( 1, 0 )
				end
			}
		} )
		Banner:RegisterAnimationSequence( "Enabled", {
			{
				function ()
					return self.Banner:SetAlpha( 0, 0 )
				end
			}
		} )
		BannerText:RegisterAnimationSequence( "Enabled", {
			{
				function ()
					return self.BannerText:setText( ToUpperCase( "" ), 0 )
				end
			},
			{
				function ()
					return self.BannerText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Enabled = function ()
			SuperBackerGradient:AnimateSequence( "Enabled" )
			TraitBackerGradient:AnimateSequence( "Enabled" )
			RigImage:AnimateSequence( "Enabled" )
			SuperImage:AnimateSequence( "Enabled" )
			TraitImage:AnimateSequence( "Enabled" )
			Banner:AnimateSequence( "Enabled" )
			BannerText:AnimateSequence( "Enabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f40_arg0, f40_arg1 )
		local f40_local0 = f40_arg1.controller or f7_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f41_arg0, f41_arg1 )
		local f41_local0 = f41_arg1.controller or f7_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local2( self, f7_local1, controller )
	return self
end

MenuBuilder.registerType( "RigDraftPlayer", RigDraftPlayer )
LockTable( _M )
