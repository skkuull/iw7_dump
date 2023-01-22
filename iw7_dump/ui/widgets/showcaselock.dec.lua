local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ShowcaseLock( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "ShowcaseLock"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ShowcaseLock = nil
	
	ShowcaseLock = LUI.UIImage.new()
	ShowcaseLock.id = "ShowcaseLock"
	ShowcaseLock:SetDotPitchEnabled( true )
	ShowcaseLock:SetDotPitchX( 0, 0 )
	ShowcaseLock:SetDotPitchY( 0, 0 )
	ShowcaseLock:SetDotPitchContrast( 0, 0 )
	ShowcaseLock:SetDotPitchMode( 0 )
	ShowcaseLock:setImage( RegisterMaterial( "icon_showcase_locked" ), 0 )
	ShowcaseLock:SetBlendMode( BLEND_MODE.blend )
	ShowcaseLock:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, 0, _1080p * 512 )
	self:addElement( ShowcaseLock )
	self.ShowcaseLock = ShowcaseLock
	
	local f1_local4 = nil
	if Engine.IsAliensMode() then
		f1_local4 = LUI.UIImage.new()
		f1_local4.id = "CPLock"
		f1_local4:SetScale( 0.75, 0 )
		f1_local4:setImage( RegisterMaterial( "cp_wepbuild_lock" ), 0 )
		f1_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 240, _1080p * 272, _1080p * 240, _1080p * 272 )
		self:addElement( f1_local4 )
		self.CPLock = f1_local4
	end
	self._animationSets.DefaultAnimationSet = function ()
		if Engine.IsAliensMode() then
			f1_local4:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.CPLock:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.DefaultSequence = function ()
			if Engine.IsAliensMode() then
				f1_local4:AnimateSequence( "DefaultSequence" )
			end
		end
		
		ShowcaseLock:RegisterAnimationSequence( "HideCriteria", {
			{
				function ()
					return self.ShowcaseLock:SetAlpha( 0, 0 )
				end
			}
		} )
		if Engine.IsAliensMode() then
			f1_local4:RegisterAnimationSequence( "HideCriteria", {
				{
					function ()
						return self.CPLock:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideCriteria = function ()
			ShowcaseLock:AnimateSequence( "HideCriteria" )
			if Engine.IsAliensMode() then
				f1_local4:AnimateSequence( "HideCriteria" )
			end
		end
		
		ShowcaseLock:RegisterAnimationSequence( "ShowCriteria", {
			{
				function ()
					return self.ShowcaseLock:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ShowcaseLock:SetScale( 0, 0 )
				end,
				function ()
					return self.ShowcaseLock:SetScale( 0.1, 100 )
				end,
				function ()
					return self.ShowcaseLock:SetScale( 0, 100 )
				end
			}
		} )
		if Engine.IsAliensMode() then
			f1_local4:RegisterAnimationSequence( "ShowCriteria", {
				{
					function ()
						return self.CPLock:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.ShowCriteria = function ()
			ShowcaseLock:AnimateSequence( "ShowCriteria" )
			if Engine.IsAliensMode() then
				f1_local4:AnimateSequence( "ShowCriteria" )
			end
		end
		
		ShowcaseLock:RegisterAnimationSequence( "zombieResize", {
			{
				function ()
					return self.ShowcaseLock:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -197, _1080p * 197, _1080p * 59, _1080p * 453, 0 )
				end
			}
		} )
		self._sequences.zombieResize = function ()
			ShowcaseLock:AnimateSequence( "zombieResize" )
		end
		
	end
	
	self._animationSets.CP = function ()
		ShowcaseLock:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ShowcaseLock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			ShowcaseLock:AnimateSequence( "DefaultSequence" )
		end
		
		ShowcaseLock:RegisterAnimationSequence( "HideCriteria", {
			{
				function ()
					return self.ShowcaseLock:SetAlpha( 0, 0 )
				end
			}
		} )
		if Engine.IsAliensMode() then
			f1_local4:RegisterAnimationSequence( "HideCriteria", {
				{
					function ()
						return self.CPLock:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideCriteria = function ()
			ShowcaseLock:AnimateSequence( "HideCriteria" )
			if Engine.IsAliensMode() then
				f1_local4:AnimateSequence( "HideCriteria" )
			end
		end
		
		ShowcaseLock:RegisterAnimationSequence( "ShowCriteria", {
			{
				function ()
					return self.ShowcaseLock:SetAlpha( 0, 0 )
				end
			}
		} )
		if Engine.IsAliensMode() then
			f1_local4:RegisterAnimationSequence( "ShowCriteria", {
				{
					function ()
						return self.CPLock:SetAlpha( 0.7, 0 )
					end
				},
				{
					function ()
						return self.CPLock:SetScale( 2.5, 0 )
					end,
					function ()
						return self.CPLock:SetScale( 3.25, 100 )
					end,
					function ()
						return self.CPLock:SetScale( 2.5, 100 )
					end
				}
			} )
		end
		self._sequences.ShowCriteria = function ()
			ShowcaseLock:AnimateSequence( "ShowCriteria" )
			if Engine.IsAliensMode() then
				f1_local4:AnimateSequence( "ShowCriteria" )
			end
		end
		
		ShowcaseLock:RegisterAnimationSequence( "zombieResize", {
			{
				function ()
					return self.ShowcaseLock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.zombieResize = function ()
			ShowcaseLock:AnimateSequence( "zombieResize" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f30_local0 = self:GetDataSource()
		if f30_local0.isUnlocked:GetValue( f1_local1 ) ~= nil then
			f30_local0 = self:GetDataSource()
			if f30_local0.isUnlocked:GetValue( f1_local1 ) == true and not CONDITIONS.IsSingleplayer( self ) then
				ACTIONS.AnimateSequence( self, "HideCriteria" )
			end
		end
		f30_local0 = self:GetDataSource()
		if f30_local0.isUnlocked:GetValue( f1_local1 ) ~= nil then
			f30_local0 = self:GetDataSource()
			if f30_local0.isUnlocked:GetValue( f1_local1 ) == false and not CONDITIONS.IsSingleplayer( self ) then
				ACTIONS.AnimateSequence( self, "ShowCriteria" )
			end
		end
		if CONDITIONS.IsSingleplayer( self ) then
			f30_local0 = self:GetDataSource()
			if f30_local0.isUnlocked:GetValue( f1_local1 ) ~= nil then
				f30_local0 = self:GetDataSource()
				if f30_local0.isUnlocked:GetValue( f1_local1 ) ~= true then
				
				else
					ACTIONS.AnimateSequence( self, "HideCriteria" )
				end
			end
			f30_local0 = self:GetDataSource()
			if f30_local0.isScanned:GetValue( f1_local1 ) ~= nil then
				f30_local0 = self:GetDataSource()
				if f30_local0.isScanned:GetValue( f1_local1 ) == true then
					ACTIONS.AnimateSequence( self, "HideCriteria" )
				end
			end
		end
		if CONDITIONS.IsSingleplayer( self ) then
			f30_local0 = self:GetDataSource()
			if f30_local0.isUnlocked:GetValue( f1_local1 ) ~= nil then
				f30_local0 = self:GetDataSource()
				if f30_local0.isUnlocked:GetValue( f1_local1 ) == false then
					f30_local0 = self:GetDataSource()
					if f30_local0.isScanned:GetValue( f1_local1 ) ~= nil then
						f30_local0 = self:GetDataSource()
						if f30_local0.isScanned:GetValue( f1_local1 ) == false then
							ACTIONS.AnimateSequence( self, "ShowCriteria" )
						end
					end
				end
			end
		end
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsThirdGameMode( self ) then
		ACTIONS.SetAnimationSet( self, "CP" )
	end
	return self
end

MenuBuilder.registerType( "ShowcaseLock", ShowcaseLock )
LockTable( _M )
