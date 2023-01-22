local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MissionIndicator( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 30 * _1080p, 0, 10 * _1080p )
	self.id = "MissionIndicator"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Indicator = nil
	
	Indicator = LUI.UIImage.new()
	Indicator.id = "Indicator"
	Indicator:SetAlpha( 0.5, 0 )
	self:addElement( Indicator )
	self.Indicator = Indicator
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Indicator:RegisterAnimationSequence( "Active", {
			{
				function ()
					return self.Indicator:SetRGBFromTable( SWATCHES.genericButton.highlight, 100 )
				end
			},
			{
				function ()
					return self.Indicator:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.Active = function ()
			Indicator:AnimateSequence( "Active" )
		end
		
		Indicator:RegisterAnimationSequence( "Inactive", {
			{
				function ()
					return self.Indicator:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.Indicator:SetAlpha( 0.25, 100 )
				end
			}
		} )
		self._sequences.Inactive = function ()
			Indicator:AnimateSequence( "Inactive" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "active", function ()
		local f10_local0 = self:GetDataSource()
		if f10_local0.active:GetValue( f1_local1 ) ~= nil then
			f10_local0 = self:GetDataSource()
			if f10_local0.active:GetValue( f1_local1 ) == true then
				ACTIONS.AnimateSequence( self, "Active" )
			end
		end
		f10_local0 = self:GetDataSource()
		if f10_local0.active:GetValue( f1_local1 ) ~= nil then
			f10_local0 = self:GetDataSource()
			if f10_local0.active:GetValue( f1_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Inactive" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "MissionIndicator", MissionIndicator )
LockTable( _M )
