local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.index:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			f1_arg0.index = f2_local0
			local f2_local1 = f1_arg0:GetCurrentMenu()
			if f2_local1 then
				local f2_local2 = f2_local1.selectedLogoIndex
				local f2_local3 = f2_local1.lockedLogoIndex
				if f1_arg0.index == f2_local2 then
					ACTIONS.AnimateSequence( f1_arg0, "Selected" )
					local f2_local4 = Engine.TableLookupByRow( CSV.teamLogoTable.file, f2_local2, CSV.teamLogoTable.cols.logoMaterial )
					local f2_local5 = Engine.TableLookupByRow( CSV.teamLogoTable.file, f2_local2, CSV.teamLogoTable.cols.teamName )
					f2_local1.selectedLogo = f1_arg0
					f2_local1.TeamLogoPreview:setImage( RegisterMaterial( f2_local4 ), 0 )
					f2_local1.TeamLogoNamePreview:setText( ToUpperCase( Engine.Localize( f2_local5 ) ), 0 )
				elseif f1_arg0.index == f2_local3 then
					ACTIONS.AnimateSequence( f1_arg0, "Locked" )
					f1_arg0:SetButtonDisabled( true )
				else
					ACTIONS.AnimateSequence( f1_arg0, "DefaultSequence" )
					f1_arg0:SetButtonDisabled( false )
				end
			end
		end
	end
	
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "index", f1_local0 )
	f1_arg0:addEventHandler( "menu_create", f1_local0 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "logoMaterial", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		f3_local0 = f3_local0.logoMaterial:GetValue( f1_arg1 )
		if f3_local0 ~= nil then
			f1_arg0.logoMaterial = f3_local0
		end
	end )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "teamName", function ()
		local f4_local0 = f1_arg0:GetDataSource()
		f4_local0 = f4_local0.teamName:GetValue( f1_arg1 )
		if f4_local0 ~= nil then
			f1_arg0.logoName = f4_local0
		end
	end )
	f1_arg0:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
		f5_arg0:dispatchEventToCurrentMenu( {
			name = "logo_selected",
			index = f1_arg0.index,
			logoMaterial = f1_arg0.logoMaterial,
			logoName = f1_arg0.logoName
		} )
	end )
end

