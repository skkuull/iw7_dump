local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.KillsStat )
	Streaming.SetStreamingEnabled( true )
	local f1_local0 = Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Coop, "DeadliestWeaponName" )
	if f1_local0 and f1_local0 ~= "none" then
		local f1_local1 = Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Coop, "DeadliestWeaponKills", f1_local0 )
		local f1_local2 = Cac.GetWeaponName( f1_local0 )
		f1_arg0.KillsStat.AmountLabel:setText( f1_local1, 0 )
		f1_arg0.WeaponNameTitle:setText( f1_local2, 0 )
		local f1_local3 = Cac.ConvertWeaponMPToZM( Cac.GetCompleteWeaponModelName( f1_local0, f1_local0, nil, -1, nil, nil, nil ) )
		Streaming.RequestWeaponViewModels( {
			f1_local3
		}, f1_arg1 )
		FrontEndScene.SetWeaponModel( 0, f1_local3, true )
		ClientWeapon.SetWeaponIsViewModel( 0, true )
		ClientWeapon.SetWeaponRotation( 0, 0, 0, 0 )
	else
		ACTIONS.AnimateSequence( f1_arg0, "NoStats" )
	end
end

function CPCombatRecordWeaponHighlight( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1200 * _1080p, 0, 825 * _1080p )
	self.id = "CPCombatRecordWeaponHighlight"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local CardNameBacking = nil
	
	CardNameBacking = LUI.UIImage.new()
	CardNameBacking.id = "CardNameBacking"
	CardNameBacking:SetRGBFromInt( 0, 0 )
	CardNameBacking:SetAlpha( 0.5, 0 )
	CardNameBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 93, _1080p * 1593, _1080p * 50, _1080p * 150 )
	self:addElement( CardNameBacking )
	self.CardNameBacking = CardNameBacking
	
	local CardNameBackingLeftBar = nil
	
	CardNameBackingLeftBar = LUI.UIImage.new()
	CardNameBackingLeftBar.id = "CardNameBackingLeftBar"
	CardNameBackingLeftBar:SetAlpha( 0.5, 0 )
	CardNameBackingLeftBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 85, _1080p * 93, _1080p * 50, _1080p * 150 )
	self:addElement( CardNameBackingLeftBar )
	self.CardNameBackingLeftBar = CardNameBackingLeftBar
	
	local TitleBacking = nil
	
	TitleBacking = LUI.UIImage.new()
	TitleBacking.id = "TitleBacking"
	TitleBacking:SetRGBFromTable( SWATCHES.genericMenu.breadcrumbs, 0 )
	TitleBacking:SetAlpha( 0.35, 0 )
	TitleBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 85, _1080p * 1585, _1080p * 15, _1080p * 50 )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local DeadliestWeaponLabel = nil
	
	DeadliestWeaponLabel = LUI.UIStyledText.new()
	DeadliestWeaponLabel.id = "DeadliestWeaponLabel"
	DeadliestWeaponLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZM_DEADLIEST_WEAPON" ) ), 0 )
	DeadliestWeaponLabel:SetFontSize( 34 * _1080p )
	DeadliestWeaponLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	DeadliestWeaponLabel:SetAlignment( LUI.Alignment.Left )
	DeadliestWeaponLabel:SetOptOutRightToLeftAlignmentFlip( true )
	DeadliestWeaponLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 105, _1080p * 1200, _1080p * 16, _1080p * 50 )
	self:addElement( DeadliestWeaponLabel )
	self.DeadliestWeaponLabel = DeadliestWeaponLabel
	
	local WeaponNameTitle = nil
	
	WeaponNameTitle = LUI.UIStyledText.new()
	WeaponNameTitle.id = "WeaponNameTitle"
	WeaponNameTitle:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	WeaponNameTitle:setText( "WEAPON NAME", 0 )
	WeaponNameTitle:SetFontSize( 60 * _1080p )
	WeaponNameTitle:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	WeaponNameTitle:SetAlignment( LUI.Alignment.Left )
	WeaponNameTitle:SetOptOutRightToLeftAlignmentFlip( true )
	WeaponNameTitle:SetStartupDelay( 1000 )
	WeaponNameTitle:SetLineHoldTime( 400 )
	WeaponNameTitle:SetAnimMoveTime( 150 )
	WeaponNameTitle:SetEndDelay( 1000 )
	WeaponNameTitle:SetCrossfadeTime( 400 )
	WeaponNameTitle:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	WeaponNameTitle:SetMaxVisibleLines( 1 )
	WeaponNameTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 120, _1080p * 587, _1080p * 73, _1080p * 133 )
	self:addElement( WeaponNameTitle )
	self.WeaponNameTitle = WeaponNameTitle
	
	local f2_local8 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f2_local8 = MenuBuilder.BuildRegisteredType( "QualityIcon", {
			controllerIndex = f2_local1
		} )
		f2_local8.id = "QualityIcon"
		f2_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 116, _1080p * 148, _1080p * 166, _1080p * 198 )
		self:addElement( f2_local8 )
		self.QualityIcon = f2_local8
	end
	local f2_local9 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f2_local9 = LUI.UIStyledText.new()
		f2_local9.id = "Quality"
		f2_local9:SetFontSize( 32 * _1080p )
		f2_local9:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f2_local9:SetAlignment( LUI.Alignment.Left )
		f2_local9:SetOptOutRightToLeftAlignmentFlip( true )
		f2_local9:SetDecodeLetterLength( 20 )
		f2_local9:SetDecodeMaxRandChars( 6 )
		f2_local9:SetDecodeUpdatesPerLetter( 4 )
		f2_local9:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 153, _1080p * -706, _1080p * 166, _1080p * 198 )
		f2_local9:SubscribeToModelThroughElement( self, "DataSources.frontEnd.MP.CAC.loadoutSelectHeaderArchetype.qualityString", function ()
			local f3_local0 = self:GetDataSource()
			f3_local0 = f3_local0.DataSources.frontEnd.MP.CAC.loadoutSelectHeaderArchetype.qualityString:GetValue( f2_local1 )
			if f3_local0 ~= nil then
				f2_local9:setText( ToUpperCase( f3_local0 ), 0 )
			end
		end )
		self:addElement( f2_local9 )
		self.Quality = f2_local9
	end
	local Attachments = nil
	
	Attachments = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 6,
		maxVisibleRows = 1,
		controllerIndex = f2_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "WeaponAttachmentButton", {
				controllerIndex = f2_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 160,
		rowHeight = _1080p * 120,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Attachments.id = "Attachments"
	Attachments:SetAlpha( 0.8, 0 )
	Attachments:setUseStencil( true )
	Attachments:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 85, _1080p * 1045, _1080p * 691, _1080p * 811 )
	self:addElement( Attachments )
	self.Attachments = Attachments
	
	local KillsStat = nil
	
	KillsStat = MenuBuilder.BuildRegisteredType( "CPCombatRecordStat", {
		controllerIndex = f2_local1
	} )
	KillsStat.id = "KillsStat"
	KillsStat.AmountLabel:setText( "0", 0 )
	KillsStat.Label:setText( ToUpperCase( Engine.Localize( "MENU_KILLS" ) ), 0 )
	KillsStat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 708, _1080p * 908, _1080p * 41, _1080p * 141 )
	self:addElement( KillsStat )
	self.KillsStat = KillsStat
	
	local WeaponRotator = nil
	
	WeaponRotator = MenuBuilder.BuildRegisteredType( "WeaponRotator", {
		controllerIndex = f2_local1
	} )
	WeaponRotator.id = "WeaponRotator"
	WeaponRotator:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 50, _1080p * -50, _1080p * 200, _1080p * -150 )
	self:addElement( WeaponRotator )
	self.WeaponRotator = WeaponRotator
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CardNameBacking:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.CardNameBacking:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.CardNameBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 85, _1080p * 1585, _1080p * 50, _1080p * 150, 0 )
				end
			}
		} )
		CardNameBackingLeftBar:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.CardNameBackingLeftBar:SetAlpha( 0, 0 )
				end
			}
		} )
		TitleBacking:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.TitleBacking:SetAlpha( 0, 0 )
				end
			}
		} )
		DeadliestWeaponLabel:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.DeadliestWeaponLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		WeaponNameTitle:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.WeaponNameTitle:SetAlpha( 0, 0 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f2_local8:RegisterAnimationSequence( "NoStats", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f2_local9:RegisterAnimationSequence( "NoStats", {
				{
					function ()
						return self.Quality:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		Attachments:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.Attachments:SetAlpha( 0, 0 )
				end
			}
		} )
		KillsStat:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.KillsStat:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NoStats = function ()
			CardNameBacking:AnimateSequence( "NoStats" )
			CardNameBackingLeftBar:AnimateSequence( "NoStats" )
			TitleBacking:AnimateSequence( "NoStats" )
			DeadliestWeaponLabel:AnimateSequence( "NoStats" )
			WeaponNameTitle:AnimateSequence( "NoStats" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f2_local8:AnimateSequence( "NoStats" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f2_local9:AnimateSequence( "NoStats" )
			end
			Attachments:AnimateSequence( "NoStats" )
			KillsStat:AnimateSequence( "NoStats" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f2_local8:SubscribeToModelThroughElement( self, "DataSources.frontEnd.MP.CAC.loadoutSelectHeaderArchetype.quality", function ()
			local f18_local0 = self:GetDataSource()
			if f18_local0.DataSources.frontEnd.MP.CAC.loadoutSelectHeaderArchetype.quality:GetValue( f2_local1 ) ~= nil then
				f18_local0 = self:GetDataSource()
				if f18_local0.DataSources.frontEnd.MP.CAC.loadoutSelectHeaderArchetype.quality:GetValue( f2_local1 ) == 0 then
					ACTIONS.AnimateSequence( self, "HideQuality" )
				end
			end
			f18_local0 = self:GetDataSource()
			if f18_local0.DataSources.frontEnd.MP.CAC.loadoutSelectHeaderArchetype.quality:GetValue( f2_local1 ) ~= nil then
				f18_local0 = self:GetDataSource()
				if f18_local0.DataSources.frontEnd.MP.CAC.loadoutSelectHeaderArchetype.quality:GetValue( f2_local1 ) ~= 0 then
					ACTIONS.AnimateSequence( self, "ShowQuality" )
				end
			end
		end )
		f2_local8:SubscribeToModelThroughElement( self, "DataSources.frontEnd.MP.CAC.loadoutSelectHeaderArchetype.qualityImage", function ()
			local f19_local0 = self:GetDataSource()
			if f19_local0.DataSources.frontEnd.MP.CAC.loadoutSelectHeaderArchetype.qualityImage:GetValue( f2_local1 ) ~= nil then
				f19_local0 = self:GetDataSource()
				if f19_local0.DataSources.frontEnd.MP.CAC.loadoutSelectHeaderArchetype.qualityImage:GetValue( f2_local1 ) == "icon_item_quality_3" then
					ACTIONS.AnimateSequenceByElement( self, {
						elementName = "QualityIcon",
						sequenceName = "LegendaryShine",
						elementPath = "QualityIcon"
					} )
				end
			end
			f19_local0 = self:GetDataSource()
			if f19_local0.DataSources.frontEnd.MP.CAC.loadoutSelectHeaderArchetype.qualityImage:GetValue( f2_local1 ) ~= nil then
				f19_local0 = self:GetDataSource()
				if f19_local0.DataSources.frontEnd.MP.CAC.loadoutSelectHeaderArchetype.qualityImage:GetValue( f2_local1 ) ~= "icon_item_quality_3" then
					ACTIONS.AnimateSequenceByElement( self, {
						elementName = "QualityIcon",
						sequenceName = "StopShine",
						elementPath = "QualityIcon"
					} )
				end
			end
		end )
	end
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "KillsStat",
		sequenceName = "CondensedIcon",
		elementPath = "KillsStat"
	} )
	return self
end

MenuBuilder.registerType( "CPCombatRecordWeaponHighlight", CPCombatRecordWeaponHighlight )
LockTable( _M )
