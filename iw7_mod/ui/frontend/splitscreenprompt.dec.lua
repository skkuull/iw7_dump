local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function SplitscreenPrompt( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 40 * _1080p )
	self.id = "SplitscreenPrompt"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local PromptText = nil
	
	PromptText = LUI.UIText.new()
	PromptText.id = "PromptText"
	PromptText:SetFontSize( 22 * _1080p )
	PromptText:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	PromptText:SetAlignment( LUI.Alignment.Left )
	PromptText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10.5, _1080p * 491, _1080p * 9, _1080p * 31 )
	PromptText:SubscribeToModel( DataSources.frontEnd.lobby.splitscreenPromptText:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.frontEnd.lobby.splitscreenPromptText:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			PromptText:setText( f2_local0, 0 )
		end
	end )
	self:addElement( PromptText )
	self.PromptText = PromptText
	
	return self
end

MenuBuilder.registerType( "SplitscreenPrompt", SplitscreenPrompt )
LockTable( _M )
