local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "inGame.mp.CodcasterKeyboardShortcuts"
f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = {}
	local f1_local1 = LUI.DataSourceFromList.new( Engine.TableGetRowCount( CSV.codcasterKeyboardShortcuts.file ) )
	f1_local1:SetCachingEnabled( true )
	f1_local1.MakeDataSourceAtIndex = function ( f2_arg0, f2_arg1, f2_arg2 )
		local f2_local0 = Engine.TableLookupByRow( CSV.codcasterKeyboardShortcuts.file, f2_arg1, CSV.codcasterKeyboardShortcuts.cols.keyString )
		local f2_local1 = Engine.TableLookupByRow( CSV.codcasterKeyboardShortcuts.file, f2_arg1, CSV.codcasterKeyboardShortcuts.cols.keyText )
		local f2_local2 = f0_local0 .. ".item." .. f2_arg1
		return {
			index = LUI.DataSourceInGlobalModel.new( f2_local2 .. ".index", f2_arg1 ),
			keyString = LUI.DataSourceInGlobalModel.new( f2_local2 .. ".keyString", Engine.Localize( f2_local0 ) ),
			keyText = LUI.DataSourceInGlobalModel.new( f2_local2 .. ".keyText", Engine.Localize( f2_local1 ) )
		}
	end
	
	f1_arg0.KeyboardShortcuts:SetGridDataSource( f1_local1, f1_arg1 )
end

function CodcasterKeyboardShortcuts( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1300 * _1080p, 0, 690 * _1080p )
	self.id = "CodcasterKeyboardShortcuts"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local KeyboardShortcuts = nil
	
	KeyboardShortcuts = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 3,
		maxVisibleRows = 8,
		controllerIndex = f3_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CodcasterKeyboardShortcut", {
				controllerIndex = f3_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 16,
		spacingY = _1080p * 16,
		columnWidth = _1080p * 400,
		rowHeight = _1080p * 65,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	KeyboardShortcuts.id = "KeyboardShortcuts"
	KeyboardShortcuts:setUseStencil( true )
	KeyboardShortcuts:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -633, _1080p * 630, _1080p * -316, _1080p * 325 )
	self:addElement( KeyboardShortcuts )
	self.KeyboardShortcuts = KeyboardShortcuts
	
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CodcasterKeyboardShortcuts", CodcasterKeyboardShortcuts )
LockTable( _M )
