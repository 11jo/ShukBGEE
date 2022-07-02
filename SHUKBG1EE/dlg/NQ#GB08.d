BEGIN NQ#GB08

// Global("NQ#GOBLINCREW","GLOBAL",1)	Crew gespawnt
// Global("NQ#GOBLINCREW","GLOBAL",2)	Gespräch Vielauge
// Global("NQ#GOBLINCREW","GLOBAL",3)	Gespräch Vielauge Artefakt dabei
// Global("NQ#GOBLINCREW","GLOBAL",4)	Gespräch Vielauge Shuk

// Global("NQ#PAEK","GLOBAL",1)			Gespräch Paek geführt
// Global("NQ#PAEK","GLOBAL",2)			Mulm gespawnt
// Global("NQ#PAEK","GLOBAL",3)			Mulm feindlich
// Global("NQ#PAEK","GLOBAL",4)			Quest erfüllt

// Global("NQ#RAKI","GLOBAL",1)			Gespräch Raki geführt
// Global("NQ#RAKI","GLOBAL",2)			Arbeiter gespawnt
// Global("NQ#RAKI","GLOBAL",3-5)		Arbeiter legen los
// Global("NQ#RAKI","GLOBAL",6)			Baum gespawnt
// Global("NQ#RAKI","GLOBAL",7)			Baum hat angegriffen / Goblins sind geflohen
// Global("NQ#RAKI","GLOBAL",9)			Quest erfüllt
// Global("NQ#RAKI","GLOBAL",666)		Quest gescheitert

// Tagebucheinträge



IF ~~ THEN BEGIN 0
SAY ~Nein. Bargrivyek ist der Gott von Kooperadings! Er wird wollen, dass ich Euch prüfe. Vielleicht seid Ihr auch sein Champion? Ich wollte Bargrivyek nicht mit Problemen belästigen, doch wenn er Euch geschickt hat....~
IF ~~ THEN GOTO 1
END

IF ~~ THEN BEGIN 1
SAY ~Der Wald hat meine Holzfäller gefressen. Ich habe neue geschickt, aber sie sind faul und feige. Trefft sie im Westen und passt auf, dass sie ihre Arbeit machen. Wenn Ihr den Wald besiegt, muss Bargrivyek wollen, dass ich Euch helfe.~
IF ~~ THEN EXTERN ~NQ#SHUK~ 16
END

IF ~~ THEN BEGIN 2
SAY ~Ja. Ihr könnt Vielauge sagen, dass ich Euch folgen werde und mit mir jeder Axtschwinger, der etwas wert ist.~
IF ~~ THEN DO ~SetGlobal("NQ#RAKI","GLOBAL",9) EraseJournalEntry(@70026) EraseJournalEntry(@70027) EraseJournalEntry(@70028) AddJournalEntry(@70029,QUEST) CreateCreature("NQ#GB14",[1638.1375],8) CreateCreature("NQ#GB14",[1762.1336],11) CreateCreature("NQ#GB14",[1971.1513],12)~ EXIT
END

IF ~~ THEN BEGIN 3
SAY ~Ja. Ihr könnt Vielauge sagen, dass ich Euch folgen werde und mit mir jeder Axtschwinger, der etwas wert ist.~
IF ~~ THEN DO ~SetGlobal("NQ#RAKI","GLOBAL",9) EraseJournalEntry(@70026) EraseJournalEntry(@70027) EraseJournalEntry(@70028) AddJournalEntry(@70035,QUEST) CreateCreature("NQ#GB14",[1638.1375],8) CreateCreature("NQ#GB14",[1762.1336],11) CreateCreature("NQ#GB14",[1971.1513],12)~ EXIT
END

IF ~Global("NQ#RAKI","GLOBAL",9)~ THEN BEGIN FINAL
SAY ~Bargrivyek ist mit Euch.~
IF ~~ THEN EXIT
END

IF ~Dead("NQ#DRV0") GlobalLT("NQ#RAKI","GLOBAL",9) See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN DRVO3
SAY ~Ich hab schon gehört was passiert ist. Nicht schlecht. Ich kenne keinen anderen Goblin der das geschafft hätte. Bargrivyek hat weise gewählt.~
IF ~~ THEN EXTERN ~NQ#SHUK~ 17
END

IF ~Global("NQ#RAKI","GLOBAL",666) See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN FAILQUEST
SAY ~Du hast es versaut! Bargrivyek will Deinen Kopf!~
IF ~~ THEN DO ~SetGlobal("NOBACK","LOCALS",1) SetGlobal("NQ#RAKI","GLOBAL",667) Enemy()~ EXIT
END

IF ~OR(2) GlobalLT("NQ#GOBLINCREW","GLOBAL",4) Global("NQ#GOBLINCREW","GLOBAL",50) !Name("NQ#SHUK",LastTalkedToBy)~ THEN BEGIN NOQUEST1
SAY ~Hau ab!~
IF ~~ THEN EXIT
END

IF ~OR(2) GlobalLT("NQ#GOBLINCREW","GLOBAL",4) Global("NQ#GOBLINCREW","GLOBAL",50) Name("NQ#SHUK",LastTalkedToBy)~ THEN BEGIN NOQUEST2
SAY ~Redet später mit mir!~
IF ~~ THEN EXIT
END

IF ~Global("NQ#RAKI","GLOBAL",0) GlobalGT("NQ#GOBLINCREW","GLOBAL",3) OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN NOSHUK
SAY ~Ich rede mit dem Goblin. Nicht mit Euch!~
IF ~~ THEN EXIT
END

IF ~Global("NQ#RAKI","GLOBAL",0) GlobalGT("NQ#GOBLINCREW","GLOBAL",3) See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN HISHUK1
SAY ~Shuk. Ihr seid gekommen. Rogdok ist tot und Bargrivyek ist fort. Vielauge ist also doch nicht ganz unfähig...~
IF ~~ THEN GOTO HISHUK2
END

IF ~~ THEN BEGIN HISHUK2
SAY ~Ich bin trotzdem nicht beeindruckt. Vielauge kann vielleicht einen Teil der Zukunft sehen, aber ich habe wahre Macht gesehen. Bargrivyeks Macht!~
IF ~~ THEN GOTO HISHUK3
END

IF ~~ THEN BEGIN HISHUK3
SAY ~Vielleicht seid Ihr seine Prüfung, ob ich den alten Göttern abgeschworen habe? Vielleicht sollte ich Euch erschlagen...~
IF ~~ THEN EXTERN ~NQ#SHUK~ 15
END

IF ~GlobalGT("NQ#RAKI","GLOBAL",0) GlobalLT("NQ#RAKI","GLOBAL",7) OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN DRVO1
SAY ~Ich habe Euch nichts zu sagen.~
IF ~~ THEN EXIT
END

IF ~GlobalGT("NQ#RAKI","GLOBAL",0) GlobalLT("NQ#RAKI","GLOBAL",7) !Dead("NQ#DRV1") See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN DRVO2
SAY ~Die Holzfäller sind im Westen. Geht zu Ihnen und treibt sie zur Arbeit. Wenn der Wald kommt, werden wir sehen was Bargrivyeks Wille ist.~
IF ~~ THEN EXIT
END

IF ~GlobalGT("NQ#RAKI","GLOBAL",9)~ THEN BEGIN GOSHUK
SAY ~Ihr seid Bargrivyeks Wille.~
IF ~~ THEN EXIT
END



