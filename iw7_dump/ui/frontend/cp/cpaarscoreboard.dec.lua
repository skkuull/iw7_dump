local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = SCOREBOARD.GetScoreboardDataSourceRoot()
	assert( f1_local0 and f1_local0.scoreboard )
	local f1_local1 = f1_local0.scoreboard.numCPPlayers:GetValue( 0 )
	for self = 0, 3, 1 do
		if self < f1_local1 then
			local f1_local5 = "CPScoreboardRow"
			f1_arg0["CPScoreboardRow" .. tostring( self )].updateData( self )
		else
			f1_arg0["CPScoreboardRow" .. tostring( self )]:SetAlpha( 0 )
		end
	end
	if Engine.GetDvarBool( "systemlink" ) or Engine.GetDvarBool( "xblive_privatematch" ) then
		f1_arg0.Name:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -575, _1080p * -200, _1080p * 414, _1080p * 446 )
		f1_arg0.Rank:SetAlpha( 0 )
	end
	if Engine.IsConsoleGame() and not CONDITIONS.IsSystemLink( f1_arg0 ) then
		f1_arg0.addButtonHelperFunction = function ( f2_arg0, f2_arg1 )
			f2_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "PLATFORM_VIEW_GAMER_CARD" ),
				button_ref = "button_start",
				side = "left",
				clickable = true
			} )
		end
		
		f1_arg0:addEventHandler( "menu_create", f1_arg0.addButtonHelperFunction )
		local self = LUI.UIBindButton.new()
		self.id = "selfBindButton"
		f1_arg0:addElement( self )
		f1_arg0.bindButton = self
	end
	if IsLanguageChinese() or IsLanguageJapanese() or IsLanguageKorean() then
		f1_arg0.TimeSurvived:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -828, _1080p * 482, _1080p * 245, _1080p * 300 )
	end
	if not CONDITIONS.IsSplitscreen() then
		f1_arg0:setupLetterboxElement( true )
	end
end

