--[[
    		Fatality-Dark Interface

    Author 4lpaca
    License MIT
    Github httpsgithub.com4lpaca-pinFatality
--]]

-- Export Types --
export type Window = {
	Name string,
	Keybind string  Enum.KeyCode,
	Scale UDim2,
	Expire string
}

export type Loader = {
	Name string,
	Duration number,
	Scale number
}

export type Menu = {
	Name string,
	Icon string,
	AutoFill boolean
}

export type Section = {
	Name string,
	Position string,
	Height number,
}

export type Listbox = {
	Name string,
	Option boolean,
	Multi boolean,
	Position string,
	Height number,
	Default ValueBase,
	Values {ValueBase},
	Callback (values {ValueBase}) - any
}

export type Elements = {
	AddToggle (self,Config Toggle) - {
		Option Elements	
	},
	AddSlider (self,Config Slider) - {
		Option Elements	
	},
	AddButton (self,Config Button) - {},
	AddColorPicker (self,Config ColorPicker) - {
		Option Elements	
	},
	AddDropdown (self,Config Dropdown) - {
		Option Elements	
	},
	AddKeybind (self,Config Keybind) - {
		Option Elements	
	},
}

export type Toggle = {
	Name string,
	Default boolean,
	Callback (boolean) - any,
	Risky boolean,
	Option boolean
}

export type Slider = {
	Name string,
	Default number,
	Min number,
	Max number,
	Round number,
	Type string,
	Callback (number) - any,
	Risky boolean,
	Option boolean
}

export type Button = {
	Name string,
	Callback (number) - any,
	Risky boolean,
}

export type ColorPicker = {
	Name string,
	Default Color3,
	Transparency number,
	Callback (number) - any,
	Option boolean
}

export type Dropdown = {
	Name string,
	Default string  {string},
	Values {string},
	Callback (string  {string}) - any,
	Option boolean,
	Multi boolean,
	AutoUpdate boolean
}

export type Keybind = {
	Name string,
	Default string  Enum.KeyCode,
	Callback (string) - any,
	Option boolean,
}

export type Notify = {
	Title string,
	Content string,
	Duration number,
	Icon string
}

export type Notifier = {
	Notify (self, Config Notify) - nil
}

-- Exploit Environments --
cloneref = cloneref or function(i) return i; end;
clonefunction = clonefunction or function(...) return ...; end;
hookfunction = hookfunction or function(a,b) return a; end;
getgenv = getgenv or getfenv;
protect_gui = protect_gui or protectgui or (syn and syn.protect_gui) or function() end;
getgenv().LPH_NO_VIRTUALIZE = LPH_NO_VIRTUALIZE or function(f) return f end;

-- Services --
local TextService = cloneref(gameGetService('TextService'));
local TweenService = cloneref(gameGetService('TweenService'));
local RunService = cloneref(gameGetService('RunService'));
local Players = cloneref(gameGetService('Players'));
local UserInputService = cloneref(gameGetService('UserInputService'));
local Client = Players.LocalPlayer;
local Mouse = ClientGetMouse();
local CurrentCamera = workspace.CurrentCamera;
local _,CoreGui = xpcall(function()
	return (gethui and gethui()) or gameGetService(CoreGui)FindFirstChild(RobloxGui);
end,function()
	return Client.PlayerGui;
end);

-- Fatality --
local Fatality = {};

