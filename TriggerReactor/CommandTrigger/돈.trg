// 오지리서버 돈 명령어
// /돈 확인 <플레이어> : <플레이어>의 소지금을 확인한다.
// /돈 더하기 <플레이어> <금액> : <플레이어>의 돈에 <금액>만큼 더한다.
// /돈 빼기 <플레이어> <금액> : <플레이어>의 돈에서 <금액>만큼 뺀다.
// /돈 몰수 <플레이어> : <플레이어>의 소지금을 0으로 만든다.
// /수표 <금액> <개수> : <금액>의 수표 <개수>개를 만든다.
import org.bukkit.Bukkit
import org.bukkit.ChatColor
import org.bukkit.scoreboard.Scoreboard
import org.bukkit.scoreboard.ScoreboardManager
import org.bukkit.scoreboard.Objective
import org.bukkit.scoreboard.DisplaySlot
import org.bukkit.entity.Player
import java.lang.Integer

board = Bukkit.getScoreboardManager().getNewScoreboard()
obj = board.registerNewObjective("OJR","dummy",color("&a&l오지리서버"))
obj.setDisplaySlot(DisplaySlot.SIDEBAR)

blank1 = obj.getScore(" ")
blank1.setScore(4)
blank2 = obj.getScore("  ")
blank2.setScore(2)
blank3 = obj.getScore("   ")
blank3.setScore(0)
IF (args.length == 2)
    IF (args[0] == "확인")
        IF (args[1] != null)
            playername = args[1]
            #MESSAGE {"ojr_prefix"} + "&e" + playername + "&f님의 소지금은 &d" + {playername + ".scoreboard.money_withname"} + "&f입니다."
        ELSEIF (args[1] == null)
            playername = $playername
            #MESSAGE {"ojr_prefix"} + "&e" + playername + "&f님의 소지금은 &d" + {playername + ".scoreboard.money_withname"} + "&f입니다."
        ENDIF
    ELSEIF (args[0] == "몰수")
        playername = args[1]
        SYNC
            #MESSAGE {"ojr_prefix"} + "&e" + playername + "&f님의 소지금은 &d" + {playername + ".scoreboard.money_withname"} + "&f이며,"
            #MESSAGE "&f        모두 몰수되었습니다."
        ENDSYNC
        #CMDOP "돈 빼기 " + playername + " " + {playername + ".scoreboard.money_withname"}
    ENDIF
