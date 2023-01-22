local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	if CONDITIONS.IsPublicMatch( f1_arg0 ) then
		assert( f1_arg0.Rank )
		f1_arg0.Rank:SubscribeToModelThroughElement( f1_arg0, "displayRank", function ()
			local f2_local0 = f1_arg0:GetDataSource()
			f2_local0 = f2_local0.displayRank:GetValue( f1_arg1 )
			if f2_local0 ~= nil then
				local f2_local1 = f1_arg0.Rank
				local f2_local2 = f2_local1:GetCurrentFont()
				local f2_local3, f2_local4, f2_local5, f2_local6 = f2_local1:getLocalRect()
				local f2_local7, f2_local8, f2_local9, f2_local10 = GetTextDimensions( LocalizeString( f2_local0 ), f2_local2, math.abs( f2_local6 - f2_local4 ) / _1080p )
				local f2_local11 = _1080p * (f2_local9 - f2_local7)
				f1_arg0.RankIcon:SetLeft( f2_local11 * -1 - 60 * _1080p )
				f1_arg0.RankIcon:SetRight( f2_local11 * -1 - 20 * _1080p )
				f1_arg0.RankBacker:SetLeft( f2_local11 * -1 - 100 * _1080p )
			end
		end )
	end
	local f1_local0 = function ()
		if f1_arg0.Emblem then
			f1_arg0.Emblem:close()
			f1_arg0.Emblem = nil
		end
		f1_arg0.Emblem = LUI.UIElement.new()
		f1_arg0.Emblem.id = "Emblem"
		f1_arg0.Emblem:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 1, _1080p * 119.19, _1080p * 1, _1080p * -1 )
		f1_arg0:addElement( f1_arg0.Emblem )
		local f3_local0 = f1_arg0:GetDataSource()
		f3_local0 = f3_local0.xuid
		assert( f3_local0 and type( f3_local0 ) == "table" )
		local f3_local1 = f3_local0:GetValue( f1_arg1 )
		local f3_local2 = f3_local1
		local f3_local3
		if #f3_local1 > 0 then
			f3_local3 = not Engine.IsXUIDInvalid( f3_local1 )
		else
			f3_local3 = false
		end
		local f3_local4 = f1_arg0:GetDataSource()
		f3_local4 = f3_local4.customEmblemEquipped
		local f3_local5 = Engine.GetDvarBool( "killswitch_custom_emblems" ) ~= true
		local f3_local6 = f1_arg0:GetDataSource()
		f3_local6 = f3_local6.emblem:GetValue( f1_arg1 )
		if f3_local5 and f3_local4 and f3_local3 and f3_local4:GetValue( f1_arg1 ) then
			if Engine.CanViewCustomEmblemFromUser( f1_arg1, f3_local1 ) then
				f1_arg0.Emblem:SetupUserEmblem( {
					xuid = f3_local1
				} )
			else
				f1_arg0.Emblem:setupUIImage()
				f1_arg0.Emblem:SetUseAA( true )
				f1_arg0.Emblem:setImage( RegisterMaterial( "ui_emblem_static_016" ), 0 )
			end
		else
			f1_arg0.Emblem:setupUIImage()
			f1_arg0.Emblem:SetUseAA( true )
			if f3_local6 ~= nil then
				f1_arg0.Emblem:setImage( RegisterMaterial( f3_local6 ), 0 )
			else
				f1_arg0.Emblem:setImage( RegisterMaterial( "white" ), 0 )
			end
		end
		local f3_local7 = f1_arg0:GetDataSource()
		f3_local7 = f3_local7.fullName:GetValue( f1_arg1 )
		if f3_local7 ~= nil then
			if Engine.IsPC() then
				f3_local7 = Engine.TruncateToGlyphCount( f3_local7, 16 )
			end
			f1_arg0.FullName:setText( f3_local7 )
		end
	end
	
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "fullName", f1_local0, true )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "customEmblemEquipped", f1_local0, true )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "emblem", f1_local0 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "xuid", f1_local0 )
end

