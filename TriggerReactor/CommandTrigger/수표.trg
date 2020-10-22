import java.lang.Integer

#call "OJRServer_SubtractMoney_BasicSyntax"

IF (args.length == 2)
    cost = args[0]
    num = Integer(args[1])

    IF ($isnumber:args[1])
        IF ({$playername + ".scoreboard.money_withoutname"} >= ({$playername + ".tosubtractmoney_withoutname"} * num))
            FOR i = 0:num
                #CMDOP "돈 빼기 " + $playername + " " + cost
                i = i + 1
            ENDFOR

            #CMDCON "give " +$playername + " paper{display:{Name:'[{\"text\":\"" + cost + "\",\"color\":\"light_purple\",\"bold\":true,\"italic\":false}]',Lore:['{\"text\":\"OJR수표\",\"color\":\"dark_gray\",\"bold\":true,\"italic\":false}','{\"text\":\"000000\",\"color\":\"dark_gray\",\"bold\":true,\"italic\":false,\"strikethrough\":true}']}} " + num
        ELSE
            #MESSAGE {"ojr_prefix"} + "&4&l돈이 부족합니다."
        ENDIF
    ELSE
        SYNC
            #MESSAGE "&c&l올바르지 않은 명령어입니다."
            #MESSAGE "&d&l/수표 <금액> <개수>"
        ENDSYNC
    ENDIF
ELSEIF (args.length == 3)
    cost_1 = args[0]
    cost_2 = args[1]
    num = Integer(args[2])

    cost = cost_1 + " " + cost_2

    IF ($isnumber:args[2])
        IF ({$playername + ".scoreboard.money_withoutname"} >= ({$playername + ".tosubtractmoney_withoutname"} * num))
            FOR i = 0:num
                #CMDOP "돈 빼기 " + $playername + " " + cost
                i = i + 1
            ENDFOR

            #CMDCON "give " +$playername + " paper{display:{Name:'[{\"text\":\"" + cost + "\",\"color\":\"light_purple\",\"bold\":true,\"italic\":false}]',Lore:['{\"text\":\"OJR수표\",\"color\":\"dark_gray\",\"bold\":true,\"italic\":false}','{\"text\":\"000000\",\"color\":\"dark_gray\",\"bold\":true,\"italic\":false,\"strikethrough\":true}']}} " + num
        ELSE
            #MESSAGE {"ojr_prefix"} + "&4&l돈이 부족합니다."
        ENDIF
    ELSE
        SYNC
            #MESSAGE "&c&l올바르지 않은 명령어입니다."
            #MESSAGE "&d&l/수표 <금액> <개수>"
        ENDSYNC
    ENDIF
ELSEIF (args.length == 4)
    cost_1 = args[0]
    cost_2 = args[1]
    cost_3 = args[2]
    num = Integer(args[3])

    cost = cost_1 + " " + cost_2 + " " + cost_3

    IF ($isnumber:args[3])
        IF ({$playername + ".scoreboard.money_withoutname"} >= ({$playername + ".tosubtractmoney_withoutname"} * num))
            FOR i = 0:num
                #CMDOP "돈 빼기 " + $playername + " " + cost
                i = i + 1
            ENDFOR

            #CMDCON "give " +$playername + " paper{display:{Name:'[{\"text\":\"" + cost + "\",\"color\":\"light_purple\",\"bold\":true,\"italic\":false}]',Lore:['{\"text\":\"OJR수표\",\"color\":\"dark_gray\",\"bold\":true,\"italic\":false}','{\"text\":\"000000\",\"color\":\"dark_gray\",\"bold\":true,\"italic\":false,\"strikethrough\":true}']}} " + num
        ELSE
            #MESSAGE {"ojr_prefix"} + "&4&l돈이 부족합니다."
        ENDIF
    ELSE
        SYNC
            #MESSAGE "&c&l올바르지 않은 명령어입니다."
            #MESSAGE "&d&l/수표 <금액> <개수>"
        ENDSYNC
    ENDIF
ELSEIF (args.length == 5)
    cost_1 = args[0]
    cost_2 = args[1]
    cost_3 = args[2]
    cost_4 = args[3]
    num = Integer(args[4])

    cost = cost_1 + " " + cost_2 + " " + cost_3 + " " + cost_4

    IF ($isnumber:args[4])
        IF ({$playername + ".scoreboard.money_withoutname"} >= ({$playername + ".tosubtractmoney_withoutname"} * num))
            FOR i = 0:num
                #CMDOP "돈 빼기 " + $playername + " " + cost
                i = i + 1
            ENDFOR

            #CMDCON "give " +$playername + " paper{display:{Name:'[{\"text\":\"" + cost + "\",\"color\":\"light_purple\",\"bold\":true,\"italic\":false}]',Lore:['{\"text\":\"OJR수표\",\"color\":\"dark_gray\",\"bold\":true,\"italic\":false}','{\"text\":\"000000\",\"color\":\"dark_gray\",\"bold\":true,\"italic\":false,\"strikethrough\":true}']}} " + num
        ELSE
            #MESSAGE {"ojr_prefix"} + "&4&l돈이 부족합니다."
        ENDIF
    ELSE
        SYNC
            #MESSAGE "&c&l올바르지 않은 명령어입니다."
            #MESSAGE "&d&l/수표 <금액> <개수>"
        ENDSYNC
    ENDIF
ELSE
    SYNC
        #MESSAGE "&c&l올바르지 않은 명령어입니다."
        #MESSAGE "&d&l/수표 <금액> <개수>"
    ENDSYNC
ENDIF
