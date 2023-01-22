LUI.DataSourceFromModel = LUI.Class()
LUI.DataSourceFromModel.init = function ( f1_arg0, f1_arg1 )
	f1_arg0._defaultValue = f1_arg1
end

LUI.DataSourceFromModel.GetModel = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0:FindModel( f2_arg1 )
	if not f2_local0 then
		f2_local0 = f2_arg0:CreateModel( f2_arg1 )
		if f2_arg0._defaultValue ~= nil then
			DataModel.SetModelValue( f2_local0, f2_arg0._defaultValue )
		end
	end
	assert( f2_local0 )
	return f2_local0
end

LUI.DataSourceFromModel.GetValue = function ( f3_arg0, f3_arg1 )
	return DataModel.GetModelValue( f3_arg0:GetModel( f3_arg1 ) )
end

LUI.DataSourceFromModel.SetValue = function ( f4_arg0, f4_arg1, f4_arg2 )
	return DataModel.SetModelValue( f4_arg0:GetModel( f4_arg1 ), f4_arg2 )
end

LUI.DataSourceFromModel.GetDataSourceForSubmodel = function ( f5_arg0, f5_arg1, f5_arg2 )
	return LUI.DataSourceForSubmodel.new( f5_arg0, f5_arg1, f5_arg2 )
end

LUI.DataSourceFromModel.Filter = function ( f6_arg0, f6_arg1, f6_arg2 )
	return LUI.FilteredDataSource.new( f6_arg0, f6_arg1, f6_arg2 )
end

