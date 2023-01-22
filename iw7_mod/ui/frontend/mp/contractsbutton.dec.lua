local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	assert( f1_arg0.CompletedCount )
	local f1_local0 = 0
	local f1_local1 = true
	for f1_local2 = 0, 1, 1 do
		if Contracts.CheckCompletion( f1_arg1, f1_local2 ) then
			f1_local0 = f1_local0 + 1
		end
		if not Contracts.HasSeenContract( f1_arg1, f1_local2 ) then
			f1_local1 = false
		end
	end
	f1_arg0.CompletedCount:setText( Engine.Localize( "LUA_MENU_MP_CONTRACTS_COMPLETED", f1_local0, 2 ) )
	if not f1_local1 and not Onboarding:IsFlowInProgress( Onboarding.RigTutorial ) then
		f1_arg0.NewItemNotification:SetAlpha( 1, 0 )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.ContractTimer )
	f0_local0( f2_arg0, f2_arg1 )
	f2_arg0:addEventHandler( "update_contracts", function ( f3_arg0, f3_arg1 )
		f0_local0( f3_arg0, f2_arg1 )
		f2_arg0.ContractTimer:setEndTime( Rewards.GetContractEndTime() )
		return true
	end )
	f2_arg0.ContractTimer:setEndTime( Rewards.GetContractEndTime() )
	f2_arg0.ContractTimer:useLocalizedFormat()
end

function ContractsButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 60 * _1080p )
	self.id = "ContractsButton"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	self.buttonDescription = Engine.Localize( "MP_CONTRACTS_MENU_BUTTON_DESC" )
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetBlurStrength( 3.75, 0 )
	Blur:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * -51, _1080p * -30, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local ContractInfoBackground = nil
	
	ContractInfoBackground = LUI.UIImage.new()
	ContractInfoBackground.id = "ContractInfoBackground"
	ContractInfoBackground:SetAlpha( 0, 0 )
	ContractInfoBackground:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * -51, _1080p * -30, 0 )
	self:addElement( ContractInfoBackground )
	self.ContractInfoBackground = ContractInfoBackground
	
	local CompletedCount = nil
	
	CompletedCount = LUI.UIStyledText.new()
	CompletedCount.id = "CompletedCount"
	CompletedCount:SetRGBFromInt( 14277081, 0 )
	CompletedCount:setText( "", 0 )
	CompletedCount:SetFontSize( 22 * _1080p )
	CompletedCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CompletedCount:SetAlignment( LUI.Alignment.Right )
	CompletedCount:SetStartupDelay( 1500 )
	CompletedCount:SetLineHoldTime( 400 )
	CompletedCount:SetAnimMoveTime( 300 )
	CompletedCount:SetEndDelay( 1000 )
	CompletedCount:SetCrossfadeTime( 500 )
	CompletedCount:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	CompletedCount:SetMaxVisibleLines( 1 )
	CompletedCount:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 234.5, _1080p * -62.5, _1080p * -26, _1080p * -4 )
	self:addElement( CompletedCount )
	self.CompletedCount = CompletedCount
	
	local Contracts = nil
	
	Contracts = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f4_local1
	} )
	Contracts.id = "Contracts"
	Contracts.buttonDescription = Engine.Localize( "MP_CONTRACTS_MENU_BUTTON_DESC" )
	Contracts.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_CONTRACTS" ) ), 0 )
	Contracts:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 )
	self:addElement( Contracts )
	self.Contracts = Contracts
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 6,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 2
	} )
	Border.id = "Border"
	Border:SetRGBFromInt( 14277081, 0 )
	Border:SetBorderThicknessLeft( _1080p * 6, 0 )
	Border:SetBorderThicknessRight( _1080p * 2, 0 )
	Border:SetBorderThicknessTop( _1080p * 0, 0 )
	Border:SetBorderThicknessBottom( _1080p * 2, 0 )
	Border:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * -51, _1080p * -30, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local NewItemNotification = nil
	
	NewItemNotification = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
		controllerIndex = f4_local1
	} )
	NewItemNotification.id = "NewItemNotification"
	NewItemNotification:SetAlpha( 0, 0 )
	NewItemNotification:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 385, _1080p * -51, _1080p * -17, _1080p * 47 )
	self:addElement( NewItemNotification )
	self.NewItemNotification = NewItemNotification
	
	local ContractTimer = nil
	
	ContractTimer = MenuBuilder.BuildRegisteredType( "UILongCountdown", {
		controllerIndex = f4_local1
	} )
	ContractTimer.id = "ContractTimer"
	ContractTimer:SetRGBFromInt( 14277081, 0 )
	ContractTimer:SetFontSize( 22 * _1080p )
	ContractTimer:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ContractTimer:SetAlignment( LUI.Alignment.Left )
	ContractTimer:setEndTime( 0 )
	ContractTimer:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 19, _1080p * -265.5, _1080p * -26, _1080p * -4 )
	self:addElement( ContractTimer )
	self.ContractTimer = ContractTimer
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		NewItemNotification:RegisterAnimationSequence( "Arabic", {
			{
				function ()
					return self.NewItemNotification:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -426, _1080p * -17, _1080p * 47, 0 )
				end
			}
		} )
		self._sequences.Arabic = function ()
			NewItemNotification:AnimateSequence( "Arabic" )
		end
		
		ContractInfoBackground:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.ContractInfoBackground:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		CompletedCount:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.CompletedCount:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Border:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			}
		} )
		ContractTimer:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.ContractTimer:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			ContractInfoBackground:AnimateSequence( "ButtonOver" )
			CompletedCount:AnimateSequence( "ButtonOver" )
			Border:AnimateSequence( "ButtonOver" )
			ContractTimer:AnimateSequence( "ButtonOver" )
		end
		
		ContractInfoBackground:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.ContractInfoBackground:SetRGBFromTable( SWATCHES.Contracts.JointContract, 0 )
				end
			}
		} )
		CompletedCount:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.CompletedCount:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Border:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		ContractTimer:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.ContractTimer:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			ContractInfoBackground:AnimateSequence( "ButtonUp" )
			CompletedCount:AnimateSequence( "ButtonUp" )
			Border:AnimateSequence( "ButtonUp" )
			ContractTimer:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "Arabic" )
	end
	self:addEventHandler( "button_action", function ( f19_arg0, f19_arg1 )
		ACTIONS.OpenMenu( "ContractMenu", true, f19_arg1.controller or f4_local1 )
	end )
	self:addEventHandler( "button_over", function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg1.controller or f4_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f21_arg0, f21_arg1 )
		local f21_local0 = f21_arg1.controller or f4_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "ContractsButton", ContractsButton )
LockTable( _M )
