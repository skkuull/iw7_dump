local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = SWATCHES.genericMenu.blackBackground
f0_local1 = SWATCHES.genericButton.textFocus
f0_local2 = SWATCHES.genericButton.highlight
local f0_local3 = function ( f1_arg0 )
	if f1_arg0._over then
		ACTIONS.AnimateSequence( f1_arg0, "ButtonOver" )
	elseif f1_arg0._data and f1_arg0._data.isMyPlayer then
		ACTIONS.AnimateSequence( f1_arg0, "PlayerUp" )
	else
		ACTIONS.AnimateSequence( f1_arg0, "ButtonUp" )
	end
end

local f0_local4 = function ( f2_arg0, f2_arg1, f2_arg2 )
	if f2_arg0._extraColumnsList then
		f2_arg0._extraColumnsList:closeTree()
		f2_arg0._extraColumnsList = nil
	end
	assert( f2_arg2 )
	assert( Leaderboards.Boards[f2_arg2] ~= nil )
	local f2_local0 = Leaderboards.Boards[f2_arg2].extraColumns
	local f2_local1 = #f2_local0
	if f2_local1 <= 0 then
		return 
	end
	local f2_local2, f2_local3, f2_local4, f2_local5 = f2_arg0:getLocalRect()
	local f2_local6 = f2_local4 - f2_local2
	local f2_local7 = 0
	local f2_local8, f2_local9, f2_local10, f2_local11 = f2_arg0.Position:getLocalRect()
	f2_local7 = f2_local7 + f2_local10 - f2_local8
	local f2_local12, f2_local13, f2_local14, f2_local15 = f2_arg0.Rank:getLocalRect()
	f2_local11 = f2_local15
	f2_local10 = f2_local14
	f2_local11 = f2_local13
	f2_local7 = f2_local7 + f2_local10 - f2_local12
	f2_local12, f2_local13, f2_local14, f2_local15 = f2_arg0.Name:getLocalRect()
	f2_local11 = f2_local15
	f2_local10 = f2_local14
	f2_local11 = f2_local13
	f2_local7 = f2_local7 + f2_local10 - f2_local12
	f2_arg0._extraColumnsList = LUI.UIHorizontalStackedLayout.new()
	f2_arg0._extraColumnsList:SetAnchorsAndPosition( 0, 0, 0, 0, f2_local7, 0, 0, 0 )
	f2_arg0._extraColumnsList.id = "extraColumnsList"
	f2_arg0:addElement( f2_arg0._extraColumnsList )
	for f2_local12 = 1, f2_local1, 1 do
		local f2_local16 = MenuBuilder.BuildRegisteredType( "LeaderboardTextField", {
			controllerIndex = f2_arg1
		} )
		f2_local16.id = "extraColumn" .. f2_local12
		f2_local16:SetAnchorsAndPosition( (f2_local12 - 1) / f2_local1, 1 - f2_local12 / f2_local1, 0, 0, 0, 0, 0, 0 )
		f2_local16:addEventHandler( "button_up", function ( f3_arg0, f3_arg1 )
			f2_local16.Field:SetRGBFromTable( f0_local1 )
		end )
		f2_local16:addEventHandler( "button_over", function ( f4_arg0, f4_arg1 )
			f2_local16.Field:SetRGBFromTable( f0_local0 )
		end )
		f2_local16.columnKey = f2_local0[f2_local12].key
		f2_arg0._extraColumnsList:addElement( f2_local16 )
	end
end

