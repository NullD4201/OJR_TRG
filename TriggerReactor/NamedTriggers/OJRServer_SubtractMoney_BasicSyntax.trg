import org.bukkit.Bukkit
import org.bukkit.ChatColor
import org.bukkit.scoreboard.Scoreboard
import org.bukkit.scoreboard.ScoreboardManager
import org.bukkit.scoreboard.Objective
import org.bukkit.scoreboard.DisplaySlot
import org.bukkit.entity.Player
import java.lang.Integer

IF (args.length == 5)
    tosubtractmoney_ju_withname_incommand = args[0]
    tosubtractmoney_nyang_withname_incommand = args[1]
    tosubtractmoney_jun_withname_incommand = args[2]
    tosubtractmoney_pun_withname_incommand = args[3]

    tosubtractmoney_ju_withoutname_incommand = tosubtractmoney_ju_withname_incommand.replaceAll("주","")
    tosubtractmoney_ju = Integer(tosubtractmoney_ju_withoutname_incommand)
    tosubtractmoney_nyang_withoutname_incommand = tosubtractmoney_nyang_withname_incommand.replaceAll("냥","")
    tosubtractmoney_nyang = Integer(tosubtractmoney_nyang_withoutname_incommand)
    tosubtractmoney_jun_withoutname_incommand = tosubtractmoney_jun_withname_incommand.replaceAll("전","")
    tosubtractmoney_jun = Integer(tosubtractmoney_jun_withoutname_incommand)
    tosubtractmoney_pun_withoutname_incommand = tosubtractmoney_pun_withname_incommand.replaceAll("푼","")
    tosubtractmoney_pun = Integer(tosubtractmoney_pun_withoutname_incommand)

    tosubtractmoney_withoutname = tosubtractmoney_ju * 10000 + tosubtractmoney_nyang * 100 + tosubtractmoney_jun * 10 + tosubtractmoney_pun
ELSEIF (args.length == 4)
    tosubtractmoney_withname_incommand_args1 = args[0]
    tosubtractmoney_withname_incommand_args2 = args[1]
    tosubtractmoney_withname_incommand_args3 = args[2]

    IF (tosubtractmoney_withname_incommand_args1.contains("주") && tosubtractmoney_withname_incommand_args2.contains("냥") && tosubtractmoney_withname_incommand_args3.contains("전"))
        tosubtractmoney_ju_withoutname_incommand = tosubtractmoney_withname_incommand_args1.replaceAll("주","")
        tosubtractmoney_ju = Integer(tosubtractmoney_ju_withoutname_incommand)
        tosubtractmoney_nyang_withoutname_incommand = tosubtractmoney_withname_incommand_args2.replaceAll("냥","")
        tosubtractmoney_nyang = Integer(tosubtractmoney_nyang_withoutname_incommand)
        tosubtractmoney_jun_withoutname_incommand = tosubtractmoney_withname_incommand_args3.replaceAll("전","")
        tosubtractmoney_jun = Integer(tosubtractmoney_jun_withoutname_incommand)
        tosubtractmoney_pun = 0
    ELSEIF (tosubtractmoney_withname_incommand_args1.contains("주") && tosubtractmoney_withname_incommand_args2.contains("냥") && tosubtractmoney_withname_incommand_args3.contains("푼"))
        tosubtractmoney_ju_withoutname_incommand = tosubtractmoney_withname_incommand_args1.replaceAll("주","")
        tosubtractmoney_ju = Integer(tosubtractmoney_ju_withoutname_incommand)
        tosubtractmoney_nyang_withoutname_incommand = tosubtractmoney_withname_incommand_args2.replaceAll("냥","")
        tosubtractmoney_nyang = Integer(tosubtractmoney_nyang_withoutname_incommand)
        tosubtractmoney_pun_withoutname_incommand = tosubtractmoney_withname_incommand_args3.replaceAll("푼","")
        tosubtractmoney_pun = Integer(tosubtractmoney_pun_withoutname_incommand)
        tosubtractmoney_jun = 0
    ELSEIF (tosubtractmoney_withname_incommand_args1.contains("주") && tosubtractmoney_withname_incommand_args2.contains("전") && tosubtractmoney_withname_incommand_args3.contains("푼"))
        tosubtractmoney_ju_withoutname_incommand = tosubtractmoney_withname_incommand_args1.replaceAll("주","")
        tosubtractmoney_ju = Integer(tosubtractmoney_ju_withoutname_incommand)
        tosubtractmoney_jun_withoutname_incommand = tosubtractmoney_withname_incommand_args2.replaceAll("전","")
        tosubtractmoney_jun = Integer(tosubtractmoney_jun_withoutname_incommand)
        tosubtractmoney_pun_withoutname_incommand = tosubtractmoney_withname_incommand_args3.replaceAll("푼","")
        tosubtractmoney_pun = Integer(tosubtractmoney_pun_withoutname_incommand)
        tosubtractmoney_nyang = 0
    ELSEIF (tosubtractmoney_withname_incommand_args1.contains("냥") && tosubtractmoney_withname_incommand_args2.contains("전") && tosubtractmoney_withname_incommand_args3.contains("푼"))
        tosubtractmoney_nyang_withoutname_incommand = tosubtractmoney_withname_incommand_args1.replaceAll("냥","")
        tosubtractmoney_nyang = Integer(tosubtractmoney_nyang_withoutname_incommand)
        tosubtractmoney_jun_withoutname_incommand = tosubtractmoney_withname_incommand_args2.replaceAll("전","")
        tosubtractmoney_jun = Integer(tosubtractmoney_jun_withoutname_incommand)
        tosubtractmoney_pun_withoutname_incommand = tosubtractmoney_withname_incommand_args3.replaceAll("푼","")
        tosubtractmoney_pun = Integer(tosubtractmoney_pun_withoutname_incommand)
        tosubtractmoney_ju = 0
    ENDIF
    
    tosubtractmoney_withoutname = tosubtractmoney_ju * 10000 + tosubtractmoney_nyang * 100 + tosubtractmoney_jun * 10 + tosubtractmoney_pun
