local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	if IsLanguageArabic() then
		f1_arg0.Value:SetAlignment( LUI.Alignment.Left )
		f1_arg0.Value:SetOptOutRightToLeftAlignmentFlip( true )
		f1_arg0.Background:SetZRotation( 180, 0 )
	end
end

function MissionPopupReward( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 450 * _1080p, 0, 28 * _1080p )
	self.id = "MissionPopupReward"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 9211020, 0 )
	Background:setImage( RegisterMaterial( "ops_map_scr_gradient_1" ), 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 36, 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Type = nil
	
	Type = LUI.UIText.new()
	Type.id = "Type"
	Type:SetRGBFromInt( 0, 0 )
	Type:setText( "", 0 )
	Type:SetFontSize( 22 * _1080p )
	Type:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Type:SetAlignment( LUI.Alignment.Left )
	Type:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 83, _1080p * 411, _1080p * -11, _1080p * 11 )
	self:addElement( Type )
	self.Type = Type
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:setImage( RegisterMaterial( "icon_ops_map_reward_weapon" ), 0 )
	Icon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 32, _1080p * -16, _1080p * 16 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Value = nil
	
	Value = LUI.UIText.new()
	Value.id = "Value"
	Value:setText( "", 0 )
	Value:SetFontSize( 22 * _1080p )
	Value:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Value:SetAlignment( LUI.Alignment.Right )
	Value:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -387, _1080p * -10, _1080p * -11, _1080p * 11 )
	self:addElement( Value )
	self.Value = Value
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "LevelSelect", {
			{
				function ()
					return self.Background:SetRGBFromInt( 3355443, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.Background:setImage( RegisterMaterial( "widg_gradient_left_to_right_opaque" ), 0 )
				end
			}
		} )
		Type:RegisterAnimationSequence( "LevelSelect", {
			{
				function ()
					return self.Type:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
				end
			}
		} )
		self._sequences.LevelSelect = function ()
			Background:AnimateSequence( "LevelSelect" )
			Type:AnimateSequence( "LevelSelect" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "MissionPopupReward", MissionPopupReward )
LockTable( _M )
