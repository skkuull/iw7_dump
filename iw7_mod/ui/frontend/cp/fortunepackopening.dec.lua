local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "frontEnd.MP.armory.cardOpening"
f0_local1 = 2500
f0_local2 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

local f0_local3 = function ( f2_arg0 )
	assert( f2_arg0 )
	f2_arg0:SetAlpha( 1, 0 )
	local f2_local0, f2_local1, f2_local2, f2_local3 = f2_arg0:getLocalRect()
	local f2_local4 = nil
	local f2_local5 = function ()
		local f3_local0 = math.random( -10, 10 ) * _1080p
		local f3_local1 = math.random( -10, 10 ) * _1080p
		local f3_local2 = math.random( LUI.EASING.linear, LUI.EASING.inOutBack )
		local f3_local3 = math.random( 10, 69 )
		f2_arg0:SetZRotation( math.random( -10, 10 ), f3_local3, f3_local2 )
		local f3_local4 = f2_arg0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, f2_local0 + f3_local1, f2_local2 + f3_local1, f2_local1 + f3_local0, f2_local3 + f3_local0, f3_local3, f3_local2 )
		f3_local4.onComplete = function ()
			if f2_arg0.shake then
				f2_local4()
			end
		end
		
	end
	
	f2_local5()
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	assert( f5_arg0 )
	assert( f5_arg1.cardIndex )
	Engine.PlaySound( "ui_iw7_loot_roll_slam_card_explo" )
	local f5_local0 = f5_arg0.BoosterPack
	local f5_local1 = f5_arg0.cardList
	local f5_local2 = nil
	f5_local0:SetAlpha( 1 )
	f5_local0:SetZRotation( -3 )
	ACTIONS.AnimateSequenceByElement( f5_arg0, {
		elementName = "BoosterPack",
		sequenceName = "Normal",
		elementPath = "BoosterPack"
	} )
	if f5_arg1.cardIndex > 1 then
		f5_local0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 215, _1080p * 465, _1080p * -205, _1080p * 205 )
	else
		f5_local0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -125, _1080p * 125, _1080p * -205, _1080p * 205 )
	end
	f5_local0:SetZRotation( 0, 500, LUI.EASING.inOutBack )
	f5_local2 = f5_local0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -125, _1080p * 125, _1080p * -205, _1080p * 205, 500, LUI.EASING.inOutBack )
	f5_local2.onComplete = function ()
		f5_local0.shake = true
		f0_local3( f5_local0 )
	end
	
	f5_local1:SetAlpha( 0 )
	local f5_local3 = f5_arg0:Wait( f0_local1 )
	f5_local3.onComplete = function ()
		f5_local0.shake = false
		ACTIONS.AnimateSequenceByElement( f5_arg0, {
			elementName = "BoosterPack",
			sequenceName = "Burnt",
			elementPath = "BoosterPack"
		} )
		ACTIONS.AnimateSequence( f5_arg0, "Explode" )
		f5_local3 = f5_arg0:Wait( 1200 )
		f5_local3.onComplete = function ()
			f5_local1:processEvent( {
				name = "play_fortune_card_anim"
			} )
			f5_local1:SetAlpha( 1 )
		end
		
	end
	
end

local f0_local5 = function ( f9_arg0, f9_arg1, f9_arg2 )
	assert( f9_arg2.cards )
	assert( f9_arg0.BoosterPack )
	f9_arg0._cards = f9_arg2.cards
	
	local cardList = LUI.UIHorizontalList.new( {
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		left = _1080p * -500,
		right = _1080p * 500,
		top = _1080p * 420,
		bottom = _1080p * 660,
		alignment = LUI.Alignment.Center,
		spacing = _1080p * 35
	} )
	cardList.id = "cardList"
	f9_arg0:addElement( cardList )
	f9_arg0.cardList = cardList
	
	f9_arg0.cardList:SetAlpha( 0 )
	local f9_local1 = DataSources.frontEnd.CP.fortuneCards["1"].Decorate( DataSources.frontEnd.CP.fortuneCards["1"], function ( f10_arg0, f10_arg1, f10_arg2 )
		local f10_local0 = f10_arg1.ref:GetValue( f10_arg2 )
		return {
			isUnlocked = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".card." .. f10_local0 .. ".unlocked", true ),
			numOwned = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".card." .. f10_local0 .. ".numOwned", 0 )
		}
	end )
	for f9_local2 = 1, #f9_arg0._cards, 1 do
		local f9_local5 = Engine.TableLookup( CSV.zombieConsumableItems.File, CSV.zombieConsumableItems.Cols.LootID, LOOT.GetFortuneLootItemID( f9_arg0._cards[f9_local2] ), CSV.zombieConsumableItems.Cols.Ref )
		local f9_local6 = MenuBuilder.BuildRegisteredType( "fortuneCardButton", {
			controllerIndex = f9_arg1,
			index = f9_local2,
			cardPackOpening = true
		} )
		local f9_local7 = f9_local1:GetDataSourceAtIndex( FORTUNE_CARD_INFO[f9_local5].index )
		f9_local7.numOwned:SetValue( f9_arg1, LOOT.GetFortuneCardAmount( f9_arg0._cards[f9_local2] ) )
		f9_local6:SetDataSource( f9_local7, f9_arg1 )
		f9_local6:SetFocusable( false )
		f9_local6.numOwnedBox:SetAlpha( 0 )
		f9_local6.numOwned:SetAlpha( 0 )
		f9_arg0.cardList:addElement( f9_local6 )
	end
	local f9_local2 = f9_arg0:Wait( f0_local1 * 2.5 )
	f9_local2.onComplete = function ()
		LUI.FlowManager.RequestLeaveMenu( f9_arg0 )
		LUI.FlowManager.RequestAddMenu( "CPCrateItems", false, f9_arg1, false, {
			controllerIndex = f9_arg1,
			crateID = f9_arg2.crateID,
			usedCODPoints = f9_arg2.usedCODPoints
		} )
	end
	
	f0_local4( f9_arg0, f9_arg2 )
