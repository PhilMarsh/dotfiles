/*
    Emulate MacOS's "Hot Corners" feature.
    Corners are defined by the outermost bounding box of all screens collectively.
*/
#Requires AutoHotkey v2.0
#SingleInstance

; report mouse coordinates as relative to the whole screen, not the current window.
CoordMode("Mouse", "Screen")

; how close the mouse needs to be to the edges to trigger (1 is the minimum).
EDGE_THICKNESS := 1

; magic Windows consts, per https://www.autohotkey.com/docs/v2/lib/SysGet.htm.
SYS_GET_VIRTUALSCREEN_LEFT := 76 ; SM_XVIRTUALSCREEN 
SYS_GET_VIRTUALSCREEN_TOP := 77 ; SM_YVIRTUALSCREEN
SYS_GET_VIRTUALSCREEN_WIDTH := 78 ; SM_CXVIRTUALSCREEN 
SYS_GET_VIRTUALSCREEN_HEIGHT := 79 ; SM_CYVIRTUALSCREEN

; try to trigger every 100ms.
SetTimer(hot_corners_main, 100)

; remember the last action so we only perform new actions.
_last_corner_action := no_action

hot_corners_main() {
    global _last_corner_action

    corner_action := current_corner_action()
    if corner_action != _last_corner_action {
        corner_action()
        _last_corner_action := corner_action
    }
}

current_corner_action() {
    screen_left := SysGet(SYS_GET_VIRTUALSCREEN_LEFT)
    screen_right := screen_left + SysGet(SYS_GET_VIRTUALSCREEN_WIDTH)
    screen_top := SysGet(SYS_GET_VIRTUALSCREEN_TOP)
    screen_bottom := screen_top + SysGet(SYS_GET_VIRTUALSCREEN_HEIGHT)

    MouseGetPos(&mouse_x, &mouse_y)

    is_top := mouse_y <= (screen_top + EDGE_THICKNESS)
    is_bottom := mouse_y >= (screen_bottom - EDGE_THICKNESS)
    is_left := mouse_x <= (screen_left + EDGE_THICKNESS)
    is_right := mouse_x >= (screen_right - EDGE_THICKNESS)

    if is_top and is_left {
        return top_left_action
    }
    else if is_top and is_right {
        return top_right_action
    }
    else if is_bottom and is_left {
        return bottom_left_action
    }
    else if is_bottom and is_right {
        return bottom_right_action
    }
    else {
        return no_action
    }
}


top_left_action() {
}

top_right_action() {
}

bottom_left_action() {
    toggle_task_view()
}

bottom_right_action() {
    toggle_task_view()
}

no_action() {
}

; "Task View" is the Windows analogue to MacOS's "Mission Control".
toggle_task_view() {
    SendInput("#{tab}")
}
