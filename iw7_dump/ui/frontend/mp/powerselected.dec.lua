local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PowerSelected( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 35 * _1080p, 0, 36 * _1080p )
	self.id = "PowerSelected"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local SelectedPip = nil
	
	SelectedPip = LUI.UIImage.new()
	SelectedPip.id = "SelectedPip"
	SelectedPip:SetAlpha( 0, 0 )
	SelectedPip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 35, 0, _1080p * 36 )
	self:addElement( SelectedPip )
	self.SelectedPip = SelectedPip
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		SelectedPip:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.SelectedPip:SetRGBFromTable( SWATCHES.CAC.streakSelected, 0 )
				end
			},
			{
				function ()
					return self.SelectedPip:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Selected = function ()
			SelectedPip:AnimateSequence( "Selected" )
		end
		
		SelectedPip:RegisterAnimationSequence( "Unselected", {
			{
				function ()
					return self.SelectedPip:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.SelectedPip:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.Unselected = function ()
			SelectedPip:AnimateSequence( "Unselected" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "selected", function ()
		local f10_local0 = self:GetDataSource()
		if f10_local0.selected:GetValue( f1_local1 ) ~= nil then
			f10_local0 = self:GetDataSource()
			if f10_local0.selected:GetValue( f1_local1 ) == true then
				ACTIONS.AnimateSequence( self, "Selected" )
			end
		end
		f10_local0 = self:GetDataSource()
		if f10_local0.selected:GetValue( f1_local1 ) ~= nil then
			f10_local0 = self:GetDataSource()
			if f10_local0.selected:GetValue( f1_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Unselected" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "PowerSelected", PowerSelected )
LockTable( _M )
