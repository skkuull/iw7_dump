local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARUnlockItemXpEarned( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 24 * _1080p )
	self.id = "AARUnlockItemXpEarned"
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
	Background:SetAlpha( 0.2, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local XPEarned = nil
	
	XPEarned = LUI.UIText.new()
	XPEarned.id = "XPEarned"
	XPEarned:setText( "XP Earned - 5,000", 0 )
	XPEarned:SetFontSize( 22 * _1080p )
	XPEarned:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	XPEarned:SetAlignment( LUI.Alignment.Center )
	XPEarned:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -11, _1080p * 11 )
	self:addElement( XPEarned )
	self.XPEarned = XPEarned
	
	local XPIcon = nil
	
	XPIcon = LUI.UIImage.new()
	XPIcon.id = "XPIcon"
	XPIcon:setImage( RegisterMaterial( "icon_xp" ), 0 )
	XPIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 74, _1080p * -20, _1080p * 44 )
	self:addElement( XPIcon )
	self.XPIcon = XPIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		XPEarned:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.XPEarned:SetAlpha( 0, 0 )
				end
			}
		} )
		XPIcon:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.XPIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hide = function ()
			Background:AnimateSequence( "Hide" )
			XPEarned:AnimateSequence( "Hide" )
			XPIcon:AnimateSequence( "Hide" )
		end
		
		Background:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Background:SetAlpha( 0.2, 0 )
				end
			}
		} )
		XPEarned:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.XPEarned:SetAlpha( 1, 0 )
				end
			}
		} )
		XPIcon:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.XPIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Show = function ()
			Background:AnimateSequence( "Show" )
			XPEarned:AnimateSequence( "Show" )
			XPIcon:AnimateSequence( "Show" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "xpEarned", function ()
		local f12_local0 = self:GetDataSource()
		if f12_local0.xpEarned:GetValue( f1_local1 ) ~= nil then
			f12_local0 = self:GetDataSource()
			if f12_local0.xpEarned:GetValue( f1_local1 ) <= 0 then
				ACTIONS.AnimateSequence( self, "Hide" )
			end
		end
		f12_local0 = self:GetDataSource()
		if f12_local0.xpEarned:GetValue( f1_local1 ) ~= nil then
			f12_local0 = self:GetDataSource()
			if f12_local0.xpEarned:GetValue( f1_local1 ) > 0 then
				ACTIONS.AnimateSequence( self, "Show" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "AARUnlockItemXpEarned", AARUnlockItemXpEarned )
LockTable( _M )
