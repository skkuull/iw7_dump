local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = ZombiesUtils.CombatRecordMenuModelPath
function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
	Streaming.SetStreamingEnabled( false )
end

f0_local1 = function ()
	Engine.SetFrontEndSceneSection( "weapon_select", 1 )
end

function PostLoadFunc( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.RecordButtons )
	local f3_local0 = {}
	table.insert( f3_local0, {
		label = "LUA_MENU_ZM_FILMS_CAPS",
		menuRef = "CPCombatRecordMapListMenu",
		anim = "ShowRecord"
	} )
	table.insert( f3_local0, {
		label = "MENU_WEAPONS_CAPS",
		menuRef = "CPCombatRecordWeaponListMenu",
		anim = "ShowWeapon"
	} )
	table.insert( f3_local0, {
		label = "LUA_MENU_ZM_WONDER_CARDS",
		menuRef = "CPCombatRecordCardsListMenu",
		anim = "ShowCards"
	} )
	local f3_local1 = LUI.DataSourceFromList.new( #f3_local0 )
	f3_local1.MakeDataSourceAtIndex = function ( f4_arg0, f4_arg1 )
		local f4_local0 = f0_local0 .. ".category." .. f4_arg1
		local f4_local1 = f3_local0[f4_arg1 + 1]
		return {
			name = LUI.DataSourceInGlobalModel.new( f4_local0 .. ".name", f4_local1.label ),
			disabled = LUI.DataSourceInGlobalModel.new( f4_local0 .. ".isDisabled", false ),
			menuRef = f4_local1.menuRef,
			highlightFunc = function ()
				ACTIONS.AnimateSequence( f3_arg0, f4_local1.anim )
				ClientWeapon.SetWeaponVisible( 0, f4_local1.menuRef == "CPCombatRecordWeaponListMenu" )
			end
			
		}
	end
	
	f3_arg0.RecordButtons:SetGridDataSource( f3_local1, f3_arg1 )
end

function CPCombatRecordMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "CPCombatRecordMenu"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	f0_local1( self, f6_local1, controller )
	self:playSound( "menu_open" )
	local f6_local2 = self
	local Spinner = nil
	
	Spinner = LUI.UIImage.new()
	Spinner.id = "Spinner"
	Spinner:SetAlpha( 0, 0 )
	Spinner:SetScale( -0.28, 0 )
	Spinner:setImage( RegisterMaterial( "zm_tix_arcane_spinner" ), 0 )
	Spinner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -650, _1080p * 650, _1080p * -318, _1080p * 982 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local RecordButtons = nil
	
	RecordButtons = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		controllerIndex = f6_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CPCombatRecordButton", {
				controllerIndex = f6_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 30,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = true,
		horizontalAlignment = LUI.Alignment.Right,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	RecordButtons.id = "RecordButtons"
	RecordButtons:setUseStencil( false )
	RecordButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 29, _1080p * 529, _1080p * 22, _1080p * 172 )
	self:addElement( RecordButtons )
	self.RecordButtons = RecordButtons
	
	local WeaponHighlight = nil
	
	WeaponHighlight = MenuBuilder.BuildRegisteredType( "CPCombatRecordWeaponHighlight", {
		controllerIndex = f6_local1
	} )
	WeaponHighlight.id = "WeaponHighlight"
	WeaponHighlight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 580, _1080p * 1780, _1080p * 47, _1080p * 872 )
	self:addElement( WeaponHighlight )
	self.WeaponHighlight = WeaponHighlight
	
	local CardHighlight = nil
	
	CardHighlight = MenuBuilder.BuildRegisteredType( "CPCombatRecordCardsHighlight", {
		controllerIndex = f6_local1
	} )
	CardHighlight.id = "CardHighlight"
	CardHighlight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 580, _1080p * 1780, _1080p * 47, _1080p * 872 )
	self:addElement( CardHighlight )
	self.CardHighlight = CardHighlight
	
	local HeadquartersCombatRecordPreviewCP = nil
	
	HeadquartersCombatRecordPreviewCP = MenuBuilder.BuildRegisteredType( "HeadquartersCombatRecordPreviewCP", {
		controllerIndex = f6_local1
	} )
	HeadquartersCombatRecordPreviewCP.id = "HeadquartersCombatRecordPreviewCP"
	HeadquartersCombatRecordPreviewCP:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 673, _1080p * 1687, _1080p * 60, _1080p * 565 )
	self:addElement( HeadquartersCombatRecordPreviewCP )
	self.HeadquartersCombatRecordPreviewCP = HeadquartersCombatRecordPreviewCP
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Spinner:RegisterAnimationSequence( "ShowWeapon", {
			{
				function ()
					return self.Spinner:SetAlpha( 0, 0 )
				end
			}
		} )
		WeaponHighlight:RegisterAnimationSequence( "ShowWeapon", {
			{
				function ()
					return self.WeaponHighlight:SetAlpha( 1, 0 )
				end
			}
		} )
		CardHighlight:RegisterAnimationSequence( "ShowWeapon", {
			{
				function ()
					return self.CardHighlight:SetAlpha( 0, 0 )
				end
			}
		} )
		HeadquartersCombatRecordPreviewCP:RegisterAnimationSequence( "ShowWeapon", {
			{
				function ()
					return self.HeadquartersCombatRecordPreviewCP:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ShowWeapon = function ()
			Spinner:AnimateSequence( "ShowWeapon" )
			WeaponHighlight:AnimateSequence( "ShowWeapon" )
			CardHighlight:AnimateSequence( "ShowWeapon" )
			HeadquartersCombatRecordPreviewCP:AnimateSequence( "ShowWeapon" )
		end
		
		Spinner:RegisterAnimationSequence( "ShowMap", {
			{
				function ()
					return self.Spinner:SetAlpha( 0, 0 )
				end
			}
		} )
		WeaponHighlight:RegisterAnimationSequence( "ShowMap", {
			{
				function ()
					return self.WeaponHighlight:SetAlpha( 0, 0 )
				end
			}
		} )
		CardHighlight:RegisterAnimationSequence( "ShowMap", {
			{
				function ()
					return self.CardHighlight:SetAlpha( 0, 0 )
				end
			}
		} )
		HeadquartersCombatRecordPreviewCP:RegisterAnimationSequence( "ShowMap", {
			{
				function ()
					return self.HeadquartersCombatRecordPreviewCP:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ShowMap = function ()
			Spinner:AnimateSequence( "ShowMap" )
			WeaponHighlight:AnimateSequence( "ShowMap" )
			CardHighlight:AnimateSequence( "ShowMap" )
			HeadquartersCombatRecordPreviewCP:AnimateSequence( "ShowMap" )
		end
		
		Spinner:RegisterAnimationSequence( "ShowCards", {
			{
				function ()
					return self.Spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Spinner:SetZRotation( -360, 16000 )
				end
			},
			{
				function ()
					return self.Spinner:SetAlpha( 0.5, 0 )
				end
			}
		} )
		WeaponHighlight:RegisterAnimationSequence( "ShowCards", {
			{
				function ()
					return self.WeaponHighlight:SetAlpha( 0, 0 )
				end
			}
		} )
		CardHighlight:RegisterAnimationSequence( "ShowCards", {
			{
				function ()
					return self.CardHighlight:SetAlpha( 1, 0 )
				end
			}
		} )
		HeadquartersCombatRecordPreviewCP:RegisterAnimationSequence( "ShowCards", {
			{
				function ()
					return self.HeadquartersCombatRecordPreviewCP:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ShowCards = function ()
			Spinner:AnimateLoop( "ShowCards" )
			WeaponHighlight:AnimateLoop( "ShowCards" )
			CardHighlight:AnimateLoop( "ShowCards" )
			HeadquartersCombatRecordPreviewCP:AnimateLoop( "ShowCards" )
		end
		
		Spinner:RegisterAnimationSequence( "ShowRecord", {
			{
				function ()
					return self.Spinner:SetAlpha( 0, 0 )
				end
			}
		} )
		WeaponHighlight:RegisterAnimationSequence( "ShowRecord", {
			{
				function ()
					return self.WeaponHighlight:SetAlpha( 0, 0 )
				end
			}
		} )
		CardHighlight:RegisterAnimationSequence( "ShowRecord", {
			{
				function ()
					return self.CardHighlight:SetAlpha( 0, 0 )
				end
			}
		} )
		HeadquartersCombatRecordPreviewCP:RegisterAnimationSequence( "ShowRecord", {
			{
				function ()
					return self.HeadquartersCombatRecordPreviewCP:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowRecord = function ()
			Spinner:AnimateSequence( "ShowRecord" )
			WeaponHighlight:AnimateSequence( "ShowRecord" )
			CardHighlight:AnimateSequence( "ShowRecord" )
			HeadquartersCombatRecordPreviewCP:AnimateSequence( "ShowRecord" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "CPCombatRecordMenu", CPCombatRecordMenu )
LUI.FlowManager.RegisterStackPopBehaviour( "CPCombatRecordMenu", PopFunc )
LockTable( _M )
