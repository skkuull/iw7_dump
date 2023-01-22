local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ()
	local self = LUI.UIText.new( CoD.ColorizeState( SWATCHES.text.buildNumber, {
		alignment = LUI.Alignment.RIGHT,
		font = FONTS.GetFont( FONTS.MainMedium.File ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		bottom = 0,
		right = 0,
		height = 16 * _1080p,
		alpha = 0
	} ) )
	self.id = "buildNumberText"
	self:setText( Engine.GetBuildNumber() )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	return self
end

MenuBuilder.registerType( "MatchID", function ()
	local self = LUI.UIText.new( {
		alignment = LUI.Alignment.LEFT,
		font = FONTS.GetFont( FONTS.MainMedium.File ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 5,
		bottom = -5,
		right = 0,
		height = 16 * _1080p,
		alpha = 0.4
	} )
	self.id = "MatchID"
	local f2_local1 = LUI.DataSourceInGlobalModel.new( "cg.inGame.matchid" )
	self:SubscribeToModel( f2_local1:GetModel( 0 ), function ( f3_arg0 )
		local f3_local0 = DataModel.GetModelValue( f3_arg0 )
		if not f3_local0 then
			return 
		end
		local f3_local1 = nil
		if IsPrivateMatch() then
			f3_local1 = {
				"0",
				"2",
				"4",
				"8"
			}
		elseif Engine.GetDvarBool( "dedicated_dhclient" ) then
			f3_local1 = {
				"1",
				"3",
				"7"
			}
		else
			f3_local1 = {
				"5",
				"9"
			}
		end
		self:setText( f3_local0 .. f3_local1[math.random( #f3_local1 )] )
	end )
	return self
end )
MenuBuilder.registerType( "BuildNumberText", f0_local0 )
LockTable( _M )
