local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.validClientEntityNum = false
	f1_arg0.Health.Fill:SubscribeToModelThroughElement( f1_arg0, "health", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.health:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			f1_arg0.Health.Fill:SetRightAnchor( 1 - f2_local0 )
			f1_arg0.Health.BGFill:SetLeftAnchor( f2_local0 )
		end
	end )
	local f1_local0 = Engine.GetDvarBool( "cg_drawFriendlyNamesAlways" )
	f1_arg0:registerEventHandler( "anchor_sight_obstructed", function ( element, event )
		if element.isFriendly and not f1_local0 then
			if element.isPlayerNameplateVisible == nil then
				element:SetAlpha( 0 )
			else
				element:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
			end
			element.isPlayerNameplateVisible = false
		elseif not element.isFriendly then
			element:SetAlpha( 0 )
			element.isPlayerNameplateVisible = false
		end
	end )
	f1_arg0:registerEventHandler( "anchor_sight_clear", function ( element, event )
		if element.validClientEntityNum then
			element:SetAlpha( 1 )
			element.isPlayerNameplateVisible = true
		end
	end )
	f1_arg0.Name:SetWordWrap( false )
	if f1_arg0.RankNumber then
		f1_arg0.RankNumber:SetWordWrap( false )
	end
end

function PlayerNameplate( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 147 * _1080p, 0, 45 * _1080p )
	self.id = "PlayerNameplate"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local Health = nil
	
	Health = MenuBuilder.BuildRegisteredType( "PlayerHealthbar", {
		controllerIndex = f5_local1
	} )
	Health.id = "Health"
	Health:SetAlpha( 1, 0 )
	Health:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 37, _1080p * 137, _1080p * 27, _1080p * 35 )
	self:addElement( Health )
	self.Health = Health
	
	local Name = nil
	
	Name = LUI.UIText.new()
	Name.id = "Name"
	Name:SetRGBFromTable( SWATCHES.HUD.friendlyTeam, 0 )
	Name:SetAlpha( 1, 0 )
	Name:setText( "tcBot1", 0 )
	Name:SetFontSize( 22 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Name:setTextStyle( CoD.TextStyle.Shadowed )
	Name:SetAlignment( LUI.Alignment.Left )
	Name:SetOptOutRightToLeftAlignmentFlip( true )
	Name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40, _1080p * 496, 0, _1080p * 22 )
	self:addElement( Name )
	self.Name = Name
	
	local RankBG = nil
	
	RankBG = LUI.UIImage.new()
	RankBG.id = "RankBG"
	RankBG:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 197, 0, _1080p * 48 )
	RankBG:SubscribeToModelThroughElement( self, "rankBG", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.rankBG:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			RankBG:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( RankBG )
	self.RankBG = RankBG
	
	local f5_local6 = nil
	if CONDITIONS.IsCorePublicMatch( self ) then
		f5_local6 = LUI.UIText.new()
		f5_local6.id = "RankNumber"
		f5_local6:SetAlpha( 1, 0 )
		f5_local6:SetFontSize( 18 * _1080p )
		f5_local6:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f5_local6:setTextStyle( CoD.TextStyle.Shadowed )
		f5_local6:SetAlignment( LUI.Alignment.Center )
		f5_local6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 9, _1080p * 29, _1080p * 20.5, _1080p * 38.5 )
		f5_local6:SubscribeToModelThroughElement( self, "rankNumber", function ()
			local f7_local0 = self:GetDataSource()
			f7_local0 = f7_local0.rankNumber:GetValue( f5_local1 )
			if f7_local0 ~= nil then
				f5_local6:setText( f7_local0, 0 )
			end
		end )
		self:addElement( f5_local6 )
		self.RankNumber = f5_local6
	end
	local f5_local7 = nil
	if CONDITIONS.IsCorePublicMatch( self ) then
		f5_local7 = LUI.UIImage.new()
		f5_local7.id = "RankIcon"
		f5_local7:SetAlpha( 1, 0 )
		f5_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 7, _1080p * 31, _1080p * 2, _1080p * 26 )
		f5_local7:SubscribeToModelThroughElement( self, "rankIcon", function ()
			local f8_local0 = self:GetDataSource()
			f8_local0 = f8_local0.rankIcon:GetValue( f5_local1 )
			if f8_local0 ~= nil then
				f5_local7:setImage( RegisterMaterial( f8_local0 ), 0 )
			end
		end )
		self:addElement( f5_local7 )
		self.RankIcon = f5_local7
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Health:RegisterAnimationSequence( "Cpinit", {
			{
				function ()
					return self.Health:SetAlpha( 0, 0 )
				end
			}
		} )
		RankBG:RegisterAnimationSequence( "Cpinit", {
			{
				function ()
					return self.RankBG:SetAlpha( 0, 0 )
				end
			}
		} )
		if CONDITIONS.IsCorePublicMatch( self ) then
			f5_local6:RegisterAnimationSequence( "Cpinit", {
				{
					function ()
						return self.RankNumber:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsCorePublicMatch( self ) then
			f5_local7:RegisterAnimationSequence( "Cpinit", {
				{
					function ()
						return self.RankIcon:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.Cpinit = function ()
			Health:AnimateSequence( "Cpinit" )
			RankBG:AnimateSequence( "Cpinit" )
			if CONDITIONS.IsCorePublicMatch( self ) then
				f5_local6:AnimateSequence( "Cpinit" )
			end
			if CONDITIONS.IsCorePublicMatch( self ) then
				f5_local7:AnimateSequence( "Cpinit" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f5_local1, controller )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "Cpinit" )
	end
	return self
end

MenuBuilder.registerType( "PlayerNameplate", PlayerNameplate )
LockTable( _M )
