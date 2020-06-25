WASDMode = 0
    return

!`::
    If (WASDMode == 0) {
        WASDMode = 1
        TrayTip, WASDMode, Enabled, 1
    } Else {
        WASDMode = 0
        TrayTip, WASDMode, Disabled, 1
    }    
    return

#If WASDMode == 1
    q::
        MouseClick, Left
        return
    e::
        MouseClick, Right
        return
    w::
        MouseMove, 0, -100, 0, R
        return
    a::
        MouseMove, -100, 0, 0, R
        return

    s::
        MouseMove, 0, 100, 0, R
        return

    d::
        MouseMove, 100, 0, 0, R
        return

    h::Left
    j::Down
    k::Up
    l::Right
#If


