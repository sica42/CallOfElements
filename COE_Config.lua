--[[

	CALL OF ELEMENTS
	The All-In-One Shaman Addon

	by Wyverex (2006)


	Configuration Dialog

]]

---@class COE_Config
---@field Defaults table<number, any>
---@field CurrentPanel string
---@field CurrentSubPanel string
---@field ConfigureOrderTotem boolean
-- Interface
---@field OnFrameLoad fun( self: COE_Config )
---@field CloseDialog fun( self: COE_Config )
---@field OnTabButtonClick fun( self: COE_Config )
---@field OnConfigElementLoad fun( self: COE_Config, element: FontString )
---@field OnConfigElementEnter fun( self: COE_Config )
---@field OnConfigElementLeave fun( self: COE_Config )
---@field OnSubTabButtonClick fun( self: COE_Config, button: Button )
---@field OnCheckBoxShow fun( self: COE_Config )
---@field OnCheckBoxClick fun( self: COE_Config )
---@field EnableCheckBox fun( self: COE_Config, element: CheckButton )
---@field DisableCheckBox fun( self: COE_Config, element: CheckButton )
---@field OnComboBoxShow fun( self: COE_Config )
---@field EnableComboBox fun( self: COE_Config, element: Frame )
---@field DisableComboBox fun( self: COE_Config, element: Frame )
---@field EnableEditBox fun( self: COE_Config, element: EditBox )
---@field DisableEditBox fun( self: COE_Config, element: EditBox )
---@field OnSliderShow fun( self: COE_Config )
---@field OnSliderChange fun( self: COE_Config )
---@field ConfigureBar fun( self: COE_Config, mode: boolean )
---@field ConfigureOrder fun( self: COE_Config, mode: boolean )
-- Totem Sets
---@field ActivateSet fun( self: COE_Config, index: number )
---@field SetSetButtonStates fun( self: COE_Config )
---@field NewSetTextChanged fun( self: COE_Config )
---@field NewTotemSet fun( self: COE_Config )
---@field DeleteTotemSet fun( self: COE_Config )
---@field ConfigureSet fun( self: COE_Config, mode: boolean )
---@field DoCastOrder fun( self: COE_Config, up: boolean )
-- Logic
---@field RegisterOption fun( self: COE_Config, id: number, type: string, func: fun()|nil, value: any, initfunc: fun(), istotembaroption: boolean? )
---@field SetOption fun( self: COE_Config, id: number, value: any )
---@field GetSaved fun( self: COE_Config, id: number ): any
---@field pfUISkin fun( self: COE_Config )

---@type COE_Config
COE_Config = COE_Config or {}

---@type COE
local COE = COE

--[[ ----------------------------------------------------------------
	COE_Config.CurrentPanel and COE_Config.CurrentSubPanel contain
	the button names for the currently active panel and subpanel
	in the confiuration	dialog
-------------------------------------------------------------------]]
COE_Config[ "CurrentPanel" ] = "COE_ConfigTotemTab";
COE_Config[ "CurrentSubPanel" ] = "COE_ConfigTotemTotemBar";


--[[ ----------------------------------------------------------------
	COE_Config.Options contains all registered option defaults
-------------------------------------------------------------------]]
COE_Config[ "Options" ] = {};
COE_Config[ "ConfigureSetsMode" ] = false;
COE_Config[ "ConfigureBarMode" ] = false;
COE_Config[ "ConfigureOrderMode" ] = false;
COE_Config[ "CurrentOrderTotem" ] = nil;

COEOPT_ENABLETOTEMBAR = 1;
COEOPT_HIDEBACKDROP = 2;
COEOPT_ENABLETIMERS = 3;
COEOPT_TIMERNOTIFICATIONS = 4;
COEOPT_TTALIGNMENT = 5;
COEOPT_DISPLAYMODE = 6;
COEOPT_DISPLAYALIGN = 7;
COEOPT_ADVISOR = 8;
COEOPT_ENABLESETS = 9;
COEOPT_ENABLEFORCESETS = 91;
COEOPT_ENABLEDISTANCECHECK = 92;
COEOPT_ACTIVESET = 10;
COEOPT_AUTOSWITCH = 11;
COEOPT_FIXBAR = 12;
COEOPT_VERSION = 13;
COEOPT_OVERRIDESET = 14;
COEOPT_CURRENTFRAME = 15;
COEOPT_DIRECTION = 16;
COEOPT_FRAMEMODE = 17;
COEOPT_FLEXCOUNT = 18;
COEOPT_SCALING = 19;
COEOPT_TIMERFRAME = 20;
COEOPT_OVERRIDERANK = 21;
COEOPT_GROUPBARS = 22;
COEOPT_FRAMETIMERSONLY = 23;
COEOPT_ENABLERECALLREMINDER = 24;
COEOPT_ENABLERECALLBUTTON = 25;
COEOPT_SHIELDNOTIFICATION = 26;
COEOPT_SHIELDNOTIFICATIONSOUND = 27;
COEOPT_SHIELDNOTIFICATIONICON = 32;
COEOPT_SHIELDCHARGES = 35;
COEOPT_WEAPONNOTIFICATION = 28;
COEOPT_WEAPONNOTIFICATIONSOUND = 29;
COEOPT_WEAPONNOTIFICATIONICON = 33;
COEOPT_ADVISORSOUND = 30;
COEOPT_ADVISORICON = 34;
COEOPT_CTRLCLICKMOVE = 31;
COEOPT_NOTIFYICONDURATION = 36;
COEOPT_NOTIFYICONSIZE = 37;
COEOPT_NOTIFYICONALPHA = 38;

COEMODE_ALLTOTEMS = 1;
COEMODE_TIMERSONLY = 2;
COEMODE_ACTIVESET = 3;

COEMODE_BOX = 1;
COEMODE_VERTICAL = 2;
COEMODE_HORIZONTAL = 3;

COEMODE_NOOVERRIDE = 1;
COEMODE_OVERRIDESHIFT = 2;
COEMODE_OVERRIDEALT = 3;
COEMODE_OVERRIDECTRL = 4;

--[[ ----------------------------------------------------------------
	COE_Config.Defaults contains the default values of all
	saved variables
-------------------------------------------------------------------]]
COE_Config.Defaults = {
	[ COEOPT_ENABLETOTEMBAR ] = 1,
	[ COEOPT_HIDEBACKDROP ] = 1,
	[ COEOPT_ENABLETIMERS ] = 1,
	[ COEOPT_ENABLERECALLBUTTON ] = 0,
	[ COEOPT_CTRLCLICKMOVE ] = 0,
	[ COEOPT_ENABLERECALLREMINDER ] = 0,
	[ COEOPT_SHIELDNOTIFICATION ] = 0,
	[ COEOPT_SHIELDNOTIFICATIONSOUND ] = 0,
	[ COEOPT_SHIELDNOTIFICATIONICON ] = 0,
	[ COEOPT_SHIELDCHARGES ] = 0,
	[ COEOPT_WEAPONNOTIFICATION ] = 0,
	[ COEOPT_WEAPONNOTIFICATIONSOUND ] = 0,
	[ COEOPT_WEAPONNOTIFICATIONICON ] = 0,
	[ COEOPT_TIMERNOTIFICATIONS ] = 1,
	[ COEOPT_TTALIGNMENT ] = 2,
	[ COEOPT_DISPLAYMODE ] = 1,
	[ COEOPT_DISPLAYALIGN ] = 1,
	[ COEOPT_ADVISOR ] = 1,
	[ COEOPT_ADVISORSOUND ] = 1,
	[ COEOPT_ADVISORICON ] = 0,
	[ COEOPT_ENABLESETS ] = 1,
	[ COEOPT_ENABLEFORCESETS ] = 0,
	[ COEOPT_ENABLEDISTANCECHECK ] = 0,
	[ COEOPT_ACTIVESET ] = 10,
	[ COEOPT_AUTOSWITCH ] = 1,
	[ COEOPT_FIXBAR ] = 0,
	[ COEOPT_OVERRIDESET ] = 1,
	[ COEOPT_CURRENTFRAME ] = "Earth",
	[ COEOPT_SCALING ] = 1.0,
	[ COEOPT_TIMERFRAME ] = 0,
	[ COEOPT_OVERRIDERANK ] = 1,
	[ COEOPT_GROUPBARS ] = 0,
	[ COEOPT_FRAMETIMERSONLY ] = 0,
	[ COEOPT_NOTIFYICONDURATION ] = 5,
	[ COEOPT_NOTIFYICONSIZE ] = 100,
	[ COEOPT_NOTIFYICONALPHA ] = 0.8,
}

