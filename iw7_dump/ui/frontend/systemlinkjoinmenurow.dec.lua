local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f1_arg0:GetDataSource()
		Lobby.JoinServer( f1_arg1, f2_local0.index )
	end )
end

function SystemLinkJoinMenuRow( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1131 * _1080p, 0, 35 * _1080p )
	self.id = "SystemLinkJoinMenuRow"
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
	
	local RowBG = nil
	
	RowBG = LUI.UIImage.new()
	RowBG.id = "RowBG"
	RowBG:SetRGBFromInt( 0, 0 )
	RowBG:SetAlpha( 0.5, 0 )
	self:addElement( RowBG )
	self.RowBG = RowBG
	
	local Host = nil
	
	Host = LUI.UIStyledText.new()
	Host.id = "Host"
	Host:SetRGBFromInt( 14277081, 0 )
	Host:SetFontSize( 24 * _1080p )
	Host:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Host:SetAlignment( LUI.Alignment.Left )
	Host:SetStartupDelay( 1000 )
	Host:SetLineHoldTime( 400 )
	Host:SetAnimMoveTime( 150 )
	Host:SetEndDelay( 1000 )
	Host:SetCrossfadeTime( 400 )
	Host:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Host:SetMaxVisibleLines( 1 )
	Host:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 12, _1080p * 279, _1080p * -12, _1080p * 12 )
	Host:SubscribeToModelThroughElement( self, "host", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.host:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Host:setText( f4_local0, 0 )
		end
	end )
	self:addElement( Host )
	self.Host = Host
	
	local Players = nil
	
	Players = LUI.UIText.new()
	Players.id = "Players"
	Players:SetRGBFromInt( 14277081, 0 )
	Players:SetFontSize( 24 * _1080p )
	Players:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Players:SetAlignment( LUI.Alignment.Left )
	Players:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 286, _1080p * 421, _1080p * -12, _1080p * 12 )
	Players:SubscribeToModelThroughElement( self, "players", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.players:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			Players:setText( f5_local0, 0 )
		end
	end )
	self:addElement( Players )
	self.Players = Players
	
	local Status = nil
	
	Status = LUI.UIText.new()
	Status.id = "Status"
	Status:SetRGBFromInt( 14277081, 0 )
	Status:SetFontSize( 24 * _1080p )
	Status:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Status:SetAlignment( LUI.Alignment.Left )
	Status:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 426, _1080p * 626, _1080p * -12, _1080p * 12 )
	Status:SubscribeToModelThroughElement( self, "status", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.status:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			Status:setText( ToUpperCase( f6_local0 ), 0 )
		end
	end )
	self:addElement( Status )
	self.Status = Status
	
	local Map = nil
	
	Map = LUI.UIStyledText.new()
	Map.id = "Map"
	Map:SetRGBFromInt( 14277081, 0 )
	Map:SetFontSize( 24 * _1080p )
	Map:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Map:SetAlignment( LUI.Alignment.Left )
	Map:SetStartupDelay( 1250 )
	Map:SetLineHoldTime( 400 )
	Map:SetAnimMoveTime( 300 )
	Map:SetEndDelay( 1000 )
	Map:SetCrossfadeTime( 500 )
	Map:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Map:SetMaxVisibleLines( 1 )
	Map:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 627, _1080p * 853, _1080p * -12, _1080p * 12 )
	Map:SubscribeToModelThroughElement( self, "map", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.map:GetValue( f3_local1 )
		if f7_local0 ~= nil then
			Map:setText( f7_local0, 0 )
		end
	end )
	self:addElement( Map )
	self.Map = Map
	
	local Type = nil
	
	Type = LUI.UIText.new()
	Type.id = "Type"
	Type:SetRGBFromInt( 14277081, 0 )
	Type:SetFontSize( 24 * _1080p )
	Type:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Type:SetAlignment( LUI.Alignment.Left )
	Type:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 862, _1080p * 1119, _1080p * -12, _1080p * 12 )
	Type:SubscribeToModelThroughElement( self, "type", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.type:GetValue( f3_local1 )
		if f8_local0 ~= nil then
			Type:setText( f8_local0, 0 )
		end
	end )
	self:addElement( Type )
	self.Type = Type
	
	local Cap = nil
	
	Cap = LUI.UIImage.new()
	Cap.id = "Cap"
	Cap:SetRGBFromInt( 14277081, 0 )
	Cap:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 6, 0, 0 )
	self:addElement( Cap )
	self.Cap = Cap
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RowBG:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.RowBG:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.RowBG:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		Host:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Host:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Players:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Players:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Status:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Status:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Map:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Map:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Type:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Type:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Cap:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Cap:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			RowBG:AnimateSequence( "ButtonOver" )
			Host:AnimateSequence( "ButtonOver" )
			Players:AnimateSequence( "ButtonOver" )
			Status:AnimateSequence( "ButtonOver" )
			Map:AnimateSequence( "ButtonOver" )
			Type:AnimateSequence( "ButtonOver" )
			Cap:AnimateSequence( "ButtonOver" )
		end
		
		RowBG:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.RowBG:SetAlpha( 0.5, 0 )
				end
			},
			{
				function ()
					return self.RowBG:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Host:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Host:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		Players:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Players:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		Status:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Status:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		Map:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Map:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		Type:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Type:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		Cap:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Cap:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			RowBG:AnimateSequence( "ButtonUp" )
			Host:AnimateSequence( "ButtonUp" )
			Players:AnimateSequence( "ButtonUp" )
			Status:AnimateSequence( "ButtonUp" )
			Map:AnimateSequence( "ButtonUp" )
			Type:AnimateSequence( "ButtonUp" )
			Cap:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f29_arg0, f29_arg1 )
		local f29_local0 = f29_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f30_arg0, f30_arg1 )
		local f30_local0 = f30_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "SystemLinkJoinMenuRow", SystemLinkJoinMenuRow )
LockTable( _M )
