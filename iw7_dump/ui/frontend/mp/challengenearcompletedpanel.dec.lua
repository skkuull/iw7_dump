local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ChallengeNearCompletedPanel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 950 * _1080p, 0, 190 * _1080p )
	self.id = "ChallengeNearCompletedPanel"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if Engine.InFrontend() then
		f1_local3 = LUI.UIBlur.new()
		f1_local3.id = "Blur"
		f1_local3:SetRGBFromInt( 12566463, 0 )
		f1_local3:SetBlurStrength( 2.75, 0 )
		self:addElement( f1_local3 )
		self.Blur = f1_local3
	end
	local ProgressBG = nil
	
	ProgressBG = LUI.UIImage.new()
	ProgressBG.id = "ProgressBG"
	ProgressBG:SetRGBFromInt( 0, 0 )
	ProgressBG:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -30, 0 )
	self:addElement( ProgressBG )
	self.ProgressBG = ProgressBG
	
	local Card = nil
	
	Card = LUI.UIImage.new()
	Card.id = "Card"
	Card:SetAlpha( 0.5, 0 )
	Card:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 386, _1080p * 6, _1080p * 154 )
	Card:SubscribeToModelThroughElement( self, "image", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.image:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Card:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( Card )
	self.Card = Card
	
	local Name = nil
	
	Name = LUI.UIText.new()
	Name.id = "Name"
	Name:SetFontSize( 32 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Name:SetAlignment( LUI.Alignment.Right )
	Name:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -549, _1080p * -27, _1080p * 6, _1080p * 38 )
	Name:SubscribeToModelThroughElement( self, "name", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.name:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Name:setText( LocalizeString( f3_local0 ), 0 )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local Desc = nil
	
	Desc = LUI.UIText.new()
	Desc.id = "Desc"
	Desc:SetFontSize( 22 * _1080p )
	Desc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Desc:SetAlignment( LUI.Alignment.Left )
	Desc:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 401, _1080p * -26, _1080p * 68.75, _1080p * 91.25 )
	Desc:SubscribeToModelThroughElement( self, "desc", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.desc:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			Desc:setText( f4_local0, 0 )
		end
	end )
	self:addElement( Desc )
	self.Desc = Desc
	
	local ProgressBar = nil
	
	ProgressBar = MenuBuilder.BuildRegisteredType( "ChallengeInfoProgressBar", {
		controllerIndex = f1_local1
	} )
	ProgressBar.id = "ProgressBar"
	ProgressBar:SetDataSourceThroughElement( self, nil )
	ProgressBar.black:SetAlpha( 0, 0 )
	ProgressBar:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -29, _1080p * -2 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	ProgressBar:SetDataSourceThroughElement( self, nil )
	return self
end

MenuBuilder.registerType( "ChallengeNearCompletedPanel", ChallengeNearCompletedPanel )
LockTable( _M )