--[[ ----------------------------------------------------------------
	COE_Config.Saved contains all saved variables
-------------------------------------------------------------------]]
COE_Saved = {
	[ COEOPT_ENABLETOTEMBAR ] = 1,
	[ COEOPT_HIDEBACKDROP ] = 1,
	[ COEOPT_ENABLETIMERS ] = 1,
	[ COEOPT_ENABLERECALLBUTTON ] = 0,
	[ COEOPT_CTRLCLICKMOVE ] = 0,
	[ COEOPT_ENABLERECALLREMINDER ] = 0,
	[ COEOPT_SHIELDNOTIFICATION ] = 0,
	[ COEOPT_SHIELDNOTIFICATIONSOUND ] = 0,
	[ COEOPT_SHIELDNOTIFICATIONICON ] = 0,
	[ COEOPT_SHIELDCHARGES ] = 0,
	[ COEOPT_WEAPONNOTIFICATION ] = 0,
	[ COEOPT_WEAPONNOTIFICATIONSOUND ] = 0,
	[ COEOPT_WEAPONNOTIFICATIONICON ] = 0,
	[ COEOPT_TIMERNOTIFICATIONS ] = 1,
	[ COEOPT_TTALIGNMENT ] = 2,
	[ COEOPT_DISPLAYMODE ] = 1,
	[ COEOPT_DISPLAYALIGN ] = 1,
	[ COEOPT_ADVISOR ] = 1,
	[ COEOPT_ADVISORSOUND ] = 1,
	[ COEOPT_ADVISORICON ] = 0,
	[ COEOPT_ENABLESETS ] = 1,
	[ COEOPT_ENABLEFORCESETS ] = 0,
	[ COEOPT_ENABLEDISTANCECHECK ] = 0,
	[ COEOPT_ACTIVESET ] = 10,
	[ COEOPT_AUTOSWITCH ] = 1,
	[ COEOPT_FIXBAR ] = 0,
	[ COEOPT_OVERRIDESET ] = 1,
	[ COEOPT_CURRENTFRAME ] = "Earth",
	[ COEOPT_SCALING ] = 1.0,
	[ COEOPT_TIMERFRAME ] = 0,
	[ COEOPT_OVERRIDERANK ] = 1,
	[ COEOPT_GROUPBARS ] = 0,
	[ COEOPT_FRAMETIMERSONLY ] = 0,
	[ COEOPT_NOTIFYICONDURATION ] = 5,
	[ COEOPT_NOTIFYICONSIZE ] = 100,
	[ COEOPT_NOTIFYICONALPHA ] = 0.8,
}


--[[ ----------------------------------------------------------------
	COE_SavedTotemSets holds the default set and the PVP sets
	COE_CustomTotemSets holds the player-defined custom sets
-------------------------------------------------------------------]]
COE_SavedTotemSets = {
	{
		Name = COEUI_PVPSETS[ 1 ],
		Earth = "",
		Fire = "",
		Water = "",
		Air = "",
		CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR }
	},
	{
		Name = COEUI_PVPSETS[ 2 ],
		Earth = "",
		Fire = "",
		Water = "",
		Air = "",
		CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR }
	},
	{
		Name = COEUI_PVPSETS[ 3 ],
		Earth = "",
		Fire = "",
		Water = "",
		Air = "",
		CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR }
	},
	{
		Name = COEUI_PVPSETS[ 4 ],
		Earth = "",
		Fire = "",
		Water = "",
		Air = "",
		CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR }
	},
	{
		Name = COEUI_PVPSETS[ 5 ],
		Earth = "",
		Fire = "",
		Water = "",
		Air = "",
		CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR }
	},
	{
		Name = COEUI_PVPSETS[ 6 ],
		Earth = "",
		Fire = "",
		Water = "",
		Air = "",
		CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR }
	},
	{
		Name = COEUI_PVPSETS[ 7 ],
		Earth = "",
		Fire = "",
		Water = "",
		Air = "",
		CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR }
	},
	{
		Name = COEUI_PVPSETS[ 8 ],
		Earth = "",
		Fire = "",
		Water = "",
		Air = "",
		CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR }
	},
	{
		Name = COEUI_PVPSETS[ 9 ],
		Earth = "",
		Fire = "",
		Water = "",
		Air = "",
		CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR }
	},
	{
		Name = COEUI_DEFAULTSET,
		Earth = "",
		Fire = "",
		Water = "",
		Air = "",
		CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR }
	},
};

COE_CustomTotemSets = { n = 0 };

COESET_DEFAULT = 10;


--[[ ----------------------------------------------------------------
	COE_DisplayedTotems stores the visibility option for each
	totem when in "All Totems" display mode
-------------------------------------------------------------------]]
COE_DisplayedTotems = {};


--[[ ----------------------------------------------------------------
	COE_TotemBars stores the alignment options of the totem bars
-------------------------------------------------------------------]]
---@type table<string, COE_TotemBar>
COE_TotemBars = {
	Earth = { Direction = "Left", Mode = "Flex", FlexCount = 1 },
	Fire = { Direction = "Right", Mode = "Flex", FlexCount = 1 },
	Water = { Direction = "Left", Mode = "Flex", FlexCount = 1 },
	Air = { Direction = "Right", Mode = "Flex", FlexCount = 1 },
};

COE_Element = { "Earth", "Fire", "Water", "Air", "TotemicRecall" };
COE_Direction = { "Up", "Down", "Left", "Right" };
COE_FrameMode = { "Closed", "Open", "Flex", "Hidden" };


--[[ =============================================================================================

										I N T E R F A C E

================================================================================================]]

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnFrameLoad

	PURPOSE: Registers all options
