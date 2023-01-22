local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg2 )
	local f1_local0 = ""
	if f1_arg2.itemCardData.ref then
		f1_local0 = tostring( f1_arg2.itemCardData.ref:GetValue( f1_arg1 ) )
	end
	local f1_local1 = ""
	if f1_arg2.itemCardData.currencyType then
		f1_local1 = tostring( f1_arg2.itemCardData.currencyType:GetValue( f1_arg1 ) )
	end
	local f1_local2
	if f1_local1 ~= "Keys" and f1_local1 ~= "DailyKeys" and f1_local1 ~= "QM_Keys" then
		f1_local2 = false
	else
		f1_local2 = true
	end
	local f1_local3 = f1_local0 == "iw7_x2_token"
	local f1_local4 = f1_arg2.isDuplicate or false
	ACTIONS.AnimateSequence( f1_arg0, "Hide" )
	if f1_arg2.context == LUI.ItemCard.contexts.QUARTERMASTER_CIPHER then
		f1_arg0.AmountText:setText( "x " .. tostring( f1_arg2.quantity ) )
	else
		local f1_local5 = ""
		if f1_local3 then
			f1_local5 = "x " .. tostring( Engine.TableLookup( CSV.consumableLootMaster.file, CSV.consumableLootMaster.cols.ref, f1_local0, CSV.consumableLootMaster.cols.amount ) )
		else
			local f1_local6
			if f1_local2 then
				f1_local6 = "x "
				if not f1_local6 then
				
				elseif f1_local4 then
					f1_local5 = f1_local6 .. tostring( f1_arg2.dupeSalvageValue )
				else
					f1_local5 = f1_local6 .. tostring( f1_arg2.itemCardData.uiamount:GetValue( f1_arg1 ) )
				end
			end
			f1_local6 = "+"
		end
		f1_arg0.AmountText:setText( f1_local5, 0 )
	end
	if f1_local3 then
		ACTIONS.AnimateSequence( f1_arg0, "Show2XPTokens" )
	else
		local f1_local5
		if f1_local2 then
			f1_local5 = "ShowKeys"
			if not f1_local5 then
			
			else
				if f1_local4 then
					f1_arg0:registerEventHandler( "reveal_duplicate_info", function ( element, event )
						ACTIONS.AnimateSequence( element, f1_local5 )
					end )
				else
					ACTIONS.AnimateSequence( f1_arg0, f1_local5 )
				end
			end
		end
		f1_local5 = "ShowSalvage"
	end
	if f1_arg2.context == LUI.ItemCard.contexts.QUARTERMASTER_CIPHER then
		f1_arg0.Icon:SetAlpha( 0 )
	end
end

function LootItemCardDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 30 * _1080p )
	self.id = "LootItemCardDetails"
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
	Background:SetAlpha( 0.8, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local AmountText = nil
	
	AmountText = LUI.UIStyledText.new()
	AmountText.id = "AmountText"
	AmountText:SetRGBFromTable( SWATCHES.loot.highlight, 0 )
	AmountText:setText( "", 0 )
	AmountText:SetFontSize( 24 * _1080p )
	AmountText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	AmountText:SetAlignment( LUI.Alignment.Center )
	AmountText:SetDecodeLetterLength( 25 )
	AmountText:SetDecodeMaxRandChars( 3 )
	AmountText:SetDecodeUpdatesPerLetter( 4 )
	AmountText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -12, _1080p * 12 )
	self:addElement( AmountText )
	self.AmountText = AmountText
	
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:setImage( RegisterMaterial( "wdg_ellipse_glow" ), 0 )
	Glow:SetBlendMode( BLEND_MODE.addWithAlpha )
	Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -40, _1080p * 40, _1080p * -32, _1080p * 32 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:setImage( RegisterMaterial( "currency_parts_icon" ), 0 )
	Icon:SetUseAA( true )
	Icon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 5, _1080p * 69, _1080p * -32, _1080p * 32 )
	self:addElement( Icon )
	self.Icon = Icon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AmountText:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.AmountText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AmountText:SetAlpha( 0, 390 )
				end,
				function ()
					return self.AmountText:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.AmountText:SetScale( 0.5, 400 )
				end,
				function ()
					return self.AmountText:SetScale( 0, 250, LUI.EASING.outBack )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 390 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -32, _1080p * 32, 400 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -200, _1080p * 200, _1080p * -32, _1080p * 32, 499, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Intro = function ()
			AmountText:AnimateSequence( "Intro" )
			Glow:AnimateSequence( "Intro" )
		end
		
		Background:RegisterAnimationSequence( "ShowSalvage", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.8, 200 )
				end
			}
		} )
		AmountText:RegisterAnimationSequence( "ShowSalvage", {
			{
				function ()
					return self.AmountText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AmountText:SetAlpha( 0, 390 )
				end,
				function ()
					return self.AmountText:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.AmountText:SetScale( 0.5, 400 )
				end,
				function ()
					return self.AmountText:SetScale( 0, 250, LUI.EASING.outBack )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "ShowSalvage", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 390 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -32, _1080p * 32, 400 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -200, _1080p * 200, _1080p * -32, _1080p * 32, 499, LUI.EASING.outQuadratic )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "ShowSalvage", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Icon:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Icon:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Icon:SetScale( 1, 0 )
				end,
				function ()
					return self.Icon:SetScale( 1, 200 )
				end,
				function ()
					return self.Icon:SetScale( 0, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Icon:setImage( RegisterMaterial( "currency_parts_icon" ), 0 )
				end
			}
		} )
		self._sequences.ShowSalvage = function ()
			Background:AnimateSequence( "ShowSalvage" )
			AmountText:AnimateSequence( "ShowSalvage" )
			Glow:AnimateSequence( "ShowSalvage" )
			Icon:AnimateSequence( "ShowSalvage" )
		end
		
		Background:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		AmountText:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.AmountText:SetAlpha( 0, 0 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hide = function ()
			Background:AnimateSequence( "Hide" )
			AmountText:AnimateSequence( "Hide" )
			Glow:AnimateSequence( "Hide" )
			Icon:AnimateSequence( "Hide" )
		end
		
		Background:RegisterAnimationSequence( "Show2XPTokens", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.8, 200 )
				end
			}
		} )
		AmountText:RegisterAnimationSequence( "Show2XPTokens", {
			{
				function ()
					return self.AmountText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AmountText:SetAlpha( 0, 390 )
				end,
				function ()
					return self.AmountText:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.AmountText:SetScale( 0.5, 400 )
				end,
				function ()
					return self.AmountText:SetScale( 0, 250, LUI.EASING.outBack )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "Show2XPTokens", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 390 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -32, _1080p * 32, 400 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -200, _1080p * 200, _1080p * -32, _1080p * 32, 499, LUI.EASING.outQuadratic )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "Show2XPTokens", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Icon:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Icon:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Icon:SetScale( 1, 0 )
				end,
				function ()
					return self.Icon:SetScale( 1, 200 )
				end,
				function ()
					return self.Icon:SetScale( 0, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Icon:setImage( RegisterMaterial( "icon_iw7_xp_token" ), 0 )
				end
			}
		} )
		self._sequences.Show2XPTokens = function ()
			Background:AnimateSequence( "Show2XPTokens" )
			AmountText:AnimateSequence( "Show2XPTokens" )
			Glow:AnimateSequence( "Show2XPTokens" )
			Icon:AnimateSequence( "Show2XPTokens" )
		end
		
		Background:RegisterAnimationSequence( "ShowKeys", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.8, 200 )
				end
			}
		} )
		AmountText:RegisterAnimationSequence( "ShowKeys", {
			{
				function ()
					return self.AmountText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AmountText:SetAlpha( 0, 390 )
				end,
				function ()
					return self.AmountText:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.AmountText:SetScale( 0.5, 400 )
				end,
				function ()
					return self.AmountText:SetScale( 0, 250, LUI.EASING.outBack )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "ShowKeys", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 390 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -32, _1080p * 32, 400 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -200, _1080p * 200, _1080p * -32, _1080p * 32, 499, LUI.EASING.outQuadratic )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "ShowKeys", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Icon:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Icon:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Icon:SetScale( 1, 0 )
				end,
				function ()
					return self.Icon:SetScale( 1, 200 )
				end,
				function ()
					return self.Icon:SetScale( 0, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Icon:setImage( RegisterMaterial( "currency_keys_icon" ), 0 )
				end
			}
		} )
		self._sequences.ShowKeys = function ()
			Background:AnimateSequence( "ShowKeys" )
			AmountText:AnimateSequence( "ShowKeys" )
			Glow:AnimateSequence( "ShowKeys" )
			Icon:AnimateSequence( "ShowKeys" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "LootItemCardDetails", LootItemCardDetails )
LockTable( _M )
