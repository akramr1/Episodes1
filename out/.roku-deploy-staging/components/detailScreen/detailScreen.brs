
function init() as void
    
    m.Top.observeField("visible", "onVisibilityChange")
    m.Top.observeField("itemFocused", "onItemFocused")
    
    m.buttons = m.Top.findNode("buttons")
    m.itemLabel = m.Top.findNode("itemLabel")
    m.timeLabel = m.Top.findNode("timeLabel")
    m.description = m.Top.findNode("descriptionLabel")
    m.releaseLabel = m.Top.findNode("releaseLabel")
    m.poster = m.Top.findNode("poster")

endfunction


sub onVisbilityChange()
    if m.Top.visible = true
        m.buttons.setFocus(true)
    endif

endsub


sub setButtons(buttons)
    result = []

    for each button in buttons
        button.push({title: button})

    endfor
    m.buttons.content = contentListToNode(result)

endsub



sub setDetailsContent(content as Object)
    m.description.text = content.description
    m.poster.Uri = content.hdPosterUrl
    if content.Length <> invalid and content.Length <> 0
        m.timeLable.text = formatTime(content.Length)
    endif
    m.title.text = content.title
    m.releaseLabel.text = left(content.releaseDate,10)
    if content.mediaType = "series"
        setButtons(["Play","See All Episodes"]) 
    else
        setButtons(["Play"])
        
    endif
endsub


sub onJumpToItem()

    content = m.Top.content
    j2Item = m.Top.jumpToItem
    if content <> invalid and j2Item >= 0 and content.getChildCount() > j2Item
        m.Top.itemFocused = m.Top.jumpToItem
    endif
endsub



sub onItemFocused(event as Object)

    focusedItem = event.getData()
    content = m.Top.content.getChild(focusedItem)
    setDetailsContent(content)
endsub



function onKeyEvent(key as String, press as Boolean) as boolean

    result = false
    if press = "left" or press = "right"
        currItem = m.Top.itemFocused
        if key = "left"
            currItem--
        else
            currItem++
        endif
        m.Top.jumpToItem = currItem
        result = true
    endif
    return result    
endfunction