LUI.DataSourceFromModel.FilterTo = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
	return LUI.FilterToDataSource.new( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
end

LUI.DataSourceFromModel.IsPerController = function ( f8_arg0 )
	return Engine.IsConsoleGame() and f8_arg0:GetModel( 0 ) ~= f8_arg0:GetModel( 1 )
end

LUI.DataSourceInGlobalModel = LUI.Class( LUI.DataSourceFromModel )
LUI.DataSourceInGlobalModel.init = function ( f9_arg0, f9_arg1, f9_arg2 )
	LUI.DataSourceInGlobalModel.super.init( f9_arg0, f9_arg2 )
	f9_arg0._modelPath = f9_arg1
end

LUI.DataSourceInGlobalModel.FindModel = function ( f10_arg0, f10_arg1 )
	return DataModel.GetModel( DataModel.GetGlobalModel(), f10_arg0._modelPath )
end

LUI.DataSourceInGlobalModel.CreateModel = function ( f11_arg0, f11_arg1 )
	return DataModel.CreateModel( DataModel.GetGlobalModel(), f11_arg0._modelPath )
end

LUI.DataSourceInGlobalModel.IsPerController = function ( f12_arg0 )
	return false
end

LUI.DataSourceInControllerModel = LUI.Class( LUI.DataSourceFromModel )
LUI.DataSourceInControllerModel.init = function ( f13_arg0, f13_arg1, f13_arg2 )
	LUI.DataSourceInControllerModel.super.init( f13_arg0, f13_arg2 )
	f13_arg0._modelPath = f13_arg1
end

LUI.DataSourceInControllerModel.FindModel = function ( f14_arg0, f14_arg1 )
	return DataModel.GetModel( DataModel.GetModelForController( f14_arg1 ), f14_arg0._modelPath )
end

LUI.DataSourceInControllerModel.CreateModel = function ( f15_arg0, f15_arg1 )
	return DataModel.CreateModel( DataModel.GetModelForController( f15_arg1 ), f15_arg0._modelPath )
end

LUI.DataSourceInControllerModel.IsPerController = function ( f16_arg0 )
	return true
end

LUI.DataSourceFromOmnvar = LUI.Class( LUI.DataSourceFromModel )
LUI.DataSourceFromOmnvar.init = function ( f17_arg0, f17_arg1 )
	LUI.DataSourceFromOmnvar.super.init( f17_arg0 )
	local f17_local0 = assert
	local f17_local1
	if type( f17_arg1 ) ~= "string" or #f17_arg1 <= 0 then
		f17_local1 = false
	else
		f17_local1 = true
	end
	f17_local0( f17_local1 )
	f17_arg0._omnvarName = f17_arg1
end

LUI.DataSourceFromOmnvar.FindModel = function ( f18_arg0, f18_arg1 )
	local f18_local0 = DataModel.GetModelForOmnvar( f18_arg0._omnvarName, f18_arg1 )
	assert( f18_local0, "Could not find a model for omnvar '" .. tostring( f18_arg0._omnvarName ) .. "'. It is most likely missing from omnvars.csv." )
	return f18_local0
end

LUI.DataSourceFromOmnvar.CreateModel = function ( f19_arg0, f19_arg1 )
	assert( false )
end

LUI.DataSourceForSubmodel = LUI.Class( LUI.DataSourceFromModel )
LUI.DataSourceForSubmodel.init = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
	LUI.DataSourceForSubmodel.super.init( f20_arg0, f20_arg3 )
	f20_arg0._baseDataSource = f20_arg1
	f20_arg0._modelPath = f20_arg2
end

LUI.DataSourceForSubmodel.FindModel = function ( f21_arg0, f21_arg1 )
	local f21_local0 = f21_arg0._baseDataSource:GetModel( f21_arg1 )
	if f21_local0 then
		return DataModel.GetModel( f21_local0, f21_arg0._modelPath )
	else
		
	end
end

LUI.DataSourceForSubmodel.CreateModel = function ( f22_arg0, f22_arg1 )
	return DataModel.CreateModel( f22_arg0._baseDataSource:GetModel( f22_arg1 ), f22_arg0._modelPath )
end

LUI.DataSourceForSubmodel.IsPerController = function ( f23_arg0 )
	return f23_arg0._baseDataSource:IsPerController()
end

LUI.DataSourceFromList = LUI.Class()
LUI.DataSourceFromList.init = function ( f24_arg0, f24_arg1 )
	if type( f24_arg1 ) == "table" then
		assert( f24_arg1.GetModel )
		f24_arg0._countDataSource = f24_arg1
	else
		assert( f24_arg1 >= 0 )
		f24_arg0._countValue = f24_arg1
	end
	local f24_local0 = getmetatable( f24_arg0 )
	local f24_local1 = f24_local0.__index
	assert( type( f24_local1 ) == "table" )
	f24_local0.__index = function ( f25_arg0, f25_arg1 )
		f25_arg1 = tonumber( f25_arg1 ) or f25_arg1
		if type( f25_arg1 ) == "number" then
			return f25_arg0:GetDataSourceAtIndex( f25_arg1 )
		else
			return f24_local1[f25_arg1]
		end
	end
	
end

LUI.DataSourceFromList.GetDataSourceAtIndex = function ( f26_arg0, f26_arg1, f26_arg2 )
	local f26_local0 = nil
	if f26_arg0._cache then
		f26_local0 = LUI.DataSourceFromList.FetchDataSourceAtIndexFromCache( f26_arg0, f26_arg1, f26_arg2 )
		if not f26_local0 then
			f26_local0 = f26_arg0:MakeDataSourceAtIndex( f26_arg1, f26_arg2 )
			LUI.DataSourceFromList.CacheDataSourceAtIndex( f26_arg0, f26_local0, f26_arg1, f26_arg2 )
		end
	else
		f26_local0 = f26_arg0:MakeDataSourceAtIndex( f26_arg1, f26_arg2 )
	end
	return f26_local0
end

LUI.DataSourceFromList.FetchDataSourceAtIndexFromCache = function ( f27_arg0, f27_arg1, f27_arg2 )
	assert( f27_arg0._cache )
	if not f27_arg2 then
		f27_arg2 = -1
	end
	if not f27_arg0._cache[f27_arg2] then
		f27_arg0._cache[f27_arg2] = {}
		setmetatable( f27_arg0._cache[f27_arg2], {
			__mode = "v"
		} )
	end
	return f27_arg0._cache[f27_arg2][f27_arg1]
end

LUI.DataSourceFromList.CacheDataSourceAtIndex = function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
	assert( f28_arg0._cache )
	if not f28_arg3 then
		f28_arg3 = -1
	end
	f28_arg0._cache[f28_arg3][f28_arg2] = f28_arg1
end

LUI.DataSourceFromList.GetCountModel = function ( f29_arg0, f29_arg1 )
	if f29_arg0._countDataSource then
		return f29_arg0._countDataSource:GetModel( f29_arg1 )
	else
		return nil
	end
end

LUI.DataSourceFromList.GetCountValue = function ( f30_arg0, f30_arg1 )
	if f30_arg0._countValue then
		return f30_arg0._countValue
	else
		return DataModel.GetModelValue( f30_arg0:GetCountModel( f30_arg1 ) )
	end
end

LUI.DataSourceFromList.GetDefaultFocusIndex = function ( f31_arg0, f31_arg1 )
	return nil
end

LUI.DataSourceFromList.Decorate = function ( f32_arg0, f32_arg1 )
	assert( type( f32_arg1 ) == "function" )
	local f32_local0 = LUI.DataSourceFromList.new( f32_arg0._countDataSource or f32_arg0._countValue )
	f32_local0.GetDataSourceAtIndex = function ( f33_arg0, f33_arg1, f33_arg2 )
		local f33_local0 = nil
		local f33_local1 = function ()
			local f34_local0 = f32_arg0:GetDataSourceAtIndex( f33_arg1, f33_arg2 )
			assert( f34_local0 )
			f33_local0 = f32_arg1( f33_arg1, f34_local0, f33_arg2 )
			setmetatable( f33_local0, {
				__index = f34_local0
			} )
		end
		
		if f32_local0._cache then
			f33_local0 = LUI.DataSourceFromList.FetchDataSourceAtIndexFromCache( f32_local0, f33_arg1, f33_arg2 )
			if not f33_local0 then
				f33_local1()
				LUI.DataSourceFromList.CacheDataSourceAtIndex( f32_local0, f33_local0, f33_arg1, f33_arg2 )
			end
		else
			f33_local1()
		end
		return f33_local0
	end
	
	return f32_local0
end

LUI.DataSourceFromList.SetCachingEnabled = function ( f35_arg0, f35_arg1 )
	if f35_arg1 then
		f35_arg0._cache = f35_arg0._cache or {}
	else
		f35_arg0._cache = nil
	end
end

LUI.DataSourceFromList.ClearCache = function ( f36_arg0 )
	if f36_arg0._cache then
		f36_arg0._cache = {}
	end
end

LUI.FeedDataSource = LUI.Class( LUI.DataSourceFromList )
LUI.FeedDataSource.init = function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3 )
	assert( f37_arg2 > 0 )
	assert( type( f37_arg3 ) == "table" )
	LUI.FeedDataSource.super.init( f37_arg0, f37_arg2 )
	f37_arg0._bufferSize = f37_arg2
	f37_arg0._defaults = {}
	f37_arg0._dataSources = {}
	f37_arg0._baseDataSource = f37_arg1
	f37_arg0._lifetime = LUI.SubscriptionsHolder.new()
	if f37_arg1:IsPerController() then
		for f37_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
			local f37_local3 = f37_local0
			if Engine.HasActiveLocalClient( f37_local3 ) then
				f37_arg0:InitModels( f37_local3, f37_arg3 )
				f37_arg0._lifetime:SubscribeToModel( f37_arg0:GetPushModel( f37_local3 ), function ( f38_arg0 )
					if DataModel.GetModelValue( f38_arg0 ) == true then
						f37_arg0:PushData( f37_local3 )
					end
				end )
			end
		end
	else
		f37_arg0:InitModels( 0, f37_arg3 )
		f37_arg0._lifetime:SubscribeToModel( dataSource:GetModel( 0 ), function ( f39_arg0 )
			if DataModel.GetModelValue( f39_arg0 ) == true then
				f37_arg0:PushData( 0 )
			end
		end )
	end
	f37_arg0:InitBufferDataSources()
