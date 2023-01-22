local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.fortuneCardButton )
	f1_arg0.fortuneCardButton:SetFocusable( false )
end

function CPCombatRecordCardStats( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 358 * _1080p, 0, 326 * _1080p )
	self.id = "CPCombatRecordCardStats"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Flames = nil
	
	Flames = LUI.UIImage.new()
	Flames.id = "Flames"
	Flames:setImage( RegisterMaterial( "zm_wc_fire_loop" ), 0 )
	Flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2, _1080p * 337.02, _1080p * -328.5, _1080p * 138 )
	self:addElement( Flames )
	self.Flames = Flames
	
	local CardNameBacking = nil
	
	CardNameBacking = LUI.UIImage.new()
	CardNameBacking.id = "CardNameBacking"
	CardNameBacking:SetRGBFromInt( 0, 0 )
	CardNameBacking:SetAlpha( 0.5, 0 )
	CardNameBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 1508, _1080p * 35, _1080p * 135 )
	self:addElement( CardNameBacking )
	self.CardNameBacking = CardNameBacking
	
	local CardNameBackingLeftBar = nil
	
	CardNameBackingLeftBar = LUI.UIImage.new()
	CardNameBackingLeftBar.id = "CardNameBackingLeftBar"
	CardNameBackingLeftBar:SetAlpha( 0.5, 0 )
	CardNameBackingLeftBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 8, _1080p * 35, _1080p * 135 )
	self:addElement( CardNameBackingLeftBar )
	self.CardNameBackingLeftBar = CardNameBackingLeftBar
	
	local TitleBacking = nil
	
	TitleBacking = LUI.UIImage.new()
	TitleBacking.id = "TitleBacking"
	TitleBacking:SetRGBFromTable( SWATCHES.genericMenu.breadcrumbs, 0 )
	TitleBacking:SetAlpha( 0.35, 0 )
	TitleBacking:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1500, 0, _1080p * 35 )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local CardName = nil
	
	CardName = LUI.UIStyledText.new()
	CardName.id = "CardName"
	CardName:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	CardName:SetFontSize( 60 * _1080p )
	CardName:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	CardName:SetAlignment( LUI.Alignment.Left )
	CardName:SetOptOutRightToLeftAlignmentFlip( true )
	CardName:SetStartupDelay( 2000 )
	CardName:SetLineHoldTime( 400 )
	CardName:SetAnimMoveTime( 300 )
	CardName:SetEndDelay( 1500 )
	CardName:SetCrossfadeTime( 750 )
	CardName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	CardName:SetMaxVisibleLines( 1 )
	CardName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 35, _1080p * 560, _1080p * 58, _1080p * 118 )
	CardName:SubscribeToModelThroughElement( self, "name", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.name:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			CardName:setText( ToUpperCase( LocalizeString( f3_local0 ) ), 0 )
		end
	end )
	self:addElement( CardName )
	self.CardName = CardName
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:setText( "MOST USED CARD TITLE HERE", 0 )
	Title:SetFontSize( 34 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetOptOutRightToLeftAlignmentFlip( true )
	Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 750, _1080p * 1, _1080p * 35 )
	self:addElement( Title )
	self.Title = Title
	
	local UsesStat = nil
	
	UsesStat = MenuBuilder.BuildRegisteredType( "CPCombatRecordStat", {
		controllerIndex = f2_local1
	} )
	UsesStat.id = "UsesStat"
	UsesStat.Label:setText( ToUpperCase( Engine.Localize( "ZM_CONSUMABLES_USES" ) ), 0 )
	UsesStat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 285, _1080p * 485, _1080p * 125, _1080p * 225 )
	UsesStat:SubscribeToModelThroughElement( self, "timesUsed", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.timesUsed:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			UsesStat.AmountLabel:setText( f4_local0, 0 )
		end
	end )
	self:addElement( UsesStat )
	self.UsesStat = UsesStat
	
	local fortuneCardButton = nil
	
	fortuneCardButton = MenuBuilder.BuildRegisteredType( "fortuneCardNoButton", {
		controllerIndex = f2_local1
	} )
	fortuneCardButton.id = "fortuneCardButton"
	fortuneCardButton:SetAlpha( 0, 0 )
	fortuneCardButton:SetDataSourceThroughElement( self, nil )
	fortuneCardButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40, _1080p * 213, _1080p * 110, _1080p * 349 )
	self:addElement( fortuneCardButton )
	self.fortuneCardButton = fortuneCardButton
	
	local CardBacking = nil
	
	CardBacking = LUI.UIImage.new()
	CardBacking.id = "CardBacking"
	CardBacking:setImage( RegisterMaterial( "zm_wc_fate_card_base_persp" ), 0 )
	CardBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1.1, _1080p * 303.02, _1080p * 112.88, _1080p * 550.26 )
	self:addElement( CardBacking )
	self.CardBacking = CardBacking
	
	local CardIcon = nil
	
	CardIcon = LUI.UIImage.new()
	CardIcon.id = "CardIcon"
	CardIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 50, _1080p * 252, _1080p * 206, _1080p * 419 )
	CardIcon:SubscribeToModelThroughElement( self, "icon", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.icon:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			CardIcon:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( CardIcon )
	self.CardIcon = CardIcon
	
	local DescriptionGradientBacking = nil
	
	DescriptionGradientBacking = LUI.UIImage.new()
	DescriptionGradientBacking.id = "DescriptionGradientBacking"
	DescriptionGradientBacking:SetRGBFromInt( 0, 0 )
	DescriptionGradientBacking:SetAlpha( 0, 0 )
	DescriptionGradientBacking:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DescriptionGradientBacking:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1500, _1080p * 135, _1080p * 190 )
	self:addElement( DescriptionGradientBacking )
	self.DescriptionGradientBacking = DescriptionGradientBacking
	
	local DescriptionBackingLeftBar = nil
	
	DescriptionBackingLeftBar = LUI.UIImage.new()
	DescriptionBackingLeftBar.id = "DescriptionBackingLeftBar"
	DescriptionBackingLeftBar:SetAlpha( 0, 0 )
	DescriptionBackingLeftBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3, _1080p * 7, _1080p * 142, _1080p * 158 )
	self:addElement( DescriptionBackingLeftBar )
	self.DescriptionBackingLeftBar = DescriptionBackingLeftBar
	
	local Description = nil
	
	Description = LUI.UIStyledText.new()
	Description.id = "Description"
	Description:SetAlpha( 0, 0 )
	Description:SetFontSize( 24 * _1080p )
	Description:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Description:SetAlignment( LUI.Alignment.Left )
	Description:SetOptOutRightToLeftAlignmentFlip( true )
	Description:SetDecodeLetterLength( 20 )
	Description:SetDecodeMaxRandChars( 6 )
	Description:SetDecodeUpdatesPerLetter( 4 )
	Description:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 18, _1080p * 898, _1080p * 139, _1080p * 163 )
	Description:SubscribeToModelThroughElement( self, "desc", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.desc:GetValue( f2_local1 )
		if f6_local0 ~= nil then
			Description:setText( LocalizeString( f6_local0 ), 0 )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CardName:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.CardName:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NoStats = function ()
			CardName:AnimateSequence( "NoStats" )
		end
		
		CardBacking:RegisterAnimationSequence( "FortuneCardBacking", {
			{
				function ()
					return self.CardBacking:setImage( RegisterMaterial( "zm_wc_fortune_card_base_persp" ), 0 )
				end
			}
		} )
		self._sequences.FortuneCardBacking = function ()
			CardBacking:AnimateSequence( "FortuneCardBacking" )
		end
		
		CardBacking:RegisterAnimationSequence( "FateCardBacking", {
			{
				function ()
					return self.CardBacking:setImage( RegisterMaterial( "zm_wc_fate_card_base_persp" ), 0 )
				end
			}
		} )
		self._sequences.FateCardBacking = function ()
			CardBacking:AnimateSequence( "FateCardBacking" )
		end
		
		Flames:RegisterAnimationSequence( "CardDetailsLayout", {
			{
				function ()
					return self.Flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 281.9, _1080p * 620.92, _1080p * -246.5, _1080p * 220, 0 )
				end
			}
		} )
		CardNameBacking:RegisterAnimationSequence( "CardDetailsLayout", {
			{
				function ()
					return self.CardNameBacking:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1500, _1080p * 35, _1080p * 135, 0 )
				end
			}
		} )
		CardNameBackingLeftBar:RegisterAnimationSequence( "CardDetailsLayout", {
			{
				function ()
					return self.CardNameBackingLeftBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 8, _1080p * 35, _1080p * 135, 0 )
				end
			}
		} )
		TitleBacking:RegisterAnimationSequence( "CardDetailsLayout", {
			{
				function ()
					return self.TitleBacking:SetAlpha( 0, 0 )
				end
			}
		} )
		Title:RegisterAnimationSequence( "CardDetailsLayout", {
			{
				function ()
					return self.Title:SetAlpha( 0, 0 )
				end
			}
		} )
		UsesStat:RegisterAnimationSequence( "CardDetailsLayout", {
			{
				function ()
					return self.UsesStat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 567, _1080p * 767, _1080p * 220, _1080p * 320, 0 )
				end
			}
		} )
		CardBacking:RegisterAnimationSequence( "CardDetailsLayout", {
			{
				function ()
					return self.CardBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 280.9, _1080p * 585.02, _1080p * 199.88, _1080p * 637.26, 0 )
				end
			}
		} )
		CardIcon:RegisterAnimationSequence( "CardDetailsLayout", {
			{
				function ()
					return self.CardIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 332, _1080p * 534, _1080p * 293, _1080p * 506, 0 )
				end
			}
		} )
		DescriptionGradientBacking:RegisterAnimationSequence( "CardDetailsLayout", {
			{
				function ()
					return self.DescriptionGradientBacking:SetAlpha( 1, 0 )
				end
			}
		} )
		DescriptionBackingLeftBar:RegisterAnimationSequence( "CardDetailsLayout", {
			{
				function ()
					return self.DescriptionBackingLeftBar:SetAlpha( 0.5, 0 )
				end
			}
		} )
		Description:RegisterAnimationSequence( "CardDetailsLayout", {
			{
				function ()
					return self.Description:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.CardDetailsLayout = function ()
			Flames:AnimateSequence( "CardDetailsLayout" )
			CardNameBacking:AnimateSequence( "CardDetailsLayout" )
			CardNameBackingLeftBar:AnimateSequence( "CardDetailsLayout" )
			TitleBacking:AnimateSequence( "CardDetailsLayout" )
			Title:AnimateSequence( "CardDetailsLayout" )
			UsesStat:AnimateSequence( "CardDetailsLayout" )
			CardBacking:AnimateSequence( "CardDetailsLayout" )
			CardIcon:AnimateSequence( "CardDetailsLayout" )
			DescriptionGradientBacking:AnimateSequence( "CardDetailsLayout" )
			DescriptionBackingLeftBar:AnimateSequence( "CardDetailsLayout" )
			Description:AnimateSequence( "CardDetailsLayout" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	fortuneCardButton:SetDataSourceThroughElement( self, nil )
	self:SubscribeToModelThroughElement( self, "backing", function ()
		local f27_local0 = self:GetDataSource()
		if f27_local0.backing:GetValue( f2_local1 ) ~= nil then
			f27_local0 = self:GetDataSource()
			if f27_local0.backing:GetValue( f2_local1 ) == "zm_wc_fate_card_base" then
				ACTIONS.AnimateSequence( self, "FateCardBacking" )
			end
		end
		f27_local0 = self:GetDataSource()
		if f27_local0.backing:GetValue( f2_local1 ) ~= nil then
			f27_local0 = self:GetDataSource()
			if f27_local0.backing:GetValue( f2_local1 ) == "zm_wc_fortune_card_base" then
				ACTIONS.AnimateSequence( self, "FortuneCardBacking" )
			end
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "CPCombatRecordCardStats", CPCombatRecordCardStats )
LockTable( _M )
