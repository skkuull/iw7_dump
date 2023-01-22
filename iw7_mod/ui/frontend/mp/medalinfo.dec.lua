local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MedalInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 950 * _1080p, 0, 716 * _1080p )
	self.id = "MedalInfo"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local MedalIconLarge = nil
	
	MedalIconLarge = LUI.UIImage.new()
	MedalIconLarge.id = "MedalIconLarge"
	MedalIconLarge:SetAlpha( 0.1, 0 )
	MedalIconLarge:SetScale( 0.75, 0 )
	MedalIconLarge:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, _1080p * 100, _1080p * 400 )
	MedalIconLarge:SubscribeToModelThroughElement( self, "icon", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.icon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			MedalIconLarge:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( MedalIconLarge )
	self.MedalIconLarge = MedalIconLarge
	
	local MedalIconSmall = nil
	
	MedalIconSmall = LUI.UIImage.new()
	MedalIconSmall.id = "MedalIconSmall"
	MedalIconSmall:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, _1080p * 100, _1080p * 400 )
	MedalIconSmall:SubscribeToModelThroughElement( self, "icon", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.icon:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			MedalIconSmall:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( MedalIconSmall )
	self.MedalIconSmall = MedalIconSmall
	
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:SetAlpha( 0, 0 )
	Lock:SetDotPitchEnabled( true )
	Lock:SetDotPitchX( 0, 0 )
	Lock:SetDotPitchY( 0, 0 )
	Lock:SetDotPitchContrast( 0, 0 )
	Lock:SetDotPitchMode( 0 )
	Lock:setImage( RegisterMaterial( "icon_showcase_locked" ), 0 )
	Lock:SetBlendMode( BLEND_MODE.blend )
	Lock:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, 0, _1080p * 512 )
	self:addElement( Lock )
	self.Lock = Lock
	
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "GenericItemInfoBG", {
		controllerIndex = f1_local1
	} )
	Background.id = "Background"
	Background.WhiteOverlay:SetAlpha( 0.1, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -140, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Description = nil
	
	Description = LUI.UIStyledText.new()
	Description.id = "Description"
	Description:SetFontSize( 22 * _1080p )
	Description:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Description:SetAlignment( LUI.Alignment.Left )
	Description:SetOptOutRightToLeftAlignmentFlip( true )
	Description:SetStartupDelay( 1250 )
	Description:SetLineHoldTime( 1250 )
	Description:SetAnimMoveTime( 3000 )
	Description:SetEndDelay( 1000 )
	Description:SetCrossfadeTime( 500 )
	Description:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	Description:SetMaxVisibleLines( 3 )
	Description:SetDecodeLetterLength( 5 )
	Description:SetDecodeMaxRandChars( 3 )
	Description:SetDecodeUpdatesPerLetter( 4 )
	Description:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 18, 0, _1080p * -71, _1080p * -49 )
	Description:SubscribeToModelThroughElement( self, "desc", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.desc:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			Description:setText( LocalizeString( f4_local0 ), 0 )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local f1_local8 = nil
	if not CONDITIONS.IsThirdGameMode( self ) then
		f1_local8 = LUI.UIStyledText.new()
		f1_local8.id = "ItemName"
		f1_local8:SetFontSize( 38 * _1080p )
		f1_local8:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f1_local8:SetAlignment( LUI.Alignment.Left )
		f1_local8:SetOptOutRightToLeftAlignmentFlip( true )
		f1_local8:SetDecodeLetterLength( 30 )
		f1_local8:SetDecodeMaxRandChars( 6 )
		f1_local8:SetDecodeUpdatesPerLetter( 4 )
		f1_local8:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 18, _1080p * 502, _1080p * -126, _1080p * -88 )
		f1_local8:SubscribeToModelThroughElement( self, "text", function ()
			local f5_local0 = self:GetDataSource()
			f5_local0 = f5_local0.text:GetValue( f1_local1 )
			if f5_local0 ~= nil then
				f1_local8:setText( LocalizeString( f5_local0 ), 0 )
			end
		end )
		self:addElement( f1_local8 )
		self.ItemName = f1_local8
	end
	local Total = nil
	
	Total = LUI.UIStyledText.new()
	Total.id = "Total"
	Total:SetFontSize( 20 * _1080p )
	Total:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Total:SetAlignment( LUI.Alignment.Center )
	Total:SetOptOutRightToLeftAlignmentFlip( true )
	Total:SetShadowMinDistance( -0.2, 0 )
	Total:SetShadowMaxDistance( 0.2, 0 )
	Total:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -510, _1080p * -260, _1080p * -116, _1080p * -96 )
	Total:SubscribeToModelThroughElement( self, "count", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.count:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			Total:setText( LocalizeIntoString( f6_local0, "LUA_MENU_MP_MEDAL_TIMES_USED" ), 0 )
		end
	end )
	self:addElement( Total )
	self.Total = Total
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MedalIconLarge:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.MedalIconLarge:SetAlpha( 0, 0 )
				end
			}
		} )
		MedalIconSmall:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.MedalIconSmall:SetAlpha( 0, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Lock:SetScale( 0, 0 )
				end,
				function ()
					return self.Lock:SetScale( 0.1, 100 )
				end,
				function ()
					return self.Lock:SetScale( 0, 100 )
				end
			}
		} )
		Total:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Total:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			MedalIconLarge:AnimateSequence( "Locked" )
			MedalIconSmall:AnimateSequence( "Locked" )
			Lock:AnimateSequence( "Locked" )
			Total:AnimateSequence( "Locked" )
		end
		
		MedalIconLarge:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.MedalIconLarge:SetAlpha( 0.1, 0 )
				end
			},
			{
				function ()
					return self.MedalIconLarge:SetScale( -0.25, 0 )
				end,
				function ()
					return self.MedalIconLarge:SetScale( 0.75, 400, LUI.EASING.outBack )
				end
			}
		} )
		MedalIconSmall:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.MedalIconSmall:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.MedalIconSmall:SetScale( -0.25, 0 )
				end,
				function ()
					return self.MedalIconSmall:SetScale( 0, 300, LUI.EASING.outBack )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		Total:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Total:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			MedalIconLarge:AnimateSequence( "Unlocked" )
			MedalIconSmall:AnimateSequence( "Unlocked" )
			Lock:AnimateSequence( "Unlocked" )
			Total:AnimateSequence( "Unlocked" )
		end
		
		MedalIconLarge:RegisterAnimationSequence( "UnlockedNoCount", {
			{
				function ()
					return self.MedalIconLarge:SetScale( -0.25, 0 )
				end,
				function ()
					return self.MedalIconLarge:SetScale( 0.75, 400, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MedalIconLarge:SetAlpha( 0.1, 0 )
				end
			}
		} )
		MedalIconSmall:RegisterAnimationSequence( "UnlockedNoCount", {
			{
				function ()
					return self.MedalIconSmall:SetScale( -0.25, 0 )
				end,
				function ()
					return self.MedalIconSmall:SetScale( 0, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MedalIconSmall:SetAlpha( 1, 0 )
				end
			}
		} )
		Total:RegisterAnimationSequence( "UnlockedNoCount", {
			{
				function ()
					return self.Total:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.UnlockedNoCount = function ()
			MedalIconLarge:AnimateSequence( "UnlockedNoCount" )
			MedalIconSmall:AnimateSequence( "UnlockedNoCount" )
			Total:AnimateSequence( "UnlockedNoCount" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f1_local10 = function ()
		local f34_local0 = self:GetDataSource()
		if f34_local0.achieved:GetValue( f1_local1 ) ~= nil then
			f34_local0 = self:GetDataSource()
			if f34_local0.achieved:GetValue( f1_local1 ) == true then
				f34_local0 = self:GetDataSource()
				if f34_local0.count:GetValue( f1_local1 ) ~= nil then
					f34_local0 = self:GetDataSource()
					if f34_local0.count:GetValue( f1_local1 ) > 0 then
						ACTIONS.AnimateSequence( self, "Unlocked" )
					end
				end
			end
		end
		f34_local0 = self:GetDataSource()
		if f34_local0.achieved:GetValue( f1_local1 ) ~= nil then
			f34_local0 = self:GetDataSource()
			if f34_local0.achieved:GetValue( f1_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Locked" )
			end
		end
		f34_local0 = self:GetDataSource()
		if f34_local0.achieved:GetValue( f1_local1 ) ~= nil then
			f34_local0 = self:GetDataSource()
			if f34_local0.achieved:GetValue( f1_local1 ) == true then
				f34_local0 = self:GetDataSource()
				if f34_local0.count:GetValue( f1_local1 ) ~= nil then
					f34_local0 = self:GetDataSource()
					if f34_local0.count:GetValue( f1_local1 ) <= 0 then
						ACTIONS.AnimateSequence( self, "UnlockedNoCount" )
					end
				end
			end
		end
	end
	
	self:SubscribeToModelThroughElement( self, "achieved", f1_local10 )
	self:SubscribeToModelThroughElement( self, "count", f1_local10 )
	return self
end

MenuBuilder.registerType( "MedalInfo", MedalInfo )
LockTable( _M )