ELSEIF (args.length == 3)
    tosubtractmoney_withname_incommand_args1 = args[0]
    tosubtractmoney_withname_incommand_args2 = args[1]

    IF (tosubtractmoney_withname_incommand_args1.contains("주") && tosubtractmoney_withname_incommand_args2.contains("냥"))
        tosubtractmoney_ju_withoutname_incommand = tosubtractmoney_withname_incommand_args1.replaceAll("주","")
        tosubtractmoney_ju = Integer(tosubtractmoney_ju_withoutname_incommand)
        tosubtractmoney_nyang_withoutname_incommand = tosubtractmoney_withname_incommand_args2.replaceAll("냥","")
        tosubtractmoney_nyang = Integer(tosubtractmoney_nyang_withoutname_incommand)
        tosubtractmoney_jun = 0
        tosubtractmoney_pun = 0
    ELSEIF (tosubtractmoney_withname_incommand_args1.contains("주") && tosubtractmoney_withname_incommand_args2.contains("전"))
        tosubtractmoney_ju_withoutname_incommand = tosubtractmoney_withname_incommand_args1.replaceAll("주","")
        tosubtractmoney_ju = Integer(tosubtractmoney_ju_withoutname_incommand)
        tosubtractmoney_jun_withoutname_incommand = tosubtractmoney_withname_incommand_args2.replaceAll("전","")
        tosubtractmoney_jun = Integer(tosubtractmoney_jun_withoutname_incommand)
        tosubtractmoney_nyang = 0
        tosubtractmoney_pun = 0
    ELSEIF (tosubtractmoney_withname_incommand_args1.contains("주") && tosubtractmoney_withname_incommand_args2.contains("푼"))
        tosubtractmoney_ju_withoutname_incommand = tosubtractmoney_withname_incommand_args1.replaceAll("주","")
        tosubtractmoney_ju = Integer(tosubtractmoney_ju_withoutname_incommand)
        tosubtractmoney_pun_withoutname_incommand = tosubtractmoney_withname_incommand_args2.replaceAll("푼","")
        tosubtractmoney_pun = Integer(tosubtractmoney_pun_withoutname_incommand)
        tosubtractmoney_nyang = 0
        tosubtractmoney_jun = 0
    ELSEIF (tosubtractmoney_withname_incommand_args1.contains("냥") && tosubtractmoney_withname_incommand_args2.contains("전"))
        tosubtractmoney_nyang_withoutname_incommand = tosubtractmoney_withname_incommand_args1.replaceAll("냥","")
        tosubtractmoney_nyang = Integer(tosubtractmoney_nyang_withoutname_incommand)
        tosubtractmoney_jun_withoutname_incommand = tosubtractmoney_withname_incommand_args2.replaceAll("전","")
        tosubtractmoney_jun = Integer(tosubtractmoney_jun_withoutname_incommand)
        tosubtractmoney_ju = 0
        tosubtractmoney_pun = 0
    ELSEIF (tosubtractmoney_withname_incommand_args1.contains("냥") && tosubtractmoney_withname_incommand_args2.contains("푼"))
        tosubtractmoney_nyang_withoutname_incommand = tosubtractmoney_withname_incommand_args1.replaceAll("냥","")
        tosubtractmoney_nyang = Integer(tosubtractmoney_nyang_withoutname_incommand)
        tosubtractmoney_pun_withoutname_incommand = tosubtractmoney_withname_incommand_args2.replaceAll("푼","")
        tosubtractmoney_pun = Integer(tosubtractmoney_pun_withoutname_incommand)
        tosubtractmoney_ju = 0
        tosubtractmoney_jun = 0
    ELSEIF (tosubtractmoney_withname_incommand_args1.contains("전") && tosubtractmoney_withname_incommand_args2.contains("푼"))
        tosubtractmoney_jun_withoutname_incommand = tosubtractmoney_withname_incommand_args1.replaceAll("전","")
        tosubtractmoney_jun = Integer(tosubtractmoney_jun_withoutname_incommand)
        tosubtractmoney_pun_withoutname_incommand = tosubtractmoney_withname_incommand_args2.replaceAll("푼","")
        tosubtractmoney_pun = Integer(tosubtractmoney_pun_withoutname_incommand)
        tosubtractmoney_ju = 0
        tosubtractmoney_nyang = 0
    ENDIF

    tosubtractmoney_withoutname = tosubtractmoney_ju * 10000 + tosubtractmoney_nyang * 100 + tosubtractmoney_jun * 10 + tosubtractmoney_pun
