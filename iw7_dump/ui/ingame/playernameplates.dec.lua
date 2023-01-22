local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg1 < Engine.GetDvarInt( "ui_maxclients" ) then
		local f1_local0 = DataSources.inGame.MP.players.nameplate:GetDataSourceAtIndex( f1_arg1, f1_arg2 )
		f1_arg0:SetDataSource( f1_local0, f1_arg2 )
		f1_arg0:SetAlpha( 0 )
		f1_arg0.validClientEntityNum = true
		local f1_local1 = f1_local0.name:GetValue( f1_arg2 )
		if f1_local1 then
			f1_arg0.Name:setText( f1_local1 )
		end
		f1_arg0:ResetAnchor()
	else
		f1_arg0.validClientEntityNum = false
		f1_arg0:SetAlpha( 0 )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = MenuBuilder.BuildRegisteredType( "PlayerName" )
	f2_local0.id = "playerName"
	f2_local0:SetDataSource( DataSources.inGame.MP.players.nameplate:GetDataSourceAtIndex( Game.GetClientNumFromEntityNum( f2_arg0 ), f2_arg1 ), f2_arg1 )
	f2_local0.Name:SetRGBFromTable( {
		r = f2_arg2.r * 0.5,
		g = f2_arg2.g * 0.5,
		b = f2_arg2.b * 0.5
	}, 0 )
	return f2_local0
end

