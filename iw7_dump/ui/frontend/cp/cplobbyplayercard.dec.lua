local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CPLobbyPlayerCard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 434 * _1080p, 0, 190 * _1080p )
	self.id = "CPLobbyPlayerCard"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local FocusedHighlight = nil
	
	FocusedHighlight = LUI.UIImage.new()
	FocusedHighlight.id = "FocusedHighlight"
	FocusedHighlight:SetRGBFromTable( SWATCHES.genericMenu.border, 0 )
	FocusedHighlight:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 126 )
	self:addElement( FocusedHighlight )
	self.FocusedHighlight = FocusedHighlight
	
	local Emblem = nil
	
	Emblem = LUI.UIImage.new()
	Emblem.id = "Emblem"
	Emblem:SetUseAA( true )
	Emblem:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4, _1080p * 122.19, _1080p * 3.5, _1080p * 122.5 )
	Emblem:SubscribeToModelThroughElement( self, "emblem", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.emblem:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Emblem:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( Emblem )
	self.Emblem = Emblem
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetUseAA( true )
	Background:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -308, _1080p * -3.19, _1080p * 3.5, _1080p * 122.5 )
	Background:SubscribeToModelThroughElement( self, "background", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.background:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Background:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( Background )
	self.Background = Background
	
	local Darken = nil
	
	Darken = LUI.UIImage.new()
	Darken.id = "Darken"
	Darken:SetRGBFromInt( 0, 0 )
	Darken:SetAlpha( 0.5, 0 )
	Darken:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -308, _1080p * -3.19, _1080p * 94.5, _1080p * 119.5 )
	self:addElement( Darken )
	self.Darken = Darken
	
	local FullName = nil
	
	FullName = LUI.UIStyledText.new()
	FullName.id = "FullName"
	FullName:SetFontSize( 19 * _1080p )
	FullName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FullName:SetAlignment( LUI.Alignment.Left )
	FullName:SetShadowRGBFromInt( 0, 0 )
	FullName:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -304, _1080p * -3.19, _1080p * 97.5, _1080p * 116.5 )
	FullName:SubscribeToModelThroughElement( self, "fullName", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.fullName:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			FullName:setText( f4_local0, 0 )
		end
	end )
	self:addElement( FullName )
	self.FullName = FullName
	
	local RankBacker = nil
	
	RankBacker = LUI.UIImage.new()
	RankBacker.id = "RankBacker"
	RankBacker:SetRGBFromInt( 0, 0 )
	RankBacker:SetAlpha( 0.5, 0 )
	RankBacker:setImage( RegisterMaterial( "hud_glow" ), 0 )
	RankBacker:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -92, _1080p * 8, _1080p * 2.5, _1080p * 48.5 )
	self:addElement( RankBacker )
	self.RankBacker = RankBacker
	
	local Rank = nil
	
	Rank = LUI.UIStyledText.new()
	Rank.id = "Rank"
	Rank:SetFontSize( 28 * _1080p )
	Rank:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Rank:SetAlignment( LUI.Alignment.Right )
	Rank:SetShadowMinDistance( -0.3, 0 )
	Rank:SetShadowMaxDistance( 0.3, 0 )
	Rank:SetShadowRGBFromInt( 0, 0 )
	Rank:SetOutlineMinDistance( -0.4, 0 )
	Rank:SetOutlineRGBFromInt( 0, 0 )
	Rank:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -78, _1080p * -10, _1080p * 11.5, _1080p * 39.5 )
	Rank:SubscribeToModelThroughElement( self, "displayRank", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.displayRank:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			Rank:setText( f5_local0, 0 )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local RankIcon = nil
	
	RankIcon = LUI.UIImage.new()
	RankIcon.id = "RankIcon"
	RankIcon:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -68.81, _1080p * -28.81, _1080p * 5.5, _1080p * 48.5 )
	RankIcon:SubscribeToModelThroughElement( self, "rankIcon", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.rankIcon:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			RankIcon:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local FAFCard5Image = nil
	
	FAFCard5Image = LUI.UIImage.new()
	FAFCard5Image.id = "FAFCard5Image"
	FAFCard5Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 337, _1080p * 408, _1080p * 112.92, _1080p * 183.92 )
	FAFCard5Image:SubscribeToModelThroughElement( self, "zombiesConsumables.cardSlot5Icon", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.zombiesConsumables.cardSlot5Icon:GetValue( f1_local1 )
		if f7_local0 ~= nil then
			FAFCard5Image:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	self:addElement( FAFCard5Image )
	self.FAFCard5Image = FAFCard5Image
	
	local FAFCard4Image = nil
	
	FAFCard4Image = LUI.UIImage.new()
	FAFCard4Image.id = "FAFCard4Image"
	FAFCard4Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 255, _1080p * 326, _1080p * 112.92, _1080p * 183.92 )
	FAFCard4Image:SubscribeToModelThroughElement( self, "zombiesConsumables.cardSlot4Icon", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.zombiesConsumables.cardSlot4Icon:GetValue( f1_local1 )
		if f8_local0 ~= nil then
			FAFCard4Image:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	self:addElement( FAFCard4Image )
	self.FAFCard4Image = FAFCard4Image
	
	local FAFCard3Image = nil
	
	FAFCard3Image = LUI.UIImage.new()
	FAFCard3Image.id = "FAFCard3Image"
	FAFCard3Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 173.5, _1080p * 244.5, _1080p * 112.92, _1080p * 183.92 )
	FAFCard3Image:SubscribeToModelThroughElement( self, "zombiesConsumables.cardSlot3Icon", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.zombiesConsumables.cardSlot3Icon:GetValue( f1_local1 )
		if f9_local0 ~= nil then
			FAFCard3Image:setImage( RegisterMaterial( f9_local0 ), 0 )
		end
	end )
	self:addElement( FAFCard3Image )
	self.FAFCard3Image = FAFCard3Image
	
	local FAFCard2Image = nil
	
	FAFCard2Image = LUI.UIImage.new()
	FAFCard2Image.id = "FAFCard2Image"
	FAFCard2Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 91.5, _1080p * 162.5, _1080p * 112.92, _1080p * 183.92 )
	FAFCard2Image:SubscribeToModelThroughElement( self, "zombiesConsumables.cardSlot2Icon", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.zombiesConsumables.cardSlot2Icon:GetValue( f1_local1 )
		if f10_local0 ~= nil then
			FAFCard2Image:setImage( RegisterMaterial( f10_local0 ), 0 )
		end
	end )
	self:addElement( FAFCard2Image )
	self.FAFCard2Image = FAFCard2Image
	
	local FAFCard1Image = nil
	
	FAFCard1Image = LUI.UIImage.new()
	FAFCard1Image.id = "FAFCard1Image"
	FAFCard1Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10.5, _1080p * 81.5, _1080p * 112.92, _1080p * 183.92 )
	FAFCard1Image:SubscribeToModelThroughElement( self, "zombiesConsumables.cardSlot1Icon", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.zombiesConsumables.cardSlot1Icon:GetValue( f1_local1 )
		if f11_local0 ~= nil then
			FAFCard1Image:setImage( RegisterMaterial( f11_local0 ), 0 )
		end
	end )
	self:addElement( FAFCard1Image )
	self.FAFCard1Image = FAFCard1Image
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		FocusedHighlight:RegisterAnimationSequence( "GainFocus", {
			{
				function ()
					return self.FocusedHighlight:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
				end
			}
		} )
		self._sequences.GainFocus = function ()
			FocusedHighlight:AnimateSequence( "GainFocus" )
		end
		
		FocusedHighlight:RegisterAnimationSequence( "LoseFocus", {
			{
				function ()
					return self.FocusedHighlight:SetRGBFromTable( SWATCHES.genericMenu.border, 0 )
				end
			}
		} )
		self._sequences.LoseFocus = function ()
			FocusedHighlight:AnimateSequence( "LoseFocus" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "gain_focus", function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "GainFocus" )
	end )
	self:addEventHandler( "lose_focus", function ( f19_arg0, f19_arg1 )
		local f19_local0 = f19_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "LoseFocus" )
	end )
	return self
end

MenuBuilder.registerType( "CPLobbyPlayerCard", CPLobbyPlayerCard )
LockTable( _M )
