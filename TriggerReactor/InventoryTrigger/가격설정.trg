import org.bukkit.event.player.AsyncPlayerChatEvent

item = $helditem
book = item("BOOK",1)
buy_pane = item("LIME_STAINED_GLASS_PANE", 1)
setItemTitle(buy_pane, color("&a&l구매가격"))
sell_pane = item("PURPLE_STAINED_GLASS_PANE",1)
setItemTitle(sell_pane, color("&c&l판매가격"))

IF (trigger == "open")
    addLore(item, "&6--------------------")
    addLore(item, "&6 구매가격 : &d" + {$helditemname + ".itemBuy"})
    addLore(item, "&6 판매가격 : &d" + {$helditemname + ".itemSell"})
    addLore(item, "&6--------------------")
    inventory.setItem(3, item)

    setItemTitle(book, " ")
    inventory.setItem(5, book)

    inventory.setItem(0, buy_pane)
    inventory.setItem(1, buy_pane)
    inventory.setItem(2, buy_pane)
    inventory.setItem(4, buy_pane)
    inventory.setItem(6, buy_pane)
    inventory.setItem(7, buy_pane)
    inventory.setItem(8, buy_pane)
    inventory.setItem(9, buy_pane)
    inventory.setItem(13, buy_pane)
    inventory.setItem(14, buy_pane)
    inventory.setItem(16, buy_pane)
    inventory.setItem(17, buy_pane)
    inventory.setItem(18, buy_pane)
    inventory.setItem(22, buy_pane)
    inventory.setItem(23, buy_pane)
    inventory.setItem(25, buy_pane)
    inventory.setItem(27, buy_pane)
    inventory.setItem(31, buy_pane)
    inventory.setItem(32, buy_pane)
    inventory.setItem(34, buy_pane)
    inventory.setItem(35, buy_pane)
    inventory.setItem(36, buy_pane)
    inventory.setItem(37, buy_pane)
    inventory.setItem(39, buy_pane)
    inventory.setItem(40, buy_pane)
    inventory.setItem(41, buy_pane)
    inventory.setItem(43, buy_pane)
ENDIF

