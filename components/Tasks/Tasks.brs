
sub init()
    
m.Top.functionName = "getContent"    
endsub

sub getContent()

    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    xfer.SetURL("https://jonathanbduval.com/roku/feeds/roku-developers-feed-v1.json")
    rsp = xfer.getToString()
    rootChildren = []
    rows = {}

    json = parseJson(rsp)
    if json <> invalid
        for each category in json
            val = json.lookUp(category)
            if type(val) = "roArray"
                row = {}
                row.title = category
                row.children = []
                for each item in val
                    itemData = getItemData(item)
                    seasons = getSeasonData(item.seasons)
                    itemData.mediaType = category
                    if seasons <> invalid and seasons.count() > 0
                    itemData.children = seasons
                    endif
                    row.children.Push(itemData)
                endfor
                rootChildren.Push(row)
            endif
        endfor
        contentNode = CreateObject("roSGNode","contentNode")
        contentNode.Update({children: rootChildren},true)
        m.Top.content = contentNode
    endif
endsub




function getItemData(video as Object) as Object
    item = {}
    if video.longDescription <> invalid
        item.description = video.longDescription
    else 
        item.description = video.shortDescription
    endif
    item.hdPoserURL = video.thumbnail
    item.title = video.title
    item.releaseDate = video.releaseDate
    item.id = video.id
    if video.episodeNumber <> invalid
        item.episodePosition = video.episodeNumber.toStr()
    endif
    if video.content <> invalid
        item.length = video.content.duration
        item.url = video.content.videos[0].url
        item.streamFormat = video.content.videos[0].videoType        
    endif
    return item

endfunction




function getSeasonData(seasons as Object) as Object

    seasonsArray = []
    if seasons <> invalid
        episodeCounter = 0
        for each season in seasons
            if season.episodes <> invalid
                episodes = []
                for each episode in season.episodes
                    episodeData = getItemData(episode)
                    episodeData.titleSeason = season.title
                    episodeData.numEpisodes = episodeCounter
                    episodeData.mediaType = "episode" 
                    episodes.Push(episodeData)
                    episodeCounter++
                endfor        
            seasonData = getItemData(season)
            seasonData.children = episodes
            season.contentType = "section"
            seasonsArray.Push(seasonData)
            endif
        endfor
    endif
    return seasonsArray

endfunction