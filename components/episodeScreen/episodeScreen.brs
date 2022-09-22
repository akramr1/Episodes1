


function init()

    m.Top.observeField("visible","onVisibilityChange")
    m.categoryList = m.Top.getNode("categoryList")
    m.categoryList.observeField("itemFocused","onCategoryItemFocused")

    m.itemList = m.Top.findNode("itemList")
    m.itemList.observeField("itemFocused", "onListItemFocused")

    m.itemList.observeField("itemSelected", "onListItemSelected")
    m.Top.observeField("content", "onContentChange")

endfunction

sub onListItemFocused(event as Object)

    
endsub