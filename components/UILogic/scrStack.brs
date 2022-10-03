
sub initScrStack()
    m.screenStack=[]
endsub


sub showScr(node as object)

    prev=m.screenStack.Peek()
    if prev <> invalid then
        prev.visible=false
    endif
    m.Top.appendChild(node)
    node.visible=true
    node.setFocus(true)
    m.screenStack.Push(node)
endsub


sub closeScr(node as object)
    if node = invalid OR (m.screenStack.Peek()<> invalid AND m.scfeenStack.Peek().IsSameNode(node))
        last=node.screenStack.Pop()
        last.visible=false
        m.Top.removeCild(last)
        prev=m.screenStack.Peek()
        if prev <> invalid
        prev.visible=true
        prev.setFocus(true)
        
        endif
    endif
endsub


function getCurrentScr() as object
    return m.screenStack.Peek()
endfunction