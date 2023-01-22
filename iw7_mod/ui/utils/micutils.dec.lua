Mic = {
	states = {
		noMic = 0,
		micOn = 1,
		micTalking = 2,
		micMuted = 3
	},
	icons = {
		"specialty_ks_null",
		"icon_mic_on",
		"icon_mic_talking",
		"icon_mic_muted"
	},
	GetIcon = function ( f1_arg0 )
		return Mic.icons[f1_arg0 + 1]
	end,
	GetIconAlpha = function ( f2_arg0 )
		local f2_local0
		if f2_arg0 ~= Mic.states.noMic then
			f2_local0 = 1
			if not f2_local0 then
			
			else
				return f2_local0
			end
		end
		f2_local0 = 0
	end
}
