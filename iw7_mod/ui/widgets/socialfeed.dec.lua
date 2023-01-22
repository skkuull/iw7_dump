local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function SocialFeed( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 30 * _1080p )
	self.id = "SocialFeed"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if Engine.InFrontend() then
		f1_local3 = LUI.UIBlur.new()
		f1_local3.id = "Blur"
		f1_local3:SetRGBFromInt( 10066329, 0 )
		f1_local3:SetBlurStrength( 2.25, 0 )
		f1_local3:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -819, _1080p * 1, _1080p * -1 )
		self:addElement( f1_local3 )
		self.Blur = f1_local3
	end
	local f1_local4 = nil
	if Engine.InFrontend() then
		f1_local4 = LUI.UIBlur.new()
		f1_local4.id = "BlurNotch"
		f1_local4:SetRGBFromInt( 10066329, 0 )
		f1_local4:setImage( RegisterMaterial( "wdg_slot_cut_out_1" ), 0 )
		f1_local4:SetBlurStrength( 2.25, 0 )
		f1_local4:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -819, _1080p * -792, _1080p * 1, _1080p * -1 )
		self:addElement( f1_local4 )
		self.BlurNotch = f1_local4
	end
	local f1_local5 = nil
	if Engine.InFrontend() then
		f1_local5 = LUI.UIImage.new()
		f1_local5.id = "Notch"
		f1_local5:SetRGBFromInt( 0, 0 )
		f1_local5:SetZRotation( 180, 0 )
		f1_local5:setImage( RegisterMaterial( "wdg_slot_cut_out_1" ), 0 )
		f1_local5:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 1101, _1080p * 1130, _1080p * 1, 0 )
		self:addElement( f1_local5 )
		self.Notch = f1_local5
	end
	local f1_local6 = nil
	if Engine.InFrontend() then
		f1_local6 = LUI.UIImage.new()
		f1_local6.id = "NotchBody"
		f1_local6:SetRGBFromInt( 0, 0 )
		f1_local6:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -790, 0, _1080p * 1, 0 )
		self:addElement( f1_local6 )
		self.NotchBody = f1_local6
	end
	local Divider1 = nil
	
	Divider1 = LUI.UIBlur.new()
	Divider1.id = "Divider1"
	Divider1:SetBlurStrength( 2.75, 0 )
	Divider1:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * -819, _1080p * -1, 0 )
	self:addElement( Divider1 )
	self.Divider1 = Divider1
	
	local f1_local8 = nil
	if Engine.InFrontend() then
		f1_local8 = LUI.UIBlur.new()
		f1_local8.id = "Divider2"
		f1_local8:SetBlurStrength( 2.78, 0 )
		f1_local8:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1130, 0, 0, _1080p * 1 )
		self:addElement( f1_local8 )
		self.Divider2 = f1_local8
	end
	local f1_local9 = nil
	if Engine.InFrontend() then
		f1_local9 = LUI.UIBlur.new()
		f1_local9.id = "DividerDiagonal"
		f1_local9:setImage( RegisterMaterial( "wdg_helper_bar_diagonal" ), 0 )
		f1_local9:SetBlurStrength( 2.75, 0 )
		f1_local9:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 1100.5, _1080p * 1130, 0, 0 )
		self:addElement( f1_local9 )
		self.DividerDiagonal = f1_local9
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if Engine.InFrontend() then
			f1_local4:RegisterAnimationSequence( "OnlineMode", {
				{
					function ()
						return self.BlurNotch:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if Engine.InFrontend() then
			f1_local5:RegisterAnimationSequence( "OnlineMode", {
				{
					function ()
						return self.Notch:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if Engine.InFrontend() then
			f1_local6:RegisterAnimationSequence( "OnlineMode", {
				{
					function ()
						return self.NotchBody:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		Divider1:RegisterAnimationSequence( "OnlineMode", {
			{
				function ()
					return self.Divider1:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * -819, _1080p * -1, 0, 0 )
				end
			}
		} )
		if Engine.InFrontend() then
			f1_local8:RegisterAnimationSequence( "OnlineMode", {
				{
					function ()
						return self.Divider2:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if Engine.InFrontend() then
			f1_local9:RegisterAnimationSequence( "OnlineMode", {
				{
					function ()
						return self.DividerDiagonal:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.OnlineMode = function ()
			if Engine.InFrontend() then
				f1_local4:AnimateSequence( "OnlineMode" )
			end
			if Engine.InFrontend() then
				f1_local5:AnimateSequence( "OnlineMode" )
			end
			if Engine.InFrontend() then
				f1_local6:AnimateSequence( "OnlineMode" )
			end
			Divider1:AnimateSequence( "OnlineMode" )
			if Engine.InFrontend() then
				f1_local8:AnimateSequence( "OnlineMode" )
			end
			if Engine.InFrontend() then
				f1_local9:AnimateSequence( "OnlineMode" )
			end
		end
		
		if Engine.InFrontend() then
			f1_local3:RegisterAnimationSequence( "OfflineMode", {
				{
					function ()
						return self.Blur:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.InFrontend() then
			f1_local4:RegisterAnimationSequence( "OfflineMode", {
				{
					function ()
						return self.BlurNotch:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.InFrontend() then
			f1_local5:RegisterAnimationSequence( "OfflineMode", {
				{
					function ()
						return self.Notch:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if Engine.InFrontend() then
			f1_local6:RegisterAnimationSequence( "OfflineMode", {
				{
					function ()
						return self.NotchBody:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		Divider1:RegisterAnimationSequence( "OfflineMode", {
			{
				function ()
					return self.Divider1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Divider1:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * -819, _1080p * -1, 0, 0 )
				end
			}
		} )
		if Engine.InFrontend() then
			f1_local8:RegisterAnimationSequence( "OfflineMode", {
				{
					function ()
						return self.Divider2:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if Engine.InFrontend() then
			f1_local9:RegisterAnimationSequence( "OfflineMode", {
				{
					function ()
						return self.DividerDiagonal:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.OfflineMode = function ()
			if Engine.InFrontend() then
				f1_local3:AnimateSequence( "OfflineMode" )
			end
			if Engine.InFrontend() then
				f1_local4:AnimateSequence( "OfflineMode" )
			end
			if Engine.InFrontend() then
				f1_local5:AnimateSequence( "OfflineMode" )
			end
			if Engine.InFrontend() then
				f1_local6:AnimateSequence( "OfflineMode" )
			end
			Divider1:AnimateSequence( "OfflineMode" )
			if Engine.InFrontend() then
				f1_local8:AnimateSequence( "OfflineMode" )
			end
			if Engine.InFrontend() then
				f1_local9:AnimateSequence( "OfflineMode" )
			end
		end
		
		if Engine.InFrontend() then
			f1_local4:RegisterAnimationSequence( "CampaignMode", {
				{
					function ()
						return self.BlurNotch:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.InFrontend() then
			f1_local5:RegisterAnimationSequence( "CampaignMode", {
				{
					function ()
						return self.Notch:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.InFrontend() then
			f1_local6:RegisterAnimationSequence( "CampaignMode", {
				{
					function ()
						return self.NotchBody:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		Divider1:RegisterAnimationSequence( "CampaignMode", {
			{
				function ()
					return self.Divider1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Divider1:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -1, 0, 0 )
				end
			}
		} )
		if Engine.InFrontend() then
			f1_local8:RegisterAnimationSequence( "CampaignMode", {
				{
					function ()
						return self.Divider2:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.InFrontend() then
			f1_local9:RegisterAnimationSequence( "CampaignMode", {
				{
					function ()
						return self.DividerDiagonal:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.CampaignMode = function ()
			if Engine.InFrontend() then
				f1_local4:AnimateSequence( "CampaignMode" )
			end
			if Engine.InFrontend() then
				f1_local5:AnimateSequence( "CampaignMode" )
			end
			if Engine.InFrontend() then
				f1_local6:AnimateSequence( "CampaignMode" )
			end
			Divider1:AnimateSequence( "CampaignMode" )
			if Engine.InFrontend() then
				f1_local8:AnimateSequence( "CampaignMode" )
			end
			if Engine.InFrontend() then
				f1_local9:AnimateSequence( "CampaignMode" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsSingleplayer( self ) or not CONDITIONS.InFrontend( self ) then
		ACTIONS.AnimateSequence( self, "CampaignMode" )
	end
	if CONDITIONS.IsPublicMatch( self ) and CONDITIONS.InFrontend( self ) then
		ACTIONS.AnimateSequence( self, "OnlineMode" )
	end
	if not CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequence( self, "OfflineMode" )
	end
	return self
end

MenuBuilder.registerType( "SocialFeed", SocialFeed )
LockTable( _M )