Fatality.Ascii = qwertyuiopasdfghjklzxcvbnmQWRTYUIOPASDFGHJKLZXCVBNM;
Fatality.GLOBAL_ENVIRONMENT = {};
Fatality.Windows = {};
Fatality.FontSemiBold = Font.new('rbxassetfontsfamiliesGothamSSm.json',Enum.FontWeight.SemiBold,Enum.FontStyle.Normal);
Fatality.Flags = {};
Fatality.Version = '1.5';
Fatality.Lucide = {
	[lucide-accessibility] = rbxassetid10709751939,
	[lucide-activity] = rbxassetid10709752035,
	[lucide-air-vent] = rbxassetid10709752131,
	[lucide-airplay] = rbxassetid10709752254,
	[lucide-alarm-check] = rbxassetid10709752405,
	[lucide-alarm-clock] = rbxassetid10709752630,
	[lucide-alarm-clock-off] = rbxassetid10709752508,
	[lucide-alarm-minus] = rbxassetid10709752732,
	[lucide-alarm-plus] = rbxassetid10709752825,
	[lucide-album] = rbxassetid10709752906,
	[lucide-alert-circle] = rbxassetid10709752996,
	[lucide-alert-octagon] = rbxassetid10709753064,
	[lucide-alert-triangle] = rbxassetid10709753149,
	[lucide-align-center] = rbxassetid10709753570,
	[lucide-align-center-horizontal] = rbxassetid10709753272,
	[lucide-align-center-vertical] = rbxassetid10709753421,
	[lucide-align-end-horizontal] = rbxassetid10709753692,
	[lucide-align-end-vertical] = rbxassetid10709753808,
	[lucide-align-horizontal-distribute-center] = rbxassetid10747779791,
	[lucide-align-horizontal-distribute-end] = rbxassetid10747784534,
	[lucide-align-horizontal-distribute-start] = rbxassetid10709754118,
	[lucide-align-horizontal-justify-center] = rbxassetid10709754204,
	[lucide-align-horizontal-justify-end] = rbxassetid10709754317,
	[lucide-align-horizontal-justify-start] = rbxassetid10709754436,
	[lucide-align-horizontal-space-around] = rbxassetid10709754590,
	[lucide-align-horizontal-space-between] = rbxassetid10709754749,
	[lucide-align-justify] = rbxassetid10709759610,
	[lucide-align-left] = rbxassetid10709759764,
	[lucide-align-right] = rbxassetid10709759895,
	[lucide-align-start-horizontal] = rbxassetid10709760051,
	[lucide-align-start-vertical] = rbxassetid10709760244,
	[lucide-align-vertical-distribute-center] = rbxassetid10709760351,
	[lucide-align-vertical-distribute-end] = rbxassetid10709760434,
	[lucide-align-vertical-distribute-start] = rbxassetid10709760612,
	[lucide-align-vertical-justify-center] = rbxassetid10709760814,
	[lucide-align-vertical-justify-end] = rbxassetid10709761003,
	[lucide-align-vertical-justify-start] = rbxassetid10709761176,
	[lucide-align-vertical-space-around] = rbxassetid10709761324,
	[lucide-align-vertical-space-between] = rbxassetid10709761434,
	[lucide-anchor] = rbxassetid10709761530,
	[lucide-angry] = rbxassetid10709761629,
	[lucide-annoyed] = rbxassetid10709761722,
	[lucide-aperture] = rbxassetid10709761813,
	[lucide-apple] = rbxassetid10709761889,
	[lucide-archive] = rbxassetid10709762233,
	[lucide-archive-restore] = rbxassetid10709762058,
	[lucide-armchair] = rbxassetid10709762327,
	[lucide-arrow-big-down] = rbxassetid10747796644,
	[lucide-arrow-big-left] = rbxassetid10709762574,
	[lucide-arrow-big-right] = rbxassetid10709762727,
	[lucide-arrow-big-up] = rbxassetid10709762879,
	[lucide-arrow-down] = rbxassetid10709767827,
	[lucide-arrow-down-circle] = rbxassetid10709763034,
	[lucide-arrow-down-left] = rbxassetid10709767656,
	[lucide-arrow-down-right] = rbxassetid10709767750,
	[lucide-arrow-left] = rbxassetid10709768114,
	[lucide-arrow-left-circle] = rbxassetid10709767936,
	[lucide-arrow-left-right] = rbxassetid10709768019,
	[lucide-arrow-right] = rbxassetid10709768347,
	[lucide-arrow-right-circle] = rbxassetid10709768226,
	[lucide-arrow-up] = rbxassetid10709768939,
	[lucide-arrow-up-circle] = rbxassetid10709768432,
	[lucide-arrow-up-down] = rbxassetid10709768538,
	[lucide-arrow-up-left] = rbxassetid10709768661,
	[lucide-arrow-up-right] = rbxassetid10709768787,
	[lucide-asterisk] = rbxassetid10709769095,
	[lucide-at-sign] = rbxassetid10709769286,
	[lucide-award] = rbxassetid10709769406,
	[lucide-axe] = rbxassetid10709769508,
	[lucide-axis-3d] = rbxassetid10709769598,
	[lucide-baby] = rbxassetid10709769732,
	[lucide-backpack] = rbxassetid10709769841,
	[lucide-baggage-claim] = rbxassetid10709769935,
	[lucide-banana] = rbxassetid10709770005,
	[lucide-banknote] = rbxassetid10709770178,
	[lucide-bar-chart] = rbxassetid10709773755,
	[lucide-bar-chart-2] = rbxassetid10709770317,
	[lucide-bar-chart-3] = rbxassetid10709770431,
	[lucide-bar-chart-4] = rbxassetid10709770560,
	[lucide-bar-chart-horizontal] = rbxassetid10709773669,
	[lucide-barcode] = rbxassetid10747360675,
	[lucide-baseline] = rbxassetid10709773863,
	[lucide-bath] = rbxassetid10709773963,
	[lucide-battery] = rbxassetid10709774640,
	[lucide-battery-charging] = rbxassetid10709774068,
	[lucide-battery-full] = rbxassetid10709774206,
	[lucide-battery-low] = rbxassetid10709774370,
	[lucide-battery-medium] = rbxassetid10709774513,
	[lucide-beaker] = rbxassetid10709774756,
	[lucide-bed] = rbxassetid10709775036,
	[lucide-bed-double] = rbxassetid10709774864,
	[lucide-bed-single] = rbxassetid10709774968,
	[lucide-beer] = rbxassetid10709775167,
	[lucide-bell] = rbxassetid10709775704,
	[lucide-bell-minus] = rbxassetid10709775241,
	[lucide-bell-off] = rbxassetid10709775320,
	[lucide-bell-plus] = rbxassetid10709775448,
	[lucide-bell-ring] = rbxassetid10709775560,
	[lucide-bike] = rbxassetid10709775894,
	[lucide-binary] = rbxassetid10709776050,
	[lucide-bitcoin] = rbxassetid10709776126,
	[lucide-bluetooth] = rbxassetid10709776655,
	[lucide-bluetooth-connected] = rbxassetid10709776240,
	[lucide-bluetooth-off] = rbxassetid10709776344,
	[lucide-bluetooth-searching] = rbxassetid10709776501,
	[lucide-bold] = rbxassetid10747813908,
	[lucide-bomb] = rbxassetid10709781460,
	[lucide-bone] = rbxassetid10709781605,
	[lucide-book] = rbxassetid10709781824,
	[lucide-book-open] = rbxassetid10709781717,
	[lucide-bookmark] = rbxassetid10709782154,
	[lucide-bookmark-minus] = rbxassetid10709781919,
	[lucide-bookmark-plus] = rbxassetid10709782044,
	[lucide-bot] = rbxassetid10709782230,
	[lucide-box] = rbxassetid10709782497,
	[lucide-box-select] = rbxassetid10709782342,
	[lucide-boxes] = rbxassetid10709782582,
	[lucide-briefcase] = rbxassetid10709782662,
	[lucide-brush] = rbxassetid10709782758,
	[lucide-bug] = rbxassetid10709782845,
	[lucide-building] = rbxassetid10709783051,
	[lucide-building-2] = rbxassetid10709782939,
	[lucide-bus] = rbxassetid10709783137,
	[lucide-cake] = rbxassetid10709783217,
	[lucide-calculator] = rbxassetid10709783311,
	[lucide-calendar] = rbxassetid10709789505,
	[lucide-calendar-check] = rbxassetid10709783474,
	[lucide-calendar-check-2] = rbxassetid10709783392,
	[lucide-calendar-clock] = rbxassetid10709783577,
	[lucide-calendar-days] = rbxassetid10709783673,
	[lucide-calendar-heart] = rbxassetid10709783835,
	[lucide-calendar-minus] = rbxassetid10709783959,
	[lucide-calendar-off] = rbxassetid10709788784,
	[lucide-calendar-plus] = rbxassetid10709788937,
	[lucide-calendar-range] = rbxassetid10709789053,
	[lucide-calendar-search] = rbxassetid10709789200,
	[lucide-calendar-x] = rbxassetid10709789407,
	[lucide-calendar-x-2] = rbxassetid10709789329,
	[lucide-camera] = rbxassetid10709789686,
	[lucide-camera-off] = rbxassetid10747822677,
	[lucide-car] = rbxassetid10709789810,
	[lucide-carrot] = rbxassetid10709789960,
	[lucide-cast] = rbxassetid10709790097,
	[lucide-charge] = rbxassetid10709790202,
	[lucide-check] = rbxassetid10709790644,
	[lucide-check-circle] = rbxassetid10709790387,
	[lucide-check-circle-2] = rbxassetid10709790298,
	[lucide-check-square] = rbxassetid10709790537,
	[lucide-chef-hat] = rbxassetid10709790757,
	[lucide-cherry] = rbxassetid10709790875,
	[lucide-chevron-down] = rbxassetid10709790948,
	[lucide-chevron-first] = rbxassetid10709791015,
	[lucide-chevron-last] = rbxassetid10709791130,
	[lucide-chevron-left] = rbxassetid10709791281,
	[lucide-chevron-right] = rbxassetid10709791437,
	[lucide-chevron-up] = rbxassetid10709791523,
	[lucide-chevrons-down] = rbxassetid10709796864,
	[lucide-chevrons-down-up] = rbxassetid10709791632,
	[lucide-chevrons-left] = rbxassetid10709797151,
	[lucide-chevrons-left-right] = rbxassetid10709797006,
	[lucide-chevrons-right] = rbxassetid10709797382,
	[lucide-chevrons-right-left] = rbxassetid10709797274,
	[lucide-chevrons-up] = rbxassetid10709797622,
	[lucide-chevrons-up-down] = rbxassetid10709797508,
	[lucide-chrome] = rbxassetid10709797725,
	[lucide-circle] = rbxassetid10709798174,
	[lucide-circle-dot] = rbxassetid10709797837,
	[lucide-circle-ellipsis] = rbxassetid10709797985,
	[lucide-circle-slashed] = rbxassetid10709798100,
	[lucide-citrus] = rbxassetid10709798276,
	[lucide-clapperboard] = rbxassetid10709798350,
	[lucide-clipboard] = rbxassetid10709799288,
	[lucide-clipboard-check] = rbxassetid10709798443,
	[lucide-clipboard-copy] = rbxassetid10709798574,
	[lucide-clipboard-edit] = rbxassetid10709798682,
	[lucide-clipboard-list] = rbxassetid10709798792,
	[lucide-clipboard-signature] = rbxassetid10709798890,
	[lucide-clipboard-type] = rbxassetid10709798999,
	[lucide-clipboard-x] = rbxassetid10709799124,
	[lucide-clock] = rbxassetid10709805144,
	[lucide-clock-1] = rbxassetid10709799535,
	[lucide-clock-10] = rbxassetid10709799718,
	[lucide-clock-11] = rbxassetid10709799818,
	[lucide-clock-12] = rbxassetid10709799962,
	[lucide-clock-2] = rbxassetid10709803876,
	[lucide-clock-3] = rbxassetid10709803989,
	[lucide-clock-4] = rbxassetid10709804164,
	[lucide-clock-5] = rbxassetid10709804291,
	[lucide-clock-6] = rbxassetid10709804435,
	[lucide-clock-7] = rbxassetid10709804599,
	[lucide-clock-8] = rbxassetid10709804784,
	[lucide-clock-9] = rbxassetid10709804996,
	[lucide-cloud] = rbxassetid10709806740,
	[lucide-cloud-cog] = rbxassetid10709805262,
	[lucide-cloud-drizzle] = rbxassetid10709805371,
	[lucide-cloud-fog] = rbxassetid10709805477,
	[lucide-cloud-hail] = rbxassetid10709805596,
	[lucide-cloud-lightning] = rbxassetid10709805727,
	[lucide-cloud-moon] = rbxassetid10709805942,
	[lucide-cloud-moon-rain] = rbxassetid10709805838,
	[lucide-cloud-off] = rbxassetid10709806060,
	[lucide-cloud-rain] = rbxassetid10709806277,
	[lucide-cloud-rain-wind] = rbxassetid10709806166,
	[lucide-cloud-snow] = rbxassetid10709806374,
	[lucide-cloud-sun] = rbxassetid10709806631,
	[lucide-cloud-sun-rain] = rbxassetid10709806475,
	[lucide-cloudy] = rbxassetid10709806859,
	[lucide-clover] = rbxassetid10709806995,
	[lucide-code] = rbxassetid10709810463,
	[lucide-code-2] = rbxassetid10709807111,
	[lucide-codepen] = rbxassetid10709810534,
	[lucide-codesandbox] = rbxassetid10709810676,
	[lucide-coffee] = rbxassetid10709810814,
	[lucide-cog] = rbxassetid10709810948,
	[lucide-coins] = rbxassetid10709811110,
	[lucide-columns] = rbxassetid10709811261,
	[lucide-command] = rbxassetid10709811365,
	[lucide-compass] = rbxassetid10709811445,
	[lucide-component] = rbxassetid10709811595,
	[lucide-concierge-bell] = rbxassetid10709811706,
	[lucide-connection] = rbxassetid10747361219,
	[lucide-contact] = rbxassetid10709811834,
	[lucide-contrast] = rbxassetid10709811939,
	[lucide-cookie] = rbxassetid10709812067,
	[lucide-copy] = rbxassetid10709812159,
	[lucide-copyleft] = rbxassetid10709812251,
	[lucide-copyright] = rbxassetid10709812311,
	[lucide-corner-down-left] = rbxassetid10709812396,
	[lucide-corner-down-right] = rbxassetid10709812485,
	[lucide-corner-left-down] = rbxassetid10709812632,
	[lucide-corner-left-up] = rbxassetid10709812784,
	[lucide-corner-right-down] = rbxassetid10709812939,
	[lucide-corner-right-up] = rbxassetid10709813094,
	[lucide-corner-up-left] = rbxassetid10709813185,
	[lucide-corner-up-right] = rbxassetid10709813281,
	[lucide-cpu] = rbxassetid10709813383,
	[lucide-croissant] = rbxassetid10709818125,
	[lucide-crop] = rbxassetid10709818245,
	[lucide-cross] = rbxassetid10709818399,
	[lucide-crosshair] = rbxassetid10709818534,
	[lucide-crown] = rbxassetid10709818626,
	[lucide-cup-soda] = rbxassetid10709818763,
	[lucide-curly-braces] = rbxassetid10709818847,
	[lucide-currency] = rbxassetid10709818931,
	[lucide-database] = rbxassetid10709818996,
	[lucide-delete] = rbxassetid10709819059,
	[lucide-diamond] = rbxassetid10709819149,
	[lucide-dice-1] = rbxassetid10709819266,
	[lucide-dice-2] = rbxassetid10709819361,
	[lucide-dice-3] = rbxassetid10709819508,
	[lucide-dice-4] = rbxassetid10709819670,
	[lucide-dice-5] = rbxassetid10709819801,
	[lucide-dice-6] = rbxassetid10709819896,
	[lucide-dices] = rbxassetid10723343321,
	[lucide-diff] = rbxassetid10723343416,
	[lucide-disc] = rbxassetid10723343537,
	[lucide-divide] = rbxassetid10723343805,
	[lucide-divide-circle] = rbxassetid10723343636,
	[lucide-divide-square] = rbxassetid10723343737,
	[lucide-dollar-sign] = rbxassetid10723343958,
	[lucide-download] = rbxassetid10723344270,
	[lucide-download-cloud] = rbxassetid10723344088,
	[lucide-droplet] = rbxassetid10723344432,
	[lucide-droplets] = rbxassetid10734883356,
	[lucide-drumstick] = rbxassetid10723344737,
	[lucide-edit] = rbxassetid10734883598,
	[lucide-edit-2] = rbxassetid10723344885,
	[lucide-edit-3] = rbxassetid10723345088,
	[lucide-egg] = rbxassetid10723345518,
	[lucide-egg-fried] = rbxassetid10723345347,
	[lucide-electricity] = rbxassetid10723345749,
	[lucide-electricity-off] = rbxassetid10723345643,
	[lucide-equal] = rbxassetid10723345990,
	[lucide-equal-not] = rbxassetid10723345866,
	[lucide-eraser] = rbxassetid10723346158,
	[lucide-euro] = rbxassetid10723346372,
	[lucide-expand] = rbxassetid10723346553,
	[lucide-external-link] = rbxassetid10723346684,
	[lucide-eye] = rbxassetid10723346959,
	[lucide-eye-off] = rbxassetid10723346871,
	[lucide-factory] = rbxassetid10723347051,
	[lucide-fan] = rbxassetid10723354359,
	[lucide-fast-forward] = rbxassetid10723354521,
	[lucide-feather] = rbxassetid10723354671,
	[lucide-figma] = rbxassetid10723354801,
	[lucide-file] = rbxassetid10723374641,
	[lucide-file-archive] = rbxassetid10723354921,
	[lucide-file-audio] = rbxassetid10723355148,
	[lucide-file-audio-2] = rbxassetid10723355026,
	[lucide-file-axis-3d] = rbxassetid10723355272,
	[lucide-file-badge] = rbxassetid10723355622,
	[lucide-file-badge-2] = rbxassetid10723355451,
	[lucide-file-bar-chart] = rbxassetid10723355887,
	[lucide-file-bar-chart-2] = rbxassetid10723355746,
	[lucide-file-box] = rbxassetid10723355989,
	[lucide-file-check] = rbxassetid10723356210,
	[lucide-file-check-2] = rbxassetid10723356100,
	[lucide-file-clock] = rbxassetid10723356329,
	[lucide-file-code] = rbxassetid10723356507,
	[lucide-file-cog] = rbxassetid10723356830,
	[lucide-file-cog-2] = rbxassetid10723356676,
	[lucide-file-diff] = rbxassetid10723357039,
	[lucide-file-digit] = rbxassetid10723357151,
	[lucide-file-down] = rbxassetid10723357322,
	[lucide-file-edit] = rbxassetid10723357495,
	[lucide-file-heart] = rbxassetid10723357637,
	[lucide-file-image] = rbxassetid10723357790,
	[lucide-file-input] = rbxassetid10723357933,
	[lucide-file-json] = rbxassetid10723364435,
	[lucide-file-json-2] = rbxassetid10723364361,
	[lucide-file-key] = rbxassetid10723364605,
	[lucide-file-key-2] = rbxassetid10723364515,
	[lucide-file-line-chart] = rbxassetid10723364725,
	[lucide-file-lock] = rbxassetid10723364957,
	[lucide-file-lock-2] = rbxassetid10723364861,
	[lucide-file-minus] = rbxassetid10723365254,
	[lucide-file-minus-2] = rbxassetid10723365086,
	[lucide-file-output] = rbxassetid10723365457,
	[lucide-file-pie-chart] = rbxassetid10723365598,
	[lucide-file-plus] = rbxassetid10723365877,
	[lucide-file-plus-2] = rbxassetid10723365766,
	[lucide-file-question] = rbxassetid10723365987,
	[lucide-file-scan] = rbxassetid10723366167,
	[lucide-file-search] = rbxassetid10723366550,
	[lucide-file-search-2] = rbxassetid10723366340,
	[lucide-file-signature] = rbxassetid10723366741,
	[lucide-file-spreadsheet] = rbxassetid10723366962,
	[lucide-file-symlink] = rbxassetid10723367098,
	[lucide-file-terminal] = rbxassetid10723367244,
	[lucide-file-text] = rbxassetid10723367380,
	[lucide-file-type] = rbxassetid10723367606,
	[lucide-file-type-2] = rbxassetid10723367509,
	[lucide-file-up] = rbxassetid10723367734,
	[lucide-file-video] = rbxassetid10723373884,
	[lucide-file-video-2] = rbxassetid10723367834,
	[lucide-file-volume] = rbxassetid10723374172,
	[lucide-file-volume-2] = rbxassetid10723374030,
	[lucide-file-warning] = rbxassetid10723374276,
	[lucide-file-x] = rbxassetid10723374544,
	[lucide-file-x-2] = rbxassetid10723374378,
	[lucide-files] = rbxassetid10723374759,
	[lucide-film] = rbxassetid10723374981,
	[lucide-filter] = rbxassetid10723375128,
	[lucide-fingerprint] = rbxassetid10723375250,
	[lucide-flag] = rbxassetid10723375890,
	[lucide-flag-off] = rbxassetid10723375443,
	[lucide-flag-triangle-left] = rbxassetid10723375608,
	[lucide-flag-triangle-right] = rbxassetid10723375727,
	[lucide-flame] = rbxassetid10723376114,
	[lucide-flashlight] = rbxassetid10723376471,
	[lucide-flashlight-off] = rbxassetid10723376365,
	[lucide-flask-conical] = rbxassetid10734883986,
	[lucide-flask-round] = rbxassetid10723376614,
	[lucide-flip-horizontal] = rbxassetid10723376884,
	[lucide-flip-horizontal-2] = rbxassetid10723376745,
	[lucide-flip-vertical] = rbxassetid10723377138,
	[lucide-flip-vertical-2] = rbxassetid10723377026,
	[lucide-flower] = rbxassetid10747830374,
	[lucide-flower-2] = rbxassetid10723377305,
	[lucide-focus] = rbxassetid10723377537,
	[lucide-folder] = rbxassetid10723387563,
	[lucide-folder-archive] = rbxassetid10723384478,
	[lucide-folder-check] = rbxassetid10723384605,
	[lucide-folder-clock] = rbxassetid10723384731,
	[lucide-folder-closed] = rbxassetid10723384893,
	[lucide-folder-cog] = rbxassetid10723385213,
	[lucide-folder-cog-2] = rbxassetid10723385036,
	[lucide-folder-down] = rbxassetid10723385338,
	[lucide-folder-edit] = rbxassetid10723385445,
	[lucide-folder-heart] = rbxassetid10723385545,
	[lucide-folder-input] = rbxassetid10723385721,
	[lucide-folder-key] = rbxassetid10723385848,
	[lucide-folder-lock] = rbxassetid10723386005,
	[lucide-folder-minus] = rbxassetid10723386127,
	[lucide-folder-open] = rbxassetid10723386277,
	[lucide-folder-output] = rbxassetid10723386386,
	[lucide-folder-plus] = rbxassetid10723386531,
	[lucide-folder-search] = rbxassetid10723386787,
	[lucide-folder-search-2] = rbxassetid10723386674,
	[lucide-folder-symlink] = rbxassetid10723386930,
	[lucide-folder-tree] = rbxassetid10723387085,
	[lucide-folder-up] = rbxassetid10723387265,
	[lucide-folder-x] = rbxassetid10723387448,
	[lucide-folders] = rbxassetid10723387721,
	[lucide-form-input] = rbxassetid10723387841,
	[lucide-forward] = rbxassetid10723388016,
	[lucide-frame] = rbxassetid10723394389,
	[lucide-framer] = rbxassetid10723394565,
	[lucide-frown] = rbxassetid10723394681,
	[lucide-fuel] = rbxassetid10723394846,
	[lucide-function-square] = rbxassetid10723395041,
	[lucide-gamepad] = rbxassetid10723395457,
	[lucide-gamepad-2] = rbxassetid10723395215,
	[lucide-gauge] = rbxassetid10723395708,
	[lucide-gavel] = rbxassetid10723395896,
	[lucide-gem] = rbxassetid10723396000,
	[lucide-ghost] = rbxassetid10723396107,
	[lucide-gift] = rbxassetid10723396402,
	[lucide-gift-card] = rbxassetid10723396225,
	[lucide-git-branch] = rbxassetid10723396676,
	[lucide-git-branch-plus] = rbxassetid10723396542,
	[lucide-git-commit] = rbxassetid10723396812,
	[lucide-git-compare] = rbxassetid10723396954,
	[lucide-git-fork] = rbxassetid10723397049,
	[lucide-git-merge] = rbxassetid10723397165,
	[lucide-git-pull-request] = rbxassetid10723397431,
	[lucide-git-pull-request-closed] = rbxassetid10723397268,
	[lucide-git-pull-request-draft] = rbxassetid10734884302,
	[lucide-glass] = rbxassetid10723397788,
	[lucide-glass-2] = rbxassetid10723397529,
	[lucide-glass-water] = rbxassetid10723397678,
	[lucide-glasses] = rbxassetid10723397895,
	[lucide-globe] = rbxassetid10723404337,
	[lucide-globe-2] = rbxassetid10723398002,
	[lucide-grab] = rbxassetid10723404472,
	[lucide-graduation-cap] = rbxassetid10723404691,
	[lucide-grape] = rbxassetid10723404822,
	[lucide-grid] = rbxassetid10723404936,
	[lucide-grip-horizontal] = rbxassetid10723405089,
	[lucide-grip-vertical] = rbxassetid10723405236,
	[lucide-hammer] = rbxassetid10723405360,
	[lucide-hand] = rbxassetid10723405649,
	[lucide-hand-metal] = rbxassetid10723405508,
	[lucide-hard-drive] = rbxassetid10723405749,
	[lucide-hard-hat] = rbxassetid10723405859,
	[lucide-hash] = rbxassetid10723405975,
	[lucide-haze] = rbxassetid10723406078,
	[lucide-headphones] = rbxassetid10723406165,
	[lucide-heart] = rbxassetid10723406885,
	[lucide-heart-crack] = rbxassetid10723406299,
	[lucide-heart-handshake] = rbxassetid10723406480,
	[lucide-heart-off] = rbxassetid10723406662,
	[lucide-heart-pulse] = rbxassetid10723406795,
	[lucide-help-circle] = rbxassetid10723406988,
	[lucide-hexagon] = rbxassetid10723407092,
	[lucide-highlighter] = rbxassetid10723407192,
	[lucide-history] = rbxassetid10723407335,
	[lucide-home] = rbxassetid10723407389,
	[lucide-hourglass] = rbxassetid10723407498,
	[lucide-ice-cream] = rbxassetid10723414308,
	[lucide-image] = rbxassetid10723415040,
	[lucide-image-minus] = rbxassetid10723414487,
	[lucide-image-off] = rbxassetid10723414677,
	[lucide-image-plus] = rbxassetid10723414827,
	[lucide-import] = rbxassetid10723415205,
	[lucide-inbox] = rbxassetid10723415335,
	[lucide-indent] = rbxassetid10723415494,
	[lucide-indian-rupee] = rbxassetid10723415642,
	[lucide-infinity] = rbxassetid10723415766,
	[lucide-info] = rbxassetid10723415903,
	[lucide-inspect] = rbxassetid10723416057,
	[lucide-italic] = rbxassetid10723416195,
	[lucide-japanese-yen] = rbxassetid10723416363,
	[lucide-joystick] = rbxassetid10723416527,
	[lucide-key] = rbxassetid10723416652,
	[lucide-keyboard] = rbxassetid10723416765,
	[lucide-lamp] = rbxassetid10723417513,
	[lucide-lamp-ceiling] = rbxassetid10723416922,
	[lucide-lamp-desk] = rbxassetid10723417016,
	[lucide-lamp-floor] = rbxassetid10723417131,
	[lucide-lamp-wall-down] = rbxassetid10723417240,
	[lucide-lamp-wall-up] = rbxassetid10723417356,
	[lucide-landmark] = rbxassetid10723417608,
	[lucide-languages] = rbxassetid10723417703,
	[lucide-laptop] = rbxassetid10723423881,
	[lucide-laptop-2] = rbxassetid10723417797,
	[lucide-lasso] = rbxassetid10723424235,
	[lucide-lasso-select] = rbxassetid10723424058,
	[lucide-laugh] = rbxassetid10723424372,
	[lucide-layers] = rbxassetid10723424505,
	[lucide-layout] = rbxassetid10723425376,
	[lucide-layout-dashboard] = rbxassetid10723424646,
	[lucide-layout-grid] = rbxassetid10723424838,
	[lucide-layout-list] = rbxassetid10723424963,
	[lucide-layout-template] = rbxassetid10723425187,
	[lucide-leaf] = rbxassetid10723425539,
	[lucide-library] = rbxassetid10723425615,
	[lucide-life-buoy] = rbxassetid10723425685,
	[lucide-lightbulb] = rbxassetid10723425852,
	[lucide-lightbulb-off] = rbxassetid10723425762,
	[lucide-line-chart] = rbxassetid10723426393,
	[lucide-link] = rbxassetid10723426722,
	[lucide-link-2] = rbxassetid10723426595,
	[lucide-link-2-off] = rbxassetid10723426513,
	[lucide-list] = rbxassetid10723433811,
	[lucide-list-checks] = rbxassetid10734884548,
	[lucide-list-end] = rbxassetid10723426886,
	[lucide-list-minus] = rbxassetid10723426986,
	[lucide-list-music] = rbxassetid10723427081,
	[lucide-list-ordered] = rbxassetid10723427199,
	[lucide-list-plus] = rbxassetid10723427334,
	[lucide-list-start] = rbxassetid10723427494,
	[lucide-list-video] = rbxassetid10723427619,
	[lucide-list-x] = rbxassetid10723433655,
	[lucide-loader] = rbxassetid10723434070,
	[lucide-loader-2] = rbxassetid10723433935,
	[lucide-locate] = rbxassetid10723434557,
	[lucide-locate-fixed] = rbxassetid10723434236,
	[lucide-locate-off] = rbxassetid10723434379,
	[lucide-lock] = rbxassetid10723434711,
	[lucide-log-in] = rbxassetid10723434830,
	[lucide-log-out] = rbxassetid10723434906,
	[lucide-luggage] = rbxassetid10723434993,
	[lucide-magnet] = rbxassetid10723435069,
	[lucide-mail] = rbxassetid10734885430,
	[lucide-mail-check] = rbxassetid10723435182,
	[lucide-mail-minus] = rbxassetid10723435261,
	[lucide-mail-open] = rbxassetid10723435342,
	[lucide-mail-plus] = rbxassetid10723435443,
	[lucide-mail-question] = rbxassetid10723435515,
	[lucide-mail-search] = rbxassetid10734884739,
	[lucide-mail-warning] = rbxassetid10734885015,
	[lucide-mail-x] = rbxassetid10734885247,
	[lucide-mails] = rbxassetid10734885614,
	[lucide-map] = rbxassetid10734886202,
	[lucide-map-pin] = rbxassetid10734886004,
	[lucide-map-pin-off] = rbxassetid10734885803,
	[lucide-maximize] = rbxassetid10734886735,
	[lucide-maximize-2] = rbxassetid10734886496,
	[lucide-medal] = rbxassetid10734887072,
	[lucide-megaphone] = rbxassetid10734887454,
	[lucide-megaphone-off] = rbxassetid10734887311,
	[lucide-meh] = rbxassetid10734887603,
	[lucide-menu] = rbxassetid10734887784,
	[lucide-message-circle] = rbxassetid10734888000,
	[lucide-message-square] = rbxassetid10734888228,
	[lucide-mic] = rbxassetid10734888864,
	[lucide-mic-2] = rbxassetid10734888430,
	[lucide-mic-off] = rbxassetid10734888646,
	[lucide-microscope] = rbxassetid10734889106,
	[lucide-microwave] = rbxassetid10734895076,
	[lucide-milestone] = rbxassetid10734895310,
	[lucide-minimize] = rbxassetid10734895698,
	[lucide-minimize-2] = rbxassetid10734895530,
	[lucide-minus] = rbxassetid10734896206,
	[lucide-minus-circle] = rbxassetid10734895856,
	[lucide-minus-square] = rbxassetid10734896029,
	[lucide-monitor] = rbxassetid10734896881,
	[lucide-monitor-off] = rbxassetid10734896360,
	[lucide-monitor-speaker] = rbxassetid10734896512,
	[lucide-moon] = rbxassetid10734897102,
	[lucide-more-horizontal] = rbxassetid10734897250,
	[lucide-more-vertical] = rbxassetid10734897387,
	[lucide-mountain] = rbxassetid10734897956,
	[lucide-mountain-snow] = rbxassetid10734897665,
	[lucide-mouse] = rbxassetid10734898592,
	[lucide-mouse-pointer] = rbxassetid10734898476,
	[lucide-mouse-pointer-2] = rbxassetid10734898194,
	[lucide-mouse-pointer-click] = rbxassetid10734898355,
	[lucide-move] = rbxassetid10734900011,
	[lucide-move-3d] = rbxassetid10734898756,
	[lucide-move-diagonal] = rbxassetid10734899164,
	[lucide-move-diagonal-2] = rbxassetid10734898934,
	[lucide-move-horizontal] = rbxassetid10734899414,
	[lucide-move-vertical] = rbxassetid10734899821,
	[lucide-music] = rbxassetid10734905958,
	[lucide-music-2] = rbxassetid10734900215,
	[lucide-music-3] = rbxassetid10734905665,
	[lucide-music-4] = rbxassetid10734905823,
	[lucide-navigation] = rbxassetid10734906744,
	[lucide-navigation-2] = rbxassetid10734906332,
	[lucide-navigation-2-off] = rbxassetid10734906144,
	[lucide-navigation-off] = rbxassetid10734906580,
	[lucide-network] = rbxassetid10734906975,
	[lucide-newspaper] = rbxassetid10734907168,
	[lucide-octagon] = rbxassetid10734907361,
	[lucide-option] = rbxassetid10734907649,
	[lucide-outdent] = rbxassetid10734907933,
	[lucide-package] = rbxassetid10734909540,
	[lucide-package-2] = rbxassetid10734908151,
	[lucide-package-check] = rbxassetid10734908384,
	[lucide-package-minus] = rbxassetid10734908626,
	[lucide-package-open] = rbxassetid10734908793,
	[lucide-package-plus] = rbxassetid10734909016,
	[lucide-package-search] = rbxassetid10734909196,
	[lucide-package-x] = rbxassetid10734909375,
	[lucide-paint-bucket] = rbxassetid10734909847,
	[lucide-paintbrush] = rbxassetid10734910187,
	[lucide-paintbrush-2] = rbxassetid10734910030,
	[lucide-palette] = rbxassetid10734910430,
	[lucide-palmtree] = rbxassetid10734910680,
	[lucide-paperclip] = rbxassetid10734910927,
	[lucide-party-popper] = rbxassetid10734918735,
	[lucide-pause] = rbxassetid10734919336,
	[lucide-pause-circle] = rbxassetid10735024209,
	[lucide-pause-octagon] = rbxassetid10734919143,
	[lucide-pen-tool] = rbxassetid10734919503,
	[lucide-pencil] = rbxassetid10734919691,
	[lucide-percent] = rbxassetid10734919919,
	[lucide-person-standing] = rbxassetid10734920149,
	[lucide-phone] = rbxassetid10734921524,
	[lucide-phone-call] = rbxassetid10734920305,
	[lucide-phone-forwarded] = rbxassetid10734920508,
	[lucide-phone-incoming] = rbxassetid10734920694,
	[lucide-phone-missed] = rbxassetid10734920845,
	[lucide-phone-off] = rbxassetid10734921077,
	[lucide-phone-outgoing] = rbxassetid10734921288,
	[lucide-pie-chart] = rbxassetid10734921727,
	[lucide-piggy-bank] = rbxassetid10734921935,
	[lucide-pin] = rbxassetid10734922324,
	[lucide-pin-off] = rbxassetid10734922180,
	[lucide-pipette] = rbxassetid10734922497,
	[lucide-pizza] = rbxassetid10734922774,
	[lucide-plane] = rbxassetid10734922971,
	[lucide-play] = rbxassetid10734923549,
	[lucide-play-circle] = rbxassetid10734923214,
	[lucide-plus] = rbxassetid10734924532,
	[lucide-plus-circle] = rbxassetid10734923868,
	[lucide-plus-square] = rbxassetid10734924219,
	[lucide-podcast] = rbxassetid10734929553,
	[lucide-pointer] = rbxassetid10734929723,
	[lucide-pound-sterling] = rbxassetid10734929981,
	[lucide-power] = rbxassetid10734930466,
	[lucide-power-off] = rbxassetid10734930257,
	[lucide-printer] = rbxassetid10734930632,
	[lucide-puzzle] = rbxassetid10734930886,
	[lucide-quote] = rbxassetid10734931234,
	[lucide-radio] = rbxassetid10734931596,
	[lucide-radio-receiver] = rbxassetid10734931402,
	[lucide-rectangle-horizontal] = rbxassetid10734931777,
	[lucide-rectangle-vertical] = rbxassetid10734932081,
	[lucide-recycle] = rbxassetid10734932295,
	[lucide-redo] = rbxassetid10734932822,
	[lucide-redo-2] = rbxassetid10734932586,
	[lucide-refresh-ccw] = rbxassetid10734933056,
	[lucide-refresh-cw] = rbxassetid10734933222,
	[lucide-refrigerator] = rbxassetid10734933465,
	[lucide-regex] = rbxassetid10734933655,
	[lucide-repeat] = rbxassetid10734933966,
	[lucide-repeat-1] = rbxassetid10734933826,
	[lucide-reply] = rbxassetid10734934252,
	[lucide-reply-all] = rbxassetid10734934132,
	[lucide-rewind] = rbxassetid10734934347,
	[lucide-rocket] = rbxassetid10734934585,
	[lucide-rocking-chair] = rbxassetid10734939942,
	[lucide-rotate-3d] = rbxassetid10734940107,
	[lucide-rotate-ccw] = rbxassetid10734940376,
	[lucide-rotate-cw] = rbxassetid10734940654,
	[lucide-rss] = rbxassetid10734940825,
	[lucide-ruler] = rbxassetid10734941018,
	[lucide-russian-ruble] = rbxassetid10734941199,
	[lucide-sailboat] = rbxassetid10734941354,
	[lucide-save] = rbxassetid10734941499,
	[lucide-scale] = rbxassetid10734941912,
	[lucide-scale-3d] = rbxassetid10734941739,
	[lucide-scaling] = rbxassetid10734942072,
	[lucide-scan] = rbxassetid10734942565,
	[lucide-scan-face] = rbxassetid10734942198,
	[lucide-scan-line] = rbxassetid10734942351,
	[lucide-scissors] = rbxassetid10734942778,
	[lucide-screen-share] = rbxassetid10734943193,
	[lucide-screen-share-off] = rbxassetid10734942967,
	[lucide-scroll] = rbxassetid10734943448,
	[lucide-search] = rbxassetid10734943674,
	[lucide-send] = rbxassetid10734943902,
	[lucide-separator-horizontal] = rbxassetid10734944115,
	[lucide-separator-vertical] = rbxassetid10734944326,
	[lucide-server] = rbxassetid10734949856,
	[lucide-server-cog] = rbxassetid10734944444,
	[lucide-server-crash] = rbxassetid10734944554,
	[lucide-server-off] = rbxassetid10734944668,
	[lucide-settings] = rbxassetid10734950309,
	[lucide-settings-2] = rbxassetid10734950020,
	[lucide-share] = rbxassetid10734950813,
	[lucide-share-2] = rbxassetid10734950553,
	[lucide-sheet] = rbxassetid10734951038,
	[lucide-shield] = rbxassetid10734951847,
	[lucide-shield-alert] = rbxassetid10734951173,
	[lucide-shield-check] = rbxassetid10734951367,
	[lucide-shield-close] = rbxassetid10734951535,
	[lucide-shield-off] = rbxassetid10734951684,
	[lucide-shirt] = rbxassetid10734952036,
	[lucide-shopping-bag] = rbxassetid10734952273,
	[lucide-shopping-cart] = rbxassetid10734952479,
	[lucide-shovel] = rbxassetid10734952773,
	[lucide-shower-head] = rbxassetid10734952942,
	[lucide-shrink] = rbxassetid10734953073,
	[lucide-shrub] = rbxassetid10734953241,
	[lucide-shuffle] = rbxassetid10734953451,
	[lucide-sidebar] = rbxassetid10734954301,
	[lucide-sidebar-close] = rbxassetid10734953715,
	[lucide-sidebar-open] = rbxassetid10734954000,
	[lucide-sigma] = rbxassetid10734954538,
	[lucide-signal] = rbxassetid10734961133,
	[lucide-signal-high] = rbxassetid10734954807,
	[lucide-signal-low] = rbxassetid10734955080,
	[lucide-signal-medium] = rbxassetid10734955336,
	[lucide-signal-zero] = rbxassetid10734960878,
	[lucide-siren] = rbxassetid10734961284,
	[lucide-skip-back] = rbxassetid10734961526,
	[lucide-skip-forward] = rbxassetid10734961809,
	[lucide-skull] = rbxassetid10734962068,
	[lucide-slack] = rbxassetid10734962339,
	[lucide-slash] = rbxassetid10734962600,
	[lucide-slice] = rbxassetid10734963024,
	[lucide-sliders] = rbxassetid10734963400,
	[lucide-sliders-horizontal] = rbxassetid10734963191,
	[lucide-smartphone] = rbxassetid10734963940,
	[lucide-smartphone-charging] = rbxassetid10734963671,
	[lucide-smile] = rbxassetid10734964441,
	[lucide-smile-plus] = rbxassetid10734964188,
	[lucide-snowflake] = rbxassetid10734964600,
	[lucide-sofa] = rbxassetid10734964852,
	[lucide-sort-asc] = rbxassetid10734965115,
	[lucide-sort-desc] = rbxassetid10734965287,
	[lucide-speaker] = rbxassetid10734965419,
	[lucide-sprout] = rbxassetid10734965572,
	[lucide-square] = rbxassetid10734965702,
	[lucide-star] = rbxassetid10734966248,
	[lucide-star-half] = rbxassetid10734965897,
	[lucide-star-off] = rbxassetid10734966097,
	[lucide-stethoscope] = rbxassetid10734966384,
	[lucide-sticker] = rbxassetid10734972234,
	[lucide-sticky-note] = rbxassetid10734972463,
	[lucide-stop-circle] = rbxassetid10734972621,
	[lucide-stretch-horizontal] = rbxassetid10734972862,
	[lucide-stretch-vertical] = rbxassetid10734973130,
	[lucide-strikethrough] = rbxassetid10734973290,
	[lucide-subscript] = rbxassetid10734973457,
	[lucide-sun] = rbxassetid10734974297,
	[lucide-sun-dim] = rbxassetid10734973645,
	[lucide-sun-medium] = rbxassetid10734973778,
	[lucide-sun-moon] = rbxassetid10734973999,
	[lucide-sun-snow] = rbxassetid10734974130,
	[lucide-sunrise] = rbxassetid10734974522,
	[lucide-sunset] = rbxassetid10734974689,
	[lucide-superscript] = rbxassetid10734974850,
	[lucide-swiss-franc] = rbxassetid10734975024,
	[lucide-switch-camera] = rbxassetid10734975214,
	[lucide-sword] = rbxassetid10734975486,
	[lucide-swords] = rbxassetid10734975692,
	[lucide-syringe] = rbxassetid10734975932,
	[lucide-table] = rbxassetid10734976230,
	[lucide-table-2] = rbxassetid10734976097,
	[lucide-tablet] = rbxassetid10734976394,
	[lucide-tag] = rbxassetid10734976528,
	[lucide-tags] = rbxassetid10734976739,
	[lucide-target] = rbxassetid10734977012,
	[lucide-tent] = rbxassetid10734981750,
	[lucide-terminal] = rbxassetid10734982144,
	[lucide-terminal-square] = rbxassetid10734981995,
	[lucide-text-cursor] = rbxassetid10734982395,
	[lucide-text-cursor-input] = rbxassetid10734982297,
	[lucide-thermometer] = rbxassetid10734983134,
	[lucide-thermometer-snowflake] = rbxassetid10734982571,
	[lucide-thermometer-sun] = rbxassetid10734982771,
	[lucide-thumbs-down] = rbxassetid10734983359,
	[lucide-thumbs-up] = rbxassetid10734983629,
	[lucide-ticket] = rbxassetid10734983868,
	[lucide-timer] = rbxassetid10734984606,
	[lucide-timer-off] = rbxassetid10734984138,
	[lucide-timer-reset] = rbxassetid10734984355,
	[lucide-toggle-left] = rbxassetid10734984834,
	[lucide-toggle-right] = rbxassetid10734985040,
	[lucide-tornado] = rbxassetid10734985247,
	[lucide-toy-brick] = rbxassetid10747361919,
	[lucide-train] = rbxassetid10747362105,
	[lucide-trash] = rbxassetid10747362393,
	[lucide-trash-2] = rbxassetid10747362241,
	[lucide-tree-deciduous] = rbxassetid10747362534,
	[lucide-tree-pine] = rbxassetid10747362748,
	[lucide-trees] = rbxassetid10747363016,
	[lucide-trending-down] = rbxassetid10747363205,
	[lucide-trending-up] = rbxassetid10747363465,
	[lucide-triangle] = rbxassetid10747363621,
	[lucide-trophy] = rbxassetid10747363809,
	[lucide-truck] = rbxassetid10747364031,
	[lucide-tv] = rbxassetid10747364593,
	[lucide-tv-2] = rbxassetid10747364302,
	[lucide-type] = rbxassetid10747364761,
	[lucide-umbrella] = rbxassetid10747364971,
	[lucide-underline] = rbxassetid10747365191,
	[lucide-undo] = rbxassetid10747365484,
	[lucide-undo-2] = rbxassetid10747365359,
	[lucide-unlink] = rbxassetid10747365771,
	[lucide-unlink-2] = rbxassetid10747397871,
	[lucide-unlock] = rbxassetid10747366027,
	[lucide-upload] = rbxassetid10747366434,
	[lucide-upload-cloud] = rbxassetid10747366266,
	[lucide-usb] = rbxassetid10747366606,
	[lucide-user] = rbxassetid10747373176,
	[lucide-user-check] = rbxassetid10747371901,
	[lucide-user-cog] = rbxassetid10747372167,
	[lucide-user-minus] = rbxassetid10747372346,
	[lucide-user-plus] = rbxassetid10747372702,
	[lucide-user-x] = rbxassetid10747372992,
	[lucide-users] = rbxassetid10747373426,
	[lucide-utensils] = rbxassetid10747373821,
	[lucide-utensils-crossed] = rbxassetid10747373629,
	[lucide-venetian-mask] = rbxassetid10747374003,
	[lucide-verified] = rbxassetid10747374131,
	[lucide-vibrate] = rbxassetid10747374489,
	[lucide-vibrate-off] = rbxassetid10747374269,
	[lucide-video] = rbxassetid10747374938,
	[lucide-video-off] = rbxassetid10747374721,
	[lucide-view] = rbxassetid10747375132,
	[lucide-voicemail] = rbxassetid10747375281,
	[lucide-volume] = rbxassetid10747376008,
	[lucide-volume-1] = rbxassetid10747375450,
	[lucide-volume-2] = rbxassetid10747375679,
	[lucide-volume-x] = rbxassetid10747375880,
	[lucide-wallet] = rbxassetid10747376205,
	[lucide-wand] = rbxassetid10747376565,
	[lucide-wand-2] = rbxassetid10747376349,
	[lucide-watch] = rbxassetid10747376722,
	[lucide-waves] = rbxassetid10747376931,
	[lucide-webcam] = rbxassetid10747381992,
	[lucide-wifi] = rbxassetid10747382504,
	[lucide-wifi-off] = rbxassetid10747382268,
	[lucide-wind] = rbxassetid10747382750,
	[lucide-wrap-text] = rbxassetid10747383065,
	[lucide-wrench] = rbxassetid10747383470,
	[lucide-x] = rbxassetid10747384394,
	[lucide-x-circle] = rbxassetid10747383819,
	[lucide-x-octagon] = rbxassetid10747384037,
	[lucide-x-square] = rbxassetid10747384217,
	[lucide-zoom-in] = rbxassetid10747384552,
	[lucide-zoom-out] = rbxassetid10747384679,
};

