local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PreLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	Challenge.PopuplateCategoryInfo( f1_arg1 )
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	if Engine.IsAliensMode() then
		f2_arg0:SetDataSource( DataSources.alwaysLoaded.playerData.CP, f2_arg1 )
	else
		f2_arg0:SetDataSource( DataSources.alwaysLoaded.playerData.MP.ranked, f2_arg1 )
	end
	f2_arg0:SubscribeToDataSourceThroughElement( f2_arg0.MenuGridLayout, nil, function ()
		local f3_local0 = f2_arg0.MenuGridLayout:GetDataSource()
		f2_arg0.UnlockCriteria.UnlockDesc:setText( Challenge.GetLocalizedUnlockString( f3_local0.ref:GetValue( f2_arg1 ) ), 0 )
		if f3_local0.isUnlocked ~= nil and f3_local0.isUnlocked:GetValue( f2_arg1 ) then
			ACTIONS.AnimateSequence( f2_arg0, "Unlocked" )
		else
			ACTIONS.AnimateSequence( f2_arg0, "Locked" )
		end
		f2_arg0.NearCompletedChallengesGridLayout:SetGridDataSource( f3_local0.topChallenges, f2_arg1 )
	end )
end

function HeadquartersChallenges( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 800 * _1080p )
	self.id = "HeadquartersChallenges"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	PreLoadFunc( self, f4_local1, controller )
	local f4_local2 = self
	local MainBG = nil
	
	MainBG = LUI.UIImage.new()
	MainBG.id = "MainBG"
	MainBG:SetAlpha( 0, 0 )
	MainBG:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -15, _1080p * -165, _1080p * 20, _1080p * -60 )
	self:addElement( MainBG )
	self.MainBG = MainBG
	
	local MenuGridLayout = nil
	
	MenuGridLayout = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 7,
		controllerIndex = f4_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ChallengeCategoryButton", {
				controllerIndex = f4_local1
			} )
		end,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 12,
		spacingY = _1080p * 12,
		columnWidth = _1080p * 700,
		rowHeight = _1080p * 85,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	MenuGridLayout.id = "MenuGridLayout"
	MenuGridLayout:setUseStencil( false )
	MenuGridLayout:SetGridDataSource( DataSources.frontEnd.MP.challengeCategories, f4_local1 )
	MenuGridLayout:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 700, _1080p * 46, _1080p * 713 )
	self:addElement( MenuGridLayout )
	self.MenuGridLayout = MenuGridLayout
	
	local NearCompletedChallengesGridLayout = nil
	
	NearCompletedChallengesGridLayout = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 3,
		controllerIndex = f4_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ChallengeNearCompletedPanel", {
				controllerIndex = f4_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 950,
		rowHeight = _1080p * 190,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	NearCompletedChallengesGridLayout.id = "NearCompletedChallengesGridLayout"
	NearCompletedChallengesGridLayout:setUseStencil( true )
	NearCompletedChallengesGridLayout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 789, _1080p * 1739, _1080p * 85, _1080p * 695 )
	self:addElement( NearCompletedChallengesGridLayout )
	self.NearCompletedChallengesGridLayout = NearCompletedChallengesGridLayout
	
	local ChallengeHeaderBG = nil
	
	ChallengeHeaderBG = LUI.UIImage.new()
	ChallengeHeaderBG.id = "ChallengeHeaderBG"
	ChallengeHeaderBG:SetRGBFromInt( 0, 0 )
	ChallengeHeaderBG:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1132, _1080p * -180, _1080p * 28, _1080p * 68 )
	self:addElement( ChallengeHeaderBG )
	self.ChallengeHeaderBG = ChallengeHeaderBG
	
	local NearCompletionChallenges = nil
	
	NearCompletionChallenges = LUI.UIText.new()
	NearCompletionChallenges.id = "NearCompletionChallenges"
	NearCompletionChallenges:SetAlpha( 0.7, 0 )
	NearCompletionChallenges:setText( Engine.Localize( "MENU_IN_PROGRESS" ), 0 )
	NearCompletionChallenges:SetFontSize( 22 * _1080p )
	NearCompletionChallenges:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	NearCompletionChallenges:SetAlignment( LUI.Alignment.Left )
	NearCompletionChallenges:SetOptOutRightToLeftAlignmentFlip( true )
	NearCompletionChallenges:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 812, _1080p * 1312, _1080p * 37, _1080p * 59 )
	self:addElement( NearCompletionChallenges )
	self.NearCompletionChallenges = NearCompletionChallenges
	
	local Category = nil
	
	Category = LUI.UIText.new()
	Category.id = "Category"
	Category:SetFontSize( 22 * _1080p )
	Category:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Category:SetAlignment( LUI.Alignment.Right )
	Category:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1208, _1080p * 1708, _1080p * 37, _1080p * 59 )
	Category:SubscribeToModelThroughElement( MenuGridLayout, "name", function ()
		local f7_local0 = MenuGridLayout:GetDataSource()
		f7_local0 = f7_local0.name:GetValue( f4_local1 )
		if f7_local0 ~= nil then
			Category:setText( ToUpperCase( f7_local0 ), 0 )
		end
	end )
	self:addElement( Category )
	self.Category = Category
	
	local UnlockCriteria = nil
	
	UnlockCriteria = MenuBuilder.BuildRegisteredType( "UnlockCriteria", {
		controllerIndex = f4_local1
	} )
	UnlockCriteria.id = "UnlockCriteria"
	UnlockCriteria:SetAlpha( 0, 0 )
	UnlockCriteria.UnlockDesc:setText( "Unlocked At #", 0 )
	UnlockCriteria:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1108, _1080p * -765, _1080p * 85.5, _1080p * 117.5 )
	self:addElement( UnlockCriteria )
	self.UnlockCriteria = UnlockCriteria
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MainBG:RegisterAnimationSequence( "DefaultCP", {
			{
				function ()
					return self.MainBG:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.MainBG:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.DefaultCP = function ()
			MainBG:AnimateSequence( "DefaultCP" )
		end
		
		NearCompletedChallengesGridLayout:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.NearCompletedChallengesGridLayout:SetAlpha( 0, 0 )
				end
			}
		} )
		UnlockCriteria:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.Locked = function ()
			NearCompletedChallengesGridLayout:AnimateSequence( "Locked" )
			UnlockCriteria:AnimateSequence( "Locked" )
		end
		
		NearCompletedChallengesGridLayout:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.NearCompletedChallengesGridLayout:SetAlpha( 1, 0 )
				end
			}
		} )
		UnlockCriteria:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			NearCompletedChallengesGridLayout:AnimateSequence( "Unlocked" )
			UnlockCriteria:AnimateSequence( "Unlocked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f4_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "DefaultCP" )
	end
	return self
end

MenuBuilder.registerType( "HeadquartersChallenges", HeadquartersChallenges )
LockTable( _M )
