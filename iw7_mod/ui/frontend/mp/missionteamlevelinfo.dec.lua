local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MissionTeamLevelInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 86 * _1080p )
	self.id = "MissionTeamLevelInfo"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CircleBacker = nil
	
	CircleBacker = LUI.UIImage.new()
	CircleBacker.id = "CircleBacker"
	CircleBacker:SetRGBFromInt( 0, 0 )
	CircleBacker:setImage( RegisterMaterial( "challenges_progress_circle_bg" ), 0 )
	CircleBacker:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 92.4, _1080p * -92.4, _1080p * -14, _1080p * 14 )
	self:addElement( CircleBacker )
	self.CircleBacker = CircleBacker
	
	local ProgressbarBack = nil
	
	ProgressbarBack = LUI.UIImage.new()
	ProgressbarBack.id = "ProgressbarBack"
	ProgressbarBack:SetRGBFromInt( 0, 0 )
	ProgressbarBack:SetAlpha( 0.6, 0 )
	ProgressbarBack:setImage( RegisterMaterial( "wdg_circle_progressbar_back" ), 0 )
	ProgressbarBack:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 91.4, _1080p * -93.4, _1080p * -14, _1080p * 14 )
	self:addElement( ProgressbarBack )
	self.ProgressbarBack = ProgressbarBack
	
	local ProgressbarBackRim = nil
	
	ProgressbarBackRim = LUI.UIImage.new()
	ProgressbarBackRim.id = "ProgressbarBackRim"
	ProgressbarBackRim:SetAlpha( 0.2, 0 )
	ProgressbarBackRim:setImage( RegisterMaterial( "wdg_rewards_progressbar_whole" ), 0 )
	ProgressbarBackRim:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 95.4, _1080p * -97.4, _1080p * -10, _1080p * 10 )
	self:addElement( ProgressbarBackRim )
	self.ProgressbarBackRim = ProgressbarBackRim
	
	local ProgressbarBackCenter = nil
	
	ProgressbarBackCenter = LUI.UIImage.new()
	ProgressbarBackCenter.id = "ProgressbarBackCenter"
	ProgressbarBackCenter:SetAlpha( 0.4, 0 )
	ProgressbarBackCenter:setImage( RegisterMaterial( "wdg_circle_progressbar_back_center" ), 0 )
	ProgressbarBackCenter:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 91.4, _1080p * -93.4, _1080p * -14, _1080p * 14 )
	self:addElement( ProgressbarBackCenter )
	self.ProgressbarBackCenter = ProgressbarBackCenter
	
	local LevelBar = nil
	
	LevelBar = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 2,
		segmentMaterial = "challenges_progress_circle_segment",
		maskMaterial = "dpad_circle_mask",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f1_local1
	} )
	LevelBar.id = "LevelBar"
	LevelBar:setImage( RegisterMaterial( "challenges_progress_circle_segment" ), 0 )
	LevelBar:SetProgress( 0.9 )
	LevelBar:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 86.4, _1080p * -88.4, _1080p * -19, _1080p * 19 )
	self:addElement( LevelBar )
	self.LevelBar = LevelBar
	
	local WeaponLevelLabel = nil
	
	WeaponLevelLabel = LUI.UIText.new()
	WeaponLevelLabel.id = "WeaponLevelLabel"
	WeaponLevelLabel:setText( Engine.Localize( "MENU_LEVEL_CAPS" ), 0 )
	WeaponLevelLabel:SetFontSize( 18 * _1080p )
	WeaponLevelLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	WeaponLevelLabel:SetAlignment( LUI.Alignment.Center )
	WeaponLevelLabel:SetOptOutRightToLeftAlignmentFlip( true )
	WeaponLevelLabel:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 109, _1080p * -111, _1080p * -20, _1080p * -2 )
	self:addElement( WeaponLevelLabel )
	self.WeaponLevelLabel = WeaponLevelLabel
	
	local CurrentLevel = nil
	
	CurrentLevel = LUI.UIText.new()
	CurrentLevel.id = "CurrentLevel"
	CurrentLevel:setText( "", 0 )
	CurrentLevel:SetFontSize( 28 * _1080p )
	CurrentLevel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	CurrentLevel:SetAlignment( LUI.Alignment.Center )
	CurrentLevel:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 119.5, _1080p * -121.5, _1080p * -3, _1080p * 25 )
	self:addElement( CurrentLevel )
	self.CurrentLevel = CurrentLevel
	
	local ProgressNode = nil
	
	ProgressNode = LUI.UIImage.new()
	ProgressNode.id = "ProgressNode"
	ProgressNode:SetAlpha( 0.8, 0 )
	ProgressNode:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 148, _1080p * -150, _1080p * -12, _1080p * -90 )
	self:addElement( ProgressNode )
	self.ProgressNode = ProgressNode
	
	local MaxLevel = nil
	
	MaxLevel = MenuBuilder.BuildRegisteredType( "MaxLevel", {
		controllerIndex = f1_local1
	} )
	MaxLevel.id = "MaxLevel"
	MaxLevel:SetAlpha( 0, 0 )
	MaxLevel:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 111.5, _1080p * -113.5, _1080p * 30, _1080p * -30 )
	self:addElement( MaxLevel )
	self.MaxLevel = MaxLevel
	
	self._animationSets.DefaultAnimationSet = function ()
		LevelBar:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LevelBar:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		WeaponLevelLabel:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.WeaponLevelLabel:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		CurrentLevel:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.CurrentLevel:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			LevelBar:AnimateSequence( "DefaultSequence" )
			WeaponLevelLabel:AnimateSequence( "DefaultSequence" )
			CurrentLevel:AnimateSequence( "DefaultSequence" )
		end
		
		WeaponLevelLabel:RegisterAnimationSequence( "NotMax", {
			{
				function ()
					return self.WeaponLevelLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		CurrentLevel:RegisterAnimationSequence( "NotMax", {
			{
				function ()
					return self.CurrentLevel:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.NotMax = function ()
			WeaponLevelLabel:AnimateSequence( "NotMax" )
			CurrentLevel:AnimateSequence( "NotMax" )
		end
		
		WeaponLevelLabel:RegisterAnimationSequence( "Max", {
			{
				function ()
					return self.WeaponLevelLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		CurrentLevel:RegisterAnimationSequence( "Max", {
			{
				function ()
					return self.CurrentLevel:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Max = function ()
			WeaponLevelLabel:AnimateSequence( "Max" )
			CurrentLevel:AnimateSequence( "Max" )
		end
		
		self._sequences.ReadsRightToLeft = function ()
			
		end
		
		LevelBar:RegisterAnimationSequence( "CommanderRank", {
			{
				function ()
					return self.LevelBar:SetRGBFromTable( SWATCHES.AAR.CommanderRankProgress, 0 )
				end
			}
		} )
		WeaponLevelLabel:RegisterAnimationSequence( "CommanderRank", {
			{
				function ()
					return self.WeaponLevelLabel:SetRGBFromTable( SWATCHES.AAR.CommanderRankProgress, 0 )
				end
			}
		} )
		CurrentLevel:RegisterAnimationSequence( "CommanderRank", {
			{
				function ()
					return self.CurrentLevel:SetRGBFromTable( SWATCHES.AAR.CommanderRankProgress, 0 )
				end
			}
		} )
		self._sequences.CommanderRank = function ()
			LevelBar:AnimateSequence( "CommanderRank" )
			WeaponLevelLabel:AnimateSequence( "CommanderRank" )
			CurrentLevel:AnimateSequence( "CommanderRank" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "DataSources.frontEnd.MP.CAC.levelInfoArchetype.maxLevelAlpha", function ()
		local f18_local0 = self:GetDataSource()
		if f18_local0.DataSources.frontEnd.MP.CAC.levelInfoArchetype.maxLevelAlpha:GetValue( f1_local1 ) ~= nil then
			f18_local0 = self:GetDataSource()
			if f18_local0.DataSources.frontEnd.MP.CAC.levelInfoArchetype.maxLevelAlpha:GetValue( f1_local1 ) == 1 then
				ACTIONS.AnimateSequence( self, "Max" )
			end
		end
		f18_local0 = self:GetDataSource()
		if f18_local0.DataSources.frontEnd.MP.CAC.levelInfoArchetype.maxLevelAlpha:GetValue( f1_local1 ) ~= nil then
			f18_local0 = self:GetDataSource()
			if f18_local0.DataSources.frontEnd.MP.CAC.levelInfoArchetype.maxLevelAlpha:GetValue( f1_local1 ) == 0 then
				ACTIONS.AnimateSequence( self, "NotMax" )
			end
		end
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "MissionTeamLevelInfo", MissionTeamLevelInfo )
LockTable( _M )
