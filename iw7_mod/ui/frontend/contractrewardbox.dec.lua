local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.RewardImage )
	assert( f1_arg0.RewardDesc )
	assert( f1_arg0.RewardType )
	if f1_arg2.teamIndex ~= -1 or Engine.IsAliensMode() then
		assert( f1_arg2.color )
		f1_arg0.Title:SetRGBFromTable( COLORS.white )
		f1_arg0.Header:SetRGBFromInt( f1_arg2.color, 0 )
		f1_arg0.Border:SetRGBFromInt( f1_arg2.color, 0 )
	end
	local f1_local0 = Contracts.GetRewardData( f1_arg2.index, f1_arg1 )
	f1_arg0.RewardImage:setImage( RegisterMaterial( f1_local0.image ) )
	f1_arg0.RewardDesc:setText( Engine.Localize( f1_local0.desc ) )
	f1_arg0.RewardType:setText( ToUpperCase( Engine.Localize( f1_local0.name ) ) )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.SetupRewardBox = f0_local0
end

function ContractRewardBox( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 660 * _1080p, 0, 200 * _1080p )
	self.id = "ContractRewardBox"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.6, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	Border.id = "Border"
	Border:SetBorderThicknessLeft( _1080p * 2, 0 )
	Border:SetBorderThicknessRight( _1080p * 2, 0 )
	Border:SetBorderThicknessTop( _1080p * 2, 0 )
	Border:SetBorderThicknessBottom( _1080p * 2, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local Header = nil
	
	Header = LUI.UIImage.new()
	Header.id = "Header"
	Header:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 36 )
	self:addElement( Header )
	self.Header = Header
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:SetRGBFromInt( 0, 0 )
	Title:setText( ToUpperCase( Engine.Localize( "LUA_MENU_REWARD" ) ), 0 )
	Title:SetFontSize( 24 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 250, _1080p * -10, _1080p * 6, _1080p * 30 )
	self:addElement( Title )
	self.Title = Title
	
	local Flare2 = nil
	
	Flare2 = LUI.UIImage.new()
	Flare2.id = "Flare2"
	Flare2:SetRGBFromInt( 16776426, 0 )
	Flare2:SetAlpha( 0.1, 0 )
	Flare2:SetScale( -0.2, 0 )
	Flare2:setImage( RegisterMaterial( "loot_item_card_flare" ), 0 )
	Flare2:SetBlendMode( BLEND_MODE.addWithAlpha )
	Flare2:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -52, _1080p * 240, _1080p * -45, _1080p * 47 )
	self:addElement( Flare2 )
	self.Flare2 = Flare2
	
	local Flare = nil
	
	Flare = LUI.UIImage.new()
	Flare.id = "Flare"
	Flare:SetRGBFromInt( 16643793, 0 )
	Flare:SetAlpha( 0.5, 0 )
	Flare:setImage( RegisterMaterial( "loot_item_card_flare" ), 0 )
	Flare:SetBlendMode( BLEND_MODE.addWithAlpha )
	Flare:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -52, _1080p * 240, _1080p * -45, _1080p * 47 )
	self:addElement( Flare )
	self.Flare = Flare
	
	local RewardImage = nil
	
	RewardImage = LUI.UIImage.new()
	RewardImage.id = "RewardImage"
	RewardImage:setImage( RegisterMaterial( "icon_bribe_mk2" ), 0 )
	RewardImage:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -90, _1080p * 278, _1080p * 9, _1080p * -7 )
	self:addElement( RewardImage )
	self.RewardImage = RewardImage
	
	local RewardType = nil
	
	RewardType = LUI.UIStyledText.new()
	RewardType.id = "RewardType"
	RewardType:setText( "", 0 )
	RewardType:SetFontSize( 20 * _1080p )
	RewardType:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RewardType:SetAlignment( LUI.Alignment.Left )
	RewardType:SetStartupDelay( 1500 )
	RewardType:SetLineHoldTime( 400 )
	RewardType:SetAnimMoveTime( 300 )
	RewardType:SetEndDelay( 1000 )
	RewardType:SetCrossfadeTime( 500 )
	RewardType:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	RewardType:SetMaxVisibleLines( 1 )
	RewardType:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 250, _1080p * -10, _1080p * 46, _1080p * 66 )
	self:addElement( RewardType )
	self.RewardType = RewardType
	
	local RewardDesc = nil
	
	RewardDesc = LUI.UIStyledText.new()
	RewardDesc.id = "RewardDesc"
	RewardDesc:setText( "", 0 )
	RewardDesc:SetFontSize( 20 * _1080p )
	RewardDesc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RewardDesc:SetAlignment( LUI.Alignment.Left )
	RewardDesc:SetDecodeLetterLength( 12 )
	RewardDesc:SetDecodeMaxRandChars( 3 )
	RewardDesc:SetDecodeUpdatesPerLetter( 4 )
	RewardDesc:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 250, _1080p * -10, _1080p * 70, _1080p * 90 )
	self:addElement( RewardDesc )
	self.RewardDesc = RewardDesc
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Flare2:RegisterAnimationSequence( "FlareRotate", {
			{
				function ()
					return self.Flare2:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Flare2:SetZRotation( 360, 20000 )
				end
			}
		} )
		Flare:RegisterAnimationSequence( "FlareRotate", {
			{
				function ()
					return self.Flare:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Flare:SetZRotation( -360, 20000 )
				end
			},
			{
				function ()
					return self.Flare:SetScale( 0, 0 )
				end,
				function ()
					return self.Flare:SetScale( -0.1, 2000 )
				end,
				function ()
					return self.Flare:SetScale( 0, 2000 )
				end,
				function ()
					return self.Flare:SetScale( -0.1, 2000 )
				end,
				function ()
					return self.Flare:SetScale( 0, 2010 )
				end,
				function ()
					return self.Flare:SetScale( -0.1, 1990 )
				end,
				function ()
					return self.Flare:SetScale( 0, 2000 )
				end,
				function ()
					return self.Flare:SetScale( -0.1, 2000 )
				end,
				function ()
					return self.Flare:SetScale( 0, 2000 )
				end,
				function ()
					return self.Flare:SetScale( -0.1, 2000 )
				end,
				function ()
					return self.Flare:SetScale( 0, 2000 )
				end
			}
		} )
		self._sequences.FlareRotate = function ()
			Flare2:AnimateLoop( "FlareRotate" )
			Flare:AnimateLoop( "FlareRotate" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local1( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "FlareRotate" )
	return self
end

MenuBuilder.registerType( "ContractRewardBox", ContractRewardBox )
LockTable( _M )