local f0_local5 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
	if f5_arg0._leaderboard ~= f5_arg2 then
		f5_arg0:CreateExtraColumns( f5_arg1, f5_arg2 )
		f5_arg0._leaderboard = f5_arg2
	end
	assert( f5_arg3 )
	f5_arg0._data = f5_arg3
	f5_arg0.Name.Field:setText( "" )
	f5_arg0.Position.Field:setText( "" )
	f5_arg0.Rank.RankDisplay:setText( "" )
	f5_arg0.Rank.RankIcon:SetAlpha( 0 )
	local f5_local0 = f5_arg0._extraColumnsList:getFirstChild()
	while f5_local0 do
		f5_local0.Field:setText( "" )
		f5_local0 = f5_local0:getNextSibling()
	end
	if not f5_arg0._data.Gamertag or #f5_arg0._data.Gamertag == 0 then
		f5_arg0._data.Gamertag = f5_arg0._data["Gamer Name"]
	end
	local f5_local1 = f5_arg0._data.Gamertag
	if f5_local1 then
		f5_local1 = #f5_arg0._data.Gamertag > 0
	end
	if not f5_local1 then
		if not f5_arg0._spinner then
			f5_arg0._spinner = MenuBuilder.BuildRegisteredType( "Spinner" )
			f5_arg0._spinner:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 20, 36, -8, 8 )
			f5_arg0:addElement( f5_arg0._spinner )
		end
		return 
	elseif f5_arg0._spinner then
		f5_arg0._spinner:closeTree()
		f5_arg0._spinner = nil
	end
	for f5_local5, f5_local6 in pairs( f5_arg0._data ) do
		if f5_local5 == "Gamer Name" or f5_local5 == "Gamertag" then
			if Engine.IsPC() then
				f5_arg0.Name.Field:setText( Engine.TruncateToGlyphCount( f5_local6, 16 ) )
			else
				f5_arg0.Name.Field:setText( f5_local6 )
				goto basicblock_30:
			end
		end
		if f5_local5 == "Rank" then
			f5_arg0.Position.Field:setText( f5_local6 )
		end
		if f5_local5 == "Total XP" then
			f5_arg0.Rank.RankDisplay:setText( f5_local6 )
		end
		if f5_local5 == "Prestige Level" then
			f5_arg0.Rank.RankIcon:SetAlpha( 1 )
			f5_arg0.Rank.RankIcon:setImage( RegisterMaterial( f5_local6 ) )
		end
	end
	f5_local2 = f5_arg0._extraColumnsList:getFirstChild()
	while f5_local2 do
		assert( f5_local2.columnKey )
		f5_local3 = f5_arg0._data[f5_local2.columnKey]
		if f5_local3 then
			f5_local2.Field:setText( f5_local3 )
		end
		f5_local2 = f5_local2:getNextSibling()
	end
	f0_local3( f5_arg0 )
end

local f0_local6 = function ( f6_arg0, f6_arg1, f6_arg2 )
	assert( f6_arg0.Position )
	assert( f6_arg0.Rank )
	assert( f6_arg0.Rank.RankIcon )
	assert( f6_arg0.Name )
	f6_arg0.Populate = f0_local5
	f6_arg0.CreateExtraColumns = f0_local4
	f6_arg0:addEventHandler( "button_over", function ( f7_arg0, f7_arg1 )
		f7_arg0._over = true
		f0_local3( f7_arg0 )
	end )
	f6_arg0:addEventHandler( "button_up", function ( f8_arg0, f8_arg1 )
		f8_arg0._over = false
		f0_local3( f8_arg0 )
	end )
end

