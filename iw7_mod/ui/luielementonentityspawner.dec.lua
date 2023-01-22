LUI.UIAnchoredElement = {}
LUI.UIElementOnEntitySpawner = LUI.Class( LUI.UIElement )
LUI.UIElementOnEntitySpawner.RENDER_MODES = {
	anchored = 0,
	inWorld = 1
}
LUI.UIAnchoredElement.ON_OBSTRUCTION = {
	ignore = 0,
	sendEvent = 1,
	hide = 2
}
LUI.UIAnchoredElement.ON_SCOPE = {
	ignore = 0,
	sendEvent = 1,
	hide = 2
}
LUI.UIElementOnEntitySpawner.FILTER = {
	characters = 1,
	clients = 2,
	friendlies = 4,
	enemies = 8,
	underCrosshair = 16,
	dogTags = 32,
	flyingTarget = 64,
	largeFlyingTarget = 128,
	priorityFlyingTarget = 256,
	priorityFlyingTargetAce = 512,
	smallTarget = 1024,
	mediumTarget = 2048,
	largeTarget = 4096,
	specialTarget = 8192,
	offscreenAllyIndicator = 16384,
	offscreenEnemyIndicator = 32768,
	offscreenHazardIndicator = 65536,
	aceTargetIndicator = 131072,
	flyingAllyTarget = 262144,
	allyObjective = 524288,
	enemyObjective = 1048576,
	thermalVisionDefault = 2097152,
	thermalVisionLinked = 4194304,
	thermalVisionVenom = 8388608,
	thermalVisionApex = 16777216,
	largeWeakspot = 33554432,
	self = 67108864
}
LUI.AnchoredElement = {}
LUI.AnchoredElement.IgnoreTraceOffsetFlags = {
	WORLD = 1,
	TAG = 2,
	ENTITY = 4
}
LUI.UIElementOnEntitySpawner.init = function ( f1_arg0, f1_arg1 )
	if not f1_arg1 then
		f1_arg1 = {}
	end
	local f1_local0 = assert
	local f1_local1
	if f1_arg1.spawnDistance ~= nil and type( f1_arg1.spawnDistance ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg1.spawnAngle ~= nil and type( f1_arg1.spawnAngle ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg1.targetEntities ~= nil and type( f1_arg1.targetEntities ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_local0 = assert
	if f1_arg1.renderMode ~= nil and type( f1_arg1.renderMode ) ~= "number" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	assert( type( f1_arg1.buildChild ) == "function" )
	f1_local0 = assert
	if f1_arg1.removeDataLinksOnDespawn ~= nil and type( f1_arg1.removeDataLinksOnDespawn ) ~= "boolean" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	f1_arg1.renderingOptions = f1_arg1.renderingOptions or {}
	f1_local0 = assert
	if f1_arg1.renderingOptions ~= nil and type( f1_arg1.renderingOptions ) ~= "table" and type( f1_arg1.renderingOptions ) ~= "function" then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	if type( f1_arg1.renderingOptions ) == "table" then
		f1_local0 = assert
		if f1_arg1.renderingOptions.entityTag ~= nil and type( f1_arg1.renderingOptions.entityTag ) ~= "string" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
		f1_local0 = assert
		if f1_arg1.renderingOptions.screenOffsetX ~= nil and type( f1_arg1.renderingOptions.screenOffsetX ) ~= "number" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
		f1_local0 = assert
		if f1_arg1.renderingOptions.screenOffsetY ~= nil and type( f1_arg1.renderingOptions.screenOffsetY ) ~= "number" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
		f1_local0 = assert
		if f1_arg1.renderingOptions.entityOffsetX ~= nil and type( f1_arg1.renderingOptions.entityOffsetX ) ~= "number" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
		f1_local0 = assert
		if f1_arg1.renderingOptions.entityOffsetY ~= nil and type( f1_arg1.renderingOptions.entityOffsetY ) ~= "number" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
		f1_local0 = assert
		if f1_arg1.renderingOptions.entityOffsetZ ~= nil and type( f1_arg1.renderingOptions.entityOffsetZ ) ~= "number" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
		f1_local0 = assert
		if f1_arg1.renderingOptions.worldOffsetX ~= nil and type( f1_arg1.renderingOptions.worldOffsetX ) ~= "number" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
		f1_local0 = assert
		if f1_arg1.renderingOptions.worldOffsetY ~= nil and type( f1_arg1.renderingOptions.worldOffsetY ) ~= "number" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
		f1_local0 = assert
		if f1_arg1.renderingOptions.worldOffsetZ ~= nil and type( f1_arg1.renderingOptions.worldOffsetZ ) ~= "number" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
		f1_local0 = assert
		if f1_arg1.renderingOptions.minScale ~= nil and type( f1_arg1.renderingOptions.minScale ) ~= "number" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
		f1_local0 = assert
		if f1_arg1.renderingOptions.maxScale ~= nil and type( f1_arg1.renderingOptions.maxScale ) ~= "number" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
		f1_local0 = assert
		if f1_arg1.renderingOptions.naturalDistance ~= nil and type( f1_arg1.renderingOptions.naturalDistance ) ~= "number" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
		f1_local0 = assert
		if f1_arg1.renderingOptions.snapToScreenEdges ~= nil and type( f1_arg1.renderingOptions.snapToScreenEdges ) ~= "boolean" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
		f1_local0 = assert
		if f1_arg1.renderingOptions.snapSmoothing ~= nil and type( f1_arg1.renderingOptions.snapSmoothing ) ~= "number" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
		f1_local0 = assert
		if f1_arg1.renderingOptions.onObstruction ~= nil and type( f1_arg1.renderingOptions.onObstruction ) ~= "number" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
		f1_local0 = assert
		if f1_arg1.renderingOptions.obstructionEntityTag ~= nil and type( f1_arg1.renderingOptions.obstructionEntityTag ) ~= "string" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
		f1_local0 = assert
		if f1_arg1.renderingOptions.displayOnObstructionUnknown ~= nil and type( f1_arg1.renderingOptions.displayOnObstructionUnknown ) ~= "boolean" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
		f1_local0 = assert
		if f1_arg1.renderingOptions.ignoreOffsetsForTraces ~= nil and type( f1_arg1.renderingOptions.ignoreOffsetsForTraces ) ~= "number" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
		f1_local0 = assert
		if f1_arg1.renderingOptions.alwaysShowUnderCrosshair ~= nil and type( f1_arg1.renderingOptions.alwaysShowUnderCrosshair ) ~= "boolean" then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_local0( f1_local1 )
	end
	LUI.UIElementOnEntitySpawner.super.init( f1_arg0, nil )
	f1_arg0.id = "UIElementOnEntitySpawner_" .. (f1_arg1.id or "")
	f1_arg0._renderingOptions = f1_arg1.renderingOptions
	f1_arg0._buildChild = f1_arg1.buildChild
	f1_arg0._removeDataLinksOnDespawn = f1_arg1.removeDataLinksOnDespawn ~= false
	f1_arg0._onSpawn = f1_arg1.onSpawn or nil
	f1_local0 = f1_arg1.renderMode
	if not f1_local0 then
		f1_local0 = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored
	end
	f1_arg0._renderMode = f1_local0
	f1_arg0._spawned = {}
	f1_arg0._initialPoolSize = f1_arg1.initialPoolSize or 0
	f1_arg0._maxPoolSize = f1_arg1.maxPoolSize or 10
	if f1_arg0._initialPoolSize > 0 then
		f1_arg0._pool = LUI.LUIElementPool.new( {
			buildElement = f1_arg0._buildChild,
			initialPoolSize = f1_arg0._initialPoolSize,
			maxPoolSize = f1_arg0._maxPoolSize,
			id = f1_arg0.id .. "_" .. (f1_arg1.id or "")
		} )
	end
	f1_arg1.maxVisibleElements = f1_arg1.maxVisibleElements or 3
	f1_arg1.targetEntities = f1_arg1.targetEntities or 0
	f1_arg0:SetupOnEntityElementSpawner( f1_arg1 )
	f1_arg0:registerEventHandler( "onEntityElementSpawn", f1_arg0.SpawnHandler )
	f1_arg0:registerEventHandler( "onEntityElementDespawn", f1_arg0.DespawnHandler )
end

LUI.UIElementOnEntitySpawner.SpawnHandler = function ( f2_arg0, f2_arg1 )
	assert( type( f2_arg1.entityNum ) == "number" )
	f2_arg0:Spawn( f2_arg1.entityNum )
end

LUI.UIElementOnEntitySpawner.DespawnHandler = function ( f3_arg0, f3_arg1 )
	assert( type( f3_arg1.entityNum ) == "number" )
	f3_arg0:Despawn( f3_arg1.entityNum )
end

LUI.UIElementOnEntitySpawner.Spawn = function ( f4_arg0, f4_arg1 )
	local f4_local0 = nil
	if type( f4_arg0._renderingOptions ) == "function" then
		f4_local0 = f4_arg0._renderingOptions( f4_arg1 )
	else
		f4_local0 = f4_arg0._renderingOptions
	end
	f4_local0.entityNum = f4_arg1
	assert( f4_arg0._spawned[f4_arg1] == nil )
	local f4_local1 = nil
	if f4_arg0._initialPoolSize > 0 then
		f4_local1 = f4_arg0._pool:AllocateElement()
	else
		f4_local1 = f4_arg0._buildChild( f4_arg1 )
	end
	if f4_local1 ~= nil then
		f4_arg0._spawned[f4_arg1] = f4_local1
		if f4_local1._anchorHasBeenSetup == nil then
			if f4_local0 and f4_local0.rotateElementStrings ~= nil then
				f4_local0.rotateElements = {}
				for f4_local5, f4_local6 in ipairs( f4_local0.rotateElementStrings ) do
					if f4_local1[f4_local6] == nil then
						DebugPrint( "WARNING: Trying to add a LUI element that doesn't exist to rotateElement: " .. f4_local6 )
						assert( f4_local1[f4_local6 == nil] )
					end
					table.insert( f4_local0.rotateElements, f4_local1[f4_local6] )
				end
			end
			if f4_arg0._renderMode == LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored then
				if f4_local1._anchorHasBeenSetup == nil then
					f4_local1:SetupAnchoredElement( f4_local0 )
					f4_local1._anchorHasBeenSetup = true
				end
			else
				f4_local1:SetupInWorldElement( f4_local0 )
			end
		end
		f4_local1:SetEntityNum( f4_arg1 )
		if f4_arg0._onSpawn ~= nil then
			f4_arg0._onSpawn( f4_local1, f4_arg1 )
		end
		f4_arg0:addElement( f4_local1 )
	end
end

LUI.UIElementOnEntitySpawner.Despawn = function ( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg0._spawned[f5_arg1]
	if f5_local0 then
		if f5_arg0._initialPoolSize > 0 then
			f5_arg0._pool:DeallocateElement( f5_local0 )
			if f5_local0._anchorHasBeenSetup then
				f5_local0:ResetAnchor()
			end
			if f5_arg0._removeDataLinksOnDespawn then
				f5_local0:close()
			else
				f5_local0:RemoveFromParent()
				f5_local0:SetDataSource( nil, nil )
			end
		else
			f5_local0:closeTree()
		end
		f5_arg0._spawned[f5_arg1] = nil
	end
end

