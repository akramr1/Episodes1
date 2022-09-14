

function contentListToNode(contentList as object,nodeType="ContentNode" as string)as object
    res=CreateObject("roSGNode",nodeType)
    if res <> invalid
        for each iAA in contentList
            i=CreateObject("roSGNode", nodeType)
            i.setFields(iAA)
            res.appendChild(i)
        endfor
        
    endif
    return res
    
endfunction


'======================================================
' formats video length from seconds to mm:ss

function formatTime(t as integer) as string
    mm=(t/60).toStr()
    tmp=t MOD 60
    ss=""
    if tmp<10 then 
        ss="0" 
    endif
    ss+=tmp.toStr()
    
    return mm + ":" + ss
    
endfunction


'======================================================

function cloneChildren(node as object,startItem=0 as integer)
    childCount=node.getChildCount()
    children=node.getChildren(childCount-startItem,startItem)
    clonedChildren=[]
    for each child in children
        clonedChildren.Push(child.clone(false))    
    end for
    return clonedChildren
endfunction



