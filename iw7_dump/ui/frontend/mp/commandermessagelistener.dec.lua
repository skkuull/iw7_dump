local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addEventHandler( "show_commander_message", function ( f2_arg0, f2_arg1 )
		assert( f2_arg1.eventID, "No eventID provided for event \"show_commander_message\" " )
		local f2_local0 = f2_arg1.eventID
		local f2_local1 = CSV.commanderMessage
		local f2_local2 = Engine.TableLookupGetRowNum( f2_local1.file, f2_local1.cols.eventID, f2_local0 )
		local f2_local3 = f2_arg1.teamOverride and f2_arg1.teamOverride or MissionDirector.GetActiveMissionTeam( f1_arg1 )
		assert( f2_local2 ~= -1, "Unable to find eventID \"" .. f2_local0 .. "\" in " .. f2_local1.file )
		if f2_local2 ~= -1 then
			local f2_local4 = {
				factionID = f2_local3,
				useCommanderImage = Engine.TableLookupByRow( f2_local1.file, f2_local2, f2_local1.cols.useCommanderImage ),
				aliasBase = Engine.TableLookupByRow( f2_local1.file, f2_local2, f2_local1.cols.aliasBase ),
				sequenceLength = Engine.TableLookupByRow( f2_local1.file, f2_local2, f2_local1.cols.sequenceLength ),
				priority = Engine.TableLookupByRow( f2_local1.file, f2_local2, f2_local1.cols.priority ),
				controllerIndex = f1_arg1
			}
			if f1_arg0.CommanderMessage == nil then
				local f2_local5 = nil
				f2_local5 = MenuBuilder.BuildRegisteredType( "CommanderMessage", {
					controllerIndex = f1_arg1
				} )
				f1_arg0:addElement( f2_local5 )
				f1_arg0.CommanderMessage = f2_local5
			end
			f1_arg0.CommanderMessage:CreateMessage( f2_local4 )
		end
		return 0
	end )
end

function CommanderMessageListener( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 460 * _1080p, 0, 140 * _1080p )
	self.id = "CommanderMessageListener"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CommanderMessageListener", CommanderMessageListener )
LockTable( _M )
