


function init()

    m.Top.observeField("visible","onVisibilityChange")
    m.categoryList = m.Top.getNode("categoryList")
    m.categoryList.observeField("itemFocused","onCategoryItemFocused")

    m.itemList = m.Top.findNode("itemList")
    m.itemList.observeField("itemFocused", "onListItemFocused")

    m.itemList.observeField("itemSelected", "onListItemSelected")
    m.Top.observeField("content", "onContentChange")

endfunction

sub onListItemFocused(event as Object)

    focusItem = event.getData()
    catIdx = m.itemToSection[focusItem]
    if (catIdx - 1) = m.categoryList.jumpToItem
        m.categoryList.animateToItem = catIdx
    elseif not m.categoryList.isInFocusChain()
        m.categoryList.jumpToItem = catIdx
    endif
    
endsub



sub initSections(content as object)

    m.firstItemInSection = [0]
    m.itemToSection = []
    sections = []
    sectionCount = 0
    for each section in content.getChildren(-1, 0)
        itemsPerSect = section.getChildCount()
        for each child in section.getChildren(-1, 0)
            m.itemSection.Push(sectionCount)
        endfor
        sections.Push({title: section.title})
        m.firstItemInSection.Push(m.firstItemInSection.Peek() + itemsPerSect)
        sectionCount++
    endfor
    m.firstItemInSection.Pop()
    m.categoryList.content = contentListToNode(sections)
endsub




sub onCategoryItemFocused(event as Object)

    if m.categoryListGainFocus = true
        m.categoryListGainFocus = false
    else
        focusedItem = event.getData()
        m.itemList.jumpToItem = m.firstItemInSection(focusedItem)
    endif

endsub


sub onJumpToItem(event as Object)

    itemIdx = event.getData()
    m.itemList.jumpToItem = itemIdx
endsub


sub onContentChange()

    content = m.Top.content
    initSections(content)
    m.itemList.content = content
endsub


sub onVisibilityChange()

    if m.Top.visible = true
        m.itemList.setFocus(true)
    endif

endsub


sub onListItemSelected(event as Object)
    itemSelected = event.getData()
    sectionIdx = m.itemToSection[itemSelected]
    m.Top.selectedItem = [sectionIdx, itemSelected - m.firstItemInSection[sectionIdx]]



endsub


function onKeyEvent(key as String, press as Boolean)
    result = false
    if press
        if key = "left" and m.itemList.hasFocus()
            m.categoryListGainFocus = true
            m.categoryList.setFocus(true)
            m.itemList.drawFocusFeedback = false
        elseif key = "right" and m.categoryList.hasFocus()
            m.itemList.drawFocusFeedback = true
            m.itemList.setFocus()
            result = true
        endif
    endif
    return result
endfunction


