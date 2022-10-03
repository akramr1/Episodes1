


sub showGridScr()
    m.gridScr = createObject("roSGNode", "gridScr1")
    m.gridScr.observeField("rowItemSelected", "onGridScrItemSelected")
    showScr(m.gridScr)
end sub



sub onGridScrItemSelected(event as object)
    grid = event.getRoSGNode()
    m.selectedIdx = event.getData()
    rowContent = grid.content.getChild(m.selectedIdx[0])
    m.selectedRow = m.selectedIdx[0]
    showDetailScr(rowContent, m.selectedIdx[1])
end sub