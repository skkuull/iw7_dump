local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LoadoutDraftTimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 64 * _1080p )
	self.id = "LoadoutDraftTimer"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.buttonHelper.friendsText, 0 )
	Background:setImage( RegisterMaterial( "wdg_pnb_timer_background" ), 0 )
	Background:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -128, _1080p * 128, 0, _1080p * 64 )
	self:addElement( Background )
	self.Background = Background
	
	local Seconds = nil
	
	Seconds = LUI.UIText.new()
	Seconds.id = "Seconds"
	Seconds:SetRGBFromInt( 0, 0 )
	Seconds:SetFontSize( 48 * _1080p )
	Seconds:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Seconds:SetAlignment( LUI.Alignment.Center )
	Seconds:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -70, _1080p * 70, _1080p * 20, _1080p * 68 )
	Seconds:SubscribeToModel( DataSources.frontEnd.MP.cwl.drafting.countdownTime:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.frontEnd.MP.cwl.drafting.countdownTime:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Seconds:setText( f2_local0, 0 )
		end
	end )
	self:addElement( Seconds )
	self.Seconds = Seconds
	
	local TimeRemaining = nil
	
	TimeRemaining = LUI.UIText.new()
	TimeRemaining.id = "TimeRemaining"
	TimeRemaining:SetRGBFromInt( 0, 0 )
	TimeRemaining:setText( Engine.Localize( "LUA_MENU_TIME_REMAINING" ), 0 )
	TimeRemaining:SetFontSize( 22 * _1080p )
	TimeRemaining:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TimeRemaining:SetAlignment( LUI.Alignment.Center )
	TimeRemaining:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -130, _1080p * 130, _1080p * 4, _1080p * 26 )
	self:addElement( TimeRemaining )
	self.TimeRemaining = TimeRemaining
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "TenSecondsRemaining", {
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		self._sequences.TenSecondsRemaining = function ()
			Background:AnimateSequence( "TenSecondsRemaining" )
		end
		
		Background:RegisterAnimationSequence( "FiveSecondsRemaining", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 100 )
				end,
				function ()
					return self.Background:SetAlpha( 0.99, 100 )
				end
			},
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		self._sequences.FiveSecondsRemaining = function ()
			Background:AnimateLoop( "FiveSecondsRemaining" )
		end
		
		Background:RegisterAnimationSequence( "Reset", {
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.buttonHelper.friendsText, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Reset = function ()
			Background:AnimateSequence( "Reset" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "LoadoutDraftTimer", LoadoutDraftTimer )
LockTable( _M )
