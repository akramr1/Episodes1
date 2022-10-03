

sub main(args as object)


    mScreen = createObject("roSGScreen")
    m.Port = createObject("roMessagePort")
    mScreen.setMessagePort(m.Port)
    mScene=mScreen.createScene("entryScene")
    mScreen.show()

    while true
        msg=wait(0,m.Port)
        msgType=Type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        endif
    endwhile
endsub