function FatalityIsMobile()  boolean
	return UserInputService.TouchEnabled;	
end;

function FatalityRandomString()  string
	return string.char(math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102),math.random(64,102));	
end;

function FatalityGetTextSize(Text  TextLabel,CustomFont Enum.Font)  Vector2
	return TextServiceGetTextSize(Text.Text,Text.TextSize,(Text.Font ~= Enum.Font.Unknown and Text.Font) or (CustomFont or Enum.Font.GothamMedium),Vector2.new(math.huge,math.huge));
end;

function FatalityIsMouseOverFrame(Frame  Frame)  boolean
	local AbsPos Vector2, AbsSize Vector2 = Frame.AbsolutePosition, Frame.AbsoluteSize;

	if Mouse.X = AbsPos.X and Mouse.X = AbsPos.X + AbsSize.X and Mouse.Y = AbsPos.Y and Mouse.Y = AbsPos.Y + AbsSize.Y then
		return true;
	end;
end;

function FatalityGetCalculatePosition(planePos number, planeNormal Vector3, rayOrigin number, rayDirection Vector3)  number
	local n Vector3 = planeNormal;
	local d Vector3 = rayDirection;
	local v Vector3 = rayOrigin - planePos;

	local num number = (n.x  v.x) + (n.y  v.y) + (n.z  v.z);
	local den number = (n.x  d.x) + (n.y  d.y) + (n.z  d.z);
	local a number = -num  den;

	return rayOrigin + (a  rayDirection);
end;

function FatalityCreateHover(Element  Frame,Callback  (boolean) - any)
	Element.MouseEnterConnect(function()
		Callback(true);
	end);

	Element.MouseLeaveConnect(function()
		Callback(false);
	end);
end;

function FatalityGetIcon(name  string)  string
	return Fatality.Lucide['lucide-'..tostring(name)] or Fatality.Lucide[name] or Fatality.Lucide[tostring(name)] or ;
end;

function FatalitySetIcon(name  string, value  string)
	Fatality.Lucide[name] = value;
end;

function FatalityRounding(num number, numDecimalPlaces number)  number
	local mult number = 10 ^ (numDecimalPlaces or 0);
	return math.floor(num  mult + 0.5)  mult;
end;

function FatalityCreateAnimation(Instance Instance , Time number , Style  Enum.EasingStyle , Property  {[string]  any})  Tween
	if not Property then
		if typeof(Style) == 'table' then
			Property = Style;
			Style = nil;
		end;
	end;

	local Tween Tween = TweenServiceCreate(Instance,TweenInfo.new(Time or 1 , Style or Enum.EasingStyle.Quint),Property);

	TweenPlay();

	return Tween;
end;

function FatalityNewInput(Frame  Frame , Callback  () - ())  TextButton
	local Button = Instance.new('TextButton',Frame);

	Button.ZIndex = Frame.ZIndex + 10;
	Button.Size = UDim2.fromScale(1,1);
	Button.BackgroundTransparency = 1;
	Button.TextTransparency = 1;

	if Callback then
		Button.MouseButton1ClickConnect(Callback);
	end;

	return Button;
end;

function FatalityDrag(InputFrame Frame, MoveFrame Frame, Speed  number)
	local dragToggle boolean = false;
	local dragStart Vector3 = nil;
	local startPos UDim2 = nil;

	local function updateInput(input)
		local delta = input.Position - dragStart;
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y);

		FatalityCreateAnimation(MoveFrame,Speed,nil,{
			Position = position
		});
	end;

	InputFrame.InputBeganConnect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = MoveFrame.Position
			input.ChangedConnect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UserInputService.InputChangedConnect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end);
end;

function FatalityScrollSignal(Scroll ScrollingFrame,UIListLayout UIListLayout,Typestring)
	if Type == 'X' then
		UIListLayoutGetPropertyChangedSignal('AbsoluteContentSize')Connect(function()
			Scroll.CanvasSize = UDim2.fromOffset(UIListLayout.AbsoluteContentSize.X,0)
		end)
	else
		UIListLayoutGetPropertyChangedSignal('AbsoluteContentSize')Connect(function()
			Scroll.CanvasSize = UDim2.fromOffset(0,UIListLayout.AbsoluteContentSize.Y)
		end)
	end;
end;

function FatalityCreateResponse(args {[string]  (any) - any})
	local main = {};

	for i,v in next , args do
		if typeof(v) == 'function' then
			main[i] = function(self , ...)
				return v(...);
			end;
		else
			main[i] = v;
		end;
	end;

	return main;
end;

function FatalityGetWindowFromElement(Element GuiObject)
	for i,v in next , Fatality.Windows do
		if ElementIsDescendantOf(v) then
			return v;
		end;
	end;
end;

function FatalityCreateOption(OptionButton ImageButton) Elements
	FatalityCreateHover(OptionButton,function(bool)
		if bool then
			FatalityCreateAnimation(OptionButton,0.5,{
				ImageTransparency = 0.3
			})
		else
			FatalityCreateAnimation(OptionButton,0.5,{
				ImageTransparency = 0.600
			})
		end;
	end);

	local Bindable = Instance.new('BindableEvent');
	local OwnWindow = FatalityGetWindowFromElement(OptionButton);
	local ExtElementFrame = Instance.new(Frame)
	local UICorner = Instance.new(UICorner)
	local UIStroke = Instance.new(UIStroke)
	local DropShadow = Instance.new(ImageLabel)
	local ScrollingFrame = Instance.new(ScrollingFrame)
	local UIListLayout = Instance.new(UIListLayout)
	local SpaceBox = Instance.new(Frame)

	FatalityScrollSignal(ScrollingFrame,UIListLayout,'Y');

	ExtElementFrame.Active = true;
	ExtElementFrame.Name = FatalityRandomString()
	ExtElementFrame.Parent = OwnWindow
	ExtElementFrame.AnchorPoint = Vector2.new(0.5, 0)
	ExtElementFrame.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
	ExtElementFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ExtElementFrame.BorderSizePixel = 0
	ExtElementFrame.ClipsDescendants = true
	ExtElementFrame.Position = UDim2.new(2, 0, 2, 0)
	ExtElementFrame.Size = UDim2.new(0, 200, 0, 0)
	ExtElementFrame.ZIndex = 100

	UICorner.CornerRadius = UDim.new(0, 2)
	UICorner.Parent = ExtElementFrame

	UIStroke.Color = Color3.fromRGB(29, 29, 29)
	UIStroke.Parent = ExtElementFrame

	DropShadow.Name = FatalityRandomString()
	DropShadow.Parent = ExtElementFrame
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Rotation = 0.001
	DropShadow.Size = UDim2.new(1, 47, 1, 47)
	DropShadow.ZIndex = 99
	DropShadow.Image = rbxassetid6014261993
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.750
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	ScrollingFrame.Parent = ExtElementFrame
	ScrollingFrame.Active = true
	ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.ClipsDescendants = false
	ScrollingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	ScrollingFrame.Size = UDim2.new(1, 0, 1, -5)
	ScrollingFrame.ZIndex = 109
	ScrollingFrame.ScrollBarThickness = 0

	UIListLayout.Parent = ScrollingFrame
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)

	SpaceBox.Name = FatalityRandomString()
	SpaceBox.Parent = ScrollingFrame
	SpaceBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SpaceBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SpaceBox.BorderSizePixel = 0
	SpaceBox.Size = UDim2.new(0, 0, 0, 3)

	local SPAWN_THREAD;

	local ToggleExt = function(bool)
		if bool then
			BindableSetAttribute('V',true);
			BindableFire(true);

			local size = math.clamp(UIListLayout.AbsoluteContentSize.Y + 15,0,200)

			ExtElementFrame.Position = UDim2.fromOffset(OptionButton.AbsolutePosition.X + 100, OptionButton.AbsolutePosition.Y + (size  2))

			FatalityCreateAnimation(ExtElementFrame,0.45,{
				Size = UDim2.new(0, 200, 0, size)
			})

			FatalityCreateAnimation(DropShadow,0.45,{
				ImageTransparency = 0.750
			})

			FatalityCreateAnimation(UIStroke,0.45,{
				Transparency = 0
			})

			if SPAWN_THREAD then
				task.cancel(SPAWN_THREAD);
				SPAWN_THREAD = nil;
			end;

			SPAWN_THREAD = task.spawn(function()
				while true do task.wait(0.1)
					local size = math.clamp(UIListLayout.AbsoluteContentSize.Y + 15,0,200)
					local ud = UDim2.fromOffset(OptionButton.AbsolutePosition.X + 100, OptionButton.AbsolutePosition.Y + (size  2));

					FatalityCreateAnimation(ExtElementFrame,0.35,{
						Position = ud
					});
				end;
			end)
		else
			if SPAWN_THREAD then
				task.cancel(SPAWN_THREAD);
				SPAWN_THREAD = nil;
			end;

			BindableSetAttribute('V',false);
			BindableFire(false);

			FatalityCreateAnimation(ExtElementFrame,0.45,{
				Size = UDim2.new(0, 200, 0, 0)
			})

			FatalityCreateAnimation(DropShadow,0.45,{
				ImageTransparency = 1
			})

			FatalityCreateAnimation(UIStroke,0.45,{
				Transparency = 1
			})
		end;
	end;

	BindableSetAttribute('V',false);

	ToggleExt(false);

	OptionButton.MouseButton1ClickConnect(function()
		ToggleExt(true);
	end);

	UserInputService.InputBeganConnect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
			if not FatalityIsMouseOverFrame(ExtElementFrame) and not Fatality.GLOBAL_ENVIRONMENT.IS_HOLD_COLOR_PICKER then
				ToggleExt(false);
			end;
		end;
	end);

	local UIElements Elements = FatalityCreateElements(ScrollingFrame,ScrollingFrame.ZIndex,Bindable);

	return UIElements;
end;

function FatalityCreateColorPicker(ColorBox Frame,Transparency, Callback)
	Transparency = Transparency or 0;
	Callback = Callback or function() end;

	local OwnWindow = FatalityGetWindowFromElement(ColorBox);
	local ColorPickerFrame = Instance.new(Frame)
	local UICorner = Instance.new(UICorner)
	local UIStroke = Instance.new(UIStroke)
	local DropShadow = Instance.new(ImageLabel)
	local ColorPickBox = Instance.new(ImageLabel)
	local MouseMovement = Instance.new(ImageLabel)
	local UICorner_2 = Instance.new(UICorner)
	local UIStroke_2 = Instance.new(UIStroke)
	local ColorRedGreenBlue = Instance.new(Frame)
	local UIGradient = Instance.new(UIGradient)
	local UICorner_3 = Instance.new(UICorner)
	local ColorRGBSlide = Instance.new(Frame)
	local UIStroke_3 = Instance.new(UIStroke)
	local ColorOpc = Instance.new(Frame)
	local UICorner_4 = Instance.new(UICorner)
	local ColorOptSlide = Instance.new(Frame)
	local UIStroke_4 = Instance.new(UIStroke)
	local UIGradient_2 = Instance.new(UIGradient)
	local UIStroke_5 = Instance.new(UIStroke)
	local ColorOpt = Instance.new(Frame)
	local UICorner_5 = Instance.new(UICorner)
	local PasteButton = Instance.new(ImageButton)
	local CopyButton = Instance.new(ImageButton)
	local hexCode = Instance.new(Frame)
	local UICorner_6 = Instance.new(UICorner)
	local HexCodeText = Instance.new(TextLabel)

	local OldCode = 0;
	local CodeH,CodeV = 1, 1;
	local IsPressM1 = false;
	local UI_SPAWN_THREAD;

	local updateColor = function()
		local H , S , V = ColorBox.BackgroundColor3ToHSV();

		OldCode = H;
		CodeH = S;
		CodeV = V;
	end;

	local VisibleToggle = function(value)
		if value then
			ColorPickBox.BackgroundColor3 = Color3.fromHSV(OldCode,1,1);
			ColorOpc.BackgroundColor3 = ColorBox.BackgroundColor3;

			HexCodeText.Text = # .. tostring(ColorPickBox.BackgroundColor3ToHex())

			ColorPickerFrame.Position = UDim2.fromOffset(ColorBox.AbsolutePosition.X + (ColorPickerFrame.AbsoluteSize.X  1.5),ColorBox.AbsolutePosition.Y);

			updateColor();

			if UI_SPAWN_THREAD then
				task.cancel(UI_SPAWN_THREAD);
				UI_SPAWN_THREAD = nil;
			end;

			UI_SPAWN_THREAD = task.spawn(function()
				while true do task.wait()
					FatalityCreateAnimation(ColorPickerFrame,0.35,{
						Position = UDim2.fromOffset(ColorBox.AbsolutePosition.X + (ColorPickerFrame.AbsoluteSize.X  1.5),ColorBox.AbsolutePosition.Y);
					});
				end;
			end);

			FatalityCreateAnimation(ColorRGBSlide,0.35,{
				Position = UDim2.new(0.5, 0, OldCode, 0)
			});

			FatalityCreateAnimation(MouseMovement,0.35,{
				Position = UDim2.new(CodeH, 0, 1 - CodeV, 0)
			})

			FatalityCreateAnimation(ColorOptSlide,0.35,{
				Position = UDim2.new(1- Transparency, 0, 0.5, 0)
			})

			FatalityCreateAnimation(ColorPickerFrame,0.45,{
				Size = UDim2.new(0, 175, 0, 195),
			});

			FatalityCreateAnimation(UIStroke,0.45,{
				Transparency = 0
			});

			FatalityCreateAnimation(DropShadow,0.45,{
				ImageTransparency = 0.75
			});

			FatalityCreateAnimation(ColorPickBox,0.45,{
				ImageTransparency = 0,
				BackgroundTransparency = 0
			});

			FatalityCreateAnimation(MouseMovement,0.45,{
				ImageTransparency = 0,
			});

			FatalityCreateAnimation(UIStroke_2,0.45,{
				Transparency = 0
			});

			FatalityCreateAnimation(ColorRedGreenBlue,0.45,{
				BackgroundTransparency = 0
			});

			FatalityCreateAnimation(ColorRGBSlide,0.45,{
				BackgroundTransparency = 0
			});

			FatalityCreateAnimation(UIStroke_3,0.45,{
				Transparency = 0.75
			});

			FatalityCreateAnimation(ColorOpc,0.45,{
				BackgroundTransparency = 0
			});

			FatalityCreateAnimation(ColorOptSlide,0.45,{
				BackgroundTransparency = 0
			});

			FatalityCreateAnimation(UIStroke_4,0.45,{
				Transparency = 0.75
			});

			FatalityCreateAnimation(UIStroke_5,0.45,{
				Transparency = 0
			});

			FatalityCreateAnimation(PasteButton,0.45,{
				ImageTransparency = 0.45
			});

			FatalityCreateAnimation(CopyButton,0.45,{
				ImageTransparency = 0.45
			});

			FatalityCreateAnimation(hexCode,0.45,{
				BackgroundTransparency = 0.4
			});

			FatalityCreateAnimation(HexCodeText,0.45,{
				TextTransparency = 0.45
			});
		else
			if UI_SPAWN_THREAD then
				task.cancel(UI_SPAWN_THREAD);
				UI_SPAWN_THREAD = nil;
			end;

			FatalityCreateAnimation(ColorPickerFrame,0.45,{
				Size = UDim2.new(0, 175, 0, 0)
			});

			FatalityCreateAnimation(UIStroke,0.45,{
				Transparency = 1
			});

			FatalityCreateAnimation(DropShadow,0.45,{
				ImageTransparency = 1
			});

			FatalityCreateAnimation(ColorPickBox,0.45,{
				ImageTransparency = 1,
				BackgroundTransparency = 1
			});

			FatalityCreateAnimation(MouseMovement,0.45,{
				ImageTransparency = 1,
			});

			FatalityCreateAnimation(UIStroke_2,0.45,{
				Transparency = 1
			});

			FatalityCreateAnimation(ColorRedGreenBlue,0.45,{
				BackgroundTransparency = 1
			});

			FatalityCreateAnimation(ColorRGBSlide,0.45,{
				BackgroundTransparency = 1
			});

			FatalityCreateAnimation(UIStroke_3,0.45,{
				Transparency = 1
			});

			FatalityCreateAnimation(ColorOpc,0.45,{
				BackgroundTransparency = 1
			});

			FatalityCreateAnimation(ColorOptSlide,0.45,{
				BackgroundTransparency = 1
			});

			FatalityCreateAnimation(UIStroke_4,0.45,{
				Transparency = 1
			});

			FatalityCreateAnimation(UIStroke_5,0.45,{
				Transparency = 1
			});

			FatalityCreateAnimation(PasteButton,0.45,{
				ImageTransparency = 1
			});

			FatalityCreateAnimation(CopyButton,0.45,{
				ImageTransparency = 1
			});

			FatalityCreateAnimation(hexCode,0.45,{
				BackgroundTransparency = 1
			});

			FatalityCreateAnimation(HexCodeText,0.45,{
				TextTransparency = 1
			});
		end;
	end;

	ColorPickerFrame.Active = true;
	ColorPickerFrame.Name = FatalityRandomString()
	ColorPickerFrame.Parent = OwnWindow
	ColorPickerFrame.AnchorPoint = Vector2.new(0.5, 0)
	ColorPickerFrame.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
	ColorPickerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorPickerFrame.BorderSizePixel = 0
	ColorPickerFrame.ClipsDescendants = true
	ColorPickerFrame.Position = UDim2.new(4,0,4,0)
	ColorPickerFrame.Size = UDim2.new(0, 175, 0, 195)
	ColorPickerFrame.ZIndex = 200

	UICorner.CornerRadius = UDim.new(0, 2)
	UICorner.Parent = ColorPickerFrame

	UIStroke.Color = Color3.fromRGB(29, 29, 29)
	UIStroke.Parent = ColorPickerFrame

	DropShadow.Name = FatalityRandomString()
	DropShadow.Parent = ColorPickerFrame
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Rotation = 0.001
	DropShadow.Size = UDim2.new(1, 47, 1, 47)
	DropShadow.ZIndex = 199
	DropShadow.Image = rbxassetid6014261993
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.750
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	ColorPickBox.Name = FatalityRandomString()
	ColorPickBox.Parent = ColorPickerFrame
	ColorPickBox.BackgroundColor3 = Color3.fromRGB(39, 255, 35)
	ColorPickBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorPickBox.BorderSizePixel = 0
	ColorPickBox.Position = UDim2.new(0, 7, 0, 7)
	ColorPickBox.Size = UDim2.new(0, 135, 0, 135)
	ColorPickBox.ZIndex = 201
	ColorPickBox.Image = httpwww.roblox.comassetid=112554223509763

	MouseMovement.Name = FatalityRandomString()
	MouseMovement.Parent = ColorPickBox
	MouseMovement.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MouseMovement.BackgroundTransparency = 1.000
	MouseMovement.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MouseMovement.BorderSizePixel = 0
	MouseMovement.Position = UDim2.new(0.822222233, 0, 0.0592592582, 0)
	MouseMovement.Size = UDim2.new(0, 12, 0, 12)
	MouseMovement.ZIndex = 205
	MouseMovement.Image = rbxassetid4805639000
	MouseMovement.AnchorPoint = Vector2.new(0.5,0.5)

	UICorner_2.CornerRadius = UDim.new(0, 2)
	UICorner_2.Parent = ColorPickBox

	UIStroke_2.Color = Color3.fromRGB(29, 29, 29)
	UIStroke_2.Parent = ColorPickBox

	ColorRedGreenBlue.Name = FatalityRandomString()
	ColorRedGreenBlue.Parent = ColorPickerFrame
	ColorRedGreenBlue.AnchorPoint = Vector2.new(1, 0)
	ColorRedGreenBlue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ColorRedGreenBlue.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorRedGreenBlue.BorderSizePixel = 0
	ColorRedGreenBlue.Position = UDim2.new(1, -7, 0, 7)
	ColorRedGreenBlue.Size = UDim2.new(0, 20, 0, 135)
	ColorRedGreenBlue.ZIndex = 206

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(50, 255, 50)), ColorSequenceKeypoint.new(0.10, Color3.fromRGB(102, 255, 0)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(102, 255, 0)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(50, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 102)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(102, 255, 0)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(50, 255, 50)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(0, 255, 102)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 255, 102)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(0, 255, 102)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(50, 255, 50))}
	UIGradient.Rotation = 90
	UIGradient.Parent = ColorRedGreenBlue

	UICorner_3.CornerRadius = UDim.new(0, 3)
	UICorner_3.Parent = ColorRedGreenBlue

	ColorRGBSlide.Name = FatalityRandomString()
	ColorRGBSlide.Parent = ColorRedGreenBlue
	ColorRGBSlide.AnchorPoint = Vector2.new(0.5, 0)
	ColorRGBSlide.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ColorRGBSlide.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorRGBSlide.BorderSizePixel = 0
	ColorRGBSlide.Position = UDim2.new(0.5, 0, 0.5, 0)
	ColorRGBSlide.Size = UDim2.new(1, 5, 0, 2)
	ColorRGBSlide.ZIndex = 207

	UIStroke_3.Transparency = 0.750
	UIStroke_3.Color = Color3.fromRGB(29, 29, 29)
	UIStroke_3.Parent = ColorRGBSlide

	ColorOpc.Name = FatalityRandomString()
	ColorOpc.Parent = ColorPickerFrame
	ColorOpc.AnchorPoint = Vector2.new(0.5, 0)
	ColorOpc.BackgroundColor3 = Color3.fromRGB(102, 255, 0)
	ColorOpc.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorOpc.BorderSizePixel = 0
	ColorOpc.Position = UDim2.new(0.5, 0, 0, 149)
	ColorOpc.Size = UDim2.new(1, -15, 0, 12)
	ColorOpc.ZIndex = 206

	UICorner_4.CornerRadius = UDim.new(0, 2)
	UICorner_4.Parent = ColorOpc

	ColorOptSlide.Name = FatalityRandomString()
	ColorOptSlide.Parent = ColorOpc
	ColorOptSlide.AnchorPoint = Vector2.new(0, 0.5)
	ColorOptSlide.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ColorOptSlide.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorOptSlide.BorderSizePixel = 0
	ColorOptSlide.Position = UDim2.new(0.5, 0, 0.5, 0)
	ColorOptSlide.Size = UDim2.new(0, 2, 1, 5)
	ColorOptSlide.ZIndex = 207

	UIStroke_4.Transparency = 0.750
	UIStroke_4.Color = Color3.fromRGB(29, 29, 29)
	UIStroke_4.Parent = ColorOptSlide

	UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(1.00, 0.00)}
	UIGradient_2.Parent = ColorOpc

	UIStroke_5.Color = Color3.fromRGB(29, 29, 29)
	UIStroke_5.Parent = ColorOpc

	ColorOpt.Name = FatalityRandomString()
	ColorOpt.Parent = ColorPickerFrame
	ColorOpt.AnchorPoint = Vector2.new(0.5, 0)
	ColorOpt.BackgroundColor3 = Color3.fromRGB(102, 255, 0)
	ColorOpt.BackgroundTransparency = 1.000
	ColorOpt.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorOpt.BorderSizePixel = 0
	ColorOpt.Position = UDim2.new(0.5, 0, 0, 169)
	ColorOpt.Size = UDim2.new(1, -15, 0, 18)
	ColorOpt.ZIndex = 206

	UICorner_5.CornerRadius = UDim.new(0, 2)
	UICorner_5.Parent = ColorOpt

	PasteButton.Name = FatalityRandomString()
	PasteButton.Parent = ColorOpt
	PasteButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	PasteButton.BackgroundTransparency = 1.000
	PasteButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	PasteButton.BorderSizePixel = 0
	PasteButton.Size = UDim2.new(1, 0, 1, 0)
	PasteButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
	PasteButton.ZIndex = 209
	PasteButton.Image = rbxassetid10709799288
	PasteButton.ImageTransparency = 0.450

	CopyButton.Name = FatalityRandomString()
	CopyButton.Parent = ColorOpt
	CopyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CopyButton.BackgroundTransparency = 1.000
	CopyButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CopyButton.BorderSizePixel = 0
	CopyButton.Position = UDim2.new(0, 20, 0, 0)
	CopyButton.Size = UDim2.new(1, 0, 1, 0)
	CopyButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
	CopyButton.ZIndex = 209
	CopyButton.Image = rbxassetid10709798682
	CopyButton.ImageTransparency = 0.450

	hexCode.Name = FatalityRandomString()
	hexCode.Parent = ColorOpt
	hexCode.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
	hexCode.BackgroundTransparency = 0.400
	hexCode.BorderColor3 = Color3.fromRGB(0, 0, 0)
	hexCode.BorderSizePixel = 0
	hexCode.Position = UDim2.new(0, 43, 0, 0)
	hexCode.Size = UDim2.new(1, -43, 1, 0)
	hexCode.ZIndex = 209

	UICorner_6.CornerRadius = UDim.new(0, 4)
	UICorner_6.Parent = hexCode

	HexCodeText.Name = FatalityRandomString()
	HexCodeText.Parent = hexCode
	HexCodeText.AnchorPoint = Vector2.new(0, 0.5)
	HexCodeText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	HexCodeText.BackgroundTransparency = 1.000
	HexCodeText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HexCodeText.BorderSizePixel = 0
	HexCodeText.Position = UDim2.new(0, 3, 0.5, 0)
	HexCodeText.Size = UDim2.new(1, 0, 0.800000012, 0)
	HexCodeText.ZIndex = 209
	HexCodeText.FontFace = Fatality.FontSemiBold
	HexCodeText.Text = #fff
	HexCodeText.TextColor3 = Color3.fromRGB(255, 255, 255)
	HexCodeText.TextSize = 13.000
	HexCodeText.TextTransparency = 0.450
	HexCodeText.TextXAlignment = Enum.TextXAlignment.Left;

	FatalityCreateHover(CopyButton,function(bool)
		if bool then
			FatalityCreateAnimation(CopyButton,0.45,{
				ImageTransparency = 0.1
			})
		else
			FatalityCreateAnimation(CopyButton,0.45,{
				ImageTransparency = 0.45
			})
		end
	end)	

	FatalityCreateHover(PasteButton,function(bool)
		if bool then
			FatalityCreateAnimation(PasteButton,0.45,{
				ImageTransparency = 0.1
			})
		else
			FatalityCreateAnimation(PasteButton,0.45,{
				ImageTransparency = 0.45
			})
		end
	end)

	PasteButton.MouseButton1ClickConnect(function()
		if Fatality.GLOBAL_ENVIRONMENT.COLOR_COPY then
			local h,s,v = Fatality.GLOBAL_ENVIRONMENT.COLOR_COPY.RGBToHSV();

			Transparency = Fatality.GLOBAL_ENVIRONMENT.COLOR_COPY.OPC;

			OldCode = h;
			CodeH = s;
			CodeV = v;

			HexCodeText.Text = # .. tostring(Fatality.GLOBAL_ENVIRONMENT.COLOR_COPY.RGBToHex());

			FatalityCreateAnimation(ColorRGBSlide,0.35,{
				Position = UDim2.new(0.5, 0, OldCode, 0)
			});

			FatalityCreateAnimation(MouseMovement,0.35,{
				Position = UDim2.new(CodeH, 0, 1 - CodeV, 0)
			})

			FatalityCreateAnimation(ColorOptSlide,0.35,{
				Position = UDim2.new(1- Transparency, 0, 0.5, 0)
			})

			FatalityCreateAnimation(ColorPickerFrame,0.45,{
				Size = UDim2.new(0, 175, 0, 195),
			});

			ColorPickBox.BackgroundColor3 = Color3.fromHSV(h,1,1);

			ColorOpc.BackgroundColor3 = Fatality.GLOBAL_ENVIRONMENT.COLOR_COPY.RGB;

			Callback(Color3.fromHSV(OldCode,CodeH,CodeV),Transparency);
		end;
	end);

	CopyButton.MouseButton1ClickConnect(function()
		Fatality.GLOBAL_ENVIRONMENT.COLOR_COPY = {
			RGB = Color3.fromHSV(OldCode,CodeH,CodeV),
			OPC = Transparency,
		};
	end)

	VisibleToggle(false);

	FatalityNewInput(ColorBox,function()
		VisibleToggle(true);
	end);

	do
		local SPAWN_THREAD;
		ColorPickerFrame.InputBeganConnect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				IsPressM1 = true;

				Fatality.GLOBAL_ENVIRONMENT.IS_HOLD_COLOR_PICKER = true;

				if SPAWN_THREAD then
					task.cancel(SPAWN_THREAD);
					SPAWN_THREAD = nil;
				end;

				SPAWN_THREAD = task.spawn(function()
					while IsPressM1 do task.wait(0)
						Callback(Color3.fromHSV(OldCode,CodeH,CodeV),Transparency);
					end;
				end);
			end;
		end)

		ColorPickerFrame.InputEndedConnect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				IsPressM1 = false;
				Fatality.GLOBAL_ENVIRONMENT.IS_HOLD_COLOR_PICKER = false;

				if SPAWN_THREAD then
					task.cancel(SPAWN_THREAD);
					SPAWN_THREAD = nil;
				end;
			end;
		end)

		UserInputService.InputBeganConnect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				if not FatalityIsMouseOverFrame(ColorPickerFrame) then
					VisibleToggle(false);
				end;
			end;
		end)

		ColorRedGreenBlue.InputBeganConnect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				IsPressM1 = true;

				while (UserInputServiceIsMouseButtonPressed(Enum.UserInputType.MouseButton1) or IsPressM1) do task.wait()
					local ColorY = ColorRedGreenBlue.AbsolutePosition.Y
					local ColorYM = ColorY + ColorRedGreenBlue.AbsoluteSize.Y;
					local Value = math.clamp(Mouse.Y, ColorY, ColorYM)
					local Code = ((Value - ColorY)  (ColorYM - ColorY));

					local Color = Color3.fromHSV(Code, CodeH, CodeV);

					FatalityCreateAnimation(ColorRGBSlide,0.35,{
						Position = UDim2.new(0.5, 0, Code, 0)
					});

					FatalityCreateAnimation(ColorBox,0.5,{
						BackgroundColor3 = Color
					});

					FatalityCreateAnimation(ColorOpc,0.35,{
						BackgroundColor3 = Color
					});

					FatalityCreateAnimation(ColorPickBox,0.5,{
						BackgroundColor3 = Color3.fromHSV(Code, 1, 1)
					});

					HexCodeText.Text = # .. tostring(ColorToHex())

					OldCode = Code;
				end;
			end;
		end);

		ColorOpc.InputBeganConnect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				IsPressM1 = true;

				while (UserInputServiceIsMouseButtonPressed(Enum.UserInputType.MouseButton1) or IsPressM1) do task.wait()
					local transparency = math.clamp((((Mouse.X) - ColorOpc.AbsolutePosition.X)  ColorOpc.AbsoluteSize.X), 0, 1);

					FatalityCreateAnimation(ColorOptSlide,0.35,{
						Position = UDim2.new(transparency, 0, 0.5, 0)
					});

					HexCodeText.Text = # .. tostring(ColorBox.BackgroundColor3ToHex())

					Transparency = (1 - transparency);
				end;
			end;
		end);

		ColorPickBox.InputBeganConnect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				IsPressM1 = true;

				while (UserInputServiceIsMouseButtonPressed(Enum.UserInputType.MouseButton1) or IsPressM1) do task.wait();
					local PosX = ColorPickBox.AbsolutePosition.X
					local ScaleX = PosX + ColorPickBox.AbsoluteSize.X
					local Value, PosY = math.clamp(Mouse.X, PosX, ScaleX), ColorPickBox.AbsolutePosition.Y
					local ScaleY = PosY + ColorPickBox.AbsoluteSize.Y
					local Vals = math.clamp(Mouse.Y, PosY, ScaleY)

					CodeH = (Value - PosX)  (ScaleX - PosX);
					CodeV = (1 - ((Vals - PosY)  (ScaleY - PosY)));

					FatalityCreateAnimation(ColorBox,0.5,{
						BackgroundColor3 = Color3.fromHSV(OldCode, CodeH, CodeV)
					});

					FatalityCreateAnimation(ColorOpc,0.35,{
						BackgroundColor3 = Color3.fromHSV(OldCode, CodeH, CodeV)
					});

					HexCodeText.Text = # .. tostring(Color3.fromHSV(OldCode, CodeH, CodeV)ToHex())

					FatalityCreateAnimation(MouseMovement,0.2,nil,{
						Position = UDim2.new(CodeH, 0, 1 - CodeV, 0)
					})
				end
			end
		end)
	end;

	return {
		set_opc = function(v)
			Transparency = v;
		end,
	}