function CPAARScoreboard( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "CPAARScoreboard"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self:playSound( "menu_open" )
	local f3_local2 = self
	self:setUseStencil( true )
	local DiagonalBackground = nil
	
	DiagonalBackground = LUI.UIImage.new()
	DiagonalBackground.id = "DiagonalBackground"
	DiagonalBackground:SetRGBFromTable( SWATCHES.AAR.KillsColor, 0 )
	DiagonalBackground:SetAlpha( 0.4, 0 )
	DiagonalBackground:SetZRotation( -164, 0 )
	DiagonalBackground:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -1448, _1080p * 1464, _1080p * 155, _1080p * 631 )
	self:addElement( DiagonalBackground )
	self.DiagonalBackground = DiagonalBackground
	
	local StatBarBG = nil
	
	StatBarBG = LUI.UIImage.new()
	StatBarBG.id = "StatBarBG"
	StatBarBG:SetRGBFromInt( 0, 0 )
	StatBarBG:SetAlpha( 0.2, 0 )
	StatBarBG:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -800, _1080p * 800, _1080p * 410, _1080p * 450 )
	self:addElement( StatBarBG )
	self.StatBarBG = StatBarBG
	
	local TimeSurvived = nil
	
	TimeSurvived = LUI.UIText.new()
	TimeSurvived.id = "TimeSurvived"
	TimeSurvived:SetFontSize( 55 * _1080p )
	TimeSurvived:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TimeSurvived:SetAlignment( LUI.Alignment.Left )
	TimeSurvived:SetOptOutRightToLeftAlignmentFlip( true )
	TimeSurvived:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -828, _1080p * 482, _1080p * 216, _1080p * 271 )
	TimeSurvived:SubscribeToModel( DataSources.frontEnd.AAR.timeSurvivedText:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.frontEnd.AAR.timeSurvivedText:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			TimeSurvived:setText( ToUpperCase( f4_local0 ), 0 )
		end
	end )
	self:addElement( TimeSurvived )
	self.TimeSurvived = TimeSurvived
	
	local IconDeaths = nil
	
	IconDeaths = LUI.UIImage.new()
	IconDeaths.id = "IconDeaths"
	IconDeaths:setImage( RegisterMaterial( "category_icon_kills" ), 0 )
	IconDeaths:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 95, _1080p * 223, _1080p * 300, _1080p * 428 )
	self:addElement( IconDeaths )
	self.IconDeaths = IconDeaths
	
	local IconRevives = nil
	
	IconRevives = LUI.UIImage.new()
	IconRevives.id = "IconRevives"
	IconRevives:setImage( RegisterMaterial( "category_icon_revives" ), 0 )
	IconRevives:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 461, _1080p * 589, _1080p * 300, _1080p * 428 )
	self:addElement( IconRevives )
	self.IconRevives = IconRevives
	
	local IconDowns = nil
	
	IconDowns = LUI.UIImage.new()
	IconDowns.id = "IconDowns"
	IconDowns:setImage( RegisterMaterial( "category_icon_downs" ), 0 )
	IconDowns:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 644, _1080p * 772, _1080p * 300, _1080p * 428 )
	self:addElement( IconDowns )
	self.IconDowns = IconDowns
	
	local IconKills = nil
	
	IconKills = LUI.UIImage.new()
	IconKills.id = "IconKills"
	IconKills:setImage( RegisterMaterial( "category_icon_headshots" ), 0 )
	IconKills:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 278, _1080p * 406, _1080p * 300, _1080p * 428 )
	self:addElement( IconKills )
	self.IconKills = IconKills
	
	local IconScore = nil
	
	IconScore = LUI.UIImage.new()
	IconScore.id = "IconScore"
	IconScore:setImage( RegisterMaterial( "category_icon_survivors" ), 0 )
	IconScore:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -89, _1080p * 39, _1080p * 300, _1080p * 428 )
	self:addElement( IconScore )
	self.IconScore = IconScore
	
	local CPScoreboardRow0 = nil
	
	CPScoreboardRow0 = MenuBuilder.BuildRegisteredType( "CPScoreboardRow", {
		controllerIndex = f3_local1
	} )
	CPScoreboardRow0.id = "CPScoreboardRow0"
	CPScoreboardRow0.Background:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	CPScoreboardRow0.Background:SetAlpha( 0.5, 0 )
	CPScoreboardRow0.Position:setText( Engine.Localize( "LUA_MENU_1ST" ), 0 )
	CPScoreboardRow0:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -800, _1080p * 800, _1080p * 450, _1080p * 500 )
	self:addElement( CPScoreboardRow0 )
	self.CPScoreboardRow0 = CPScoreboardRow0
	
	local CPScoreboardRow1 = nil
	
	CPScoreboardRow1 = MenuBuilder.BuildRegisteredType( "CPScoreboardRow", {
		controllerIndex = f3_local1
	} )
	CPScoreboardRow1.id = "CPScoreboardRow1"
	CPScoreboardRow1.Background:SetRGBFromInt( 0, 0 )
	CPScoreboardRow1.Position:setText( Engine.Localize( "LUA_MENU_2ND" ), 0 )
	CPScoreboardRow1:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -800, _1080p * 800, _1080p * 500, _1080p * 550 )
	self:addElement( CPScoreboardRow1 )
	self.CPScoreboardRow1 = CPScoreboardRow1
	
	local CPScoreboardRow2 = nil
	
	CPScoreboardRow2 = MenuBuilder.BuildRegisteredType( "CPScoreboardRow", {
		controllerIndex = f3_local1
	} )
	CPScoreboardRow2.id = "CPScoreboardRow2"
	CPScoreboardRow2.Background:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	CPScoreboardRow2.Background:SetAlpha( 0.5, 0 )
	CPScoreboardRow2.Position:setText( Engine.Localize( "LUA_MENU_3RD" ), 0 )
	CPScoreboardRow2:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -800, _1080p * 800, _1080p * 550, _1080p * 600 )
	self:addElement( CPScoreboardRow2 )
	self.CPScoreboardRow2 = CPScoreboardRow2
	
	local CPScoreboardRow3 = nil
	
	CPScoreboardRow3 = MenuBuilder.BuildRegisteredType( "CPScoreboardRow", {
		controllerIndex = f3_local1
	} )
	CPScoreboardRow3.id = "CPScoreboardRow3"
	CPScoreboardRow3.Background:SetRGBFromInt( 0, 0 )
	CPScoreboardRow3.Position:setText( Engine.Localize( "LUA_MENU_4TH" ), 0 )
	CPScoreboardRow3:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -800, _1080p * 800, _1080p * 600, _1080p * 650 )
	self:addElement( CPScoreboardRow3 )
	self.CPScoreboardRow3 = CPScoreboardRow3
	
	local Downs = nil
	
	Downs = LUI.UIText.new()
	Downs.id = "Downs"
	Downs:setText( ToUpperCase( Engine.Localize( "MENU_DOWNS" ) ), 0 )
	Downs:SetFontSize( 32 * _1080p )
	Downs:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Downs:SetAlignment( LUI.Alignment.Center )
	Downs:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 610, _1080p * 810, _1080p * 414, _1080p * 446 )
	self:addElement( Downs )
	self.Downs = Downs
	
	local Revives = nil
	
	Revives = LUI.UIText.new()
	Revives.id = "Revives"
	Revives:setText( ToUpperCase( Engine.Localize( "LUA_MENU_REVIVES" ) ), 0 )
	Revives:SetFontSize( 32 * _1080p )
	Revives:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Revives:SetAlignment( LUI.Alignment.Center )
	Revives:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 425, _1080p * 625, _1080p * 414, _1080p * 446 )
	self:addElement( Revives )
	self.Revives = Revives
	
	local Headshots = nil
	
	Headshots = LUI.UIText.new()
	Headshots.id = "Headshots"
	Headshots:setText( ToUpperCase( Engine.Localize( "LUA_MENU_WEAPPERF_HEADSHOTS" ) ), 0 )
	Headshots:SetFontSize( 32 * _1080p )
	Headshots:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Headshots:SetAlignment( LUI.Alignment.Center )
	Headshots:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 240, _1080p * 440, _1080p * 414, _1080p * 446 )
	self:addElement( Headshots )
	self.Headshots = Headshots
	
	local Kills = nil
	
	Kills = LUI.UIText.new()
	Kills.id = "Kills"
	Kills:setText( ToUpperCase( Engine.Localize( "LUA_MENU_KILLS" ) ), 0 )
	Kills:SetFontSize( 32 * _1080p )
	Kills:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Kills:SetAlignment( LUI.Alignment.Center )
	Kills:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 60, _1080p * 260, _1080p * 414, _1080p * 446 )
	self:addElement( Kills )
	self.Kills = Kills
	
	local Score = nil
	
	Score = LUI.UIText.new()
	Score.id = "Score"
	Score:setText( Engine.Localize( "MENU_SCORE_CAPS" ), 0 )
	Score:SetFontSize( 32 * _1080p )
	Score:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Score:SetAlignment( LUI.Alignment.Center )
	Score:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -125, _1080p * 75, _1080p * 414, _1080p * 446 )
	self:addElement( Score )
	self.Score = Score
	
	local Position = nil
	
	Position = LUI.UIText.new()
	Position.id = "Position"
	Position:setText( Engine.Localize( "MENU_POSITION" ), 0 )
	Position:SetFontSize( 32 * _1080p )
	Position:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Position:SetAlignment( LUI.Alignment.Center )
	Position:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -800, _1080p * -600, _1080p * 414, _1080p * 446 )
	self:addElement( Position )
	self.Position = Position
	
	local Rank = nil
	
	Rank = LUI.UIText.new()
	Rank.id = "Rank"
	Rank:setText( Engine.Localize( "MENU_RANK_CAPS" ), 0 )
	Rank:SetFontSize( 32 * _1080p )
	Rank:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Rank:SetAlignment( LUI.Alignment.Center )
	Rank:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -600, _1080p * -500, _1080p * 414, _1080p * 446 )
	self:addElement( Rank )
	self.Rank = Rank
	
	local Name = nil
	
	Name = LUI.UIText.new()
	Name.id = "Name"
	Name:setText( ToUpperCase( Engine.Localize( "MENU_NAME" ) ), 0 )
	Name:SetFontSize( 32 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Name:SetAlignment( LUI.Alignment.Left )
	Name:SetOptOutRightToLeftAlignmentFlip( true )
	Name:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -450, _1080p * -200, _1080p * 414, _1080p * 446 )
	self:addElement( Name )
	self.Name = Name
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CPAARScoreboard", CPAARScoreboard )
LockTable( _M )
