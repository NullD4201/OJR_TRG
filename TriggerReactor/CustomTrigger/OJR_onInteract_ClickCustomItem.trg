import org.bukkit.Bukkit
import org.bukkit.ChatColor
import org.bukkit.scoreboard.Scoreboard
import org.bukkit.scoreboard.ScoreboardManager
import org.bukkit.scoreboard.Objective
import org.bukkit.scoreboard.DisplaySlot
import org.bukkit.entity.Player
import org.bukkit.ChatColor

item = $helditemname

IF ($helditemdisplayname == "§6§l§n직업주문서")
    #CMDOP "set job " + $helditemlore:0
    #CMDCON "replaceitem entity " + $playername + " weapon.mainhand air 1"
ENDIF
IF ($helditemlore:0 == "§8§lOJR수표")
    t = $helditemdisplayname
    c = ChatColor.stripColor(t)
    #CMDOP "돈 더하기 " + $playername + " " + c
    #CMDCON "clear " + $playername + " paper 1"
ENDIF