-------------------------------------------------------------------]]
function COE_Config:OnFrameLoad()
	if (not COE.Initialized) then
		return;
	end

	this:SetBackdropBorderColor( 0, 0, 0 );
	this:SetBackdropColor( 0, 0, 0 );

	-- make the dialog draggable
	-- --------------------------
	this:RegisterForDrag( "LeftButton" );

	-- make the dialog closable with ESC
	-- ----------------------------------
	table.insert( UISpecialFrames, this:GetName() )

	-- totem options
	-- --------------
	COE_Config:RegisterOption( COEOPT_ENABLETOTEMBAR, 'check', COEOptionEnableTotemBar, COE_Config:GetSaved( COEOPT_ENABLETOTEMBAR ) );
	COE_Config:RegisterOption( COEOPT_ENABLETIMERS, 'check', COEOptionEnableTimers, COE_Config:GetSaved( COEOPT_ENABLETIMERS ) );
	COE_Config:RegisterOption( COEOPT_ENABLERECALLREMINDER, 'check', COEOptionEnableRecallReminder, COE_Config:GetSaved( COEOPT_ENABLERECALLREMINDER ) );
	COE_Config:RegisterOption( COEOPT_CTRLCLICKMOVE, 'check', nil, COE_Config:GetSaved( COEOPT_CTRLCLICKMOVE ) );
	COE_Config:RegisterOption( COEOPT_SHIELDNOTIFICATION, 'check', COEOptionShieldChange, COE_Config:GetSaved( COEOPT_SHIELDNOTIFICATION ) );
	COE_Config:RegisterOption( COEOPT_SHIELDNOTIFICATIONICON, 'check', nil, COE_Config:GetSaved( COEOPT_SHIELDNOTIFICATIONICON ) );
	COE_Config:RegisterOption( COEOPT_SHIELDNOTIFICATIONSOUND, 'check', nil, COE_Config:GetSaved( COEOPT_SHIELDNOTIFICATIONSOUND ), COEOptionShieldSoundInit );
	COE_Config:RegisterOption( COEOPT_SHIELDCHARGES, 'editbox', nil, COE_Config:GetSaved( COEOPT_SHIELDCHARGES ) );
	COE_Config:RegisterOption( COEOPT_WEAPONNOTIFICATION, 'check', COEOptionWeaponChange, COE_Config:GetSaved( COEOPT_WEAPONNOTIFICATION ) );
	COE_Config:RegisterOption( COEOPT_WEAPONNOTIFICATIONICON, 'check', nil, COE_Config:GetSaved( COEOPT_WEAPONNOTIFICATIONICON ) );
	COE_Config:RegisterOption( COEOPT_WEAPONNOTIFICATIONSOUND, 'check', nil, COE_Config:GetSaved( COEOPT_WEAPONNOTIFICATIONSOUND ), COEOptionWeaponSoundInit );
	COE_Config:RegisterOption( COEOPT_TIMERNOTIFICATIONS, 'check', nil, COE_Config:GetSaved( COEOPT_TIMERNOTIFICATIONS ) );
	COE_Config:RegisterOption( COEOPT_NOTIFYICONDURATION, 'slider', COEOptionNotifyIconDurationChange, COE_Config:GetSaved( COEOPT_NOTIFYICONDURATION ),	COEOptionNotifyIconDurationShow );
	COE_Config:RegisterOption( COEOPT_NOTIFYICONSIZE, 'slider', COEOptionNotifyIconSizeChange, COE_Config:GetSaved( COEOPT_NOTIFYICONSIZE ), COEOptionNotifyIconSizeShow );
	COE_Config:RegisterOption( COEOPT_NOTIFYICONALPHA, 'slider', COEOptionNotifyIconAlphaChange, COE_Config:GetSaved( COEOPT_NOTIFYICONSIZE ), COEOptionNotifyIconAlphaShow );
	COE_Config:RegisterOption( COEOPT_TTALIGNMENT, 'combo', nil, COE_Config:GetSaved( COEOPT_TTALIGNMENT ), COEOptionTTAlignmentInit );
	COE_Config:RegisterOption( COEOPT_DISPLAYMODE, 'combo', nil, COE_Config:GetSaved( COEOPT_DISPLAYMODE ), COEOptionDisplayModeInit );
	COE_Config:RegisterOption( COEOPT_ADVISOR, 'check', COEOptionEnableAdvisor, COE_Config:GetSaved( COEOPT_ADVISOR ) );
	COE_Config:RegisterOption( COEOPT_ADVISORICON, 'check', nil, COE_Config:GetSaved( COEOPT_ADVISORICON ) );
	COE_Config:RegisterOption( COEOPT_ADVISORSOUND, 'check', nil, COE_Config:GetSaved( COEOPT_ADVISORSOUND ), COEOptionAdvisorSoundInit );
	COE_Config:RegisterOption( COEOPT_ENABLESETS, 'check', COEOptionEnableSets, COE_Config:GetSaved( COEOPT_ENABLESETS ) );
	COE_Config:RegisterOption( COEOPT_ENABLEFORCESETS, 'check', nil, COE_Config:GetSaved( COEOPT_ENABLEFORCESETS ) );
	COE_Config:RegisterOption( COEOPT_ENABLEDISTANCECHECK, 'check', nil, COE_Config:GetSaved( COEOPT_ENABLEDISTANCECHECK ) );
	COE_Config:RegisterOption( COEOPT_AUTOSWITCH, 'check', COEOptionEnableAutoSwitch, COE_Config:GetSaved( COEOPT_AUTOSWITCH ) );
	COE_Config:RegisterOption( COEOPT_ACTIVESET, 'combo', nil, COE_Config:GetSaved( COEOPT_ACTIVESET ), COEOptionActiveSetInit );
	COE_Config:RegisterOption( COEOPT_FIXBAR, 'check', nil, COE_Config:GetSaved( COEOPT_FIXBAR ) );
	COE_Config:RegisterOption( COEOPT_CURRENTFRAME, 'combo', nil, COE_Config:GetSaved( COEOPT_CURRENTFRAME ), COEOptionCurrentFrameInit );
	COE_Config:RegisterOption( COEOPT_DIRECTION, 'combo', nil, nil, COEOptionDirectionInit, true );
	COE_Config:RegisterOption( COEOPT_FRAMEMODE, 'combo', nil, nil, COEOptionFrameModeInit, true );
	COE_Config:RegisterOption( COEOPT_FLEXCOUNT, 'slider', COEOptionFlexCountChange, nil, COEOptionFlexCountShow, true );
	COE_Config:RegisterOption( COEOPT_SCALING, 'slider', COEOptionScalingChange, nil, COEOptionScalingShow );
	COE_Config:RegisterOption( COEOPT_TIMERFRAME, 'check', COEOptionEnableTimerFrame, COE_Config:GetSaved( COEOPT_TIMERFRAME ) );
	COE_Config:RegisterOption( COEOPT_DISPLAYALIGN, 'combo', nil, COE_Config:GetSaved( COEOPT_DISPLAYALIGN ), COEOptionDisplayAlignInit );
	COE_Config:RegisterOption( COEOPT_OVERRIDERANK, 'combo', nil, COE_Config:GetSaved( COEOPT_OVERRIDERANK ), COEOptionOverrideRankInit );
	COE_Config:RegisterOption( COEOPT_GROUPBARS, 'check', COEOptionGroupBars, COE_Config:GetSaved( COEOPT_GROUPBARS ) );
	COE_Config:RegisterOption( COEOPT_ENABLERECALLBUTTON, 'check', COEOptionEnableRecallButton, COE_Config:GetSaved( COEOPT_ENABLERECALLBUTTON ) );
	COE_Config:RegisterOption( COEOPT_FRAMETIMERSONLY, 'check', nil, COE_Config:GetSaved( COEOPT_FRAMETIMERSONLY ) );

	COEOptionScaleCheckButton( getglobal( "COE_OptionAdvisorIcon" ) )
	COEOptionScaleCheckButton( getglobal( "COE_OptionWeaponIcon" ) )
	COEOptionScaleCheckButton( getglobal( "COE_OptionShieldIcon" ) )
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:CloseDialog

	PURPOSE: Ends totem set configuration and closes the dialog
-------------------------------------------------------------------]]
function COE_Config:CloseDialog()
	COE_Config:ConfigureBar( false );
	COE_Config:ConfigureOrder( false );
	COE_Config:ConfigureSet( false );
	COE.notify_icon.hide();
	COE_ConfigFrame:Hide();
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnTabButtonClick

	PURPOSE: Shows the panel corresponding to the button
-------------------------------------------------------------------]]
function COE_Config:OnTabButtonClick()
	-- do nothing if this is already
	-- active panel
	-- ------------------------------
	if (COE_Config.CurrentPanel == this:GetName()) then
		this:SetChecked( true );
		return;
	end

	-- first uncheck old button
	-- and hide the panel
	-- -------------------------
	getglobal( COE_Config.CurrentPanel ):SetChecked( false );
	getglobal( COE_Config.CurrentPanel .. "Panel" ):Hide();

	-- then check this button
	-- and show the panel
	-- -----------------------
	this:SetChecked( true );
	getglobal( this:GetName() .. "Panel" ):Show();

	COE_Config.CurrentPanel = this:GetName();
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnConfigElementLoad

	PURPOSE: Sets the localized element text
-------------------------------------------------------------------]]
function COE_Config:OnConfigElementLoad( element )
	if (not COE.Initialized) then
		return;
	end

	if (COEUI_STRINGS[ this:GetName() ]) then
		element:SetText( COEUI_STRINGS[ this:GetName() ] );
	else
		element:SetText( COESTR_UI_NOTASSIGNED );
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnConfigElementEnter

	PURPOSE: Shows the tooltip for the config element
-------------------------------------------------------------------]]
function COE_Config:OnConfigElementEnter()
	if (COEUI_TOOLTIPS[ this:GetName() ]) then
		GameTooltip:SetOwner( this, "ANCHOR_RIGHT" );
		GameTooltip:SetText( COEUI_TOOLTIPS[ this:GetName() ], 1.0, 1.0, 1.0 );
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnConfigElementLeave

	PURPOSE: Hides the tooltip for the config element
-------------------------------------------------------------------]]
function COE_Config:OnConfigElementLeave()
	GameTooltip:Hide();
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnSubTabButtonClick

	PURPOSE: Shows the sub panel corresponding to the button
-------------------------------------------------------------------]]
function COE_Config:OnSubTabButtonClick( button )
	-- do nothing if this is already
	-- active panel
	-- ------------------------------
	if (COE_Config.CurrentSubPanel == button:GetName()) then
		return;
	end

	-- first hide the old panel
	-- -------------------------
	getglobal( COE_Config.CurrentSubPanel .. "Panel" ):Hide();

	-- then show the new panel
	-- ------------------------
	getglobal( button:GetName() .. "Panel" ):Show();

	if (button:GetName() == "COE_ConfigTotemTotemSets") then
		COE_Config:ActivateSet( COE_Config:GetSaved( COEOPT_ACTIVESET ) );
	end

	COE_Config.CurrentSubPanel = button:GetName();
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnCheckBoxShow

	PURPOSE: Sets the checked state depending on the current
		option value and call the associated function to update
		the state
-------------------------------------------------------------------]]
function COE_Config:OnCheckBoxShow()
	-- set check state
	-- ----------------
	this:SetChecked( COE_Config:GetSaved( this:GetID() ) );

	-- call function
	-- --------------
	if (COE_Config.Options[ this:GetID() ].Func) then
		COE_Config.Options[ this:GetID() ].Func();
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnCheckBoxClick

	PURPOSE: Toggles the associated option
-------------------------------------------------------------------]]
function COE_Config:OnCheckBoxClick()
	if (COE_Config.Options[ this:GetID() ]) then
		local option = COE_Config.Options[ this:GetID() ];

		-- execute function and store new value
		-- -------------------------------------
		if (COE_Config:GetSaved( this:GetID() ) == 1) then
			COE_Config:SetOption( this:GetID(), 0 );
		else
			COE_Config:SetOption( this:GetID(), 1 );
		end

		if (option.Func) then
			option.Func();
		end
	else
		COE:DebugMessage( "No ID assigned" );
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:EnableCheckBox

	PURPOSE: Enables a check box and sets the text color to the
		normal text color
-------------------------------------------------------------------]]
function COE_Config:EnableCheckBox( element )
	element:Enable();
	getglobal( element:GetName() .. "Text" ):SetTextColor( NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b );
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:DisableCheckBox

	PURPOSE: Disables a check box and sets the text color to gray
