local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToDataSourceThroughElement( f1_arg0, nil, function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.listIndex + 1
		assert( f1_arg0.MissionName )
		f1_arg0.MissionName:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_MISSION", f2_local0 ) ) )
	end )
end

function MissionPreview( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 365 * _1080p, 0, 75 * _1080p )
	self.id = "MissionPreview"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Backer = nil
	
	Backer = LUI.UIImage.new()
	Backer.id = "Backer"
	Backer:SetRGBFromInt( 0, 0 )
	Backer:SetAlpha( 0.4, 0 )
	self:addElement( Backer )
	self.Backer = Backer
	
	local MissionDesc = nil
	
	MissionDesc = LUI.UIStyledText.new()
	MissionDesc.id = "MissionDesc"
	MissionDesc:SetRGBFromInt( 14277081, 0 )
	MissionDesc:SetFontSize( 20 * _1080p )
	MissionDesc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionDesc:SetAlignment( LUI.Alignment.Left )
	MissionDesc:SetStartupDelay( 1000 )
	MissionDesc:SetLineHoldTime( 400 )
	MissionDesc:SetAnimMoveTime( 150 )
	MissionDesc:SetEndDelay( 1000 )
	MissionDesc:SetCrossfadeTime( 400 )
	MissionDesc:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	MissionDesc:SetMaxVisibleLines( 2 )
	MissionDesc:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 27.5, _1080p * 47.5 )
	MissionDesc:SubscribeToModelThroughElement( self, "description", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.description:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			MissionDesc:setText( f4_local0, 0 )
		end
	end )
	self:addElement( MissionDesc )
	self.MissionDesc = MissionDesc
	
	local Mission1Frame = nil
	
	Mission1Frame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	Mission1Frame.id = "Mission1Frame"
	Mission1Frame:SetRGBFromInt( 6710886, 0 )
	Mission1Frame:SetBorderThicknessLeft( _1080p * 2, 0 )
	Mission1Frame:SetBorderThicknessRight( _1080p * 2, 0 )
	Mission1Frame:SetBorderThicknessTop( _1080p * 2, 0 )
	Mission1Frame:SetBorderThicknessBottom( _1080p * 2, 0 )
	self:addElement( Mission1Frame )
	self.Mission1Frame = Mission1Frame
	
	local MissionBackground = nil
	
	MissionBackground = LUI.UIImage.new()
	MissionBackground.id = "MissionBackground"
	MissionBackground:SetRGBFromInt( 6710886, 0 )
	MissionBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 228, _1080p * 2, _1080p * 24 )
	self:addElement( MissionBackground )
	self.MissionBackground = MissionBackground
	
	local MissionBackgroundNotch = nil
	
	MissionBackgroundNotch = LUI.UIImage.new()
	MissionBackgroundNotch.id = "MissionBackgroundNotch"
	MissionBackgroundNotch:SetRGBFromInt( 6710886, 0 )
	MissionBackgroundNotch:setImage( RegisterMaterial( "wdg_slot_cut_out_1" ), 0 )
	MissionBackgroundNotch:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 228, _1080p * 250, _1080p * 2, _1080p * 24 )
	self:addElement( MissionBackgroundNotch )
	self.MissionBackgroundNotch = MissionBackgroundNotch
	
	local MissionName = nil
	
	MissionName = LUI.UIStyledText.new()
	MissionName.id = "MissionName"
	MissionName:SetRGBFromInt( 0, 0 )
	MissionName:SetAlpha( 0.6, 0 )
	MissionName:setText( Engine.Localize( "MENU_NEW" ), 0 )
	MissionName:SetFontSize( 19 * _1080p )
	MissionName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionName:SetAlignment( LUI.Alignment.Left )
	MissionName:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 3.5, _1080p * 22.5 )
	self:addElement( MissionName )
	self.MissionName = MissionName
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "MissionPreview", MissionPreview )
LockTable( _M )
