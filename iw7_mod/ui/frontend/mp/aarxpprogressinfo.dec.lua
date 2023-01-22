local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.AAR.UnlockRewardScreen"
AAR.FillXPBar = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	assert( f1_arg0.progressBar )
	assert( f1_arg0.xpDescLabel )
	local f1_local0 = CoD.GetRankedPlayerDataDataSource()
	local f1_local1 = f1_local0.progression.playerLevel.xp:GetValue( f1_arg1 )
	local f1_local2 = f1_local0.progression.playerLevel.prestige:GetValue( f1_arg1 )
	local f1_local3 = CoD.GetCommonPlayerDataDataSource()
	local f1_local4 = f1_local3.round.matchXp:GetValue( f1_arg1 )
	local f1_local5 = f1_local3.round.challengeXp:GetValue( f1_arg1 )
	local f1_local6 = f1_local3.round.fieldOrderXp:GetValue( f1_arg1 )
	local f1_local7 = f1_local3.round.matchBonusXp:GetValue( f1_arg1 )
	local f1_local8 = f1_local3.round.bonusXp:GetValue( f1_arg1 )
	local f1_local9 = f1_local1 - f1_local3.round.totalXp:GetValue( f1_arg1 )
	local f1_local10 = Rank.GetRankMinXP( f1_arg3 )
	local f1_local11 = Rank.GetRankMaxXP( f1_arg3 )
	local f1_local12 = f1_arg3 + 1
	local f1_local13 = nil
	if f1_local12 < Rank.GetMaxRank() then
		f1_local13 = Rank.GetRankMinXP( f1_local12 ) + 1
	else
		f1_local13 = Rank.GetRankMinXP( Rank.GetMaxRank() )
	end
	f1_arg2.currentProgression.xp:SetValue( f1_arg1, f1_local10 )
	f1_arg2.nextProgression.xp:SetValue( f1_arg1, f1_local13 )
	local f1_local14 = f1_arg0.progressBar.previousXpFill
	local f1_local15 = f1_arg0.progressBar.matchXpFill
	local f1_local16 = f1_arg0.progressBar.challengeXpFill
	local f1_local17 = f1_arg0.progressBar.fieldOrderXpFill
	local f1_local18 = f1_arg0.progressBar.matchBonusXpFill
	local f1_local19 = f1_arg0.progressBar.bonusXpFill
	local f1_local20 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
		f2_arg0:SetAnchors( f2_arg1, f2_arg2, 0, 0, f2_arg3 )
	end
	
	local f1_local21 = 0
	if f1_local10 <= f1_local9 and f1_local9 <= f1_local11 then
		f1_local21 = (f1_local9 - f1_local10) / (f1_local11 - f1_local10)
	end
	local f1_local22 = function ( f3_arg0, f3_arg1, f3_arg2 )
		f1_local20( f3_arg0, 0, 1 - f1_local21, 0 )
		local f3_local0 = 0
		if f1_local10 <= f3_arg1 then
			if f3_arg1 <= f1_local11 then
				f3_local0 = (f3_arg1 - f1_local10) / (f1_local11 - f1_local10)
			else
				f3_local0 = 1
			end
		end
		f1_local20( f3_arg0, 0, 1 - f3_local0, (f3_local0 - f1_local21) * AAR.TIME_TO_FILL_XP_BAR_MS )
		if 0 < f3_local0 - f1_local21 then
			local f3_local1 = f1_arg0:Wait( (f3_local0 - f1_local21) * AAR.TIME_TO_FILL_XP_BAR_MS )
			f3_local1.onComplete = function ()
				f1_arg0.xpDescLabel:setText( f3_arg2 )
			end
			
		else
			f1_arg0.xpDescLabel:setText( f3_arg2 )
		end
	end
	
	local f1_local23 = f1_local9
	f1_local22( f1_local14, f1_local23, "Match XP" )
	f1_local23 = f1_local23 + f1_local4
	f1_local22( f1_local15, f1_local23, "Challenges" )
	f1_local23 = f1_local23 + f1_local5
	f1_local22( f1_local16, f1_local23, "Field Order" )
	f1_local23 = f1_local23 + f1_local6
	f1_local22( f1_local17, f1_local23, "Match Bonus" )
	f1_local23 = f1_local23 + f1_local7
	f1_local22( f1_local18, f1_local23, "Bonus XP" )
	f1_local22( f1_local19, f1_local23 + f1_local8, "" )
	if f1_local11 < f1_local1 and f1_local12 < Rank.GetMaxRank() then
		local f1_local24 = f1_arg0:Wait( (1 - f1_local21) * AAR.TIME_TO_FILL_XP_BAR_MS )
		f1_local24.onComplete = function ()
			AAR.FillXPBar( f1_arg0, f1_arg1, f1_arg2, f1_local12 )
		end
		
	end
end

f0_local1 = function ( f6_arg0 )
	f6_arg0.rank = f6_arg0.xp:Filter( "rank", function ( f7_arg0, f7_arg1 )
		return Engine.GetRankForXP( f7_arg0 )
	end )
	f6_arg0.rankDisplay = f6_arg0.rank:Filter( "display", Rank.RankDisplayFilter )
	local f6_local0 = CoD.GetRankedPlayerDataDataSource()
	f6_arg0.prestige = f6_local0.progression.playerLevel.prestige
	f6_arg0.rankIcon = LUI.AggregateDataSource.new( f6_arg0.rank, {
		f6_arg0.rank,
		f6_arg0.prestige
	}, "icon", Rank.RankIconFilter( f6_arg0 ) )
