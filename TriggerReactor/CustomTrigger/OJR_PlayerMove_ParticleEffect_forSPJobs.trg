import org.bukkit.Effect
import org.bukkit.Particle
import org.bukkit.entity.Player

jobname = {$playername + ".scoreboard.job"}

IF (jobname == "신선")
    #CMDCON "particle minecraft:smoke ${x} " + ($y + 0.5) + " ${z} 0.3 0.3 0.3 0 150 force"
ENDIF
