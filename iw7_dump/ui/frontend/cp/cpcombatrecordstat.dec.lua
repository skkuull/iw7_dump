local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CPCombatRecordStat( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 100 * _1080p )
	self.id = "CPCombatRecordStat"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BackgroundLeft = nil
	
	BackgroundLeft = LUI.UIImage.new()
	BackgroundLeft.id = "BackgroundLeft"
	BackgroundLeft:SetRGBFromInt( 0, 0 )
	BackgroundLeft:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	BackgroundLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * -100, 0, 0 )
	self:addElement( BackgroundLeft )
	self.BackgroundLeft = BackgroundLeft
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	self:addElement( Background )
	self.Background = Background
	
	local TopBarLeft = nil
	
	TopBarLeft = LUI.UIImage.new()
	TopBarLeft.id = "TopBarLeft"
	TopBarLeft:SetAlpha( 0.75, 0 )
	TopBarLeft:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	TopBarLeft:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * -100, 0, _1080p * 3 )
	self:addElement( TopBarLeft )
	self.TopBarLeft = TopBarLeft
	
	local TopBar = nil
	
	TopBar = LUI.UIImage.new()
	TopBar.id = "TopBar"
	TopBar:SetAlpha( 0.75, 0 )
	TopBar:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	TopBar:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 3 )
	self:addElement( TopBar )
	self.TopBar = TopBar
	
	local BottomBarLeft = nil
	
	BottomBarLeft = LUI.UIImage.new()
	BottomBarLeft.id = "BottomBarLeft"
	BottomBarLeft:SetAlpha( 0.75, 0 )
	BottomBarLeft:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	BottomBarLeft:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * -100, _1080p * -3, 0 )
	self:addElement( BottomBarLeft )
	self.BottomBarLeft = BottomBarLeft
	
	local BottomBar = nil
	
	BottomBar = LUI.UIImage.new()
	BottomBar.id = "BottomBar"
	BottomBar:SetAlpha( 0.75, 0 )
	BottomBar:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	BottomBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -3, 0 )
	self:addElement( BottomBar )
	self.BottomBar = BottomBar
	
	local AmountLabel = nil
	
	AmountLabel = LUI.UIStyledText.new()
	AmountLabel.id = "AmountLabel"
	AmountLabel:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
	AmountLabel:setText( "Amount", 0 )
	AmountLabel:SetFontSize( 55 * _1080p )
	AmountLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	AmountLabel:SetAlignment( LUI.Alignment.Left )
	AmountLabel:SetOptOutRightToLeftAlignmentFlip( true )
	AmountLabel:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 30, _1080p * 30, _1080p * -59, _1080p * -7 )
	self:addElement( AmountLabel )
	self.AmountLabel = AmountLabel
	
	local Label = nil
	
	Label = LUI.UIStyledText.new()
	Label.id = "Label"
	Label:setText( ToUpperCase( "Label" ), 0 )
	Label:SetFontSize( 30 * _1080p )
	Label:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Label:SetAlignment( LUI.Alignment.Left )
	Label:SetOptOutRightToLeftAlignmentFlip( true )
	Label:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 30, _1080p * 130, _1080p * 11, _1080p * 41 )
	self:addElement( Label )
	self.Label = Label
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetAlpha( 0, 0 )
	Icon:setImage( RegisterMaterial( "category_icon_kills" ), 0 )
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -124, _1080p * 35, _1080p * -22, _1080p * 137 )
	self:addElement( Icon )
	self.Icon = Icon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AmountLabel:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.AmountLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		Label:RegisterAnimationSequence( "NoStats", {
			{
				function ()
					return self.Label:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NoStats = function ()
			AmountLabel:AnimateSequence( "NoStats" )
			Label:AnimateSequence( "NoStats" )
		end
		
		BackgroundLeft:RegisterAnimationSequence( "CondensedIcon", {
			{
				function ()
					return self.BackgroundLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		Background:RegisterAnimationSequence( "CondensedIcon", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 40, 0, 0 )
				end
			}
		} )
		TopBarLeft:RegisterAnimationSequence( "CondensedIcon", {
			{
				function ()
					return self.TopBarLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		TopBar:RegisterAnimationSequence( "CondensedIcon", {
			{
				function ()
					return self.TopBar:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 40, _1080p * 43, 0 )
				end
			}
		} )
		BottomBarLeft:RegisterAnimationSequence( "CondensedIcon", {
			{
				function ()
					return self.BottomBarLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		AmountLabel:RegisterAnimationSequence( "CondensedIcon", {
			{
				function ()
					return self.AmountLabel:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.AmountLabel:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 25, _1080p * 25, _1080p * -57, _1080p * -3, 0 )
				end
			}
		} )
		Label:RegisterAnimationSequence( "CondensedIcon", {
			{
				function ()
					return self.Label:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 25, _1080p * 125, _1080p * 8, _1080p * 38, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "CondensedIcon", {
			{
				function ()
					return self.Icon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.CondensedIcon = function ()
			BackgroundLeft:AnimateSequence( "CondensedIcon" )
			Background:AnimateSequence( "CondensedIcon" )
			TopBarLeft:AnimateSequence( "CondensedIcon" )
			TopBar:AnimateSequence( "CondensedIcon" )
			BottomBarLeft:AnimateSequence( "CondensedIcon" )
			AmountLabel:AnimateSequence( "CondensedIcon" )
			Label:AnimateSequence( "CondensedIcon" )
			Icon:AnimateSequence( "CondensedIcon" )
		end
		
		BackgroundLeft:RegisterAnimationSequence( "Condensed", {
			{
				function ()
					return self.BackgroundLeft:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BackgroundLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * -50, _1080p * 40, 0, 0 )
				end
			}
		} )
		Background:RegisterAnimationSequence( "Condensed", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 40, 0, 0 )
				end
			}
		} )
		TopBarLeft:RegisterAnimationSequence( "Condensed", {
			{
				function ()
					return self.TopBarLeft:SetAlpha( 0.75, 0 )
				end
			},
			{
				function ()
					return self.TopBarLeft:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * -50, _1080p * 40, _1080p * 43, 0 )
				end
			}
		} )
		TopBar:RegisterAnimationSequence( "Condensed", {
			{
				function ()
					return self.TopBar:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 40, _1080p * 43, 0 )
				end
			}
		} )
		BottomBarLeft:RegisterAnimationSequence( "Condensed", {
			{
				function ()
					return self.BottomBarLeft:SetAlpha( 0.75, 0 )
				end
			},
			{
				function ()
					return self.BottomBarLeft:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * -50, _1080p * -3, 0, 0 )
				end
			}
		} )
		AmountLabel:RegisterAnimationSequence( "Condensed", {
			{
				function ()
					return self.AmountLabel:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -57, _1080p * -3, 0 )
				end
			}
		} )
		Label:RegisterAnimationSequence( "Condensed", {
			{
				function ()
					return self.Label:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * 100, _1080p * 8, _1080p * 38, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "Condensed", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Condensed = function ()
			BackgroundLeft:AnimateSequence( "Condensed" )
			Background:AnimateSequence( "Condensed" )
			TopBarLeft:AnimateSequence( "Condensed" )
			TopBar:AnimateSequence( "Condensed" )
			BottomBarLeft:AnimateSequence( "Condensed" )
			AmountLabel:AnimateSequence( "Condensed" )
			Label:AnimateSequence( "Condensed" )
			Icon:AnimateSequence( "Condensed" )
		end
		
		AmountLabel:RegisterAnimationSequence( "Shifted", {
			{
				function ()
					return self.AmountLabel:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -16, _1080p * 73, _1080p * -55, _1080p * -3, 0 )
				end
			}
		} )
		Label:RegisterAnimationSequence( "Shifted", {
			{
				function ()
					return self.Label:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -16, _1080p * 84, _1080p * 11, _1080p * 41, 0 )
				end
			}
		} )
		self._sequences.Shifted = function ()
			AmountLabel:AnimateSequence( "Shifted" )
			Label:AnimateSequence( "Shifted" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "CPCombatRecordStat", CPCombatRecordStat )
LockTable( _M )
