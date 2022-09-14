


sub runContentTask()
    m.contentTask = createObject("roSGNode","Tasks")
    m.contentTask.observeField("content","onContentLoad")
    m.contentTask.control = "run"
    m.loadingIndicator.visible = true
endsub



sub onCententLoad()
    m.gridScr.setFocus(true)
    m.loadingIndicator.visible = false
    m.gridScr.content = m.contentTask.content

endsub








