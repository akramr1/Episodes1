



sub showEpisodeScr(content as object, selectedItem as integer)
    episodeScr = CreateObject("roSGNode","episodeScreen")
    episodeScr.observeField("itemSelected","onEpisodeSelected")
    episodeScr.content = content.getChild(selectedItem)
    showScr(episodeScr)
endsub

sub onEpisodeSelected(event as object)
    episodeScr = event.getRoSGNode()
    selectedIdx = event.getData()
    rowContent = episodeScr.content.getChild(selectedIdx[0])
    showDetailScr(rowContent,selectedIdx[1])

endsub