local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.TutorialText )
	local f1_local0 = f1_arg0.TutorialText
	f1_local0:SetDecodeParams( 20, 5, 10 )
	f1_local0:SetShadowUOffset( -0 )
	f1_local0:SetShadowVOffset( -0 )
	local f1_local1 = DataSources.inGame.HUD.hints.tutorialMessageText
	local f1_local2, f1_local3 = nil
	local f1_local4 = function ( f2_arg0 )
		if not f1_local2 then
			local f2_local0, f2_local1, f2_local2, f2_local3 = f1_arg0.TutorialText:getLocalRect()
			f1_local2 = math.abs( f2_local3 - f2_local1 )
			f1_local3 = math.abs( f2_local2 - f2_local0 )
		end
		local f2_local0 = f1_arg0.TutorialText:GetCurrentFont()
		local f2_local1 = Engine.Localize( f2_arg0 )
		local f2_local2, f2_local3, f2_local4, f2_local5 = GetTextDimensions( f2_local1, f2_local0, f1_local2, f1_local3 )
		local f2_local6 = f2_local4 - f2_local2
		local f2_local7 = f2_local3 - f2_local5
		local f2_local8 = f2_local6 + 30
		local f2_local9 = f2_local7 + 20
		local f2_local10 = f2_local8 * 0.5
		local f2_local11 = f2_local9 * 0.5
		f1_arg0.Background:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, -f2_local10, f2_local10, -f2_local11, f2_local11 )
		local f2_local12 = f2_local7 * -0.5
		f1_arg0.TutorialText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 30, -30, f2_local12, f2_local12 + f1_local2 )
		f1_arg0.TutorialText:setText( f2_local1 )
	end
	
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), function ()
		local f3_local0 = f1_local1:GetValue( f1_arg1 )
		if f3_local0 ~= nil and f3_local0 ~= "" and f3_local0 ~= "none" then
			if CONDITIONS.IsSingleplayer( f1_arg0 ) then
				f1_local4( f3_local0 )
				ACTIONS.AnimateSequence( f1_arg0.Background, "FadeIn" )
			end
			if DataSources.inGame.HUD.hints.invalidCmdHintShow:GetValue( f1_arg1 ) then
				ACTIONS.AnimateSequence( f1_arg0, "FadeInInvalidCmd" )
			else
				ACTIONS.AnimateSequence( f1_arg0, "FadeIn" )
			end
		else
			if CONDITIONS.IsSingleplayer( f1_arg0 ) then
				ACTIONS.AnimateSequence( f1_arg0.Background, "FadeOut" )
			end
			ACTIONS.AnimateSequence( f1_arg0, "FadeOut" )
		end
	end )
	if CONDITIONS.IsSingleplayer( f1_arg0 ) then
		f1_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
			local f4_local0 = f1_local1:GetValue( f1_arg1 )
			if f4_local0 ~= nil and f4_local0 ~= "" and f4_local0 ~= "none" then
				f1_local4( f4_local0 )
			else
				ACTIONS.AnimateSequence( element.Background, "FadeOut" )
				ACTIONS.AnimateSequence( element, "FadeOut" )
			end
		end )
	end
end

function TutorialMessage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1200 * _1080p, 0, 60 * _1080p )
	self.id = "TutorialMessage"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local f5_local3 = nil
	if CONDITIONS.IsSingleplayer( self ) then
		f5_local3 = MenuBuilder.BuildRegisteredType( "TutorialMessageBackground", {
			controllerIndex = f5_local1
		} )
		f5_local3.id = "Background"
		f5_local3:SetAlpha( 0, 0 )
		f5_local3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -600, _1080p * 600, _1080p * -30, _1080p * 30 )
		self:addElement( f5_local3 )
		self.Background = f5_local3
	end
	local TutorialText = nil
	
	TutorialText = LUI.UIStyledText.new()
	TutorialText.id = "TutorialText"
	TutorialText:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	TutorialText:SetAlpha( 0, 0 )
	TutorialText:setText( LocalizeString( "" ), 0 )
	TutorialText:SetFontSize( 38 * _1080p )
	TutorialText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TutorialText:SetAlignment( LUI.Alignment.Center )
	TutorialText:SetShadowMinDistance( -0.2, 0 )
	TutorialText:SetShadowMaxDistance( 0.2, 0 )
	TutorialText:SetShadowRGBFromInt( 0, 0 )
	TutorialText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 50, _1080p * 1150, _1080p * 11, _1080p * 49 )
	self:addElement( TutorialText )
	self.TutorialText = TutorialText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if CONDITIONS.IsSingleplayer( self ) then
			f5_local3:RegisterAnimationSequence( "FadeIn", {
				{
					function ()
						return self.Background:SetAlpha( 0, 0 )
					end,
					function ()
						return self.Background:SetAlpha( 0.5, 250 )
					end
				}
			} )
		end
		TutorialText:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.TutorialText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TutorialText:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.FadeIn = function ()
			if CONDITIONS.IsSingleplayer( self ) then
				f5_local3:AnimateSequence( "FadeIn" )
			end
			TutorialText:AnimateSequence( "FadeIn" )
		end
		
		if CONDITIONS.IsSingleplayer( self ) then
			f5_local3:RegisterAnimationSequence( "FadeOut", {
				{
					function ()
						return self.Background:SetAlpha( 0.5, 0 )
					end,
					function ()
						return self.Background:SetAlpha( 0, 250 )
					end
				}
			} )
		end
		TutorialText:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.TutorialText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TutorialText:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.FadeOut = function ()
			if CONDITIONS.IsSingleplayer( self ) then
				f5_local3:AnimateSequence( "FadeOut" )
			end
			TutorialText:AnimateSequence( "FadeOut" )
		end
		
		TutorialText:RegisterAnimationSequence( "FadeInInvalidCmd", {
			{
				function ()
					return self.TutorialText:SetAlpha( 1, 110 )
				end
			}
		} )
		self._sequences.FadeInInvalidCmd = function ()
			TutorialText:AnimateSequence( "FadeInInvalidCmd" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "TutorialMessage", TutorialMessage )
LockTable( _M )
