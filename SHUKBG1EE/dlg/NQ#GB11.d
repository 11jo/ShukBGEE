BEGIN NQ#GB11

// Global("NQ#GOBLINCREW","GLOBAL",1)	Crew gespawnt
// Global("NQ#GOBLINCREW","GLOBAL",2)	Gespräch Vielauge
// Global("NQ#GOBLINCREW","GLOBAL",3)	Gespräch Vielauge Artefakt dabei
// Global("NQ#GOBLINCREW","GLOBAL",4)	Gespräch Vielauge Shuk

// Global("NQ#PAEK","GLOBAL",1)			Gespräch Paek geführt
// Global("NQ#PAEK","GLOBAL",2)			Mulm gespawnt
// Global("NQ#PAEK","GLOBAL",3)			Mulm feindlich
// Global("NQ#PAEK","GLOBAL",4)			Quest erfüllt


IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN 0
SAY @0 /* Halt! Wer... Ihr seid Shuk? Hab von Euch gehört. Was wollt ihr? */
IF ~~ THEN EXTERN ~NQ#SHUK~ 13
END

IF ~~ THEN BEGIN 1
SAY @1 /* Was...? Hat Paek Euch geschickt? Die diebische Krötin hat unser Gold gestohlen! Wir... */
IF ~~ THEN DO ~Enemy()~ EXTERN ~NQ#SHUK~ 14
END

IF ~Global("NQ#GOBLINCREW","GLOBAL",50)~ THEN BEGIN LOSE
SAY @2 /* *Rülps!* */
IF ~~ THEN EXIT
END

IF ~OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN 2
SAY @2 /* *Rülps!* */
IF ~~ THEN EXIT
END