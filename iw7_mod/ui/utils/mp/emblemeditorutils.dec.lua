EmblemEditorUtils = {
	TabIDs = {
		CUSTOM = 0,
		DEFAULT = 1,
		COMMUNITY = 2,
		ARMOURY = 3,
		EXTRA = 4,
		MISSIONTEAM = 5
	},
	EmblemTypes = {
		EMBLEM_TYPE_LAYERED = 0,
		EMBLEM_TYPE_IMAGE = 1
	},
	EMBLEMS_INVALID_ICON_ID = -1,
	SelectedEmblem = -1,
	EmblemLayerBeingEdited = -1,
	ToolPanelOpen = false,
	EmblemCategory = -1,
	EmblemEditorCategories = {},
	MinPosition = -1,
	MaxPosition = 1,
	MinScale = -6,
	MaxScale = 6,
	IsEditingLayer = function ()
		return EmblemEditorUtils.EmblemLayerBeingEdited ~= -1
	end,
	IsToolPanelOpen = function ()
		return EmblemEditorUtils.ToolPanelOpen
	end,
	SetVisibleAndEnabled = function ( f3_arg0, f3_arg1 )
		local f3_local0
		if f3_arg1 then
			f3_local0 = 1
			if not f3_local0 then
			
			else
				f3_arg0:SetAlpha( f3_local0, 0 )
				f3_arg0:SetHandleMouseTree( f3_arg1 )
			end
		end
		f3_local0 = 0
	end,
	GetEmblemDataSources = function ( f4_arg0, f4_arg1, f4_arg2 )
		if f4_arg2.isShippable == "TRUE" then
			return {
				type = LUI.DataSourceInGlobalModel.new( f4_arg1 .. ".type", f4_arg2.type ),
				id = LUI.DataSourceInGlobalModel.new( f4_arg1 .. ".id", f4_arg2.id ),
				sortkey = LUI.DataSourceInGlobalModel.new( f4_arg1 .. ".sortkey", f4_arg2.sortkey ),
				texture = LUI.DataSourceInGlobalModel.new( f4_arg1 .. ".texture", f4_arg2.image ),
				description = LUI.DataSourceInGlobalModel.new( f4_arg1 .. ".description", f4_arg2.description ),
				cost = LUI.DataSourceInGlobalModel.new( f4_arg1 .. ".cost", f4_arg2.cost ),
				unlockLvl = LUI.DataSourceInGlobalModel.new( f4_arg1 .. ".unlockLvl", f4_arg2.unlockLvl ),
				unlockPLvl = LUI.DataSourceInGlobalModel.new( f4_arg1 .. ".unlockPLvl", f4_arg2.unlockPLvl ),
				unclassifyAt = LUI.DataSourceInGlobalModel.new( f4_arg1 .. ".unclassifyAt", f4_arg2.unclassifyAt ),
				category = LUI.DataSourceInGlobalModel.new( f4_arg1 .. ".category", f4_arg2.categoryA ),
				icontype = LUI.DataSourceInGlobalModel.new( f4_arg1 .. ".icontype", f4_arg2.icontype ),
				outlineSize = LUI.DataSourceInGlobalModel.new( f4_arg1 .. ".outlineSize", f4_arg2.outlineSize )
			}
		else
			return nil
		end
	end,
	SetupEmblemRendering = function ( f5_arg0, f5_arg1, f5_arg2 )
		local f5_local0 = f5_arg1.emblemType:GetValue( f5_arg2 )
		if f5_local0 == EmblemEditorUtils.EmblemTypes.EMBLEM_TYPE_LAYERED then
			f5_arg0:SetupEmblemThumbnail( f5_arg1.emblemIndex:GetValue( f5_arg2 ) )
		elseif f5_local0 == EmblemEditorUtils.EmblemTypes.EMBLEM_TYPE_IMAGE then
			f5_arg0:setImage( RegisterMaterial( f5_arg1.emblemImage:GetValue( f5_arg2 ) ), 0 )
			f5_arg0:setupUIImage()
		end
	end
}
