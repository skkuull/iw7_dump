local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToDataSourceThroughElement( f1_arg0, nil, function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f1_arg0.CompletedMissionsLabel:setText( LocalizeIntoString( f2_local0.completedMissions:GetValue( f1_arg1 ), "MP_FRONTEND_ONLY_MISSIONS_COMPLETED_CAPS" ), 0 )
		local f2_local1 = f1_arg0:GetDataSource()
		f2_local1 = f2_local1.level:GetValue( f1_arg1 )
		local f2_local2 = f1_arg0:GetDataSource()
		f2_local2 = f2_local2.maxLevel:GetValue( f1_arg1 )
		local f2_local3 = nil
		if f2_local2 and f2_local2 ~= 0 then
			f2_local3 = f2_local1 / f2_local2
		else
			f2_local3 = 0
		end
		if f2_local3 ~= 1 then
			f1_arg0.MissionTeamProgressBar.Fill:SetAnchors( 0, 1 - math.min( f2_local3, 1 ), 0, 1, 0, LUI.EASING.linear )
		end
		if f2_local1 > 50 then
			f1_arg0.MissionTeamProgressBar.LevelLabel:setText( LocalizeIntoString( f2_local1, "MP_FRONTEND_ONLY_COMMANDER_RANK_CAPS" ), 0 )
			ACTIONS.AnimateSequence( f1_arg0.MissionTeamProgressBar, "CommanderRankLevelColor" )
		else
			f1_arg0.MissionTeamProgressBar.LevelLabel:setText( LocalizeIntoString( f2_local1, "MP_FRONTEND_ONLY_RANK_CAPS" ), 0 )
		end
	end )
end

function HeadquartersMissionTeamInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 700 * _1080p, 0, 128 * _1080p )
	self.id = "HeadquartersMissionTeamInfo"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ProgressBacker = nil
	
	ProgressBacker = LUI.UIBlur.new()
	ProgressBacker.id = "ProgressBacker"
	ProgressBacker:SetRGBFromInt( 12566463, 0 )
	ProgressBacker:SetBlurStrength( 2.75, 0 )
	ProgressBacker:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 79.5, 0, _1080p * -56, _1080p * 22 )
	self:addElement( ProgressBacker )
	self.ProgressBacker = ProgressBacker
	
	local ProgressBackerGradient = nil
	
	ProgressBackerGradient = LUI.UIImage.new()
	ProgressBackerGradient.id = "ProgressBackerGradient"
	ProgressBackerGradient:SetRGBFromInt( 0, 0 )
	ProgressBackerGradient:SetAlpha( 0.2, 0 )
	ProgressBackerGradient:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	ProgressBackerGradient:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 79.5, 0, _1080p * -56, _1080p * 22 )
	self:addElement( ProgressBackerGradient )
	self.ProgressBackerGradient = ProgressBackerGradient
	
	local BlurL = nil
	
	BlurL = LUI.UIBlur.new()
	BlurL.id = "BlurL"
	BlurL:setImage( RegisterMaterial( "widg_gradient_right_to_left" ), 0 )
	BlurL:SetBlurStrength( 2.75, 0 )
	BlurL:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 97, _1080p * 8, _1080p * 86 )
	self:addElement( BlurL )
	self.BlurL = BlurL
	
	local ColouredBlur = nil
	
	ColouredBlur = LUI.UIBlur.new()
	ColouredBlur.id = "ColouredBlur"
	ColouredBlur:setImage( RegisterMaterial( "widg_gradient_right_to_left" ), 0 )
	ColouredBlur:SetBlurStrength( 2.75, 0 )
	ColouredBlur:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 97, _1080p * 86, _1080p * 127 )
	ColouredBlur:SubscribeToModelThroughElement( self, "level", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.level:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			ColouredBlur:SetRGBFromInt( f4_local0, 0 )
		end
	end )
	self:addElement( ColouredBlur )
	self.ColouredBlur = ColouredBlur
	
	local Spliter = nil
	
	Spliter = LUI.UIImage.new()
	Spliter.id = "Spliter"
	Spliter:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 107.89, _1080p * 700, _1080p * 85, _1080p * 87 )
	self:addElement( Spliter )
	self.Spliter = Spliter
	
	local MissionTeamBacker = nil
	
	MissionTeamBacker = LUI.UIBlur.new()
	MissionTeamBacker.id = "MissionTeamBacker"
	MissionTeamBacker:SetBlurStrength( 2.75, 0 )
	MissionTeamBacker:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 74, 0, _1080p * 23, _1080p * 63 )
	MissionTeamBacker:SubscribeToModelThroughElement( self, "color", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.color:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			MissionTeamBacker:SetRGBFromInt( f5_local0, 0 )
		end
	end )
	self:addElement( MissionTeamBacker )
	self.MissionTeamBacker = MissionTeamBacker
	
	local MissionTeamIcon = nil
	
	MissionTeamIcon = LUI.UIImage.new()
	MissionTeamIcon.id = "MissionTeamIcon"
	MissionTeamIcon:SetDotPitchEnabled( true )
	MissionTeamIcon:SetDotPitchX( 0, 0 )
	MissionTeamIcon:SetDotPitchY( 0, 0 )
	MissionTeamIcon:SetDotPitchContrast( 0, 0 )
	MissionTeamIcon:SetDotPitchMode( 0 )
	MissionTeamIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -700, _1080p * -541, _1080p * -79.5, _1080p * 79.5 )
	MissionTeamIcon:SubscribeToModelThroughElement( self, "image", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.image:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			MissionTeamIcon:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( MissionTeamIcon )
	self.MissionTeamIcon = MissionTeamIcon
	
	local MissionTeamProgressBar = nil
	
	MissionTeamProgressBar = MenuBuilder.BuildRegisteredType( "MissionTeamProgressBar", {
		controllerIndex = f3_local1
	} )
	MissionTeamProgressBar.id = "MissionTeamProgressBar"
	MissionTeamProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 159, _1080p * 603, 0, _1080p * 92 )
	self:addElement( MissionTeamProgressBar )
	self.MissionTeamProgressBar = MissionTeamProgressBar
	
	local CompletedMissionsLabel = nil
	
	CompletedMissionsLabel = LUI.UIText.new()
	CompletedMissionsLabel.id = "CompletedMissionsLabel"
	CompletedMissionsLabel:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	CompletedMissionsLabel:SetFontSize( 22 * _1080p )
	CompletedMissionsLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CompletedMissionsLabel:SetAlignment( LUI.Alignment.Left )
	CompletedMissionsLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 160.5, _1080p * 685.5, _1080p * 96, _1080p * 118 )
	self:addElement( CompletedMissionsLabel )
	self.CompletedMissionsLabel = CompletedMissionsLabel
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "HeadquartersMissionTeamInfo", HeadquartersMissionTeamInfo )
LockTable( _M )
