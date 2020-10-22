import org.bukkit.Bukkit
import org.bukkit.ChatColor
import org.bukkit.scoreboard.Scoreboard
import org.bukkit.scoreboard.ScoreboardManager
import org.bukkit.scoreboard.Objective
import org.bukkit.scoreboard.DisplaySlot
import org.bukkit.entity.Player

#call "OJRServer_BasicVariables_JustforReload"
IF ({$playername + ".scoreboard.set"} == false || {$playername + ".scoreboard.set"} == null) // 스코어보드가 없거나 서버에 처음 접속하는 경우
    #BROADCAST {"ojr_prefix"} + "&e" + $playername + "&f님이 서버에 접속하셨습니다."
    
    // 초기변수설정
    {$playername + ".scoreboard.set"} = true
    {$playername + ".scoreboard.money_initial_withoutname"} = 100
    {$playername + ".scoreboard.job"} = "설정되지 않음"

    // 기본금액 단위설정
    initial_money = {$playername + ".scoreboard.money_initial_withoutname"}
    initial_pun = initial_money % 10
    initial_nyang = initial_money / 100
    initial_jun = initial_money % 100 - initial_pun
    {$playername + ".scoreboard.money_initial_withname"} = initial_nyang + "냥"
    
    board = Bukkit.getScoreboardManager().getNewScoreboard()
    obj = board.registerNewObjective("OJR","dummy",color("&a&l오지리서버"))
    obj.setDisplaySlot(DisplaySlot.SIDEBAR)

    blank1 = obj.getScore(" ")
    blank1.setScore(4)
    job = obj.getScore(color("&6&l 직업 : &d&l"+{$playername + ".scoreboard.job"}))
    job.setScore(3)
    blank2 = obj.getScore("  ")
    blank2.setScore(2)
    money = obj.getScore(color("&6&l 보유금액 : &d&l"+{$playername + ".scoreboard.money_initial_withname"}))
    money.setScore(1)
    blank3 = obj.getScore("   ")
    blank3.setScore(0)

    player.setScoreboard(board)

    {$playername + ".scoreboard.money_withname"} = {$playername + ".scoreboard.money_initial_withname"}
    {$playername + ".scoreboard.money_withoutname"} = {$playername + ".scoreboard.money_initial_withoutname"}
ELSE // 스코어보드가 이미 있는 경우
    
    board = Bukkit.getScoreboardManager().getNewScoreboard()
    obj = board.registerNewObjective("ojr","dummy",color("&a&l오지리서버"))
    obj.setDisplaySlot(DisplaySlot.SIDEBAR)

    blank1 = obj.getScore(" ")
    blank1.setScore(4)
    job = obj.getScore(color("&6&l 직업 : &d&l"+{$playername + ".scoreboard.job"}))
    job.setScore(3)
    blank2 = obj.getScore("  ")
    blank2.setScore(2)
    money = obj.getScore(color("&6&l 보유금액 : &d&l"+{$playername + ".scoreboard.money_withname"}))
    money.setScore(1)
    blank3 = obj.getScore("   ")
    blank3.setScore(0)

    player.setScoreboard(board)
    IF ({$playername + ".scoreboard.krname"} == null || {$playername + ".scoreboard.krname"} == "설정되지 않음")
        IF ({$playername + ".scoreboard.job"} == null || {$playername + ".scoreboard.job"} == "설정되지 않음")
            #BROADCAST {"ojr_prefix"} + "&e" + $playername + "&f님이 서버에 접속하셨습니다."
        ELSE
            #BROADCAST {"ojr_prefix"} + "&d[" + {$playername + ".scoreboard.job"} + "]&f<" + $playername + ">님이 서버에 접속하셨습니다."
        ENDIF
    ELSE
        IF ({$playername + ".scoreboard.job"} == null || {$playername + ".scoreboard.job"} == "설정되지 않음")
            #BROADCAST {"ojr_prefix"} + "&f<" + $playername + ">&7(" + {$playername + ".scoreboard.krname"} + ")&f님이 서버에 접속하셨습니다."
        ELSE
            #BROADCAST {"ojr_prefix"} + "&d[" + {$playername + ".scoreboard.job"} + "]&f<" + $playername + ">&7(" + {$playername + ".scoreboard.krname"} + ")&f님이 서버에 접속하셨습니다."
        ENDIF
    ENDIF
ENDIF
