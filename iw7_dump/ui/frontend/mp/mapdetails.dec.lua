local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.GenericItemInfo, "WARNING: Map Detail Items Are Missing..." )
	local f1_local0 = f1_arg0.GenericItemInfo
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "name", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f1_local0.HeaderText:setText( ToUpperCase( f2_local0.name:GetValue( f1_arg1 ) ), 0 )
	end )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "desc", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		f1_local0.BodyText:setText( Engine.Localize( f3_local0.desc:GetValue( f1_arg1 ) ), 0 )
	end )
end

function MapDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 800 * _1080p, 0, 470 * _1080p )
	self.id = "MapDetails"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local f4_local3 = nil
	if Engine.InFrontend() then
		f4_local3 = LUI.UIBlur.new()
		f4_local3.id = "Blur"
		f4_local3:SetBlurStrength( 2.75, 0 )
		f4_local3:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 558, 0, _1080p * 322 )
		self:addElement( f4_local3 )
		self.Blur = f4_local3
	end
	local WhiteOverlay = nil
	
	WhiteOverlay = LUI.UIImage.new()
	WhiteOverlay.id = "WhiteOverlay"
	WhiteOverlay:SetAlpha( 0.5, 0 )
	WhiteOverlay:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21, _1080p * 558, 0, _1080p * 322 )
	self:addElement( WhiteOverlay )
	self.WhiteOverlay = WhiteOverlay
	
	local GameTypeImage = nil
	
	GameTypeImage = LUI.UIImage.new()
	GameTypeImage.id = "GameTypeImage"
	GameTypeImage:SetDotPitchEnabled( true )
	GameTypeImage:SetDotPitchX( 6, 0 )
	GameTypeImage:SetDotPitchY( 3, 0 )
	GameTypeImage:SetDotPitchContrast( 0.15, 0 )
	GameTypeImage:SetDotPitchMode( 0 )
	GameTypeImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32.5, _1080p * 544.5, _1080p * 11, _1080p * 311 )
	GameTypeImage:SubscribeToModelThroughElement( self, "image", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.image:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			GameTypeImage:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( GameTypeImage )
	self.GameTypeImage = GameTypeImage
	
	local GenericItemInfo = nil
	
	GenericItemInfo = MenuBuilder.BuildRegisteredType( "GenericItemInfo", {
		controllerIndex = f4_local1
	} )
	GenericItemInfo.id = "GenericItemInfo"
	GenericItemInfo.BodyText:setText( "", 0 )
	GenericItemInfo.HeaderText:setText( ToUpperCase( "" ), 0 )
	GenericItemInfo:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -132, _1080p * 8 )
	self:addElement( GenericItemInfo )
	self.GenericItemInfo = GenericItemInfo
	
	local BarLeft = nil
	
	BarLeft = LUI.UIImage.new()
	BarLeft.id = "BarLeft"
	BarLeft:SetRGBFromInt( 0, 0 )
	BarLeft:SetAlpha( 0.6, 0 )
	BarLeft:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 21, 0, _1080p * 322 )
	self:addElement( BarLeft )
	self.BarLeft = BarLeft
	
	local Node1 = nil
	
	Node1 = LUI.UIImage.new()
	Node1.id = "Node1"
	Node1:SetRGBFromInt( 0, 0 )
	Node1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25, _1080p * 40, _1080p * 2, _1080p * 5 )
	self:addElement( Node1 )
	self.Node1 = Node1
	
	local Node2 = nil
	
	Node2 = LUI.UIImage.new()
	Node2.id = "Node2"
	Node2:SetRGBFromInt( 0, 0 )
	Node2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 539, _1080p * 554, _1080p * 2, _1080p * 5 )
	self:addElement( Node2 )
	self.Node2 = Node2
	
	local Node3 = nil
	
	Node3 = LUI.UIImage.new()
	Node3.id = "Node3"
	Node3:SetRGBFromInt( 0, 0 )
	Node3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25, _1080p * 40, _1080p * 317, _1080p * 320 )
	self:addElement( Node3 )
	self.Node3 = Node3
	
	local Node4 = nil
	
	Node4 = LUI.UIImage.new()
	Node4.id = "Node4"
	Node4:SetRGBFromInt( 0, 0 )
	Node4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 539, _1080p * 554, _1080p * 317, _1080p * 320 )
	self:addElement( Node4 )
	self.Node4 = Node4
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		GameTypeImage:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.GameTypeImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.GameTypeImage:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.GameTypeImage:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.GameTypeImage:SetDotPitchX( 36, 150 )
				end,
				function ()
					return self.GameTypeImage:SetDotPitchX( 6, 150, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.GameTypeImage:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.GameTypeImage:SetDotPitchY( 68, 150 )
				end,
				function ()
					return self.GameTypeImage:SetDotPitchY( 3, 150, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.GameTypeImage:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.GameTypeImage:SetDotPitchContrast( 0.4, 150 )
				end,
				function ()
					return self.GameTypeImage:SetDotPitchContrast( 0.15, 150, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Update = function ()
			GameTypeImage:AnimateSequence( "Update" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "image", function ()
		ACTIONS.AnimateSequence( self, "Update" )
	end )
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "MapDetails", MapDetails )
LockTable( _M )