end;

function FatalityRandomStr(len number) string
	local main = ;

	for i = 1 , len do
		local max = #Fatality.Ascii;
		local rand = math.random(1,max);

		main = main .. Fatality.Asciisub(rand,rand);
	end;

	return main;
end;

function FatalityProtectText(Label TextLabel,Text string)
	Label.RichText = true;

	local MainText = string.gsub(Text,'.',function(t)
		if not string.find(t,[()']) then
			return string.format('font %s=%s%sfont',FatalityRandomStr(5),FatalityRandomStr(5),t)
		end;
		return t;
	end);

	Label.Text = MainText;
end;

function FatalityCreateDropdown(Parent Frame, Default string  {[string] boolean}, Multiplier boolean, AutoUpdate boolean,Callback (data any) - any)
	local Window = FatalityGetWindowFromElement(Parent);
	local Data = {};
	local Selected = (Multiplier and {}) or nil;

	local DropdownItemFrame = Instance.new(Frame)
	local UICorner = Instance.new(UICorner)
	local UIStroke = Instance.new(UIStroke)
	local DropShadow = Instance.new(ImageLabel)
	local ScrollingFrame = Instance.new(ScrollingFrame)
	local UIListLayout = Instance.new(UIListLayout)
	local SPAWN_THREAD;

	local Toggle = function(value)
		if value then
			if SPAWN_THREAD then
				task.cancel(SPAWN_THREAD);
				SPAWN_THREAD = nil;
			end;

			SPAWN_THREAD = task.spawn(function()
				while true do task.wait()
					local baseSize = UIListLayout.AbsoluteContentSize.Y + 10;

					DropdownItemFrame.Position = UDim2.fromOffset(Parent.AbsolutePosition.X,Parent.AbsolutePosition.Y + (Parent.AbsoluteSize.Y  5))

					FatalityCreateAnimation(DropdownItemFrame,0.35,{
						Size = UDim2.new(0, 175, 0, math.clamp(baseSize,0,200))
					})
				end;
			end)

			FatalityCreateAnimation(UIStroke,0.35,{
				Transparency = 0
			})

			FatalityCreateAnimation(DropShadow,0.35,{
				ImageTransparency = 0.75
			})
		else
			if SPAWN_THREAD then
				task.cancel(SPAWN_THREAD);
				SPAWN_THREAD = nil;
			end;

			FatalityCreateAnimation(DropdownItemFrame,0.35,{
				Size = UDim2.new(0, 175, 0, 0)
			})

			FatalityCreateAnimation(UIStroke,0.35,{
				Transparency = 1
			})

			FatalityCreateAnimation(DropShadow,0.35,{
				ImageTransparency = 1
			})
		end;
	end;

	Toggle(false);

	DropdownItemFrame.Name = FatalityRandomString()
	DropdownItemFrame.Parent = Window
	DropdownItemFrame.AnchorPoint = Vector2.new(0, 0)
	DropdownItemFrame.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
	DropdownItemFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	DropdownItemFrame.BorderSizePixel = 0
	DropdownItemFrame.ClipsDescendants = true
	DropdownItemFrame.Position = UDim2.new(4,0,4,0)
	DropdownItemFrame.Size = UDim2.new(0, 175, 0, 100)
	DropdownItemFrame.ZIndex = 100

	UICorner.CornerRadius = UDim.new(0, 2)
	UICorner.Parent = DropdownItemFrame

	UIStroke.Color = Color3.fromRGB(29, 29, 29)
	UIStroke.Parent = DropdownItemFrame

	DropShadow.Name = FatalityRandomString()
	DropShadow.Parent = DropdownItemFrame
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Rotation = 0.001
	DropShadow.Size = UDim2.new(1, 47, 1, 47)
	DropShadow.ZIndex = 99
	DropShadow.Image = rbxassetid6014261993
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.750
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	ScrollingFrame.Parent = DropdownItemFrame
	ScrollingFrame.Active = true
	ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.ClipsDescendants = false
	ScrollingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	ScrollingFrame.Size = UDim2.new(1, -5, 1, -5)
	ScrollingFrame.ZIndex = 109
	ScrollingFrame.ScrollBarThickness = 0

	UIListLayout.Parent = ScrollingFrame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)

	UIListLayoutGetPropertyChangedSignal('AbsoluteContentSize')Connect(function()
		ScrollingFrame.CanvasSize = UDim2.fromOffset(0,UIListLayout.AbsoluteContentSize.Y + 4)
	end)

	local new_button = function()
		local db_selected = Instance.new(TextButton)

		db_selected.Name = FatalityRandomString()
		db_selected.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		db_selected.BackgroundTransparency = 1.000
		db_selected.BorderColor3 = Color3.fromRGB(0, 0, 0)
		db_selected.BorderSizePixel = 0
		db_selected.Size = UDim2.new(1, 0, 0, 10)
		db_selected.ZIndex = 110
		db_selected.FontFace = Fatality.FontSemiBold
		db_selected.TextColor3 = Color3.fromRGB(50, 255, 50)
		db_selected.TextSize = 12.000
		db_selected.TextXAlignment = Enum.TextXAlignment.Left

		return db_selected;
	end;

	local func;
	local res = FatalityCreateResponse({
		set_data = function(v)
			Data = v;
		end,
		on_toggle = function(cb)
			func = cb;
		end,
        change_default = function(v)
            Default = v;
        end,
		refresh = function()
			for i,v in next , ScrollingFrameGetChildren() do
				if vIsA('TextButton') then
					vDestroy();
				end;
			end;

			local selectedmem;

			for i,v in next , Data do
				local bth = new_button();

				bth.Text = tostring(v);

				bth.Parent = ScrollingFrame;

				if Multiplier then
					if (typeof(Default) == 'table' and (Default[v] or table.find(Default,v))) or Default == v then
						Selected[v] = true
						bth.TextColor3 = Color3.fromRGB(50, 255, 50);
					else
						bth.TextColor3 = Color3.fromRGB(255, 255, 255);
						Selected[v] = false
					end

					bth.MouseButton1ClickConnect(function()
						Selected[v] = not Selected[v];

						if Selected[v] then
							bth.TextColor3 = Color3.fromRGB(50, 255, 50);
						else
							bth.TextColor3 = Color3.fromRGB(255, 255, 255);
						end;

						Callback(Selected);
					end)
				else
					if v == Default then
						selectedmem = bth;
						Selected = v;

						bth.TextColor3 = Color3.fromRGB(50, 255, 50);
					else
						bth.TextColor3 = Color3.fromRGB(255, 255, 255);
					end;

					bth.MouseButton1ClickConnect(function()
						if selectedmem then
							selectedmem.TextColor3 = Color3.fromRGB(255, 255, 255);
						end;

						bth.TextColor3 = Color3.fromRGB(50, 255, 50);
						selectedmem = bth;
						Selected = v;

						Callback(v);
					end)
				end;
			end;

			Callback(Selected);
		end,
	});

	FatalityNewInput(Parent,function()
		if AutoUpdate then
			resrefresh();
		end;

		func(true);
		Toggle(true);
	end);

	UserInputService.InputBeganConnect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			if not FatalityIsMouseOverFrame(DropdownItemFrame) then
				func(false);
				Toggle(false);
			end;
		end;
	end);

	return res;
end;