-------------------------------------------------------------------]]
function COE_Config:DisableCheckBox( element )
	element:Disable();
	getglobal( element:GetName() .. "Text" ):SetTextColor( GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b );
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnComboBoxShow

	PURPOSE: Initializes the combo box content
-------------------------------------------------------------------]]
function COE_Config:OnComboBoxShow()
	if (COE_Config.Options[ this:GetID() ]) then
		UIDropDownMenu_Initialize( this, COE_Config.Options[ this:GetID() ].InitFunc );
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:EnableComboBox

	PURPOSE: Enables a combo box and sets the text color to the
		normal text color
-------------------------------------------------------------------]]
function COE_Config:EnableComboBox( element )
	local cb = getglobal( element:GetName() .. "CB" )
	cb:Enable()
	cb:SetAlpha( 1.0 )
	cb.EnableMouse = true

	local btn = getglobal( cb:GetName() .. "Button" )
	if btn and btn.Enable then btn:Enable() end

	getglobal( element:GetName() .. "LeftText" ):SetTextColor( NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b );
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:DisableComboBox

	PURPOSE: Disables a combo box and sets the text color to gray
-------------------------------------------------------------------]]
function COE_Config:DisableComboBox( element )
	local cb = getglobal( element:GetName() .. "CB" )
	cb:Disable()
	cb:SetAlpha( 0.6 )
	cb.EnableMouse = false

	local btn = getglobal( cb:GetName() .. "Button" )
	if btn and btn.Disable then btn:Disable() end

	getglobal( element:GetName() .. "LeftText" ):SetTextColor( GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b );
end

function COE_Config:EnableEditBox( element )
	element:SetAlpha( 1.0 )
	element:EnableMouse( true )
end

function COE_Config:DisableEditBox( element )
	element:SetAlpha( 0.6 )
	element:EnableMouse( false )
	element:ClearFocus()
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnSliderShow

	PURPOSE: Sets the slider texts and values
-------------------------------------------------------------------]]
function COE_Config:OnSliderShow()
	if (COE_Config.Options[ this:GetID() ]) then
		COE_Config.Options[ this:GetID() ].InitFunc();
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnSliderChange

	PURPOSE: Sets the new value
-------------------------------------------------------------------]]
function COE_Config:OnSliderChange()
	if (COE_Config.Options[ this:GetID() ]) then
		COE_Config.Options[ this:GetID() ].Func();
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:ConfigureBar

	PURPOSE: Switches between set bar configuration modes
-------------------------------------------------------------------]]
function COE_Config:ConfigureBar( mode )
	if (mode == nil) then
		mode = not COE.ConfigureBarMode;
	end

	if (mode) then
		COE_Config:ConfigureOrder( false );
		COE_Config:ConfigureSet( false );
		COE.ConfigureBarMode = true;
		COE_OptionConfigureBar:SetText( COEUI_STRINGS[ "COE_OptionStopConfigureSet" ] );
	else
		COE.ConfigureBarMode = false;
		COE_OptionConfigureBar:SetText( COEUI_STRINGS[ "COE_OptionConfigureBar" ] );
	end

	COE_Totem:Invalidate( COEEarthFrame, true, true, true );
	COE_Totem:Invalidate( COEFireFrame, true, true, true );
	COE_Totem:Invalidate( COEWaterFrame, true, true, true );
	COE_Totem:Invalidate( COEAirFrame, true, true, true );
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:ConfigureOrder

	PURPOSE: Switches between set bar configuration modes
-------------------------------------------------------------------]]
function COE_Config:ConfigureOrder( mode )
	if (mode == nil) then
		mode = not COE.ConfigureOrderMode;
	end

	if (mode) then
		COE_Config:ConfigureBar( false );
		COE_Config:ConfigureSet( false );
		COE.ConfigureOrderMode = true;
		COE_OptionConfigureOrder:SetText( COEUI_STRINGS[ "COE_OptionStopConfigureSet" ] );
	else
		COE.ConfigureOrderMode = false;
		COE_Config.ConfigureOrderTotem = nil;
		COE_OptionConfigureOrder:SetText( COEUI_STRINGS[ "COE_OptionConfigureOrder" ] );
	end

	COE_Totem:Invalidate( COEEarthFrame, true, true, true );
	COE_Totem:Invalidate( COEFireFrame, true, true, true );
	COE_Totem:Invalidate( COEWaterFrame, true, true, true );
	COE_Totem:Invalidate( COEAirFrame, true, true, true );
end

--[[ =============================================================================================

										O P T I O N S

================================================================================================]]

--[[ ----------------------------------------------------------------
	METHOD: COEOptionEnableTotemBar

	PURPOSE: Update the totem bar frame to reflect the change and
		set availability of dependent options
-------------------------------------------------------------------]]
function COEOptionEnableTotemBar()
	-- this call is needed if the bar was invisible
	-- ---------------------------------------------
	COE_Totem:UpdateAllFrames();
	COEOptionEnableRecallButton();

	if (COE_Config:GetSaved( COEOPT_ENABLETOTEMBAR ) == 1) then
		COE_ConfigTotemTotemBar:Enable();
		COE_ConfigTotemTotemSets:Enable();
		COE_ConfigTotemTotemOptions:Enable();
		COE_ConfigTotemNotifications:Enable();

		COE_Config:EnableCheckBox( COE_OptionFixBar );
		COE_Config:EnableCheckBox( COE_OptionGroupBars );
		COE_Config:EnableCheckBox( COE_OptionEnableRecallButton );
		COE_Config:EnableCheckBox( COE_OptionCtrlClick );
		COE_Config:EnableComboBox( COE_OptionTTAlignment );
		COE_Config:EnableComboBox( COE_OptionDisplayMode );
		COE_OptionConfigureBar:Enable();
		COE_OptionConfigureOrder:Enable();
		COE_Config:EnableComboBox( COE_OptionCurrentFrame );
		COE_Config:EnableComboBox( COE_OptionDirection );
		COE_Config:EnableComboBox( COE_OptionFrameMode );
		COE_OptionFlexCount:Show();
	else
		COE_ConfigTotemTotemBar:Disable();
		COE_ConfigTotemTotemSets:Disable();
		COE_ConfigTotemTotemOptions:Disable();
		COE_ConfigTotemNotifications:Disable();

		COE_Config:OnSubTabButtonClick( COE_ConfigTotemTotemBar );

		COE_Config:DisableCheckBox( COE_OptionFixBar );
		COE_Config:DisableCheckBox( COE_OptionGroupBars );
		COE_Config:DisableCheckBox( COE_OptionEnableRecallButton );
		COE_Config:DisableCheckBox( COE_OptionCtrlClick );
		COE_Config:DisableComboBox( COE_OptionTTAlignment );
		COE_Config:DisableComboBox( COE_OptionDisplayMode );
		COE_Config:ConfigureSet( false );
		COE_Config:ConfigureBar( false );
		COE_Config:ConfigureOrder( false );
		COE_OptionConfigureBar:Disable();
		COE_OptionConfigureOrder:Disable();
		COE_Config:DisableComboBox( COE_OptionCurrentFrame );
		COE_Config:DisableComboBox( COE_OptionDirection );
		COE_Config:DisableComboBox( COE_OptionFrameMode );
		COE_OptionFlexCount:Hide();
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionEnableTimers

	PURPOSE: Disable dependent elements
-------------------------------------------------------------------]]
function COEOptionEnableTimers()
	if (COE_Config:GetSaved( COEOPT_ENABLETIMERS ) == 0) then
		-- disable dependent elements
		-- ---------------------------
		COE_Config:DisableCheckBox( COE_OptionEnableTimerNotifications );
		COE_Config:DisableCheckBox( COE_OptionEnableTimerFrame );
		COE_Config:DisableComboBox( COE_OptionDisplayAlignment );
		COE_Config:DisableCheckBox( COE_OptionFrameTimersOnly );
		COETimerFrame:Hide();
	else
		COE_Config:EnableCheckBox( COE_OptionEnableTimerNotifications );
		COE_Config:EnableCheckBox( COE_OptionEnableTimerFrame );
		COE_Config:EnableComboBox( COE_OptionDisplayAlignment );
		COE_Config:EnableCheckBox( COE_OptionFrameTimersOnly );

		if (COE_Config:GetSaved( COEOPT_TIMERFRAME ) == 1) then
			COETimerFrame:Show();
		end
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionEnableRecallReminder

	PURPOSE: Schedules the range check if enabled
	-------------------------------------------------------------------]]
function COEOptionEnableRecallReminder()
	if (COE_Config:GetSaved( COEOPT_ENABLERECALLREMINDER ) == 1) then
		if (not Chronos.isScheduledByName( "COERecallReminder" )) then
			Chronos.scheduleByName( "COERecallReminder", COE.RecallReminderInterval, COESched_RunRecallCheck )
		end
	else
		Chronos.unscheduleByName( "COERecallReminder" )
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionShieldChange

	PURPOSE: Enable/disable shield options
	-------------------------------------------------------------------]]
