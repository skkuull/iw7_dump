CODTV = CODTV or {}
CODTV.VIDEO_STATUS = {
	OFF = 0,
	LOADING = 1,
	PLAYING = 2,
	ERROR = 3,
	FINISHED = 4
}
CODTV.VIDEO_TYPE = {
	STREAM = 0,
	VOD = 1
}
CODTV.IsCODTVEnabled = function ()
	local f1_local0 = Engine.IsConsoleGame()
	if f1_local0 then
		f1_local0 = Engine.GetDvarBool( "lui_MLGStream_enabled" )
		if f1_local0 then
			f1_local0 = Engine.GetDvarBool( "mlg_enable" )
		end
	end
	return f1_local0
end

