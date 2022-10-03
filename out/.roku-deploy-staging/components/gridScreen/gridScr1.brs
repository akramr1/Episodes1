

sub init()
STOP
    m.largeGrid = m.Top.findNode("largeGrid")
    m.largeGrid.setFocus(true)
    m.descLabel = m.Top.findNode("descLabel")
    m.Top.observeField("visible","onVisibilityChng")
    m.titleLabel = m.Top.findNode("titleLabel")    
    m.Top.observeField("rowItemFocused","onRowItemFocused")
endsub
    


sub onVisibilityChng()
STOP
    if m.Top.visible = true
        m.largeGrid.setFocus(true)
    endif
endsub


sub onRowItemFocused()
STOP
    focusIdx = m.largeGrid.rowItemFocus
    row =  m.largeGrid.content.getChild(focusIdx[0])
    item = row.getChild(focusIdx[1])

    m.descLabel.text = item.description
    m.titleLabel.text = item.title
    if item.length <> invalid and item.length <> 0
        m.titleLabel.text += "|" + formatTime(item.length)
    endif

endsub