function FatalityCreateElements(Parent  Frame , ZIndex  number , Event  BindableEvent,SearchAPI {Path string,Memory  (namestring) - any})  Elements
	local elements = {};

	function elementsAddToggle(Config Toggle)
		Config = Config or {};
		Config.Name = Config.Name or Toggle;
		Config.Default = Config.Default or false;
		Config.Risky = Config.Risky or false;
		Config.Option = Config.Option or false;
		Config.Callback = Config.Callback or function(bool) end;

		local Toggle = Instance.new(Frame)
		local Toggle_Name = Instance.new(TextLabel)
		local ValueFrame = Instance.new(Frame)
		local UICorner = Instance.new(UICorner)
		local ValueIcon = Instance.new(ImageLabel)
		local OptionButton = Instance.new(ImageButton)

		if SearchAPI then
			SearchAPI.Memory(Config.Name);
		end;

		Toggle.Name = FatalityRandomString()
		Toggle.Parent = Parent
		Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Toggle.BackgroundTransparency = 1.000
		Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Toggle.BorderSizePixel = 0
		Toggle.Size = UDim2.new(1, -25, 0, 17)
		Toggle.ZIndex = ZIndex + 1

		Toggle_Name.Name = FatalityRandomString()
		Toggle_Name.Parent = Toggle
		Toggle_Name.AnchorPoint = Vector2.new(0, 0.5)
		Toggle_Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Toggle_Name.BackgroundTransparency = 1.000
		Toggle_Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Toggle_Name.BorderSizePixel = 0
		Toggle_Name.Position = UDim2.new(0, 0, 0.5, 0)
		Toggle_Name.Size = UDim2.new(1, 0, 0.800000012, 0)
		Toggle_Name.ZIndex = ZIndex + 2
		Toggle_Name.FontFace = Fatality.FontSemiBold;
		Toggle_Name.TextColor3 = (Config.Risky and Color3.fromRGB(102, 255, 0)) or Color3.fromRGB(255, 255, 255)
		Toggle_Name.TextSize = 13.000
		Toggle_Name.TextTransparency = 1
		Toggle_Name.TextXAlignment = Enum.TextXAlignment.Left;

		FatalityProtectText(Toggle_Name,Config.Name);

		ValueFrame.Name = FatalityRandomString()
		ValueFrame.Parent = Toggle
		ValueFrame.AnchorPoint = Vector2.new(1, 0.5)
		ValueFrame.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
		ValueFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ValueFrame.BorderSizePixel = 0
		ValueFrame.Position = UDim2.new(1, -3, 0.5, 0)
		ValueFrame.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
		ValueFrame.SizeConstraint = Enum.SizeConstraint.RelativeYY
		ValueFrame.ZIndex = ZIndex + 2
		ValueFrame.BackgroundTransparency = 1;

		UICorner.CornerRadius = UDim.new(0, 2)
		UICorner.Parent = ValueFrame

		ValueIcon.Name = FatalityRandomString()
		ValueIcon.Parent = ValueFrame
		ValueIcon.AnchorPoint = Vector2.new(0.5, 0.5)
		ValueIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ValueIcon.BackgroundTransparency = 1.000
		ValueIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ValueIcon.BorderSizePixel = 0
		ValueIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
		ValueIcon.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
		ValueIcon.ZIndex = ZIndex + 2
		ValueIcon.Image = rbxassetid10709790644
		ValueIcon.ImageTransparency = 1;

		OptionButton.Name = FatalityRandomString()
		OptionButton.Parent = Toggle
		OptionButton.AnchorPoint = Vector2.new(1, 0.5)
		OptionButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		OptionButton.BackgroundTransparency = 1.000
		OptionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		OptionButton.BorderSizePixel = 0
		OptionButton.Position = UDim2.new(1, -25, 0.5, 0)
		OptionButton.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
		OptionButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
		OptionButton.Image = httpwww.roblox.comassetid=14007344336
		OptionButton.ImageTransparency = 1
		OptionButton.ZIndex = ZIndex + 4
		OptionButton.Visible = Config.Option;

		local toggleImg = function(value)
			if value then
				FatalityCreateAnimation(ValueIcon,0.45,{
					ImageTransparency = 0,
					ImageColor3 = Color3.fromRGB(50, 255, 50),
					Size = UDim2.new(0.8, 0, 0.8, 0),
					Rotation = 0,
				})
			else
				FatalityCreateAnimation(ValueIcon,0.45,{
					ImageTransparency = 1,
					ImageColor3 = Color3.fromRGB(255, 255, 255),
					Size = UDim2.new(0.699999988, 0, 0.699999988, 0),
					Rotation = 15
				})
			end;
		end;

		local OpcToggle = function(value)
			if value then
				FatalityCreateAnimation(ValueIcon,0.45,{
					ImageTransparency = 1,
				})

				FatalityCreateAnimation(OptionButton,0.45,{
					ImageTransparency = (Config.Option and 0.600) or 1
				})

				toggleImg(Config.Default)

				FatalityCreateAnimation(ValueFrame,0.45,{
					BackgroundTransparency = 0,
				})

				FatalityCreateAnimation(Toggle_Name,0.45,{
					TextTransparency = 0.200
				})
			else
				FatalityCreateAnimation(Toggle_Name,0.45,{
					TextTransparency = 1
				})

				FatalityCreateAnimation(ValueFrame,0.45,{
					BackgroundTransparency = 1,
				})

				FatalityCreateAnimation(ValueIcon,0.45,{
					ImageTransparency = 1,
				})

				FatalityCreateAnimation(ValueIcon,0.45,{
					ImageTransparency = 1,
				})

				FatalityCreateAnimation(OptionButton,0.45,{
					ImageTransparency = 1
				})
			end;
		end;

		OpcToggle(EventGetAttribute('V'))

		toggleImg(Config.Default);

		FatalityCreateHover(ValueFrame,function(b)
			if not Config.Default then
				if b then
					FatalityCreateAnimation(ValueIcon,0.45,{
						ImageTransparency = 0.5,
						ImageColor3 = Color3.fromRGB(255, 255, 255),
						Size = UDim2.new(0.7, 0, 0.7, 0),
						Rotation = 0
					})
				else
					FatalityCreateAnimation(ValueIcon,0.45,{
						ImageTransparency = 1,
						ImageColor3 = Color3.fromRGB(255, 255, 255),
						Size = UDim2.new(0.699999988, 0, 0.699999988, 0),
						Rotation = 15
					})
				end;
			end;
		end)

		FatalityNewInput(ValueFrame,function()
			Config.Default = not Config.Default;
			toggleImg(Config.Default);
			Config.Callback(Config.Default)
		end);

		return FatalityCreateResponse({
			Rename = function(new_name)
				Toggle_Name.Text = new_name;
				FatalityProtectText(Toggle_Name,new_name);
			end,
			Signal = Event.EventConnect(OpcToggle),
			SetValue = function(v)
				Config.Default = v;

				toggleImg(Config.Default);
			end,
			Option = (Config.Option and FatalityCreateOption(OptionButton)) or nil;
		})
	end;

	function elementsAddSlider(Config Slider)
		Config = Config or {};
		Config.Name = Config.Name or Slider;
		Config.Type = Config.Type or ;
		Config.Default = Config.Default or 50;
		Config.Min = Config.Min or 0;
		Config.Max = Config.Max or 100;
		Config.Round = Config.Round or 0;
		Config.Risky = Config.Risky or false;
		Config.Option = Config.Option or false;
		Config.Callback = Config.Callback or function(number) end;

		local Slider = Instance.new(Frame)
		local Slider_Name = Instance.new(TextLabel)
		local ValueFrame = Instance.new(Frame)
		local UICorner = Instance.new(UICorner)
		local OptionButton = Instance.new(ImageButton)
		local boxli = Instance.new(Frame)
		local UICorner_2 = Instance.new(UICorner)
		local ValueText = Instance.new(TextLabel)

		if SearchAPI then
			SearchAPI.Memory(Config.Name);
		end;

		Slider.Name = FatalityRandomString()
		Slider.Parent = Parent
		Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Slider.BackgroundTransparency = 1.000
		Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Slider.BorderSizePixel = 0
		Slider.Size = UDim2.new(1, -25, 0, 17)
		Slider.ZIndex = ZIndex + 1

		Slider_Name.Name = FatalityRandomString()
		Slider_Name.Parent = Slider
		Slider_Name.AnchorPoint = Vector2.new(0, 0.5)
		Slider_Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Slider_Name.BackgroundTransparency = 1.000
		Slider_Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Slider_Name.BorderSizePixel = 0
		Slider_Name.Position = UDim2.new(0, 0, 0.5, 0)
		Slider_Name.Size = UDim2.new(1, 0, 0.800000012, 0)
		Slider_Name.ZIndex = ZIndex + 2
		Slider_Name.FontFace = Fatality.FontSemiBold
		Slider_Name.Text = Config.Name
		Slider_Name.TextColor3 = (Config.Risky and Color3.fromRGB(102, 255, 0)) or Color3.fromRGB(255, 255, 255)
		Slider_Name.TextSize = 13.000
		Slider_Name.TextTransparency = 0.200
		Slider_Name.TextXAlignment = Enum.TextXAlignment.Left

		ValueFrame.Name = FatalityRandomString()
		ValueFrame.Parent = Slider
		ValueFrame.AnchorPoint = Vector2.new(1, 0.5)
		ValueFrame.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
		ValueFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ValueFrame.BorderSizePixel = 0
		ValueFrame.Position = UDim2.new(1, -3, 0.5, 0)
		ValueFrame.Size = UDim2.new(0, 85, 0.600000024, 0)
		ValueFrame.ZIndex = ZIndex + 2

		UICorner.CornerRadius = UDim.new(0, 2)
		UICorner.Parent = ValueFrame

		OptionButton.Name = FatalityRandomString()
		OptionButton.Parent = ValueFrame
		OptionButton.AnchorPoint = Vector2.new(0, 0.5)
		OptionButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		OptionButton.BackgroundTransparency = 1.000
		OptionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		OptionButton.BorderSizePixel = 0
		OptionButton.Position = UDim2.new(0, -20, 0.5, 0)
		OptionButton.Size = UDim2.new(0, 13, 0, 13)
		OptionButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
		OptionButton.Image = httpwww.roblox.comassetid=14007344336
		OptionButton.ImageTransparency = 0.600
		OptionButton.Visible = Config.Option;
		OptionButton.ZIndex = ZIndex + 1;

		boxli.Name = FatalityRandomString()
		boxli.Parent = ValueFrame
		boxli.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
		boxli.BorderColor3 = Color3.fromRGB(0, 0, 0)
		boxli.BorderSizePixel = 0
		boxli.Size = UDim2.new((Config.Default - Config.Min)  (Config.Max - Config.Min), 0, 1, 0)
		boxli.ZIndex = ZIndex + 3

		UICorner_2.CornerRadius = UDim.new(0, 2)
		UICorner_2.Parent = boxli

		ValueText.Name = FatalityRandomString()
		ValueText.Parent = ValueFrame
		ValueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ValueText.BackgroundTransparency = 1.000
		ValueText.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ValueText.BorderSizePixel = 0
		ValueText.Size = UDim2.new(1, 0, 1, 0)
		ValueText.ZIndex = ZIndex + 4
		ValueText.FontFace = Fatality.FontSemiBold
		ValueText.Text = string.format('%s%s',tostring(Config.Default),tostring(Config.Type));
		ValueText.TextColor3 = Color3.fromRGB(255, 255, 255)
		ValueText.TextSize = 9.000
		ValueText.TextStrokeTransparency = 0.850;
		ValueText.TextTransparency = 0;

		local OpcToggle = function(value)
			if value then
				FatalityCreateAnimation(boxli,0.45,{
					BackgroundTransparency = 0,
				})

				FatalityCreateAnimation(OptionButton,0.45,{
					ImageTransparency = (Config.Option and 0.600) or 1
				})

				FatalityCreateAnimation(ValueFrame,0.45,{
					BackgroundTransparency = 0,
				})

				FatalityCreateAnimation(Slider_Name,0.45,{
					TextTransparency = 0.200
				})

				FatalityCreateAnimation(ValueText,0.45,{
					TextStrokeTransparency = 0.850,
					TextTransparency = 0;
				})
			else
				FatalityCreateAnimation(ValueText,0.45,{
					TextStrokeTransparency = 1,
					TextTransparency = 1;
				})

				FatalityCreateAnimation(Slider_Name,0.45,{
					TextTransparency = 1
				})

				FatalityCreateAnimation(ValueFrame,0.45,{
					BackgroundTransparency = 1,
				})

				FatalityCreateAnimation(boxli,0.45,{
					BackgroundTransparency = 1,
				})

				FatalityCreateAnimation(OptionButton,0.45,{
					ImageTransparency = 1
				})
			end;
		end;

		OpcToggle(EventGetAttribute('V'))

		local IsHold = false;

		local function update(Input)
			local SizeScale = math.clamp((((Input.Position.X) - ValueFrame.AbsolutePosition.X)  ValueFrame.AbsoluteSize.X), 0, 1);
			local Main = ((Config.Max - Config.Min)  SizeScale) + Config.Min;
			local Value = FatalityRounding(Main,Config.Round);
			local PositionX = UDim2.fromScale(SizeScale, 1);
			local normalized = (Value - Config.Min)  (Config.Max - Config.Min);

			TweenServiceCreate(boxli , TweenInfo.new(0.2),{
				Size = UDim2.new(normalized, 0, 1, 0)
			})Play();

			Config.Default = Value;
			ValueText.Text = string.format('%s%s',tostring(Config.Default),tostring(Config.Type));

			Config.Callback(Value)
		end;

		do
			ValueFrame.InputBeganConnect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					IsHold = true
					update(Input)
				end
			end)

			ValueFrame.InputEndedConnect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					if UserInputService.TouchEnabled then
						if not FatalityIsMouseOverFrame(ValueFrame) then
							IsHold = false
						end;
					else
						IsHold = false
					end;
				end
			end)

			UserInputService.InputChangedConnect(function(Input)
				if IsHold then
					if (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch)  then
						if UserInputService.TouchEnabled then
							if not FatalityIsMouseOverFrame(ValueFrame) then
								IsHold = false
							else
								update(Input)
							end;
						else
							update(Input)
						end;
					end;
				end;
			end);
		end;

		return FatalityCreateResponse({
			Rename = function(new_name)
				Slider_Name.Text = new_name
			end,
			Signal = Event.EventConnect(OpcToggle),
			SetValue = function(v)
				Config.Default = v;

				TweenServiceCreate(boxli , TweenInfo.new(0.2),{
					Size = UDim2.new((Config.Default - Config.Min)  (Config.Max - Config.Min), 0, 1, 0)
				})Play();

				Config.Default = v;
				ValueText.Text = string.format('%s%s',tostring(Config.Default),tostring(Config.Type));
			end,
			Option = (Config.Option and FatalityCreateOption(OptionButton)) or nil;
		})
	end;

	function elementsAddButton(Config Button)
		Config = Config or {};
		Config.Name = Config.Name or Slider;
		Config.Risky = Config.Risky or false;
		Config.Callback = Config.Callback or function() end;

		local Button = Instance.new(Frame)
		local Button_Name = Instance.new(TextLabel)
		local UICorner = Instance.new(UICorner)

		if SearchAPI then
			SearchAPI.Memory(Config.Name);
		end;

		Button.Name = FatalityRandomString()
		Button.Parent = Parent
		Button.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
		Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button.BorderSizePixel = 0
		Button.Size = UDim2.new(1, -25, 0, 25)
		Button.ZIndex = ZIndex + 1

		Button_Name.Name = FatalityRandomString()
		Button_Name.Parent = Button
		Button_Name.AnchorPoint = Vector2.new(0, 0.5)
		Button_Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button_Name.BackgroundTransparency = 1.000
		Button_Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button_Name.BorderSizePixel = 0
		Button_Name.Position = UDim2.new(0, 0, 0.5, 0)
		Button_Name.Size = UDim2.new(1, 0, 0.800000012, 0)
		Button_Name.ZIndex = ZIndex + 2
		Button_Name.FontFace = Fatality.FontSemiBold
		Button_Name.Text = Config.Name
		Button_Name.TextColor3 = (Config.Risky and Color3.fromRGB(102, 255, 0)) or Color3.fromRGB(255, 255, 255)
		Button_Name.TextSize = 12.000
		Button_Name.TextTransparency = 0.400
		FatalityProtectText(Button_Name,Config.Name);

		UICorner.CornerRadius = UDim.new(0, 2)
		UICorner.Parent = Button;

		local OpcToggle = function(value)
			if value then
				FatalityCreateAnimation(Button_Name,0.45,{
					TextTransparency = 0.4,
				})

				FatalityCreateAnimation(Button,0.45,{
					BackgroundTransparency = 0,
				})
			else
				FatalityCreateAnimation(Button_Name,0.45,{
					TextTransparency = 1,
				})

				FatalityCreateAnimation(Button,0.45,{
					BackgroundTransparency = 1,
				})
			end;
		end;

		OpcToggle(EventGetAttribute('V'));

		FatalityCreateHover(Button,function(value)
			if value then
				FatalityCreateAnimation(Button,0.45,{
					BackgroundColor3 = Color3.fromRGB(14, 14, 14)
				})
			else
				FatalityCreateAnimation(Button,0.45,{
					BackgroundColor3 = Color3.fromRGB(13, 13, 13)
				})
			end;
		end)

		FatalityNewInput(Button,function()
			Config.Callback();
		end)

		return FatalityCreateResponse({
			Rename = function(new_name)
				Button_Name.Text = new_name
				FatalityProtectText(Button_Name,new_name);
			end,
			Signal = Event.EventConnect(OpcToggle),
			Fire = Config.Callback,
		})
	end;

	function elementsAddColorPicker(Config ColorPicker)
		Config = Config or {};
		Config.Name = Config.Name or Color Picker;
		Config.Option = Config.Option or false;
		Config.Default = Config.Default or Color3.fromRGB(255, 255, 255);
		Config.Callback = Config.Callback or function(number) end;
		Config.Transparency = Config.Transparency or 0;

		local ColorPicker = Instance.new(Frame)
		local ColorPicker_Name = Instance.new(TextLabel)
		local ValueFrame = Instance.new(Frame)
		local UICorner = Instance.new(UICorner)
		local OptionButton = Instance.new(ImageButton)

		if SearchAPI then
			SearchAPI.Memory(Config.Name);
		end;

		ColorPicker.Name = FatalityRandomString()
		ColorPicker.Parent = Parent
		ColorPicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ColorPicker.BackgroundTransparency = 1.000
		ColorPicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ColorPicker.BorderSizePixel = 0
		ColorPicker.Size = UDim2.new(1, -25, 0, 17)
		ColorPicker.ZIndex = ZIndex + 1

		ColorPicker_Name.Name = FatalityRandomString()
		ColorPicker_Name.Parent = ColorPicker
		ColorPicker_Name.AnchorPoint = Vector2.new(0, 0.5)
		ColorPicker_Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ColorPicker_Name.BackgroundTransparency = 1.000
		ColorPicker_Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ColorPicker_Name.BorderSizePixel = 0
		ColorPicker_Name.Position = UDim2.new(0, 0, 0.5, 0)
		ColorPicker_Name.Size = UDim2.new(1, 0, 0.800000012, 0)
		ColorPicker_Name.ZIndex = ZIndex + 2
		ColorPicker_Name.FontFace = Fatality.FontSemiBold
		ColorPicker_Name.Text = Config.Name
		ColorPicker_Name.TextColor3 = Color3.fromRGB(255, 255, 255)
		ColorPicker_Name.TextSize = 13.000
		ColorPicker_Name.TextTransparency = 0.200
		ColorPicker_Name.TextXAlignment = Enum.TextXAlignment.Left
		ColorPicker_Name.ZIndex = ZIndex + 2

		ValueFrame.Name = FatalityRandomString()
		ValueFrame.Parent = ColorPicker
		ValueFrame.AnchorPoint = Vector2.new(1, 0.5)
		ValueFrame.BackgroundColor3 = Config.Default
		ValueFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ValueFrame.BorderSizePixel = 0
		ValueFrame.Position = UDim2.new(1, -3, 0.5, 0)
		ValueFrame.Size = UDim2.new(0, 35, 0.699999988, 0)
		ValueFrame.ZIndex = ZIndex + 3

		UICorner.CornerRadius = UDim.new(0, 2)
		UICorner.Parent = ValueFrame

		OptionButton.Name = FatalityRandomString()
		OptionButton.Parent = ValueFrame
		OptionButton.AnchorPoint = Vector2.new(0, 0.5)
		OptionButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		OptionButton.BackgroundTransparency = 1.000
		OptionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		OptionButton.BorderSizePixel = 0
		OptionButton.Position = UDim2.new(0, -20, 0.5, 0)
		OptionButton.Size = UDim2.new(0, 13, 0, 13)
		OptionButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
		OptionButton.Image = httpwww.roblox.comassetid=14007344336
		OptionButton.ImageTransparency = 0.600
		OptionButton.ZIndex = 7;

		local res = FatalityCreateColorPicker(ValueFrame,Config.Transparency,function(rgb,opc)
			ValueFrame.BackgroundColor3 = rgb;
			ValueFrame.BackgroundTransparency = opc;

			task.spawn(Config.Callback,rgb,opc)
		end);

		local OpcToggle = function(value)
			if value then
				FatalityCreateAnimation(ColorPicker_Name,0.45,{
					TextTransparency = 0.2,
				})

				FatalityCreateAnimation(ValueFrame,0.45,{
					Size = UDim2.new(0, 35, 0.7, 0)
				})

				FatalityCreateAnimation(OptionButton,0.45,{
					ImageTransparency = (Config.Option and 0.6) or 1,
				})
			else
				FatalityCreateAnimation(ColorPicker_Name,0.45,{
					TextTransparency = 1,
				})

				FatalityCreateAnimation(ValueFrame,0.45,{
					Size = UDim2.new(0, 35, 0, 0)
				})

				FatalityCreateAnimation(OptionButton,0.45,{
					ImageTransparency = 1,
				})
			end;
		end;

		OpcToggle(EventGetAttribute('V'));

		return FatalityCreateResponse({
			Rename = function(new_name)
				ColorPicker.Text = new_name
			end,
			Signal = Event.EventConnect(OpcToggle),
			SetValue = function(rgb,opc)
				ValueFrame.BackgroundColor3 = rgb;
				ValueFrame.BackgroundTransparency = opc;
				res.set_opc(opc)
			end,
			Option = (Config.Option and FatalityCreateOption(OptionButton)) or nil;
		})
	end;

	function elementsAddDropdown(Config Dropdown)
		Config = Config or {};
		Config.Name = Config.Name or Dropdown;
		Config.Option = Config.Option or false;
		Config.Default = Config.Default or nil;
		Config.Callback = Config.Callback or function(any) end;
		Config.Values = Config.Values or {};
		Config.Multi = Config.Multi or false;

		local DataParser = function(value)
			if not value then return 'None'; end;

			local Out;

			if typeof(value) == 'table' then
				if #value  0 then
					local x = {};

					for i,v in next , value do
						table.insert(x , tostring(v))
					end;

					Out = table.concat(x,' , ');
				else
					local x = {};

					for i,v in next , value do
						if v == true then
							table.insert(x , tostring(i));
						end			
					end;

					Out = table.concat(x,' , ');
				end;
			else
				Out = tostring(value);
			end;

			return Out;
		end;

		local Dropdown = Instance.new(Frame)
		local Dropdown_Name = Instance.new(TextLabel)
		local ValueFrame = Instance.new(Frame)
		local UICorner = Instance.new(UICorner)
		local OptionButton = Instance.new(ImageButton)
		local icon = Instance.new(ImageLabel)
		local Value_Text = Instance.new(TextLabel)

		if SearchAPI then
			SearchAPI.Memory(Config.Name);
		end;

		Dropdown.Name = FatalityRandomString()
		Dropdown.Parent = Parent
		Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Dropdown.BackgroundTransparency = 1.000
		Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Dropdown.BorderSizePixel = 0
		Dropdown.Size = UDim2.new(1, -25, 0, 17)
		Dropdown.ZIndex = ZIndex + 3

		Dropdown_Name.Name = FatalityRandomString()
		Dropdown_Name.Parent = Dropdown
		Dropdown_Name.AnchorPoint = Vector2.new(0, 0.5)
		Dropdown_Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Dropdown_Name.BackgroundTransparency = 1.000
		Dropdown_Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Dropdown_Name.BorderSizePixel = 0
		Dropdown_Name.Position = UDim2.new(0, 0, 0, 8)
		Dropdown_Name.Size = UDim2.new(1, 0, 0.800000012, 0)
		Dropdown_Name.ZIndex = 7
		Dropdown_Name.FontFace = Fatality.FontSemiBold
		Dropdown_Name.Text = Config.Name
		Dropdown_Name.TextColor3 = Color3.fromRGB(255, 255, 255)
		Dropdown_Name.TextSize = 13.000
		Dropdown_Name.TextTransparency = 0.200
		Dropdown_Name.TextXAlignment = Enum.TextXAlignment.Left
		Dropdown_Name.ZIndex = ZIndex + 4
		FatalityProtectText(Dropdown_Name,Config.Name);

		ValueFrame.Name = FatalityRandomString()
		ValueFrame.Parent = Dropdown
		ValueFrame.AnchorPoint = Vector2.new(1, 0.5)
		ValueFrame.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
		ValueFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ValueFrame.BorderSizePixel = 0
		ValueFrame.Position = UDim2.new(1, -3, 0.5, 0)
		ValueFrame.Size = UDim2.new(0, 75, 0.925000012, 0)
		ValueFrame.ZIndex = ZIndex + 4

		UICorner.CornerRadius = UDim.new(0, 2)
		UICorner.Parent = ValueFrame

		OptionButton.Name = FatalityRandomString()
		OptionButton.Parent = ValueFrame
		OptionButton.AnchorPoint = Vector2.new(0, 0.5)
		OptionButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		OptionButton.BackgroundTransparency = 1.000
		OptionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		OptionButton.BorderSizePixel = 0
		OptionButton.Position = UDim2.new(0, -20, 0, 7)
		OptionButton.Size = UDim2.new(0, 13, 0, 13)
		OptionButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
		OptionButton.Image = httpwww.roblox.comassetid=14007344336
		OptionButton.ImageTransparency = 0.600
		OptionButton.ZIndex = 8
		OptionButton.Visible = Config.Option;

		icon.Name = FatalityRandomString()
		icon.Parent = ValueFrame
		icon.AnchorPoint = Vector2.new(1, 0)
		icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		icon.BackgroundTransparency = 1.000
		icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		icon.BorderSizePixel = 0
		icon.Position = UDim2.new(1, 0, 0, 0)
		icon.Size = UDim2.new(0,15,0,15)
		icon.SizeConstraint = Enum.SizeConstraint.RelativeYY
		icon.ZIndex = ZIndex + 5
		icon.Image = rbxassetid10709790948

		Value_Text.Name = FatalityRandomString()
		Value_Text.Parent = ValueFrame
		Value_Text.AnchorPoint = Vector2.new(0, 0.5)
		Value_Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Value_Text.BackgroundTransparency = 1.000
		Value_Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Value_Text.BorderSizePixel = 0
		Value_Text.Position = UDim2.new(0, 3, 0.5, 0)
		Value_Text.Size = UDim2.new(1, -18, 0.800000012, 0)
		Value_Text.ZIndex = ZIndex + 5
		Value_Text.FontFace = Fatality.FontSemiBold
		Value_Text.Text = DataParser(Config.Default)
		Value_Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Value_Text.TextSize = 10.000
		Value_Text.TextTransparency = 0.500
		Value_Text.TextXAlignment = Enum.TextXAlignment.Left
		Value_Text.TextYAlignment = Enum.TextYAlignment.Top
		Value_Text.TextWrapped = true
		Value_Text.TextTruncate = Enum.TextTruncate.SplitWord

		local res;
		res = FatalityCreateDropdown(ValueFrame,Config.Default,Config.Multi,Config.AutoUpdate,function(args)
			Config.Default = args;
			Value_Text.Text = DataParser(Config.Default);

            reschange_default(Config.Default);
            
			Config.Callback(args);

            
		end);

		resset_data(Config.Values);
		resrefresh();

		reson_toggle(function(b)
			if b then
				FatalityCreateAnimation(icon,0.35,{
					Rotation = -180,
					ImageColor3 = Color3.fromRGB(50, 255, 50)
				})
			else
				FatalityCreateAnimation(icon,0.35,{
					Rotation = 0,
					ImageColor3 = Color3.fromRGB(255, 255, 255)
				})
			end;
		end);

		local OpcToggle = function(value)
			if value then
				FatalityCreateAnimation(Dropdown_Name,0.45,{
					TextTransparency = 0.2,
				})

				FatalityCreateAnimation(ValueFrame,0.45,{
					BackgroundTransparency = 0
				})

				FatalityCreateAnimation(icon,0.45,{
					ImageTransparency = 0
				})

				FatalityCreateAnimation(Value_Text,0.45,{
					TextTransparency = 0.5
				})

				FatalityCreateAnimation(OptionButton,0.45,{
					ImageTransparency = (Config.Option and 0.6) or 1,
				})
			else
				FatalityCreateAnimation(Dropdown_Name,0.45,{
					TextTransparency = 1,
				})

				FatalityCreateAnimation(ValueFrame,0.45,{
					BackgroundTransparency = 1
				})

				FatalityCreateAnimation(icon,0.45,{
					ImageTransparency = 1
				})

				FatalityCreateAnimation(Value_Text,0.45,{
					TextTransparency = 1
				})

				FatalityCreateAnimation(OptionButton,0.45,{
					ImageTransparency = 1
				})
			end;
		end;

		OpcToggle(EventGetAttribute('V'));

		return FatalityCreateResponse({
			Rename = function(new_name)
				Dropdown_Name.Text = new_name
				FatalityProtectText(Dropdown_Name,new_name);
			end,
			Signal = Event.EventConnect(OpcToggle),
			SetValue = function(def)
				Config.Default = def;
				Value_Text.Text = DataParser(Config.Default);
                reschange_default(Config.Default);
			end,
			SetData = function(def)
				Config.Values = def;
				resset_data(Config.Values);
				if not Config.AutoUpdate then
					resrefresh();
				end
			end,
			Option = (Config.Option and FatalityCreateOption(OptionButton)) or nil;
		})
	end;

	function elementsAddKeybind(Config Keybind)
		Config = Config or {};
		Config.Name = Config.Name or Keybind;
		Config.Option = Config.Option or false;
		Config.Default = Config.Default or nil;
		Config.Callback = Config.Callback or function(any) end;

		local Keys = {
			One = '1',
			Two = '2',
			Three = '3',
			Four = '4',
			Five = '5',
			Six = '6',
			Seven = '7',
			Eight = '8',
			Nine = '9',
			Zero = '0',
			['Minus'] = -,
			['Plus'] = +,
			BackSlash = ,
			Slash = ,
			Period = '.',
			Semicolon = ';',
			Colon = ,
			LeftControl = LCtrl,
			RightControl = RCtrl,
			LeftShift = LShift,
			RightShift = RShift,
			Return = Enter,
			LeftBracket = [,
			RightBracket = ],
			Quote = ',
			Comma = ,,
			Equals = =,
			LeftSuper = Super,
			RightSuper = Super
		};

		local GetItem = function(item)
			if item then
				if typeof(item) == 'EnumItem' then
					return Keys[item.Name] or item.Name;
				else
					return Keys[tostring(item)] or tostring(item);
				end;
			else
				return 'None';
			end;
		end;

		local Keybind = Instance.new(Frame)
		local Keybind_Name = Instance.new(TextLabel)
		local ValueFrame = Instance.new(Frame)
		local UICorner = Instance.new(UICorner)
		local OptionButton = Instance.new(ImageButton)
		local ValueText = Instance.new(TextLabel)

		if SearchAPI then
			SearchAPI.Memory(Config.Name);
		end;

		Keybind.Name = FatalityRandomString()
		Keybind.Parent = Parent
		Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Keybind.BackgroundTransparency = 1.000
		Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Keybind.BorderSizePixel = 0
		Keybind.Size = UDim2.new(1, -25, 0, 17)
		Keybind.ZIndex = ZIndex + 1

		Keybind_Name.Name = FatalityRandomString()
		Keybind_Name.Parent = Keybind
		Keybind_Name.AnchorPoint = Vector2.new(0, 0.5)
		Keybind_Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Keybind_Name.BackgroundTransparency = 1.000
		Keybind_Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Keybind_Name.BorderSizePixel = 0
		Keybind_Name.Position = UDim2.new(0, 0, 0.5, 0)
		Keybind_Name.Size = UDim2.new(1, 0, 0.800000012, 0)
		Keybind_Name.ZIndex = ZIndex + 2
		Keybind_Name.FontFace = Fatality.FontSemiBold
		Keybind_Name.Text = Config.Name
		Keybind_Name.TextColor3 = Color3.fromRGB(255, 255, 255)
		Keybind_Name.TextSize = 13.000
		Keybind_Name.TextTransparency = 0.200
		Keybind_Name.TextXAlignment = Enum.TextXAlignment.Left
		FatalityProtectText(Keybind_Name,Config.Name);

		ValueFrame.Name = FatalityRandomString()
		ValueFrame.Parent = Keybind
		ValueFrame.AnchorPoint = Vector2.new(1, 0.5)
		ValueFrame.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
		ValueFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ValueFrame.BorderSizePixel = 0
		ValueFrame.Position = UDim2.new(1, -3, 0.5, 0)
		ValueFrame.Size = UDim2.new(0, 75, 0.850000024, 0)
		ValueFrame.ZIndex = ZIndex + 2

		UICorner.CornerRadius = UDim.new(0, 2)
		UICorner.Parent = ValueFrame

		OptionButton.Name = FatalityRandomString()
		OptionButton.Parent = ValueFrame
		OptionButton.AnchorPoint = Vector2.new(0, 0.5)
		OptionButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		OptionButton.BackgroundTransparency = 1.000
		OptionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		OptionButton.BorderSizePixel = 0
		OptionButton.Position = UDim2.new(0, -20, 0.5, 0)
		OptionButton.Size = UDim2.new(0, 13, 0, 13)
		OptionButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
		OptionButton.Image = httpwww.roblox.comassetid=14007344336
		OptionButton.ImageTransparency = 0.600
		OptionButton.Visible = Config.Option or false;

		ValueText.Name = FatalityRandomString()
		ValueText.Parent = ValueFrame
		ValueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ValueText.BackgroundTransparency = 1.000
		ValueText.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ValueText.BorderSizePixel = 0
		ValueText.Size = UDim2.new(1, 0, 1, 0)
		ValueText.ZIndex = ZIndex + 3
		ValueText.FontFace = Fatality.FontSemiBold
		ValueText.Text = GetItem(Config.Default)
		ValueText.TextColor3 = Color3.fromRGB(255, 255, 255)
		ValueText.TextSize = 9.000
		ValueText.TextStrokeTransparency = 0.850
		ValueText.TextTransparency = 0.400

		local IsBinding = false;
		FatalityNewInput(ValueFrame,function()
			if IsBinding then
				return;
			end;

			ValueText.Text = ...;

			local Selected = nil;
			while not Selected do
				local Key = UserInputService.InputBeganWait();

				if Key.KeyCode ~= Enum.KeyCode.Unknown then
					Selected = Key.KeyCode;
				else
					if Key.UserInputType == Enum.UserInputType.MouseButton1 then
						Selected = MouseLeft;
					elseif Key.UserInputType == Enum.UserInputType.MouseButton2 then
						Selected = MouseRight;
					end;
				end;
			end;

			Config.Default = Selected;

			ValueText.Text = GetItem(Selected);

			IsBinding = false;

			Config.Callback(typeof(Selected) == string and Selected or Selected.Name);
		end);

		local OpcToggle = function(value)
			if value then
				FatalityCreateAnimation(Keybind_Name,0.45,{
					TextTransparency = 0.2,
				})

				FatalityCreateAnimation(ValueFrame,0.45,{
					BackgroundTransparency = 0
				})

				FatalityCreateAnimation(ValueText,0.45,{
					TextStrokeTransparency = 0.850,
					TextTransparency = 0.400
				})

				FatalityCreateAnimation(OptionButton,0.45,{
					ImageTransparency = (Config.Option and 0.6) or 1,
				})
			else
				FatalityCreateAnimation(Keybind_Name,0.45,{
					TextTransparency = 1,
				})

				FatalityCreateAnimation(ValueFrame,0.45,{
					BackgroundTransparency = 1
				})

				FatalityCreateAnimation(ValueText,0.45,{
					TextStrokeTransparency = 1,
					TextTransparency = 1
				})

				FatalityCreateAnimation(OptionButton,0.45,{
					ImageTransparency = 1,
				})
			end;
		end;

		OpcToggle(EventGetAttribute('V'));

		return FatalityCreateResponse({
			Rename = function(new_name)
				Keybind_Name.Text = new_name
				FatalityProtectText(Keybind_Name,new_name);
			end,
			Signal = Event.EventConnect(OpcToggle),
			SetValue = function(def)
				Config.Default = def;
				ValueText.Text = GetItem(Config.Default);
			end,
			Option = (Config.Option and FatalityCreateOption(OptionButton)) or nil;
		})
	end;

	return elements;
end;

