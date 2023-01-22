local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = SCOREBOARD.GetScoreboardDataSourceRoot()
	local f1_local1 = f1_local0.scoreboard.extraColumns
	local f1_local2 = Engine.InFrontend() and 0 or 25 * _1080p
	local f1_local3 = 870 * _1080p - 450 * _1080p - f1_local2
	local f1_local4 = f1_local1:GetCountValue( f1_arg1 )
	local f1_local5 = f1_local3 / f1_local4
	local extraColumnGrid = nil
	local f1_local7 = 9 * _1080p
	
	extraColumnGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = f1_local4,
		maxVisibleRows = 1,
		controllerIndex = f1_arg1,
		buildChild = function ()
			local f2_local0 = MenuBuilder.BuildRegisteredType( "ScoreboardTitleTextField", {
				controllerIndex = f1_arg1
			} )
			f2_local0:SetRight( f1_local5, 0 )
			f2_local0.Field:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
			local f2_local1 = function ()
				local f3_local0 = f2_local0:GetDataSource()
				f3_local0 = f3_local0.value:GetValue( f1_arg1 )
				if f3_local0 ~= nil then
					f2_local0.Field:setText( ToUpperCase( f3_local0 ), 0 )
					if IsLanguageOversizedFont() then
						f2_local0.Field:SetTop( _1080p * -8, 0 )
						f2_local0.Field:SetBottom( _1080p * 7, 0 )
					end
				end
			end
			
			f2_local0:SetRGBFromInt( GetIntForColor( SWATCHES.Scoreboard.text ) )
			f2_local0:SubscribeToModelThroughElement( f2_local0, "value", f2_local1 )
			return f2_local0
		end,
		wrapX = false,
		wrapY = false,
		spacingX = 0,
		spacingY = 0,
		columnWidth = f1_local5,
		rowHeight = _1080p * 60,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	} )
	extraColumnGrid.id = "extraColumnGrid"
	extraColumnGrid:SetAnchorsAndPosition( 1, 0, 0, 0, -(f1_local3 + f1_local2), 0, -f1_local7, -f1_local7, 0 )
	extraColumnGrid:SetGridDataSource( f1_local1 )
	f1_arg0:addElement( extraColumnGrid )
	f1_arg0.extraColumnGrid = extraColumnGrid
	
	if Engine.GetDvarBool( "systemlink" ) or Engine.GetDvarBool( "xblive_privatematch" ) then
		f1_arg0.Rank:SetAlpha( 0 )
	end
	assert( f1_arg0.Name )
	assert( f1_arg0.Rank )
	assert( f1_arg0.Score )
	if IsLanguageOversizedFont() then
		f1_arg0.Name.Field:SetTop( _1080p * -8, 0 )
		f1_arg0.Name.Field:SetBottom( _1080p * 7, 0 )
		f1_arg0.Rank.Field:SetTop( _1080p * -8, 0 )
		f1_arg0.Rank.Field:SetBottom( _1080p * 7, 0 )
		f1_arg0.Score.Field:SetTop( _1080p * -8, 0 )
		f1_arg0.Score.Field:SetBottom( _1080p * 7, 0 )
	end
end

function ScoreboardTitleRow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 858 * _1080p, 0, 20 * _1080p )
	self.id = "ScoreboardTitleRow"
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
	self:addElement( Background )
	self.Background = Background
	
	local Name = nil
	
	Name = MenuBuilder.BuildRegisteredType( "ScoreboardTitleTextField", {
		controllerIndex = f4_local1
	} )
	Name.id = "Name"
	Name.Field:SetTop( _1080p * -9, 0 )
	Name.Field:SetBottom( _1080p * 9, 0 )
	Name.Field:setText( ToUpperCase( Engine.Localize( "PLATFORM_GAMERTAG" ) ), 0 )
	Name.Field:SetAlignment( LUI.Alignment.Center )
	Name:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 80, _1080p * 380, 0, 0 )
	self:addElement( Name )
	self.Name = Name
	
	local Rank = nil
	
	Rank = MenuBuilder.BuildRegisteredType( "ScoreboardTitleTextField", {
		controllerIndex = f4_local1
	} )
	Rank.id = "Rank"
	Rank:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
	Rank.Field:SetTop( _1080p * -9, 0 )
	Rank.Field:SetBottom( _1080p * 9, 0 )
	Rank.Field:setText( ToUpperCase( Engine.Localize( "PLATFORM_RANK" ) ), 0 )
	Rank.Field:SetAlignment( LUI.Alignment.Center )
	Rank:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 80, 0, 0 )
	self:addElement( Rank )
	self.Rank = Rank
	
	local Score = nil
	
	Score = MenuBuilder.BuildRegisteredType( "ScoreboardTitleTextField", {
		controllerIndex = f4_local1
	} )
	Score.id = "Score"
	Score.Field:SetTop( _1080p * -9, 0 )
	Score.Field:SetBottom( _1080p * 9, 0 )
	Score.Field:setText( ToUpperCase( Engine.Localize( "PLATFORM_SCORE" ) ), 0 )
	Score.Field:SetAlignment( LUI.Alignment.Center )
	Score:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 370, _1080p * 450, 0, 0 )
	self:addElement( Score )
	self.Score = Score
	
	local Line = nil
	
	Line = LUI.UIImage.new()
	Line.id = "Line"
	Line:SetRGBFromTable( SWATCHES.genericMenu.frame, 0 )
	Line:SetAlpha( 0.35, 0 )
	Line:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -1, 0 )
	self:addElement( Line )
	self.Line = Line
	
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "ScoreboardTitleRow", ScoreboardTitleRow )
LockTable( _M )
