local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.updateData = function ( f2_arg0 )
		local f2_local0 = PostMatch.GetScoreboardRowData( f1_arg1, Teams.allies )
		f2_local0 = f2_local0[f2_arg0]
		f1_arg0.Score:setText( f2_local0.score )
		f1_arg0.Name:setText( f2_local0.name )
		f1_arg0.Kills:setText( f2_local0.kills )
		f1_arg0.Headshots:setText( f2_local0.headShots )
		f1_arg0.Revives:setText( f2_local0.revives )
		f1_arg0.Downs:setText( f2_local0.downs )
		if Engine.GetDvarBool( "systemlink" ) or Engine.GetDvarBool( "xblive_privatematch" ) then
			f1_arg0.RankIcon:SetAlpha( 0 )
			f1_arg0.Name:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -575, _1080p * -200, _1080p * 9, _1080p * 41 )
		else
			local f2_local1 = Rank.GetRankDisplay( f2_local0.rank )
			f1_arg0.RankIcon:setImage( RegisterMaterial( Rank.GetRankIcon( f2_local0.rank, f2_local0.prestige ) ), 0 )
		end
	end
	
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	f1_arg0:addElement( bindButton )
	f1_arg0.bindButton = bindButton
	
	f1_arg0.bindButton:addEventHandler( "button_start", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg0:getParent()
		if #f3_local0:getAllFocusedChildren() <= 0 then
			f3_local0 = f3_arg0:getParent()
			if f3_local0:isInFocus() then
				f3_local0 = SCOREBOARD.IsAARScoreboard()
				if not f3_local0 and f1_arg0._clientNum then
					Game.ShowGamerCard( f1_arg0._clientNum )
				elseif f3_local0 and f1_arg0._xuid then
					Lobby.ShowGamerCardWithXuidString( f1_arg1, f1_arg0._xuid )
				end
				return true
			end
		end
		f3_local0 = SCOREBOARD.IsAARScoreboard()
		if not f3_local0 and f1_arg0._clientNum then
			Game.ShowGamerCard( f1_arg0._clientNum )
		elseif f3_local0 and f1_arg0._xuid then
			Lobby.ShowGamerCardWithXuidString( f1_arg1, f1_arg0._xuid )
		end
		return true
	end )
end

function CPScoreboardRow( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1600 * _1080p, 0, 50 * _1080p )
	self.id = "CPScoreboardRow"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetAlpha( 0.2, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Downs = nil
	
	Downs = LUI.UIText.new()
	Downs.id = "Downs"
	Downs:setText( Engine.Localize( "CP_ZOMBIE_DOWNS_CAPS" ), 0 )
	Downs:SetFontSize( 32 * _1080p )
	Downs:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Downs:SetAlignment( LUI.Alignment.Center )
	Downs:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 610, _1080p * 810, _1080p * 9, _1080p * 41 )
	self:addElement( Downs )
	self.Downs = Downs
	
	local Revives = nil
	
	Revives = LUI.UIText.new()
	Revives.id = "Revives"
	Revives:setText( Engine.Localize( "CP_ZOMBIE_REVIVES_CAPS" ), 0 )
	Revives:SetFontSize( 32 * _1080p )
	Revives:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Revives:SetAlignment( LUI.Alignment.Center )
	Revives:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 425, _1080p * 625, _1080p * 9, _1080p * 41 )
	self:addElement( Revives )
	self.Revives = Revives
	
	local Headshots = nil
	
	Headshots = LUI.UIText.new()
	Headshots.id = "Headshots"
	Headshots:setText( Engine.Localize( "CP_ZOMBIE_HEADSHOTS_CAPS" ), 0 )
	Headshots:SetFontSize( 32 * _1080p )
	Headshots:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Headshots:SetAlignment( LUI.Alignment.Center )
	Headshots:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 240, _1080p * 440, _1080p * 9, _1080p * 41 )
	self:addElement( Headshots )
	self.Headshots = Headshots
	
	local Kills = nil
	
	Kills = LUI.UIText.new()
	Kills.id = "Kills"
	Kills:setText( Engine.Localize( "CP_ZOMBIE_KILLS_CAPS" ), 0 )
	Kills:SetFontSize( 32 * _1080p )
	Kills:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Kills:SetAlignment( LUI.Alignment.Center )
	Kills:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 60, _1080p * 260, _1080p * 9, _1080p * 41 )
	self:addElement( Kills )
	self.Kills = Kills
	
	local Score = nil
	
	Score = LUI.UIText.new()
	Score.id = "Score"
	Score:setText( Engine.Localize( "MENU_SCORE_CAPS" ), 0 )
	Score:SetFontSize( 32 * _1080p )
	Score:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Score:SetAlignment( LUI.Alignment.Center )
	Score:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -125, _1080p * 75, _1080p * 9, _1080p * 41 )
	self:addElement( Score )
	self.Score = Score
	
	local Position = nil
	
	Position = LUI.UIText.new()
	Position.id = "Position"
	Position:setText( Engine.Localize( "MENU_POSITION" ), 0 )
	Position:SetFontSize( 32 * _1080p )
	Position:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Position:SetAlignment( LUI.Alignment.Center )
	Position:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -800, _1080p * -600, _1080p * 9, _1080p * 41 )
	self:addElement( Position )
	self.Position = Position
	
	local Name = nil
	
	Name = LUI.UIText.new()
	Name.id = "Name"
	Name:setText( Engine.Localize( "CP_ZOMBIE_HEADER_NAME_CAPS" ), 0 )
	Name:SetFontSize( 32 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Name:SetAlignment( LUI.Alignment.Left )
	Name:SetOptOutRightToLeftAlignmentFlip( true )
	Name:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -450, 0, _1080p * 9, _1080p * 41 )
	self:addElement( Name )
	self.Name = Name
	
	local RankIcon = nil
	
	RankIcon = LUI.UIImage.new()
	RankIcon.id = "RankIcon"
	RankIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -575, _1080p * -525, 0, 0 )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "CPScoreboardRow", CPScoreboardRow )
LockTable( _M )
