PlayercardUtils = PlayercardUtils or {}
PlayercardUtils.GetFrontendDataSources = function ( f1_arg0, f1_arg1 )
	assert( f1_arg0 )
	assert( f1_arg1 )
	local f1_local0 = LUI.DataSourceInControllerModel.new( f1_arg0 .. ".fullName" )
	local f1_local1 = LUI.DataSourceInControllerModel.new( f1_arg0 .. ".prestige" )
	local f1_local2 = LUI.DataSourceInControllerModel.new( f1_arg0 .. ".rank" )
	local f1_local3 = LUI.AggregateDataSource.new( f1_local2, {
		f1_local2,
		f1_local1
	}, "rankIcon", Rank.MakeRankIconAggregateFunction( f1_local2, f1_local1 ) )
	local f1_local4 = LUI.AggregateDataSource.new( f1_local2, {
		f1_local2,
		f1_local1
	}, "display", Rank.MakeRankDisplayAggregateFunction( f1_local2, f1_local1, true ) )
	local f1_local5 = f1_local1:Filter( "isMasterPrestige", Rank.IsMasterPrestige )
	local f1_local6 = LUI.DataSourceInControllerModel.new( f1_arg0 .. ".customEmblemEquipped" )
	local f1_local7 = LUI.FilteredDataSource.new( LUI.DataSourceInControllerModel.new( f1_arg0 .. ".emblemIndex" ), "emblem", function ( f2_arg0, f2_arg1 )
		return Engine.TableLookup( PatchesTable.File, PatchesTable.Cols.Ref, f2_arg0, PatchesTable.Cols.Image )
	end )
	local f1_local8 = LUI.DataSourceInControllerModel.new( f1_arg0 .. ".backgroundIndex" )
	local f1_local9 = f1_local8:Filter( "background", CallingCardUtils.GetCardTexture )
	local f1_local10 = Engine.GetLocalClientXUIDString( f1_arg1 )
	local f1_local11 = LUI.DataSourceInControllerModel.new( f1_arg0 .. ".xuid", f1_local10 )
	f1_local11:SetValue( f1_arg1, f1_local10 )
	return {
		xuid = f1_local11,
		fullName = f1_local0,
		displayRank = f1_local4,
		rankIcon = f1_local3,
		rank = f1_local2,
		isMasterPrestige = f1_local5,
		emblem = f1_local7,
		customEmblemEquipped = f1_local6,
		prestige = f1_local1,
		background = f1_local9
	}
end

