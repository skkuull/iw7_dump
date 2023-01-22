local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg0._extraColumnsList then
		f1_arg0._extraColumnsList:closeTree()
		f1_arg0._extraColumnsList = nil
	end
	assert( f1_arg2 )
	assert( Leaderboards.Boards[f1_arg2] ~= nil )
	local f1_local0 = Leaderboards.Boards[f1_arg2].extraColumns
	local f1_local1 = #f1_local0
	if f1_local1 <= 0 then
		return 
	end
	local f1_local2, f1_local3, f1_local4, f1_local5 = f1_arg0:getLocalRect()
	local f1_local6 = f1_local4 - f1_local2
	local f1_local7 = 0
	local f1_local8, f1_local9, f1_local10, f1_local11 = f1_arg0.Position:getLocalRect()
	f1_local7 = f1_local7 + f1_local10 - f1_local8
	local f1_local12, f1_local13, f1_local14, f1_local15 = f1_arg0.Rank:getLocalRect()
	f1_local11 = f1_local15
	f1_local10 = f1_local14
	f1_local11 = f1_local13
	f1_local7 = f1_local7 + f1_local10 - f1_local12
	f1_local12, f1_local13, f1_local14, f1_local15 = f1_arg0.Name:getLocalRect()
	f1_local11 = f1_local15
	f1_local10 = f1_local14
	f1_local11 = f1_local13
	f1_local7 = f1_local7 + f1_local10 - f1_local12
	f1_arg0._extraColumnsList = LUI.UIHorizontalStackedLayout.new()
	f1_arg0._extraColumnsList:SetAnchorsAndPosition( 0, 0, 0, 0, f1_local7, 0, 0, 0 )
	f1_arg0._extraColumnsList.id = "extraColumnsList"
	f1_arg0:addElement( f1_arg0._extraColumnsList )
	for f1_local12 = 1, f1_local1, 1 do
		local f1_local16 = MenuBuilder.BuildRegisteredType( "LeaderboardTextField", {
			controllerIndex = f1_arg1
		} )
		f1_local16.id = "extraColumn" .. f1_local12
		f1_local16:SetAnchorsAndPosition( (f1_local12 - 1) / f1_local1, 1 - f1_local12 / f1_local1, 0, 0, 0, 0, 0, 0 )
		f1_local16.Field:setText( ToUpperCase( Engine.Localize( f1_local0[f1_local12].title ) ) )
		f1_arg0._extraColumnsList:addElement( f1_local16 )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.Position )
	assert( f2_arg0.Rank )
	assert( f2_arg0.Name )
	f2_arg0.CreateExtraColumns = f0_local0
end

function LeaderboardHeaderRow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1200 * _1080p, 0, 40 * _1080p )
	self.id = "LeaderboardHeaderRow"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetBlurStrength( 1.5, 0 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.8, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Position = nil
	
	Position = MenuBuilder.BuildRegisteredType( "LeaderboardHeaderTextField", {
		controllerIndex = f3_local1
	} )
	Position.id = "Position"
	Position.Field:setText( Engine.Localize( "MENU_POSITION" ), 0 )
	Position.Field:SetAlignment( LUI.Alignment.Left )
	Position:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 13, _1080p * 139, 0, 0 )
	self:addElement( Position )
	self.Position = Position
	
	local Rank = nil
	
	Rank = MenuBuilder.BuildRegisteredType( "LeaderboardHeaderTextField", {
		controllerIndex = f3_local1
	} )
	Rank.id = "Rank"
	Rank.Field:setText( Engine.Localize( "MENU_RANK_CAPS" ), 0 )
	Rank.Field:SetAlignment( LUI.Alignment.Left )
	Rank:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 139, _1080p * 248, 0, 0 )
	self:addElement( Rank )
	self.Rank = Rank
	
	local Name = nil
	
	Name = MenuBuilder.BuildRegisteredType( "LeaderboardHeaderTextField", {
		controllerIndex = f3_local1
	} )
	Name.id = "Name"
	Name.Field:setText( ToUpperCase( Engine.Localize( "MENU_NAME" ) ), 0 )
	Name.Field:SetAlignment( LUI.Alignment.Left )
	Name:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 248, _1080p * 546, 0, 0 )
	self:addElement( Name )
	self.Name = Name
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "CP", {
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.genericButton.border, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 0.7, 0 )
				end
			}
		} )
		self._sequences.CP = function ()
			Background:AnimateSequence( "CP" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CP" )
	end
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "LeaderboardHeaderRow", LeaderboardHeaderRow )
LockTable( _M )
