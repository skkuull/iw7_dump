local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.numCharges:GetValue( f1_arg1 )
		local f2_local1 = f1_arg0:GetDataSource()
		f2_local1 = f2_local1.maxCharges:GetValue( f1_arg1 )
		local f2_local2 = f1_arg0:GetDataSource()
		f2_local2 = f2_local2.equipped:GetValue( f1_arg1 )
		local f2_local3 = nil
		if f2_local2 then
			if f2_local1 > 1 then
				if f2_local0 == 2 then
					f2_local3 = "TwoOutOfTwo"
				elseif f2_local0 == 1 then
					f2_local3 = "OneOutOfTwo"
				else
					f2_local3 = "ZeroOutOfTwo"
				end
			elseif f2_local0 == 1 then
				f2_local3 = "OneOutOfOne"
			else
				f2_local3 = "ZeroOutOfOne"
			end
		else
			f2_local3 = "None"
		end
		ACTIONS.AnimateSequence( f1_arg0, f2_local3 )
	end
	
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "numCharges", f1_local0, true )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "maxCharges", f1_local0, true )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "equipped", f1_local0, true )
end

function PlayerEquipmentCharges( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 60 * _1080p, 0, 3 * _1080p )
	self.id = "PlayerEquipmentCharges"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local charge1 = nil
	
	charge1 = LUI.UIImage.new()
	charge1.id = "charge1"
	charge1:SetUseAA( true )
	charge1:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 29, 0, 0 )
	self:addElement( charge1 )
	self.charge1 = charge1
	
	local charge2 = nil
	
	charge2 = LUI.UIImage.new()
	charge2.id = "charge2"
	charge2:SetUseAA( true )
	charge2:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 31, _1080p * 60, 0, 0 )
	self:addElement( charge2 )
	self.charge2 = charge2
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		charge1:RegisterAnimationSequence( "OneOutOfOne", {
			{
				function ()
					return self.charge1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.charge1:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.charge1:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 60, 0, 0, 0 )
				end
			}
		} )
		charge2:RegisterAnimationSequence( "OneOutOfOne", {
			{
				function ()
					return self.charge2:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.OneOutOfOne = function ()
			charge1:AnimateSequence( "OneOutOfOne" )
			charge2:AnimateSequence( "OneOutOfOne" )
		end
		
		charge1:RegisterAnimationSequence( "ZeroOutOfOne", {
			{
				function ()
					return self.charge1:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.charge1:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 60, 0, 0, 0 )
				end
			}
		} )
		charge2:RegisterAnimationSequence( "ZeroOutOfOne", {
			{
				function ()
					return self.charge2:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ZeroOutOfOne = function ()
			charge1:AnimateSequence( "ZeroOutOfOne" )
			charge2:AnimateSequence( "ZeroOutOfOne" )
		end
		
		charge1:RegisterAnimationSequence( "TwoOutOfTwo", {
			{
				function ()
					return self.charge1:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.charge1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.charge1:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 29, 0, 0, 0 )
				end
			}
		} )
		charge2:RegisterAnimationSequence( "TwoOutOfTwo", {
			{
				function ()
					return self.charge2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.charge2:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.TwoOutOfTwo = function ()
			charge1:AnimateSequence( "TwoOutOfTwo" )
			charge2:AnimateSequence( "TwoOutOfTwo" )
		end
		
		charge1:RegisterAnimationSequence( "OneOutOfTwo", {
			{
				function ()
					return self.charge1:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.charge1:SetAlpha( 1, 0 )
				end
			}
		} )
		charge2:RegisterAnimationSequence( "OneOutOfTwo", {
			{
				function ()
					return self.charge2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.charge2:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.OneOutOfTwo = function ()
			charge1:AnimateSequence( "OneOutOfTwo" )
			charge2:AnimateSequence( "OneOutOfTwo" )
		end
		
		charge1:RegisterAnimationSequence( "ZeroOutOfTwo", {
			{
				function ()
					return self.charge1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.charge1:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		charge2:RegisterAnimationSequence( "ZeroOutOfTwo", {
			{
				function ()
					return self.charge2:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.charge2:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ZeroOutOfTwo = function ()
			charge1:AnimateSequence( "ZeroOutOfTwo" )
			charge2:AnimateSequence( "ZeroOutOfTwo" )
		end
		
		charge1:RegisterAnimationSequence( "None", {
			{
				function ()
					return self.charge1:SetAlpha( 0, 0 )
				end
			}
		} )
		charge2:RegisterAnimationSequence( "None", {
			{
				function ()
					return self.charge2:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.None = function ()
			charge1:AnimateSequence( "None" )
			charge2:AnimateSequence( "None" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "PlayerEquipmentCharges", PlayerEquipmentCharges )
LockTable( _M )
