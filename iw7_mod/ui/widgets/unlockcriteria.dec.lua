local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.UnlockDesc )
	if IsLanguageOversizedFont() then
		f1_arg0.UnlockDesc:SetTop( _1080p * -8, 0 )
		f1_arg0.UnlockDesc:SetBottom( _1080p * 8, 0 )
	end
end

function UnlockCriteria( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 343 * _1080p, 0, 32 * _1080p )
	self.id = "UnlockCriteria"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local UnlockIcon = nil
	
	UnlockIcon = LUI.UIImage.new()
	UnlockIcon.id = "UnlockIcon"
	UnlockIcon:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	UnlockIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 32, _1080p * -16, _1080p * 16 )
	self:addElement( UnlockIcon )
	self.UnlockIcon = UnlockIcon
	
	local UnlockDesc = nil
	
	UnlockDesc = LUI.UIText.new()
	UnlockDesc.id = "UnlockDesc"
	UnlockDesc:setText( "", 0 )
	UnlockDesc:SetFontSize( 18 * _1080p )
	UnlockDesc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	UnlockDesc:SetAlignment( LUI.Alignment.Left )
	UnlockDesc:SetOptOutRightToLeftAlignmentFlip( true )
	UnlockDesc:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 34, _1080p * 340, _1080p * -9, _1080p * 9 )
	self:addElement( UnlockDesc )
	self.UnlockDesc = UnlockDesc
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		UnlockIcon:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.UnlockIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		UnlockDesc:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.UnlockDesc:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hidden = function ()
			UnlockIcon:AnimateSequence( "Hidden" )
			UnlockDesc:AnimateSequence( "Hidden" )
		end
		
		UnlockIcon:RegisterAnimationSequence( "Visible", {
			{
				function ()
					return self.UnlockIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		UnlockDesc:RegisterAnimationSequence( "Visible", {
			{
				function ()
					return self.UnlockDesc:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Visible = function ()
			UnlockIcon:AnimateSequence( "Visible" )
			UnlockDesc:AnimateSequence( "Visible" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f11_local0 = self:GetDataSource()
		if f11_local0.isUnlocked:GetValue( f2_local1 ) ~= nil then
			f11_local0 = self:GetDataSource()
			if f11_local0.isUnlocked:GetValue( f2_local1 ) == true then
				ACTIONS.AnimateSequence( self, "Hidden" )
			end
		end
		f11_local0 = self:GetDataSource()
		if f11_local0.isUnlocked:GetValue( f2_local1 ) ~= nil then
			f11_local0 = self:GetDataSource()
			if f11_local0.isUnlocked:GetValue( f2_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Visible" )
			end
		end
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "UnlockCriteria", UnlockCriteria )
LockTable( _M )
