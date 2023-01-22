local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FireMode( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 229 * _1080p, 0, 39 * _1080p )
	self.id = "FireMode"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Backer = nil
	
	Backer = LUI.UIBlur.new()
	Backer.id = "Backer"
	Backer:SetRGBFromInt( 11250336, 0 )
	Backer:setImage( RegisterMaterial( "fire_rate_backer" ), 0 )
	Backer:SetBlurStrength( 2.75, 0 )
	Backer:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 42, _1080p * -21, _1080p * 21 )
	self:addElement( Backer )
	self.Backer = Backer
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 1.5, _1080p * 40.5, _1080p * -19.5, _1080p * 19.5 )
	Icon:SubscribeToModelThroughElement( self, "fireMode.icon", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.fireMode.icon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Icon:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Name = nil
	
	Name = LUI.UIText.new()
	Name.id = "Name"
	Name:SetFontSize( 18 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Name:SetAlignment( LUI.Alignment.Left )
	Name:SetOptOutRightToLeftAlignmentFlip( true )
	Name:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 44, _1080p * 322, _1080p * -9, _1080p * 9 )
	Name:SubscribeToModelThroughElement( self, "fireMode.name", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.fireMode.name:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Name:setText( ToUpperCase( f3_local0 ), 0 )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	return self
end

MenuBuilder.registerType( "FireMode", FireMode )
LockTable( _M )
