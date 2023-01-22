local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ItemCardHeaderAltBackground( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 80 * _1080p )
	self.id = "ItemCardHeaderAltBackground"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetBlurStrength( 2.75, 0 )
	Blur:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 11, 0, 0, 0 )
	Blur:SubscribeToModelThroughElement( self, "color", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.color:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Blur:SetRGBFromInt( f2_local0, 0 )
		end
	end )
	self:addElement( Blur )
	self.Blur = Blur
	
	local f1_local4 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.IsMultiplayer( self ) then
		f1_local4 = LUI.UIImage.new()
		f1_local4.id = "Tab"
		f1_local4:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 11, 0, 0 )
		f1_local4:SubscribeToModelThroughElement( self, "color", function ()
			local f3_local0 = self:GetDataSource()
			f3_local0 = f3_local0.color:GetValue( f1_local1 )
			if f3_local0 ~= nil then
				f1_local4:SetRGBFromInt( f3_local0, 0 )
			end
		end )
		self:addElement( f1_local4 )
		self.Tab = f1_local4
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Blur:RegisterAnimationSequence( "zombies", {
			{
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end
			}
		} )
		self._sequences.zombies = function ()
			Blur:AnimateSequence( "zombies" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.AnimateSequence( self, "zombies" )
	end
	return self
end

MenuBuilder.registerType( "ItemCardHeaderAltBackground", ItemCardHeaderAltBackground )
LockTable( _M )
