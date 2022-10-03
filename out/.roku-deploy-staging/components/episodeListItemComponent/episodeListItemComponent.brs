
sub init()
    m.poster = m.Top.findNode("poster")
    m.title = m.Top.findNode("title")
    m.description = m.Top.findNode("description")
    m.info = m.Top.findNode("info")

    m.title.font.size = 20
    m.description.font.size = 16
    m.info.font.size = 16
        
endsub



sub itemContentChanged()
    itemContent = m.Top.itemContem
    if itemCOntent<> invalid
        m.poster.uri = itemContent.hdposterUrl
        m.title.text = itemContent.title
        divider = " | "
        episode = "E" + itemContent.episodePosition
        time = formatTime(itemContent.length)
        date = itemContent.releaseDate
        season = itemContent.titleSeason
        m.info.text = episode + divider + date + divider + time + divider + season
        m.description.text = itemCOntent.description
    endif
endsub