local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.LiveIcon:SetAlpha( f1_arg1 )
	f1_arg0.LiveLabel:SetAlpha( f1_arg1 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.NewItemNotification )
	if CODTV.IsCODTVEnabled() then
		local f2_local0 = DataSources.frontEnd.MP.codtv.streamLiveCount
		local f2_local1 = function ()
			local f3_local0 = f2_local0:GetValue( f2_arg1 )
			if f3_local0 ~= nil then
				if f3_local0 > 0 then
					f0_local0( f2_arg0, 1 )
					f2_arg0.NewItemNotification:SetAlpha( 0, 0 )
				else
					f0_local0( f2_arg0, 0 )
					local f3_local1 = LUI.DataSourceInGlobalModel.new( "mlgcontent.VOD.0.timestamp" )
					f3_local1 = f3_local1:GetValue( f2_arg1 )
					if f3_local1 and Engine.GetPlayerDataEx( f2_arg1, CoD.StatsGroup.Ranked, "lastViewedCODTV" ) <= f3_local1 then
						f2_arg0.NewItemNotification:SetAlpha( 1, 0 )
					end
				end
			else
				f0_local0( f2_arg0, 0 )
			end
		end
		
		if f2_local0 ~= nil then
			local f2_local2 = f2_local0:GetModel( f2_arg1 )
			if f2_local2 ~= nil then
				f2_arg0:SubscribeToModel( f2_local2, f2_local1 )
			end
		end
	end
end

function MPMainMenuCODTvButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "MPMainMenuCODTvButton"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	self.buttonDescription = Engine.Localize( "CODTV_BUTTON_DESC" )
	local MenuButton = nil
	
	MenuButton = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f4_local1
	} )
	MenuButton.id = "MenuButton"
	MenuButton.buttonDescription = Engine.Localize( "CODTV_BUTTON_DESC" )
	MenuButton.Text:setText( ToUpperCase( Engine.Localize( "CODTV_COD_ON_MLGTV_TEXT" ) ), 0 )
	MenuButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 30 )
	self:addElement( MenuButton )
	self.MenuButton = MenuButton
	
	local LiveIcon = nil
	
	LiveIcon = LUI.UIImage.new()
	LiveIcon.id = "LiveIcon"
	LiveIcon:SetRGBFromInt( 16318464, 0 )
	LiveIcon:SetAlpha( 0, 0 )
	LiveIcon:setImage( RegisterMaterial( "widg_circle_small" ), 0 )
	LiveIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 465, _1080p * 473, _1080p * 11, _1080p * 19 )
	self:addElement( LiveIcon )
	self.LiveIcon = LiveIcon
	
	local LiveLabel = nil
	
	LiveLabel = LUI.UIText.new()
	LiveLabel.id = "LiveLabel"
	LiveLabel:SetRGBFromInt( 14277081, 0 )
	LiveLabel:SetAlpha( 0, 0 )
	LiveLabel:setText( Engine.Localize( "CODTV_LIVE" ), 0 )
	LiveLabel:SetFontSize( 18 * _1080p )
	LiveLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LiveLabel:SetAlignment( LUI.Alignment.Right )
	LiveLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 355, _1080p * 462, _1080p * 6, _1080p * 24 )
	self:addElement( LiveLabel )
	self.LiveLabel = LiveLabel
	
	local NewItemNotification = nil
	
	NewItemNotification = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
		controllerIndex = f4_local1
	} )
	NewItemNotification.id = "NewItemNotification"
	NewItemNotification:SetAlpha( 0, 0 )
	NewItemNotification:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 408.5, _1080p * 472.5, _1080p * -17, _1080p * 47 )
	self:addElement( NewItemNotification )
	self.NewItemNotification = NewItemNotification
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LiveLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.LiveLabel:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			LiveLabel:AnimateSequence( "ButtonOver" )
		end
		
		LiveLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.LiveLabel:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			LiveLabel:AnimateSequence( "ButtonUp" )
		end
		
		LiveIcon:RegisterAnimationSequence( "isArabic", {
			{
				function ()
					return self.LiveIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 482, _1080p * 490, _1080p * 11, _1080p * 19, 0 )
				end
			}
		} )
		LiveLabel:RegisterAnimationSequence( "isArabic", {
			{
				function ()
					return self.LiveLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 372, _1080p * 479, _1080p * 6, _1080p * 24, 0 )
				end
			}
		} )
		NewItemNotification:RegisterAnimationSequence( "isArabic", {
			{
				function ()
					return self.NewItemNotification:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 434, _1080p * 498, _1080p * -17, _1080p * 47, 0 )
				end
			}
		} )
		self._sequences.isArabic = function ()
			LiveIcon:AnimateSequence( "isArabic" )
			LiveLabel:AnimateSequence( "isArabic" )
			NewItemNotification:AnimateSequence( "isArabic" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f4_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f4_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local1( self, f4_local1, controller )
	if CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "isArabic" )
	end
	return self
end

MenuBuilder.registerType( "MPMainMenuCODTvButton", MPMainMenuCODTvButton )
LockTable( _M )
