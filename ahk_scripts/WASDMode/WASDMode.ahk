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
    w::Up
    a::Left
    s::Down
    d::Right

    h::Left
    j::Down
    k::Up
    l::Right
#If


