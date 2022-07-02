BEGIN NQ#GB06

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
// Global("NQ#PAEK","GLOBAL",5)			Quest erfüllt / Hilfe bei Rakis Quest
// Global("NQ#PAEK","GLOBAL",6)			Quest erfüllt / Hilfe bei Izvos Quest
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
SAY ~Der Eine hat Euch nicht vergessen, Shuk Worgreiter! Ich habe den anderen gesagt, dass Ihr kommt, aber überzeugen müsst Ihr sie selbst!~
IF ~~ THEN EXTERN ~NQ#SHUK~ 7
END

IF ~~ THEN BEGIN 1
SAY ~Überzeugt die drei Hauptmänner an den anderen Lagerfeuern, dass Ihr der Held seid auf den wir gewartet haben! Ja, überzeugt sie! Dann werden wir Euch in das gelobte Land folgen, hahaha!~
IF ~~ THEN EXTERN ~NQ#SHUK~ 8
END

IF ~~ THEN BEGIN 2
SAY ~Ja, hahaha! Das gelobte Land wartet auf uns!~
IF ~~ THEN EXTERN ~NQ#SHUK~ 23
END

IF ~Global("NQ#GOBLINCREW","GLOBAL",50)~ THEN BEGIN LOSE
SAY ~Ihr habt es versaut, Abschaum.~
IF ~~ THEN EXIT
END

IF ~!Dead("NEROGDOK")~ THEN BEGIN IKNOW
SAY ~Ihr seid zu früh dran, Abschaum. Vielleicht wird Vielauge mit Euch sprechen, wenn Ihr Rogdok getötet habt.~
IF ~~ THEN EXIT
END

IF ~Dead("NEROGDOK") Global("NQ#GOBLINCREW","GLOBAL",1) NumberOfTimesTalkedTo(0) !Name("NQ#SHUK",LastTalkedToBy)~ THEN BEGIN HESDEAD0
SAY ~Abschaum, da seid Ihr! Sehr gut, dann ist dieser Teil Eurer Bestimmung erfüllt! Rogdok ist tot und der falsche Gott vertrieben!~
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN GOTO HISHUK
IF ~!PartyHasItem("NQ#SHUK") OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN GOTO HESDEAD2
IF ~PartyHasItem("NQ#SHUK") OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN DO ~EraseJournalEntry(@70016) AddJournalEntry(@70017,QUEST)~ GOTO HESDEAD3
END

IF ~Dead("NEROGDOK") Global("NQ#GOBLINCREW","GLOBAL",1) NumberOfTimesTalkedTo(0) Name("NQ#SHUK",LastTalkedToBy)~ THEN BEGIN NOSHUK2
SAY ~Da ist der Shuk! Ich wusste Ihr würdet kommen! Ich habe Euch gesehen... Krieger.~
IF ~~ THEN GOTO HISHUK
END

IF ~Dead("NEROGDOK") Global("NQ#GOBLINCREW","GLOBAL",1) !NumberOfTimesTalkedTo(0)~ THEN BEGIN HESDEAD1
SAY ~Der Abschaum ist zurück, sehr gut, dann ist dieser Teil Eurer Bestimmung erfüllt! Rogdok ist tot und der falsche Gott vertrieben!~
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN GOTO HISHUK
IF ~!PartyHasItem("NQ#SHUK") OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN GOTO HESDEAD2
IF ~PartyHasItem("NQ#SHUK") OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN DO ~EraseJournalEntry(@70016) AddJournalEntry(@70017,QUEST)~ GOTO HESDEAD3
END

