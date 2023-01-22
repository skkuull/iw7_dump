local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GetQuality( f1_arg0, f1_arg1 )
	local f1_local0 = Cac.GetCustomizationLootCSV( f1_arg0 )
	local f1_local1 = Cac.GetCustomizationCSV( f1_arg0 )
	local f1_local2 = Engine.TableLookup( f1_local1.file, f1_local1.cols.index, f1_arg1, f1_local1.cols.unlockType )
	local f1_local3 = nil
	if f1_arg0 == Cac.CustomizationTypes.HEAD or f1_arg0 == Cac.CustomizationTypes.BODY then
		f1_local3 = Engine.TableLookup( f1_local1.file, f1_local1.cols.index, f1_arg1, f1_local1.cols.model )
	else
		f1_local3 = Engine.TableLookup( f1_local1.file, f1_local1.cols.index, f1_arg1, f1_local1.cols.ref )
	end
	local f1_local4 = Cac.GetLootQualityFromFile( f1_local0, {
		unlockType = f1_local2
	}, f1_local3 )
	assert( f1_local4 )
	return f1_local4
end

function PostLoadFunc( f2_arg0, f2_arg1 )
	f2_arg0._controllerIndex = f2_arg1
	f2_arg0:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		assert( f2_arg0._rigRef )
		assert( f2_arg0._customizationType )
		assert( f2_arg0._rigPreferences )
		local f3_local0 = GetSquadMemberDataSource()
		local f3_local1 = f3_local0.archetypePreferences
		local f3_local2 = f2_arg0._rigPreferences
		local f3_local3 = f2_arg0._itemData.itemID
		local f3_local4 = Cac.GetCustomizationCSV( f2_arg0._customizationType )
		assert( f3_local3 )
		local f3_local5 = Engine.TableLookup( f3_local4.file, f3_local4.cols.index, f3_local3, f3_local4.cols.ref )
		if f2_arg0._customizationType == Cac.CustomizationTypes.GESTURE then
			f3_local2.gesture:SetValue( f2_arg1, f3_local5 )
			f3_local0.gesture:SetValue( f2_arg1, f3_local5 )
		else
			local f3_local6 = Engine.TableLookup( f3_local4.file, f3_local4.cols.index, f3_local3, f3_local4.cols.model )
			local f3_local7, f3_local8 = nil
			if f2_arg0._customizationType == Cac.CustomizationTypes.HEAD then
				f3_local7 = f3_local6
			else
				f3_local8 = f3_local6
			end
			f3_local7, f3_local8 = Cac.GetCompatibleHeadAndBody( f2_arg1, f2_arg0._rigRef, f3_local7, f3_local8 )
			local f3_local9 = Engine.TableLookup( CSV.heads.file, CSV.heads.cols.model, f3_local7, CSV.heads.cols.ref )
			local f3_local10 = Engine.TableLookup( CSV.bodies.file, CSV.bodies.cols.model, f3_local8, CSV.bodies.cols.ref )
			local f3_local11 = Engine.TableLookup( CSV.heads.file, CSV.heads.cols.model, f3_local7, CSV.heads.cols.index )
			local f3_local12 = Engine.TableLookup( CSV.bodies.file, CSV.bodies.cols.model, f3_local8, CSV.bodies.cols.index )
			f3_local2.head:SetValue( f2_arg1, f3_local9 )
			f3_local0.head:SetValue( f2_arg1, f3_local11 )
			f3_local2.body:SetValue( f2_arg1, f3_local10 )
			f3_local0.body:SetValue( f2_arg1, f3_local12 )
			local f3_local13 = Engine.TableLookupGetRowNum( CSV.cosmeticHeroesLootMaster.file, CSV.cosmeticHeroesLootMaster.cols.headModel, f3_local7 )
			if f3_local13 >= 0 then
				Engine.SetPlayerDataEx( f2_arg1, CoD.StatsGroup.Common, "gender", Engine.TableLookupByRow( CSV.cosmeticHeroesLootMaster.file, f3_local13, CSV.cosmeticHeroesLootMaster.cols.gender ) == "1" )
			end
		end
		Cac.RequestAndSetRig( f2_arg0._rigRef, f3_local2.head:GetValue( f2_arg1 ), f3_local2.body:GetValue( f2_arg1 ), f3_local2.archetypeSuper:GetValue( f2_arg1 ) )
		LUI.FlowManager.RequestLeaveMenu( f2_arg0, true, true )
	end )
	f2_arg0:addEventHandler( "button_over", function ()
		f2_arg0:dispatchEventToCurrentMenu( {
			name = "highlight_customization_item",
			itemData = f2_arg0._itemData
		} )
	end )
	f2_arg0:addEventHandler( "button_over_disable", function ()
		f2_arg0:dispatchEventToCurrentMenu( {
			name = "highlight_customization_item",
			itemData = f2_arg0._itemData
		} )
	end )
	f2_arg0.SetContext = function ( f6_arg0, f6_arg1, f6_arg2 )
		f6_arg0._rigRef = f6_arg1
		f6_arg0._customizationType = f6_arg2
		local f6_local0 = GetSquadMemberDataSource()
		f6_arg0._rigPreferences = Cac.GetPreferencesForRig( f6_local0.archetypePreferences, f6_arg0._rigRef, f6_arg0._controllerIndex )
		assert( f6_arg0._rigPreferences )
	end
	
	f2_arg0.SetContent = function ( f7_arg0, f7_arg1, f7_arg2 )
		assert( f7_arg0._rigRef )
		assert( f7_arg0._customizationType )
		local f7_local0 = Cac.GetCustomizationCSV( f7_arg0._customizationType )
		f7_arg0._itemData = {}
		f7_arg0._itemData.index = f7_arg2
		f7_arg0._itemData.itemID = f7_arg1
		f7_arg0._itemData.isUnlocked = Cac.IsCustomizationItemUnlocked( f2_arg1, f7_arg0._customizationType, f7_arg1 )
		if f7_arg0._itemData.isUnlocked then
			ACTIONS.AnimateSequence( f7_arg0.BaseImage, "Unlocked" )
		else
			ACTIONS.AnimateSequence( f7_arg0.BaseImage, "Locked" )
		end
		f7_arg0._itemData.quality = Cac.LowestQuality
		if f7_arg0._itemData.isUnlocked then
			f7_arg0._itemData.quality = GetQuality( f7_arg0._customizationType, f7_arg1 )
			if f7_arg0._itemData.quality > Cac.LowestQuality then
				ACTIONS.AnimateSequence( f7_arg0, "ShowQuality" )
			else
				ACTIONS.AnimateSequence( f7_arg0, "HideQuality" )
			end
		end
		assert( f7_arg0.QualityIcon )
		f7_arg0.QualityIcon:SetDisplayQuality( f7_arg0._itemData.quality )
		local f7_local1 = nil
		if f7_arg0._customizationType == Cac.CustomizationTypes.HEAD then
			f7_local1 = f7_arg0._rigPreferences.head:GetValue( f2_arg1 )
		elseif f7_arg0._customizationType == Cac.CustomizationTypes.BODY then
			f7_local1 = f7_arg0._rigPreferences.body:GetValue( f2_arg1 )
		else
			f7_local1 = f7_arg0._rigPreferences.gesture:GetValue( f2_arg1 )
		end
		if Engine.TableLookup( f7_local0.file, f7_local0.cols.index, f7_arg1, f7_local0.cols.ref ) == f7_local1 then
			ACTIONS.AnimateSequence( f7_arg0.BaseImage.Message, "Activate" )
		else
			ACTIONS.AnimateSequence( f7_arg0.BaseImage.Message, "Inactive" )
		end
		local f7_local2 = Engine.TableLookup( f7_local0.file, f7_local0.cols.index, f7_arg1, f7_local0.cols.uiImage )
		f7_arg0._itemData.name = Engine.Localize( Engine.TableLookup( f7_local0.file, f7_local0.cols.index, f7_arg1, f7_local0.cols.name ) )
		f7_arg0.BaseImage.Image:setImage( RegisterMaterial( f7_local2 ) )
		f7_arg0.BaseImage.Name:setText( f7_arg0._itemData.name )
		f7_arg0:SetButtonDisabled( not f7_arg0._itemData.isUnlocked )
	end
	
