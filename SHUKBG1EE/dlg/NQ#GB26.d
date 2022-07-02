BEGIN NQ#GB26

IF ~~ THEN BEGIN 0
SAY ~Ja... er hat... kam *hust* Mitternacht...~
IF ~~ THEN DO ~~ GOTO 1
END

IF ~~ THEN BEGIN 1
SAY ~... wir waren an der Leiter im Norden und er *hust* ...hat den bösen Zauber geschüttet...~
IF ~~ THEN EXTERN ~NQ#SHUK~ 42
END

IF ~!Name("NQ#SHUK",LastTalkedToBy) Global("NQ#SHUKSPALACEEVENT1","GLOBAL",4)~ THEN BEGIN LASTWORDS0
SAY ~Boss...~
IF ~~ THEN EXIT
END

IF ~Name("NQ#SHUK",LastTalkedToBy) Global("NQ#SHUKSPALACEEVENT1","GLOBAL",4)~ THEN BEGIN LASTWORDS1
SAY ~Boss...! *hust* Ich hab den fetten Gnom gesehen...~
IF ~~ THEN EXTERN ~NQ#SHUK~ 41
END

IF ~!Global("NQ#SHUKSPALACEEVENT1","GLOBAL",4)~ THEN BEGIN NOWORDS
SAY ~*hust*~
IF ~~ THEN EXIT
END