local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LobbyStatus( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg1 and f1_arg1.controllerIndex
	assert( f1_local0 )
	local f1_local1 = LUI.Alignment.Left
	local f1_local2 = 26 * _1080p
	local f1_local3 = 3 * _1080p
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		height = 34 * _1080p,
		left = 0,
		width = 400 * _1080p
	} )
	self.id = "LobbyStatus"
	
	local bg = LUI.UIImage.new( {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	bg:SetRGBFromInt( 0 )
	bg:SetAlpha( 0.6 )
	bg.id = "bg"
	self:addElement( bg )
	self.bg = bg
	
	local f1_local6 = LUI.UIElement.new()
	f1_local6.id = "stencil"
	f1_local6:setUseStencil( true )
	self:addElement( f1_local6 )
	self.Minimize = function ( f2_arg0 )
		if f2_arg0.bg then
			f2_arg0.bg:close()
			f2_arg0.bg = nil
		end
	end
	
	self.UpdateMessage = function ( f3_arg0 )
		local f3_local0, f3_local1, f3_local2 = Lobby.GetStatusString( f1_local0 )
		if f3_local0 == f3_arg0._lastText then
			return 
		end
		f3_arg0._lastText = f3_local0
		local f3_local3 = f3_arg0._lastState == f3_local2
		f3_arg0._lastState = f3_local2
		local self = nil
		local f3_local5 = f3_arg0._currentMessage ~= nil
		if f3_local5 then
			local f3_local6 = f3_arg0._currentMessage
			if not f3_local3 then
				f3_local6:SetTop( f1_local3 - 20, 200, LUI.EASING.inQuadratic )
				local f3_local7 = f3_local6:SetBottom( f1_local3 - 20 + f1_local2, 200, LUI.EASING.inQuadratic )
				f3_local7.onComplete = function ()
					f3_local6:close()
				end
				
				f3_arg0._currentMessage = nil
				f3_local6.isDying = true
			else
				self = f3_local6
			end
		end
		if not self then
			self = LUI.UIText.new( {
				alignment = f1_local1,
				font = FONTS.GetFont( FONTS.MainMedium.File ),
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = true,
				left = 15 * _1080p,
				top = f1_local3,
				right = 0,
				height = f1_local2
			} )
			f3_arg0._currentMessage = self
			self:SetWordWrap( false )
			self:SetOptOutRightToLeftAlignmentFlip( true )
			self.id = "newMessage"
			f1_local6:addElement( self )
		end
		if f3_local5 and not f3_local3 then
			self:SetTop( f1_local3 + 20 )
			self:SetBottom( f1_local3 + 20 + f1_local2 )
			local f3_local6 = self:Wait( 100 )
			f3_local6.onComplete = function ()
				if not self.isDying then
					self:SetTop( f1_local3, 200, LUI.EASING.inOutQuadratic )
					self:SetBottom( f1_local3 + f1_local2, 200, LUI.EASING.inOutQuadratic )
				end
			end
			
		end
		if f3_local1 then
			local f3_local6 = f3_local0 .. "..."
			local f3_local7 = {
				f3_local0 .. "",
				f3_local0 .. "",
				f3_local0 .. ".",
				f3_local0 .. "..",
				f3_local6,
				f3_local6,
				f3_local6
			}
			local f3_local8 = nil
			local f3_local9 = 1
			local f3_local10 = function ()
				self:setText( f3_local7[f3_local9] )
				local f6_local0 = self:Wait( 200 )
				f6_local0.onComplete = f3_local8
				f3_local9 = 1 + f3_local9 % #f3_local7
			end
			
			f3_local10()
		else
			self:setText( f3_local0 )
		end
	end
	
	local f1_local7 = LUI.UITimer.new( nil, {
		interval = 100,
		event = "update_lobby_status"
	} )
	f1_local7.id = "lobbyStatusTimer"
	self:addElement( f1_local7 )
	self:registerEventHandler( "update_lobby_status", function ( element, event )
		element:UpdateMessage()
	end )
	self:UpdateMessage()
	return self
end

MenuBuilder.registerType( "LobbyStatus", LobbyStatus )
LockTable( _M )
