local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addEventHandler( "update_button_description", function ( f2_arg0, f2_arg1 )
		assert( f2_arg0.Description )
		if f2_arg1.text then
			local f2_local0 = f2_arg1.text
			if f2_arg1.text ~= f2_arg0.Description:getText() then
				f2_arg0.Description:setText( f2_local0 )
				ACTIONS.AnimateSequence( f2_arg0, "Update" )
			end
		end
	end )
end

function ButtonDescriptionText( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 420 * _1080p, 0, 32 * _1080p )
	self.id = "ButtonDescriptionText"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Description = nil
	
	Description = LUI.UIStyledText.new()
	Description.id = "Description"
	Description:setText( ToUpperCase( "" ), 0 )
	Description:SetFontSize( 22 * _1080p )
	Description:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Description:SetAlignment( LUI.Alignment.Left )
	Description:SetDecodeLetterLength( 25 )
	Description:SetDecodeMaxRandChars( 3 )
	Description:SetDecodeUpdatesPerLetter( 4 )
	Description:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 415, _1080p * 5, _1080p * 27 )
	self:addElement( Description )
	self.Description = Description
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Description:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.Description:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Description:SetAlpha( 0, 100 )
				end,
				function ()
					return self.Description:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.Update = function ()
			Description:AnimateSequence( "Update" )
		end
		
		Description:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Description:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			Description:AnimateSequence( "Default" )
		end
		
		Description:RegisterAnimationSequence( "BlackText", {
			{
				function ()
					return self.Description:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.BlackText = function ()
			Description:AnimateSequence( "BlackText" )
		end
		
	end
	
	self._animationSets.ThirdGameMode = function ()
		Description:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Description:SetAnchors( 0, 1, 0, 1, 0 )
				end
			},
			{
				function ()
					return self.Description:SetLeft( _1080p * 0, 0 )
				end
			},
			{
				function ()
					return self.Description:SetRight( _1080p * 365, 0 )
				end
			},
			{
				function ()
					return self.Description:SetTop( _1080p * 5, 0 )
				end
			},
			{
				function ()
					return self.Description:SetBottom( _1080p * 27, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Description:AnimateSequence( "DefaultSequence" )
		end
		
		Description:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.Description:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Description:SetAlpha( 0, 100 )
				end,
				function ()
					return self.Description:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.Update = function ()
			Description:AnimateSequence( "Update" )
		end
		
		Description:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Description:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			Description:AnimateSequence( "Default" )
		end
		
		Description:RegisterAnimationSequence( "BlackText", {
			{
				function ()
					return self.Description:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.BlackText = function ()
			Description:AnimateSequence( "BlackText" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ButtonDescriptionText", ButtonDescriptionText )
LockTable( _M )