function Fatality.new(Window Window)
	Window = Window or {};
	Window.Name = Window.Name or FATALITY;
	Window.Scale = Window.Scale or UDim2.new(0, 750, 0, 500);
	Window.Keybind = Window.Keybind or Insert;
	Window.Expire = Window.Expire or never;

	local Fatal = {
		Menus = {},
		ElementContents = {},
		MenuSelected = nil,
		Toggle = true,
		Signal = Instance.new('BindableEvent');
	};

	local Fatalitywin = Instance.new(ScreenGui)
	local FatalFrame = Instance.new(Frame)
	local UICorner = Instance.new(UICorner)
	local DropShadow = Instance.new(ImageLabel)
	local Header = Instance.new(Frame)
	local HeaderLine = Instance.new(Frame)
	local UICorner_2 = Instance.new(UICorner)
	local HeaderText = Instance.new(TextLabel)
	local MenuButtonCont = Instance.new(Frame)
	local tbc = Instance.new(ScrollingFrame)
	local UIListLayout = Instance.new(UIListLayout)
	local UserProfle = Instance.new(Frame)
	local UserIcon = Instance.new(ImageLabel)
	local UICorner_3 = Instance.new(UICorner)
	local UIStroke = Instance.new(UIStroke)
	local User_name = Instance.new(TextLabel)
	local expire_days = Instance.new(TextLabel)
	local HeaderLineShadow = Instance.new(Frame)
	local UIGradient = Instance.new(UIGradient)
	local UICorner_4 = Instance.new(UICorner)
	local MenuFrame = Instance.new(Frame)
	local Bottom = Instance.new(Frame)
	local HeaderLine_2 = Instance.new(Frame)
	local UICorner_5 = Instance.new(UICorner)
	local HeaderLineShadow_2 = Instance.new(Frame)
	local UIGradient_2 = Instance.new(UIGradient)
	local UICorner_6 = Instance.new(UICorner)
	local InfoButton = Instance.new(ImageButton)
	local SearchButton = Instance.new(ImageButton)
	local SaveButton = Instance.new(ImageButton)

	FatalityScrollSignal(tbc,UIListLayout,'X');

	FatalFrameGetPropertyChangedSignal(BackgroundTransparency)Connect(function()
		if FatalFrame.BackgroundTransparency = 0.99 then
			Fatalitywin.Enabled = false;
		else
			Fatalitywin.Enabled = true;
		end;
	end);

	local ToggleUI = function(bool)
		Fatal.SignalFire(bool);

		if bool then
			for i,v in next , Fatal.Menus do
				v.ValueSelect(false);
			end;

			if Fatal.MenuSelected then
				Fatal.MenuSelected.ValueSelect(true)
			end

			FatalityCreateAnimation(FatalFrame,0.15,{
				Size = Window.Scale,
				BackgroundTransparency = 0,
			})

			FatalityCreateAnimation(Header,0.5,{
				BackgroundTransparency = 0,
			})

			FatalityCreateAnimation(HeaderLine,0.5,{
				BackgroundTransparency = 0,
			})

			FatalityCreateAnimation(Bottom,0.5,{
				BackgroundTransparency = 0,
			})

			FatalityCreateAnimation(HeaderLine_2,0.5,{
				BackgroundTransparency = 0,
			})

			FatalityCreateAnimation(HeaderLineShadow,0.5,{
				BackgroundTransparency = 0.5,
			})

			FatalityCreateAnimation(HeaderLineShadow_2,0.5,{
				BackgroundTransparency = 0.5,
			})

			--Fatalitywin.Enabled = true;

			FatalityCreateAnimation(InfoButton,0.25,{
				ImageTransparency = 0.5
			})

			FatalityCreateAnimation(SearchButton,0.25,{
				ImageTransparency = 0.5
			})

			FatalityCreateAnimation(SaveButton,0.25,{
				ImageTransparency = 0.5
			})

			FatalityCreateAnimation(HeaderText,0.35,{
				TextStrokeTransparency = 0.640,
				TextTransparency = 0
			})

			FatalityCreateAnimation(UserIcon,0.45,{
				ImageTransparency = 0,
				Position = UDim2.new(1, -10,0.5, 0)
			})

			FatalityCreateAnimation(User_name,0.35,{
				TextTransparency = 0,
				Position = UDim2.new(1, -40,0, 3)
			})

			FatalityCreateAnimation(expire_days,0.5,{
				TextTransparency = 0,
				Position = UDim2.new(1, -40,0, 16)
			})

			FatalityCreateAnimation(UIStroke,0.35,{
				Thickness = 2.500,
				Transparency = 0.900
			})

			FatalityCreateAnimation(InfoButton,0.1,Enum.EasingStyle.Back,{
				Position = UDim2.new(1, -5,0.5, 0)
			})

			FatalityCreateAnimation(SearchButton,0.1,Enum.EasingStyle.Back,{
				Position = UDim2.new(0,10,0.5, 0)
			})

			FatalityCreateAnimation(SaveButton,0.1,Enum.EasingStyle.Back,{
				Position = UDim2.new(0,35,0.5, 0)
			})

			FatalityCreateAnimation(DropShadow,0.35,{
				ImageTransparency = 0.75
			})
		else
			for i,v in next , Fatal.Menus do
				v.ValueSelect(false);
			end;

			--Fatalitywin.Enabled = false;

			FatalityCreateAnimation(SaveButton,0.35,{
				Position = UDim2.new(0,35,1, 20)
			})

			FatalityCreateAnimation(SearchButton,0.35,{
				Position = UDim2.new(0,10,1, 20)
			})

			FatalityCreateAnimation(InfoButton,0.35,{
				Position = UDim2.new(1, -5,1, 20)
			})

			FatalityCreateAnimation(UIStroke,0.35,{
				Thickness = 0,
				Transparency = 1
			})

			FatalityCreateAnimation(UserIcon,0.35,{
				ImageTransparency = 1,
				Position = UDim2.new(1, -10,0.5, 0)
			})

			FatalityCreateAnimation(User_name,0.35,{
				TextTransparency = 1,
				Position = UDim2.new(1, -40,0, 3)
			})

			FatalityCreateAnimation(expire_days,0.1,{
				TextTransparency = 1,
				Position = UDim2.new(1, -40,0, 16)
			})

			FatalityCreateAnimation(HeaderText,0.35,{
				TextStrokeTransparency = 1,
				TextTransparency = 1
			})

			FatalityCreateAnimation(HeaderLineShadow_2,0.5,{
				BackgroundTransparency = 1,
			})

			FatalityCreateAnimation(InfoButton,0.35,{
				ImageTransparency = 1
			})

			FatalityCreateAnimation(SearchButton,0.35,{
				ImageTransparency = 1
			})

			FatalityCreateAnimation(SaveButton,0.35,{
				ImageTransparency = 1
			})

			FatalityCreateAnimation(HeaderLineShadow,0.5,{
				BackgroundTransparency = 1,
			})

			FatalityCreateAnimation(FatalFrame,0.75,{
				BackgroundTransparency = 1,
			})

			FatalityCreateAnimation(Header,0.5,{
				BackgroundTransparency = 1,
			})

			FatalityCreateAnimation(HeaderLine,0.5,{
				BackgroundTransparency = 1,
			})

			FatalityCreateAnimation(Bottom,0.5,{
				BackgroundTransparency = 1,
			})

			FatalityCreateAnimation(HeaderLine_2,0.5,{
				BackgroundTransparency = 1,
			})

			FatalityCreateAnimation(DropShadow,0.35,{
				ImageTransparency = 1
			})
		end
	end

	Fatalitywin.Name = FatalityRandomString();
	Fatalitywin.Parent = CoreGui;
	Fatalitywin.ResetOnSpawn = false;
	Fatalitywin.IgnoreGuiInset = true;
	Fatalitywin.ZIndexBehavior = Enum.ZIndexBehavior.Global;

	table.insert(Fatality.Windows,Fatalitywin)

	protect_gui(Fatalitywin);

	FatalFrame.Active = true;
	FatalFrame.Name = FatalityRandomString()
	FatalFrame.Parent = Fatalitywin
	FatalFrame.AnchorPoint = Vector2.new(0.5, 0)
	FatalFrame.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
	FatalFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	FatalFrame.BorderSizePixel = 0
	FatalFrame.Position = UDim2.new(0.5, 0, 0.2);
	FatalFrame.Size = Window.Scale;
	FatalFrame.ClipsDescendants = true

	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = FatalFrame

	DropShadow.Name = FatalityRandomString()
	DropShadow.Parent = FatalFrame
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 47, 1, 47)
	DropShadow.ZIndex = -1
	DropShadow.Image = rbxassetid6014261993
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 1
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
	DropShadow.Rotation = 0.001

	Header.Name = FatalityRandomString()
	Header.Parent = FatalFrame
	Header.Active = true
	Header.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
	Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Header.BorderSizePixel = 0
	Header.Size = UDim2.new(1, 0, 0, 40)
	Header.ZIndex = 2

	HeaderLine.Name = FatalityRandomString()
	HeaderLine.Parent = Header
	HeaderLine.AnchorPoint = Vector2.new(0, 1)
	HeaderLine.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
	HeaderLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HeaderLine.BorderSizePixel = 0
	HeaderLine.Position = UDim2.new(0, 0, 1, 0)
	HeaderLine.Size = UDim2.new(1, 0, 0, 1)
	HeaderLine.ZIndex = 3

	UICorner_2.CornerRadius = UDim.new(0, 5)
	UICorner_2.Parent = Header

	HeaderText.Name = FatalityRandomString()
	HeaderText.Parent = Header
	HeaderText.AnchorPoint = Vector2.new(0, 0.5)
	HeaderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	HeaderText.BackgroundTransparency = 1.000
	HeaderText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HeaderText.BorderSizePixel = 0
	HeaderText.Position = UDim2.new(0, 5, 0.5, 0)
	HeaderText.Size = UDim2.new(0, 100, 0.699999988, 0)
	HeaderText.ZIndex = 4
	HeaderText.Font = Enum.Font.GothamBold
	HeaderText.Text = Window.Name
	HeaderText.TextColor3 = Color3.fromRGB(229, 229, 229)
	HeaderText.TextSize = 21.000
	HeaderText.TextStrokeColor3 = Color3.fromRGB(0, 255, 102)
	HeaderText.TextStrokeTransparency = 0.640

	MenuButtonCont.Name = FatalityRandomString()
	MenuButtonCont.Parent = Header
	MenuButtonCont.AnchorPoint = Vector2.new(0, 0.5)
	MenuButtonCont.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MenuButtonCont.BackgroundTransparency = 1.000
	MenuButtonCont.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MenuButtonCont.BorderSizePixel = 0
	MenuButtonCont.ClipsDescendants = true
	MenuButtonCont.Position = UDim2.new(0, 115, 0.5, 0)
	MenuButtonCont.Size = UDim2.new(1, -275, 0.75, 0)
	MenuButtonCont.ZIndex = 4

	tbc.Name = FatalityRandomString()
	tbc.Parent = MenuButtonCont
	tbc.Active = true
	tbc.AnchorPoint = Vector2.new(0.5, 0.5)
	tbc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tbc.BackgroundTransparency = 1.000
	tbc.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tbc.BorderSizePixel = 0
	tbc.ClipsDescendants = false
	tbc.Position = UDim2.new(0.5, 0, 0.5, 0)
	tbc.Size = UDim2.new(1, -2, 1, 0)
	tbc.ZIndex = 4
	tbc.CanvasSize = UDim2.new(2, 0, 0, 0)
	tbc.ScrollBarThickness = 0

	UIListLayout.Parent = tbc
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout.Padding = UDim.new(0, 4)

	UserProfle.Name = FatalityRandomString()
	UserProfle.Parent = Header
	UserProfle.AnchorPoint = Vector2.new(1, 0.5)
	UserProfle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserProfle.BackgroundTransparency = 1.000
	UserProfle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UserProfle.BorderSizePixel = 0
	UserProfle.Position = UDim2.new(1, -5, 0.5, 0)
	UserProfle.Size = UDim2.new(0, 150, 0.75, 0)
	UserProfle.ZIndex = 4

	UserIcon.Name = FatalityRandomString()
	UserIcon.Parent = UserProfle
	UserIcon.AnchorPoint = Vector2.new(1, 0.5)
	UserIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserIcon.BackgroundTransparency = 1.000
	UserIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UserIcon.BorderSizePixel = 0
	UserIcon.Position = UDim2.new(1, -10, 0.5, 0)
	UserIcon.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
	UserIcon.SizeConstraint = Enum.SizeConstraint.RelativeYY
	UserIcon.ZIndex = 5
	UserIcon.Image = PlayersGetUserThumbnailAsync(Client.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size180x180);

	UICorner_3.CornerRadius = UDim.new(1, 0)
	UICorner_3.Parent = UserIcon

	UIStroke.Thickness = 2.500
	UIStroke.Transparency = 0.900
	UIStroke.Parent = UserIcon

	User_name.Name = FatalityRandomString()
	User_name.Parent = UserProfle
	User_name.AnchorPoint = Vector2.new(1, 0)
	User_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	User_name.BackgroundTransparency = 1.000
	User_name.BorderColor3 = Color3.fromRGB(0, 0, 0)
	User_name.BorderSizePixel = 0
	User_name.Position = UDim2.new(1, -40, 0, 3)
	User_name.Size = UDim2.new(0, 200, 0, 15)
	User_name.ZIndex = 4
	User_name.Font = Enum.Font.GothamMedium
	User_name.Text = Client.DisplayName;
	User_name.TextColor3 = Color3.fromRGB(255, 255, 255)
	User_name.TextSize = 13.000
	User_name.TextStrokeTransparency = 0.700
	User_name.TextXAlignment = Enum.TextXAlignment.Right

	expire_days.Name = FatalityRandomString()
	expire_days.Parent = UserProfle
	expire_days.AnchorPoint = Vector2.new(1, 0)
	expire_days.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	expire_days.BackgroundTransparency = 1.000
	expire_days.BorderColor3 = Color3.fromRGB(0, 0, 0)
	expire_days.BorderSizePixel = 0
	expire_days.Position = UDim2.new(1, -40, 0, 16)
	expire_days.Size = UDim2.new(0, 200, 0, 15)
	expire_days.ZIndex = 4
	expire_days.Font = Enum.Font.GothamMedium
	expire_days.Text = string.format(font transparency=0.5expiresfont font color=#f53174%sfont,Window.Expire)
	expire_days.TextColor3 = Color3.fromRGB(255, 255, 255)
	expire_days.TextSize = 12.000
	expire_days.TextStrokeTransparency = 0.700
	expire_days.TextXAlignment = Enum.TextXAlignment.Right
	expire_days.RichText = true;

	HeaderLineShadow.Name = FatalityRandomString()
	HeaderLineShadow.Parent = Header
	HeaderLineShadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	HeaderLineShadow.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HeaderLineShadow.BorderSizePixel = 0
	HeaderLineShadow.Size = UDim2.new(1, 0, 1, 10)

	UIGradient.Rotation = 90
	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient.Parent = HeaderLineShadow

	UICorner_4.CornerRadius = UDim.new(0, 5)
	UICorner_4.Parent = HeaderLineShadow

	MenuFrame.Name = FatalityRandomString()
	MenuFrame.Parent = FatalFrame
	MenuFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MenuFrame.BackgroundTransparency = 1.000
	MenuFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MenuFrame.BorderSizePixel = 0
	MenuFrame.Position = UDim2.new(0, 0, 0, 50)
	MenuFrame.Size = UDim2.new(1, 0, 1, -82)

	Bottom.Name = FatalityRandomString()
	Bottom.Parent = FatalFrame
	Bottom.Active = true
	Bottom.AnchorPoint = Vector2.new(0, 1)
	Bottom.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
	Bottom.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Bottom.BorderSizePixel = 0
	Bottom.Position = UDim2.new(0, 0, 1, 0)
	Bottom.Size = UDim2.new(1, 0, 0, 25)
	Bottom.ZIndex = 2

	HeaderLine_2.Name = FatalityRandomString()
	HeaderLine_2.Parent = Bottom
	HeaderLine_2.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
	HeaderLine_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HeaderLine_2.BorderSizePixel = 0
	HeaderLine_2.Size = UDim2.new(1, 0, 0, 1)
	HeaderLine_2.ZIndex = 3

	UICorner_5.CornerRadius = UDim.new(0, 4)
	UICorner_5.Parent = Bottom

	HeaderLineShadow_2.Name = FatalityRandomString()
	HeaderLineShadow_2.Parent = Bottom
	HeaderLineShadow_2.AnchorPoint = Vector2.new(0, 1)
	HeaderLineShadow_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	HeaderLineShadow_2.BackgroundTransparency = 0.500
	HeaderLineShadow_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HeaderLineShadow_2.BorderSizePixel = 0
	HeaderLineShadow_2.Position = UDim2.new(0, 0, 1, 0)
	HeaderLineShadow_2.Size = UDim2.new(1, 0, 1, 5)

	UIGradient_2.Rotation = -90
	UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient_2.Parent = HeaderLineShadow_2

	UICorner_6.CornerRadius = UDim.new(0, 5)
	UICorner_6.Parent = HeaderLineShadow_2

	FatalityDrag(Header,FatalFrame,0.1);

	UserInputService.InputBeganConnect(function(input,istyping)
		if not istyping then
			if input.KeyCode == Window.Keybind or input.KeyCode.Name == Window.Keybind then
				Fatal.Toggle = not Fatal.Toggle;

				ToggleUI(Fatal.Toggle);
			end;
		end
	end)
	
	function FatalSetUsername(name string)
		User_name.Text = name or Client.DisplayName;
	end;
	
	function FatalSetProfile(icon string)
		UserIcon.Image = icon or PlayersGetUserThumbnailAsync(Client.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size180x180);
	end;

	function FatalSetExpire(str string)
		expire_days.Text = string.format(font transparency=0.5expiresfont font color=#f53174%sfont,str)
	end;

	function FatalAddMenu(Menu  Menu)
		Menu = Menu or {};
		Menu.Name = Menu.Name or EXAMPLE;
		Menu.Icon = Menu.Icon or eye;
		Menu.AutoFill = (Menu.AutoFill == nil and true) or false;

		local MenuLib = {};
		local MenuButton = Instance.new(Frame)
		local UICorner = Instance.new(UICorner)
		local UIStroke = Instance.new(UIStroke)
		local Icon = Instance.new(ImageLabel)
		local UICorner_2 = Instance.new(UICorner)
		local menu_name = Instance.new(TextLabel)

		MenuButton.Name = FatalityRandomString()
		MenuButton.Parent = tbc;
		MenuButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		MenuButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		MenuButton.BorderSizePixel = 0
		MenuButton.Size = UDim2.new(0, 90, 0.85, 0)
		MenuButton.ZIndex = 5

		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = MenuButton

		UIStroke.Transparency = 0.950
		UIStroke.Parent = MenuButton

		Icon.Name = FatalityRandomString()
		Icon.Parent = MenuButton
		Icon.AnchorPoint = Vector2.new(0, 0.5)
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(0, 5, 0.5, 0)
		Icon.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
		Icon.SizeConstraint = Enum.SizeConstraint.RelativeYY
		Icon.ZIndex = 5
		Icon.Image = FatalityGetIcon(Menu.Icon);
		Icon.ImageColor3 = Color3.fromRGB(50, 255, 50)
		Icon.ScaleType = Enum.ScaleType.Crop

		UICorner_2.CornerRadius = UDim.new(1, 0)
		UICorner_2.Parent = Icon

		menu_name.Name = FatalityRandomString()
		menu_name.Parent = MenuButton
		menu_name.AnchorPoint = Vector2.new(0, 0.5)
		menu_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		menu_name.BackgroundTransparency = 1.000
		menu_name.BorderColor3 = Color3.fromRGB(0, 0, 0)
		menu_name.BorderSizePixel = 0
		menu_name.Position = UDim2.new(0, 28, 0.5, 0)
		menu_name.Size = UDim2.new(1, 0, 1, 0)
		menu_name.ZIndex = 5
		menu_name.Font = Enum.Font.GothamBold
		menu_name.Text = Menu.Name
		menu_name.TextColor3 = Color3.fromRGB(255, 255, 255)
		menu_name.TextSize = 13.000
		menu_name.TextStrokeTransparency = 0.900
		menu_name.TextTransparency = 0.150
		menu_name.TextXAlignment = Enum.TextXAlignment.Left

		local text_size = FatalityGetTextSize(menu_name);

		MenuButton.Size = UDim2.new(0, text_size.X + 33, 0.85, 0)

		local MenuLiber = Instance.new(Frame)
		local Left = Instance.new(ScrollingFrame)
		local UIListLayout = Instance.new(UIListLayout)
		local Center = Instance.new(ScrollingFrame)
		local UIListLayout_2 = Instance.new(UIListLayout)
		local Right = Instance.new(ScrollingFrame)
		local UIListLayout_3 = Instance.new(UIListLayout)

		MenuLiber.Name = FatalityRandomString()
		MenuLiber.Parent = MenuFrame
		MenuLiber.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		MenuLiber.BackgroundTransparency = 1.000
		MenuLiber.BorderColor3 = Color3.fromRGB(0, 0, 0)
		MenuLiber.BorderSizePixel = 0
		MenuLiber.ClipsDescendants = true
		MenuLiber.Size = UDim2.new(1, 0, 1, 0)
		MenuLiber.ZIndex = 7

		Left.Name = FatalityRandomString()
		Left.Parent = MenuLiber
		Left.Active = true
		Left.AnchorPoint = Vector2.new(0.5, 0.5)
		Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Left.BackgroundTransparency = 1.000
		Left.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Left.BorderSizePixel = 0
		Left.ClipsDescendants = false
		Left.Position = UDim2.new(0.175, 0, 0.5, 0)
		Left.Size = UDim2.new(0.32, 0, 1, -5)
		Left.ScrollBarThickness = 0

		UIListLayout.Parent = Left
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 5)
		UIListLayout.VerticalFlex = (Menu.AutoFill and Enum.UIFlexAlignment.Fill) or Enum.UIFlexAlignment.None;

		Center.Name = FatalityRandomString()
		Center.Parent = MenuLiber
		Center.Active = true
		Center.AnchorPoint = Vector2.new(0.5, 0.5)
		Center.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Center.BackgroundTransparency = 1.000
		Center.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Center.BorderSizePixel = 0
		Center.ClipsDescendants = false
		Center.Position = UDim2.new(0.5, 0, 0.5, 0)
		Center.Size = UDim2.new(0.32, 0, 1, -5)
		Center.ScrollBarThickness = 0

		UIListLayout_2.Parent = Center
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 5)
		UIListLayout_2.VerticalFlex = (Menu.AutoFill and Enum.UIFlexAlignment.Fill) or Enum.UIFlexAlignment.None;

		Right.Name = FatalityRandomString()
		Right.Parent = MenuLiber
		Right.Active = true
		Right.AnchorPoint = Vector2.new(0.5, 0.5)
		Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Right.BackgroundTransparency = 1.000
		Right.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Right.BorderSizePixel = 0
		Right.ClipsDescendants = false
		Right.Position = UDim2.new(0.825, 0, 0.5, 0)
		Right.Size = UDim2.new(0.32, 0, 1, -5)
		Right.ScrollBarThickness = 0

		UIListLayout_3.Parent = Right
		UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_3.Padding = UDim.new(0, 5)
		UIListLayout_3.VerticalFlex = (Menu.AutoFill and Enum.UIFlexAlignment.Fill) or Enum.UIFlexAlignment.None;

		local BindEvent = Instance.new('BindableEvent',MenuLiber);
		BindEvent.Name = FatalityRandomString();

		if not Menu.AutoFill then
			FatalityScrollSignal(Right,UIListLayout_3,'Y');
			FatalityScrollSignal(Center,UIListLayout_2,'Y');
			FatalityScrollSignal(Left,UIListLayout,'Y');
		else
			Right.CanvasSize = UDim2.new(0,0,0,0);
			Left.CanvasSize = UDim2.new(0,0,0,0);
			Center.CanvasSize = UDim2.new(0,0,0,0);
		end;

		Fatal.Signal.EventConnect(function(Bool)
			if Bool then
				FatalityCreateAnimation(MenuButton,0.5,{
					BackgroundTransparency = (MenuLiber.Visible and 0) or 1
				})

				FatalityCreateAnimation(UIStroke,0.5,{
					Transparency = 0.950
				})

				FatalityCreateAnimation(Left,0.3,{
					Position = UDim2.new(0.175, 0, 0.5, 0)
				})

				FatalityCreateAnimation(Center,0.4,{
					Position = UDim2.new(0.5, 0, 0.5, 0)
				})

				FatalityCreateAnimation(Right,0.5,{
					Position = UDim2.new(0.825, 0, 0.5, 0)
				})

				FatalityCreateAnimation(Icon,0.5,{
					ImageTransparency = (MenuLiber.Visible and 0.15) or 0.5
				})

				FatalityCreateAnimation(menu_name,0.5,{
					TextStrokeTransparency = 0.900,
					TextTransparency = (MenuLiber.Visible and 0.15) or 0.5
				})
			else
				FatalityCreateAnimation(Left,0.5,{
					Position = UDim2.new(0.175, 0, 0.5, 1)
				})

				FatalityCreateAnimation(Center,0.5,{
					Position = UDim2.new(0.5, 0, 0.5, 2)
				})

				FatalityCreateAnimation(Right,0.5,{
					Position = UDim2.new(0.825, 0, 0.5, 3)
				})

				FatalityCreateAnimation(MenuButton,0.5,{
					BackgroundTransparency = 1
				})

				FatalityCreateAnimation(UIStroke,0.5,{
					Transparency = 1
				})

				FatalityCreateAnimation(Icon,0.5,{
					ImageTransparency = 1
				})

				FatalityCreateAnimation(menu_name,0.5,{
					TextStrokeTransparency = 1,
					TextTransparency = 1
				})
			end;
		end)

		local ValueSelect = function(val)
			if val then
				MenuLiber.Visible = true;

				FatalityCreateAnimation(Icon,0.5,{
					ImageTransparency = 0.15,
					ImageColor3 = Color3.fromRGB(50, 255, 50)
				});

				FatalityCreateAnimation(menu_name,0.5,{
					TextTransparency = 0.15
				});

				FatalityCreateAnimation(MenuButton,0.5,{
					BackgroundTransparency = 0
				})

				BindEventSetAttribute('V',true);
				BindEventFire(true);
			else
				BindEventSetAttribute('V',false);
				BindEventFire(false);

				MenuLiber.Visible = false;

				FatalityCreateAnimation(Icon,0.5,{
					ImageTransparency = 0.5,
					ImageColor3 = Color3.fromRGB(255, 255, 255)
				});

				FatalityCreateAnimation(MenuButton,0.5,{
					BackgroundTransparency = 1
				})

				FatalityCreateAnimation(menu_name,0.5,{
					TextTransparency = 0.5
				});
			end;
		end;

		local _B = {
			Root = MenuLiber,
			ValueSelect = ValueSelect,
			Bindable = BindEvent,
		};

		if not Fatal.MenuSelected then
			Fatal.MenuSelected = _B;

			ValueSelect(true);
		else
			ValueSelect(false);
		end;

		table.insert(Fatal.Menus,_B)

		FatalityCreateHover(MenuButton,function(bool)
			if Fatal.MenuSelected.Root ~= MenuLiber then
				if bool then
					FatalityCreateAnimation(Icon,0.5,{
						ImageTransparency = 0.2,
						ImageColor3 = Color3.fromRGB(255, 255, 255)
					});

					FatalityCreateAnimation(MenuButton,0.5,{
						BackgroundTransparency = 1
					})

					FatalityCreateAnimation(menu_name,0.5,{
						TextTransparency = 0.2
					});
				else
					FatalityCreateAnimation(Icon,0.5,{
						ImageTransparency = 0.5,
						ImageColor3 = Color3.fromRGB(255, 255, 255)
					});

					FatalityCreateAnimation(MenuButton,0.5,{
						BackgroundTransparency = 1
					})

					FatalityCreateAnimation(menu_name,0.5,{
						TextTransparency = 0.5
					});
				end
			end;
		end)

		FatalityNewInput(MenuButton,function()
			for i,v in next , Fatal.Menus do
				if v.Root == MenuLiber then
					Fatal.MenuSelected = v;

					v.ValueSelect(true)
				else
					v.ValueSelect(false)
				end;
			end;
		end);

		function MenuLibAddListBox(Config  Listbox)
			Config = Config or {};
			Config.Name = Config.Name or LIST BOX;
			Config.Position = Config.Position or left;
			Config.Height = Config.Height or 0;
			Config.Values = Config.Values or {};
			Config.Multi = Config.Multi or false;
			Config.Default = Config.Default or ((Config.Multi and nil) or {});
			Config.Callback = Config.Callback or function() end;

			table.insert(Fatal.ElementContents,{
				Name = Config.Name,
				Path = Menu.Name ..   .. Config.Name,
				_TAB = _B
			});

			local ListBox = Instance.new(Frame)
			local Elements = Instance.new(Frame)
			local UIStroke = Instance.new(UIStroke)
			local UICorner = Instance.new(UICorner)
			local SearchBox = Instance.new(Frame)
			local TextBox = Instance.new(TextBox)
			local UICorner_2 = Instance.new(UICorner)
			local UIStroke_2 = Instance.new(UIStroke)
			local OptionButton = Instance.new(ImageButton)
			local ScrollingFrame = Instance.new(ScrollingFrame)
			local UICorner_3 = Instance.new(UICorner)
			local UIStroke_3 = Instance.new(UIStroke)
			local UIListLayout = Instance.new(UIListLayout)
			local SpaceBox = Instance.new(Frame)
			local ListName = Instance.new(TextLabel)

			ListBox.Name = FatalityRandomString()
			ListBox.Parent = (string.lower(Config.Position) == 'left' and Left) or (string.lower(Config.Position) == 'center' and Center) or Right;
			ListBox.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
			ListBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ListBox.BorderSizePixel = 0
			ListBox.ClipsDescendants = true
			ListBox.Size = UDim2.new(1, 0, 0, 350)
			ListBox.ZIndex = 10
			ListBox.ClipsDescendants = true;

			Elements.Name = FatalityRandomString()
			Elements.Parent = ListBox
			Elements.AnchorPoint = Vector2.new(0.5, 1)
			Elements.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
			Elements.BackgroundTransparency = 0
			Elements.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Elements.BorderSizePixel = 0
			Elements.Position = UDim2.new(0.5, 0, 1, -1)
			Elements.Size = UDim2.new(1, -5, 1, -10)
			Elements.ZIndex = 10

			UIStroke.Color = Color3.fromRGB(29, 29, 29)
			UIStroke.Parent = Elements

			UICorner.CornerRadius = UDim.new(0, 2)
			UICorner.Parent = Elements

			SearchBox.Name = FatalityRandomString()
			SearchBox.Parent = Elements
			SearchBox.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
			SearchBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SearchBox.BorderSizePixel = 0
			SearchBox.ClipsDescendants = true
			SearchBox.Position = UDim2.new(0, 10, 0, 15)
			SearchBox.Size = UDim2.new(0, 195, 0, 16)
			SearchBox.ZIndex = 10

			TextBox.Parent = SearchBox
			TextBox.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
			TextBox.BackgroundTransparency = 1.000
			TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextBox.BorderSizePixel = 0
			TextBox.Position = UDim2.new(0, 5, 0, 0)
			TextBox.Size = UDim2.new(1, -10, 0, 16)
			TextBox.ZIndex = 11
			TextBox.ClearTextOnFocus = false
			TextBox.FontFace = Fatality.FontSemiBold
			TextBox.PlaceholderText = Start typing...
			TextBox.Text = 
			TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.TextSize = 11.000
			TextBox.TextXAlignment = Enum.TextXAlignment.Left

			UICorner_2.CornerRadius = UDim.new(0, 3)
			UICorner_2.Parent = SearchBox

			UIStroke_2.Transparency = 0.750
			UIStroke_2.Color = Color3.fromRGB(29, 29, 29)
			UIStroke_2.Parent = SearchBox

			OptionButton.Name = FatalityRandomString()
			OptionButton.Parent = Elements
			OptionButton.AnchorPoint = Vector2.new(1, 0)
			OptionButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			OptionButton.BackgroundTransparency = 1.000
			OptionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			OptionButton.BorderSizePixel = 0
			OptionButton.Position = UDim2.new(1, -10, 0, 16)
			OptionButton.Size = UDim2.new(0, 13, 0, 13)
			OptionButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
			OptionButton.ZIndex = 11
			OptionButton.Image = httpwww.roblox.comassetid=14007344336
			OptionButton.ImageTransparency = 0.600
			OptionButton.Visible = Config.Option or false;

			ScrollingFrame.Parent = Elements
			ScrollingFrame.Active = true
			ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0)
			ScrollingFrame.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
			ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ScrollingFrame.BorderSizePixel = 0
			ScrollingFrame.Position = UDim2.new(0.5, 0, 0, 40)
			ScrollingFrame.Size = UDim2.new(1, -20, 1, -50)
			ScrollingFrame.ZIndex = 11
			ScrollingFrame.ScrollBarThickness = 0

			UICorner_3.CornerRadius = UDim.new(0, 3)
			UICorner_3.Parent = ScrollingFrame

			UIStroke_3.Transparency = 0.750
			UIStroke_3.Color = Color3.fromRGB(29, 29, 29)
			UIStroke_3.Parent = ScrollingFrame

			UIListLayout.Parent = ScrollingFrame
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)

			UIListLayoutGetPropertyChangedSignal('AbsoluteContentSize')Connect(function()
				local all = (#ScrollingFrameGetChildren() - 1);
				local scale = math.clamp((all  (10 + UIListLayout.Padding.Offset)) + (Config.Height + UIListLayout.Padding.Offset),25,400);

				if Menu.AutoFill then
					ListBox.Size = UDim2.new(1,0,0,scale  2.5);
				else
					ListBox.Size = UDim2.new(1,0,0,scale);
				end;

				ScrollingFrame.CanvasSize = UDim2.fromOffset(0,UIListLayout.AbsoluteContentSize.Y);
			end)

			SpaceBox.Name = FatalityRandomString()
			SpaceBox.Parent = ScrollingFrame
			SpaceBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SpaceBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SpaceBox.BorderSizePixel = 0
			SpaceBox.Size = UDim2.new(0, 0, 0, 1)

			ListName.Name = FatalityRandomString()
			ListName.Parent = ListBox
			ListName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ListName.BackgroundTransparency = 1.000
			ListName.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ListName.BorderSizePixel = 0
			ListName.Position = UDim2.new(0, 10, 0, 0)
			ListName.Size = UDim2.new(1, 0, 0, 15)
			ListName.ZIndex = 10
			ListName.FontFace = Fatality.FontSemiBold
			ListName.Text = Config.Name
			ListName.TextColor3 = Color3.fromRGB(255, 255, 255)
			ListName.TextSize = 15.000
			ListName.TextStrokeTransparency = 0.750
			ListName.TextXAlignment = Enum.TextXAlignment.Left

			local new_button = function()
				local db_selected = Instance.new(TextButton)

				db_selected.Name = FatalityRandomString()
				db_selected.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				db_selected.BackgroundTransparency = 1.000
				db_selected.BorderColor3 = Color3.fromRGB(0, 0, 0)
				db_selected.BorderSizePixel = 0
				db_selected.Size = UDim2.new(1, 0, 0, 10)
				db_selected.ZIndex = 15
				db_selected.FontFace = Fatality.FontSemiBold
				db_selected.TextColor3 = Color3.fromRGB(50, 255, 50)
				db_selected.TextSize = 12.000
				db_selected.TextTransparency = 0.5;
				db_selected.TextXAlignment = Enum.TextXAlignment.Left

				return db_selected;
			end;

			local Toggle = function(v)
				if v then
					FatalityCreateAnimation(ListBox,0.5,{
						BackgroundTransparency = 0
					})

					FatalityCreateAnimation(UIStroke,0.5,{
						Transparency = 0
					})

					FatalityCreateAnimation(UIStroke_2,0.5,{
						Transparency = 0.75
					})

					FatalityCreateAnimation(UIStroke_3,0.5,{
						Transparency = 0.75
					})

					FatalityCreateAnimation(SearchBox,0.5,{
						BackgroundTransparency = 0
					})

					FatalityCreateAnimation(TextBox,0.5,{
						TextTransparency = 0
					})

					FatalityCreateAnimation(OptionButton,0.45,{
						ImageTransparency = (Config.Option and 0.6) or 1,
					})

					FatalityCreateAnimation(ScrollingFrame,0.45,{
						BackgroundTransparency = 0,
						Position = UDim2.new(0.5, 0, 0, 40)
					})

					table.foreach(ScrollingFrameGetChildren(),function(i,v)
						if vIsA('TextButton') then
							FatalityCreateAnimation(v,0.45,{
								TextTransparency = 0.5
							});
						end;
					end);

					FatalityCreateAnimation(ListName,0.5,{
						TextStrokeTransparency = 0.75,
						TextTransparency = 0
					})
				else

					table.foreach(ScrollingFrameGetChildren(),function(i,v)
						if vIsA('TextButton') then
							FatalityCreateAnimation(v,0.45,{
								TextTransparency = 1
							});
						end;
					end);

					FatalityCreateAnimation(ListBox,0.5,{
						BackgroundTransparency = 1
					})

					FatalityCreateAnimation(UIStroke,0.5,{
						Transparency = 1
					})

					FatalityCreateAnimation(UIStroke_2,0.5,{
						Transparency = 1
					})

					FatalityCreateAnimation(UIStroke_3,0.5,{
						Transparency = 1
					})

					FatalityCreateAnimation(SearchBox,0.5,{
						BackgroundTransparency = 1
					})

					FatalityCreateAnimation(TextBox,0.5,{
						TextTransparency = 1
					})

					FatalityCreateAnimation(OptionButton,0.45,{
						ImageTransparency = 1
					})

					FatalityCreateAnimation(ScrollingFrame,0.45,{
						BackgroundTransparency = 1,
						Position = UDim2.new(0.5, 0, 0, 40)
					})

					FatalityCreateAnimation(ListName,0.5,{
						TextStrokeTransparency = 1,
						TextTransparency = 1
					})
				end
			end;

			Toggle(BindEventGetAttribute('V'));

			BindEvent.EventConnect(Toggle);

			local DearchDelay = tick();

			TextBoxGetPropertyChangedSignal('Text')Connect(function()
				DearchDelay = tick();

				if not TextBox.Textbyte() then
					for i,v in next , ScrollingFrameGetChildren() do
						if vIsA('TextButton') then
							v.Visible = true;
						end;
					end;

					return;
				end;

				task.delay(0.25,function()
					if (tick() - DearchDelay)  0.25 then
						for i,v in next , ScrollingFrameGetChildren() do
							if vIsA('TextButton') then
								if string.find(string.lower(v.Text),string.lower(TextBox.Text),1,true) then
									v.Visible = true;
								else
									v.Visible = false;
								end;
							end;
						end;
					end;
				end)
			end);

			local res = FatalityCreateResponse({
				Refresh = function()
					for i,v in next , ScrollingFrameGetChildren() do
						if vIsA('TextButton') then
							vDestroy();
						end;
					end;

					local selectedmem;

					for i,v in next , Config.Values do
						local bth = new_button();

						bth.Text = string.rep( ,2)..tostring(v);

						bth.Parent = ScrollingFrame;

						if Config.Multi then
							if (typeof(Config.Default) == 'table' and (Config.Default[v] or table.find(Config.Default,v))) or Config.Default == v then
								Config.Default[v] = true
								bth.TextColor3 = Color3.fromRGB(50, 255, 50);
								bth.TextTransparency = 0;

							else
								bth.TextColor3 = Color3.fromRGB(255, 255, 255);
								bth.TextTransparency = 0.5;

								Config.Default[v] = false
							end;

							FatalityCreateHover(bth,function(bool)
								if not Config.Default[v] then
									if bool then
										FatalityCreateAnimation(bth,0.25,{
											TextTransparency = 0;
										})
									else
										FatalityCreateAnimation(bth,0.25,{
											TextTransparency = 0.5;
										})
									end;
								end;
							end)

							bth.MouseButton1ClickConnect(function()
								Config.Default[v] = not Config.Default[v];

								if Config.Default[v] then
									bth.TextColor3 = Color3.fromRGB(50, 255, 50);
									bth.TextTransparency = 0;

								else
									bth.TextColor3 = Color3.fromRGB(255, 255, 255);
									bth.TextTransparency = 0.5;
								end;

								Config.Callback(Config.Default);
							end)
						else
							if v == Config.Default then
								selectedmem = bth;
								Config.Default = v;

								bth.TextColor3 = Color3.fromRGB(50, 255, 50);
								bth.TextTransparency = 0;

							else
								bth.TextColor3 = Color3.fromRGB(255, 255, 255);
								bth.TextTransparency = 0.5;
							end;

							FatalityCreateHover(bth,function(bool)
								if Config.Default ~= v then
									if bool then
										FatalityCreateAnimation(bth,0.25,{
											TextTransparency = 0;
										})
									else
										FatalityCreateAnimation(bth,0.25,{
											TextTransparency = 0.5;
										})
									end;
								end;
							end)

							bth.MouseButton1ClickConnect(function()
								if selectedmem then
									selectedmem.TextColor3 = Color3.fromRGB(255, 255, 255);
									selectedmem.TextTransparency = 0.5;
								end;

								bth.TextTransparency = 0;
								bth.TextColor3 = Color3.fromRGB(50, 255, 50);
								selectedmem = bth;
								Config.Default = v;

								Config.Callback(v);
							end)
						end;
					end;

					Config.Callback(Config.Default);
				end,
				SetValues = function(value)
					Config.Values = value;
				end,
				SetDefault = function(value)
					Config.Default = value;
				end,
				Option = (Config.Option and FatalityCreateOption(OptionButton)) or nil;
			});

			resRefresh();

			return res;
		end;

		function MenuLibAddSection(Config  Section)
			Config = Config or {};
			Config.Name = Config.Name or SECTION;
			Config.Position = Config.Position or center;
			Config.Height = Config.Height or 0;

			table.insert(Fatal.ElementContents,{
				Name = Config.Name,
				Path = Menu.Name ..   .. Config.Name,
				_TAB = _B
			});

			local Section = Instance.new(Frame)
			local Elements = Instance.new(Frame)
			local UIStroke = Instance.new(UIStroke)
			local UICorner = Instance.new(UICorner)
			local UIListLayout = Instance.new(UIListLayout)
			local SpaceBox = Instance.new(Frame)
			local SectionName = Instance.new(TextLabel)

			local Toggle = function(v)
				if v then
					FatalityCreateAnimation(Section,0.5,{
						BackgroundTransparency = 0
					})

					FatalityCreateAnimation(UIStroke,0.5,{
						Transparency = 0
					})

					FatalityCreateAnimation(SectionName,0.5,{
						TextStrokeTransparency = 0.750,
						TextTransparency = 0
					})
				else
					FatalityCreateAnimation(Section,0.5,{
						BackgroundTransparency = 1
					})

					FatalityCreateAnimation(UIStroke,0.5,{
						Transparency = 1
					})

					FatalityCreateAnimation(SectionName,0.5,{
						TextStrokeTransparency = 1,
						TextTransparency = 1
					})
				end
			end;

			Section.Name = FatalityRandomString()
			Section.Parent = (string.lower(Config.Position) == 'left' and Left) or (string.lower(Config.Position) == 'center' and Center) or Right;
			Section.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
			Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Section.BorderSizePixel = 0
			Section.ClipsDescendants = true
			Section.Size = UDim2.new(1, 0, 0, 0)

			Elements.Name = FatalityRandomString()
			Elements.Parent = Section
			Elements.AnchorPoint = Vector2.new(0.5, 1)
			Elements.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
			Elements.BackgroundTransparency = 0
			Elements.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Elements.BorderSizePixel = 0
			Elements.Position = UDim2.new(0.5, 0, 1, -1)
			Elements.Size = UDim2.new(1, -5, 1, -10)

			UIStroke.Color = Color3.fromRGB(29, 29, 29)
			UIStroke.Parent = Elements

			UICorner.CornerRadius = UDim.new(0, 2)
			UICorner.Parent = Elements

			UIListLayout.Parent = Elements
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)

			SpaceBox.Name = FatalityRandomString()
			SpaceBox.Parent = Elements
			SpaceBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SpaceBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SpaceBox.BorderSizePixel = 0
			SpaceBox.Size = UDim2.new(0, 0, 0, 10)

			SectionName.Name = FatalityRandomString()
			SectionName.Parent = Section
			SectionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SectionName.BackgroundTransparency = 1.000
			SectionName.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SectionName.BorderSizePixel = 0
			SectionName.Position = UDim2.new(0, 10, 0, 0)
			SectionName.Size = UDim2.new(1, 0, 0, 15)
			SectionName.FontFace = Fatality.FontSemiBold;
			SectionName.Text = Config.Name
			SectionName.TextColor3 = Color3.fromRGB(255, 255, 255)
			SectionName.TextSize = 15.000
			SectionName.TextStrokeTransparency = 0.750
			SectionName.TextXAlignment = Enum.TextXAlignment.Left


			UIListLayoutGetPropertyChangedSignal('AbsoluteContentSize')Connect(function()
				local MainScale = UIListLayout.AbsoluteContentSize.Y + 20 + Config.Height;

				if not Menu.AutoFill then
					FatalityCreateAnimation(Section,0.25,{
						Size = UDim2.new(1, 0, 0, MainScale)
					})
				else
					Section.Size = UDim2.new(1,0,0,MainScale  2.5);
				end;
			end);

			Toggle(BindEventGetAttribute('V'));

			BindEvent.EventConnect(Toggle);

			return FatalityCreateElements(Elements,Elements.ZIndex,BindEvent,{
				Path = Menu.Name ..   .. Config.Name,
				Memory = function(Name)
					table.insert(Fatal.ElementContents,{
						Name = Name,
						Path = Menu.Name ..   .. Config.Name ..    .. Name,
						_TAB = _B
					});
				end,
			});
		end;

		return MenuLib;
	end;

	do
		InfoButton.Name = FatalityRandomString()
		InfoButton.Parent = Bottom
		InfoButton.AnchorPoint = Vector2.new(1, 0.5)
		InfoButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		InfoButton.BackgroundTransparency = 1.000
		InfoButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		InfoButton.BorderSizePixel = 0
		InfoButton.Position = UDim2.new(1, -5, 0.5, 0)
		InfoButton.Size = UDim2.new(0, 16, 0, 16)
		InfoButton.ZIndex = 4
		InfoButton.Image = rbxassetid10723415903
		InfoButton.ImageTransparency = 0.500

		SearchButton.Name = FatalityRandomString()
		SearchButton.Parent = Bottom
		SearchButton.AnchorPoint = Vector2.new(0, 0.5)
		SearchButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SearchButton.BackgroundTransparency = 1.000
		SearchButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SearchButton.BorderSizePixel = 0
		SearchButton.Position = UDim2.new(0, 10, 0.5, 0)
		SearchButton.Size = UDim2.new(0, 16, 0, 16)
		SearchButton.ZIndex = 4
		SearchButton.Image = rbxassetid10734943674
		SearchButton.ImageTransparency = 0.500

		SaveButton.Name = FatalityRandomString()
		SaveButton.Parent = Bottom
		SaveButton.AnchorPoint = Vector2.new(0, 0.5)
		SaveButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SaveButton.BackgroundTransparency = 1.000
		SaveButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SaveButton.BorderSizePixel = 0
		SaveButton.Position = UDim2.new(0, 35, 0.5, 0)
		SaveButton.Size = UDim2.new(0, 16, 0, 16)
		SaveButton.ZIndex = 4
		SaveButton.Image = rbxassetid10734941499
		SaveButton.ImageTransparency = 0.500

		FatalityCreateHover(SaveButton,function(bool)
			if bool then
				FatalityCreateAnimation(SaveButton,0.5,{
					ImageTransparency = 0.1
				})
			else
				FatalityCreateAnimation(SaveButton,0.5,{
					ImageTransparency = 0.5
				})
			end	
		end);

		FatalityCreateHover(InfoButton,function(bool)
			if bool then
				FatalityCreateAnimation(InfoButton,0.5,{
					ImageTransparency = 0.1
				})
			else
				FatalityCreateAnimation(InfoButton,0.5,{
					ImageTransparency = 0.5
				})
			end	
		end);

		function FatalAddSave(callback)
			SaveButton.MouseButton1ClickConnect(callback);
		end;

		function FatalAddInfo(callback)
			InfoButton.MouseButton1ClickConnect(callback);
		end;
	end;

	do
		local SearchFrame = Instance.new(Frame)
		local UIStroke = Instance.new(UIStroke)
		local UICorner = Instance.new(UICorner)
		local DropShadow = Instance.new(ImageLabel)
		local SearchBox = Instance.new(Frame)
		local UICorner_2 = Instance.new(UICorner)
		local UIStroke_2 = Instance.new(UIStroke)
		local TextBox = Instance.new(TextBox)
		local ScrollingFrame = Instance.new(ScrollingFrame)
		local UIListLayout = Instance.new(UIListLayout)
		local searchScale = UDim2.new(0, 295, 0, 295);

		local SearchToggle = function(value)
			if value then
				SearchFrame.Position = UDim2.fromOffset(SearchButton.AbsolutePosition.X - 5,SearchButton.AbsolutePosition.Y + (SearchButton.AbsoluteSize.Y  3))

				FatalityCreateAnimation(SearchFrame,0.35,{
					Size = searchScale
				})

				FatalityCreateAnimation(DropShadow,0.35,{
					ImageTransparency = 0.750
				})

				FatalityCreateAnimation(SearchBox,0.35,{
					BackgroundTransparency = 0
				})

				FatalityCreateAnimation(UIStroke_2,0.5,{
					Transparency = 0.650
				})

				FatalityCreateAnimation(UIStroke,0.5,{
					Transparency = 0
				})

				FatalityCreateAnimation(TextBox,0.5,{
					TextTransparency = 0
				})

				FatalityCreateAnimation(TextBox,0.5,{
					TextTransparency = 0
				})
			else
				FatalityCreateAnimation(UIStroke,0.5,{
					Transparency = 1
				})

				FatalityCreateAnimation(SearchFrame,0.35,{
					Size = UDim2.new(searchScale.X.Scale, searchScale.X.Offset, 0, 0)
				})

				FatalityCreateAnimation(DropShadow,0.35,{
					ImageTransparency = 1
				})

				FatalityCreateAnimation(SearchBox,0.5,{
					BackgroundTransparency = 1
				})

				FatalityCreateAnimation(UIStroke_2,0.5,{
					Transparency = 1
				})

				FatalityCreateAnimation(TextBox,0.5,{
					TextTransparency = 1
				})

				FatalityCreateAnimation(TextBox,0.5,{
					TextTransparency = 1
				})

				table.foreach(ScrollingFrameGetChildren(),function(i,v)
					if vIsA('Frame') then
						vDestroy();
					end;
				end);
			end;
		end;

		SearchFrame.Name = FatalityRandomString()
		SearchFrame.Parent = Fatalitywin;
		SearchFrame.AnchorPoint = Vector2.new(0, 1)
		SearchFrame.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
		SearchFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SearchFrame.BorderSizePixel = 0
		SearchFrame.Position = UDim2.new(4,0,4,0)
		SearchFrame.Size = searchScale
		SearchFrame.ZIndex = 100
		SearchFrame.ClipsDescendants = true

		UIStroke.Color = Color3.fromRGB(29, 29, 29)
		UIStroke.Parent = SearchFrame

		UICorner.CornerRadius = UDim.new(0, 2)
		UICorner.Parent = SearchFrame

		DropShadow.Name = FatalityRandomString()
		DropShadow.Parent = SearchFrame
		DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
		DropShadow.BackgroundTransparency = 1.000
		DropShadow.BorderSizePixel = 0
		DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
		DropShadow.Rotation = 0.010
		DropShadow.Size = UDim2.new(1, 47, 1, 47)
		DropShadow.ZIndex = 99
		DropShadow.Image = rbxassetid6014261993
		DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
		DropShadow.ImageTransparency = 0.750
		DropShadow.ScaleType = Enum.ScaleType.Slice
		DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

		SearchBox.Name = FatalityRandomString()
		SearchBox.Parent = SearchFrame
		SearchBox.AnchorPoint = Vector2.new(0.5, 0)
		SearchBox.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
		SearchBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SearchBox.BorderSizePixel = 0
		SearchBox.Position = UDim2.new(0.5, 0, 0, 9)
		SearchBox.Size = UDim2.new(1, -15, 0, 25)
		SearchBox.ZIndex = 101

		UICorner_2.CornerRadius = UDim.new(0, 2)
		UICorner_2.Parent = SearchBox

		UIStroke_2.Transparency = 0.650
		UIStroke_2.Color = Color3.fromRGB(29, 29, 29)
		UIStroke_2.Parent = SearchBox

		TextBox.Parent = SearchBox
		TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.BackgroundTransparency = 1.000
		TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextBox.BorderSizePixel = 0
		TextBox.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextBox.Size = UDim2.new(1, -15, 1, -5)
		TextBox.ZIndex = 102
		TextBox.ClearTextOnFocus = false
		TextBox.FontFace = Fatality.FontSemiBold;
		TextBox.PlaceholderText = Search
		TextBox.Text = 
		TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.TextSize = 12.000
		TextBox.TextXAlignment = Enum.TextXAlignment.Left

		ScrollingFrame.Parent = SearchFrame
		ScrollingFrame.Active = true
		ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0)
		ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollingFrame.BackgroundTransparency = 1.000
		ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ScrollingFrame.BorderSizePixel = 0
		ScrollingFrame.Position = UDim2.new(0.5, 0, 0, 40)
		ScrollingFrame.Size = UDim2.new(1, -15, 1, -45)
		ScrollingFrame.ZIndex = 102
		ScrollingFrame.ScrollBarThickness = 0

		UIListLayout.Parent = ScrollingFrame
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 4)

		UIListLayoutGetPropertyChangedSignal('AbsoluteContentSize')Connect(function()
			ScrollingFrame.CanvasSize = UDim2.fromOffset(0,UIListLayout.AbsoluteContentSize.Y)
		end)

		SearchToggle(false);

		FatalityCreateHover(SearchButton,function(bool)
			if bool then
				FatalityCreateAnimation(SearchButton,0.5,{
					ImageTransparency = 0.1
				})
			else
				FatalityCreateAnimation(SearchButton,0.5,{
					ImageTransparency = 0.5
				})
			end	
		end);

		local SearchInformation = {};

		local get_button = function(Name,Path,TAB_WARP)
			local ResultFrame = Instance.new(Frame)
			local UICorner = Instance.new(UICorner)
			local FeatureName = Instance.new(TextLabel)
			local FeaturePath = Instance.new(TextLabel)

			ResultFrame.Name = FatalityRandomString()
			ResultFrame.Parent = ScrollingFrame;
			ResultFrame.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
			ResultFrame.BackgroundTransparency = 1.000
			ResultFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ResultFrame.BorderSizePixel = 0
			ResultFrame.Size = UDim2.new(1, 0, 0, 42)
			ResultFrame.ZIndex = 103

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = ResultFrame

			FeatureName.Name = FatalityRandomString()
			FeatureName.Parent = ResultFrame
			FeatureName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			FeatureName.BackgroundTransparency = 1.000
			FeatureName.BorderColor3 = Color3.fromRGB(0, 0, 0)
			FeatureName.BorderSizePixel = 0
			FeatureName.Position = UDim2.new(0, 6, 0, 5)
			FeatureName.Size = UDim2.new(1, 0, 0, 15)
			FeatureName.ZIndex = 104
			FeatureName.FontFace = Fatality.FontSemiBold
			FeatureName.Text = Name
			FeatureName.TextColor3 = Color3.fromRGB(255, 255, 255)
			FeatureName.TextSize = 14.000
			FeatureName.TextXAlignment = Enum.TextXAlignment.Left

			FeaturePath.Name = FatalityRandomString()
			FeaturePath.Parent = ResultFrame
			FeaturePath.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			FeaturePath.BackgroundTransparency = 1.000
			FeaturePath.BorderColor3 = Color3.fromRGB(0, 0, 0)
			FeaturePath.BorderSizePixel = 0
			FeaturePath.Position = UDim2.new(0, 6, 0, 22)
			FeaturePath.Size = UDim2.new(1, 0, 0, 15)
			FeaturePath.ZIndex = 104
			FeaturePath.FontFace = Fatality.FontSemiBold
			FeaturePath.Text = Path
			FeaturePath.TextColor3 = Color3.fromRGB(255, 255, 255)
			FeaturePath.TextSize = 12.000
			FeaturePath.TextTransparency = 0.500
			FeaturePath.TextXAlignment = Enum.TextXAlignment.Left

			local button = FatalityNewInput(ResultFrame);

			FatalityCreateHover(button,function(bool)
				if bool then
					FatalityCreateAnimation(ResultFrame,0.5,{
						BackgroundTransparency = 0
					})
				else
					FatalityCreateAnimation(ResultFrame,0.5,{
						BackgroundTransparency = 1
					})
				end	
			end);

			button.MouseButton1ClickConnect(function()
				if TAB_WARP then
					for i,v in next , Fatal.Menus do
						if v.Root == TAB_WARP.Root then
							Fatal.MenuSelected = v;
							v.ValueSelect(true)
						else
							v.ValueSelect(false)
						end;
					end;
				end;
			end);

			return ResultFrame;
		end

		SearchButton.MouseButton1ClickConnect(function()
			TextBox.Text = ;

			SearchToggle(true);

			table.clear(SearchInformation);

			table.foreach(ScrollingFrameGetChildren(),function(i,v)
				if vIsA('Frame') then
					vDestroy();
				end;
			end);

			table.foreach(Fatal.ElementContents,function(i,v)
				local button = get_button(v.Name,v.Path,v._TAB);

				SearchInformation[v.Path.. - ..FatalityRandomString()] = {
					root = button,
					callback = function()

					end,
				};
			end);
		end)

		local DearchDelay = tick();

		TextBoxGetPropertyChangedSignal('Text')Connect(function()
			DearchDelay = tick();

			if not TextBox.Textbyte() then
				for i,v in next , SearchInformation do
					v.root.Visible = true;
				end;

				return;
			end;

			task.delay(0.5,function()
				if (tick() - DearchDelay)  0.5 then
					for i,v in next , SearchInformation do
						if string.find(tostring(string.lower(i)),string.lower(TextBox.Text),1,true) then
							v.root.Visible = true;
						else
							v.root.Visible = false;
						end;
					end;
				end;
			end)
		end);

		UserInputService.InputBeganConnect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				if not FatalityIsMouseOverFrame(SearchFrame) then
					SearchToggle(false);
				end
			end
		end)
	end;

	function FatalGetButton()
		local backpack = Instance.new(ImageButton)
		local UICorner = Instance.new(UICorner)
		local RowLabel = Instance.new(Frame)
		local UIListLayout = Instance.new(UIListLayout)
		local StyledTextLabel = Instance.new(TextLabel)
		local UITextSizeConstraint = Instance.new(UITextSizeConstraint)
		local UIPadding = Instance.new(UIPadding)
		local IconHost = Instance.new(Frame)
		local IntegrationIconFrame = Instance.new(Frame)
		local UIListLayout_2 = Instance.new(UIListLayout)
		local IntegrationIcon = Instance.new(ImageLabel)
		local SelectedHighlighter = Instance.new(Frame)
		local corner = Instance.new(UICorner)
		local Highlighter = Instance.new(Frame)
		local corner_2 = Instance.new(UICorner)
		local _5 = Instance.new(Frame)

		backpack.Name = FATALITY..FatalityRandomString();
		backpack.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		backpack.BackgroundTransparency = 1.000
		backpack.BorderSizePixel = 0
		backpack.LayoutOrder = 9
		backpack.Size = UDim2.new(1, 0, 0, 56)
		backpack.AutoButtonColor = false

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = backpack

		RowLabel.Name = RowLabel
		RowLabel.Parent = backpack
		RowLabel.BackgroundTransparency = 1.000
		RowLabel.BorderSizePixel = 0
		RowLabel.LayoutOrder = 9
		RowLabel.Size = UDim2.new(1, 0, 1, 0)

		UIListLayout.Parent = RowLabel
		UIListLayout.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		UIListLayout.Padding = UDim.new(0, 8)

		StyledTextLabel.Name = StyledTextLabel
		StyledTextLabel.Parent = RowLabel
		StyledTextLabel.BackgroundTransparency = 1.000
		StyledTextLabel.Size = UDim2.new(1, -52, 1, 0)
		StyledTextLabel.Font = Enum.Font.BuilderSansBold
		StyledTextLabel.Text = Window.Name
		StyledTextLabel.TextColor3 = Color3.fromRGB(247, 247, 248)
		StyledTextLabel.TextScaled = true
		StyledTextLabel.TextSize = 20.000
		StyledTextLabel.TextWrapped = true
		StyledTextLabel.TextXAlignment = Enum.TextXAlignment.Left

		UITextSizeConstraint.Parent = StyledTextLabel
		UITextSizeConstraint.MaxTextSize = 20
		UITextSizeConstraint.MinTextSize = 15

		UIPadding.Parent = RowLabel
		UIPadding.PaddingLeft = UDim.new(0, 8)
		UIPadding.PaddingRight = UDim.new(0, 8)

		IconHost.Name = IconHost
		IconHost.Parent = RowLabel
		IconHost.BackgroundTransparency = 1.000
		IconHost.BorderSizePixel = 0
		IconHost.LayoutOrder = 9
		IconHost.Size = UDim2.new(0, 44, 0, 44)
		IconHost.ZIndex = 9

		IntegrationIconFrame.Name = IntegrationIconFrame
		IntegrationIconFrame.Parent = IconHost
		IntegrationIconFrame.BackgroundTransparency = 1.000
		IntegrationIconFrame.BorderSizePixel = 0
		IntegrationIconFrame.Size = UDim2.new(1, 0, 1, 0)

		UIListLayout_2.Parent = IntegrationIconFrame
		UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center

		IntegrationIcon.Name = IntegrationIcon
		IntegrationIcon.Parent = IntegrationIconFrame
		IntegrationIcon.BackgroundTransparency = 1.000
		IntegrationIcon.Size = UDim2.new(0, 36, 0, 36)
		IntegrationIcon.Image = httpwww.roblox.comassetid=11290237405
		IntegrationIcon.ImageColor3 = Color3.fromRGB(247, 247, 248)

		SelectedHighlighter.Name = SelectedHighlighter
		SelectedHighlighter.Parent = IconHost
		SelectedHighlighter.AnchorPoint = Vector2.new(0.5, 0.5)
		SelectedHighlighter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SelectedHighlighter.BackgroundTransparency = 0.850
		SelectedHighlighter.BorderSizePixel = 0
		SelectedHighlighter.Position = UDim2.new(0.5, 0, 0.5, 0)
		SelectedHighlighter.Size = UDim2.new(0, 36, 0, 36)
		SelectedHighlighter.Visible = false

		corner.CornerRadius = UDim.new(1, 0)
		corner.Name = corner
		corner.Parent = SelectedHighlighter

		Highlighter.Name = Highlighter
		Highlighter.Parent = IconHost
		Highlighter.AnchorPoint = Vector2.new(0.5, 0.5)
		Highlighter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Highlighter.BackgroundTransparency = 0.850
		Highlighter.BorderSizePixel = 0
		Highlighter.Position = UDim2.new(0.5, 0, 0.5, 0)
		Highlighter.Size = UDim2.new(0, 36, 0, 36)
		Highlighter.Visible = false

		corner_2.CornerRadius = UDim.new(1, 0)
		corner_2.Name = corner
		corner_2.Parent = Highlighter

		_5.Name = 5
		_5.Parent = IconHost
		_5.BackgroundTransparency = 1.000
		_5.Size = UDim2.new(1, 0, 1, 0)
		_5.ZIndex = 2

		backpack.MouseButton1ClickConnect(function()
			Fatal.Toggle = not Fatal.Toggle;

			ToggleUI(Fatal.Toggle);
		end);

		backpack.MouseEnterConnect(function()
			FatalityCreateAnimation(backpack,0.3,nil,{
				BackgroundColor3 = Color3.fromRGB(50, 255, 50),
				BackgroundTransparency = 0.85
			})
		end)

		backpack.MouseLeaveConnect(function()
			FatalityCreateAnimation(backpack,0.3,nil,{
				BackgroundTransparency = 1
			})
		end)

		return backpack;
	end;

	function FatalSetVisible(b)
		Fatal.Toggle = b;
		ToggleUI(b);
	end;

	ToggleUI(true);

	return Fatal;
