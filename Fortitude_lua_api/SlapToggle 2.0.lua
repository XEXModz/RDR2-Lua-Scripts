logger.logCustom('<white>Slap initialised')

local drunk_slap_toggle = false
local hotkey_index = 1
local last_toggle_time = 0
local toggle_delay = 500

local virtual_keys = {
    { name = 'VK_NONE',                value = 0x00, description = 'None' },
    { name = 'VK_LBUTTON',             value = 0x01, description = 'LBM' },
    { name = 'VK_RBUTTON',             value = 0x02, description = 'RBM' },
    { name = 'VK_CANCEL',              value = 0x03, description = 'Cancel' },
    { name = 'VK_MBUTTON',             value = 0x04, description = 'MBM' },
    { name = 'VK_XBUTTON1',            value = 0x05, description = 'XBM1' },
    { name = 'VK_XBUTTON2',            value = 0x06, description = 'XBM2' },
    { name = 'VK_BACK',                value = 0x08, description = 'Back' },
    { name = 'VK_TAB',                 value = 0x09, description = 'Tab' },
    { name = 'VK_CLEAR',               value = 0x0C, description = 'Clear' },
    { name = 'VK_RETURN',              value = 0x0D, description = 'Return' },
    { name = 'VK_SHIFT',               value = 0x10, description = 'Shift' },
    { name = 'VK_CONTROL',             value = 0x11, description = 'Ctrl' },
    { name = 'VK_MENU',                value = 0x12, description = 'Alt' },
    { name = 'VK_PAUSE',               value = 0x13, description = 'Pause' },
    { name = 'VK_CAPITAL',             value = 0x14, description = 'Caps Lock' },
    { name = 'VK_KANA',                value = 0x15, description = 'Kana' },
    { name = 'VK_HANGUEL',             value = 0x15, description = 'Hanguel' },
    { name = 'VK_HANGUL',              value = 0x15, description = 'Hangul' },
    { name = 'VK_JUNJA',               value = 0x17, description = 'Junja' },
    { name = 'VK_FINAL',               value = 0x18, description = 'Final' },
    { name = 'VK_HANJA',               value = 0x19, description = 'Hanja' },
    { name = 'VK_KANJI',               value = 0x19, description = 'Kanji' },
    { name = 'VK_ESCAPE',              value = 0x1B, description = 'Esc' },
    { name = 'VK_CONVERT',             value = 0x1C, description = 'Convert' },
    { name = 'VK_NONCONVERT',          value = 0x1D, description = 'Nonconvert' },
    { name = 'VK_ACCEPT',              value = 0x1E, description = 'Accept' },
    { name = 'VK_MODECHANGE',          value = 0x1F, description = 'Mode Change' },
    { name = 'VK_SPACE',               value = 0x20, description = 'Space', },
    { name = 'VK_PRIOR',               value = 0x21, description = 'Page Up' },
    { name = 'VK_NEXT',                value = 0x22, description = 'Page Down' },
    { name = 'VK_END',                 value = 0x23, description = 'End' },
    { name = 'VK_HOME',                value = 0x24, description = 'Home' },
    { name = 'VK_LEFT',                value = 0x25, description = 'Left' },
    { name = 'VK_UP',                  value = 0x26, description = 'Up' },
    { name = 'VK_RIGHT',               value = 0x27, description = 'Right' },
    { name = 'VK_DOWN',                value = 0x28, description = 'Down' },
    { name = 'VK_SELECT',              value = 0x29, description = 'Select' },
    { name = 'VK_PRINT',               value = 0x2A, description = 'Print' },
    { name = 'VK_EXECUTE',             value = 0x2B, description = 'Execute' },
    { name = 'VK_SNAPSHOT',            value = 0x2C, description = 'Print Screen' },
    { name = 'VK_INSERT',              value = 0x2D, description = 'Insert' },
    { name = 'VK_DELETE',              value = 0x2E, description = 'Delete' },
    { name = 'VK_HELP',                value = 0x2F, description = 'Help' },
    { name = 'VK_LWIN',                value = 0x5B, description = 'Left Windows' },
    { name = 'VK_RWIN',                value = 0x5C, description = 'Right Windows' },
    { name = 'VK_APPS',                value = 0x5D, description = 'Applications' },
    { name = 'VK_SLEEP',               value = 0x5F, description = 'Sleep' },
    { name = 'VK_F1',                  value = 0x70, description = 'F1' },
    { name = 'VK_F2',                  value = 0x71, description = 'F2' },
    { name = 'VK_F3',                  value = 0x72, description = 'F3' },
    { name = 'VK_F4',                  value = 0x73, description = 'F4' },
    { name = 'VK_F5',                  value = 0x74, description = 'F5' },
    { name = 'VK_F6',                  value = 0x75, description = 'F6' },
    { name = 'VK_F7',                  value = 0x76, description = 'F7' },
    { name = 'VK_F8',                  value = 0x77, description = 'F8' },
    { name = 'VK_F9',                  value = 0x78, description = 'F9' },
    { name = 'VK_F10',                 value = 0x79, description = 'F10' },
    { name = 'VK_F11',                 value = 0x7A, description = 'F11' },
    { name = 'VK_F12',                 value = 0x7B, description = 'F12' },
    { name = 'VK_NUMLOCK',             value = 0x90, description = 'Num' },
    { name = 'VK_SCROLL',              value = 0x91, description = 'Scroll Lock' },
    { name = 'VK_LSHIFT',              value = 0xA0, description = 'Left Shift' },
    { name = 'VK_RSHIFT',              value = 0xA1, description = 'Right Shift' },
    { name = 'VK_LCONTROL',            value = 0xA2, description = 'Left Ctrl' },
    { name = 'VK_RCONTROL',            value = 0xA3, description = 'Right Ctrl' },
    { name = 'VK_LMENU',               value = 0xA4, description = 'Left Alt' },
    { name = 'VK_RMENU',               value = 0xA5, description = 'Right Alt' },
    { name = 'VK_BROWSER_BACK',        value = 0xA6, description = 'Browser Back' },
    { name = 'VK_BROWSER_FORWARD',     value = 0xA7, description = 'Browser Forward' },
    { name = 'VK_BROWSER_REFRESH',     value = 0xA8, description = 'Browser Refresh' },
    { name = 'VK_BROWSER_STOP',        value = 0xA9, description = 'Browser Stop' },
    { name = 'VK_BROWSER_SEARCH',      value = 0xAA, description = 'Browser Search' },
    { name = 'VK_BROWSER_FAVORITES',   value = 0xAB, description = 'Browser Favorites' },
    { name = 'VK_BROWSER_HOME',        value = 0xAC, description = 'Browser Home' },
    { name = 'VK_VOLUME_MUTE',         value = 0xAD, description = 'Volume Mute' },
    { name = 'VK_VOLUME_DOWN',         value = 0xAE, description = 'Volume Down' },
    { name = 'VK_VOLUME_UP',           value = 0xAF, description = 'Volume Up' },
    { name = 'VK_MEDIA_NEXT_TRACK',    value = 0xB0, description = 'Next Track' },
    { name = 'VK_MEDIA_PREV_TRACK',    value = 0xB1, description = 'Previous Track' },
    { name = 'VK_MEDIA_STOP',          value = 0xB2, description = 'Stop' },
    { name = 'VK_MEDIA_PLAY_PAUSE',    value = 0xB3, description = 'Play/Pause' },
    { name = 'VK_LAUNCH_MAIL',         value = 0xB4, description = 'Mail' },
    { name = 'VK_LAUNCH_MEDIA_SELECT', value = 0xB5, description = 'Media Select' },
    { name = 'VK_LAUNCH_APP1',         value = 0xB6, description = 'App1' },
    { name = 'VK_LAUNCH_APP2',         value = 0xB7, description = 'App2' },
    { name = 'VK_PROCESSKEY',          value = 0xE5, description = 'Process' },
    { name = 'VK_PACKET',              value = 0xE7, description = 'Packet' },
    { name = 'VK_ATTN',                value = 0xF6, description = 'Attn' },
    { name = 'VK_CRSEL',               value = 0xF7, description = 'CrSel' },
    { name = 'VK_EXSEL',               value = 0xF8, description = 'ExSel' },
    { name = 'VK_EREOF',               value = 0xF9, description = 'Erase EOF' },
    { name = 'VK_PLAY',                value = 0xFA, description = 'Play' },
    { name = 'VK_ZOOM',                value = 0xFB, description = 'Zoom' },
    { name = 'VK_NONAME',              value = 0xFC, description = 'NoName' },
    { name = 'VK_PA1',                 value = 0xFD, description = 'PA1' },
    { name = 'VK_OEM_CLEAR',           value = 0xFE, description = 'Clear' },
    { name = 'VK_UNKNOWN',             value = 0xFF, description = 'Unknown' },
    { name = 'VK_NONE',                value = 0x00, description = 'None' },
    { name = 'VK_KEY_0',               value = 0x30, description = '0', },
    { name = 'VK_KEY_1',               value = 0x31, description = '1', },
    { name = 'VK_KEY_2',               value = 0x32, description = '2', },
    { name = 'VK_KEY_3',               value = 0x33, description = '3', },
    { name = 'VK_KEY_4',               value = 0x34, description = '4', },
    { name = 'VK_KEY_5',               value = 0x35, description = '5', },
    { name = 'VK_KEY_6',               value = 0x36, description = '6', },
    { name = 'VK_KEY_7',               value = 0x37, description = '7', },
    { name = 'VK_KEY_8',               value = 0x38, description = '8', },
    { name = 'VK_KEY_9',               value = 0x39, description = '9', },
    { name = 'VK_KEY_A',               value = 0x41, description = 'A', },
    { name = 'VK_KEY_B',               value = 0x42, description = 'B', },
    { name = 'VK_KEY_C',               value = 0x43, description = 'C', },
    { name = 'VK_KEY_D',               value = 0x44, description = 'D', },
    { name = 'VK_KEY_E',               value = 0x45, description = 'E', },
    { name = 'VK_KEY_F',               value = 0x46, description = 'F', },
    { name = 'VK_KEY_G',               value = 0x47, description = 'G', },
    { name = 'VK_KEY_H',               value = 0x48, description = 'H', },
    { name = 'VK_KEY_I',               value = 0x49, description = 'I', },
    { name = 'VK_KEY_J',               value = 0x4A, description = 'J', },
    { name = 'VK_KEY_K',               value = 0x4B, description = 'K', },
    { name = 'VK_KEY_L',               value = 0x4C, description = 'L', },
    { name = 'VK_KEY_M',               value = 0x4D, description = 'M', },
    { name = 'VK_KEY_N',               value = 0x4E, description = 'N', },
    { name = 'VK_KEY_O',               value = 0x4F, description = 'O', },
    { name = 'VK_KEY_P',               value = 0x50, description = 'P', },
    { name = 'VK_KEY_Q',               value = 0x51, description = 'Q', },
    { name = 'VK_KEY_R',               value = 0x52, description = 'R', },
    { name = 'VK_KEY_S',               value = 0x53, description = 'S', },
    { name = 'VK_KEY_T',               value = 0x54, description = 'T', },
    { name = 'VK_KEY_U',               value = 0x55, description = 'U', },
    { name = 'VK_KEY_V',               value = 0x56, description = 'V', },
    { name = 'VK_KEY_W',               value = 0x57, description = 'W', },
    { name = 'VK_KEY_X',               value = 0x58, description = 'X', },
    { name = 'VK_KEY_Y',               value = 0x59, description = 'Y', },
    { name = 'VK_KEY_Z',               value = 0x5A, description = 'Z', },
    { name = 'VK_OEM_PLUS',            value = 0xBB, description = '+', },
    { name = 'VK_OEM_COMMA',           value = 0xBC, description = ',', },
    { name = 'VK_OEM_MINUS',           value = 0xBD, description = '-', },
    { name = 'VK_OEM_PERIOD',          value = 0xBE, description = '.', },
    { name = 'VK_OEM_1',               value = 0xBA, description = ';', },
    { name = 'VK_OEM_2',               value = 0xBF, description = '/', },
    { name = 'VK_OEM_3',               value = 0xC0, description = '`', },
    { name = 'VK_OEM_4',               value = 0xDB, description = '[', },
}