function COEOptionShieldChange()
	if (COE_Config:GetSaved( COEOPT_SHIELDNOTIFICATION ) == 1) then
		COE_Config:EnableCheckBox( getglobal( "COE_OptionShieldIcon" ) );
		COE_Config:EnableComboBox( getglobal( "COE_OptionShieldSound" ) )
		COE_Config:EnableEditBox( getglobal( "COE_OptionShieldCharges" ) );
		getglobal( "COE_OptionShieldChargesStringText" ):SetTextColor( NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b );
	else
		COE_Config:DisableCheckBox( getglobal( "COE_OptionShieldIcon" ) );
		COE_Config:DisableComboBox( getglobal( "COE_OptionShieldSound" ) )
		COE_Config:DisableEditBox( getglobal( "COE_OptionShieldCharges" ) );
		getglobal( "COE_OptionShieldChargesStringText" ):SetTextColor( GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b );
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionWeaponChange

	PURPOSE: Schedules the weapon check if enabled
					 Enable/disable weapon sound option
	-------------------------------------------------------------------]]

function COEOptionWeaponChange()
	if (COE_Config:GetSaved( COEOPT_WEAPONNOTIFICATION ) == 1) then
		COE_Config:EnableCheckBox( getglobal( "COE_OptionWeaponIcon" ) );
		COE_Config:EnableComboBox( getglobal( "COE_OptionWeaponSound" ) )
		if (not Chronos.isScheduledByName( "COEWeaponCheck" )) then
			Chronos.scheduleByName( "COEWeaponCheck", COE.WeaponCheckInterval, COESched_RunWeaponCheck )
		end
	else
		COE_Config:DisableCheckBox( getglobal( "COE_OptionWeaponIcon" ) );
		COE_Config:DisableComboBox( getglobal( "COE_OptionWeaponSound" ) )
		Chronos.unscheduleByName( "COEWeaponCheck" )
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionEnableRecellButtonInit

	PURPOSE: Toggle Totemic Recall button
	-------------------------------------------------------------------]]
function COEOptionEnableRecallButton()
	COE_Totem:UpdateTotemicRecall( COE[ "ForceUpdate" ] )
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionScaleCheckButton

	PURPOSE: Scales down a check button and scales up its text
	-------------------------------------------------------------------]]
function COEOptionScaleCheckButton( button )
	---@type FontString
	local text = getglobal( button:GetName() .. "Text" )
	local font, height, flags = text:GetFont()

	button:SetScale( 0.6 )
	text:SetFont( font, height * 1.4, flags )
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionTTAlignmentInit

	PURPOSE: Fills the Tooltip Alignment combo box
-------------------------------------------------------------------]]
function COEOptionTTAlignmentInit()
	for i = 1, getn( COEUI_TTALIGN ) do
		UIDropDownMenu_AddButton( { text = COEUI_TTALIGN[ i ][ 2 ], func = COEOptionTTAlignmentClick } );
	end
	UIDropDownMenu_SetSelectedID( COE_OptionTTAlignmentCB, COE_Config:GetSaved( COEOPT_TTALIGNMENT ) );
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionTTAlignmentClick()

	PURPOSE: Selects the clicked button and stores the option
-------------------------------------------------------------------]]
function COEOptionTTAlignmentClick()
	UIDropDownMenu_SetSelectedID( COE_OptionTTAlignmentCB, this:GetID() );
	COE_Config:SetOption( COEOPT_TTALIGNMENT, this:GetID() );
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionDisplayModeInit

	PURPOSE: Fills the Display Mode combo box
-------------------------------------------------------------------]]
function COEOptionDisplayModeInit()
	for i = 1, getn( COEUI_DISPLAYMODE ) do
		UIDropDownMenu_AddButton( { text = COEUI_DISPLAYMODE[ i ], func = COEOptionDisplayModeClick } );
	end
	UIDropDownMenu_SetSelectedID( COE_OptionDisplayModeCB, COE_Config:GetSaved( COEOPT_DISPLAYMODE ) );
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionDisplayModeClick()

	PURPOSE: Selects the clicked button and stores the option
-------------------------------------------------------------------]]
function COEOptionDisplayModeClick()
	UIDropDownMenu_SetSelectedID( COE_OptionDisplayModeCB, this:GetID() );
	COE_Config:SetOption( COEOPT_DISPLAYMODE, this:GetID() );

	-- reconfigure totems
	-- -------------------
	COETotemFrame.Reconfigure = true;
end

---@param cb Frame
---@param setting number
function COEOptionSoundsInit( cb, setting )
	local info = {
		arg1 = cb,
		arg2 = setting,
		func = CEOOptionSoundsClick
	}

	for _, sound in pairs( COE.Sounds ) do
		info.text = sound.Name
		UIDropDownMenu_AddButton( info );
	end

	UIDropDownMenu_SetSelectedID( cb, COE_Config:GetSaved( setting ) );
end

function CEOOptionSoundsClick( cb, setting )
	UIDropDownMenu_SetSelectedID( cb, this:GetID() );
	COE_Config:SetOption( setting, this:GetID() );
end

function COEOptionAdvisorSoundInit()
	COEOptionSoundsInit( getglobal( "COE_OptionAdvisorSoundCB" ), COEOPT_ADVISORSOUND )
end

function COEOptionWeaponSoundInit()
	COEOptionSoundsInit( getglobal( "COE_OptionWeaponSoundCB" ), COEOPT_WEAPONNOTIFICATIONSOUND )
end

function COEOptionShieldSoundInit()
	COEOptionSoundsInit( getglobal( "COE_OptionShieldSoundCB" ), COEOPT_SHIELDNOTIFICATIONSOUND )
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionEnableSets()

	PURPOSE: Set availability of the set buttons
-------------------------------------------------------------------]]
function COEOptionEnableSets()
	if (COE_Config:GetSaved( COEOPT_ENABLESETS ) == 1) then
		COE_Config:EnableCheckBox( COE_OptionEnableAutoSwitch );
		COE_Config:EnableComboBox( COE_OptionActiveSet );
		COE_OptionConfigureSet:Enable();
		COE_OptionSetName:Show();
	else
		COE_Config:DisableCheckBox( COE_OptionEnableAutoSwitch );
		COE_Config:DisableComboBox( COE_OptionActiveSet );
		COE_OptionConfigureSet:Disable();
		COE_OptionSetName:Hide();

		COE_Config:ActivateSet( COESET_DEFAULT );
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionEnableAdvisor()

	PURPOSE: Schedules the advisor check if enabled
					 Enable/disable advisor sound option
-------------------------------------------------------------------]]
function COEOptionEnableAdvisor()
	if (COE_Config:GetSaved( COEOPT_ADVISOR ) == 1) then
		COE_Config:EnableCheckBox( getglobal( "COE_OptionAdvisorIcon" ) )
		COE_Config:EnableComboBox( getglobal( "COE_OptionAdvisorSound" ) )
		-- schedule only if not already scheduled to prevent
		-- rescheduling on config dialog display
		-- --------------------------------------------------
		if (not Chronos.isScheduledByName( "COEAdvise" )) then
			Chronos.scheduleByName( "COEAdvise", COE.AdvisorInterval, COESched_RunAdvisor );
		end
	else
		COE_Config:DisableCheckBox( getglobal( "COE_OptionAdvisorIcon" ) )
		COE_Config:DisableComboBox( getglobal( "COE_OptionAdvisorSound" ) )
		Chronos.unscheduleByName( "COEAdvise" );
		COE.CleansingTotems.Tremor.Warn = false;
		COE.CleansingTotems.Disease.Warn = false;
		COE.CleansingTotems.Poison.Warn = false;
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionEnableAutoSwitch()

	PURPOSE: Refill the Active Set combo box
-------------------------------------------------------------------]]
function COEOptionEnableAutoSwitch()
	if (COE_Config:GetSaved( COEOPT_AUTOSWITCH ) == 0 and
				COE_Config:GetSaved( COEOPT_ACTIVESET ) <= COESET_DEFAULT) then
		-- switch to default set
		-- ----------------------
		COE_Config:ActivateSet( COESET_DEFAULT );
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionActiveSetInit

	PURPOSE: Fills the Active Set combo box
-------------------------------------------------------------------]]
function COEOptionActiveSetInit()
	-- pvp sets
	-- ---------
	if (COE_Config:GetSaved( COEOPT_AUTOSWITCH ) == 1) then
		for i = 1, getn( COEUI_PVPSETS ) do
			UIDropDownMenu_AddButton( { text = COEUI_PVPSETS[ i ], func = COEOptionActiveSetClick, value = i } );
		end
	end

	-- default set
	-- ------------
	UIDropDownMenu_AddButton( { text = COEUI_DEFAULTSET, func = COEOptionActiveSetClick, value = COESET_DEFAULT } );

	-- custom sets
	-- ------------
	for i = 1, getn( COE_CustomTotemSets ) do
		UIDropDownMenu_AddButton( { text = COE_CustomTotemSets[ i ].Name, func = COEOptionActiveSetClick, value = COESET_DEFAULT + i } );
	end

	-- select the activated set
	-- -------------------------
	UIDropDownMenu_SetSelectedValue( COE_OptionActiveSetCB, COE_Config:GetSaved( COEOPT_ACTIVESET ) );

	COE_Config:SetSetButtonStates();
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionActiveSetClick

	PURPOSE: Activates the chosen totem set
