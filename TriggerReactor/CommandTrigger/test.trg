itemBuy = args[0]
itemSell = args[1]
IF !(itemBuy.contains("주"))
    #MESSAGE {"ojr_prefix"} + "&4허용되지 않는 단위가 포함되어 있습니다!"
    #MESSAGE "1"
    #STOP
ENDIF
IF !(itemBuy.contains("냥"))
    #MESSAGE {"ojr_prefix"} + "&4허용되지 않는 단위가 포함되어 있습니다!"
    #MESSAGE "2"
    #STOP
ENDIF
IF !(itemBuy.contains("전"))
    #MESSAGE {"ojr_prefix"} + "&4허용되지 않는 단위가 포함되어 있습니다!"
    #MESSAGE "3"
    #STOP
ENDIF
IF !(itemBuy.contains("푼"))
    #MESSAGE {"ojr_prefix"} + "&4허용되지 않는 단위가 포함되어 있습니다!"
    #MESSAGE "4"
    #STOP
ENDIF

IF !(itemSell.contains("주"))
    #MESSAGE {"ojr_prefix"} + "&4허용되지 않는 단위가 포함되어 있습니다!"
    #MESSAGE "5"
    #STOP
ENDIF
IF !(itemSell.contains("냥"))
    #MESSAGE {"ojr_prefix"} + "&4허용되지 않는 단위가 포함되어 있습니다!"
    #MESSAGE "6"
    #STOP
ENDIF
IF !(itemSell.contains("전"))
    #MESSAGE {"ojr_prefix"} + "&4허용되지 않는 단위가 포함되어 있습니다!"
    #MESSAGE "7"
    #STOP
ENDIF
IF !(itemSell.contains("푼"))
    #MESSAGE {"ojr_prefix"} + "&4허용되지 않는 단위가 포함되어 있습니다!"
    #MESSAGE "8"
    #STOP
ENDIF