local function toggle_drunk_slap()
    local current_time = system.getTickCount64()
    if current_time - last_toggle_time < toggle_delay then
        return
    end
    last_toggle_time = current_time

    local player_ped = player.getLocalPed()
    drunk_slap_toggle = not drunk_slap_toggle

    menu.setToggleValue('self', 'Drunk Slap', drunk_slap_toggle)

    if drunk_slap_toggle then
        natives.ped_setPedDrunkness(player_ped, true, 1.0)
        natives.ped_setPedBrawlingStyle(player_ped, 0x687BF19F)
        logger.logInfo("Drunk slap mode enabled.")
        notifications.alertInfo("INFO", "Drunk slap mode enabled.")
    else
        natives.ped_setPedDrunkness(player_ped, false, 0.0)
        natives.ped_setPedBrawlingStyle(player_ped, 0x78BAEF07)
        logger.logInfo("Drunk slap mode disabled.")
        notifications.alertInfo("INFO", "Drunk slap mode disabled.")
    end
end

local function check_hotkey_press()
    if utility.isKeyPressed(true, virtual_keys[hotkey_index].value) then
        toggle_drunk_slap()
    end
end

menu.addToggleButton('self', 'Drunk Slap', '', false, function(toggle)
    toggle_drunk_slap(toggle)
end)

local saved_hotkey_index = config.loadString('hotkey_index', '1')
hotkey_index = tonumber(saved_hotkey_index)

local descriptions = {}
for _, key in ipairs(virtual_keys) do
    table.insert(descriptions, key.description)
end

menu.addStringSpinner('self', 'Hotkey', 'Choose a hotkey to toggle drunk mode.', hotkey_index - 1, descriptions, function(value_idx)
    hotkey_index = value_idx + 1
    config.saveString('hotkey_index', tostring(hotkey_index))
end)

system.registerTick(check_hotkey_press)

system.registerDestructor(function()
    if drunk_slap_toggle then
        local player_ped = player.getLocalPed()
        natives.ped_setPedDrunkness(player_ped, false, 0.0)
        natives.ped_setPedBrawlingStyle(player_ped, 0x78BAEF07)
    end
    system.unregisterTick(check_hotkey_press)
end)