IF ~~ THEN BEGIN HESDEAD2
SAY ~Vielauge hat Euch gesehen, <RACE>. Ihr werdet uns einen neuen Anführer bringen! Oder... waren es Murmeln? Bah! Hahahahaha!~
IF ~~ THEN DO ~AddJournalEntry(@70016,QUEST) SetGlobal("NQ#GOBLINCREW","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN HESDEAD3
SAY ~Ah! Ihr habt das Artefakt! Hahaha! Bringt uns den Auserwählten!~
IF ~~ THEN REPLY ~Hm... meint Ihr den Goblinstein?~ DO ~SetGlobal("NQ#GOBLINCREW","GLOBAL",3)~ GOTO HESDEAD4
IF ~~ THEN REPLY ~Ja, klar. Ich bin gleich wieder da...~ DO ~SetGlobal("NQ#GOBLINCREW","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN HESDEAD4
SAY ~Ja, jaaa, jahahahahaha!~
IF ~~ THEN EXIT
END

IF ~Global("NQ#GOBLINCREW","GLOBAL",2)~ THEN BEGIN NOSHUK1
SAY ~Vielauge sieht... Vieles! Muhahaha!~
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN GOTO HISHUK
IF ~!PartyHasItem("NQ#SHUK") OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN EXIT
IF ~PartyHasItem("NQ#SHUK") OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN DO ~EraseJournalEntry(@70016) EraseJournalEntry(@70017) AddJournalEntry(@70018,QUEST)~ GOTO HESDEAD3
IF ~~ THEN EXIT
END

IF ~Global("NQ#GOBLINCREW","GLOBAL",3) OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN NOSHUK2
SAY ~Wo ist der Shuk!? Hahaha! Wo!?~
IF ~~ THEN EXIT
END

IF ~Global("NQ#GOBLINCREW","GLOBAL",3) See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN NOSHUK3
SAY ~Da ist der Shuk! Ich wusste Ihr würdet kommen! Ich habe Euch gesehen... Krieger.~
IF ~~ THEN GOTO HISHUK
END

IF ~~ THEN BEGIN HISHUK
SAY ~Ihr seid ein wahrer Goblin, nicht wahr? Ein Anführer? Hahaha!~
IF ~~ THEN EXTERN ~NQ#SHUK~ 6
END

IF ~GlobalGT("NQ#PAEK","GLOBAL",3) !Global("NQ#PAEK","GLOBAL",50) Global("NQ#IZVO","GLOBAL",12) OR(2) Global("NQ#RAKI","GLOBAL",9) Global("NQ#RAKI","GLOBAL",667) OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN ALLVOTES0
SAY ~Wo ist der Shuk!? Hahaha! Wo!?~
IF ~~ THEN EXIT
END

IF ~GlobalGT("NQ#PAEK","GLOBAL",3) !Global("NQ#PAEK","GLOBAL",50) Global("NQ#IZVO","GLOBAL",12) Global("NQ#RAKI","GLOBAL",9) See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN ALLVOTES1
SAY ~Hihihihi, der Shuk hat sie alle überzeugt! Gut, gut! Die Zeit der Zweifler ist vorbei! Jetzt sehen alle, dass Feuerauge der einzige Gott ist den wir brauchen!~
IF ~~ THEN EXTERN ~NQ#SHUK~ 22
END

IF ~GlobalGT("NQ#PAEK","GLOBAL",3) !Global("NQ#PAEK","GLOBAL",50) Global("NQ#IZVO","GLOBAL",12) Global("NQ#RAKI","GLOBAL",667) See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN ALLVOTES1
SAY ~Hihihihi, der Shuk hat sie alle überzeugt! Naja, oder wenigstens anständig umgebracht, hahaha! Gut, gut! Die Zeit der Zweifeller ist vorbei! Jetzt sehen alle, dass Feuerauge der einzige Gott ist den wir brauchen!~
IF ~~ THEN EXTERN ~NQ#SHUK~ 22
END

IF ~Global("NQ#GOBLINCREW","GLOBAL",4)~ THEN BEGIN QUEST0
SAY ~Sucht die Hauptmänner! Die jämmerlichen Schlappschwänze hocken an den Feuern!~
IF ~~ THEN EXIT
END