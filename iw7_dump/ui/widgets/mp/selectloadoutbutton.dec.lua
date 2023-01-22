local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RefreshAnimation( f1_arg0, f1_arg1 )
	if f1_arg0._lastState ~= f1_arg1 then
		f1_arg0._lastState = f1_arg1
		ACTIONS.AnimateSequence( f1_arg0, f1_arg1 )
	end
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0:addEventHandler( "button_over", function ( f3_arg0, f3_arg1 )
		PlayerData.Cleanup()
		RefreshAnimation( f3_arg0, "ButtonOver" )
	end )
	f2_arg0:addEventHandler( "button_up", function ( f4_arg0, f4_arg1 )
		RefreshAnimation( f4_arg0, "ButtonUp" )
	end )
	f2_arg0:addEventHandler( "button_disable", function ( f5_arg0, f5_arg1 )
		RefreshAnimation( f5_arg0, "ButtonDisabled" )
	end )
	f2_arg0:addEventHandler( "button_over_disable", function ( f6_arg0, f6_arg1 )
		RefreshAnimation( f6_arg0, "ButtonOverDisabled" )
	end )
	if IsLanguageArabic() then
		f2_arg0.Lock:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -346, _1080p * -320, _1080p * -13, _1080p * 13 )
	end
	if not f2_arg0.properties then
		f2_arg0.properties = {}
	end
	f2_arg0:SubscribeToModelThroughElement( f2_arg0, "isLoadoutLocked", function ()
		local f7_local0 = f2_arg0:GetDataSource()
		f7_local0 = f7_local0.isLoadoutLocked:GetValue( f2_arg1 )
		if f7_local0 ~= nil then
			if f7_local0 then
				f2_arg0.properties.muteAction = true
				f2_arg0:setActionDisabledSFX( CoD.SFX.DenySelect )
			else
				f2_arg0.properties.muteAction = false
				f2_arg0:setActionDisabledSFX( nil )
			end
		end
	end )
end

function SelectLoadoutButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 360 * _1080p, 0, 30 * _1080p )
	self.id = "SelectLoadoutButton"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	self:SubscribeToModelThroughElement( self, "isLoadoutLocked", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.isLoadoutLocked:GetValue( f8_local1 )
		if f9_local0 ~= nil then
			self:SetButtonDisabled( f9_local0 )
		end
	end )
	local GenericListArrowButtonBackground = nil
	
	GenericListArrowButtonBackground = MenuBuilder.BuildRegisteredType( "GenericListArrowButtonBackground", {
		controllerIndex = f8_local1
	} )
	GenericListArrowButtonBackground.id = "GenericListArrowButtonBackground"
	GenericListArrowButtonBackground.DropShadow:SetAlpha( 0, 0 )
	GenericListArrowButtonBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GenericListArrowButtonBackground )
	self.GenericListArrowButtonBackground = GenericListArrowButtonBackground
	
	local Text = nil
	
	Text = LUI.UIStyledText.new()
	Text.id = "Text"
	Text:SetRGBFromInt( 14277081, 0 )
	Text:SetFontSize( 22 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetOutlineRGBFromInt( 0, 0 )
	Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 20, _1080p * -10, _1080p * -11, _1080p * 11 )
	Text:SubscribeToModelThroughElement( self, "name", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.name:GetValue( f8_local1 )
		if f10_local0 ~= nil then
			Text:setText( f10_local0, 0 )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:SetRGBFromInt( 12566463, 0 )
	Lock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Lock:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -32, _1080p * -6, _1080p * -13, _1080p * 13 )
	self:addElement( Lock )
	self.Lock = Lock
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Text:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Text:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Text:AnimateSequence( "ButtonUp" )
			Lock:AnimateSequence( "ButtonUp" )
		end
		
		Text:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Text:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Text:AnimateSequence( "ButtonOver" )
			Lock:AnimateSequence( "ButtonOver" )
		end
		
		Text:RegisterAnimationSequence( "ButtonDisabled", {
			{
				function ()
					return self.Text:SetRGBFromInt( 12566463, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonDisabled", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Lock:SetRGBFromInt( 12566463, 0 )
				end
			}
		} )
		self._sequences.ButtonDisabled = function ()
			Text:AnimateSequence( "ButtonDisabled" )
			Lock:AnimateSequence( "ButtonDisabled" )
		end
		
		Text:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Text:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Lock:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			Text:AnimateSequence( "ButtonOverDisabled" )
			Lock:AnimateSequence( "ButtonOverDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "SelectLoadoutButton", SelectLoadoutButton )
LockTable( _M )
