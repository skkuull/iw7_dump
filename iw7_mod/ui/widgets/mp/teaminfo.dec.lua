local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function TeamInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 660 * _1080p, 0, 275 * _1080p )
	self.id = "TeamInfo"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Watermark = nil
	
	Watermark = LUI.UIImage.new()
	Watermark.id = "Watermark"
	Watermark:SetScale( -0.25, 0 )
	Watermark:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16.74, _1080p * 235.61, _1080p * 212.38, _1080p * 272.83 )
	Watermark:SubscribeToModelThroughElement( self, "watermark", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.watermark:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Watermark:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( Watermark )
	self.Watermark = Watermark
	
	local TeamLogo = nil
	
	TeamLogo = LUI.UIImage.new()
	TeamLogo.id = "TeamLogo"
	TeamLogo:SetScale( -0.4, 0 )
	TeamLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -28.64, _1080p * 280.99, _1080p * -29.53, _1080p * 280.1 )
	TeamLogo:SubscribeToModelThroughElement( self, "logo", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.logo:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			TeamLogo:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( TeamLogo )
	self.TeamLogo = TeamLogo
	
	local Score = nil
	
	Score = LUI.UIStyledText.new()
	Score.id = "Score"
	Score:SetScale( 0.2, 0 )
	Score:setText( "100", 0 )
	Score:SetFontSize( 105 * _1080p )
	Score:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Score:SetAlignment( LUI.Alignment.Center )
	Score:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -371, _1080p * -20, _1080p * 118.79, _1080p * 223.79 )
	self:addElement( Score )
	self.Score = Score
	
	local TimeToBeat = nil
	
	TimeToBeat = LUI.UIStyledText.new()
	TimeToBeat.id = "TimeToBeat"
	TimeToBeat:SetAlpha( 0, 0 )
	TimeToBeat:setText( Engine.Localize( "MENU_NEW" ), 0 )
	TimeToBeat:SetFontSize( 45 * _1080p )
	TimeToBeat:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	TimeToBeat:SetAlignment( LUI.Alignment.Left )
	TimeToBeat:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -321.72, _1080p * -48.89, _1080p * 148.79, _1080p * 193.79 )
	self:addElement( TimeToBeat )
	self.TimeToBeat = TimeToBeat
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Watermark:RegisterAnimationSequence( "IsLosingTeam", {
			{
				function ()
					return self.Watermark:SetAlpha( 0.7, 100 )
				end
			}
		} )
		TeamLogo:RegisterAnimationSequence( "IsLosingTeam", {
			{
				function ()
					return self.TeamLogo:SetAlpha( 1, 100 )
				end
			}
		} )
		Score:RegisterAnimationSequence( "IsLosingTeam", {
			{
				function ()
					return self.Score:SetShadowMaxDistance( 0.4, 100 )
				end
			},
			{
				function ()
					return self.Score:SetShadowMinDistance( -0.4, 100 )
				end
			},
			{
				function ()
					return self.Score:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.IsLosingTeam = function ()
			Watermark:AnimateSequence( "IsLosingTeam" )
			TeamLogo:AnimateSequence( "IsLosingTeam" )
			Score:AnimateSequence( "IsLosingTeam" )
		end
		
		Watermark:RegisterAnimationSequence( "IsWinningTeam", {
			{
				function ()
					return self.Watermark:SetAlpha( 1, 100 )
				end
			}
		} )
		TeamLogo:RegisterAnimationSequence( "IsWinningTeam", {
			{
				function ()
					return self.TeamLogo:SetAlpha( 1, 100 )
				end
			}
		} )
		Score:RegisterAnimationSequence( "IsWinningTeam", {
			{
				function ()
					return self.Score:SetShadowMinDistance( -0.4, 100 )
				end
			},
			{
				function ()
					return self.Score:SetShadowMaxDistance( 0.4, 100 )
				end
			},
			{
				function ()
					return self.Score:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.IsWinningTeam = function ()
			Watermark:AnimateSequence( "IsWinningTeam" )
			TeamLogo:AnimateSequence( "IsWinningTeam" )
			Score:AnimateSequence( "IsWinningTeam" )
		end
		
		Score:RegisterAnimationSequence( "ShowTimeToBeat", {
			{
				function ()
					return self.Score:SetAlpha( 0, 100 )
				end
			}
		} )
		TimeToBeat:RegisterAnimationSequence( "ShowTimeToBeat", {
			{
				function ()
					return self.TimeToBeat:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.ShowTimeToBeat = function ()
			Score:AnimateSequence( "ShowTimeToBeat" )
			TimeToBeat:AnimateSequence( "ShowTimeToBeat" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "TeamInfo", TeamInfo )
LockTable( _M )