ELSEIF (args.length >= 3)
    IF (args[0] == "더하기")
        playername = args[1]
        IF (args.length == 3)
            toaddmoney_withname_incommand_unit = args[2]
            IF (toaddmoney_withname_incommand_unit.contains("주"))
                toaddmoney_ju_withoutname_incommand = toaddmoney_withname_incommand_unit.replaceAll("주","")
                toaddmoney_ju = Integer(toaddmoney_ju_withoutname_incommand)
                toaddmoney_nyang = 0
                toaddmoney_jun = 0
                toaddmoney_pun = 0
            ELSEIF (toaddmoney_withname_incommand_unit.contains("냥"))
                toaddmoney_nyang_withoutname_incommand = toaddmoney_withname_incommand_unit.replaceAll("냥","")
                toaddmoney_nyang = Integer(toaddmoney_nyang_withoutname_incommand)
                toaddmoney_ju = 0
                toaddmoney_jun = 0
                toaddmoney_pun = 0
            ELSEIF (toaddmoney_withname_incommand_unit.contains("전"))
                toaddmoney_jun_withoutname_incommand = toaddmoney_withname_incommand_unit.replaceAll("전","")
                toaddmoney_jun = Integer(toaddmoney_jun_withoutname_incommand)
                toaddmoney_ju = 0
                toaddmoney_nyang = 0
                toaddmoney_pun = 0
            ELSEIF (toaddmoney_withname_incommand_unit.contains("푼"))
                toaddmoney_pun_withoutname_incommand = toaddmoney_withname_incommand_unit.replaceAll("푼","")
                toaddmoney_pun = Integer(toaddmoney_pun_withoutname_incommand)
                toaddmoney_ju = 0
                toaddmoney_nyang = 0
                toaddmoney_jun = 0
            ENDIF

            toaddmoney_withoutname = toaddmoney_ju * 10000 + toaddmoney_nyang * 100 + toaddmoney_jun * 10 + toaddmoney_pun
        ELSEIF (args.length == 4)
            toaddmoney_withname_incommand_args1 = args[2]
            toaddmoney_withname_incommand_args2 = args[3]

            IF (toaddmoney_withname_incommand_args1.contains("주") && toaddmoney_withname_incommand_args2.contains("냥"))
                toaddmoney_ju_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("주","")
                toaddmoney_ju = Integer(toaddmoney_ju_withoutname_incommand)
                toaddmoney_nyang_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("냥","")
                toaddmoney_nyang = Integer(toaddmoney_nyang_withoutname_incommand)
                toaddmoney_jun = 0
                toaddmoney_pun = 0
            ELSEIF (toaddmoney_withname_incommand_args1.contains("주") && toaddmoney_withname_incommand_args2.contains("전"))
                toaddmoney_ju_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("주","")
                toaddmoney_ju = Integer(toaddmoney_ju_withoutname_incommand)
                toaddmoney_jun_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("전","")
                toaddmoney_jun = Integer(toaddmoney_jun_withoutname_incommand)
                toaddmoney_nyang = 0
                toaddmoney_pun = 0
            ELSEIF (toaddmoney_withname_incommand_args1.contains("주") && toaddmoney_withname_incommand_args2.contains("푼"))
                toaddmoney_ju_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("주","")
                toaddmoney_ju = Integer(toaddmoney_ju_withoutname_incommand)
                toaddmoney_pun_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("푼","")
                toaddmoney_pun = Integer(toaddmoney_pun_withoutname_incommand)
                toaddmoney_nyang = 0
                toaddmoney_jun = 0
            ELSEIF (toaddmoney_withname_incommand_args1.contains("냥") && toaddmoney_withname_incommand_args2.contains("전"))
                toaddmoney_nyang_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("냥","")
                toaddmoney_nyang = Integer(toaddmoney_nyang_withoutname_incommand)
                toaddmoney_jun_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("전","")
                toaddmoney_jun = Integer(toaddmoney_jun_withoutname_incommand)
                toaddmoney_ju = 0
                toaddmoney_pun = 0
            ELSEIF (toaddmoney_withname_incommand_args1.contains("냥") && toaddmoney_withname_incommand_args2.contains("푼"))
                toaddmoney_nyang_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("냥","")
                toaddmoney_nyang = Integer(toaddmoney_nyang_withoutname_incommand)
                toaddmoney_pun_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("푼","")
                toaddmoney_pun = Integer(toaddmoney_pun_withoutname_incommand)
                toaddmoney_ju = 0
                toaddmoney_jun = 0
            ELSEIF (toaddmoney_withname_incommand_args1.contains("전") && toaddmoney_withname_incommand_args2.contains("푼"))
                toaddmoney_jun_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("전","")
                toaddmoney_jun = Integer(toaddmoney_jun_withoutname_incommand)
                toaddmoney_pun_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("푼","")
                toaddmoney_pun = Integer(toaddmoney_pun_withoutname_incommand)
                toaddmoney_ju = 0
                toaddmoney_nyang = 0
            ENDIF

            toaddmoney_withoutname = toaddmoney_ju * 10000 + toaddmoney_nyang * 100 + toaddmoney_jun * 10 + toaddmoney_pun
        ELSEIF (args.length == 5)
            toaddmoney_withname_incommand_args1 = args[2]
            toaddmoney_withname_incommand_args2 = args[3]
            toaddmoney_withname_incommand_args3 = args[4]

            IF (toaddmoney_withname_incommand_args1.contains("주") && toaddmoney_withname_incommand_args2.contains("냥") && toaddmoney_withname_incommand_args3.contains("전"))
                toaddmoney_ju_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("주","")
                toaddmoney_ju = Integer(toaddmoney_ju_withoutname_incommand)
                toaddmoney_nyang_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("냥","")
                toaddmoney_nyang = Integer(toaddmoney_nyang_withoutname_incommand)
                toaddmoney_jun_withoutname_incommand = toaddmoney_withname_incommand_args3.replaceAll("전","")
                toaddmoney_jun = Integer(toaddmoney_jun_withoutname_incommand)
                toaddmoney_pun = 0
            ELSEIF (toaddmoney_withname_incommand_args1.contains("주") && toaddmoney_withname_incommand_args2.contains("냥") && toaddmoney_withname_incommand_args3.contains("푼"))
                toaddmoney_ju_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("주","")
                toaddmoney_ju = Integer(toaddmoney_ju_withoutname_incommand)
                toaddmoney_nyang_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("냥","")
                toaddmoney_nyang = Integer(toaddmoney_nyang_withoutname_incommand)
                toaddmoney_pun_withoutname_incommand = toaddmoney_withname_incommand_args3.replaceAll("푼","")
                toaddmoney_pun = Integer(toaddmoney_pun_withoutname_incommand)
                toaddmoney_jun = 0
            ELSEIF (toaddmoney_withname_incommand_args1.contains("주") && toaddmoney_withname_incommand_args2.contains("전") && toaddmoney_withname_incommand_args3.contains("푼"))
                toaddmoney_ju_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("주","")
                toaddmoney_ju = Integer(toaddmoney_ju_withoutname_incommand)
                toaddmoney_jun_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("전","")
                toaddmoney_jun = Integer(toaddmoney_jun_withoutname_incommand)
                toaddmoney_pun_withoutname_incommand = toaddmoney_withname_incommand_args3.replaceAll("푼","")
                toaddmoney_pun = Integer(toaddmoney_pun_withoutname_incommand)
                toaddmoney_nyang = 0
            ELSEIF (toaddmoney_withname_incommand_args1.contains("냥") && toaddmoney_withname_incommand_args2.contains("전") && toaddmoney_withname_incommand_args3.contains("푼"))
                toaddmoney_nyang_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("냥","")
                toaddmoney_nyang = Integer(toaddmoney_nyang_withoutname_incommand)
                toaddmoney_jun_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("전","")
                toaddmoney_jun = Integer(toaddmoney_jun_withoutname_incommand)
                toaddmoney_pun_withoutname_incommand = toaddmoney_withname_incommand_args3.replaceAll("푼","")
                toaddmoney_pun = Integer(toaddmoney_pun_withoutname_incommand)
                toaddmoney_ju = 0
            ENDIF
            
            toaddmoney_withoutname = toaddmoney_ju * 10000 + toaddmoney_nyang * 100 + toaddmoney_jun * 10 + toaddmoney_pun
        ELSEIF (args.length == 6)
            toaddmoney_ju_withname_incommand = args[2]
            toaddmoney_nyang_withname_incommand = args[3]
            toaddmoney_jun_withname_incommand = args[4]
            toaddmoney_pun_withname_incommand = args[5]

            toaddmoney_ju_withoutname_incommand = toaddmoney_ju_withname_incommand.replaceAll("주","")
            toaddmoney_ju = Integer(toaddmoney_ju_withoutname_incommand)
            toaddmoney_nyang_withoutname_incommand = toaddmoney_nyang_withname_incommand.replaceAll("냥","")
            toaddmoney_nyang = Integer(toaddmoney_nyang_withoutname_incommand)
            toaddmoney_jun_withoutname_incommand = toaddmoney_jun_withname_incommand.replaceAll("전","")
            toaddmoney_jun = Integer(toaddmoney_jun_withoutname_incommand)
            toaddmoney_pun_withoutname_incommand = toaddmoney_pun_withname_incommand.replaceAll("푼","")
            toaddmoney_pun = Integer(toaddmoney_pun_withoutname_incommand)

            toaddmoney_withoutname = toaddmoney_ju * 10000 + toaddmoney_nyang * 100 + toaddmoney_jun * 10 + toaddmoney_pun
        ENDIF
        
        {playername + ".scoreboard.money_withoutname"} = {playername + ".scoreboard.money_withoutname"} + toaddmoney_withoutname

        money_withoutname_total = Integer({playername + ".scoreboard.money_withoutname"})
        money_withoutname_ju = money_withoutname_total / 10000
        money_withoutname_nyang = (money_withoutname_total % 10000) / 100
        money_withoutname_jun = ((money_withoutname_total % 10000) % 100) / 10
        money_withoutname_pun = money_withoutname_total - (money_withoutname_ju * 10000 + money_withoutname_nyang * 100 + money_withoutname_jun * 10)

        {playername + ".scoreboard.money_withname_ju"} = money_withoutname_ju + "주 "
        {playername + ".scoreboard.money_withname_nyang"} = money_withoutname_nyang + "냥 "
        {playername + ".scoreboard.money_withname_jun"} = money_withoutname_jun + "전 "
        {playername + ".scoreboard.money_withname_pun"} = money_withoutname_pun + "푼"

        IF (money_withoutname_ju == 0)
            {playername + ".scoreboard.money_withname_ju"} = ""
        ENDIF
        IF (money_withoutname_nyang == 0)
            {playername + ".scoreboard.money_withname_nyang"} = ""
        ENDIF
        IF (money_withoutname_jun == 0)
            {playername + ".scoreboard.money_withname_jun"} = ""
        ENDIF
        IF (money_withoutname_pun == 0)
            {playername + ".scoreboard.money_withname_pun"} = ""
        ENDIF

        {playername + ".scoreboard.money_withname"} = {playername + ".scoreboard.money_withname_ju"} + {playername + ".scoreboard.money_withname_nyang"} + {playername + ".scoreboard.money_withname_jun"} + {playername + ".scoreboard.money_withname_pun"}

        job = obj.getScore(color("&6&l 직업 : &d&l"+{playername + ".scoreboard.job"}))
        job.setScore(3)
        money = obj.getScore(color("&6&l 보유금액 : &d&l"+{playername + ".scoreboard.money_withname"}))
        money.setScore(1)
        player(playername).setScoreboard(board)

    ELSEIF (args[0] == "빼기")
        playername = args[1]
        IF (args.length == 6)
            toaddmoney_ju_withname_incommand = args[2]
            toaddmoney_nyang_withname_incommand = args[3]
            toaddmoney_jun_withname_incommand = args[4]
            toaddmoney_pun_withname_incommand = args[5]

            toaddmoney_ju_withoutname_incommand = toaddmoney_ju_withname_incommand.replaceAll("주","")
            toaddmoney_ju = Integer(toaddmoney_ju_withoutname_incommand)
            toaddmoney_nyang_withoutname_incommand = toaddmoney_nyang_withname_incommand.replaceAll("냥","")
            toaddmoney_nyang = Integer(toaddmoney_nyang_withoutname_incommand)
            toaddmoney_jun_withoutname_incommand = toaddmoney_jun_withname_incommand.replaceAll("전","")
            toaddmoney_jun = Integer(toaddmoney_jun_withoutname_incommand)
            toaddmoney_pun_withoutname_incommand = toaddmoney_pun_withname_incommand.replaceAll("푼","")
            toaddmoney_pun = Integer(toaddmoney_pun_withoutname_incommand)

            toaddmoney_withoutname = toaddmoney_ju * 10000 + toaddmoney_nyang * 100 + toaddmoney_jun * 10 + toaddmoney_pun
        ELSEIF (args.length == 5)
            toaddmoney_withname_incommand_args1 = args[2]
            toaddmoney_withname_incommand_args2 = args[3]
            toaddmoney_withname_incommand_args3 = args[4]

            IF (toaddmoney_withname_incommand_args1.contains("주") && toaddmoney_withname_incommand_args2.contains("냥") && toaddmoney_withname_incommand_args3.contains("전"))
                toaddmoney_ju_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("주","")
                toaddmoney_ju = Integer(toaddmoney_ju_withoutname_incommand)
                toaddmoney_nyang_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("냥","")
                toaddmoney_nyang = Integer(toaddmoney_nyang_withoutname_incommand)
                toaddmoney_jun_withoutname_incommand = toaddmoney_withname_incommand_args3.replaceAll("전","")
                toaddmoney_jun = Integer(toaddmoney_jun_withoutname_incommand)
                toaddmoney_pun = 0
            ELSEIF (toaddmoney_withname_incommand_args1.contains("주") && toaddmoney_withname_incommand_args2.contains("냥") && toaddmoney_withname_incommand_args3.contains("푼"))
                toaddmoney_ju_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("주","")
                toaddmoney_ju = Integer(toaddmoney_ju_withoutname_incommand)
                toaddmoney_nyang_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("냥","")
                toaddmoney_nyang = Integer(toaddmoney_nyang_withoutname_incommand)
                toaddmoney_pun_withoutname_incommand = toaddmoney_withname_incommand_args3.replaceAll("푼","")
                toaddmoney_pun = Integer(toaddmoney_pun_withoutname_incommand)
                toaddmoney_jun = 0
            ELSEIF (toaddmoney_withname_incommand_args1.contains("주") && toaddmoney_withname_incommand_args2.contains("전") && toaddmoney_withname_incommand_args3.contains("푼"))
                toaddmoney_ju_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("주","")
                toaddmoney_ju = Integer(toaddmoney_ju_withoutname_incommand)
                toaddmoney_jun_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("전","")
                toaddmoney_jun = Integer(toaddmoney_jun_withoutname_incommand)
                toaddmoney_pun_withoutname_incommand = toaddmoney_withname_incommand_args3.replaceAll("푼","")
                toaddmoney_pun = Integer(toaddmoney_pun_withoutname_incommand)
                toaddmoney_nyang = 0
            ELSEIF (toaddmoney_withname_incommand_args1.contains("냥") && toaddmoney_withname_incommand_args2.contains("전") && toaddmoney_withname_incommand_args3.contains("푼"))
                toaddmoney_nyang_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("냥","")
                toaddmoney_nyang = Integer(toaddmoney_nyang_withoutname_incommand)
                toaddmoney_jun_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("전","")
                toaddmoney_jun = Integer(toaddmoney_jun_withoutname_incommand)
                toaddmoney_pun_withoutname_incommand = toaddmoney_withname_incommand_args3.replaceAll("푼","")
                toaddmoney_pun = Integer(toaddmoney_pun_withoutname_incommand)
                toaddmoney_ju = 0
            ENDIF
            
            toaddmoney_withoutname = toaddmoney_ju * 10000 + toaddmoney_nyang * 100 + toaddmoney_jun * 10 + toaddmoney_pun
        ELSEIF (args.length == 4)
            toaddmoney_withname_incommand_args1 = args[2]
            toaddmoney_withname_incommand_args2 = args[3]

            IF (toaddmoney_withname_incommand_args1.contains("주") && toaddmoney_withname_incommand_args2.contains("냥"))
                toaddmoney_ju_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("주","")
                toaddmoney_ju = Integer(toaddmoney_ju_withoutname_incommand)
                toaddmoney_nyang_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("냥","")
                toaddmoney_nyang = Integer(toaddmoney_nyang_withoutname_incommand)
                toaddmoney_jun = 0
                toaddmoney_pun = 0
            ELSEIF (toaddmoney_withname_incommand_args1.contains("주") && toaddmoney_withname_incommand_args2.contains("전"))
                toaddmoney_ju_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("주","")
                toaddmoney_ju = Integer(toaddmoney_ju_withoutname_incommand)
                toaddmoney_jun_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("전","")
                toaddmoney_jun = Integer(toaddmoney_jun_withoutname_incommand)
                toaddmoney_nyang = 0
                toaddmoney_pun = 0
            ELSEIF (toaddmoney_withname_incommand_args1.contains("주") && toaddmoney_withname_incommand_args2.contains("푼"))
                toaddmoney_ju_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("주","")
                toaddmoney_ju = Integer(toaddmoney_ju_withoutname_incommand)
                toaddmoney_pun_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("푼","")
                toaddmoney_pun = Integer(toaddmoney_pun_withoutname_incommand)
                toaddmoney_nyang = 0
                toaddmoney_jun = 0
            ELSEIF (toaddmoney_withname_incommand_args1.contains("냥") && toaddmoney_withname_incommand_args2.contains("전"))
                toaddmoney_nyang_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("냥","")
                toaddmoney_nyang = Integer(toaddmoney_nyang_withoutname_incommand)
                toaddmoney_jun_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("전","")
                toaddmoney_jun = Integer(toaddmoney_jun_withoutname_incommand)
                toaddmoney_ju = 0
                toaddmoney_pun = 0
            ELSEIF (toaddmoney_withname_incommand_args1.contains("냥") && toaddmoney_withname_incommand_args2.contains("푼"))
                toaddmoney_nyang_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("냥","")
                toaddmoney_nyang = Integer(toaddmoney_nyang_withoutname_incommand)
                toaddmoney_pun_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("푼","")
                toaddmoney_pun = Integer(toaddmoney_pun_withoutname_incommand)
                toaddmoney_ju = 0
                toaddmoney_jun = 0
            ELSEIF (toaddmoney_withname_incommand_args1.contains("전") && toaddmoney_withname_incommand_args2.contains("푼"))
                toaddmoney_jun_withoutname_incommand = toaddmoney_withname_incommand_args1.replaceAll("전","")
                toaddmoney_jun = Integer(toaddmoney_jun_withoutname_incommand)
                toaddmoney_pun_withoutname_incommand = toaddmoney_withname_incommand_args2.replaceAll("푼","")
                toaddmoney_pun = Integer(toaddmoney_pun_withoutname_incommand)
                toaddmoney_ju = 0
                toaddmoney_nyang = 0
            ENDIF

            toaddmoney_withoutname = toaddmoney_ju * 10000 + toaddmoney_nyang * 100 + toaddmoney_jun * 10 + toaddmoney_pun
        ELSEIF (args.length == 3)
            toaddmoney_withname_incommand_unit = args[2]
            IF (toaddmoney_withname_incommand_unit.contains("주"))
                toaddmoney_ju_withoutname_incommand = toaddmoney_withname_incommand_unit.replaceAll("주","")
                toaddmoney_ju = Integer(toaddmoney_ju_withoutname_incommand)
                toaddmoney_nyang = 0
                toaddmoney_jun = 0
                toaddmoney_pun = 0
            ELSEIF (toaddmoney_withname_incommand_unit.contains("냥"))
                toaddmoney_nyang_withoutname_incommand = toaddmoney_withname_incommand_unit.replaceAll("냥","")
                toaddmoney_nyang = Integer(toaddmoney_nyang_withoutname_incommand)
                toaddmoney_ju = 0
                toaddmoney_jun = 0
                toaddmoney_pun = 0
            ELSEIF (toaddmoney_withname_incommand_unit.contains("전"))
                toaddmoney_jun_withoutname_incommand = toaddmoney_withname_incommand_unit.replaceAll("전","")
                toaddmoney_jun = Integer(toaddmoney_jun_withoutname_incommand)
                toaddmoney_ju = 0
                toaddmoney_nyang = 0
                toaddmoney_pun = 0
            ELSEIF (toaddmoney_withname_incommand_unit.contains("푼"))
                toaddmoney_pun_withoutname_incommand = toaddmoney_withname_incommand_unit.replaceAll("푼","")
                toaddmoney_pun = Integer(toaddmoney_pun_withoutname_incommand)
                toaddmoney_ju = 0
                toaddmoney_nyang = 0
                toaddmoney_jun = 0
            ENDIF

            toaddmoney_withoutname = toaddmoney_ju * 10000 + toaddmoney_nyang * 100 + toaddmoney_jun * 10 + toaddmoney_pun
        ENDIF
        
        {playername + ".scoreboard.money_withoutname"} = {playername + ".scoreboard.money_withoutname"} - toaddmoney_withoutname
        
        money_withoutname_total = Integer({playername + ".scoreboard.money_withoutname"})
        money_withoutname_ju = money_withoutname_total / 10000
        money_withoutname_nyang = (money_withoutname_total % 10000) / 100
        money_withoutname_jun = ((money_withoutname_total % 10000) % 100) / 10
        money_withoutname_pun = money_withoutname_total - (money_withoutname_ju * 10000 + money_withoutname_nyang * 100 + money_withoutname_jun * 10)

        IF (money_withoutname_ju < 0)
            money_withoutname_ju = 0
        ENDIF
        IF (money_withoutname_nyang < 0)
            money_withoutname_nyang = 0
        ENDIF
        IF (money_withoutname_jun < 0)
            money_withoutname_jun = 0
        ENDIF
        IF (money_withoutname_pun < 0)
            money_withoutname_pun = 0
        ENDIF

        {playername + ".scoreboard.money_withname_ju"} = money_withoutname_ju + "주 "
        {playername + ".scoreboard.money_withname_nyang"} = money_withoutname_nyang + "냥 "
        {playername + ".scoreboard.money_withname_jun"} = money_withoutname_jun + "전 "
        {playername + ".scoreboard.money_withname_pun"} = money_withoutname_pun + "푼"

        IF (money_withoutname_ju == 0)
            {playername + ".scoreboard.money_withname_ju"} = ""
        ENDIF
        IF (money_withoutname_nyang == 0)
            {playername + ".scoreboard.money_withname_nyang"} = ""
        ENDIF
        IF (money_withoutname_jun == 0)
            {playername + ".scoreboard.money_withname_jun"} = ""
        ENDIF
        IF (money_withoutname_pun == 0)
            {playername + ".scoreboard.money_withname_pun"} = ""
        ENDIF
        IF (money_withoutname_ju == 0 && money_withoutname_nyang == 0 && money_withoutname_jun == 0 && money_withoutname_pun == 0)
            {playername + ".scoreboard.money_withname"} = "0푼"
            {playername + ".scoreboard.money_withoutname"} = 0
        ELSE
            {playername + ".scoreboard.money_withname"} = {playername + ".scoreboard.money_withname_ju"} + {playername + ".scoreboard.money_withname_nyang"} + {playername + ".scoreboard.money_withname_jun"} + {playername + ".scoreboard.money_withname_pun"}
        ENDIF

        job = obj.getScore(color("&6&l 직업 : &d&l"+{playername + ".scoreboard.job"}))
        job.setScore(3)
        money = obj.getScore(color("&6&l 보유금액 : &d&l"+{playername + ".scoreboard.money_withname"}))
        money.setScore(1)
        player(playername).setScoreboard(board)
        
    ENDIF
ENDIF
