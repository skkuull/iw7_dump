local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = {
		title = LocalizeIntoString( f1_arg1.prestigeLevel + 1, "PRESTIGE_ENTER_PRESTIGE_LEVEL" ),
		width = _1080p * 950,
		defaultFocusIndex = 1,
		cancelClosesPopup = false
	}
	local f1_local1 = MenuBuilder.BuildRegisteredType( "EnterPrestigeWidget", {
		prestigeLevel = f1_arg1.prestigeLevel,
		rankLevel = f1_arg1.rankLevel,
		startLevel = f1_arg1.startLevel,
		controllerIndex = f1_arg1.controller
	} )
	f1_local1.id = "EnterPrestigeWidget"
	f1_local0.listContent = {}
	table.insert( f1_local0.listContent, f1_local1 )
	local f1_local2 = MenuBuilder.BuildRegisteredType( "PopupList", f1_local0 )
	f1_local2.id = "EnterPrestigeWidgetPopup"
	return f1_local2
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	LUI.FlowManager.RequestPopupMenu( f2_arg0, "PrestigePopup", true, f2_arg1, false, {
		prestigeLevel = f2_arg0.prestigeLevel,
		rankLevel = f2_arg0.rankLevel,
		startLevel = f2_arg0.startLevel,
		controller = f2_arg1
	}, nil, true )
end

f0_local2 = function ()
	WipeGlobalModelsAtPath( "frontend.prestigeRewards" )
end

MenuBuilder.registerType( "PrestigePopup", f0_local0 )
LUI.FlowManager.RegisterStackPopBehaviour( "PrestigePopup", f0_local2 )
local f0_local3 = function ( f4_arg0, f4_arg1 )
	f4_arg0.prestigeLevel = DataSources.alwaysLoaded.MP.ranked.progression.prestige:GetValue( f4_arg1 )
	f4_arg0.rankLevel = DataSources.alwaysLoaded.MP.ranked.progression.rank:GetValue( f4_arg1 )
	f4_arg0.startLevel = 1
	f4_arg0.RankLabel:setText( f4_arg0.prestigeLevel, 0 )
	f4_arg0.TitlePrestigeLevel:setText( ToUpperCase( Engine.Localize( "PRESTIGE_PRESTIGE_LEVEL_N", f4_arg0.prestigeLevel ), 0 ) )
	if IsLanguageArabic() then
		f4_arg0.TitlePrestigeLevel:SetAlignment( LUI.Alignment.Left )
	end
	local f4_local0 = Prestige.CanActivate( f4_arg1 )
	local f4_local1 = Prestige.IsAtMaxPrestige( f4_arg1 )
	f4_arg0:SetButtonDisabled( not f4_local0 )
	if f4_local1 then
		ACTIONS.AnimateSequence( f4_arg0, "MaxPrestige" )
		f4_arg0.PrestigeLockedLabel:setText( Engine.Localize( "PRESTIGE_PRESTIGE_MAX_REACHED" ), 0 )
	elseif f4_local0 then
		ACTIONS.AnimateSequence( f4_arg0, "Unlocked" )
	else
		ACTIONS.AnimateSequence( f4_arg0, "Locked" )
		f4_arg0.PrestigeLockedLabel:setText( ToUpperCase( Engine.Localize( "PRESTIGE_UNLOCK_REQUIREMENT_DESC", Rank.GetMaxRank() + 1 ), 0 ) )
		if f4_arg0.prestigeLevel <= 0 then
			f4_arg0.TitlePrestigeLevel:SetAlpha( 0, 0 )
		end
	end
end

function PostLoadFunc( f5_arg0, f5_arg1, f5_arg2 )
	if Engine.IsAliensMode() then
		f5_arg0:SetDataSource( DataSources.alwaysLoaded.CP.ranked.progression, f5_arg1 )
	else
		f5_arg0:SetDataSource( DataSources.alwaysLoaded.MP.ranked.progression, f5_arg1 )
	end
	f5_arg0:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
		f0_local1( f5_arg0, f5_arg1 )
	end )
	f0_local3( f5_arg0, f5_arg1 )
	f5_arg0:addEventHandler( "prestige_completed", function ()
		f0_local3( f5_arg0, f5_arg1 )
	end )
