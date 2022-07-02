BEGIN NQ#GB09

// Global("NQ#GOBLINCREW","GLOBAL",1)	Crew gespawnt
// Global("NQ#GOBLINCREW","GLOBAL",2)	Gespräch Vielauge
// Global("NQ#GOBLINCREW","GLOBAL",3)	Gespräch Vielauge Artefakt dabei
// Global("NQ#GOBLINCREW","GLOBAL",4)	Gespräch Vielauge Shuk
// Global("NQ#GOBLINCREW","GLOBAL",5)	Ende
// Global("NQ#GOBLINCREW","GLOBAL",50)	Quest gescheitert

// Global("NQ#PAEK","GLOBAL",1)			Gespräch Paek geführt
// Global("NQ#PAEK","GLOBAL",2)			Mulm gespawnt
// Global("NQ#PAEK","GLOBAL",3)			Mulm feindlich
// Global("NQ#PAEK","GLOBAL",4)			Quest erfüllt
// Global("NQ#IZVO","GLOBAL",50)		Quest gescheitert, da Paek tot

// Global("NQ#RAKI","GLOBAL",1)			Gespräch Raki geführt
// Global("NQ#RAKI","GLOBAL",2)			Arbeiter gespawnt
// Global("NQ#RAKI","GLOBAL",3-5)		Arbeiter legen los
// Global("NQ#RAKI","GLOBAL",6)			Baum gespawnt
// Global("NQ#RAKI","GLOBAL",7)			Baum hat angegriffen / Goblins sind geflohen
// Global("NQ#RAKI","GLOBAL",9)			Quest erfüllt
// Global("NQ#RAKI","GLOBAL",50)		Quest gescheitert, da Raki tot

// Global("NQ#IZVO","GLOBAL",1)			Gespräch Izvo geführt
// Global("NQ#IZVO","GLOBAL",2)			Spawn der Fässer
// Global("NQ#IZVO","GLOBAL",3-7)		1-6 Fässer zerstört
// Global("NQ#IZVO","GLOBAL",9)			Quest 1 erfüllt
// Global("NQ#IZVO","GLOBAL",10)		Spinnen gespawnt
// Global("NQ#IZVO","GLOBAL",11)		Quest 2 erfüllt
// Global("NQ#IZVO","GLOBAL",12)		Spinne gefressen
// Global("NQ#IZVO","GLOBAL",50)		Quest gescheitert, da Izvo tot

IF ~~ THEN BEGIN 0
SAY @0 /* Mein Stimme ist nix ohne Aufgabe. Mein Stimme ist wichtig, wenn alle haben Futter, aber ohne Aufgabe da ist kein Futter. */
IF ~~ THEN EXTERN ~NQ#SHUK~ 19
END

IF ~~ THEN BEGIN 1
SAY @1 /* Hähnchen sind in Fässern, aber Trottel bringen falsche Fässer. Richtige im Lager sein, ich schicke Trottel wieder, aber diesmal nicht kommen zurück. Holst du mir Viecher aus sechs Fässer! */
IF ~~ THEN DO ~SetGlobal("NQ#IZVO","GLOBAL",1) AddJournalEntry(@70032,QUEST)~ EXIT
END

IF ~~ THEN BEGIN 2
SAY @2 /* Nein, nein, nix Problem, Chef! Ich hab Futter, Du hast mein Stimme! */
IF ~~ THEN DO ~SetGlobal("NQ#IZVO","GLOBAL",11) TakePartyItem("NQ#MI44") DestroyItem("NQ#MI44") TakePartyItem("NQ#CHI2") DestroyItem("NQ#CHI2") TakePartyItem("NQ#CHI2") DestroyItem("NQ#CHI2") TakePartyItem("NQ#CHI2") DestroyItem("NQ#CHI2") TakePartyItem("NQ#CHI2") DestroyItem("NQ#CHI2") TakePartyItem("NQ#CHI2") DestroyItem("NQ#CHI2") TakePartyItem("NQ#CHI2") DestroyItem("NQ#CHI2") TakePartyItem("NQ#CHI2") DestroyItem("NQ#CHI2") TakePartyItem("NQ#CHI2") DestroyItem("NQ#CHI2") EraseJournalEntry(@70032) EraseJournalEntry(@70033) AddJournalEntry(@70034,QUEST)~ EXIT
END

