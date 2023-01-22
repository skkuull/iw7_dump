local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CaCButtonRectrictionOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 304 * _1080p, 0, 166 * _1080p )
	self.id = "CaCButtonRectrictionOverlay"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Icon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -26, _1080p * 26, _1080p * -26, _1080p * 26 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local f1_local4 = nil
	if Engine.IsAliensMode() then
		f1_local4 = LUI.UIImage.new()
		f1_local4.id = "IconCP"
		f1_local4:SetScale( 0.4, 0 )
		f1_local4:setImage( RegisterMaterial( "cp_wepbuild_lock" ), 0 )
		f1_local4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -16, _1080p * 16 )
		self:addElement( f1_local4 )
		self.IconCP = f1_local4
	end
	self._animationSets.DefaultAnimationSet = function ()
		if Engine.IsAliensMode() then
			f1_local4:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.IconCP:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.DefaultSequence = function ()
			if Engine.IsAliensMode() then
				f1_local4:AnimateSequence( "DefaultSequence" )
			end
		end
		
		Icon:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Icon:SetRGBFromTable( SWATCHES.genericButton.highlight, 100 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Icon:AnimateSequence( "ButtonOver" )
		end
		
		Icon:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Icon:SetRGBFromInt( 16777215, 200 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Icon:AnimateSequence( "ButtonUp" )
		end
		
		Icon:RegisterAnimationSequence( "CPLock", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		if Engine.IsAliensMode() then
			f1_local4:RegisterAnimationSequence( "CPLock", {
				{
					function ()
						return self.IconCP:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.CPLock = function ()
			Icon:AnimateSequence( "CPLock" )
			if Engine.IsAliensMode() then
				f1_local4:AnimateSequence( "CPLock" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "CPLock" )
	end
	return self
end

MenuBuilder.registerType( "CaCButtonRectrictionOverlay", CaCButtonRectrictionOverlay )
LockTable( _M )
