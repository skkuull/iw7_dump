local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Frame )
	f1_arg0.Frame:SetBlendMode( BLEND_MODE.addWithAlpha )
end

function MissionTeamCursor( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "MissionTeamCursor"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local MissionTeamCursorAnimation = nil
	
	MissionTeamCursorAnimation = MenuBuilder.BuildRegisteredType( "MissionTeamCursorAnimation", {
		controllerIndex = f2_local1
	} )
	MissionTeamCursorAnimation.id = "MissionTeamCursorAnimation"
	MissionTeamCursorAnimation:SetZRotation( 45, 0 )
	MissionTeamCursorAnimation:SetScale( -0.4, 0 )
	MissionTeamCursorAnimation:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( MissionTeamCursorAnimation )
	self.MissionTeamCursorAnimation = MissionTeamCursorAnimation
	
	local Frame = nil
	
	Frame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 4,
		borderThicknessRight = _1080p * 4,
		borderThicknessTop = _1080p * 4,
		borderThicknessBottom = _1080p * 4
	} )
	Frame.id = "Frame"
	Frame:SetAlpha( 0.8, 0 )
	Frame:SetZRotation( 45, 0 )
	Frame:SetScale( -0.4, 0 )
	Frame:SetBorderThicknessLeft( _1080p * 4, 0 )
	Frame:SetBorderThicknessRight( _1080p * 4, 0 )
	Frame:SetBorderThicknessTop( _1080p * 4, 0 )
	Frame:SetBorderThicknessBottom( _1080p * 4, 0 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local BannerCap = nil
	
	BannerCap = LUI.UIImage.new()
	BannerCap.id = "BannerCap"
	BannerCap:SetZRotation( -90, 0 )
	BannerCap:setImage( RegisterMaterial( "wdg_slot_cut_out_1" ), 0 )
	BannerCap:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -43, _1080p * -23, _1080p * 23, _1080p * 43 )
	BannerCap:SubscribeToModelThroughElement( self, "color", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.color:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			BannerCap:SetRGBFromInt( f3_local0, 0 )
		end
	end )
	self:addElement( BannerCap )
	self.BannerCap = BannerCap
	
	local Banner = nil
	
	Banner = LUI.UIImage.new()
	Banner.id = "Banner"
	Banner:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -23, _1080p * 155, _1080p * 23, _1080p * 43 )
	Banner:SubscribeToModelThroughElement( self, "color", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.color:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			Banner:SetRGBFromInt( f4_local0, 0 )
		end
	end )
	self:addElement( Banner )
	self.Banner = Banner
	
	local Label = nil
	
	Label = LUI.UIStyledText.new()
	Label.id = "Label"
	Label:SetFontSize( 16 * _1080p )
	Label:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label:SetAlignment( LUI.Alignment.Center )
	Label:SetDecodeLetterLength( 25 )
	Label:SetDecodeMaxRandChars( 3 )
	Label:SetDecodeUpdatesPerLetter( 4 )
	Label:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 106.08, _1080p * 278.92, _1080p * 25, _1080p * 41 )
	Label:SubscribeToModelThroughElement( self, "name", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.name:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			Label:setText( ToUpperCase( f5_local0 ), 0 )
		end
	end )
	self:addElement( Label )
	self.Label = Label
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MissionTeamCursorAnimation:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.MissionTeamCursorAnimation:SetZRotation( 0, 50 )
				end,
				function ()
					return self.MissionTeamCursorAnimation:SetZRotation( 0, 150 )
				end,
				function ()
					return self.MissionTeamCursorAnimation:SetZRotation( 45, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MissionTeamCursorAnimation:SetScale( -0.6, 50 )
				end,
				function ()
					return self.MissionTeamCursorAnimation:SetScale( -0.6, 150 )
				end,
				function ()
					return self.MissionTeamCursorAnimation:SetScale( -0.4, 200, LUI.EASING.outBack )
				end
			}
		} )
		Frame:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.Frame:SetZRotation( 0, 50 )
				end,
				function ()
					return self.Frame:SetZRotation( 0, 150 )
				end,
				function ()
					return self.Frame:SetZRotation( 45, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Frame:SetScale( -0.6, 50 )
				end,
				function ()
					return self.Frame:SetScale( -0.6, 150 )
				end,
				function ()
					return self.Frame:SetScale( -0.4, 200, LUI.EASING.outBack )
				end
			}
		} )
		BannerCap:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.BannerCap:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BannerCap:SetAlpha( 0, 200 )
				end,
				function ()
					return self.BannerCap:SetAlpha( 1, 30 )
				end,
				function ()
					return self.BannerCap:SetAlpha( 0, 30 )
				end,
				function ()
					return self.BannerCap:SetAlpha( 1, 30 )
				end,
				function ()
					return self.BannerCap:SetAlpha( 0, 30 )
				end,
				function ()
					return self.BannerCap:SetAlpha( 1, 30 )
				end
			}
		} )
		Banner:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.Banner:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Banner:SetAlpha( 0, 340 )
				end,
				function ()
					return self.Banner:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.Banner:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -23, _1080p * -23, _1080p * 23, _1080p * 43, 349 )
				end,
				function ()
					return self.Banner:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -23, _1080p * 153, _1080p * 23, _1080p * 43, 99, LUI.EASING.inSine )
				end
			}
		} )
		Label:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.Label:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Label:SetAlpha( 0, 330 )
				end,
				function ()
					return self.Label:SetAlpha( 1, 10 )
				end
			}
		} )
		self._sequences.Update = function ()
			MissionTeamCursorAnimation:AnimateSequence( "Update" )
			Frame:AnimateSequence( "Update" )
			BannerCap:AnimateSequence( "Update" )
			Banner:AnimateSequence( "Update" )
			Label:AnimateSequence( "Update" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "MissionTeamCursor", MissionTeamCursor )
LockTable( _M )