end;

function FatalityLoader(Config Loader)
	Config = Config or {};
	Config.Name = Config.Name or FATALITY;
	Config.Duration = Config.Duration or 3.5;
	Config.Scale = Config.Scale or 3;

	local Blur = Instance.new('BlurEffect');
	local Loader = Instance.new(ScreenGui)
	local center = Instance.new(Frame)
	local texts = Instance.new(Frame)
	local UIListLayout = Instance.new(UIListLayout)
	local BlackFrame = Instance.new(Frame)

	Loader.Name = FatalityRandomString()
	Loader.Parent = CoreGui
	Loader.IgnoreGuiInset = true
	Loader.ZIndexBehavior = Enum.ZIndexBehavior.Global

	center.Name = FatalityRandomString()
	center.Parent = Loader
	center.AnchorPoint = Vector2.new(0.5, 0.5)
	center.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	center.BackgroundTransparency = 1.000
	center.BorderColor3 = Color3.fromRGB(0, 0, 0)
	center.BorderSizePixel = 0
	center.Position = UDim2.new(0.5, 0, 0.5, 0)

	texts.Name = FatalityRandomString()
	texts.Parent = Loader
	texts.AnchorPoint = Vector2.new(0.5, 0.5)
	texts.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	texts.BackgroundTransparency = 1.000
	texts.BorderColor3 = Color3.fromRGB(0, 0, 0)
	texts.BorderSizePixel = 0
	texts.Position = UDim2.new(0.5, 0, 0.5, 0)
	texts.Size = UDim2.new(1, 0, 0, 200)

	UIListLayout.Parent = texts
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout.Padding = UDim.new(0, Config.Scale  5)

	BlackFrame.Name = FatalityRandomString()
	BlackFrame.Parent = Loader
	BlackFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	BlackFrame.BackgroundTransparency = 1
	BlackFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	BlackFrame.BorderSizePixel = 0
	BlackFrame.Size = UDim2.new(1, 0, 1, 0)

	Blur.Size = 0;
	Blur.Parent = gameGetService('Lighting');

	FatalityCreateAnimation(Blur,1,{
		Size = 60
	})

	FatalityCreateAnimation(BlackFrame,0.5,{
		BackgroundTransparency = 0.7
	}).CompletedWait();

	task.wait(0.5);

	local UText = {
		Y = 14,
	};

	local createText = function(TEXT)
		local LIT = Instance.new(Frame)
		local ASCII = Instance.new(TextLabel)
		local UIGradient = Instance.new(UIGradient)
		local UIScale = Instance.new(UIScale)

		LIT.Name = FatalityRandomString()
		LIT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LIT.BackgroundTransparency = 1.000
		LIT.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LIT.BorderSizePixel = 0
		LIT.Size = UDim2.new(0, 56, 0, 100)
		LIT.ZIndex = 8

		ASCII.Name = FatalityRandomString()
		ASCII.Parent = LIT
		ASCII.AnchorPoint = Vector2.new(0.5, 0.5)
		ASCII.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ASCII.BackgroundTransparency = 1.000
		ASCII.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ASCII.BorderSizePixel = 0
		ASCII.Position = UDim2.new(0.5, 0, 0.5, 0)
		ASCII.Size = UDim2.new(0, 28, 0, 50)
		ASCII.ZIndex = 8
		ASCII.Font = Enum.Font.GothamBold
		ASCII.Text = TEXT
		ASCII.TextColor3 = Color3.fromRGB(255, 255, 255)
		ASCII.TextSize = 50.000
		ASCII.TextWrapped = true

		local textsize = FatalityGetTextSize(ASCII);

		ASCII.Size = UDim2.new(0, textsize.X + 100, 0, 50)
		LIT.Size = UDim2.new(0, (textsize.X  2.5) + (UText[TEXT] or 0), 0, 100)

		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 255, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(50, 255, 50))}
		UIGradient.Rotation = 88
		UIGradient.Parent = ASCII

		UIScale.Parent = ASCII
		UIScale.Scale = Config.Scale

		return LIT,ASCII
	end;

	local PosText = {};
	local IsFirst = true;

	string.gsub(Config.Name,'.',function(T)
		local L,A = createText(T);

		L.Parent = texts;
		A.TextTransparency = 1;

		if not IsFirst then
			A.Position = UDim2.new(0.5,0,0.5,200);
		end;

		table.insert(PosText,{
			Frame = L,
			Text = A
		});

		IsFirst = false;
	end);

	do
		local StartText = Instance.new(TextLabel)
		local UIGradient = Instance.new(UIGradient)
		local UIScale = Instance.new(UIScale)

		StartText.Name = FatalityRandomString()
		StartText.Parent = Loader
		StartText.AnchorPoint = Vector2.new(0.5, 0.5)
		StartText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		StartText.BackgroundTransparency = 1.000
		StartText.BorderColor3 = Color3.fromRGB(0, 0, 0)
		StartText.BorderSizePixel = 0
		StartText.Position = UDim2.new(0.5, 0, 0.5, 0)
		StartText.Size = UDim2.new(0, 28, 0, 50)
		StartText.ZIndex = 8
		StartText.Font = Enum.Font.GothamBold
		StartText.Text = Config.Namesub(1,1)
		StartText.TextColor3 = Color3.fromRGB(255, 255, 255)
		StartText.TextSize = 50.000
		StartText.TextWrapped = true
		StartText.TextTransparency = 1;

		local textsize = FatalityGetTextSize(StartText);
		local baseSIZX = textsize.X;

		StartText.Size = UDim2.new(0, baseSIZX + 100, 0, 50)

		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 255, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(50, 255, 50))}
		UIGradient.Rotation = 88
		UIGradient.Parent = StartText

		UIScale.Parent = StartText
		UIScale.Scale = Config.Scale  4;

		FatalityCreateAnimation(StartText,0.45,{
			TextTransparency = 0
		})

		FatalityCreateAnimation(UIScale,0.5,{
			Scale = Config.Scale;
		});

		task.wait(0.45);

		FatalityCreateAnimation(StartText,0.35,{
			Position = UDim2.fromOffset(PosText[1].Frame.AbsolutePosition.X + (PosText[1].Frame.AbsoluteSize.X  2),PosText[1].Frame.AbsolutePosition.Y + (PosText[1].Frame.AbsoluteSize.Y  2) + math.abs(Loader.AbsolutePosition.Y))
		})

		task.wait(0.5);

		for i,v in next , PosText do
			if i  1 then
				FatalityCreateAnimation(v.Text,0.65,{
					Position = UDim2.new(0.5,0,0.5,0);
					TextTransparency = 0
				})
			end;
		end;

		task.wait((Config.Duration - 0.5) + 0.65);

		FatalityCreateAnimation(StartText,1.5,{
			TextTransparency = 1
		})

		for i,v in next , PosText do
			FatalityCreateAnimation(v.Text,1.5,{
				TextTransparency = 1
			})
		end;

		FatalityCreateAnimation(Blur,1.5,{
			Size = 0
		})

		FatalityCreateAnimation(BlackFrame,1.5,{
			BackgroundTransparency = 1
		})

		task.wait(1.65);

		LoaderDestroy();
	end;