IF (trigger == "click")
    title = getItemTitle(inventory.getItem(slot))
    name = inventory.getItem(0).getI18NDisplayName()
    IF (slot == 5)
        IF (name == "Lime Stained Glass Pane")   
            SYNC  
                setItemTitle(book, " ")    
                inventory.setItem(5, book)

                inventory.setItem(0, sell_pane)
                inventory.setItem(1, sell_pane)
                inventory.setItem(2, sell_pane)
                inventory.setItem(4, sell_pane)
                inventory.setItem(6, sell_pane)
                inventory.setItem(7, sell_pane)
                inventory.setItem(8, sell_pane)
                inventory.setItem(9, sell_pane)
                inventory.setItem(13, sell_pane)
                inventory.setItem(14, sell_pane)
                inventory.setItem(16, sell_pane)
                inventory.setItem(17, sell_pane)
                inventory.setItem(18, sell_pane)
                inventory.setItem(22, sell_pane)
                inventory.setItem(23, sell_pane)
                inventory.setItem(25, sell_pane)
                inventory.setItem(27, sell_pane)
                inventory.setItem(31, sell_pane)
                inventory.setItem(32, sell_pane)
                inventory.setItem(34, sell_pane)
                inventory.setItem(35, sell_pane)
                inventory.setItem(36, sell_pane)
                inventory.setItem(37, sell_pane)
                inventory.setItem(39, sell_pane)
                inventory.setItem(40, sell_pane)
                inventory.setItem(41, sell_pane)
                inventory.setItem(43, sell_pane)
            ENDSYNC   
            
            unset = item("RED_WOOL", 1)
            setItemTitle(unset, color("&c&l설정되지 않음"))
            inventory.setItem(44, unset)   
        ELSEIF (name == "Purple Stained Glass Pane")
            SYNC  
                setItemTitle(book, " ")    
                inventory.setItem(5, book)
                
                inventory.setItem(0, buy_pane)
                inventory.setItem(1, buy_pane)
                inventory.setItem(2, buy_pane)
                inventory.setItem(4, buy_pane)
                inventory.setItem(6, buy_pane)
                inventory.setItem(7, buy_pane)
                inventory.setItem(8, buy_pane)
                inventory.setItem(9, buy_pane)
                inventory.setItem(13, buy_pane)
                inventory.setItem(14, buy_pane)
                inventory.setItem(16, buy_pane)
                inventory.setItem(17, buy_pane)
                inventory.setItem(18, buy_pane)
                inventory.setItem(22, buy_pane)
                inventory.setItem(23, buy_pane)
                inventory.setItem(25, buy_pane)
                inventory.setItem(27, buy_pane)
                inventory.setItem(31, buy_pane)
                inventory.setItem(32, buy_pane)
                inventory.setItem(34, buy_pane)
                inventory.setItem(35, buy_pane)
                inventory.setItem(36, buy_pane)
                inventory.setItem(37, buy_pane)
                inventory.setItem(39, buy_pane)
                inventory.setItem(40, buy_pane)
                inventory.setItem(41, buy_pane)
                inventory.setItem(43, buy_pane)
            ENDSYNC

            unset = item("RED_WOOL", 1)
            setItemTitle(unset, color("&c&l설정되지 않음"))
            inventory.setItem(44, unset)                
        ENDIF
    ENDIF

    IF !(slot == 10 || slot == 11 || slot == 12 || slot == 19 || slot == 20 || slot == 21 || slot == 28 || slot == 29 || slot == 30 || slot == 38 || slot == 15 || slot == 24 || slot == 26 || slot == 33 || slot == 42 || slot == 44)
        #STOP
    ELSEIF !(slot == 26 || slot == 44)
        IF (getItemTitle(inventory.getItem(5)) == " ")
            tmp_title = getItemTitle(inventory.getItem(5)).replaceAll(" ","") + title
            tmp_title_withoutnum = tmp_title.replaceAll("§","").replaceAll("f","").replaceAll("l","")
            setItemTitle(book, tmp_title_withoutnum)
            inventory.setItem(5, book)
        ELSE
            tmp_title = getItemTitle(inventory.getItem(5)) + title
            tmp_title_withoutnum = tmp_title.replaceAll("§","").replaceAll("f","").replaceAll("l","")
            setItemTitle(book, tmp_title_withoutnum)
            inventory.setItem(5, book)
        ENDIF
    ELSEIF (slot == 15 || slot == 24 || slot == 33 || slot == 42)
        tmp_title = getItemTitle(inventory.getItem(5)) + " " + title
        tmp_title_withoutnum = tmp_title.replaceAll("§","").replaceAll("f","").replaceAll("l","")
        setItemTitle(book, tmp_title_withoutnum)
        inventory.setItem(5, book)
    ELSEIF (slot == 26)
        setItemTitle(book, " ")
        inventory.setItem(5, book)
        
        unset = item("RED_WOOL", 1)
        setItemTitle(unset, color("&c&l설정되지 않음"))
        inventory.setItem(44, unset)

        clearLore(item)
        
        addLore(item, "&6--------------------")
        addLore(item, "&6 구매가격 : &d" + "설정되지 않음")
        addLore(item, "&6 판매가격 : &d" + "설정되지 않음")
        addLore(item, "&6--------------------")
        inventory.setItem(3, item)
    ELSEIF (slot == 44)
        IF (getItemTitle(inventory.getItem(5)) != " ")
            IF (name == "Lime Stained Glass Pane")
                clearLore(item)
                {$helditemname + ".itemBuy"} = getItemTitle(inventory.getItem(5))
                itemBuy = getItemTitle(inventory.getItem(5))

                set = item("LIME_WOOL",1)
                setItemTitle(set, color("&a&l설정됨"))
                inventory.setItem(44, set)
                {$helditemname + ".itemBuy_set_boolean"} = "true"

                addLore(item, "&6--------------------")
                addLore(item, "&6 구매가격 : &d" + itemBuy)
                addLore(item, "&6 판매가격 : &d" + {$helditemname + ".itemSell"})
                addLore(item, "&6--------------------")
                inventory.setItem(3, item)
            ELSEIF (name == "Purple Stained Glass Pane")
                clearLore(item)
                {$helditemname + ".itemSell"} = getItemTitle(inventory.getItem(5))
                itemSell = getItemTitle(inventory.getItem(5))

                set = item("LIME_WOOL",1)
                setItemTitle(set, color("&a&l설정됨"))
                inventory.setItem(44, set)
                {$helditemname + ".itemSell_set_boolean"} = "true"

                addLore(item, "&6--------------------")
                addLore(item, "&6 구매가격 : &d" + {$helditemname + ".itemBuy"})
                addLore(item, "&6 판매가격 : &d" + itemSell)
                addLore(item, "&6--------------------")
                inventory.setItem(3, item)
            ENDIF
        ELSE
            #STOP
        ENDIF
    ENDIF
    IF ({$helditemname + ".itemBuy_set_boolean"} == "true" && {$helditemname + ".itemSell_set_boolean"} == "true")
        #MESSAGE {"ojr_prefix"} + "&6구매가격 : &d" + {$helditemname + ".itemBuy"}
        #MESSAGE {"ojr_prefix"} + "&6판매가격 : &d" + {$helditemname + ".itemSell"}
        {$helditemname + ".itemCost_set"} = "true"
        #CLOSEGUI
    ENDIF
ENDIF

IF (trigger == "close")
    clearLore(item)

    {$helditemname + ".itemBuy_set_boolean"} = "false"
    {$helditemname + ".itemSell_set_boolean"} = "false"

    IF ({$helditemname + ".itemCost_set"} == "true")
        #CMDOP "상점 아이템 등록 " + {$playername + ".command_shopName"} + " " + {$playername + ".command_shopPage"} + " " + {$playername + ".command_shopIndex"}
    ENDIF
ENDIF
