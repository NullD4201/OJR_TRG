// 기본메시지 없애기
#cancelevent

message = event.getMessage()

// 메시지 형식 지정
IF ({$playername + ".scoreboard.krname"} == null || {$playername + ".scoreboard.krname"} == "설정되지 않음")
    IF ({$playername + ".scoreboard.job"} == null || {$playername + ".scoreboard.job"} == "설정되지 않음")
        #BROADCAST "&f<" + $playername + "> " + message
    ELSE
        #BROADCAST "&d[" + {$playername + ".scoreboard.job"} + "]&f<" + $playername + "> " + message
    ENDIF
ELSE
    IF ({$playername + ".scoreboard.job"} == null || {$playername + ".scoreboard.job"} == "설정되지 않음")
        #BROADCAST "&f<" + $playername + ">&7(" + {$playername + ".scoreboard.krname"} + ")&f " + message
    ELSE
        #BROADCAST "&d[" + {$playername + ".scoreboard.job"} + "]&f<" + $playername + ">&7(" + {$playername + ".scoreboard.krname"} + ")&f " + message
    ENDIF
ENDIF

