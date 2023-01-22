local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	ACTIONS.AnimateSequence( f1_arg0, "DefaultSequence" )
	local f1_local0 = f1_arg0:GetDataSource()
	if MLG.GetGameBattleMatchId( f1_arg1 ) == f1_local0.matchId:GetValue( f1_arg1 ) then
		ACTIONS.AnimateSequence( f1_arg0, "Selected" )
	end
end

function PostLoadFunc( f2_arg0, f2_arg1 )
	f2_arg0.Name:SubscribeToModelThroughElement( f2_arg0, "matchId", function ()
		local f3_local0 = f2_arg0:GetDataSource()
		f3_local0 = f3_local0.matchId:GetValue( f2_arg1 )
		if f3_local0 ~= nil then
			f2_arg0.Name:setText( Engine.Localize( "MLG_GAMEBATTLES_MATCH_ID_LABEL" ) .. ": " .. f3_local0, 0 )
			f0_local0( f2_arg0, f2_arg1 )
		end
	end )
	f2_arg0.MatchDate:SubscribeToModelThroughElement( f2_arg0, "matchTime", function ()
		local f4_local0 = f2_arg0:GetDataSource()
		f4_local0 = f4_local0.matchTime:GetValue( f2_arg1 )
		if f4_local0 ~= nil then
			f2_arg0.MatchDate:setText( Engine.GetFormattedDate( f4_local0 ) .. " " .. Engine.GetFormattedTime( f4_local0 ) )
		end
	end )
	f2_arg0.SeriesInfo:SubscribeToModelThroughElement( f2_arg0, "gameCount", function ()
		local f5_local0 = f2_arg0:GetDataSource()
		f5_local0 = f5_local0.gameCount:GetValue( f2_arg1 )
		if f5_local0 ~= nil then
			f2_arg0.SeriesInfo:setText( Engine.Localize( "MLG_GAMEBATTLES_BEST_X_OUT_OF_Y", math.ceil( f5_local0 / 2 ), f5_local0 ) )
		end
	end )
	f2_arg0.UpdateSelectedState = f0_local0
end

function MLGScheduleButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 110 * _1080p )
	self.id = "MLGScheduleButton"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local GenericItemBackground = nil
	
	GenericItemBackground = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
		controllerIndex = f6_local1
	} )
	GenericItemBackground.id = "GenericItemBackground"
	GenericItemBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, 0 )
	self:addElement( GenericItemBackground )
	self.GenericItemBackground = GenericItemBackground
	
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f6_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 24, _1080p * 2 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local TitleBackground = nil
	
	TitleBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f6_local1
	} )
	TitleBackground.id = "TitleBackground"
	TitleBackground.DropShadow:SetAlpha( 0, 0 )
	TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local Name = nil
	
	Name = LUI.UIStyledText.new()
	Name.id = "Name"
	Name:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
	Name:setText( "MatchID : 72848856", 0 )
	Name:SetFontSize( 19 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Name:SetAlignment( LUI.Alignment.Left )
	Name:SetStartupDelay( 2000 )
	Name:SetLineHoldTime( 400 )
	Name:SetAnimMoveTime( 300 )
	Name:SetEndDelay( 1500 )
	Name:SetCrossfadeTime( 750 )
	Name:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Name:SetMaxVisibleLines( 1 )
	Name:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -386, _1080p * -130, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( Name )
	self.Name = Name
	
	local MatchDateBacker = nil
	
	MatchDateBacker = LUI.UIImage.new()
	MatchDateBacker.id = "MatchDateBacker"
	MatchDateBacker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 322, _1080p * 32, _1080p * 37, _1080p * 61 )
	self:addElement( MatchDateBacker )
	self.MatchDateBacker = MatchDateBacker
	
	local MatchDate = nil
	
	MatchDate = LUI.UIText.new()
	MatchDate.id = "MatchDate"
	MatchDate:SetRGBFromInt( 0, 0 )
	MatchDate:setText( "11/30/2016 20:28", 0 )
	MatchDate:SetFontSize( 24 * _1080p )
	MatchDate:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MatchDate:SetAlignment( LUI.Alignment.Left )
	MatchDate:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 38, _1080p * 316, _1080p * 37, _1080p * 61 )
	self:addElement( MatchDate )
	self.MatchDate = MatchDate
	
	local SeriesInfo = nil
	
	SeriesInfo = LUI.UIText.new()
	SeriesInfo.id = "SeriesInfo"
	SeriesInfo:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
	SeriesInfo:setText( "Best of 3", 0 )
	SeriesInfo:SetFontSize( 22 * _1080p )
	SeriesInfo:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	SeriesInfo:SetAlignment( LUI.Alignment.Left )
	SeriesInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 38, _1080p * 322, _1080p * 68, _1080p * 90 )
	self:addElement( SeriesInfo )
	self.SeriesInfo = SeriesInfo
	
	local MatchSelected = nil
	
	MatchSelected = LUI.UIImage.new()
	MatchSelected.id = "MatchSelected"
	MatchSelected:SetAlpha( 0.5, 0 )
	MatchSelected:SetZRotation( 90, 0 )
	MatchSelected:setImage( RegisterMaterial( "solid_triangle" ), 0 )
	MatchSelected:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 356, _1080p * 400, _1080p * 66, _1080p * 110 )
	self:addElement( MatchSelected )
	self.MatchSelected = MatchSelected
	
	local ActiveMatchLabel = nil
	
	ActiveMatchLabel = LUI.UIStyledText.new()
	ActiveMatchLabel.id = "ActiveMatchLabel"
	ActiveMatchLabel:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
	ActiveMatchLabel:setText( Engine.Localize( "MLG_GAMEBATTLES_ACTIVE_MATCH" ), 0 )
	ActiveMatchLabel:SetFontSize( 19 * _1080p )
	ActiveMatchLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ActiveMatchLabel:SetAlignment( LUI.Alignment.Right )
	ActiveMatchLabel:SetStartupDelay( 2000 )
	ActiveMatchLabel:SetLineHoldTime( 400 )
	ActiveMatchLabel:SetAnimMoveTime( 300 )
	ActiveMatchLabel:SetEndDelay( 1500 )
	ActiveMatchLabel:SetCrossfadeTime( 750 )
	ActiveMatchLabel:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	ActiveMatchLabel:SetMaxVisibleLines( 1 )
	ActiveMatchLabel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -130, _1080p * -11, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( ActiveMatchLabel )
	self.ActiveMatchLabel = ActiveMatchLabel
	
	self._animationSets.DefaultAnimationSet = function ()
		MatchSelected:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.MatchSelected:SetAlpha( 0, 0 )
				end
			}
		} )
		ActiveMatchLabel:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ActiveMatchLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			MatchSelected:AnimateSequence( "DefaultSequence" )
			ActiveMatchLabel:AnimateSequence( "DefaultSequence" )
		end
		
		Name:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		ActiveMatchLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.ActiveMatchLabel:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Name:AnimateSequence( "ButtonOver" )
			ActiveMatchLabel:AnimateSequence( "ButtonOver" )
		end
		
		Name:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Name:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
				end
			}
		} )
		ActiveMatchLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.ActiveMatchLabel:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Name:AnimateSequence( "ButtonUp" )
			ActiveMatchLabel:AnimateSequence( "ButtonUp" )
		end
		
		MatchSelected:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.MatchSelected:SetAlpha( 1, 0 )
				end
			}
		} )
		ActiveMatchLabel:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.ActiveMatchLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Selected = function ()
			MatchSelected:AnimateSequence( "Selected" )
			ActiveMatchLabel:AnimateSequence( "Selected" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f21_arg0, f21_arg1 )
		local f21_local0 = f21_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	PostLoadFunc( self, f6_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "MLGScheduleButton", MLGScheduleButton )
LockTable( _M )