IF ~GlobalGT("NQ#IZVO","GLOBAL",10) !Name("NQ#SHUK",LastTalkedToBy) !Global("NQ#GOBLINCREW","GLOBAL",50)~ THEN BEGIN LAST1
SAY @3 /* Shuk ist der Chef, Chef! */
IF ~~ THEN EXIT
END

IF ~GlobalGT("NQ#IZVO","GLOBAL",10) Name("NQ#SHUK",LastTalkedToBy) !Global("NQ#GOBLINCREW","GLOBAL",50)~ THEN BEGIN LAST2
SAY @4 /* Du bist Chef, Chef! */
IF ~~ THEN EXIT
END

IF ~OR(2) GlobalLT("NQ#GOBLINCREW","GLOBAL",4) Global("NQ#GOBLINCREW","GLOBAL",50)~ THEN BEGIN NOQUEST
SAY @5 /* Ich nix hab Futter! */
IF ~~ THEN EXIT
END

IF ~Global("NQ#IZVO","GLOBAL",0) GlobalGT("NQ#GOBLINCREW","GLOBAL",3) OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN NOSHUK
SAY @6 /* Ah, Sklave von Shuk! Wo ist er? */
IF ~~ THEN EXIT
END

IF ~Global("NQ#IZVO","GLOBAL",0) GlobalGT("NQ#GOBLINCREW","GLOBAL",3) See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN HISHUK1
SAY @7 /* Shuk! Du gekommen. Gut. Aufgabe kann nicht lange warten. */
IF ~~ THEN EXTERN ~NQ#SHUK~ 18
END

IF ~Global("NQ#IZVO","GLOBAL",9)~ THEN BEGIN NOSPIDER
SAY @8 /* Bringt Hähnchen in Höhle! Leckerchen werden sie riechen und kommen! */
IF ~~ THEN EXIT
END

IF ~GlobalGT("NQ#IZVO","GLOBAL",0) GlobalLT("NQ#IZVO","GLOBAL",9) See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID) NumItemsParty("NQ#CHI2",9)~ THEN BEGIN ALLCHICKS1
SAY @9 /* Ah, da sind mein Hähnchen! Gut. Bringt sie jetzt in die Höhle! Ihr Geruch perfekt, damit Leckerbissen aus ihren Verstecken kommen! */
IF ~~ THEN DO ~SetGlobal("NQ#IZVO","GLOBAL",9) EraseJournalEntry(@70032) AddJournalEntry(@70033,QUEST)~ EXIT
END

IF ~GlobalGT("NQ#IZVO","GLOBAL",6) GlobalLT("NQ#IZVO","GLOBAL",9) See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID) NumItemsPartyGT("NQ#CHI2",4)~ THEN BEGIN LOSTCHICKS
SAY @9 /* Ah, da sind mein Hähnchen! Gut. Bringt sie jetzt in die Höhle! Ihr Geruch perfekt, damit Leckerbissen aus ihren Verstecken kommen! */
IF ~~ THEN DO ~SetGlobal("NQ#IZVO","GLOBAL",9) EraseJournalEntry(@70032) AddJournalEntry(@70033,QUEST)~ EXIT
END

IF ~GlobalGT("NQ#IZVO","GLOBAL",0) GlobalLT("NQ#IZVO","GLOBAL",9) NumItemsPartyLT("NQ#CHI2",9)~ THEN BEGIN NOCHICKS
SAY @10 /* Machst Du Fässer kaputt und vergisst Du dann auch nicht einsammeln mein Hähnchen! */
IF ~~ THEN EXIT
END

IF ~Global("NQ#IZVO","GLOBAL",10) OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN WIN0
SAY @6 /* Ah, Sklave von Shuk! Wo ist er? */
IF ~~ THEN EXIT
END

IF ~Global("NQ#IZVO","GLOBAL",10) Dead("NQ#SPI06") !PartyHasItem("NQ#MI44") See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN WIN1
SAY @11 /* Spinnen tot? Bringst du mir dicke Spinne! */
IF ~~ THEN EXTERN ~NQ#SHUK~ 20
END

IF ~Global("NQ#IZVO","GLOBAL",10) PartyHasItem("NQ#MI44") See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN WIN1
SAY @12 /* Ja! Fette, fette Spinne! Du mir geben für fetten, fetten Eintopf! */
IF ~~ THEN EXTERN ~NQ#SHUK~ 20
END




