#If MouseIsOver("ahk_class Shell_TrayWnd")

WheelUp::
Send {Volume_Up}
return

WheelDown::
Send {Volume_Down}
return

;MButton::
;Send {Volume_Mute}
;return

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}
;----------    
