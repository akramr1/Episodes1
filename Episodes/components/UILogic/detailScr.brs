


sub showDetailScr(content as object, selectedItem as integer)

    detailScr = createObject("roSGNode","detailScreen")
    detailScr.content = content
    detailScr.jumpToItem = selectedItem
    detailScr.observeField("visible", "onDetailScrVisibilityChng")
    detailScr.observeField("buttonSelected","onButtonSelected")
endsub




sub onDetailScrVisibilityChng(event as object)
    visible = event.getData()
    detailScr = event.getRoSGNode()
    currScr = getCurrentScr()
    scrType = currScr.subType()
    if visible = false
        if scrType = "gridScreen"
            currScr.jumpToRowItem = [m.selectedIdx[0],detailScr.itemFocused]
        elseif scrType = "episodeScreen"
            content = detailScr.content.getChild(detailScr.itemFocused)
            currScr.jumpToRowItem = content.numEpisodes
        endif
    endif
endsub




sub onButtonSelected(event as object)

    details = event.getRoSGNode()
    content = details.content
    butIdx = event.getData()
    selectedItem = details.itemFocused
    if butIdx = 0
        handlePlay(content,selectedItem)
    elseif butIdx = 1
        showEpisodeScr(content,selectedItem)
    endif

endsub




sub handlePlay(content as object,selectedItem as integer)

    itemContent = content.getChild(selectedItem)
    if itemContent.mediaType = "Series"
        children = []
        for each season in itemContent.getChildren(-1,0)
            children.Append(cloneChildren(season))
        end for
        node = CreateObject("roSGNode","ContentNode")
        node.Update({children: children},true)
        showVideoScr(node,0,true)
    else
        showVideoScr(content,selectedItem)
    endif
    m.selectedItem[1] = selectedItem
endsub



