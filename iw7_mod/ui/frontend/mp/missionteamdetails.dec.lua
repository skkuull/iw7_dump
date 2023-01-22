local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToDataSourceThroughElement( f1_arg0, nil, function ()
		local f2_local0 = f1_arg0.MissionTeamXPValue
		local f2_local1 = f2_local0
		f2_local0 = f2_local0.setText
		local f2_local2 = f1_arg0:GetDataSource()
		f2_local0( f2_local1, f2_local2.missionXPToNextLevel:GetValue( f1_arg1 ), 0 )
		f2_local0 = f1_arg0.MissionTeamLevelInfo.LevelBar
		f2_local1 = f2_local0
		f2_local0 = f2_local0.SetProgress
		f2_local2 = f1_arg0:GetDataSource()
		f2_local0( f2_local1, f2_local2.missionXPFillPercent:GetValue( f1_arg1 ) )
		f2_local0 = f1_arg0:GetCurrentMenu()
		assert( f2_local0.ButtonHelperBar )
		f2_local1 = f1_arg0:GetDataSource()
		f2_local1 = not f2_local1.disabled:GetValue( f1_arg1 )
		f2_local2 = f1_arg0:GetDataSource()
		if f2_local1 and MissionDirector.HasEverBeenMember( f2_local2.teamID:GetValue( f1_arg1 ), f1_arg1 ) then
			f1_arg0:AddButtonHelperTextToElement( f2_local0.ButtonHelperBar, {
				helper_text = Engine.Localize( "@LUA_MENU_MP_PLAY_VIDEO" ),
				button_ref = "button_alt1",
				side = "left",
				priority = 20,
				clickable = true
			} )
		else
			f1_arg0:RemoveButtonHelperTextFromElement( f2_local0.ButtonHelperBar, "button_alt1", "left" )
		end
	end )
end

function MissionTeamDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1660 * _1080p, 0, 205 * _1080p )
	self.id = "MissionTeamDetails"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local InfoBG = nil
	
	InfoBG = LUI.UIImage.new()
	InfoBG.id = "InfoBG"
	InfoBG:SetRGBFromInt( 1710618, 0 )
	InfoBG:SetAlpha( 0.8, 0 )
	InfoBG:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -60, 0, 0 )
	self:addElement( InfoBG )
	self.InfoBG = InfoBG
	
	local Headquarters = nil
	
	Headquarters = LUI.UIImage.new()
	Headquarters.id = "Headquarters"
	Headquarters:SetDotPitchEnabled( true )
	Headquarters:SetDotPitchX( 0, 0 )
	Headquarters:SetDotPitchY( 0, 0 )
	Headquarters:SetDotPitchContrast( 0, 0 )
	Headquarters:SetDotPitchMode( 0 )
	Headquarters:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -509, _1080p * -65, 0, 0 )
	Headquarters:SubscribeToModelThroughElement( self, "headquarters", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.headquarters:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Headquarters:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( Headquarters )
	self.Headquarters = Headquarters
	
	local NameBacker = nil
	
	NameBacker = LUI.UIImage.new()
	NameBacker.id = "NameBacker"
	NameBacker:SetRGBFromInt( 0, 0 )
	NameBacker:SetAlpha( 0.8, 0 )
	NameBacker:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	NameBacker:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -630, 0, _1080p * 40 )
	self:addElement( NameBacker )
	self.NameBacker = NameBacker
	
	local MissionBacker = nil
	
	MissionBacker = LUI.UIImage.new()
	MissionBacker.id = "MissionBacker"
	MissionBacker:SetRGBFromInt( 0, 0 )
	MissionBacker:SetAlpha( 0.8, 0 )
	MissionBacker:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	MissionBacker:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 131.08, 0, _1080p * -85, 0 )
	self:addElement( MissionBacker )
	self.MissionBacker = MissionBacker
	
	local MissionTeamIconGrayscale = nil
	
	MissionTeamIconGrayscale = LUI.UIImage.new()
	MissionTeamIconGrayscale.id = "MissionTeamIconGrayscale"
	MissionTeamIconGrayscale:SetAlpha( 0, 0 )
	MissionTeamIconGrayscale:SetDotPitchEnabled( true )
	MissionTeamIconGrayscale:SetDotPitchX( 0, 0 )
	MissionTeamIconGrayscale:SetDotPitchY( 0, 0 )
	MissionTeamIconGrayscale:SetDotPitchContrast( 0, 0 )
	MissionTeamIconGrayscale:SetDotPitchMode( 0 )
	MissionTeamIconGrayscale:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -189, _1080p * 67, _1080p * -128, _1080p * 128 )
	MissionTeamIconGrayscale:SubscribeToModelThroughElement( self, "imageGrayscale", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.imageGrayscale:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			MissionTeamIconGrayscale:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( MissionTeamIconGrayscale )
	self.MissionTeamIconGrayscale = MissionTeamIconGrayscale
	
	local MissionTeamIcon = nil
	
	MissionTeamIcon = LUI.UIImage.new()
	MissionTeamIcon.id = "MissionTeamIcon"
	MissionTeamIcon:SetDotPitchEnabled( true )
	MissionTeamIcon:SetDotPitchX( 0, 0 )
	MissionTeamIcon:SetDotPitchY( 0, 0 )
	MissionTeamIcon:SetDotPitchContrast( 0, 0 )
	MissionTeamIcon:SetDotPitchMode( 0 )
	MissionTeamIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -189, _1080p * 67, _1080p * -128, _1080p * 128 )
	MissionTeamIcon:SubscribeToModelThroughElement( self, "image", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.image:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			MissionTeamIcon:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( MissionTeamIcon )
	self.MissionTeamIcon = MissionTeamIcon
	
	local MissionTeamName = nil
	
	MissionTeamName = LUI.UIStyledText.new()
	MissionTeamName.id = "MissionTeamName"
	MissionTeamName:SetFontSize( 28 * _1080p )
	MissionTeamName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionTeamName:SetAlignment( LUI.Alignment.Left )
	MissionTeamName:SetDecodeLetterLength( 25 )
	MissionTeamName:SetDecodeMaxRandChars( 3 )
	MissionTeamName:SetDecodeUpdatesPerLetter( 4 )
	MissionTeamName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 143, _1080p * 808, _1080p * 6, _1080p * 34 )
	MissionTeamName:SubscribeToModelThroughElement( self, "name", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.name:GetValue( f3_local1 )
		if f7_local0 ~= nil then
			MissionTeamName:setText( ToUpperCase( f7_local0 ), 0 )
		end
	end )
	self:addElement( MissionTeamName )
	self.MissionTeamName = MissionTeamName
	
	local MissionTeamDesc = nil
	
	MissionTeamDesc = LUI.UIStyledText.new()
	MissionTeamDesc.id = "MissionTeamDesc"
	MissionTeamDesc:SetRGBFromInt( 14277081, 0 )
	MissionTeamDesc:SetFontSize( 18 * _1080p )
	MissionTeamDesc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionTeamDesc:SetAlignment( LUI.Alignment.Left )
	MissionTeamDesc:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 143, _1080p * 808, _1080p * 42, _1080p * 60 )
	MissionTeamDesc:SubscribeToModelThroughElement( self, "desc", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.desc:GetValue( f3_local1 )
		if f8_local0 ~= nil then
			MissionTeamDesc:setText( f8_local0, 0 )
		end
	end )
	self:addElement( MissionTeamDesc )
	self.MissionTeamDesc = MissionTeamDesc
	
	local Mission1Frame = nil
	
	Mission1Frame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	Mission1Frame.id = "Mission1Frame"
	Mission1Frame:SetRGBFromInt( 12566463, 0 )
	Mission1Frame:SetAlpha( 0.2, 0 )
	Mission1Frame:SetBorderThicknessLeft( _1080p * 2, 0 )
	Mission1Frame:SetBorderThicknessRight( _1080p * 2, 0 )
	Mission1Frame:SetBorderThicknessTop( _1080p * 2, 0 )
	Mission1Frame:SetBorderThicknessBottom( _1080p * 2, 0 )
	Mission1Frame:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 143, _1080p * 508, _1080p * -80, _1080p * -5 )
	self:addElement( Mission1Frame )
	self.Mission1Frame = Mission1Frame
	
	local Mission2Frame = nil
	
	Mission2Frame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	Mission2Frame.id = "Mission2Frame"
	Mission2Frame:SetRGBFromInt( 12566463, 0 )
	Mission2Frame:SetAlpha( 0.2, 0 )
	Mission2Frame:SetBorderThicknessLeft( _1080p * 2, 0 )
	Mission2Frame:SetBorderThicknessRight( _1080p * 2, 0 )
	Mission2Frame:SetBorderThicknessTop( _1080p * 2, 0 )
	Mission2Frame:SetBorderThicknessBottom( _1080p * 2, 0 )
	Mission2Frame:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 520, _1080p * 885, _1080p * -80, _1080p * -5 )
	self:addElement( Mission2Frame )
	self.Mission2Frame = Mission2Frame
	
	local Mission3Frame = nil
	
	Mission3Frame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	Mission3Frame.id = "Mission3Frame"
	Mission3Frame:SetRGBFromInt( 12566463, 0 )
	Mission3Frame:SetAlpha( 0.2, 0 )
	Mission3Frame:SetBorderThicknessLeft( _1080p * 2, 0 )
	Mission3Frame:SetBorderThicknessRight( _1080p * 2, 0 )
	Mission3Frame:SetBorderThicknessTop( _1080p * 2, 0 )
	Mission3Frame:SetBorderThicknessBottom( _1080p * 2, 0 )
	Mission3Frame:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 897, _1080p * 1262, _1080p * -80, _1080p * -5 )
	self:addElement( Mission3Frame )
	self.Mission3Frame = Mission3Frame
	
	local MissionGrid = nil
	
	MissionGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 3,
		maxVisibleRows = 1,
		controllerIndex = f3_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "MissionPreview", {
				controllerIndex = f3_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 12,
		spacingY = _1080p * 12,
		columnWidth = _1080p * 365,
		rowHeight = _1080p * 75,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	MissionGrid.id = "MissionGrid"
	MissionGrid:setUseStencil( false )
	MissionGrid:SetGridDataSourceThroughElement( self, "missions" )
	MissionGrid:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 143, _1080p * 1262, _1080p * -80, _1080p * -5 )
	self:addElement( MissionGrid )
	self.MissionGrid = MissionGrid
	
	local CommanderHeadshot = nil
	
	CommanderHeadshot = LUI.UIImage.new()
	CommanderHeadshot.id = "CommanderHeadshot"
	CommanderHeadshot:SetDotPitchEnabled( true )
	CommanderHeadshot:SetDotPitchX( 0, 0 )
	CommanderHeadshot:SetDotPitchY( 0, 0 )
	CommanderHeadshot:SetDotPitchContrast( 0, 0 )
	CommanderHeadshot:SetDotPitchMode( 0 )
	CommanderHeadshot:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -10.17, _1080p * 142.54, _1080p * -166, _1080p * 167.18 )
	CommanderHeadshot:SubscribeToModelThroughElement( self, "commanderHeadshot", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.commanderHeadshot:GetValue( f3_local1 )
		if f10_local0 ~= nil then
			CommanderHeadshot:setImage( RegisterMaterial( f10_local0 ), 0 )
		end
	end )
	self:addElement( CommanderHeadshot )
	self.CommanderHeadshot = CommanderHeadshot
	
	local MissionTeamLevelInfo = nil
	
	MissionTeamLevelInfo = MenuBuilder.BuildRegisteredType( "MissionTeamLevelInfo", {
		controllerIndex = f3_local1
	} )
	MissionTeamLevelInfo.id = "MissionTeamLevelInfo"
	MissionTeamLevelInfo.WeaponLevelLabel:setText( Engine.Localize( "MENU_RANK_CAPS" ), 0 )
	MissionTeamLevelInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1112, _1080p * 1412, _1080p * 20, _1080p * 106 )
	MissionTeamLevelInfo:SubscribeToModelThroughElement( self, "level", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.level:GetValue( f3_local1 )
		if f11_local0 ~= nil then
			MissionTeamLevelInfo.CurrentLevel:setText( f11_local0, 0 )
		end
	end )
	self:addElement( MissionTeamLevelInfo )
	self.MissionTeamLevelInfo = MissionTeamLevelInfo
	
	local MissionTeamXPLabel = nil
	
	MissionTeamXPLabel = LUI.UIStyledText.new()
	MissionTeamXPLabel.id = "MissionTeamXPLabel"
	MissionTeamXPLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_MISSION_TEAM_XP_NEEDED" ) ), 0 )
	MissionTeamXPLabel:SetFontSize( 18 * _1080p )
	MissionTeamXPLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionTeamXPLabel:SetAlignment( LUI.Alignment.Right )
	MissionTeamXPLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 814, _1080p * 1202.32, _1080p * 40, _1080p * 58 )
	self:addElement( MissionTeamXPLabel )
	self.MissionTeamXPLabel = MissionTeamXPLabel
	
	local MissionTeamXPValue = nil
	
	MissionTeamXPValue = LUI.UIStyledText.new()
	MissionTeamXPValue.id = "MissionTeamXPValue"
	MissionTeamXPValue:setText( "88000", 0 )
	MissionTeamXPValue:SetFontSize( 36 * _1080p )
	MissionTeamXPValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionTeamXPValue:SetAlignment( LUI.Alignment.Right )
	MissionTeamXPValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1049.32, _1080p * 1202.32, _1080p * 60, _1080p * 96 )
	self:addElement( MissionTeamXPValue )
	self.MissionTeamXPValue = MissionTeamXPValue
	
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Lock:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -13.5, _1080p * 50.5 )
	self:addElement( Lock )
	self.Lock = Lock
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Headquarters:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.Headquarters:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Headquarters:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Headquarters:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Headquarters:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Headquarters:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Headquarters:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.Headquarters:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.Headquarters:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.Headquarters:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.Headquarters:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.Headquarters:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.Headquarters:SetDotPitchContrast( 0, 300 )
				end
			}
		} )
		CommanderHeadshot:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.CommanderHeadshot:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CommanderHeadshot:SetAlpha( 1, 30 )
				end,
				function ()
					return self.CommanderHeadshot:SetAlpha( 0, 30 )
				end,
				function ()
					return self.CommanderHeadshot:SetAlpha( 1, 30 )
				end,
				function ()
					return self.CommanderHeadshot:SetAlpha( 0, 30 )
				end,
				function ()
					return self.CommanderHeadshot:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.CommanderHeadshot:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.CommanderHeadshot:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.CommanderHeadshot:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.CommanderHeadshot:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.CommanderHeadshot:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.CommanderHeadshot:SetDotPitchContrast( 0, 300 )
				end
			}
		} )
		self._sequences.Update = function ()
			Headquarters:AnimateSequence( "Update" )
			CommanderHeadshot:AnimateSequence( "Update" )
		end
		
		Headquarters:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Headquarters:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		MissionBacker:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.MissionBacker:SetAlpha( 0.8, 0 )
				end
			}
		} )
		MissionTeamIconGrayscale:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.MissionTeamIconGrayscale:SetAlpha( 0, 0 )
				end
			}
		} )
		MissionTeamIcon:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.MissionTeamIcon:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.MissionTeamIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -189, _1080p * 67, _1080p * -128, _1080p * 128, 0 )
				end
			}
		} )
		MissionTeamName:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.MissionTeamName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 143, _1080p * 808, _1080p * 6, _1080p * 34, 0 )
				end
			}
		} )
		MissionTeamDesc:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.MissionTeamDesc:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 143, _1080p * 808, _1080p * 42, _1080p * 60, 0 )
				end
			}
		} )
		Mission1Frame:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Mission1Frame:SetAlpha( 0.2, 0 )
				end
			}
		} )
		Mission2Frame:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Mission2Frame:SetAlpha( 0.2, 0 )
				end
			}
		} )
		Mission3Frame:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Mission3Frame:SetAlpha( 0.2, 0 )
				end
			}
		} )
		MissionGrid:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.MissionGrid:SetAlpha( 1, 0 )
				end
			}
		} )
		MissionTeamLevelInfo:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.MissionTeamLevelInfo:SetAlpha( 1, 0 )
				end
			}
		} )
		MissionTeamXPLabel:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.MissionTeamXPLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		MissionTeamXPValue:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.MissionTeamXPValue:SetAlpha( 1, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			Headquarters:AnimateSequence( "Unlocked" )
			MissionBacker:AnimateSequence( "Unlocked" )
			MissionTeamIconGrayscale:AnimateSequence( "Unlocked" )
			MissionTeamIcon:AnimateSequence( "Unlocked" )
			MissionTeamName:AnimateSequence( "Unlocked" )
			MissionTeamDesc:AnimateSequence( "Unlocked" )
			Mission1Frame:AnimateSequence( "Unlocked" )
			Mission2Frame:AnimateSequence( "Unlocked" )
			Mission3Frame:AnimateSequence( "Unlocked" )
			MissionGrid:AnimateSequence( "Unlocked" )
			MissionTeamLevelInfo:AnimateSequence( "Unlocked" )
			MissionTeamXPLabel:AnimateSequence( "Unlocked" )
			MissionTeamXPValue:AnimateSequence( "Unlocked" )
			Lock:AnimateSequence( "Unlocked" )
		end
		
		Headquarters:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Headquarters:SetRGBFromInt( 3355443, 0 )
				end
			}
		} )
		MissionBacker:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.MissionBacker:SetAlpha( 0, 0 )
				end
			}
		} )
		MissionTeamIconGrayscale:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.MissionTeamIconGrayscale:SetAlpha( 1, 0 )
				end
			}
		} )
		MissionTeamIcon:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.MissionTeamIcon:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.MissionTeamIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -189, _1080p * 67, _1080p * -128, _1080p * 128, 0 )
				end
			}
		} )
		MissionTeamName:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.MissionTeamName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 41, _1080p * 706, _1080p * 6, _1080p * 34, 0 )
				end
			}
		} )
		MissionTeamDesc:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.MissionTeamDesc:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 41, _1080p * 706, _1080p * 89, _1080p * 107, 0 )
				end
			}
		} )
		Mission1Frame:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Mission1Frame:SetAlpha( 0, 0 )
				end
			}
		} )
		Mission2Frame:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Mission2Frame:SetAlpha( 0, 0 )
				end
			}
		} )
		Mission3Frame:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Mission3Frame:SetAlpha( 0, 0 )
				end
			}
		} )
		MissionGrid:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.MissionGrid:SetAlpha( 0, 0 )
				end
			}
		} )
		CommanderHeadshot:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.CommanderHeadshot:SetAlpha( 0, 0 )
				end
			}
		} )
		MissionTeamLevelInfo:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.MissionTeamLevelInfo:SetAlpha( 0, 0 )
				end
			}
		} )
		MissionTeamXPLabel:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.MissionTeamXPLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		MissionTeamXPValue:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.MissionTeamXPValue:SetAlpha( 0, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Headquarters:AnimateSequence( "Locked" )
			MissionBacker:AnimateSequence( "Locked" )
			MissionTeamIconGrayscale:AnimateSequence( "Locked" )
			MissionTeamIcon:AnimateSequence( "Locked" )
			MissionTeamName:AnimateSequence( "Locked" )
			MissionTeamDesc:AnimateSequence( "Locked" )
			Mission1Frame:AnimateSequence( "Locked" )
			Mission2Frame:AnimateSequence( "Locked" )
			Mission3Frame:AnimateSequence( "Locked" )
			MissionGrid:AnimateSequence( "Locked" )
			CommanderHeadshot:AnimateSequence( "Locked" )
			MissionTeamLevelInfo:AnimateSequence( "Locked" )
			MissionTeamXPLabel:AnimateSequence( "Locked" )
			MissionTeamXPValue:AnimateSequence( "Locked" )
			Lock:AnimateSequence( "Locked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "disabled", function ()
		local f72_local0 = self:GetDataSource()
		if f72_local0.disabled:GetValue( f3_local1 ) ~= nil then
			f72_local0 = self:GetDataSource()
			if f72_local0.disabled:GetValue( f3_local1 ) == true then
				ACTIONS.AnimateSequence( self, "Locked" )
			end
		end
		f72_local0 = self:GetDataSource()
		if f72_local0.disabled:GetValue( f3_local1 ) ~= nil then
			f72_local0 = self:GetDataSource()
			if f72_local0.disabled:GetValue( f3_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Unlocked" )
			end
		end
	end )
	local f3_local21 = function ()
		local f73_local0 = self:GetDataSource()
		if f73_local0.disabled:GetValue( f3_local1 ) ~= nil then
			f73_local0 = self:GetDataSource()
			if f73_local0.disabled:GetValue( f3_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Update" )
			end
		end
	end
	
	self:SubscribeToModelThroughElement( self, "disabled", f3_local21 )
	self:SubscribeToModelThroughElement( self, "name", f3_local21 )
	self:SubscribeToModelThroughElement( self, "level", function ()
		local f74_local0 = self:GetDataSource()
		if f74_local0.level:GetValue( f3_local1 ) ~= nil then
			f74_local0 = self:GetDataSource()
			if f74_local0.level:GetValue( f3_local1 ) > 49 then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "MissionTeamLevelInfo",
					sequenceName = "CommanderRank",
					elementPath = "MissionTeamLevelInfo"
				} )
			end
		end
		f74_local0 = self:GetDataSource()
		if f74_local0.level:GetValue( f3_local1 ) ~= nil then
			f74_local0 = self:GetDataSource()
			if f74_local0.level:GetValue( f3_local1 ) <= 49 then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "MissionTeamLevelInfo",
					sequenceName = "DefaultSequence",
					elementPath = "MissionTeamLevelInfo"
				} )
			end
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "MissionTeamDetails", MissionTeamDetails )
LockTable( _M )