end;

function FatalityCreateNotifier() Notifier
	local Notify = Instance.new(ScreenGui)
	local layout = Instance.new(Frame)
	local UIListLayout = Instance.new(UIListLayout)

	Notify.Name = FatalityRandomString();
	Notify.Parent = CoreGui
	Notify.ResetOnSpawn = false
	Notify.ZIndexBehavior = Enum.ZIndexBehavior.Global
	Notify.IgnoreGuiInset = true;

	layout.Name = FatalityRandomString();
	layout.Parent = Notify
	layout.AnchorPoint = Vector2.new(1, 0)
	layout.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	layout.BackgroundTransparency = 1.000
	layout.BorderColor3 = Color3.fromRGB(0, 0, 0)
	layout.BorderSizePixel = 0
	layout.Position = UDim2.new(1, -5, 0, 5)
	layout.Size = UDim2.new(0, 150, 0, 50)

	UIListLayout.Parent = layout
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	return FatalityCreateResponse({
		Notify = function(Config Notify)
			Config = Config or {}
			Config.Icon = Config.Icon or settings;
			Config.Content = Config.Content or nil;
			Config.Title = Config.Title or Notification;
			Config.Duration = Config.Duration or 5;

			local notify = Instance.new(Frame)
			local notify_block = Instance.new(Frame)
			local UICorner = Instance.new(UICorner)
			local UIStroke = Instance.new(UIStroke)
			local Icon = Instance.new(ImageLabel)
			local HeaderText = Instance.new(TextLabel)
			local BodyText = Instance.new(TextLabel)

			notify.Name = FatalityRandomString()
			notify.Parent = layout
			notify.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
			notify.BackgroundTransparency = 1.000
			notify.BorderColor3 = Color3.fromRGB(0, 0, 0)
			notify.BorderSizePixel = 0
			notify.Size = UDim2.new(0, 0, 0, 0)

			notify_block.Name = FatalityRandomString()
			notify_block.Parent = notify
			notify_block.AnchorPoint = Vector2.new(0.5, 0)
			notify_block.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
			notify_block.BackgroundTransparency = 0.1
			notify_block.BorderColor3 = Color3.fromRGB(0, 0, 0)
			notify_block.BorderSizePixel = 0
			notify_block.Position = UDim2.new(2, 100, 0, 0)
			notify_block.Size = UDim2.new(1, 0, 1, -12)
			notify_block.ClipsDescendants = true
			notify_block.ZIndex = 54

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = notify_block

			UIStroke.Thickness = 2.500
			UIStroke.Transparency = 0.900
			UIStroke.Parent = notify_block

			Icon.Name = FatalityRandomString()
			Icon.Parent = notify_block
			Icon.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
			Icon.BackgroundTransparency = 1.000
			Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Icon.BorderSizePixel = 0
			Icon.Position = UDim2.new(0, 7, 0, 7)
			Icon.Size = UDim2.new(0, 18, 0, 18)
			Icon.Image = FatalityGetIcon(Config.Icon);
			Icon.ImageColor3 = Color3.fromRGB(50, 255, 50)
			Icon.ZIndex = 55

			HeaderText.Name = FatalityRandomString()
			HeaderText.Parent = notify_block
			HeaderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			HeaderText.BackgroundTransparency = 1.000
			HeaderText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			HeaderText.BorderSizePixel = 0
			HeaderText.Position = UDim2.new(0, 30, 0, 7)
			HeaderText.Size = UDim2.new(1, 0, 0, 15)
			HeaderText.ZIndex = 55
			HeaderText.FontFace = Fatality.FontSemiBold
			HeaderText.Text = Config.Title
			HeaderText.TextColor3 = Color3.fromRGB(50, 255, 50)
			HeaderText.TextSize = 13.000
			HeaderText.TextTransparency = 0.200
			HeaderText.TextXAlignment = Enum.TextXAlignment.Left

			BodyText.Name = FatalityRandomString()
			BodyText.Parent = notify_block
			BodyText.AnchorPoint = Vector2.new(0, 1)
			BodyText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			BodyText.BackgroundTransparency = 1.000
			BodyText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			BodyText.BorderSizePixel = 0
			BodyText.Position = UDim2.new(0, 10, 1, 0)
			BodyText.Size = UDim2.new(1, -15, 1, -29)
			BodyText.ZIndex = 55
			BodyText.FontFace = Fatality.FontSemiBold
			BodyText.Text = Config.Content or ;
			BodyText.TextColor3 = Color3.fromRGB(255, 255, 255)
			BodyText.TextSize = 12.000
			BodyText.TextTransparency = 0.300
			BodyText.TextWrapped = true
			BodyText.TextXAlignment = Enum.TextXAlignment.Left
			BodyText.TextYAlignment = Enum.TextYAlignment.Top

			local updateScale = function()
				local TitleScale = FatalityGetTextSize(HeaderText,Enum.Font.GothamBold);
				local ContentScale = FatalityGetTextSize(BodyText,Enum.Font.GothamMedium);

				local XScale = (TitleScale.X  ContentScale.X and TitleScale.X) or ContentScale.X;
				local YScale = (TitleScale.Y  ContentScale.Y and TitleScale.Y) or ContentScale.Y;

				FatalityCreateAnimation(notify,0.25,{
					Size = UDim2.new(0, 0, 0, YScale + 50)
				})

				task.delay(0.25,function()
					FatalityCreateAnimation(notify,0.15,{
						Size = UDim2.new(0, XScale + 25, 0, YScale + 50)
					})

					FatalityCreateAnimation(notify_block,0.5,{
						Position = UDim2.new(0.5, 0, 0, 0)
					})
				end);
			end;

			updateScale();

			task.delay(Config.Duration + 0.25,function()
				FatalityCreateAnimation(notify_block,0.5,{
					Position = UDim2.new(2, 100, 0, 0)
				})

				task.delay(0.65,function()
					FatalityCreateAnimation(notify,0.5,{
						Size = UDim2.new(0,0,0,0)
					})

					task.wait(0.5)

					notifyDestroy();
				end);
			end)
		end,
	});
end;

Fatality.FATALITY_PID = FatalityRandomString();

return Fatality;