end

LUI.FeedDataSource.GetDataSourceAtIndex = function ( f40_arg0, f40_arg1, f40_arg2 )
	local f40_local0 = f40_arg1 % f40_arg0._bufferSize
	assert( type( f40_arg0._dataSources[f40_local0] ) == "table" )
	return f40_arg0._dataSources[f40_local0]
end

LUI.FeedDataSource.GetPushModel = function ( f41_arg0, f41_arg1 )
	return DataModel.CreateModel( f41_arg0._baseDataSource:GetModel( f41_arg1 ), "push" )
end

LUI.FeedDataSource.GetTTLModel = function ( f42_arg0, f42_arg1 )
	return DataModel.CreateModel( f42_arg0:GetPushModel( f42_arg1 ), "TTL" )
end

LUI.FeedDataSource.ClearContent = function ( f43_arg0, f43_arg1 )
	DataModel.SetModelValue( f43_arg0:GetNextWriteBufferIndexModel( f43_arg1 ), 0 )
end

LUI.FeedDataSource.InitModels = function ( f44_arg0, f44_arg1, f44_arg2 )
	local f44_local0 = f44_arg0._baseDataSource:GetModel( f44_arg1 )
	local f44_local1 = DataModel.CreateModel( f44_local0, "push" )
	local f44_local2 = DataModel.CreateModel( f44_local0, "buffer" )
	DataModel.SetModelValue( DataModel.CreateModel( f44_local2, "next" ), 0 )
	for f44_local3 = 0, f44_arg0._bufferSize - 1, 1 do
		DataModel.CreateModel( f44_local2, tostring( f44_local3 ) )
	end
	f44_arg0:InitBufferModels( f44_arg1, f44_arg2, "" )
