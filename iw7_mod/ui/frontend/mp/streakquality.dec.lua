local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function StreakQuality( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 48 * _1080p, 0, 48 * _1080p )
	self.id = "StreakQuality"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Highlight = nil
	
	Highlight = LUI.UIImage.new()
	Highlight.id = "Highlight"
	Highlight:setImage( RegisterMaterial( "challenges_progress_hori" ), 0 )
	Highlight:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -1, _1080p * 1, _1080p * -14, _1080p * 4 )
	self:addElement( Highlight )
	self.Highlight = Highlight
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f1_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * -3 )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	local f1_local5 = nil
	if CONDITIONS.UseCACBreadCrumbs( self ) then
		f1_local5 = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
			controllerIndex = f1_local1
		} )
		f1_local5.id = "NewItemNotification"
		f1_local5:SetAlpha( 0, 0 )
		f1_local5:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23, _1080p * 23, _1080p * 8, _1080p * 54 )
		self:addElement( f1_local5 )
		self.NewItemNotification = f1_local5
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Highlight:RegisterAnimationSequence( "HighlightOn", {
			{
				function ()
					return self.Highlight:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.HighlightOn = function ()
			Highlight:AnimateSequence( "HighlightOn" )
		end
		
		Highlight:RegisterAnimationSequence( "HightlightOff", {
			{
				function ()
					return self.Highlight:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HightlightOff = function ()
			Highlight:AnimateSequence( "HightlightOff" )
		end
		
		QualityIcon:RegisterAnimationSequence( "PipRefresh", {
			{
				function ()
					return self.QualityIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.QualityIcon:SetAlpha( 0, 30 )
				end,
				function ()
					return self.QualityIcon:SetAlpha( 1, 30 )
				end,
				function ()
					return self.QualityIcon:SetAlpha( 0, 30 )
				end,
				function ()
					return self.QualityIcon:SetAlpha( 1, 30 )
				end,
				function ()
					return self.QualityIcon:SetAlpha( 0, 30 )
				end,
				function ()
					return self.QualityIcon:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.PipRefresh = function ()
			QualityIcon:AnimateSequence( "PipRefresh" )
		end
		
		self._sequences.DefaultOn = function ()
			
		end
		
		self._sequences.DefaultOff = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "scrollbar_pip_highlighted", function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "HighlightOn" )
	end )
	self:addEventHandler( "scrollbar_pip_not_highlighted", function ( f19_arg0, f19_arg1 )
		local f19_local0 = f19_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "HightlightOff" )
	end )
	self:addEventHandler( "scrollbar_pip_is_default", function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "DefaultOn" )
	end )
	self:addEventHandler( "scrollbar_pip_is_not_default", function ( f21_arg0, f21_arg1 )
		local f21_local0 = f21_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "DefaultOff" )
	end )
	ACTIONS.AnimateSequence( self, "PipRefresh" )
	return self
end

MenuBuilder.registerType( "StreakQuality", StreakQuality )
LockTable( _M )