-------------------------------------------------------------------]]
function COEOptionActiveSetClick()
	COE_Config:ActivateSet( this.value );

	-- reset set cycle
	-- ----------------
	COE_Totem:ResetSetCycle();
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionCurrentFrameInit

	PURPOSE: Fills the Configure Bar combo box
-------------------------------------------------------------------]]
function COEOptionCurrentFrameInit()
	for i = 1, getn( COEUI_CURRENTFRAME ) do
		UIDropDownMenu_AddButton( { text = COEUI_CURRENTFRAME[ i ], func = COEOptionCurrentFrameClick, value = COE_Element[ i ] } );
	end
	UIDropDownMenu_SetSelectedValue( COE_OptionCurrentFrameCB, COE_Config:GetSaved( COEOPT_CURRENTFRAME ) );
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionCurrentFrameClick()

	PURPOSE: Selects the clicked button and stores the option
-------------------------------------------------------------------]]
function COEOptionCurrentFrameClick()
	UIDropDownMenu_SetSelectedID( COE_OptionCurrentFrameCB, this:GetID() );
	COE_Config:SetOption( COEOPT_CURRENTFRAME, this.value );

	-- show associated options
	-- ------------------------
	UIDropDownMenu_Initialize( COE_OptionDirectionCB, COEOptionDirectionInit );
	UIDropDownMenu_Initialize( COE_OptionFrameModeCB, COEOptionFrameModeInit );
	COEOptionFlexCountShow();
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionDirectionInit

	PURPOSE: Fills the Configure Bar combo box
-------------------------------------------------------------------]]
function COEOptionDirectionInit()
	for i = 1, getn( COEUI_DIRECTION ) do
		UIDropDownMenu_AddButton( { text = COEUI_DIRECTION[ i ], func = COEOptionDirectionClick, value = COE_Direction[ i ] } );
	end
	local dir = COE_TotemBars[ COE_Config:GetSaved( COEOPT_CURRENTFRAME ) ].Direction;
	UIDropDownMenu_SetSelectedValue( COE_OptionDirectionCB, dir );
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionDirectionClick()

	PURPOSE: Selects the clicked button and stores the option
-------------------------------------------------------------------]]
function COEOptionDirectionClick()
	UIDropDownMenu_SetSelectedID( COE_OptionDirectionCB, this:GetID() );
	COE_TotemBars[ COE_Config:GetSaved( COEOPT_CURRENTFRAME ) ].Direction = this.value;

	-- set the frame parameters
	-- -------------------------
	local frame = getglobal( "COE" .. COE_Config:GetSaved( COEOPT_CURRENTFRAME ) .. "Frame" );
	COE_Totem:SetFrameDirection( frame, this.value );
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionFrameModeInit

	PURPOSE: Fills the Frame mode combo box
-------------------------------------------------------------------]]
function COEOptionFrameModeInit()
	for i = 1, getn( COEUI_FRAMEMODE ) do
		UIDropDownMenu_AddButton( { text = COEUI_FRAMEMODE[ i ], func = COEOptionFrameModeClick, value = COE_FrameMode[ i ] } );
	end
	local mode = COE_TotemBars[ COE_Config:GetSaved( COEOPT_CURRENTFRAME ) ].Mode;
	UIDropDownMenu_SetSelectedValue( COE_OptionFrameModeCB, mode );

	-- show the slider if appropriate
	-- -------------------------------
	if (mode == "Flex") then
		COE_OptionFlexCount:Show();
	else
		COE_OptionFlexCount:Hide();
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionFrameModeClick()

	PURPOSE: Selects the clicked button and stores the option
-------------------------------------------------------------------]]
function COEOptionFrameModeClick()
	UIDropDownMenu_SetSelectedID( COE_OptionFrameModeCB, this:GetID() );
	COE_TotemBars[ COE_Config:GetSaved( COEOPT_CURRENTFRAME ) ].Mode = this.value;

	-- set the frame parameters
	-- -------------------------
	local frame = getglobal( "COE" .. COE_Config:GetSaved( COEOPT_CURRENTFRAME ) .. "Frame" );
	frame.Mode = this.value;

	-- show the slider if appropriate
	-- -------------------------------
	if (this.value == "Flex") then
		COE_OptionFlexCount:Show();
	else
		COE_OptionFlexCount:Hide();
	end

	-- force frame update
	-- -------------------
	COE_Totem:UpdateAllFrames();
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionFlexCountShow()

	PURPOSE: Sets the slider texts and values
-------------------------------------------------------------------]]
function COEOptionFlexCountShow()
	local element = COE_Config:GetSaved( COEOPT_CURRENTFRAME );

	-- set values
	-- -----------
	COE_OptionFlexCount:SetMinMaxValues( 1, COE.MaxTotems[ element ] );
	COE_OptionFlexCount:SetValue( COE_TotemBars[ element ].FlexCount );
	COE_OptionFlexCount:SetValueStep( 1 );

	-- set texts
	-- ----------
	getglobal( COE_OptionFlexCount:GetName() .. "Low" ):SetText( 1 );
	getglobal( COE_OptionFlexCount:GetName() .. "High" ):SetText( COE.MaxTotems[ element ] );
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionFlexCountChange()

	PURPOSE: Stores the option and updates the display
-------------------------------------------------------------------]]
function COEOptionFlexCountChange()
	local element = COE_Config:GetSaved( COEOPT_CURRENTFRAME );

	COE_TotemBars[ element ].FlexCount = COE_OptionFlexCount:GetValue();

	-- set the frame parameters
	-- -------------------------
	---@type COE_Totem
	local frame = getglobal( "COE" .. element .. "Frame" );
	frame.FlexCount = COE_TotemBars[ element ].FlexCount;
	COE_Totem:Invalidate( frame, false, true, true );
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionScalingShow()

	PURPOSE: Sets the slider texts and values
-------------------------------------------------------------------]]
function COEOptionScalingShow()
	-- set values
	-- -----------
	COE_OptionScaling:SetMinMaxValues( 0.64, 1.2 );
	COE_OptionScaling:SetValue( COE_Config:GetSaved( COEOPT_SCALING ) );
	COE_OptionScaling:SetValueStep( 0.01 );

	-- set texts
	-- ----------
	getglobal( COE_OptionScaling:GetName() .. "Low" ):SetText( 0.64 );
	getglobal( COE_OptionScaling:GetName() .. "High" ):SetText( 1.2 );
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionScalingChange()

	PURPOSE: Stores the option and updates the display
-------------------------------------------------------------------]]
function COEOptionScalingChange()
	COE_Config:SetOption( COEOPT_SCALING, COE_OptionScaling:GetValue() );
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionNotifyIconDurationShow()

	PURPOSE: Sets the slider texts and values
-------------------------------------------------------------------]]
function COEOptionNotifyIconDurationShow()
	---@type Slider
	local slider = getglobal( "COE_OptionNotifyIconDuration" )

	slider:SetMinMaxValues( 1, 10 );
	slider:SetValue( COE_Config:GetSaved( COEOPT_NOTIFYICONDURATION ) );
	slider:SetValueStep( 1 );

	getglobal( slider:GetName() .. "Low" ):SetText( 1 );
	getglobal( slider:GetName() .. "High" ):SetText( 10 );
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionNotifyIconDurationChange()

	PURPOSE: Stores the option and updates the display
-------------------------------------------------------------------]]
function COEOptionNotifyIconDurationChange()
	---@type Slider
	local slider = getglobal( "COE_OptionNotifyIconDuration" )
	COE_Config:SetOption( COEOPT_NOTIFYICONDURATION, slider:GetValue() );
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionNotifyIconSizeShow()

	PURPOSE: Sets the slider texts and values
-------------------------------------------------------------------]]
function COEOptionNotifyIconSizeShow()
	---@type Slider
	local slider = getglobal( "COE_OptionNotifyIconSize" )

	slider:SetMinMaxValues( 32, 256 );
	slider:SetValue( COE_Config:GetSaved( COEOPT_NOTIFYICONSIZE ) );
	slider:SetValueStep( 8 );

	getglobal( slider:GetName() .. "Low" ):SetText( 32 );
	getglobal( slider:GetName() .. "High" ):SetText( 256 );
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionNotifyIconSizeChange()

	PURPOSE: Stores the option and updates the display