end

LUI.FeedDataSource.InitBufferModels = function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3 )
	local f45_local0 = DataModel.CreateModel( f45_arg0._baseDataSource:GetModel( f45_arg1 ), "push" )
	for f45_local7, f45_local8 in pairs( f45_arg2 ) do
		local f45_local9 = f45_arg3 .. f45_local7
		assert( type( f45_local7 ) == "string" )
		if type( f45_local8 ) == "table" then
			f45_arg0:InitBufferModels( f45_arg1, f45_local8, f45_local9 .. "." )
		end
		DataModel.CreateModel( f45_local0, f45_local9 )
		f45_arg0._defaults[f45_local9] = f45_local8
		for f45_local4 = 0, f45_arg0._bufferSize - 1, 1 do
			DataModel.SetModelValue( DataModel.CreateModel( f45_arg0:GetBufferModel( f45_local4, f45_arg1 ), f45_local9 ), f45_local8 )
		end
	end
end

LUI.FeedDataSource.InitBufferDataSources = function ( f46_arg0 )
	for f46_local0 = 0, f46_arg0._bufferSize - 1, 1 do
		f46_arg0._dataSources[f46_local0] = {}
		for f46_local10, f46_local11 in pairs( f46_arg0._defaults ) do
			local f46_local12 = LUI.Split( f46_local10, "." )
			local f46_local6 = f46_arg0._dataSources[f46_local0]
			for f46_local7, f46_local8 in ipairs( f46_local12 ) do
				if f46_local7 < #f46_local12 then
					f46_local6[f46_local8] = f46_local6[f46_local8] or {}
					f46_local6 = f46_local6[f46_local8]
				else
					f46_local6[f46_local8] = f46_arg0._baseDataSource:GetDataSourceForSubmodel( "buffer." .. tostring( f46_local0 ) .. "." .. f46_local10 )
				end
			end
		end
	end
end