ELSEIF (args.length == 2)
    tosubtractmoney_withname_incommand_unit = args[0]
    IF (tosubtractmoney_withname_incommand_unit.contains("주"))
        tosubtractmoney_ju_withoutname_incommand = tosubtractmoney_withname_incommand_unit.replaceAll("주","")
        tosubtractmoney_ju = Integer(tosubtractmoney_ju_withoutname_incommand)
        tosubtractmoney_nyang = 0
        tosubtractmoney_jun = 0
        tosubtractmoney_pun = 0
    ELSEIF (tosubtractmoney_withname_incommand_unit.contains("냥"))
        tosubtractmoney_nyang_withoutname_incommand = tosubtractmoney_withname_incommand_unit.replaceAll("냥","")
        tosubtractmoney_nyang = Integer(tosubtractmoney_nyang_withoutname_incommand)
        tosubtractmoney_ju = 0
        tosubtractmoney_jun = 0
        tosubtractmoney_pun = 0
    ELSEIF (tosubtractmoney_withname_incommand_unit.contains("전"))
        tosubtractmoney_jun_withoutname_incommand = tosubtractmoney_withname_incommand_unit.replaceAll("전","")
        tosubtractmoney_jun = Integer(tosubtractmoney_jun_withoutname_incommand)
        tosubtractmoney_ju = 0
        tosubtractmoney_nyang = 0
        tosubtractmoney_pun = 0
    ELSEIF (tosubtractmoney_withname_incommand_unit.contains("푼"))
        tosubtractmoney_pun_withoutname_incommand = tosubtractmoney_withname_incommand_unit.replaceAll("푼","")
        tosubtractmoney_pun = Integer(tosubtractmoney_pun_withoutname_incommand)
        tosubtractmoney_ju = 0
        tosubtractmoney_nyang = 0
        tosubtractmoney_jun = 0
    ENDIF

    tosubtractmoney_withoutname = tosubtractmoney_ju * 10000 + tosubtractmoney_nyang * 100 + tosubtractmoney_jun * 10 + tosubtractmoney_pun
ENDIF
{$playername + ".tosubtractmoney_withoutname"} = tosubtractmoney_withoutname