end

function FortunePackOpening( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "FortunePackOpening"
	self._animationSets = {}
	self._sequences = {}
	local f12_local1 = controller and controller.controllerIndex
	if not f12_local1 and not Engine.InFrontend() then
		f12_local1 = self:getRootController()
	end
	assert( f12_local1 )
	self:playSound( "menu_open" )
	local f12_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetBlurStrength( 2, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.75, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local AccentSpinner = nil
	
	AccentSpinner = MenuBuilder.BuildRegisteredType( "ArcaneAccentSpinner", {
		controllerIndex = f12_local1
	} )
	AccentSpinner.id = "AccentSpinner"
	AccentSpinner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -500, _1080p * 500, _1080p * -500, _1080p * 500 )
	self:addElement( AccentSpinner )
	self.AccentSpinner = AccentSpinner
	
	local BoosterPack = nil
	
	BoosterPack = MenuBuilder.BuildRegisteredType( "LootFortuneItemCard", {
		controllerIndex = f12_local1
	} )
	BoosterPack.id = "BoosterPack"
	BoosterPack:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -125, _1080p * 125, _1080p * -205, _1080p * 205 )
	self:addElement( BoosterPack )
	self.BoosterPack = BoosterPack
	
	local Fire = nil
	
	Fire = LUI.UIImage.new()
	Fire.id = "Fire"
	Fire:SetAlpha( 0, 0 )
	Fire:setImage( RegisterMaterial( "zm_powerup_glow_element" ), 0 )
	Fire:SetBlendMode( BLEND_MODE.addWithAlpha )
	Fire:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( Fire )
	self.Fire = Fire
	
	local Blast = nil
	
	Blast = LUI.UIImage.new()
	Blast.id = "Blast"
	Blast:SetAlpha( 0, 0 )
	Blast:setImage( RegisterMaterial( "cp_card_pack_explosion_1" ), 0 )
	Blast:SetBlendMode( BLEND_MODE.addWithAlpha )
	Blast:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( Blast )
	self.Blast = Blast
	
	self._animationSets.DefaultAnimationSet = function ()
		AccentSpinner:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.AccentSpinner:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AccentSpinner:SetAlpha( 1, 1000, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.AccentSpinner:SetScale( -0.5, 0 )
				end,
				function ()
					return self.AccentSpinner:SetScale( 0, 1000, LUI.EASING.inOutBack )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			AccentSpinner:AnimateSequence( "DefaultSequence" )
		end
		
		BoosterPack:RegisterAnimationSequence( "Explode", {
			{
				function ()
					return self.BoosterPack:SetZRotation( 0, 0 )
				end,
				function ()
					return self.BoosterPack:SetZRotation( 0, 500 )
				end,
				function ()
					return self.BoosterPack:SetZRotation( -20, 500, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.BoosterPack:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BoosterPack:SetAlpha( 1, 500 )
				end,
				function ()
					return self.BoosterPack:SetAlpha( 1, 500, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.BoosterPack:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.BoosterPack:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -150, _1080p * 150, _1080p * -205, _1080p * 205, 0 )
				end,
				function ()
					return self.BoosterPack:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -150, _1080p * 150, _1080p * -205, _1080p * 205, 500 )
				end,
				function ()
					return self.BoosterPack:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -150, _1080p * 150, _1080p * 590, _1080p * 1000, 500, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.BoosterPack:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -150, _1080p * 150, _1080p * -205, _1080p * 205, 9 )
				end
			}
		} )
		Fire:RegisterAnimationSequence( "Explode", {
			{
				function ()
					return self.Fire:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Fire:SetAlpha( 1, 200 )
				end,
				function ()
					return self.Fire:SetAlpha( 0, 450, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.Fire:SetScale( 0, 0 )
				end,
				function ()
					return self.Fire:SetScale( 0, 200 )
				end,
				function ()
					return self.Fire:SetScale( 4, 450, LUI.EASING.inQuadratic )
				end
			}
		} )
		Blast:RegisterAnimationSequence( "Explode", {
			{
				function ()
					return self.Blast:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Blast:SetAlpha( 1, 300 )
				end,
				function ()
					return self.Blast:SetAlpha( 0, 300 )
				end
			},
			{
				function ()
					return self.Blast:SetScale( 0, 0 )
				end,
				function ()
					return self.Blast:SetScale( 9, 600 )
				end
			}
		} )
		self._sequences.Explode = function ()
			BoosterPack:AnimateSequence( "Explode" )
			Fire:AnimateSequence( "Explode" )
			Blast:AnimateSequence( "Explode" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local5( self, f12_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "FortunePackOpening", FortunePackOpening )
LUI.FlowManager.RegisterStackPopBehaviour( "FortunePackOpening", f0_local2 )
LockTable( _M )