function CodCasterTeamLogo( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 210 * _1080p, 0, 160 * _1080p )
	self.id = "CodCasterTeamLogo"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local GradientBackgroundInGameOnly = nil
	
	GradientBackgroundInGameOnly = LUI.UIImage.new()
	GradientBackgroundInGameOnly.id = "GradientBackgroundInGameOnly"
	GradientBackgroundInGameOnly:SetRGBFromInt( 0, 0 )
	GradientBackgroundInGameOnly:SetAlpha( 0.5, 0 )
	GradientBackgroundInGameOnly:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 2, _1080p * -2, _1080p * -80, _1080p * -56 )
	self:addElement( GradientBackgroundInGameOnly )
	self.GradientBackgroundInGameOnly = GradientBackgroundInGameOnly
	
	local LogoImage = nil
	
	LogoImage = LUI.UIImage.new()
	LogoImage.id = "LogoImage"
	LogoImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 44, _1080p * 166, _1080p * 24, _1080p * 146 )
	LogoImage:SubscribeToModelThroughElement( self, "logoMaterial", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.logoMaterial:GetValue( f6_local1 )
		if f7_local0 ~= nil then
			LogoImage:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	self:addElement( LogoImage )
	self.LogoImage = LogoImage
	
	local BorderBot = nil
	
	BorderBot = LUI.UIImage.new()
	BorderBot.id = "BorderBot"
	BorderBot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 208, _1080p * 159, _1080p * 160 )
	self:addElement( BorderBot )
	self.BorderBot = BorderBot
	
	local BorderLeft = nil
	
	BorderLeft = LUI.UIImage.new()
	BorderLeft.id = "BorderLeft"
	BorderLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 3, _1080p * 24, _1080p * 160 )
	self:addElement( BorderLeft )
	self.BorderLeft = BorderLeft
	
	local BorderRight = nil
	
	BorderRight = LUI.UIImage.new()
	BorderRight.id = "BorderRight"
	BorderRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 207, _1080p * 208, _1080p * 24, _1080p * 160 )
	self:addElement( BorderRight )
	self.BorderRight = BorderRight
	
	local BorderTop2 = nil
	
	BorderTop2 = LUI.UIImage.new()
	BorderTop2.id = "BorderTop2"
	BorderTop2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 202, _1080p * 208, _1080p * 24, _1080p * 25 )
	self:addElement( BorderTop2 )
	self.BorderTop2 = BorderTop2
	
	local BorderLeftCopy0 = nil
	
	BorderLeftCopy0 = LUI.UIImage.new()
	BorderLeftCopy0.id = "BorderLeftCopy0"
	BorderLeftCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 7, 0, _1080p * 25 )
	self:addElement( BorderLeftCopy0 )
	self.BorderLeftCopy0 = BorderLeftCopy0
	
	local LogoSelected = nil
	
	LogoSelected = LUI.UIImage.new()
	LogoSelected.id = "LogoSelected"
	LogoSelected:setImage( RegisterMaterial( "solid_triangle" ), 0 )
	LogoSelected:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 208, _1080p * 178, _1080p * 130, _1080p * 160 )
	self:addElement( LogoSelected )
	self.LogoSelected = LogoSelected
	
	local LogoName = nil
	
	LogoName = LUI.UIStyledText.new()
	LogoName.id = "LogoName"
	LogoName:SetFontSize( 20 * _1080p )
	LogoName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LogoName:SetAlignment( LUI.Alignment.Left )
	LogoName:SetStartupDelay( 1000 )
	LogoName:SetLineHoldTime( 500 )
	LogoName:SetAnimMoveTime( 500 )
	LogoName:SetEndDelay( 1000 )
	LogoName:SetCrossfadeTime( 500 )
	LogoName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	LogoName:SetMaxVisibleLines( 1 )
	LogoName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 202, _1080p * 3, _1080p * 23 )
	LogoName:SubscribeToModelThroughElement( self, "teamName", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.teamName:GetValue( f6_local1 )
		if f8_local0 ~= nil then
			LogoName:setText( f8_local0, 0 )
		end
	end )
	self:addElement( LogoName )
	self.LogoName = LogoName
	
	local LogoLocked = nil
	
	LogoLocked = LUI.UIImage.new()
	LogoLocked.id = "LogoLocked"
	LogoLocked:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	LogoLocked:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 161, _1080p * 208, _1080p * 113, _1080p * 160 )
	self:addElement( LogoLocked )
	self.LogoLocked = LogoLocked
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f6_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 160, 0, _1080p * 160 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	self._animationSets.DefaultAnimationSet = function ()
		LogoSelected:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LogoSelected:SetAlpha( 0, 0 )
				end
			}
		} )
		LogoLocked:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LogoLocked:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			LogoSelected:AnimateSequence( "DefaultSequence" )
			LogoLocked:AnimateSequence( "DefaultSequence" )
		end
		
		LogoSelected:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.LogoSelected:SetAlpha( 1, 0 )
				end
			}
		} )
		LogoLocked:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.LogoLocked:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Selected = function ()
			LogoSelected:AnimateSequence( "Selected" )
			LogoLocked:AnimateSequence( "Selected" )
		end
		
		LogoSelected:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.LogoSelected:SetAlpha( 0, 0 )
				end
			}
		} )
		LogoLocked:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.LogoLocked:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			LogoSelected:AnimateSequence( "Locked" )
			LogoLocked:AnimateSequence( "Locked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f6_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "CodCasterTeamLogo", CodCasterTeamLogo )
LockTable( _M )
