local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.BlackQuad )
	if f1_arg2.fadeUI then
		f1_arg0.BlackQuad:SetAlpha( 0 )
		local f1_local0 = DataSources.frontEnd.lobby.isUIFadingOut
		f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
			if f1_local0:GetValue( f1_arg1 ) == true then
				ACTIONS.AnimateSequence( f1_arg0, "FadeToBlack" )
			else
				f1_arg0.BlackQuad:SetAlpha( 0 )
			end
		end )
	else
		local f1_local0 = nil
		if Engine.InFrontend() then
			assert( Engine.IsFrontEndLevelInitialized() )
			f1_local0 = LUI.DataSourceInGlobalModel.new( "cg.frontendscene.opacity" )
		else
			f1_local0 = LUI.DataSourceFromOmnvar.new( "ui_post_game_fade" )
		end
		f1_arg0.BlackQuad:BindAlphaToModel( f1_local0:GetModel( f1_arg1 ) )
	end
end

function ScreenFade( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "ScreenFade"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self:playSound( "menu_open" )
	local f3_local2 = self
	local BlackQuad = nil
	
	BlackQuad = LUI.UIImage.new()
	BlackQuad.id = "BlackQuad"
	BlackQuad:SetRGBFromInt( 0, 0 )
	self:addElement( BlackQuad )
	self.BlackQuad = BlackQuad
	
	local Spinner = nil
	
	Spinner = MenuBuilder.BuildRegisteredType( "Spinner", {
		controllerIndex = f3_local1
	} )
	Spinner.id = "Spinner"
	Spinner:SetAlpha( 0, 0 )
	Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 896, _1080p * 1024, _1080p * 476, _1080p * 604 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BlackQuad:RegisterAnimationSequence( "FadeToBlack", {
			{
				function ()
					return self.BlackQuad:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BlackQuad:SetAlpha( 1, 150 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "FadeToBlack", {
			{
				function ()
					return self.Spinner:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Spinner:SetAlpha( 0, 3750 )
				end,
				function ()
					return self.Spinner:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.FadeToBlack = function ()
			BlackQuad:AnimateSequence( "FadeToBlack" )
			Spinner:AnimateSequence( "FadeToBlack" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ScreenFade", ScreenFade )
LockTable( _M )
