BEGIN NQ#GB27

IF ~Name("NQ#SHUK",LastTalkedToBy) GlobalLT("SMSEVENT1","LOCALS",3)~ THEN BEGIN 0
SAY @0 /* Shuk. */
IF ~~ THEN DO ~~ GOTO 2
END

IF ~!Name("NQ#SHUK",LastTalkedToBy) GlobalLT("SMSEVENT1","LOCALS",3)~ THEN BEGIN 1
SAY @1 /* ... */
IF ~~ THEN DO ~~ GOTO 2
END

IF ~~ THEN BEGIN 2
SAY @2 /* Die Ratte hat Probleme. */
IF ~~ THEN DO ~~ GOTO 3
END

IF ~~ THEN BEGIN 3
SAY @1 /* ... */
IF ~~ THEN DO ~SetGlobal("SMSEVENT1","LOCALS",3) AddJournalEntry(@70047,QUEST)~ EXIT
END