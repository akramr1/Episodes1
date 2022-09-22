


sub showVideoScr(rowContent as object,selectedItem as integer, isSeries=false as boolean)

    m.isSeries = isSeries
    m.videoPlayer = createObject("roSGNode","video")
    '=== if selected item is not 1st, then we clone partial starting at selected item
    if selectedItem <> 0
        childClone = cloneChildren(rowContent,selectedItem) 
        rowNode = CreateObject("roSGNode", "ContentNode")
        rowNode.update({children: childClone}, true)
        m.videoPlayer.content = rowNode
    else
    '=== if selected item is the 1st, we clone all 
        m.videoPlayer.content = rowContent.clone(true)    
    endif  
    m.videoPlayer.contentIsPlayList = true
    showScr(m.videoPlayer)
    m.videoPlayer.control = "play"
    m.videoPlayer.observeField("state","onPlayerStateChng")
    m.videoPlayer.observeField("visible","onPlayerVisibilityChng")

endsub


sub onPlayerStateChng()

    state = m.videoPlayer.state
    if state = "error" or state = "finished"
        closeScr(m.videoPlayer)
    endif
endsub


sub onPlayerVisibilityChng()
    if m.videoPlayer.visible = false and m.Top.visible = true
        currIdx = m.videoPlayer.contentIndex
        m.videoPlayer.control = "stop"
        scr = getCurrentScr()
        scr.setFocus(true)
        newIdx = m.selectedIdx[1]
        if m.isSeries = true
            m.isSeries = false
        else
            newIdx += currIdx
        endif
        scr.jumpToItem = newIdx
    endif
endsub
