


sub showVideoScr(rowContent as object,selectedItem as integer, isSeries=false as boolean)

    m.isSeries = isSeries
    m.videoPlayer = createObject("roSGNode","video")
    if selectedItem <> 0
        childClone = cloneChildren(rowContent,selectedItem) 
        
    endif  


endsub