function SmallPlayerCard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 418 * _1080p, 0, 119 * _1080p )
	self.id = "SmallPlayerCard"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local BackgroundFill = nil
	
	BackgroundFill = LUI.UIBlur.new()
	BackgroundFill.id = "BackgroundFill"
	BackgroundFill:SetRGBFromTable( SWATCHES.Callouts.SmallPlayercardBackgroundGrey, 0 )
	BackgroundFill:SetBlurStrength( 2.75, 0 )
	BackgroundFill:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 120.19, 0, _1080p * 119 )
	self:addElement( BackgroundFill )
	self.BackgroundFill = BackgroundFill
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetUseAA( true )
	Background:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -298.81, _1080p * -0.81, _1080p * 1, _1080p * -1 )
	Background:SubscribeToModelThroughElement( self, "background", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.background:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			Background:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( Background )
	self.Background = Background
	
	local Darken = nil
	
	Darken = LUI.UIImage.new()
	Darken.id = "Darken"
	Darken:SetRGBFromInt( 0, 0 )
	Darken:SetAlpha( 0.5, 0 )
	Darken:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -298.81, _1080p * -0.81, _1080p * -26, _1080p * -1 )
	self:addElement( Darken )
	self.Darken = Darken
	
	local FullName = nil
	
	FullName = LUI.UIStyledText.new()
	FullName.id = "FullName"
	FullName:setText( "", 0 )
	FullName:SetFontSize( 19 * _1080p )
	FullName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FullName:SetAlignment( LUI.Alignment.Left )
	FullName:SetShadowMinDistance( -0.2, 0 )
	FullName:SetShadowMaxDistance( 0.2, 0 )
	FullName:SetShadowRGBFromInt( 0, 0 )
	FullName:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -297.81, _1080p * -1.81, _1080p * -21.5, _1080p * -2.5 )
	self:addElement( FullName )
	self.FullName = FullName
	
	local f4_local7 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f4_local7 = LUI.UIImage.new()
		f4_local7.id = "RankBacker"
		f4_local7:SetRGBFromInt( 0, 0 )
		f4_local7:SetAlpha( 0.5, 0 )
		f4_local7:setImage( RegisterMaterial( "hud_glow" ), 0 )
		f4_local7:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -92, _1080p * 8, 0, _1080p * 46 )
		self:addElement( f4_local7 )
		self.RankBacker = f4_local7
	end
	local f4_local8 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f4_local8 = LUI.UIStyledText.new()
		f4_local8.id = "Rank"
		f4_local8:SetFontSize( 30 * _1080p )
		f4_local8:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f4_local8:SetAlignment( LUI.Alignment.Right )
		f4_local8:SetShadowMinDistance( -0.3, 0 )
		f4_local8:SetShadowMaxDistance( 0.3, 0 )
		f4_local8:SetShadowRGBFromInt( 0, 0 )
		f4_local8:SetOutlineMinDistance( -0.4, 0 )
		f4_local8:SetOutlineRGBFromInt( 0, 0 )
		f4_local8:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -90, _1080p * -8, _1080p * 8, _1080p * 38 )
		f4_local8:SubscribeToModelThroughElement( self, "displayRank", function ()
			local f6_local0 = self:GetDataSource()
			f6_local0 = f6_local0.displayRank:GetValue( f4_local1 )
			if f6_local0 ~= nil then
				f4_local8:setText( f6_local0, 0 )
			end
		end )
		self:addElement( f4_local8 )
		self.Rank = f4_local8
	end
	local f4_local9 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f4_local9 = LUI.UIImage.new()
		f4_local9.id = "RankIcon"
		f4_local9:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -68.81, _1080p * -28.81, _1080p * 3, _1080p * 43 )
		f4_local9:SubscribeToModelThroughElement( self, "rankIcon", function ()
			local f7_local0 = self:GetDataSource()
			f7_local0 = f7_local0.rankIcon:GetValue( f4_local1 )
			if f7_local0 ~= nil then
				f4_local9:setImage( RegisterMaterial( f7_local0 ), 0 )
			end
		end )
		self:addElement( f4_local9 )
		self.RankIcon = f4_local9
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if CONDITIONS.IsPublicMatch( self ) then
			f4_local8:RegisterAnimationSequence( "MasterPrestige", {
				{
					function ()
						return self.Rank:SetRGBFromTable( SWATCHES.Scoreboard.masterPrestige, 0 )
					end
				}
			} )
		end
		self._sequences.MasterPrestige = function ()
			if CONDITIONS.IsPublicMatch( self ) then
				f4_local8:AnimateSequence( "MasterPrestige" )
			end
		end
		
		if CONDITIONS.IsPublicMatch( self ) then
			f4_local8:RegisterAnimationSequence( "NormalPrestige", {
				{
					function ()
						return self.Rank:SetRGBFromInt( 16777215, 0 )
					end
				}
			} )
		end
		self._sequences.NormalPrestige = function ()
			if CONDITIONS.IsPublicMatch( self ) then
				f4_local8:AnimateSequence( "NormalPrestige" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "isMasterPrestige", function ()
		local f14_local0 = self:GetDataSource()
		if f14_local0.isMasterPrestige:GetValue( f4_local1 ) ~= nil then
			f14_local0 = self:GetDataSource()
			if f14_local0.isMasterPrestige:GetValue( f4_local1 ) == true then
				ACTIONS.AnimateSequence( self, "MasterPrestige" )
			end
		end
		f14_local0 = self:GetDataSource()
		if f14_local0.isMasterPrestige:GetValue( f4_local1 ) ~= nil then
			f14_local0 = self:GetDataSource()
			if f14_local0.isMasterPrestige:GetValue( f4_local1 ) == false then
				ACTIONS.AnimateSequence( self, "NormalPrestige" )
			end
		end
	end )
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "SmallPlayerCard", SmallPlayerCard )
LockTable( _M )