LUI.FeedDataSource.PushData = function ( f47_arg0, f47_arg1 )
	local f47_local0 = f47_arg0:GetPushModel( f47_arg1 )
	assert( DataModel.GetModelValue( f47_local0 ) == true )
	local f47_local1 = {}
	for f47_local5, f47_local6 in pairs( f47_arg0._defaults ) do
		assert( type( f47_local5 ) == "string" )
		f47_local1[f47_local5] = f47_local6
		local f47_local7 = DataModel.GetModelValue( DataModel.GetModel( f47_local0, f47_local5 ) )
		if f47_local7 ~= nil then
			f47_local1[f47_local5] = f47_local7
		end
	end
	f47_local3 = f47_arg0:GetBufferModel( f47_arg0:GetNextWriteBufferIndex( f47_arg1 ), f47_arg1 )
	for f47_local7, f47_local8 in pairs( f47_local1 ) do
		assert( type( f47_local7 ) == "string" )
		DataModel.SetModelValue( DataModel.GetModel( f47_local3, f47_local7 ), f47_local8 )
	end
	f47_arg0:IncrementNextWriteBufferIndex( f47_arg1 )
	DataModel.SetModelValue( f47_local0, false )
end

LUI.FeedDataSource.GetNextWriteBufferIndexModel = function ( f48_arg0, f48_arg1 )
	return DataModel.GetModel( f48_arg0._baseDataSource:GetModel( f48_arg1 ), "buffer.next" )
end

LUI.FeedDataSource.GetNextWriteBufferIndex = function ( f49_arg0, f49_arg1 )
	return DataModel.GetModelValue( f49_arg0:GetNextWriteBufferIndexModel( f49_arg1 ) )
end

LUI.FeedDataSource.IncrementNextWriteBufferIndex = function ( f50_arg0, f50_arg1 )
	DataModel.SetModelValue( f50_arg0:GetNextWriteBufferIndexModel( f50_arg1 ), (f50_arg0:GetNextWriteBufferIndex( f50_arg1 ) + 1) % f50_arg0._bufferSize )
end

LUI.FeedDataSource.GetBufferModel = function ( f51_arg0, f51_arg1, f51_arg2 )
	local f51_local0 = DataModel.GetModel( f51_arg0._baseDataSource:GetModel( f51_arg2 ), "buffer." .. tostring( f51_arg1 ) )
	assert( type( f51_local0 ) == "userdata" )
	return f51_local0
end