-------------------------------------------------------------------]]
function COEOptionNotifyIconSizeChange()
	---@type Slider
	local slider = getglobal( "COE_OptionNotifyIconSize" )

	if COE_Config:GetSaved( COEOPT_NOTIFYICONSIZE ) ~= slider:GetValue() then
		COE_Config:SetOption( COEOPT_NOTIFYICONSIZE, slider:GetValue() );
		COE.notify_icon.show( COE[ "Shields" ][ "Water" ], true )
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionNotifyIconAlphaShow()

	PURPOSE: Sets the slider texts and values
-------------------------------------------------------------------]]
function COEOptionNotifyIconAlphaShow()
	---@type Slider
	local slider = getglobal( "COE_OptionNotifyIconAlpha" )

	slider:SetMinMaxValues( 0.1, 1 );
	slider:SetValue( COE_Config:GetSaved( COEOPT_NOTIFYICONALPHA ) );
	slider:SetValueStep( 0.1 );

	getglobal( slider:GetName() .. "Low" ):SetText( 0.1 );
	getglobal( slider:GetName() .. "High" ):SetText( 1 );
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionNotifyIconAlphaChange()

	PURPOSE: Stores the option and updates the display
-------------------------------------------------------------------]]
function COEOptionNotifyIconAlphaChange()
	---@type Slider
	local slider = getglobal( "COE_OptionNotifyIconAlpha" )

	if COE_Config:GetSaved( COEOPT_NOTIFYICONALPHA ) ~= slider:GetValue() then
		COE_Config:SetOption( COEOPT_NOTIFYICONALPHA, slider:GetValue() );
		COE.notify_icon.show( COE[ "Shields" ][ "Water" ], true )
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionEnableTimerFrame()

	PURPOSE: Sets the visibility of the timer frame
-------------------------------------------------------------------]]
function COEOptionEnableTimerFrame()
	if (COE_Config:GetSaved( COEOPT_TIMERFRAME ) == 1) then
		COETimerFrame:Show();
	else
		COETimerFrame:Hide();
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionDisplayAlignInit

	PURPOSE: Fills the Display Alignment combo box
-------------------------------------------------------------------]]
function COEOptionDisplayAlignInit()
	for i = 1, getn( COEUI_DISPLAYALIGN ) do
		UIDropDownMenu_AddButton( { text = COEUI_DISPLAYALIGN[ i ], func = COEOptionDisplayAlignClick } );
	end
	UIDropDownMenu_SetSelectedID( COE_OptionDisplayAlignmentCB, COE_Config:GetSaved( COEOPT_DISPLAYALIGN ) );
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionDisplayAlignClick()

	PURPOSE: Selects the clicked button and stores the option
-------------------------------------------------------------------]]
function COEOptionDisplayAlignClick()
	UIDropDownMenu_SetSelectedID( COE_OptionDisplayAlignmentCB, this:GetID() );
	COE_Config:SetOption( COEOPT_DISPLAYALIGN, this:GetID() );
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionOverrideRankInit

	PURPOSE: Fills the Rank 1 modifier combo box
-------------------------------------------------------------------]]
function COEOptionOverrideRankInit()
	for i = 1, getn( COEUI_OVERRIDERANK ) do
		UIDropDownMenu_AddButton( { text = COEUI_OVERRIDERANK[ i ], func = COEOptionOverrideRankClick } );
	end
	UIDropDownMenu_SetSelectedID( COE_OptionOverrideRankCB, COE_Config:GetSaved( COEOPT_OVERRIDERANK ) );
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionOverrideRankClick()

	PURPOSE: Selects the clicked button and stores the option
-------------------------------------------------------------------]]
function COEOptionOverrideRankClick()
	UIDropDownMenu_SetSelectedID( COE_OptionOverrideRankCB, this:GetID() );
	COE_Config:SetOption( COEOPT_OVERRIDERANK, this:GetID() );
end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionGroupBars()

	PURPOSE: Stores the relative frame positions when enabled
-------------------------------------------------------------------]]
function COEOptionGroupBars()
	if (COE_Config:GetSaved( COEOPT_GROUPBARS ) == 1) then
		COE_Totem:UpdateFrameCoordinates();
	end
end

--[[ =============================================================================================

									T O T E M   S E T S

================================================================================================]]

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:ActivateSet

	PURPOSE: Activates the specified set and shows its options
-------------------------------------------------------------------]]
function COE_Config:ActivateSet( index )
	-- save setting
	-- -------------
	COE_Config:SetOption( COEOPT_ACTIVESET, index );

	-- update drop down
	-- -----------------
	UIDropDownMenu_Initialize( COE_OptionActiveSetCB, COE_Config.Options[ COEOPT_ACTIVESET ].InitFunc );

	-- update cast order
	-- ------------------
	local set
	if (index <= COESET_DEFAULT) then
		set = COE_SavedTotemSets[ index ];
	else
		set = COE_CustomTotemSets[ index - COESET_DEFAULT ];
	end

	for i = 1, 4 do
		getglobal( "COE_OptionCastOrder" .. i .. "Text" ):SetText( set.CastOrder[ i ] );
	end

	-- reconfigure totem bar
	-- ----------------------
	COE_Totem:Invalidate( COEEarthFrame, true, true, true );
	COE_Totem:Invalidate( COEFireFrame, true, true, true );
	COE_Totem:Invalidate( COEWaterFrame, true, true, true );
	COE_Totem:Invalidate( COEAirFrame, true, true, true );
	COETotemFrame.Reconfigure = true;
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:SetSetButtonStates

	PURPOSE: Sets the availablitity of the options in the totem
		sets sup panel
-------------------------------------------------------------------]]
function COE_Config:SetSetButtonStates()
	-- set button states
	-- ------------------
	if (UIDropDownMenu_GetSelectedValue( COE_OptionActiveSetCB ) <= COESET_DEFAULT) then
		-- set not removable
		-- ------------------
		COE_OptionDeleteSet:Disable();
	else
		-- set is removable
		-- -----------------
		COE_OptionDeleteSet:Enable();
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:NewSetTextChanged

	PURPOSE: Enabled the New Set button only if text is entered
-------------------------------------------------------------------]]
function COE_Config:NewSetTextChanged()
	if (this:GetText() ~= "") then
		COE_OptionNewSet:Enable();
	else
		COE_OptionNewSet:Disable();
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:NewTotemSet

	PURPOSE: Creates a new totem set with the specified name
-------------------------------------------------------------------]]
function COE_Config:NewTotemSet()
	COE_OptionSetName:ClearFocus();

	local name = COE_OptionSetName:GetText();
	if (name and name ~= "") then
		local setcount = getn( COE_CustomTotemSets );

		-- create new set
		-- ---------------
		table.insert( COE_CustomTotemSets, {
			Name = name,
			Earth = "",
			Fire = "",
			Water = "",
			Air = "",
			CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR }
		} );

		-- activate set
		-- -------------
		COE_Config:ActivateSet( COESET_DEFAULT + setcount + 1 );

		-- rescan totem sets
		-- ------------------
		COE:InitTotemSets();

		-- clear the edit box
		-- -------------------
		COE_OptionSetName:SetText( "" );
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:DeleteTotemSet

	PURPOSE: Deletes the current custom set
-------------------------------------------------------------------]]
function COE_Config:DeleteTotemSet()
	local set = UIDropDownMenu_GetSelectedValue( COE_OptionActiveSetCB );

	if (set <= COESET_DEFAULT) then
		return;
	end

	set = set - COESET_DEFAULT;

	-- delete set
	-- -----------
	table.remove( COE_CustomTotemSets, set );

	-- set default set as active
	-- --------------------------
	COE_Config:ActivateSet( COESET_DEFAULT );

	-- rescan totem sets
	-- ------------------
	COE:InitTotemSets();
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:ConfigureSet

	PURPOSE: Switches between set configuration modes
-------------------------------------------------------------------]]
function COE_Config:ConfigureSet( mode )
	if (mode == nil) then
		mode = not COE.ConfigureSetsMode;
	end

	if (mode) then
		COE_Config:ConfigureBar( false );
		COE_Config:ConfigureOrder( false );
		COE.ConfigureSetsMode = true;
		COE_OptionConfigureSet:SetText( COEUI_STRINGS[ "COE_OptionStopConfigureSet" ] );
	else
		COE.ConfigureSetsMode = false;
		COE_OptionConfigureSet:SetText( COEUI_STRINGS[ "COE_OptionConfigureSet" ] );
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:DoCastOrder

	PURPOSE: Increases or decreases the cast order of the
		associated element in this set depending on the
		direction parameter (up/down)
