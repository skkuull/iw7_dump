local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	f1_arg0.Desc:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 75, _1080p * 100, _1080p * 17.5, _1080p * 33.5 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0:addEventHandler( "update_passives", f0_local0 )
end

function Passive( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 240 * _1080p, 0, 80 * _1080p )
	self.id = "Passive"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 64, _1080p * 8, _1080p * 72 )
	Icon:SubscribeToModelThroughElement( self, "passive.image", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.passive.image:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Icon:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Name = nil
	
	Name = LUI.UIStyledText.new()
	Name.id = "Name"
	Name:SetFontSize( 16 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Name:SetAlignment( LUI.Alignment.Left )
	Name:SetOptOutRightToLeftAlignmentFlip( true )
	Name:SetStartupDelay( 1000 )
	Name:SetLineHoldTime( 400 )
	Name:SetAnimMoveTime( 150 )
	Name:SetEndDelay( 1000 )
	Name:SetCrossfadeTime( 400 )
	Name:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	Name:SetMaxVisibleLines( 1 )
	Name:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 75, 0, _1080p * 0.5, _1080p * 16.5 )
	Name:SubscribeToModelThroughElement( self, "passive.name", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.passive.name:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			Name:setText( ToUpperCase( f5_local0 ), 0 )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local Desc = nil
	
	Desc = LUI.UIStyledText.new()
	Desc.id = "Desc"
	Desc:SetFontSize( 16 * _1080p )
	Desc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Desc:SetAlignment( LUI.Alignment.Left )
	Desc:SetOptOutRightToLeftAlignmentFlip( true )
	Desc:SetStartupDelay( 1000 )
	Desc:SetLineHoldTime( 400 )
	Desc:SetAnimMoveTime( 150 )
	Desc:SetEndDelay( 1000 )
	Desc:SetCrossfadeTime( 400 )
	Desc:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	Desc:SetMaxVisibleLines( 4 )
	Desc:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 75, 0, _1080p * 17.5, _1080p * 33.5 )
	Desc:SubscribeToModelThroughElement( self, "passive.desc", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.passive.desc:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			Desc:setText( f6_local0, 0 )
		end
	end )
	self:addElement( Desc )
	self.Desc = Desc
	
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Passive", Passive )
LockTable( _M )