LUI.BaseAggregateDataSource = LUI.Class( LUI.DataSourceForSubmodel )
LUI.BaseAggregateDataSource.init = function ( f52_arg0, f52_arg1, f52_arg2, f52_arg3, f52_arg4 )
	assert( type( f52_arg3 ) == "table" )
	assert( type( f52_arg4 ) == "function" )
	assert( #f52_arg3 > 0 )
	f52_arg0._inControllerModel = f52_arg1:IsPerController()
	f52_arg0._lifetime = LUI.SubscriptionsHolder.new()
	f52_arg0._aggregateFunction = f52_arg4
	f52_arg0._controllersSubscribed = {}
	f52_arg0._inputDataSources = f52_arg3
	LUI.BaseAggregateDataSource.super.init( f52_arg0, f52_arg1, f52_arg2 )
end

LUI.BaseAggregateDataSource.UpdateAggregateValue = function ( f53_arg0, f53_arg1 )
	local f53_local0 = f53_arg0._aggregateFunction( f53_arg1 )
	if f53_local0 ~= nil then
		DataModel.SetModelValue( f53_arg0:GetModel( f53_arg1 ), f53_local0 )
	end
end

LUI.BaseAggregateDataSource.SubscribeForController = function ( f54_arg0, f54_arg1 )
	if not f54_arg0._controllersSubscribed[f54_arg1] then
		f54_arg0._controllersSubscribed[f54_arg1] = true
		for f54_local3, f54_local4 in ipairs( f54_arg0._inputDataSources ) do
			f54_arg0._lifetime:SubscribeToModel( f54_local4:GetModel( f54_arg1 ), function ( f55_arg0 )
				f54_arg0:UpdateAggregateValue( f54_arg1 )
			end, true )
		end
		f54_arg0:UpdateAggregateValue( f54_arg1 )
	end
end

LUI.BaseAggregateDataSource.IsPerController = function ( f56_arg0 )
	return f56_arg0._inControllerModel
end

LUI.BaseAggregateDataSource.FindModel = function ( f57_arg0, f57_arg1 )
	f57_arg0:SubscribeForController( f57_arg1 )
	return LUI.BaseAggregateDataSource.super.FindModel( f57_arg0, f57_arg1 )
end

LUI.AggregateDataSource = LUI.Class( LUI.BaseAggregateDataSource )
LUI.AggregateDataSource.init = function ( f58_arg0, f58_arg1, f58_arg2, f58_arg3, f58_arg4 )
	assert( type( f58_arg1 ) == "table" )
	assert( type( f58_arg2 ) == "table" )
	assert( type( f58_arg3 ) == "string" )
	assert( type( f58_arg4 ) == "function" )
	LUI.AggregateDataSource.super.init( f58_arg0, f58_arg1, f58_arg3, f58_arg2, f58_arg4 )
end

LUI.FilteredDataSource = LUI.Class( LUI.BaseAggregateDataSource )
LUI.FilteredDataSource.init = function ( f59_arg0, f59_arg1, f59_arg2, f59_arg3 )
	assert( type( f59_arg1 ) == "table" )
	assert( type( f59_arg2 ) == "string" )
	assert( type( f59_arg3 ) == "function" )
	LUI.FilteredDataSource.super.init( f59_arg0, f59_arg1, f59_arg2, {
		f59_arg1
	}, function ( f60_arg0 )
		local f60_local0 = f59_arg1:GetValue( f60_arg0 )
		if f60_local0 ~= nil then
			return f59_arg3( f60_local0, f60_arg0 )
		else
			
		end
	end )
end

LUI.FilterToDataSource = LUI.Class( LUI.BaseAggregateDataSource )
LUI.FilterToDataSource.init = function ( f61_arg0, f61_arg1, f61_arg2, f61_arg3, f61_arg4 )
	assert( type( f61_arg1 ) == "table" )
	assert( type( f61_arg2 ) == "table" )
	assert( type( f61_arg3 ) == "string" )
	assert( type( f61_arg4 ) == "function" )
	LUI.FilterToDataSource.super.init( f61_arg0, f61_arg2, f61_arg3, {
		f61_arg1
	}, function ( f62_arg0 )
		local f62_local0 = f61_arg1:GetValue( f62_arg0 )
		if f62_local0 ~= nil then
			return f61_arg4( f62_local0, f62_arg0 )
		else
			
		end
	end )
end

local f0_local0 = {
	GetDataSourceForField = function ( f63_arg0, f63_arg1 )
		assert( f63_arg0._statsGroup )
		assert( f63_arg0._gameMode )
		assert( f63_arg0._DDLState )
		assert( f63_arg0._cachedSubDataSources )
		if not f63_arg0._cachedSubDataSources[f63_arg1] then
			local f63_local0 = f63_arg0._DDLState[f63_arg1]
			assert( f63_local0, "Error navigating playerdata, from field " .. tostring( f63_arg0._DDLState ) .. " with key " .. tostring( f63_arg1 ) )
			local f63_local1 = nil
			if PlayerData.IsArray( f63_local0 ) then
				f63_local1 = LUI.ListDataSourceFromPlayerDataArray.new( f63_arg0._statsGroup, f63_arg0._gameMode, f63_local0 )
			else
				f63_local1 = LUI.DataSourceFromPlayerData.new( f63_arg0._statsGroup, f63_arg0._gameMode, f63_local0 )
			end
			f63_arg0._cachedSubDataSources[f63_arg1] = f63_local1
		end
		return f63_arg0._cachedSubDataSources[f63_arg1]
	end
}
LUI.DataSourceFromPlayerData = LUI.Class( LUI.DataSourceInControllerModel )
LUI.DataSourceFromPlayerData.GetDataSourceForField = f0_local0.GetDataSourceForField
LUI.DataSourceFromPlayerData.init = function ( f64_arg0, f64_arg1, f64_arg2, f64_arg3 )
	f64_arg0._statsGroup = f64_arg1
	f64_arg0._gameMode = f64_arg2
	if not f64_arg3 then
		f64_arg0._DDLState = PlayerData.GetRootDDLState( f64_arg1, f64_arg2 )
	else
		f64_arg0._DDLState = f64_arg3
	end
	assert( f64_arg0._statsGroup )
	assert( f64_arg0._gameMode )
	assert( f64_arg0._DDLState )
	LUI.DataSourceFromPlayerData.super.init( f64_arg0, modelPath )
	f64_arg0._cachedSubDataSources = {}
	setmetatable( f64_arg0._cachedSubDataSources, {
		__mode = "v"
	} )
	local f64_local0 = getmetatable( f64_arg0 )
	local f64_local1 = f64_local0.__index
	assert( type( f64_local1 ) == "table" )
	f64_local0.__index = function ( f65_arg0, f65_arg1 )
		if f64_local1[f65_arg1] ~= nil then
			return f64_local1[f65_arg1]
		else
			return f65_arg0:GetDataSourceForField( f65_arg1 )
		end
	end
	
end

LUI.DataSourceFromPlayerData.FindModel = function ( f66_arg0, f66_arg1 )
	local f66_local0 = PlayerData.GetModelForField( f66_arg0._statsGroup, f66_arg0._gameMode, f66_arg0._DDLState, f66_arg1 )
	assert( f66_local0 )
	return f66_local0
end

LUI.DataSourceFromPlayerData.CreateModel = function ( f67_arg0, f67_arg1 )
	assert( false )
end

LUI.DataSourceFromPlayerData.SetValue = function ( f68_arg0, f68_arg1, f68_arg2 )
	assert( f68_arg1 )
	assert( f68_arg2 ~= nil )
	PlayerData.SetValue( f68_arg0._statsGroup, f68_arg0._gameMode, f68_arg0._DDLState, f68_arg1, f68_arg2 )
end

LUI.ListDataSourceFromPlayerDataArray = LUI.Class( LUI.DataSourceFromList )
LUI.ListDataSourceFromPlayerDataArray.GetDataSourceForField = f0_local0.GetDataSourceForField
LUI.ListDataSourceFromPlayerDataArray.init = function ( f69_arg0, f69_arg1, f69_arg2, f69_arg3 )
	assert( f69_arg1 )
	assert( f69_arg3 )
	f69_arg0._statsGroup = f69_arg1
	f69_arg0._gameMode = f69_arg2
	f69_arg0._DDLState = f69_arg3
	f69_arg0._cachedSubDataSources = {}
	setmetatable( f69_arg0._cachedSubDataSources, {
		__mode = "v"
	} )
	LUI.ListDataSourceFromPlayerDataArray.super.init( f69_arg0, f69_arg0:length() )
end

LUI.ListDataSourceFromPlayerDataArray.GetDataSourceAtIndex = function ( f70_arg0, f70_arg1, f70_arg2 )
	return f70_arg0:GetDataSourceForField( f70_arg1 )
end

LUI.ListDataSourceFromPlayerDataArray.length = function ( f71_arg0 )
	return #f71_arg0._DDLState
end

LUI.ListDataSourceFromPlayerDataArray.ipairs = function ( f72_arg0 )
	local f72_local0, f72_local1, f72_local2 = ddlpairs( f72_arg0._DDLState )
	return function ( f73_arg0, f73_arg1 )
		local f73_local0, f73_local1 = f72_local0( f72_local1, f73_arg1 )
		if f73_local1 then
			return f73_local0, LUI.DataSourceFromPlayerData.new( f73_arg0._statsGroup, f73_local1 )
		else
			
		end
	end
	, f72_arg0, f72_local2
end

LUI.LazyDataSource = LUI.Class( LUI.DataSourceFromModel )
LUI.LazyDataSource.init = function ( f74_arg0, f74_arg1 )
	LUI.LazyDataSource.super.init( f74_arg0 )
	f74_arg0._lazyFunction = f74_arg1
	f74_arg0._lazyDataSource = false
	local f74_local0 = getmetatable( f74_arg0 )
	local f74_local1 = f74_local0.__index
	assert( type( f74_local1 ) == "table" )
	f74_local0.__index = function ( f75_arg0, f75_arg1 )
		if f74_local1[f75_arg1] ~= nil then
			return f74_local1[f75_arg1]
		else
			f74_arg0:SetupLazyDataSource()
			return f74_arg0._lazyDataSource[f75_arg1]
		end
	end
	
end

LUI.LazyDataSource.FindModel = function ( f76_arg0, f76_arg1 )
	f76_arg0:SetupLazyDataSource()
	return f76_arg0._lazyDataSource:GetModel( f76_arg1 )
end

LUI.LazyDataSource.CreateModel = function ( f77_arg0, f77_arg1 )
	assert( false, "Cannot create the model of a lazy data source." )
end

LUI.LazyDataSource.IsPerController = function ( f78_arg0 )
	f78_arg0:SetupLazyDataSource()
	return f78_arg0._lazyDataSource:IsPerController()
end

LUI.LazyDataSource.SetupLazyDataSource = function ( f79_arg0 )
	if not f79_arg0._lazyDataSource then
		f79_arg0._lazyDataSource = f79_arg0._lazyFunction()
	end
end

LUI.LazyDataSource.SetValue = function ( f80_arg0, f80_arg1, f80_arg2 )
	f80_arg0:SetupLazyDataSource()
	return f80_arg0._lazyDataSource:SetValue( f80_arg1, f80_arg2 )
end

LUI.LazyDataSource.Filter = function ( f81_arg0, f81_arg1, f81_arg2 )
	return LUI.LazyDataSource.new( function ()
		f81_arg0:SetupLazyDataSource()
		return f81_arg0._lazyDataSource:Filter( f81_arg1, f81_arg2 )
	end
	 )
end

LUI.LazyDataSource.FilterTo = function ( f83_arg0, f83_arg1, f83_arg2, f83_arg3 )
	return LUI.LazyDataSource.new( function ()
		f83_arg0:SetupLazyDataSource()
		return f83_arg0._lazyDataSource:FilterTo( f83_arg1, f83_arg2, f83_arg3 )
	end
	 )
end

LUI.LazyDataSource.ClearLazyDataSource = function ( f85_arg0 )
	f85_arg0._lazyDataSource = false
end

function WipeGlobalModelsAtPath( f86_arg0 )
	local f86_local0 = DataModel.GetModel( DataModel.GetGlobalModel(), f86_arg0 )
	if f86_local0 then
		DataModel.UnsubscribeAndFreeModel( f86_local0 )
	end
end

function WipeControllerModelsAtPath( f87_arg0 )
	for f87_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		local f87_local3 = DataModel.GetModel( DataModel.GetModelForController( f87_local0 ), f87_arg0 )
		if f87_local3 then
			DataModel.UnsubscribeAndFreeModel( f87_local3 )
		end
	end
end

function WipeAllModelsAtPath( f88_arg0 )
	WipeGlobalModelsAtPath( f88_arg0 )
	WipeControllerModelsAtPath( f88_arg0 )
end

function UpdateDataSourcesByMode( f89_arg0, f89_arg1 )
	if f89_arg0 == f89_arg1 then
		return 
	end
	local f89_local0 = {
		[CoD.PlayMode.SP] = {
			modelPath = "frontEnd.SP",
			initFunction = InitSPFrontEndDataSources
		},
		[CoD.PlayMode.Core] = {
			modelPath = "frontEnd.MP",
			initFunction = InitCoreMPFrontEndDataSources
		},
		[CoD.PlayMode.Aliens] = {
			modelPath = "frontEnd.CP",
			initFunction = InitCPFrontEndDataSources
		}
	}
	WipeGlobalCACDataTables()
	WipeZombiesDataTables()
	if Engine.InFrontend() then
		for f89_local4, f89_local5 in ipairs( f89_local0 ) do
			if f89_local4 == f89_arg0 then
				assert( f89_local5.initFunction )
				f89_local5.initFunction()
			else
				assert( f89_local5.modelPath )
				WipeAllModelsAtPath( f89_local5.modelPath )
			end
		end
	end
end

