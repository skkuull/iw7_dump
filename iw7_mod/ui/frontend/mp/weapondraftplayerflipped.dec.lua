local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = LoadoutDrafting.GetWeaponDraftInfoForPlayer( f1_arg3 )
	assert( f1_local0.gamertag )
	assert( f1_local0.weapon1Index )
	assert( f1_local0.weapon2Index )
	f1_arg0.Gamertag:setText( f1_local0.gamertag )
	if f1_local0.weapon1Index == Cac.noDraftedWeaponIndex then
		f1_arg0.WeaponDraftButton1.WeaponName:setText( Engine.Localize( "MP_FRONTEND_ONLY_NOT_SELECTED" ) )
		f1_arg0.WeaponDraftButton1.WeaponImage:setImage( RegisterMaterial( "ui_default_white_multiply" ) )
		f1_arg0.Weapon1Spinner:SetAlpha( 1, 0 )
	else
		f1_arg0.WeaponDraftButton1.WeaponName:setText( Engine.Localize( Engine.TableLookup( CSV.MPWeapons.file, CSV.MPWeapons.cols.index, f1_local0.weapon1Index, CSV.MPWeapons.cols.name ) ) )
		f1_arg0.WeaponDraftButton1.WeaponImage:setImage( RegisterMaterial( Engine.TableLookup( CSV.MPWeapons.file, CSV.MPWeapons.cols.index, f1_local0.weapon1Index, CSV.MPWeapons.cols.image ) ) )
		f1_arg0.Weapon1Spinner:SetAlpha( 0, 0 )
	end
	if f1_local0.weapon2Index == Cac.noDraftedWeaponIndex then
		f1_arg0.WeaponDraftButton2.WeaponName:setText( Engine.Localize( "MP_FRONTEND_ONLY_NOT_SELECTED" ) )
		f1_arg0.WeaponDraftButton2.WeaponImage:setImage( RegisterMaterial( "ui_default_white_multiply" ) )
		f1_arg0.Weapon2Spinner:SetAlpha( 1, 0 )
	else
		f1_arg0.WeaponDraftButton2.WeaponName:setText( Engine.Localize( Engine.TableLookup( CSV.MPWeapons.file, CSV.MPWeapons.cols.index, f1_local0.weapon2Index, CSV.MPWeapons.cols.name ) ) )
		f1_arg0.WeaponDraftButton2.WeaponImage:setImage( RegisterMaterial( Engine.TableLookup( CSV.MPWeapons.file, CSV.MPWeapons.cols.index, f1_local0.weapon2Index, CSV.MPWeapons.cols.image ) ) )
		f1_arg0.Weapon2Spinner:SetAlpha( 0, 0 )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local Weapon1Spinner = MenuBuilder.BuildRegisteredType( "Spinner", {
		controllerIndex = f2_arg1
	} )
	Weapon1Spinner:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -182, _1080p * -118, _1080p * 70, _1080p * 134 )
	Weapon1Spinner.id = "Weapon1Spinner"
	Weapon1Spinner:SetScale( -0.25 )
	f2_arg0:addElement( Weapon1Spinner )
	f2_arg0.Weapon1Spinner = Weapon1Spinner
	
	local Weapon2Spinner = MenuBuilder.BuildRegisteredType( "Spinner", {
		controllerIndex = f2_arg1
	} )
	Weapon2Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 118, _1080p * 182, _1080p * 70, _1080p * 134 )
	Weapon2Spinner.id = "Weapon2Spinner"
	Weapon2Spinner:SetScale( -0.25 )
	f2_arg0:addElement( Weapon2Spinner )
	f2_arg0.Weapon2Spinner = Weapon2Spinner
	
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0.WeaponDraftButton1.id = "WeaponDraftButton1"
	f3_arg0.WeaponDraftButton2.id = "WeaponDraftButton2"
	f3_arg0.WeaponDraftButton1.draftSlot = 1
	f3_arg0.WeaponDraftButton2.draftSlot = 2
	f0_local1( f3_arg0, f3_arg1 )
	local f3_local0 = nil
	f3_arg0.RefreshPlayerInfo = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		local f4_local0 = f4_arg0:Wait( 1000 )
		f4_local0.onComplete = function ()
			return f3_local0( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		end
		
		f0_local0( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	end
	
end

function WeaponDraftPlayerFlipped( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 640 * _1080p, 0, 150 * _1080p )
	self.id = "WeaponDraftPlayerFlipped"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	self.soundSet = "activeReload"
	local f6_local2 = self
	local WeaponDraftButton1 = nil
	
	WeaponDraftButton1 = MenuBuilder.BuildRegisteredType( "WeaponDraftButton", {
		controllerIndex = f6_local1
	} )
	WeaponDraftButton1.id = "WeaponDraftButton1"
	WeaponDraftButton1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -300, 0, _1080p * 26, _1080p * 154 )
	self:addElement( WeaponDraftButton1 )
	self.WeaponDraftButton1 = WeaponDraftButton1
	
	local WeaponDraftButton2 = nil
	
	WeaponDraftButton2 = MenuBuilder.BuildRegisteredType( "WeaponDraftButton", {
		controllerIndex = f6_local1
	} )
	WeaponDraftButton2.id = "WeaponDraftButton2"
	WeaponDraftButton2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 300, _1080p * 26, _1080p * 154 )
	self:addElement( WeaponDraftButton2 )
	self.WeaponDraftButton2 = WeaponDraftButton2
	
	local TitleBackground = nil
	
	TitleBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f6_local1
	} )
	TitleBackground.id = "TitleBackground"
	TitleBackground.DropShadow:SetAlpha( 0, 0 )
	TitleBackground:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -300, 0, 0, _1080p * 27 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local Gamertag = nil
	
	Gamertag = LUI.UIText.new()
	Gamertag.id = "Gamertag"
	Gamertag:setText( "", 0 )
	Gamertag:SetFontSize( 18 * _1080p )
	Gamertag:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Gamertag:SetAlignment( LUI.Alignment.Left )
	Gamertag:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -287, 0, _1080p * 4.5, _1080p * 22.5 )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	f0_local2( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "WeaponDraftPlayerFlipped", WeaponDraftPlayerFlipped )
LockTable( _M )
