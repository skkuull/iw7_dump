local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg2.cardPackOpening then
		f1_arg0:SetHandleMouseButton( false )
	end
end

function fortuneCardButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 173 * _1080p, 0, 239 * _1080p )
	self.id = "fortuneCardButton"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local CardBacking = nil
	
	CardBacking = LUI.UIImage.new()
	CardBacking.id = "CardBacking"
	CardBacking:SetScale( -0.29, 0 )
	CardBacking:SetUseAA( true )
	CardBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -42.38, _1080p * 213.62, _1080p * -71.68, _1080p * 440.32 )
	CardBacking:SubscribeToModelThroughElement( self, "backing", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.backing:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			CardBacking:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( CardBacking )
	self.CardBacking = CardBacking
	
	local HighlightGlow = nil
	
	HighlightGlow = LUI.UIImage.new()
	HighlightGlow.id = "HighlightGlow"
	HighlightGlow:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	HighlightGlow:SetAlpha( 0, 0 )
	HighlightGlow:setImage( RegisterMaterial( "cp_faf_card_selected_highlight" ), 0 )
	HighlightGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -68.61, _1080p * 234.39, _1080p * -80.5, _1080p * 315.5 )
	self:addElement( HighlightGlow )
	self.HighlightGlow = HighlightGlow
	
	local CardIcon = nil
	
	CardIcon = LUI.UIImage.new()
	CardIcon.id = "CardIcon"
	CardIcon:SetScale( -0.07, 0 )
	CardIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21.62, _1080p * 149.62, _1080p * 52.59, _1080p * 180.59 )
	CardIcon:SubscribeToModelThroughElement( self, "icon", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.icon:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			CardIcon:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( CardIcon )
	self.CardIcon = CardIcon
	
	local lock = nil
	
	lock = LUI.UIImage.new()
	lock.id = "lock"
	lock:SetScale( -0.75, 0 )
	lock:setImage( RegisterMaterial( "cp_wepbuild_lock" ), 0 )
	lock:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -8, _1080p * 182, _1080p * 10.84, _1080p * 220.34 )
	self:addElement( lock )
	self.lock = lock
	
	local numOwnedBox = nil
	
	numOwnedBox = LUI.UIImage.new()
	numOwnedBox.id = "numOwnedBox"
	numOwnedBox:SetRGBFromInt( 8421504, 0 )
	numOwnedBox:setImage( RegisterMaterial( "zm_wc_fortune_owned_box" ), 0 )
	numOwnedBox:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 23, _1080p * 151, _1080p * 202.59, _1080p * 234.59 )
	self:addElement( numOwnedBox )
	self.numOwnedBox = numOwnedBox
	
	local numOwned = nil
	
	numOwned = LUI.UIText.new()
	numOwned.id = "numOwned"
	numOwned:SetFontSize( 30 * _1080p )
	numOwned:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	numOwned:SetAlignment( LUI.Alignment.Center )
	numOwned:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 44.32, _1080p * 126.92, _1080p * 204.59, _1080p * 234.59 )
	numOwned:SubscribeToModelThroughElement( self, "numOwned", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.numOwned:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			numOwned:setText( f5_local0, 0 )
		end
	end )
	self:addElement( numOwned )
	self.numOwned = numOwned
	
	local highlight = nil
	
	highlight = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 4,
		borderThicknessRight = _1080p * 4,
		borderThicknessTop = _1080p * 4,
		borderThicknessBottom = _1080p * 4
	} )
	highlight.id = "highlight"
	highlight:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	highlight:SetAlpha( 0, 0 )
	highlight:SetScale( 0.11, 0 )
	highlight:SetBorderThicknessLeft( _1080p * 4, 0 )
	highlight:SetBorderThicknessRight( _1080p * 4, 0 )
	highlight:SetBorderThicknessTop( _1080p * 4, 0 )
	highlight:SetBorderThicknessBottom( _1080p * 4, 0 )
	highlight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8.5, _1080p * 165.5, _1080p * 12.5, _1080p * 226.5 )
	self:addElement( highlight )
	self.highlight = highlight
	
	local CardName = nil
	
	CardName = LUI.UIText.new()
	CardName.id = "CardName"
	CardName:SetRGBFromInt( 16777215, 0 )
	CardName:SetFontSize( 20 * _1080p )
	CardName:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	CardName:SetAlignment( LUI.Alignment.Center )
	CardName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12.5, _1080p * 160.74, _1080p * 11.5, _1080p * 31.5 )
	CardName:SubscribeToModelThroughElement( self, "name", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.name:GetValue( f2_local1 )
		if f6_local0 ~= nil then
			CardName:setText( ToUpperCase( LocalizeString( f6_local0 ) ), 0 )
		end
	end )
	self:addElement( CardName )
	self.CardName = CardName
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		HighlightGlow:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.HighlightGlow:SetAlpha( 0.6, 0 )
				end
			}
		} )
		highlight:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.highlight:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			HighlightGlow:AnimateSequence( "ButtonOver" )
			highlight:AnimateSequence( "ButtonOver" )
		end
		
		HighlightGlow:RegisterAnimationSequence( "ButtonOff", {
			{
				function ()
					return self.HighlightGlow:SetAlpha( 0, 0 )
				end
			}
		} )
		highlight:RegisterAnimationSequence( "ButtonOff", {
			{
				function ()
					return self.highlight:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOff = function ()
			HighlightGlow:AnimateSequence( "ButtonOff" )
			highlight:AnimateSequence( "ButtonOff" )
		end
		
		CardIcon:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.CardIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		lock:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.lock:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			CardIcon:AnimateSequence( "Locked" )
			lock:AnimateSequence( "Locked" )
		end
		
		CardIcon:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.CardIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		lock:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			CardIcon:AnimateSequence( "Unlocked" )
			lock:AnimateSequence( "Unlocked" )
		end
		
		numOwnedBox:RegisterAnimationSequence( "hideOwned", {
			{
				function ()
					return self.numOwnedBox:SetAlpha( 0, 0 )
				end
			}
		} )
		numOwned:RegisterAnimationSequence( "hideOwned", {
			{
				function ()
					return self.numOwned:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hideOwned = function ()
			numOwnedBox:AnimateSequence( "hideOwned" )
			numOwned:AnimateSequence( "hideOwned" )
		end
		
		numOwnedBox:RegisterAnimationSequence( "showOwned", {
			{
				function ()
					return self.numOwnedBox:SetAlpha( 1, 0 )
				end
			}
		} )
		numOwned:RegisterAnimationSequence( "showOwned", {
			{
				function ()
					return self.numOwned:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.showOwned = function ()
			numOwnedBox:AnimateSequence( "showOwned" )
			numOwned:AnimateSequence( "showOwned" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f27_arg0, f27_arg1 )
		local f27_local0 = f27_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f28_arg0, f28_arg1 )
		local f28_local0 = f28_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "ButtonOff" )
	end )
	self:addEventHandler( "button_action", function ( f29_arg0, f29_arg1 )
		local f29_local0 = f29_arg1.controller or f2_local1
		local f29_local1 = self:GetDataSource()
		if f29_local1.isUnlocked:GetValue( f29_local0 ) ~= nil then
			f29_local1 = self:GetDataSource()
			if f29_local1.isUnlocked:GetValue( f29_local0 ) == true then
				f29_local1 = self:GetDataSource()
				if f29_local1.backing:GetValue( f29_local0 ) ~= nil then
					f29_local1 = self:GetDataSource()
					if f29_local1.backing:GetValue( f29_local0 ) == "zm_wc_fate_card_base" then
						ACTIONS.CardSetPlayerData( self, f29_arg0, f29_local0 )
						ACTIONS.LeaveMenu( self )
					end
				end
			end
		end
		f29_local1 = self:GetDataSource()
		if f29_local1.isUnlocked:GetValue( f29_local0 ) ~= nil then
			f29_local1 = self:GetDataSource()
			if f29_local1.isUnlocked:GetValue( f29_local0 ) == true then
				f29_local1 = self:GetDataSource()
				if f29_local1.backing:GetValue( f29_local0 ) ~= nil then
					f29_local1 = self:GetDataSource()
					if f29_local1.backing:GetValue( f29_local0 ) == "zm_wc_fortune_card_base" then
						f29_local1 = self:GetDataSource()
						if f29_local1.numOwned:GetValue( f29_local0 ) ~= nil then
							f29_local1 = self:GetDataSource()
							if f29_local1.numOwned:GetValue( f29_local0 ) > 0 then
								ACTIONS.CardSetPlayerData( self, f29_arg0, f29_local0 )
								ACTIONS.LeaveMenu( self )
							end
						end
					end
				end
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f30_local0 = self:GetDataSource()
		if f30_local0.isUnlocked:GetValue( f2_local1 ) ~= nil then
			f30_local0 = self:GetDataSource()
			if f30_local0.isUnlocked:GetValue( f2_local1 ) == true then
				ACTIONS.AnimateSequence( self, "Unlocked" )
			end
		end
		f30_local0 = self:GetDataSource()
		if f30_local0.isUnlocked:GetValue( f2_local1 ) ~= nil then
			f30_local0 = self:GetDataSource()
			if f30_local0.isUnlocked:GetValue( f2_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Locked" )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "backing", function ()
		local f31_local0 = self:GetDataSource()
		if f31_local0.backing:GetValue( f2_local1 ) ~= nil then
			f31_local0 = self:GetDataSource()
			if f31_local0.backing:GetValue( f2_local1 ) == "zm_wc_fortune_card_base" then
				ACTIONS.AnimateSequence( self, "showOwned" )
			end
		end
		f31_local0 = self:GetDataSource()
		if f31_local0.backing:GetValue( f2_local1 ) ~= nil then
			f31_local0 = self:GetDataSource()
			if f31_local0.backing:GetValue( f2_local1 ) == "zm_wc_fate_card_base" then
				ACTIONS.AnimateSequence( self, "hideOwned" )
			end
		end
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "fortuneCardButton", fortuneCardButton )
LockTable( _M )
