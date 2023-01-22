local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function TalkerWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "TalkerWidget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local IsTalkingIcon = nil
	
	IsTalkingIcon = LUI.UIImage.new()
	IsTalkingIcon.id = "IsTalkingIcon"
	IsTalkingIcon:setImage( RegisterMaterial( "voice_on" ), 0 )
	IsTalkingIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 31, 0, 0, _1080p * 30 )
	self:addElement( IsTalkingIcon )
	self.IsTalkingIcon = IsTalkingIcon
	
	local TalkerName = nil
	
	TalkerName = LUI.UIText.new()
	TalkerName.id = "TalkerName"
	TalkerName:SetFontSize( 30 * _1080p )
	TalkerName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TalkerName:SetAlignment( LUI.Alignment.Left )
	TalkerName:SetOptOutRightToLeftAlignmentFlip( true )
	TalkerName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30.99, _1080p * 500, 0, _1080p * 30 )
	TalkerName:SubscribeToModelThroughElement( self, "name", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.name:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			TalkerName:setText( f2_local0, 0 )
		end
	end )
	self:addElement( TalkerName )
	self.TalkerName = TalkerName
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		IsTalkingIcon:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.IsTalkingIcon:SetAlpha( 1, 0 )
				end,
				function ()
					return self.IsTalkingIcon:SetAlpha( 0, 250 )
				end
			}
		} )
		TalkerName:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.TalkerName:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TalkerName:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.FadeOut = function ()
			IsTalkingIcon:AnimateSequence( "FadeOut" )
			TalkerName:AnimateSequence( "FadeOut" )
		end
		
		IsTalkingIcon:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.IsTalkingIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.IsTalkingIcon:SetAlpha( 1, 200 )
				end
			}
		} )
		TalkerName:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.TalkerName:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TalkerName:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.FadeIn = function ()
			IsTalkingIcon:AnimateSequence( "FadeIn" )
			TalkerName:AnimateSequence( "FadeIn" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "isVisible", function ()
		local f15_local0 = self:GetDataSource()
		if f15_local0.isVisible:GetValue( f1_local1 ) ~= nil then
			f15_local0 = self:GetDataSource()
			if f15_local0.isVisible:GetValue( f1_local1 ) == false then
				ACTIONS.AnimateSequence( self, "FadeOut" )
			end
		end
		f15_local0 = self:GetDataSource()
		if f15_local0.isVisible:GetValue( f1_local1 ) ~= nil then
			f15_local0 = self:GetDataSource()
			if f15_local0.isVisible:GetValue( f1_local1 ) == true then
				ACTIONS.AnimateSequence( self, "FadeIn" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "TalkerWidget", TalkerWidget )
LockTable( _M )
