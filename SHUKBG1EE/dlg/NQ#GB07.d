BEGIN NQ#GB07

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
SAY @0 /* Hey, das bringt Dich nicht weiter, häh? Kannst mich wahrscheinlich umhauen, aber das beeindruckt hier keinen. Bin ein Schütze und kein Kämpfer, weißte? */
IF ~~ THEN GOTO 1
END

IF ~~ THEN BEGIN 1
SAY @1 /* Tu mir nur 'nen kleinen Gefallen, ja? Dann sieht hier jeder was für'n krasser Kerl Du bist und ich werd' auch nur das Beste über Dich erzähl'n, klar? */
IF ~~ THEN EXTERN ~NQ#SHUK~ 10
END

IF ~~ THEN BEGIN 2
SAY @2 /* Mulm ist einer von den Kämpfern, häh? Wollte, dass wir Schützen ihm unser ganzes Zeug geben. Ich hab ihn mit 'nem Pfeil erwischt, aber er hat's überlebt. Zäher Bastard! Jetzt sammelt er sein Pack um uns fertig zu machen, kapiert? */
IF ~~ THEN GOTO 3
END

IF ~~ THEN BEGIN 3
SAY @3 /* Wenn Du ihn fertig machst, wird keiner was sagen. Prüfung der Götter und all das. Er ist mit seinen Jungs irgendwo nördlich von hier unterwegs. Halt mir den Rücken frei, dann pass' ich in Zukunft auf, dass keiner auf Deinen zielt, alles klar? */
IF ~~ THEN EXTERN ~NQ#SHUK~ 11
END

IF ~~ THEN BEGIN 4
SAY @4 /* Oh, ähm, ja klar... Chef. */
IF ~Alignment(Player1,MASK_GOOD)~ THEN DO ~GivePartyGold(16) SetGlobal("NQ#PAEK","GLOBAL",4) EraseJournalEntry(@70023) AddJournalEntry(@70025,QUEST)~ GOTO HELP1
IF ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL)~ THEN DO ~GivePartyGold(16) SetGlobal("NQ#PAEK","GLOBAL",4) EraseJournalEntry(@70023) AddJournalEntry(@70024,QUEST)~ GOTO HELP1
IF ~Alignment(Player1,MASK_EVIL)~ THEN DO ~GivePartyGold(16) SetGlobal("NQ#PAEK","GLOBAL",4) EraseJournalEntry(@70023) AddJournalEntry(@70024,QUEST)~ GOTO HELP1
END

IF ~~ THEN BEGIN 5
SAY @5 /* Raki hat Probleme mit den Bäumen, klar? Meine Jungs stellen Dir ein paar Sprengfässer an den Waldrand. Kriegst'e ein Problem, machst'e einfach was Feuer dran. Bumm, hahaha! */
IF ~~ THEN DO ~TakePartyGold(50) SetGlobal("NEEDUHELP","LOCALS",2) SetGlobal("NQ#PAEK","GLOBAL",5) CreateCreature("NQ#BAR1",[1454.1363],0) CreateCreature("NQ#BAR1",[1642.1544],0) CreateCreature("NQ#BAR1",[1927.1533],0)~ GOTO 7 // Raki
END

IF ~~ THEN BEGIN 6
SAY @6 /* Izvo kümmert sich ums Fressen, aber das Fressen will lieber ihn fressen, kapiert? Meine Jungs stellen Dir ein paar Sprengfässer in die Höhle. Kriegst'e ein Problem, machst'e einfach was Feuer dran. Bumm, hahaha! */
IF ~~ THEN DO ~TakePartyGold(50) SetGlobal("NEEDUHELP","LOCALS",3) SetGlobal("NQ#PAEK","GLOBAL",6)~ GOTO 7 // Izvo
END

IF ~~ THEN BEGIN 7
SAY @7 /* Versucht nur keine and'ren Goblins zu brutzeln, ja? Das gibt Ärger... ich hab's schon erlebt. */
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 8
SAY @8 /* Kein Problem, Chef! */
IF ~~ THEN DO ~SetGlobal("NEEDUHELP","LOCALS",10)~ EXIT
END

IF ~OR(2) GlobalLT("NQ#GOBLINCREW","GLOBAL",4) Global("NQ#GOBLINCREW","GLOBAL",50) !Name("NQ#SHUK",LastTalkedToBy)~ THEN BEGIN NOQUEST1
SAY @9 /* Lasst mich in Ruhe, <RACE>. */
IF ~~ THEN EXIT
END

IF ~OR(2) GlobalLT("NQ#GOBLINCREW","GLOBAL",4) Global("NQ#GOBLINCREW","GLOBAL",50) Name("NQ#SHUK",LastTalkedToBy)~ THEN BEGIN NOQUEST2
SAY @10 /* Ich hab' jetzt keine Zeit! */
IF ~~ THEN EXIT
END

