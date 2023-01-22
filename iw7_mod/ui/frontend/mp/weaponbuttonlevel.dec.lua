local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, nil, function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			local f2_local1 = Cac.GetWeaponLevelData( f2_local0, f1_arg1 )
			local f2_local2 = f2_local1.currentLevel
			if f2_local1.maxLevel == 0 then
				ACTIONS.AnimateSequence( f1_arg0, "Hide" )
			elseif f2_local1.maxLevel + 1 < f2_local2 then
				f1_arg0.Level:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_WEAPON_LEVEL_BUTTON_BREAK", "LUA_MENU_MAX" ) ), 0 )
				ACTIONS.AnimateSequence( f1_arg0, "MaxLevel" )
				ACTIONS.AnimateSequence( f1_arg0, "ShowMaxLevel" )
			else
				f1_arg0.Level:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_WEAPON_LEVEL_BUTTON_BREAK", f2_local2 ) ), 0 )
				ACTIONS.AnimateSequence( f1_arg0, "NormalLevel" )
				ACTIONS.AnimateSequence( f1_arg0, "Show" )
			end
		end
	end )
end

function WeaponButtonLevel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 42 * _1080p, 0, 34 * _1080p )
	self.id = "WeaponButtonLevel"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local f3_local3 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f3_local3 = LUI.UIImage.new()
		f3_local3.id = "LevelBacker"
		f3_local3:SetRGBFromInt( 8421504, 0 )
		f3_local3:SetAlpha( 0.2, 0 )
		f3_local3:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 2, 0, 0, 0 )
		self:addElement( f3_local3 )
		self.LevelBacker = f3_local3
	end
	local f3_local4 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f3_local4 = LUI.UIImage.new()
		f3_local4.id = "LevelCap"
		f3_local4:SetRGBFromInt( 8421504, 0 )
		f3_local4:SetAlpha( 0.2, 0 )
		f3_local4:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -4, 0, 0, 0 )
		self:addElement( f3_local4 )
		self.LevelCap = f3_local4
	end
	local Level = nil
	
	Level = LUI.UIText.new()
	Level.id = "Level"
	Level:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_WEAPON_LEVEL_BUTTON_BREAK" ) ), 0 )
	Level:SetFontSize( 14 * _1080p )
	Level:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Level:SetAlignment( LUI.Alignment.Center )
	Level:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -40, _1080p * -1.25, _1080p * 3, _1080p * 17 )
	self:addElement( Level )
	self.Level = Level
	
	self._animationSets.DefaultAnimationSet = function ()
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local3:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.LevelBacker:SetRGBFromInt( 8421504, 0 )
					end
				},
				{
					function ()
						return self.LevelBacker:SetAlpha( 0.2, 0 )
					end
				},
				{
					function ()
						return self.LevelBacker:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -38, 0, 0, 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local4:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.LevelCap:SetRGBFromInt( 8421504, 0 )
					end
				},
				{
					function ()
						return self.LevelCap:SetAlpha( 0.2, 0 )
					end
				},
				{
					function ()
						return self.LevelCap:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -2, _1080p * 2, 0, 0, 0 )
					end
				}
			} )
		end
		self._sequences.DefaultSequence = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local3:AnimateSequence( "DefaultSequence" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local4:AnimateSequence( "DefaultSequence" )
			end
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local3:RegisterAnimationSequence( "MaxLevel", {
				{
					function ()
						return self.LevelBacker:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
					end
				},
				{
					function ()
						return self.LevelBacker:SetAlpha( 1, 0 )
					end
				},
				{
					function ()
						return self.LevelBacker:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local4:RegisterAnimationSequence( "MaxLevel", {
				{
					function ()
						return self.LevelCap:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		Level:RegisterAnimationSequence( "MaxLevel", {
			{
				function ()
					return self.Level:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Level:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Level:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -40, _1080p * -1.5, _1080p * 2, _1080p * 16, 0 )
				end
			}
		} )
		self._sequences.MaxLevel = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local3:AnimateSequence( "MaxLevel" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local4:AnimateSequence( "MaxLevel" )
			end
			Level:AnimateSequence( "MaxLevel" )
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local3:RegisterAnimationSequence( "NormalLevel", {
				{
					function ()
						return self.LevelBacker:SetRGBFromInt( 8421504, 0 )
					end
				},
				{
					function ()
						return self.LevelBacker:SetAlpha( 0.2, 0 )
					end
				},
				{
					function ()
						return self.LevelBacker:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 2, 0, 0, 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local4:RegisterAnimationSequence( "NormalLevel", {
				{
					function ()
						return self.LevelCap:SetAlpha( 0.2, 0 )
					end
				},
				{
					function ()
						return self.LevelCap:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -4, 0, 0, 0, 0 )
					end
				}
			} )
		end
		Level:RegisterAnimationSequence( "NormalLevel", {
			{
				function ()
					return self.Level:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.NormalLevel = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local3:AnimateSequence( "NormalLevel" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local4:AnimateSequence( "NormalLevel" )
			end
			Level:AnimateSequence( "NormalLevel" )
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local3:RegisterAnimationSequence( "Hide", {
				{
					function ()
						return self.LevelBacker:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local4:RegisterAnimationSequence( "Hide", {
				{
					function ()
						return self.LevelCap:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		Level:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Level:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hide = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local3:AnimateSequence( "Hide" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local4:AnimateSequence( "Hide" )
			end
			Level:AnimateSequence( "Hide" )
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local3:RegisterAnimationSequence( "Show", {
				{
					function ()
						return self.LevelBacker:SetAlpha( 0.2, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local4:RegisterAnimationSequence( "Show", {
				{
					function ()
						return self.LevelCap:SetAlpha( 0.2, 0 )
					end
				}
			} )
		end
		Level:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Level:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Show = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local3:AnimateSequence( "Show" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local4:AnimateSequence( "Show" )
			end
			Level:AnimateSequence( "Show" )
		end
		
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local3:RegisterAnimationSequence( "ShowMaxLevel", {
				{
					function ()
						return self.LevelBacker:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local4:RegisterAnimationSequence( "ShowMaxLevel", {
				{
					function ()
						return self.LevelCap:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		Level:RegisterAnimationSequence( "ShowMaxLevel", {
			{
				function ()
					return self.Level:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowMaxLevel = function ()
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local3:AnimateSequence( "ShowMaxLevel" )
			end
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local4:AnimateSequence( "ShowMaxLevel" )
			end
			Level:AnimateSequence( "ShowMaxLevel" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "WeaponButtonLevel", WeaponButtonLevel )
LockTable( _M )
