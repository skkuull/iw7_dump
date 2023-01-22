local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	if IsOnlineMatch() then
		if Lobby.IsGameHost() and Engine.IsDedi() then
			f1_arg0.SquareBullet:SetRGBFromInt( 6710784, 0 )
		elseif Lobby.IsGameHost() and not Engine.IsDedi() then
			f1_arg0.SquareBullet:SetRGBFromInt( 6710886, 0 )
		elseif not Lobby.IsGameHost() and Engine.IsDedi() then
			f1_arg0.SquareBullet:SetRGBFromInt( 14540032, 0 )
		end
	end
end

function MapVoteTitle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 544 * _1080p, 0, 23 * _1080p )
	self.id = "MapVoteTitle"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local TitleBackground = nil
	
	TitleBackground = LUI.UIImage.new()
	TitleBackground.id = "TitleBackground"
	TitleBackground:SetRGBFromInt( 0, 0 )
	TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 23 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local SquareBullet = nil
	
	SquareBullet = LUI.UIImage.new()
	SquareBullet.id = "SquareBullet"
	SquareBullet:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 10, _1080p * 9, _1080p * 14 )
	self:addElement( SquareBullet )
	self.SquareBullet = SquareBullet
	
	local VoteTitle = nil
	
	VoteTitle = LUI.UIStyledText.new()
	VoteTitle.id = "VoteTitle"
	VoteTitle:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
	VoteTitle:setText( ToUpperCase( Engine.Localize( "MENU_VOTE_TITLE" ) ), 0 )
	VoteTitle:SetFontSize( 19 * _1080p )
	VoteTitle:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	VoteTitle:SetAlignment( LUI.Alignment.Left )
	VoteTitle:SetOptOutRightToLeftAlignmentFlip( true )
	VoteTitle:SetDecodeLetterLength( 50 )
	VoteTitle:SetDecodeMaxRandChars( 5 )
	VoteTitle:SetDecodeUpdatesPerLetter( 10 )
	VoteTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 14, _1080p * 208, _1080p * 2, _1080p * 21 )
	self:addElement( VoteTitle )
	self.VoteTitle = VoteTitle
	
	local VoteTimeText = nil
	
	VoteTimeText = LUI.UIStyledText.new()
	VoteTimeText.id = "VoteTimeText"
	VoteTimeText:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
	VoteTimeText:setText( ToUpperCase( Engine.Localize( "MENU_VOTE_TIME" ) ), 0 )
	VoteTimeText:SetFontSize( 19 * _1080p )
	VoteTimeText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	VoteTimeText:SetAlignment( LUI.Alignment.Right )
	VoteTimeText:SetDecodeLetterLength( 50 )
	VoteTimeText:SetDecodeMaxRandChars( 5 )
	VoteTimeText:SetDecodeUpdatesPerLetter( 10 )
	VoteTimeText:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -261.25, _1080p * -122, _1080p * 3, _1080p * 22 )
	self:addElement( VoteTimeText )
	self.VoteTimeText = VoteTimeText
	
	local LockCountdown = nil
	
	LockCountdown = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f2_local1
	} )
	LockCountdown.id = "LockCountdown"
	LockCountdown:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
	LockCountdown:SetFontSize( 19 * _1080p )
	LockCountdown:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	LockCountdown:SetAlignment( LUI.Alignment.Right )
	LockCountdown:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -118, _1080p * -45, _1080p * 3, _1080p * 22 )
	LockCountdown:SubscribeToModel( DataSources.frontEnd.lobby.votingTime:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.frontEnd.lobby.votingTime:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			LockCountdown:setEndTime( f3_local0 )
		end
	end )
	self:addElement( LockCountdown )
	self.LockCountdown = LockCountdown
	
	local ClockHand = nil
	
	ClockHand = LUI.UIImage.new()
	ClockHand.id = "ClockHand"
	ClockHand:SetZRotation( -45, 0 )
	ClockHand:setImage( RegisterMaterial( "icon_clock_hand" ), 0 )
	ClockHand:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -21, _1080p * -6, _1080p * 4, _1080p * 19 )
	self:addElement( ClockHand )
	self.ClockHand = ClockHand
	
	local Clock = nil
	
	Clock = LUI.UIImage.new()
	Clock.id = "Clock"
	Clock:setImage( RegisterMaterial( "icon_clock_ring" ), 0 )
	Clock:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -23, _1080p * -4, _1080p * 2, _1080p * 21 )
	self:addElement( Clock )
	self.Clock = Clock
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		VoteTimeText:RegisterAnimationSequence( "VoteComplete", {
			{
				function ()
					return self.VoteTimeText:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.VoteTimeText:SetAlpha( 0, 1000, LUI.EASING.outQuadratic )
				end
			}
		} )
		LockCountdown:RegisterAnimationSequence( "VoteComplete", {
			{
				function ()
					return self.LockCountdown:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.LockCountdown:SetAlpha( 0, 1000, LUI.EASING.outQuadratic )
				end
			}
		} )
		ClockHand:RegisterAnimationSequence( "VoteComplete", {
			{
				function ()
					return self.ClockHand:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ClockHand:SetAlpha( 0, 1000, LUI.EASING.outQuadratic )
				end
			}
		} )
		Clock:RegisterAnimationSequence( "VoteComplete", {
			{
				function ()
					return self.Clock:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Clock:SetAlpha( 0, 1000, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.VoteComplete = function ()
			VoteTimeText:AnimateSequence( "VoteComplete" )
			LockCountdown:AnimateSequence( "VoteComplete" )
			ClockHand:AnimateSequence( "VoteComplete" )
			Clock:AnimateSequence( "VoteComplete" )
		end
		
		ClockHand:RegisterAnimationSequence( "ClockTick", {
			{
				function ()
					return self.ClockHand:SetZRotation( -45, 0 )
				end,
				function ()
					return self.ClockHand:SetZRotation( -405, 1000 )
				end
			}
		} )
		self._sequences.ClockTick = function ()
			ClockHand:AnimateLoop( "ClockTick" )
		end
		
		ClockHand:RegisterAnimationSequence( "LowTime", {
			{
				function ()
					return self.ClockHand:SetScale( 0, 0 )
				end,
				function ()
					return self.ClockHand:SetScale( 0.2, 300, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.ClockHand:SetScale( 0, 300, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		Clock:RegisterAnimationSequence( "LowTime", {
			{
				function ()
					return self.Clock:SetScale( 0, 0 )
				end,
				function ()
					return self.Clock:SetScale( 0.2, 300, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Clock:SetScale( 0, 300, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		self._sequences.LowTime = function ()
			ClockHand:AnimateLoop( "LowTime" )
			Clock:AnimateLoop( "LowTime" )
		end
		
		VoteTimeText:RegisterAnimationSequence( "VoteStart", {
			{
				function ()
					return self.VoteTimeText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.VoteTimeText:SetAlpha( 1, 1000, LUI.EASING.outQuadratic )
				end
			}
		} )
		LockCountdown:RegisterAnimationSequence( "VoteStart", {
			{
				function ()
					return self.LockCountdown:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LockCountdown:SetAlpha( 1, 1000, LUI.EASING.outQuadratic )
				end
			}
		} )
		ClockHand:RegisterAnimationSequence( "VoteStart", {
			{
				function ()
					return self.ClockHand:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ClockHand:SetAlpha( 1, 1000, LUI.EASING.outQuadratic )
				end
			}
		} )
		Clock:RegisterAnimationSequence( "VoteStart", {
			{
				function ()
					return self.Clock:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Clock:SetAlpha( 1, 1000, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.VoteStart = function ()
			VoteTimeText:AnimateSequence( "VoteStart" )
			LockCountdown:AnimateSequence( "VoteStart" )
			ClockHand:AnimateSequence( "VoteStart" )
			Clock:AnimateSequence( "VoteStart" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "ClockTick" )
	return self
end

MenuBuilder.registerType( "MapVoteTitle", MapVoteTitle )
LockTable( _M )
