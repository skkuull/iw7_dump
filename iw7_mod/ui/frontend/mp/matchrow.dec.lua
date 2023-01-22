local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.MatchID:SubscribeToModelThroughElement( f1_arg0, "matchId", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.matchId:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			f1_arg0.MatchID.Field:setText( f2_local0, 0 )
		end
	end )
	f1_arg0.MatchID:SubscribeToModelThroughElement( f1_arg0, "matchTime", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		f3_local0 = f3_local0.matchTime:GetValue( f1_arg1 )
		if f3_local0 ~= nil then
			f1_arg0.MatchDate:setText( Engine.GetFormattedDate( f3_local0 ) )
			f1_arg0.MatchTime:setText( Engine.GetFormattedTime( f3_local0 ) )
		end
	end )
end

function MatchRow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1100 * _1080p, 0, 130 * _1080p )
	self.id = "MatchRow"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local RowTint = nil
	
	RowTint = LUI.UIImage.new()
	RowTint.id = "RowTint"
	RowTint:SetRGBFromInt( 0, 0 )
	RowTint:SetAlpha( 0.15, 0 )
	self:addElement( RowTint )
	self.RowTint = RowTint
	
	local MatchID = nil
	
	MatchID = MenuBuilder.BuildRegisteredType( "LeaderboardTextField", {
		controllerIndex = f4_local1
	} )
	MatchID.id = "MatchID"
	MatchID:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
	MatchID.Field:setText( "13371337", 0 )
	MatchID.Field:SetAlignment( LUI.Alignment.Left )
	MatchID:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 200, _1080p * 40, _1080p * 100 )
	self:addElement( MatchID )
	self.MatchID = MatchID
	
	local MatchIDLabel = nil
	
	MatchIDLabel = LUI.UIText.new()
	MatchIDLabel.id = "MatchIDLabel"
	MatchIDLabel:setText( Engine.Localize( "MLG_GAMEBATTLES_MATCH_ID_LABEL" ), 0 )
	MatchIDLabel:SetFontSize( 45 * _1080p )
	MatchIDLabel:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	MatchIDLabel:SetAlignment( LUI.Alignment.Left )
	MatchIDLabel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 200, 0, _1080p * 40 )
	self:addElement( MatchIDLabel )
	self.MatchIDLabel = MatchIDLabel
	
	local MatchNameLabel = nil
	
	MatchNameLabel = LUI.UIText.new()
	MatchNameLabel.id = "MatchNameLabel"
	MatchNameLabel:setText( Engine.Localize( "MLG_GAMEBATTLES_MATCH_NAME_LABEL" ), 0 )
	MatchNameLabel:SetFontSize( 45 * _1080p )
	MatchNameLabel:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	MatchNameLabel:SetAlignment( LUI.Alignment.Left )
	MatchNameLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 200, _1080p * 777, 0, _1080p * 40 )
	self:addElement( MatchNameLabel )
	self.MatchNameLabel = MatchNameLabel
	
	local MatchDateLabel = nil
	
	MatchDateLabel = LUI.UIText.new()
	MatchDateLabel.id = "MatchDateLabel"
	MatchDateLabel:setText( Engine.Localize( "MLG_GAMEBATTLES_MATCH_TIME_LABEL" ), 0 )
	MatchDateLabel:SetFontSize( 45 * _1080p )
	MatchDateLabel:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	MatchDateLabel:SetAlignment( LUI.Alignment.Left )
	MatchDateLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 826, _1080p * 1100, 0, _1080p * 40 )
	self:addElement( MatchDateLabel )
	self.MatchDateLabel = MatchDateLabel
	
	local MatchDate = nil
	
	MatchDate = LUI.UIText.new()
	MatchDate.id = "MatchDate"
	MatchDate:setText( Engine.Localize( "MENU_NEW" ), 0 )
	MatchDate:SetFontSize( 50 * _1080p )
	MatchDate:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	MatchDate:SetAlignment( LUI.Alignment.Left )
	MatchDate:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 826, _1080p * 1100, _1080p * 40, _1080p * 90 )
	self:addElement( MatchDate )
	self.MatchDate = MatchDate
	
	local MatchTime = nil
	
	MatchTime = LUI.UIText.new()
	MatchTime.id = "MatchTime"
	MatchTime:setText( Engine.Localize( "MENU_NEW" ), 0 )
	MatchTime:SetFontSize( 50 * _1080p )
	MatchTime:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	MatchTime:SetAlignment( LUI.Alignment.Left )
	MatchTime:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 826, _1080p * 1100, _1080p * 90, _1080p * 130 )
	self:addElement( MatchTime )
	self.MatchTime = MatchTime
	
	local MatchName = nil
	
	MatchName = LUI.UIText.new()
	MatchName.id = "MatchName"
	MatchName:setText( "3v3 GB Search 1nd 05-07", 0 )
	MatchName:SetFontSize( 50 * _1080p )
	MatchName:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	MatchName:SetAlignment( LUI.Alignment.Left )
	MatchName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 200, _1080p * 777, _1080p * 40, _1080p * 90 )
	self:addElement( MatchName )
	self.MatchName = MatchName
	
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "MatchRow", MatchRow )
LockTable( _M )