-------------------------------------------------------------------]]
function COE_Config:DoCastOrder( up )
	-- get id first
	-- -------------
	local id = this:GetParent():GetID();

	-- already the first/last element?
	-- --------------------------------
	if ((up and id == 1) or (not up and id == 4)) then
		return;
	end

	-- get the other element id
	-- -------------------------
	local otherid;
	if (up) then
		otherid = id - 1;
	else
		otherid = id + 1;
	end

	--=======================================
	-- swap element with the next one
	--=======================================

	local activeset = COE_Config:GetSaved( COEOPT_ACTIVESET );
	local swap;

	-- swap in internal set
	-- since the cast order is stored by reference
	-- in the saved set, we only need to swap it here
	-- -----------------------------------------------
	swap = COE.TotemSets[ activeset ].CastOrder[ otherid ];
	COE.TotemSets[ activeset ].CastOrder[ otherid ] = COE.TotemSets[ activeset ].CastOrder[ id ];
	COE.TotemSets[ activeset ].CastOrder[ id ] = swap;

	-- swap labels
	-- ------------
	local thistext = getglobal( "COE_OptionCastOrder" .. id .. "Text" );
	local othertext = getglobal( "COE_OptionCastOrder" .. otherid .. "Text" );

	swap = othertext:GetText();
	othertext:SetText( thistext:GetText() );
	thistext:SetText( swap );
end

--[[ =============================================================================================

										L O G I C

================================================================================================]]

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:RegisterOption

	PURPOSE: Registers a checkbox or combobox for the configuration
		dialog along with function to be executed and saved
		variables

	PARAMS:	id			- id of the frame (the unique option id)
			type		- 'check', 'combo' or 'slider'
			func		- function pointer for OnClick or OnChange
			value		- initial value (saved variable)
			initfunc	- function pointer for combobox initialization
						  / slider show
			skip		- if true, the option is not saved
-------------------------------------------------------------------]]
function COE_Config:RegisterOption( id, type, func, value, initfunc, skip )
	-- check if the type is valid
	-- ---------------------------
	if (type ~= 'check' and type ~= 'combo' and type ~= 'slider' and type ~= 'editbox') then
		return;
	end

	-- store option
	-- -------------
	COE_Config.Options[ id ] = { Type = type, Func = func, InitFunc = initfunc };

	-- store saved variable
	-- ---------------------
	if (not skip) then
		COE_Saved[ id ] = value;
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:SetOption

	PURPOSE: Stores the new value in the options and saved
		variables table
-------------------------------------------------------------------]]
function COE_Config:SetOption( id, value )
	COE_Saved[ id ] = value;
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:GetSaved

	PURPOSE: Retrieves the value from the saved variables or uses
		the default value if it cannot find it there
-------------------------------------------------------------------]]
function COE_Config:GetSaved( id )
	if (COE_Saved[ id ]) then
		return COE_Saved[ id ];
	elseif (COE_Config.Defaults[ id ]) then
		return COE_Config.Defaults[ id ];
	else
		return nil;
	end
end

function COE_Config:pfUISkin()
	pfUI.api.StripTextures( COE_ConfigFrame, nil, "BACKGROUND" )
	pfUI.api.CreateBackdrop( COE_ConfigFrame, nil, true )

	for _, e in { "COE_ConfigTotemTotemBarPanel", "COE_ConfigTotemTotemSetsPanel", "COE_ConfigTotemTotemOptionsPanel", "COE_ConfigTotemNotificationsPanel" } do
		local frame = getglobal( e )
		pfUI.api.StripTextures( frame, nil, "BACKGROUND" )
		pfUI.api.CreateBackdrop( frame, nil, true )
		frame:SetPoint( "TopLeft", 10, -115 )
		frame:SetPoint( "BottomRight", -10, 10 )
	end

	local panel = getglobal( "COE_ConfigTotemTabPanel" )
	pfUI.api.StripTextures( panel, nil, "BACKGROUND" )
	pfUI.api.CreateBackdrop( panel, nil, true )

	getglobal( "COE_ConfigTotemTotemBar" ):SetPoint( "TopLeft", getglobal( "COE_ConfigTotemTabPanelTitleBox" ), "TopLeft", 5, -75 )
	getglobal( "COE_ConfigTotemTotemBar" ):SetWidth( 90 )
	getglobal( "COE_OptionConfigureSet" ):SetPoint( "TopLeft", getglobal( "COE_OptionActiveSet" ), "BottomLeft", 7, -20 )

	-- Skin buttons
	for _, e in { "COE_ConfigTotemTotemBar", "COE_ConfigTotemTotemSets", "COE_ConfigTotemTotemOptions", "COE_ConfigTotemNotifications", "COE_OptionConfigureBar", "COE_OptionConfigureOrder", "COE_ConfigClose",
		"COE_OptionConfigureSet", "COE_OptionDeleteSet", "COE_OptionNewSet",
		"COE_OptionScanTotems", "COE_OptionNotifyIconShow"
	} do
		pfUI.api.SkinButton( getglobal( e ) )
	end

	for _, e in { "COE_OptionFixBar", "COE_OptionGroupBars", "COE_OptionEnableRecallButton", "COE_OptionCtrlClick",
		"COE_OptionEnableSets", "COE_OptionEnableForceSets", "COE_OptionEnableDistanceCheck", "COE_OptionEnableAutoSwitch",
		"COE_OptionEnableTimers", "COE_OptionEnableTimerFrame", "COE_OptionFrameTimersOnly",
		"COE_OptionEnableTimerNotifications", "COE_OptionEnableRecallReminder", "COE_OptionAdvisor", "COE_OptionAdvisorIcon", "COE_OptionWeapon", "COE_OptionWeaponIcon", "COE_OptionShield", "COE_OptionShieldIcon"
	} do
		pfUI.api.SkinCheckbox( getglobal( e ), 25 )
	end

	for _, e in { "COE_OptionAdvisor", "COE_OptionWeapon", "COE_OptionShield" } do
		getglobal( e .. "Icon" ):SetPoint( "TopLeft", getglobal( e ), "BottomLeft", 42, 13 )
	end



	getglobal( "COE_OptionTTAlignment" ):SetPoint( "TopLeft", getglobal( "COE_OptionGroupBars" ), "BottomLeft", -3, -10 )
	getglobal( "COE_OptionActiveSet" ):SetPoint( "TopLeft", getglobal( "COE_OptionEnableAutoSwitch" ), "BottomLeft", -3, -10 )
	getglobal( "COE_OptionDisplayAlignment" ):SetPoint( "TopLeft", getglobal( "COE_OptionFrameTimersOnly" ), "BottomLeft", -3, -10 )

	getglobal( "COE_OptionAdvisorSound" ):SetPoint( "TopLeft", 240, -62 )
	getglobal( "COE_OptionWeaponSound" ):SetPoint( "TopLeft", getglobal( "COE_OptionAdvisorSound" ), "BottomLeft", 0, -14 )
	getglobal( "COE_OptionShieldSound" ):SetPoint( "TopLeft", getglobal( "COE_OptionWeaponSound" ), "BottomLeft", 0, -14 )

	-- Skin dropdowns
	for _, e in { "COE_OptionTTAlignment", "COE_OptionDisplayMode", "COE_OptionCurrentFrame", "COE_OptionDirection", "COE_OptionFrameMode",
		"COE_OptionActiveSet",
		"COE_OptionDisplayAlignment", "COE_OptionOverrideRank",
		"COE_OptionAdvisorSound", "COE_OptionWeaponSound", "COE_OptionShieldSound"
	} do
		local cb = getglobal( e .. "CB" )
		local text = getglobal( e .. "Left" )

		pfUI.api.SkinDropDown( cb )
		UIDropDownMenu_SetWidth( 110, cb )
		text:SetPoint( "Left", cb, "Right", 20 )
	end

	local setname = getglobal( "COE_OptionSetName" )
	pfUI.api.StripTextures( setname, "BACKGROUND" )
	pfUI.api.CreateBackdrop( setname, 5, false )
	setname:SetHeight( 15 )
	setname:SetWidth( 140 )
	setname:SetPoint( "TopLeft", getglobal( "COE_OptionNewSet" ), "TopRight", 15, -8 )

	-- Skin arrow buttons
	for _, e in { "COE_OptionCastOrder1", "COE_OptionCastOrder2", "COE_OptionCastOrder3", "COE_OptionCastOrder4" } do
		pfUI.api.SkinArrowButton( getglobal( e .. "MoveDown" ), "down" )
		pfUI.api.SkinArrowButton( getglobal( e .. "MoveUp" ), "up" )
	end

	getglobal( "COE_OptionShieldChargesString" ):SetPoint( "TopLeft", getglobal( "COE_OptionShield" ), "BottomLeft", 25, -10 )

	local charges = getglobal( "COE_OptionShieldCharges" )
	pfUI.api.StripTextures( charges, "BACKGROUND" )
	pfUI.api.CreateBackdrop( charges, 5, false )
	charges:SetHeight( 15 )
	charges:SetPoint( "TopLeft", 219, -5 )

	-- Skin sliders
	for _, e in { "COE_OptionFlexCount", "COE_OptionScaling", "COE_OptionNotifyIconDuration", "COE_OptionNotifyIconSize", "COE_OptionNotifyIconAlpha" } do
		pfUI.api.SkinSlider( getglobal( e ) )
	end
end
