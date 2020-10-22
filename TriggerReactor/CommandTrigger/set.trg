import org.bukkit.Bukkit
import org.bukkit.ChatColor
import org.bukkit.scoreboard.Scoreboard
import org.bukkit.scoreboard.ScoreboardManager
import org.bukkit.scoreboard.Objective
import org.bukkit.scoreboard.DisplaySlot
import org.bukkit.entity.Player
SYNC
    board = Bukkit.getScoreboardManager().getNewScoreboard()
    obj = board.registerNewObjective("OJL","dummy",color("&a&l오지리서버"))
    obj.setDisplaySlot(DisplaySlot.SIDEBAR)

    blank1 = obj.getScore(" ")
    blank1.setScore(4)

    blank2 = obj.getScore("  ")
    blank2.setScore(2)
    blank3 = obj.getScore("   ")
    blank3.setScore(0)


    IF (args.length == 0)
        #MESSAGE {"ojl_prefix"} + "&d/set job <플레이어> <직업이름>"
        #MESSAGE "      &6<플레이어>의 직업을 <직업이름>으로 설정합니다."
        #MESSAGE {"ojl_prefix"} + "&d/set name <플레이어> <이름>"
        #MESSAGE "      &6<플레이어>의 이름을 <이름>으로 설정합니다."
    ELSEIF (args.length == 3)
        IF (args[0] == "job")
            playername = args[1]
            {playername+".scoreboard.job"} = args[2]
            job = obj.getScore(color("&6&l 직업 : &d&l"+{playername + ".scoreboard.job"}))
            job.setScore(3)   
            money = obj.getScore(color("&6&l 보유금액 : &d&l"+{playername + ".scoreboard.money_withname"}))
            money.setScore(1)         
            player(playername).setScoreboard(board)
            
            #CMDOP "tab player " + playername + " abovename " + "&d[" + {playername + ".scoreboard.job"} + "]&r"
        ELSEIF (args[0] == "name")
            playername = args[1]
            {playername + ".scoreboard.krname"} = args[2]
            #CMDOP "tab player " + playername + " customtabname " + playername + "&7(" + {playername + ".scoreboard.krname"} + ")&r"
            #CMDOP "tab player " + playername + " belowname " + "&7" + {playername + ".scoreboard.krname"} + "&r"
        ELSE
            #MESSAGE {"ojl_prefix"} + "&4올바르지 않은 명령어입니다."    
        ENDIF
    ELSEIF (args.length == 2)
        IF (args[0] == "job")
            playername = $playername
            {playername+".scoreboard.job"} = args[1]
            job = obj.getScore(color("&6&l 직업 : &d&l"+{playername + ".scoreboard.job"}))
            job.setScore(3)   
            money = obj.getScore(color("&6&l 보유금액 : &d&l"+{playername + ".scoreboard.money_withname"}))
            money.setScore(1)            
            player(playername).setScoreboard(board)
            
            #CMDOP "tab player " + playername + " abovename " + "&d[" + {playername + ".scoreboard.job"} + "]&r"
        ELSEIF (args[0] == "name")
            playername = $playername
            {playername + ".scoreboard.krname"} = args[1]
            #CMDOP "tab player " + playername + " customtabname " + playername + "&7(" + {playername + ".scoreboard.krname"} + ")&r"
            #CMDOP "tab player " + playername + " belowname " + "&7" + {playername + ".scoreboard.krname"} + "&r"
        ELSE
            #MESSAGE {"ojl_prefix"} + "&4올바르지 않은 명령어입니다."
        ENDIF
    ENDIF
ENDSYNC