function LeaderboardRow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1200 * _1080p, 0, 39 * _1080p )
	self.id = "LeaderboardRow"
	self._animationSets = {}
	self._sequences = {}
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	local f9_local2 = self
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetBlurStrength( 1.5, 0 )
	ListBlur:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -1 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -1 )
	self:addElement( Background )
	self.Background = Background
	
	local HighlightBar = nil
	
	HighlightBar = LUI.UIImage.new()
	HighlightBar.id = "HighlightBar"
	HighlightBar:SetRGBFromInt( 8421504, 0 )
	HighlightBar:SetAlpha( 0, 0 )
	HighlightBar:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 6, 0, _1080p * 39, 0 )
	self:addElement( HighlightBar )
	self.HighlightBar = HighlightBar
	
	local RowTint = nil
	
	RowTint = LUI.UIImage.new()
	RowTint.id = "RowTint"
	RowTint:SetRGBFromInt( 0, 0 )
	RowTint:SetAlpha( 0.15, 0 )
	RowTint:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -1 )
	self:addElement( RowTint )
	self.RowTint = RowTint
	
	local Cap = nil
	
	Cap = LUI.UIImage.new()
	Cap.id = "Cap"
	Cap:SetRGBFromInt( 14277081, 0 )
	Cap:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 6, 0, _1080p * -1 )
	self:addElement( Cap )
	self.Cap = Cap
	
	local f9_local8 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f9_local8 = LUI.UIImage.new()
		f9_local8.id = "CPBackground"
		f9_local8:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
		f9_local8:SetAlpha( 0, 0 )
		f9_local8:setImage( RegisterMaterial( "cp_main_button_background" ), 0 )
		f9_local8:SetBlendMode( BLEND_MODE.addWithAlpha )
		f9_local8:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -53, _1080p * 10, _1080p * -8, _1080p * 8 )
		self:addElement( f9_local8 )
		self.CPBackground = f9_local8
	end
	local f9_local9 = nil
	if CONDITIONS.IsThirdGameMode( self ) then
		f9_local9 = LUI.UIImage.new()
		f9_local9.id = "CPBackgroundGlow"
		f9_local9:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
		f9_local9:SetAlpha( 0, 0 )
		f9_local9:setImage( RegisterMaterial( "cp_main_button_glow" ), 0 )
		f9_local9:SetBlendMode( BLEND_MODE.addWithAlpha )
		f9_local9:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -16, _1080p * 38, 0, _1080p * -1 )
		self:addElement( f9_local9 )
		self.CPBackgroundGlow = f9_local9
	end
	local Position = nil
	
	Position = MenuBuilder.BuildRegisteredType( "LeaderboardTextField", {
		controllerIndex = f9_local1
	} )
	Position.id = "Position"
	Position.Field:setText( "", 0 )
	Position.Field:SetAlignment( LUI.Alignment.Left )
	Position:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 13, _1080p * 139, 0, _1080p * -1 )
	self:addElement( Position )
	self.Position = Position
	
	local Rank = nil
	
	Rank = MenuBuilder.BuildRegisteredType( "LeaderboardRankField", {
		controllerIndex = f9_local1
	} )
	Rank.id = "Rank"
	Rank.ColumnTint:SetAlpha( 0, 0 )
	Rank.RankDisplay:setText( "", 0 )
	Rank:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 139, _1080p * 248, 0, _1080p * -1 )
	self:addElement( Rank )
	self.Rank = Rank
	
	local Name = nil
	
	Name = MenuBuilder.BuildRegisteredType( "LeaderboardTextField", {
		controllerIndex = f9_local1
	} )
	Name.id = "Name"
	Name:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
	Name.Field:setText( "", 0 )
	Name.Field:SetAlignment( LUI.Alignment.Left )
	Name:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 248, _1080p * 549, 0, _1080p * -1 )
	self:addElement( Name )
	self.Name = Name
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f9_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -1 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	self._animationSets.DefaultAnimationSet = function ()
		Position:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Position:SetAlpha( 1, 0 )
				end
			}
		} )
		Rank:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Rank:SetAlpha( 1, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Name:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Position:AnimateSequence( "DefaultSequence" )
			Rank:AnimateSequence( "DefaultSequence" )
			Name:AnimateSequence( "DefaultSequence" )
		end
		
		Position:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Position:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Position:AnimateSequence( "ButtonOver" )
			Name:AnimateSequence( "ButtonOver" )
		end
		
		Position:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Position:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		Rank:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Rank:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Name:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Position:AnimateSequence( "ButtonUp" )
			Rank:AnimateSequence( "ButtonUp" )
			Name:AnimateSequence( "ButtonUp" )
		end
		
		Position:RegisterAnimationSequence( "PlayerUp", {
			{
				function ()
					return self.Position:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		Rank:RegisterAnimationSequence( "PlayerUp", {
			{
				function ()
					return self.Rank:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "PlayerUp", {
			{
				function ()
					return self.Name:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			}
		} )
		self._sequences.PlayerUp = function ()
			Position:AnimateSequence( "PlayerUp" )
			Rank:AnimateSequence( "PlayerUp" )
			Name:AnimateSequence( "PlayerUp" )
		end
		
		Cap:RegisterAnimationSequence( "CPDefault", {
			{
				function ()
					return self.Cap:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 6, _1080p * 3, 0, 0 )
				end
			}
		} )
		self._sequences.CPDefault = function ()
			Cap:AnimateSequence( "CPDefault" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local6( self, f9_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPDefault" )
	end
	return self
end

MenuBuilder.registerType( "LeaderboardRow", LeaderboardRow )
LockTable( _M )