end

function HeadquartersPrestigeButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 250 * _1080p )
	self.id = "HeadquartersPrestigeButton"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local GenericItemBackground = nil
	
	GenericItemBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f8_local1
	} )
	GenericItemBackground.id = "GenericItemBackground"
	GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local RankIcon = nil
	
	RankIcon = LUI.UIImage.new()
	RankIcon.id = "RankIcon"
	RankIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 13.44, _1080p * 223.75, _1080p * 31.84, _1080p * 242.16 )
	RankIcon:SubscribeToModelThroughElement( self, "rankBigIcon", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.rankBigIcon:GetValue( f8_local1 )
		if f9_local0 ~= nil then
			RankIcon:setImage( RegisterMaterial( f9_local0 ), 0 )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local RankLabelBackground = nil
	
	RankLabelBackground = LUI.UIImage.new()
	RankLabelBackground.id = "RankLabelBackground"
	RankLabelBackground:SetRGBFromInt( 5131854, 0 )
	RankLabelBackground:SetAlpha( 0.8, 0 )
	RankLabelBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 308, _1080p * 408, _1080p * 77.34, _1080p * 177.34 )
	self:addElement( RankLabelBackground )
	self.RankLabelBackground = RankLabelBackground
	
	local RankLabel = nil
	
	RankLabel = LUI.UIStyledText.new()
	RankLabel.id = "RankLabel"
	RankLabel:setText( "2", 0 )
	RankLabel:SetFontSize( 90 * _1080p )
	RankLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RankLabel:SetAlignment( LUI.Alignment.Center )
	RankLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 308.84, _1080p * 407.16, _1080p * 82.34, _1080p * 172.34 )
	self:addElement( RankLabel )
	self.RankLabel = RankLabel
	
	local PrestigeLevelLabel = nil
	
	PrestigeLevelLabel = LUI.UIStyledText.new()
	PrestigeLevelLabel.id = "PrestigeLevelLabel"
	PrestigeLevelLabel:setText( Engine.Localize( "PRESTIGE_PRESTIGE_LEVEL" ), 0 )
	PrestigeLevelLabel:SetFontSize( 19 * _1080p )
	PrestigeLevelLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PrestigeLevelLabel:SetAlignment( LUI.Alignment.Center )
	PrestigeLevelLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 231.5, _1080p * 484.5, _1080p * 44.5, _1080p * 67.5 )
	self:addElement( PrestigeLevelLabel )
	self.PrestigeLevelLabel = PrestigeLevelLabel
	
	local PrestigeLockedLabel = nil
	
	PrestigeLockedLabel = LUI.UIText.new()
	PrestigeLockedLabel.id = "PrestigeLockedLabel"
	PrestigeLockedLabel:setText( Engine.Localize( "PRESTIGE_UNLOCKED_AT_PLAYER_LEVEL" ), 0 )
	PrestigeLockedLabel:SetFontSize( 26 * _1080p )
	PrestigeLockedLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PrestigeLockedLabel:SetAlignment( LUI.Alignment.Center )
	PrestigeLockedLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 228, _1080p * 488, _1080p * 186, _1080p * 212 )
	self:addElement( PrestigeLockedLabel )
	self.PrestigeLockedLabel = PrestigeLockedLabel
	
	local PrestigeUnlockedLabel = nil
	
	PrestigeUnlockedLabel = LUI.UIText.new()
	PrestigeUnlockedLabel.id = "PrestigeUnlockedLabel"
	PrestigeUnlockedLabel:setText( Engine.Localize( "PRESTIGE_ENTER_PRESTIGE" ), 0 )
	PrestigeUnlockedLabel:SetFontSize( 28 * _1080p )
	PrestigeUnlockedLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PrestigeUnlockedLabel:SetAlignment( LUI.Alignment.Center )
	PrestigeUnlockedLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 231.5, _1080p * 484.5, _1080p * 197.87, _1080p * 226.87 )
	self:addElement( PrestigeUnlockedLabel )
	self.PrestigeUnlockedLabel = PrestigeUnlockedLabel
	
	local PrestigeLockedIcon = nil
	
	PrestigeLockedIcon = LUI.UIImage.new()
	PrestigeLockedIcon.id = "PrestigeLockedIcon"
	PrestigeLockedIcon:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	PrestigeLockedIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 326, _1080p * 390, _1080p * 65, _1080p * 129 )
	self:addElement( PrestigeLockedIcon )
	self.PrestigeLockedIcon = PrestigeLockedIcon
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f8_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 24, _1080p * 250 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local TitleBackground = nil
	
	TitleBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f8_local1
	} )
	TitleBackground.id = "TitleBackground"
	TitleBackground.DropShadow:SetAlpha( 0, 0 )
	TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:setText( Engine.Localize( "PRESTIGE_MULTIPLAYER_PRESTIGE" ), 0 )
	Title:SetFontSize( 19 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 13, _1080p * 488, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( Title )
	self.Title = Title
	
	local TitlePrestigeLevel = nil
	
	TitlePrestigeLevel = LUI.UIStyledText.new()
	TitlePrestigeLevel.id = "TitlePrestigeLevel"
	TitlePrestigeLevel:SetRGBFromTable( SWATCHES.AAR.featuredRankProgress, 0 )
	TitlePrestigeLevel:setText( ToUpperCase( "" ), 0 )
	TitlePrestigeLevel:SetFontSize( 16 * _1080p )
	TitlePrestigeLevel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TitlePrestigeLevel:SetAlignment( LUI.Alignment.Right )
	TitlePrestigeLevel:SetStartupDelay( 1000 )
	TitlePrestigeLevel:SetLineHoldTime( 400 )
	TitlePrestigeLevel:SetAnimMoveTime( 150 )
	TitlePrestigeLevel:SetEndDelay( 1000 )
	TitlePrestigeLevel:SetCrossfadeTime( 400 )
	TitlePrestigeLevel:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	TitlePrestigeLevel:SetMaxVisibleLines( 1 )
	TitlePrestigeLevel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 13, _1080p * 488, _1080p * 4.5, _1080p * 20.5 )
	self:addElement( TitlePrestigeLevel )
	self.TitlePrestigeLevel = TitlePrestigeLevel
	
	local f8_local15 = nil
	if Engine.InFrontend() then
		f8_local15 = LUI.UIImage.new()
		f8_local15.id = "DropShadowCrafting"
		f8_local15:SetRGBFromInt( 0, 0 )
		f8_local15:SetAlpha( 0.3, 0 )
		f8_local15:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f8_local15:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f8_local15 )
		self.DropShadowCrafting = f8_local15
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Title:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Title:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		TitlePrestigeLevel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.TitlePrestigeLevel:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Title:AnimateSequence( "ButtonOver" )
			TitlePrestigeLevel:AnimateSequence( "ButtonOver" )
		end
		
		Title:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Title:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		TitlePrestigeLevel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.TitlePrestigeLevel:SetRGBFromTable( SWATCHES.AAR.featuredRankProgress, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Title:AnimateSequence( "ButtonUp" )
			TitlePrestigeLevel:AnimateSequence( "ButtonUp" )
		end
		
		PrestigeLockedLabel:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.PrestigeLockedLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		PrestigeLockedIcon:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.PrestigeLockedIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		TitlePrestigeLevel:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.TitlePrestigeLevel:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			PrestigeLockedLabel:AnimateSequence( "Unlocked" )
			PrestigeLockedIcon:AnimateSequence( "Unlocked" )
			TitlePrestigeLevel:AnimateSequence( "Unlocked" )
		end
		
		RankIcon:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.RankIcon:SetAlpha( 0.75, 0 )
				end
			}
		} )
		RankLabelBackground:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.RankLabelBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		RankLabel:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.RankLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		PrestigeLevelLabel:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.PrestigeLevelLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		PrestigeLockedLabel:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.PrestigeLockedLabel:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.PrestigeLockedLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 228, _1080p * 488, _1080p * 142, _1080p * 168, 0 )
				end
			}
		} )
		PrestigeUnlockedLabel:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.PrestigeUnlockedLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		PrestigeLockedIcon:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.PrestigeLockedIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		TitlePrestigeLevel:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.TitlePrestigeLevel:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			RankIcon:AnimateSequence( "Locked" )
			RankLabelBackground:AnimateSequence( "Locked" )
			RankLabel:AnimateSequence( "Locked" )
			PrestigeLevelLabel:AnimateSequence( "Locked" )
			PrestigeLockedLabel:AnimateSequence( "Locked" )
			PrestigeUnlockedLabel:AnimateSequence( "Locked" )
			PrestigeLockedIcon:AnimateSequence( "Locked" )
			TitlePrestigeLevel:AnimateSequence( "Locked" )
		end
		
		PrestigeUnlockedLabel:RegisterAnimationSequence( "MaxPrestige", {
			{
				function ()
					return self.PrestigeUnlockedLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		PrestigeLockedIcon:RegisterAnimationSequence( "MaxPrestige", {
			{
				function ()
					return self.PrestigeLockedIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		TitlePrestigeLevel:RegisterAnimationSequence( "MaxPrestige", {
			{
				function ()
					return self.TitlePrestigeLevel:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.MaxPrestige = function ()
			PrestigeUnlockedLabel:AnimateSequence( "MaxPrestige" )
			PrestigeLockedIcon:AnimateSequence( "MaxPrestige" )
			TitlePrestigeLevel:AnimateSequence( "MaxPrestige" )
		end
		
		Title:RegisterAnimationSequence( "ButtonDisabled", {
			{
				function ()
					return self.Title:SetRGBFromTable( SWATCHES.CAC.defaultItemHeader, 0 )
				end
			}
		} )
		TitlePrestigeLevel:RegisterAnimationSequence( "ButtonDisabled", {
			{
				function ()
					return self.TitlePrestigeLevel:SetRGBFromTable( SWATCHES.AAR.featuredRankProgress, 0 )
				end
			}
		} )
		self._sequences.ButtonDisabled = function ()
			Title:AnimateSequence( "ButtonDisabled" )
			TitlePrestigeLevel:AnimateSequence( "ButtonDisabled" )
		end
		
		Title:RegisterAnimationSequence( "Arabic", {
			{
				function ()
					return self.Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 203.44, _1080p * 488, _1080p * 2.5, _1080p * 21.5, 0 )
				end
			}
		} )
		TitlePrestigeLevel:RegisterAnimationSequence( "Arabic", {
			{
				function ()
					return self.TitlePrestigeLevel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 13.44, _1080p * 172.44, _1080p * 4, _1080p * 20, 0 )
				end
			}
		} )
		self._sequences.Arabic = function ()
			Title:AnimateSequence( "Arabic" )
			TitlePrestigeLevel:AnimateSequence( "Arabic" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f42_arg0, f42_arg1 )
		local f42_local0 = f42_arg1.controller or f8_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f43_arg0, f43_arg1 )
		local f43_local0 = f43_arg1.controller or f8_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_over_disable", function ( f44_arg0, f44_arg1 )
		local f44_local0 = f44_arg1.controller or f8_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_disable", function ( f45_arg0, f45_arg1 )
		local f45_local0 = f45_arg1.controller or f8_local1
		ACTIONS.AnimateSequence( self, "ButtonDisabled" )
	end )
	PostLoadFunc( self, f8_local1, controller )
	if CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "Arabic" )
	end
	return self
end

MenuBuilder.registerType( "HeadquartersPrestigeButton", HeadquartersPrestigeButton )
LUI.FlowManager.RegisterStackPopBehaviour( "HeadquartersPrestigeButton", f0_local2 )
LockTable( _M )
