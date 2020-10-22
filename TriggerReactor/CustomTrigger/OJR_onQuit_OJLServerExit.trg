IF ({$playername + ".scoreboard.krname"} == null || {$playername + ".scoreboard.krname"} == "설정되지 않음")
    IF ({$playername + ".scoreboard.job"} == null || {$playername + ".scoreboard.job"} == "설정되지 않음")
        #BROADCAST {"ojr_prefix"} + "&e" + $playername + "&f님이 서버에서 나가셨습니다."
    ELSE
        #BROADCAST {"ojr_prefix"} + "&d[" + {$playername + ".scoreboard.job"} + "]&f<" + $playername + ">님이 서버에서 나가셨습니다."
    ENDIF
ELSE
    IF ({$playername + ".scoreboard.job"} == null || {$playername + ".scoreboard.job"} == "설정되지 않음")
        #BROADCAST {"ojr_prefix"} + "&f<" + $playername + ">&7(" + {$playername + ".scoreboard.krname"} + ")&f님이 서버에서 나가셨습니다."
    ELSE
        #BROADCAST {"ojr_prefix"} + "&d[" + {$playername + ".scoreboard.job"} + "]&f<" + $playername + ">&7(" + {$playername + ".scoreboard.krname"} + ")&f님이 서버에서 나가셨습니다."
    ENDIF
ENDIF