end

function RigCustAppearSelectionButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 185 * _1080p, 0, 175 * _1080p )
	self.id = "RigCustAppearSelectionButton"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local BaseImage = nil
	BaseImage = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f8_local1
	} )
	BaseImage.id = "BaseImage"
	BaseImage.Image:SetLeft( _1080p * -70, 0 )
	BaseImage.Image:SetRight( _1080p * 70, 0 )
	BaseImage.Image:SetTop( _1080p * -140, 0 )
	BaseImage.Image:SetBottom( _1080p * -10, 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		BaseImage.Level:setText( "", 0 )
	end
	BaseImage.Name:setText( "Item Name", 0 )
	BaseImage.Name:SetAlignment( LUI.Alignment.Left )
	BaseImage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 185, 0, _1080p * 175 )
	self:addElement( BaseImage )
	self.BaseImage = BaseImage
	
	local QualityIcon = nil
	
	QualityIcon = MenuBuilder.BuildRegisteredType( "QualityIcon", {
		controllerIndex = f8_local1
	} )
	QualityIcon.id = "QualityIcon"
	QualityIcon:SetAlpha( 0, 0 )
	QualityIcon:SetScale( -0.5, 0 )
	QualityIcon.IconShadow:SetAlpha( 0.2, 0 )
	QualityIcon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 64, _1080p * 117, _1080p * 181 )
	self:addElement( QualityIcon )
	self.QualityIcon = QualityIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BaseImage:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.BaseImage.Image:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			BaseImage:AnimateSequence( "ButtonOver" )
		end
		
		BaseImage:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.BaseImage.Image:SetRGBFromInt( 12566463, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			BaseImage:AnimateSequence( "ButtonUp" )
		end
		
		QualityIcon:RegisterAnimationSequence( "ShowQuality", {
			{
				function ()
					return self.QualityIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowQuality = function ()
			QualityIcon:AnimateSequence( "ShowQuality" )
		end
		
		QualityIcon:RegisterAnimationSequence( "HideQuality", {
			{
				function ()
					return self.QualityIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideQuality = function ()
			QualityIcon:AnimateSequence( "HideQuality" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f19_arg0, f19_arg1 )
		local f19_local0 = f19_arg1.controller or f8_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg1.controller or f8_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	PostLoadFunc( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "RigCustAppearSelectionButton", RigCustAppearSelectionButton )
LockTable( _M )