end

f0_local2 = function ( f8_arg0, f8_arg1, f8_arg2 )
	local f8_local0 = {
		currentProgression = {},
		currentProgression = LUI.DataSourceInControllerModel.new( f0_local0 .. ".currentProgression.xp", 0 )
	}
	f0_local1( f8_local0.currentProgression )
	f8_local0.nextProgression = {}
	f8_local0.nextProgression.xp = LUI.DataSourceInControllerModel.new( f0_local0 .. ".nextProgression.xp", 0 )
	f0_local1( f8_local0.nextProgression )
	local f8_local1 = CoD.GetRankedPlayerDataDataSource()
	f8_local1 = f8_local1.progression.playerLevel.xp:GetValue( f8_arg1 )
	local f8_local2 = CoD.GetCommonPlayerDataDataSource()
	local f8_local3 = Engine.GetRankForXP( f8_local1 - f8_local2.round.totalXp:GetValue( f8_arg1 ) )
	local f8_local4 = Rank.GetRankMaxXP( Engine.GetRankForXP( f8_local1 ) ) - f8_local1
	f8_local0.xpEarned = LUI.DataSourceInControllerModel.new( f0_local0 .. ".xpEarned", f8_local1 )
	f8_local0.xpRequired = LUI.DataSourceInControllerModel.new( f0_local0 .. ".xpRequired", f8_local4 )
	f8_arg0:SetDataSource( f8_local0, f8_arg1 )
	AAR.FillXPBar( f8_arg0, f8_arg1, f8_local0, f8_local3 )
end

function AARXpProgressInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 900 * _1080p, 0, 100 * _1080p )
	self.id = "AARXpProgressInfo"
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	local f9_local2 = self
	local progressBar = nil
	
	progressBar = MenuBuilder.BuildRegisteredType( "AARXpProgressBar", {
		controllerIndex = f9_local1
	} )
	progressBar.id = "progressBar"
	progressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 70, _1080p * 830, _1080p * 10, _1080p * 50 )
	self:addElement( progressBar )
	self.progressBar = progressBar
	
	local currentRank = nil
	
	currentRank = MenuBuilder.BuildRegisteredType( "AARRank", {
		controllerIndex = f9_local1
	} )
	currentRank.id = "currentRank"
	currentRank:SetDataSourceThroughElement( self, "currentProgression" )
	currentRank:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 60, _1080p * 15, _1080p * 45 )
	self:addElement( currentRank )
	self.currentRank = currentRank
	
	local nextRank = nil
	
	nextRank = MenuBuilder.BuildRegisteredType( "AARRank", {
		controllerIndex = f9_local1
	} )
	nextRank.id = "nextRank"
	nextRank:SetDataSourceThroughElement( self, "nextProgression" )
	nextRank:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -60, 0, _1080p * 15, _1080p * 45 )
	self:addElement( nextRank )
	self.nextRank = nextRank
	
	local currentXpLabel = nil
	
	currentXpLabel = LUI.UIText.new()
	currentXpLabel.id = "currentXpLabel"
	currentXpLabel:SetFontSize( 20 * _1080p )
	currentXpLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	currentXpLabel:SetAlignment( LUI.Alignment.Left )
	currentXpLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 70, _1080p * 322, _1080p * 55, _1080p * 75 )
	currentXpLabel:SubscribeToModelThroughElement( self, "xpEarned", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.xpEarned:GetValue( f9_local1 )
		if f10_local0 ~= nil then
			currentXpLabel:setText( LocalizeIntoString( f10_local0, "LUA_MENU_XP_EARNED_PREFIX" ), 0 )
		end
	end )
	self:addElement( currentXpLabel )
	self.currentXpLabel = currentXpLabel
	
	local requiredXpLabel = nil
	
	requiredXpLabel = LUI.UIText.new()
	requiredXpLabel.id = "requiredXpLabel"
	requiredXpLabel:SetFontSize( 20 * _1080p )
	requiredXpLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	requiredXpLabel:SetAlignment( LUI.Alignment.Right )
	requiredXpLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 595.78, _1080p * 830, _1080p * 55, _1080p * 75 )
	requiredXpLabel:SubscribeToModelThroughElement( self, "xpRequired", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.xpRequired:GetValue( f9_local1 )
		if f11_local0 ~= nil then
			requiredXpLabel:setText( LocalizeIntoString( f11_local0, "LUA_MENU_XP_REQUIRED_PREFIX" ), 0 )
		end
	end )
	self:addElement( requiredXpLabel )
	self.requiredXpLabel = requiredXpLabel
	
	local xpDescLabel = nil
	
	xpDescLabel = LUI.UIText.new()
	xpDescLabel.id = "xpDescLabel"
	xpDescLabel:setText( "Challenges", 0 )
	xpDescLabel:SetFontSize( 30 * _1080p )
	xpDescLabel:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	xpDescLabel:SetAlignment( LUI.Alignment.Center )
	xpDescLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 322, _1080p * 595.78, _1080p * 55, _1080p * 85 )
	self:addElement( xpDescLabel )
	self.xpDescLabel = xpDescLabel
	
	currentRank:SetDataSourceThroughElement( self, "currentProgression" )
	nextRank:SetDataSourceThroughElement( self, "nextProgression" )
	f0_local2( self, f9_local1, controller )
	return self
end

MenuBuilder.registerType( "AARXpProgressInfo", AARXpProgressInfo )
LockTable( _M )