function PlayerNameplates( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg1.controllerIndex
	local f3_local1 = {
		screenOffsetY = -25,
		entityTag = "j_head",
		tagOffsetX = 8,
		obstructionEntityTag = "j_mainroot",
		minScale = 0.7,
		onScope = LUI.UIAnchoredElement.ON_SCOPE.hide,
		onObstruction = LUI.UIAnchoredElement.ON_OBSTRUCTION.sendEvent,
		roundScreenPosition = true,
		useClientDetailWorld = true,
		displayOnObstructionUnknown = false
	}
	local f3_local2 = LUI.ShallowCopy( f3_local1 )
	f3_local2.snapToScreenEdges = Engine.GetDvarBool( "cg_drawFriendlyNamesAlways" )
	f3_local2.alwaysShowUnderCrosshair = true
	local f3_local3 = {
		worldOffsetZ = 24,
		minScale = 0.7,
		onScope = LUI.UIAnchoredElement.ON_SCOPE.hide,
		onObstruction = LUI.UIAnchoredElement.ON_OBSTRUCTION.hide,
		roundScreenPosition = true
	}
	local f3_local4 = {
		onSpawn = function ( f4_arg0, f4_arg1 )
			return f0_local0( f4_arg0, f4_arg1, f3_local0 )
		end,
		buildChild = function ( f5_arg0 )
			local f5_local0 = MenuBuilder.BuildRegisteredType( "PlayerNameplate" )
			f5_local0.id = "playerNameplate"
			f5_local0.isFriendly = true
			f5_local0.Name:SetRGBFromTable( SWATCHES.HUD.friendlyTeam, 0 )
			f5_local0.Name:SetAlpha( 0.6 )
			f5_local0.Health.Fill:SetRGBFromTable( SWATCHES.HUD.friendlyTeam, 0 )
			f5_local0.Health.Fill:SetAlpha( 0.6 )
			f5_local0.Health.Frame:SetRGBFromTable( SWATCHES.HUD.background, 0 )
			f5_local0.Health.Frame:SetAlpha( 0.4 )
			return f5_local0
		end,
		removeDataLinksOnDespawn = false,
		spawnDistance = Engine.GetDvarFloat( "cg_friendlyNameplateDistance" ),
		spawnAngle = Engine.GetDvarFloat( "cg_friendlyNameplateAngle" ),
		isSpawnAngleRelative = true,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.clients + LUI.UIElementOnEntitySpawner.FILTER.friendlies,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f3_local2,
		maxVisibleElements = 10,
		initialPoolSize = 8,
		maxPoolSize = 8
	}
	local f3_local5 = {
		onSpawn = function ( f6_arg0, f6_arg1 )
			return f0_local0( f6_arg0, f6_arg1, f3_local0 )
		end,
		buildChild = function ()
			local f7_local0 = MenuBuilder.BuildRegisteredType( "PlayerNameplate" )
			f7_local0.id = "playerNameplate"
			f7_local0.isFriendly = false
			f7_local0.Name:SetRGBFromTable( SWATCHES.HUD.enemyTeam, 0 )
			f7_local0.Health.Fill:SetRGBFromTable( SWATCHES.HUD.enemyTeam, 0 )
			f7_local0.Health.Frame:SetRGBFromTable( SWATCHES.HUD.background, 0 )
			f7_local0.Health.Frame:SetAlpha( 0.6 )
			return f7_local0
		end,
		removeDataLinksOnDespawn = false,
		spawnDistance = Engine.GetDvarFloat( "cg_enemyNameplateDistance" ),
		spawnAngle = Engine.GetDvarFloat( "cg_enemyNameplateAngle" ),
		isSpawnAngleRelative = true,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.clients + LUI.UIElementOnEntitySpawner.FILTER.enemies + LUI.UIElementOnEntitySpawner.FILTER.flyingTarget,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f3_local1,
		maxVisibleElements = 10,
		initialPoolSize = 5,
		maxPoolSize = 5
	}
	local f3_local6 = {
		buildChild = function ( f8_arg0 )
			return f0_local1( f8_arg0, f3_local0, SWATCHES.HUD.friendlyTeam )
		end,
		spawnDistance = Engine.GetDvarFloat( "cg_friendlyNameplateDistance" ),
		spawnAngle = Engine.GetDvarFloat( "cg_friendlyNameplateAngle" ),
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.dogTags + LUI.UIElementOnEntitySpawner.FILTER.friendlies,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f3_local3,
		maxVisibleElements = 10
	}
	local f3_local7 = {
		buildChild = function ( f9_arg0 )
			return f0_local1( f9_arg0, f3_local0, SWATCHES.HUD.enemyTeam )
		end,
		spawnDistance = Engine.GetDvarFloat( "cg_friendlyNameplateDistance" ),
		spawnAngle = Engine.GetDvarFloat( "cg_friendlyNameplateAngle" ),
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.dogTags + LUI.UIElementOnEntitySpawner.FILTER.enemies,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f3_local3,
		maxVisibleElements = 10
	}
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "PlayerNameplates"
	local f3_local9 = LUI.UIElementOnEntitySpawner.new( f3_local4 )
	f3_local9.id = "entitySpawnerFriendly"
	f3_local9:SubscribeToModel( DataSources.inGame.player.spawnCount:GetModel( f3_local0 ), function ()
		f3_local9:DespawnForAllEntities( f3_local0 )
	end )
	self:addElement( f3_local9 )
	local f3_local10 = LUI.UIElementOnEntitySpawner.new( f3_local6 )
	f3_local10.id = "entitySpawnerDogTagsFriendly"
	self:addElement( f3_local10 )
	if not GameX.IsHardcoreMode() then
		local f3_local11 = LUI.UIElementOnEntitySpawner.new( f3_local5 )
		f3_local11.id = "entitySpawnerEnemy"
		local f3_local12 = function ()
			local f11_local0 = DataSources.inGame.player.marksman:GetValue( f3_local0 )
			local f11_local1 = DataSources.inGame.player.currentWeapon.enemyNameplateDisplayRange:GetValue( f3_local0 )
			if f11_local0 == nil or f11_local1 == nil then
				return 
			end
			local f11_local2 = math.min( f3_local5.spawnDistance, f11_local1 )
			local f11_local3 = f3_local5.spawnAngle
			if MLG.IsMLGSpectator() then
				f11_local2 = 100000
				f11_local3 = 360
			elseif f11_local0 then
				f11_local2 = f11_local2 * Engine.GetDvarFloat( "perk_marksmanNameDistanceScale" )
				f11_local3 = f11_local3 * Engine.GetDvarFloat( "perk_marksmanNameAngleScale" )
			end
			f3_local11:SetSpawnDistance( f11_local2 )
			f3_local11:SetSpawnAngle( f11_local3 )
		end
		
		f3_local11:SubscribeToModel( DataSources.inGame.player.marksman:GetModel( f3_local0 ), f3_local12, true )
		f3_local11:SubscribeToModel( DataSources.inGame.player.currentWeapon.enemyNameplateDisplayRange:GetModel( f3_local0 ), f3_local12, true )
		self:addElement( f3_local11 )
		self.entitySpawnerEnemy = f3_local11
	end
	local f3_local11 = LUI.UIElementOnEntitySpawner.new( f3_local7 )
	f3_local11.id = "entitySpawnerDogTagsEnemy"
	self:addElement( f3_local11 )
	return self
end

MenuBuilder.registerType( "PlayerNameplates", PlayerNameplates )
LockTable( _M )