IF ~Global("NQ#PAEK","GLOBAL",0) GlobalGT("NQ#GOBLINCREW","GLOBAL",3) OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN NOSHUK
SAY @11 /* Ihr seid mit dem Shuk unterwegs, hä? Wo ist er? */
IF ~~ THEN EXIT
END

IF ~Global("NQ#PAEK","GLOBAL",0) GlobalGT("NQ#GOBLINCREW","GLOBAL",3) See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN HISHUK
SAY @12 /* Du bist Shuk, hä? Hab von Dir gehört. Krasser Krieger sagt der Schamane... */
IF ~~ THEN EXTERN ~NQ#SHUK~ 9
END

IF ~GlobalGT("NQ#PAEK","GLOBAL",0) GlobalLT("NQ#PAEK","GLOBAL",4) OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN KILLMULM0
SAY @13 /* Lasst mich in Ruhe, <RACE>. Wo ist Shuk? */
IF ~~ THEN EXIT
END

IF ~GlobalGT("NQ#PAEK","GLOBAL",0) GlobalLT("NQ#PAEK","GLOBAL",4) !Dead("NQ#GB11") See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN KILLMULM1
SAY @14 /* Hä? Haust ihm den Kopf ab, oder was? */
IF ~~ THEN EXIT
END

IF ~GlobalGT("NQ#PAEK","GLOBAL",0) GlobalLT("NQ#PAEK","GLOBAL",4) Dead("NQ#GB11") See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN KILLMULM2
SAY @15 /* Hab' gehört die Sau ist tot. Sehr gut! Meine Stimme ist Dir sicher! */
IF ~~ THEN EXTERN ~NQ#SHUK~ 12
END

IF ~GlobalGT("NQ#PAEK","GLOBAL",3) !Global("NEEDUHELP","LOCALS",10)~ THEN BEGIN GOSHUK
SAY @16 /* Für Shuk! Okay? */
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN HELP1
SAY @17 /* Du wist bald sehen wie nützlich ich bin, oder? Paek ist immer für Dich da,Chef! */
IF ~Global("NQ#IZVO","GLOBAL",12) OR(2) Global("NQ#RAKI","GLOBAL",9) Global("NQ#RAKI","GLOBAL",50)~ THEN EXIT
IF ~!Global("NQ#IZVO","GLOBAL",12) !Global("NQ#RAKI","GLOBAL",9) !Global("NQ#RAKI","GLOBAL",50)~ THEN GOTO HELP2
IF ~!Global("NQ#IZVO","GLOBAL",12) OR(2) Global("NQ#RAKI","GLOBAL",9) Global("NQ#RAKI","GLOBAL",50)~ THEN GOTO HELP3
IF ~Global("NQ#IZVO","GLOBAL",12) !Global("NQ#RAKI","GLOBAL",9) !Global("NQ#RAKI","GLOBAL",50)~ THEN GOTO HELP4
END

IF ~~ THEN BEGIN HELP2
SAY @18 /* Du hast noch nich' mit Raki und Izvo gequatscht, was? Ich weiß genau welche Probleme die haben und jeder krasse Boss braucht ein krasse rechte Hand, oder? Ich werd' fünfzig Goldstücke brauchen, dann kann ich Dir eine große Hilfe sein! */
IF ~~ THEN DO ~SetGlobal("NEEDUHELP","LOCALS",1)~ EXTERN ~NQ#SHUK~ 24
END

IF ~~ THEN BEGIN HELP3
SAY @19 /* Du hast noch nich' mit Izvo gequatscht, oder? Ich weiß genau welche Probleme der hat und jeder krasse Boss braucht auch 'ne krasse rechte Hand, oder? */
IF ~~ THEN DO ~SetGlobal("NEEDUHELP","LOCALS",1)~ EXTERN ~NQ#SHUK~ 24
END

IF ~~ THEN BEGIN HELP4
SAY @20 /* Du hast noch nich' mit Raki gequatscht, oder? Ich weiß genau welche Probleme der hat und jeder krasse Boss braucht auch 'ne krasse rechte Hand, oder? */
IF ~~ THEN DO ~SetGlobal("NEEDUHELP","LOCALS",1)~ EXTERN ~NQ#SHUK~ 24
END

IF ~GlobalGT("NQ#PAEK","GLOBAL",3) Global("NEEDUHELP","LOCALS",10) See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN HELP5
SAY @21 /* Ja, Boss? Hast'e Dir schon überlegt wie ich Dir helfen kann?? */
IF ~~ THEN DO ~SetGlobal("NEEDUHELP","LOCALS",1)~ EXTERN ~NQ#SHUK~ 24
END

IF ~GlobalGT("NQ#PAEK","GLOBAL",3) Global("NEEDUHELP","LOCALS",10) OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN HELP5
SAY @22 /* Zieh ab, <RACE>! */
IF ~~ THEN EXIT
END




