Rank = {
	GetRankCSV = function ()
		if Engine.IsAliensMode() then
			return CSV.CPRank
		else
			return CSV.MPRank
		end
	end,
	GetRankIconCSV = function ()
		if Engine.IsAliensMode() then
			return CSV.CPRankIcons
		else
			return CSV.MPRankIcons
		end
	end,
	GetRankBigIconCSV = function ()
		if Engine.IsAliensMode() then
			return CSV.CPRankIcons
		else
			return CSV.MPRankBigIcons
		end
	end,
	GetMaxRank = function ()
		local f4_local0 = Rank.GetRankCSV()
		return tonumber( Engine.TableLookup( f4_local0.file, 0, "maxrank", 1 ) )
	end,
	GetRankDisplay = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		local f5_local0 = Rank.GetRankCSV()
		local f5_local1 = Engine.TableLookup( f5_local0.file, f5_local0.cols.index, f5_arg0, f5_local0.cols.displayLevel )
		if f5_arg2 and Rank.IsMasterPrestige( f5_arg1 ) then
			if f5_arg3 then
				f5_local1 = f5_arg1
			else
				f5_local1 = Engine.Localize( "LUA_MENU_MP_MASTER_PRESTIGE", f5_arg1 )
			end
		end
		return f5_local1
	end,
	GetRankFromRankDisplay = function ( f6_arg0 )
		local f6_local0 = Rank.GetRankCSV()
		return Engine.TableLookup( f6_local0.file, f6_local0.cols.displayLevel, f6_arg0, f6_local0.cols.index )
	end,
	GetShortRank = function ( f7_arg0 )
		local f7_local0 = Rank.GetRankCSV()
		return Engine.TableLookup( f7_local0.file, f7_local0.cols.index, f7_arg0, f7_local0.cols.shortRank )
	end,
	GetRankMinXP = function ( f8_arg0 )
		local f8_local0 = Rank.GetRankCSV()
		return tonumber( Engine.TableLookup( f8_local0.file, f8_local0.cols.index, f8_arg0, f8_local0.cols.minXP ) )
	end,
	GetRankMaxXP = function ( f9_arg0 )
		local f9_local0 = Rank.GetRankCSV()
		return tonumber( Engine.TableLookup( f9_local0.file, f9_local0.cols.index, f9_arg0, f9_local0.cols.maxXP ) )
	end,
	GetRankXPToNext = function ( f10_arg0 )
		local f10_local0 = Rank.GetRankCSV()
		return tonumber( Engine.TableLookup( f10_local0.file, f10_local0.cols.index, f10_arg0, f10_local0.cols.XPToNext ) )
	end,
	GetRankIcon = function ( f11_arg0, f11_arg1 )
		local f11_local0 = Rank.GetRankIconCSV()
		return Engine.TableLookup( f11_local0.file, f11_local0.cols.index, f11_arg0, f11_local0.cols.standard + f11_arg1 )
	end,
	GetFullRank = function ( f12_arg0 )
		local f12_local0 = Rank.GetRankIconCSV()
		return Engine.Localize( Engine.TableLookup( f12_local0.file, f12_local0.cols.index, f12_arg0, f12_local0.cols.fullyRank ) )
	end,
	RankIconFilter = function ( f13_arg0 )
		return function ( f14_arg0 )
			return Rank.GetRankIcon( f13_arg0.rank:GetValue( f14_arg0 ), f13_arg0.prestige:GetValue( f14_arg0 ) )
		end
		
	end,
	GetRankBigIcon = function ( f15_arg0, f15_arg1 )
		local f15_local0 = Rank.GetRankBigIconCSV()
		return Engine.TableLookup( f15_local0.file, f15_local0.cols.index, f15_arg0, f15_local0.cols.standard + f15_arg1 )
	end,
	RankBigIconFilter = function ( f16_arg0 )
		return function ( f17_arg0 )
			return Rank.GetRankBigIcon( f16_arg0.rank:GetValue( f17_arg0 ), f16_arg0.prestige:GetValue( f17_arg0 ) )
		end
		
	end,
	RankDisplayFilter = function ( f18_arg0, f18_arg1 )
		return Rank.GetRankDisplay( tostring( f18_arg0 ) )
	end,
	IsMasterPrestige = function ( f19_arg0 )
		if not Engine.IsCoreMode() then
			return false
		else
			assert( f19_arg0 )
			return tonumber( f19_arg0 ) >= 11
		end
	end,
	MakeRankIconAggregateFunction = function ( f20_arg0, f20_arg1 )
		assert( f20_arg0 )
		assert( f20_arg1 )
		return function ( f21_arg0 )
			local f21_local0 = f20_arg0:GetValue( f21_arg0 )
			local f21_local1 = f20_arg1:GetValue( f21_arg0 )
			if f21_local0 and f21_local1 then
				local f21_local2 = Rank.GetRankIcon( tostring( f21_local0 ), f21_local1 )
				assert( f21_local2 )
				return f21_local2
			else
				
			end
		end
		
	end,
	MakeRankDisplayAggregateFunction = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		return function ( f23_arg0 )
			local f23_local0 = f22_arg0:GetValue( f23_arg0 )
			local f23_local1 = f22_arg1:GetValue( f23_arg0 )
			if f23_local0 and f23_local1 then
				return Rank.GetRankDisplay( tostring( f23_local0 ), f23_local1, f22_arg2, f22_arg3 )
			else
				
			end
		end
		
	end,
	RankPercentageFilter = function ( f24_arg0, f24_arg1 )
		assert( f24_arg0 )
		local f24_local0 = Engine.GetRankForXP( f24_arg0 )
		local f24_local1 = Rank.GetRankMinXP( f24_local0 )
		local f24_local2 = Rank.GetRankMaxXP( f24_local0 )
		local f24_local3 = 0
		if f24_local2 - f24_local1 ~= 0 then
			f24_local3 = (f24_arg0 - f24_local1) / (f24_local2 - f24_local1)
		end
		return f24_local3
	end,
	RankXPRequiredFilter = function ( f25_arg0, f25_arg1 )
		assert( f25_arg0 )
		local f25_local0 = Rank.GetRankMaxXP( Engine.GetRankForXP( f25_arg0 ) )
		local f25_local1 = 0
		if f25_local0 - f25_arg0 > 0 then
			f25_local1 = f25_local0 - f25_arg0
		end
		return f25_local1
	end
}
