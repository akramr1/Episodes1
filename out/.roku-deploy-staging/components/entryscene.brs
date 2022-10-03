
sub init()

STOP
    m.Top.backgroundColor="0x662d91"
    m.Top.backgroundUri="pkg:/images/space.jpg"
    m.loadingIndicator=m.Top.findNode("loadingIndicator")
    initScrStack()
    showGridScr()
    runContentTask()

endsub


'==========================================
' function to handle the back button on the remote

function onKeyEvent(key as string, press as boolean) as boolean
    res = false
    if press = "back"
        numScreens = m.screenStack.Count()
        if numScreens > 1
            closeScr(invalid)
            res = true
        endif
    endif
    return res
endfunction