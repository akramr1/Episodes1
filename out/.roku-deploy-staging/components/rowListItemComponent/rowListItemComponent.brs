
sub onContentSet()
    content = m.Top.itemContent
    if content <> invalid
        m.Top.findNode("poster").uri = content.hdposterUrl
    endif
endsub
