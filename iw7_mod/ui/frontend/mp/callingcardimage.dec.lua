local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = function ( f2_arg0 )
		local f2_local0 = f2_arg0
		f1_arg0.LockStatusLabel:setText( f2_local0, 0 )
		local f2_local1 = f1_arg0.LockStatusLabel:GetCurrentFont()
		local f2_local2, f2_local3, f2_local4, f2_local5 = f1_arg0.LockStatusLabel:getLocalRect()
		local f2_local6, f2_local7, f2_local8, f2_local9 = GetTextDimensions( f2_local0, f2_local1, math.abs( f2_local3 - f2_local5 ) )
		local f2_local10 = (f2_local8 - f2_local6 + 36) / 2
		f1_arg0.LockStatusLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 284 - f2_local10, _1080p * 486, _1080p * 85.5, _1080p * 105.5 )
		f1_arg0.Padlock:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 243 - f2_local10, _1080p * 279 - f2_local10, _1080p * 77.5, _1080p * 113.5 )
	end
	
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "challengeInfo.isCompleted", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		local f3_local1 = false
		if f3_local0.challengeInfo.isHiddenChallenge then
			f3_local1 = f3_local0.challengeInfo.isHiddenChallenge:GetValue( f1_arg1 )
		end
		if f3_local0.challengeInfo.isCompleted:GetValue( f1_arg1 ) ~= nil and f3_local0.challengeInfo.isCompleted:GetValue( f1_arg1 ) == false then
			ACTIONS.AnimateSequence( f1_arg0, "Locked" )
			if f3_local0.challengeInfo.tierCount:GetValue( f1_arg1 ) ~= nil then
				ACTIONS.AnimateSequence( f1_arg0, "ShowLockedStatus" )
				f1_local0( Engine.Localize( "LUA_MENU_UNLOCK_MAX_TIER" ) )
			else
				f1_local0( "" )
			end
		end
		if f3_local0.challengeInfo.isCompleted:GetValue( f1_arg1 ) ~= nil and f3_local0.challengeInfo.isCompleted:GetValue( f1_arg1 ) == true then
			ACTIONS.AnimateSequence( f1_arg0, "DefaultSequence" )
			f3_local1 = false
		end
		if f3_local1 then
			f1_arg0.CallingCardTexture:SetAlpha( 0 )
		else
			f1_arg0.CallingCardTexture:SetAlpha( 1 )
		end
	end )
end

function CallingCardImage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 486 * _1080p, 0, 191 * _1080p )
	self.id = "CallingCardImage"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local CallingCardTexture = nil
	
	CallingCardTexture = LUI.UIImage.new()
	CallingCardTexture.id = "CallingCardTexture"
	CallingCardTexture:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 486, _1080p * 1, _1080p * -1 )
	CallingCardTexture:SubscribeToModelThroughElement( self, "texture", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.texture:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			CallingCardTexture:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( CallingCardTexture )
	self.CallingCardTexture = CallingCardTexture
	
	local Darkening = nil
	
	Darkening = LUI.UIImage.new()
	Darkening.id = "Darkening"
	Darkening:SetRGBFromInt( 0, 0 )
	Darkening:SetAlpha( 0, 0 )
	self:addElement( Darkening )
	self.Darkening = Darkening
	
	local TopLine = nil
	
	TopLine = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f4_local1
	} )
	TopLine.id = "TopLine"
	TopLine:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 2 )
	self:addElement( TopLine )
	self.TopLine = TopLine
	
	local BottomLine = nil
	
	BottomLine = MenuBuilder.BuildRegisteredType( "EmblemBoxLine", {
		controllerIndex = f4_local1
	} )
	BottomLine.id = "BottomLine"
	BottomLine:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -1, 0 )
	self:addElement( BottomLine )
	self.BottomLine = BottomLine
	
	local BlackBarLockStatus = nil
	
	BlackBarLockStatus = LUI.UIImage.new()
	BlackBarLockStatus.id = "BlackBarLockStatus"
	BlackBarLockStatus:SetRGBFromInt( 0, 0 )
	BlackBarLockStatus:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -20, _1080p * 20 )
	self:addElement( BlackBarLockStatus )
	self.BlackBarLockStatus = BlackBarLockStatus
	
	local LockStatusLabel = nil
	
	LockStatusLabel = LUI.UIText.new()
	LockStatusLabel.id = "LockStatusLabel"
	LockStatusLabel:setText( Engine.Localize( "LUA_MENU_UNLOCK_MAX_TIER" ), 0 )
	LockStatusLabel:SetFontSize( 20 * _1080p )
	LockStatusLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LockStatusLabel:SetAlignment( LUI.Alignment.Left )
	LockStatusLabel:SetOptOutRightToLeftAlignmentFlip( true )
	LockStatusLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 284, _1080p * 482, _1080p * 85.5, _1080p * 105.5 )
	self:addElement( LockStatusLabel )
	self.LockStatusLabel = LockStatusLabel
	
	local Padlock = nil
	
	Padlock = LUI.UIImage.new()
	Padlock.id = "Padlock"
	Padlock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Padlock:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 243, _1080p * 279, _1080p * 77.5, _1080p * 113.5 )
	self:addElement( Padlock )
	self.Padlock = Padlock
	
	self._animationSets.DefaultAnimationSet = function ()
		CallingCardTexture:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.CallingCardTexture:SetAlpha( 1, 0 )
				end
			}
		} )
		Darkening:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Darkening:SetAlpha( 0, 0 )
				end
			}
		} )
		BlackBarLockStatus:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BlackBarLockStatus:SetAlpha( 0, 0 )
				end
			}
		} )
		LockStatusLabel:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LockStatusLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		Padlock:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Padlock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			CallingCardTexture:AnimateSequence( "DefaultSequence" )
			Darkening:AnimateSequence( "DefaultSequence" )
			BlackBarLockStatus:AnimateSequence( "DefaultSequence" )
			LockStatusLabel:AnimateSequence( "DefaultSequence" )
			Padlock:AnimateSequence( "DefaultSequence" )
		end
		
		Darkening:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Darkening:SetAlpha( 0.4, 0 )
				end
			}
		} )
		BlackBarLockStatus:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.BlackBarLockStatus:SetAlpha( 0.7, 0 )
				end
			}
		} )
		LockStatusLabel:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.LockStatusLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		Padlock:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Padlock:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Darkening:AnimateSequence( "Locked" )
			BlackBarLockStatus:AnimateSequence( "Locked" )
			LockStatusLabel:AnimateSequence( "Locked" )
			Padlock:AnimateSequence( "Locked" )
		end
		
		Darkening:RegisterAnimationSequence( "ShowLockedStatus", {
			{
				function ()
					return self.Darkening:SetAlpha( 0.4, 0 )
				end
			}
		} )
		BlackBarLockStatus:RegisterAnimationSequence( "ShowLockedStatus", {
			{
				function ()
					return self.BlackBarLockStatus:SetAlpha( 0.7, 0 )
				end
			}
		} )
		LockStatusLabel:RegisterAnimationSequence( "ShowLockedStatus", {
			{
				function ()
					return self.LockStatusLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		Padlock:RegisterAnimationSequence( "ShowLockedStatus", {
			{
				function ()
					return self.Padlock:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowLockedStatus = function ()
			Darkening:AnimateSequence( "ShowLockedStatus" )
			BlackBarLockStatus:AnimateSequence( "ShowLockedStatus" )
			LockStatusLabel:AnimateSequence( "ShowLockedStatus" )
			Padlock:AnimateSequence( "ShowLockedStatus" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f4_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "CallingCardImage", CallingCardImage )
LockTable( _M )
