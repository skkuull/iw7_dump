local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Row )
	f1_arg0:addEventHandler( "button_over", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg1.controller or f1_arg1
		ACTIONS.AnimateSequence( f1_arg0, "Focused" )
	end )
	f1_arg0:addEventHandler( "button_up", function ( f3_arg0, f3_arg1 )
		ACTIONS.AnimateSequence( f1_arg0, "DefaultSequence" )
	end )
	if not Engine.IsPS4() then
		f1_arg0:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
			local f4_local0 = f1_arg0.Row._data
			if f4_local0 and f4_local0.xuid then
				Lobby.ShowGamerCardWithXuidString( f1_arg1, f4_local0.xuid )
			end
		end )
	end
end

function LeaderboardRowButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1200 * _1080p, 0, 39 * _1080p )
	self.id = "LeaderboardRowButton"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local Row = nil
	
	Row = MenuBuilder.BuildRegisteredType( "LeaderboardRow", {
		controllerIndex = f5_local1
	} )
	Row.id = "Row"
	Row:SetDataSourceThroughElement( self, nil )
	Row.HighlightBar:SetTop( _1080p * 39, 0 )
	Row.HighlightBar:SetBottom( _1080p * 0, 0 )
	Row:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 39 )
	self:addElement( Row )
	self.Row = Row
	
	self._animationSets.DefaultAnimationSet = function ()
		Row:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Row.HighlightBar:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Row.HighlightBar:SetTop( _1080p * 34, 0 )
				end
			},
			{
				function ()
					return self.Row.HighlightBar:SetRGBFromInt( 8421504, 0 )
				end
			},
			{
				function ()
					return self.Row.Cap:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Row:AnimateSequence( "DefaultSequence" )
		end
		
		Row:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.Row.HighlightBar:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Row.HighlightBar:SetTop( _1080p * 0, 0 )
				end
			},
			{
				function ()
					return self.Row.HighlightBar:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Row.Cap:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.Focused = function ()
			Row:AnimateSequence( "Focused" )
		end
		
	end
	
	self._animationSets.ThirdGameMode = function ()
		Row:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Row.HighlightBar:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Row.HighlightBar:SetTop( _1080p * 38, 0 )
				end
			},
			{
				function ()
					return self.Row.Cap:SetRGBFromInt( 14277081, 0 )
				end
			},
			{
				function ()
					return self.Row.CPBackground:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Row.CPBackgroundGlow:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Row:AnimateSequence( "DefaultSequence" )
		end
		
		Row:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.Row.HighlightBar:SetTop( _1080p * 0, 0 )
				end
			},
			{
				function ()
					return self.Row.HighlightBar:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Row.Cap:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Row.CPBackground:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Row.CPBackgroundGlow:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Focused = function ()
			Row:AnimateSequence( "Focused" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Row:SetDataSourceThroughElement( self, nil )
	f0_local0( self, f5_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "ThirdGameMode" )
	end
	return self
end

MenuBuilder.registerType( "LeaderboardRowButton", LeaderboardRowButton )
LockTable( _M )
