


sub showGridScr()
    m.gridScr = createObject("roSGNode","gridScr")
    m.gridScr.observeField("rowItemSelected","onGridScrItemSelected")
    showScr(m.gridScr)
endsub



sub onGridScrItemSelected(event as object)
    grid = event.getRoSGNode()
    m.selectedIdx=event.getData()
    rowContent = grid.content.getChild(m.selectedIdx[0])
    m.selectedRow = m.selectedIdx[0]
    showDetailScr(rowContent,m.selectedIdx[1])
endsub