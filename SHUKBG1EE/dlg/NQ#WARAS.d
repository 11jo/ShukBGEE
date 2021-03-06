BEGIN NQ#WARAS

// Shuk

IF ~~ THEN BEGIN 0
SAY @0 /* Ihr sprecht große Worte, Goblin, aber habt Ihr auch die Stärke sie zu beweisen? */
IF ~OR (2) Global("NQ#WARASSPAWN","GLOBAL",1) Global("NQ#WARASSPAWN","GLOBAL",2)~ THEN DO ~~ GOTO EBR0A
IF ~Global("NQ#WARASSPAWN","GLOBAL",3)~ THEN DO ~~ GOTO EBR0B
END

IF ~~ THEN BEGIN 1
SAY @1 /* Ich habe seine Witterung. Stark. Furchtlos. Eine würdige Beute. */
IF ~Global("NQ#WARASSPAWN","GLOBAL",1)~ THEN DO ~SetGlobal("NQ#EBR01SPAWN","GLOBAL",1) CreateCreature("NQ#EBR01",[4401.1958],7)~ GOTO 2 	// Spawn Räuberlager aktiv
IF ~Global("NQ#WARASSPAWN","GLOBAL",2)~ THEN DO ~SetGlobal("NQ#EBR01SPAWN","GLOBAL",2) CreateCreature("NQ#EBR01",[4714.1822],6)~ GOTO 3 	// Spawn Tempel aktiv
IF ~Global("NQ#WARASSPAWN","GLOBAL",3)~ THEN DO ~SetGlobal("NQ#EBR01SPAWN","GLOBAL",3) CreateCreature("NQ#EBR01",[4213.3582],12)~ GOTO 4	// Spawn Leuchtturm aktiv
IF ~Global("NQ#WARASSPAWN","GLOBAL",4)~ THEN DO ~SetGlobal("NQ#EBR01SPAWN","GLOBAL",3) CreateCreature("NQ#EBR01",[4213.3582],12)~ GOTO 4	// Spawn SoD (noch nicht enthalten)
END

IF ~~ THEN BEGIN 2
SAY @2 /* Geht nach Nordosten. Verlasst Euch nicht auf Eure Pfeile, wenn Ihr Euch ihm stellt. Die Haut dieser Kreatur ist fester als Rinde. */
IF ~~ THEN DO ~~ EXTERN ~NQ#SHUK~ 3
END

IF ~~ THEN BEGIN 3
SAY @2 /* Geht nach Nordosten. Verlasst Euch nicht auf Eure Pfeile, wenn Ihr Euch ihm stellt. Die Haut dieser Kreatur ist fester als Rinde. */
IF ~~ THEN DO ~~  EXTERN ~NQ#SHUK~ 3
END

IF ~~ THEN BEGIN 4
SAY @3 /* Geht nach Südosten. Verlasst Euch nicht auf Eure Pfeile, wenn Ihr Euch ihm stellt. Die Haut dieser Kreatur ist fester als Rinde. */
IF ~~ THEN DO ~~  EXTERN ~NQ#SHUK~ 3
END

IF ~~ THEN BEGIN 5
SAY @4 /* Ja. Ihr seid stark, aber enttäuscht mich nicht. Zeigt Ihr Schwäche, werde ich Euch fressen! */
IF ~~ THEN DO ~TakePartyItem("NQ#EBR1")~  EXTERN ~NQ#SHUK~ 5
END

IF ~~ THEN BEGIN EBR0A
SAY @5 /* Wir waren auf der Jagd nach einem mächtigen Eber, aber als wir ihn fanden konnten ihn die Pfeile meines Reiters nicht verletzen. Sie machten ihn nur wütend. Er besiegte uns und wir entkamen nur mit letzter Kraft. Dann fanden uns die Menschen und fielen wie Ratten über uns her. */
IF ~~ THEN DO ~~ GOTO EBR0D
END

IF ~~ THEN BEGIN EBR0B
SAY @6 /* Wir waren auf der Jagd nach einem mächtigen Eber, aber als wir ihn fanden konnten ihn die Pfeile meines Reiters nicht verletzen. Sie machten ihn nur wütend. Er besiegte uns und wir entkamen nur mit letzter Kraft. Dann fanden uns die Gnolle und fielen wie Ratten über uns her. */
IF ~~ THEN DO ~~ GOTO EBR0D
END

IF ~~ THEN BEGIN EBR0C
SAY @7 /* Wir waren auf der Jagd nach einem mächtigen Eber, aber als wir ihn fanden konnten ihn die Pfeile meines Reiters nicht verletzen. Sie machten ihn nur wütend. Er besiegte uns und wir entkamen nur mit letzter Kraft. Dann fanden uns die Orks und fielen wie Ratten über uns her. */
IF ~~ THEN DO ~~ GOTO EBR0D
END

IF ~~ THEN BEGIN EBR0D
SAY @8 /* Beweist Eure Stärke, Goblin. Bringt mir das Herz des Ebers und ich werde Euch folgen! */
IF ~~ THEN DO ~~ EXTERN ~NQ#SHUK~ 2
END


IF ~Global("NQ#WARAS","GLOBAL",8) GlobalGT("NQ#EBR01SPAWN","GLOBAL",0) !PartyHasItem("NQ#EBR1")~ THEN BEGIN EBR1
SAY @9 /* Beeilt Euch, <RACE>. Wenn der Eber dieses Gebiet verlässt kann es Wochen dauern, bis ich seine Witterung finde. */
IF ~~ THEN DO ~~ EXIT
END

IF ~Global("NQ#WARAS","GLOBAL",8) GlobalGT("NQ#EBR01SPAWN","GLOBAL",0) PartyHasItem("NQ#EBR1") OR (2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN EBR2
SAY @10 /* <RACE>. Wo ist der Goblin, dert mir ein Herz versprochen hat? */
IF ~~ THEN DO ~~ EXIT
END

IF ~Global("NQ#WARAS","GLOBAL",8) GlobalGT("NQ#EBR01SPAWN","GLOBAL",0) PartyHasItem("NQ#EBR1") See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN BEGIN EBR3
SAY @11 /* Ahhrrr, ich rieche sein Blut! Gebt mir das Herz der Kreatur. */
IF ~~ THEN EXTERN ~NQ#SHUK~ 4
END

// Erster Dialog

IF ~Global("NQ#WARAS","GLOBAL",1)~ THEN BEGIN HI1
SAY @12 /* Grrrr! Verschwindet, <RACE>. Lasst Waras in Frieden sterben! */
IF ~~ THEN REPLY @13 /* Kann ich Euch helfen, Worg? */ DO ~~ GOTO GOOD
IF ~~ THEN REPLY @14 /* Wer hat Euch so zugerichtet? */ DO ~~ GOTO ASK1
IF ~~ THEN REPLY @15 /* Warum könnt Ihr sprechen? */ DO ~~ GOTO ASK1
IF ~~ THEN REPLY @16 /* Ich denke Ihr werdet ehr unfriedlich sterben. Jetzt! */ DO ~~ GOTO BAD1
IF ~~ THEN REPLY @17 /* Ok, lebt wohl! */ DO ~SetGlobal("NQ#WARAS","GLOBAL",2) AddJournalEntry(@70006,QUEST)~ GOTO EGAL1
END

IF ~~ THEN BEGIN GOOD
SAY @18 /* Warum... grrr... solltet Ihr, <RACE>. Ihr... kennt mich nicht. */
IF ~NumInPartyGT(1) !Global("NQ#WARAS","GLOBAL",2) !Global("NQ#WARAS","GLOBAL",3)~ THEN REPLY @19 /* Ihr braucht offensichtlich Heilung. Haltet still und wir werden Euch heilen. */ DO ~SetGlobal("NQ#WARAS","GLOBAL",3) AddJournalEntry(@70007,QUEST)~ EXIT
IF ~NumInParty(1) !Global("NQ#WARAS","GLOBAL",2) !Global("NQ#WARAS","GLOBAL",3)~ THEN REPLY @20 /* Ihr braucht offensichtlich Heilung. Haltet still und ich werde Euch heilen. */ DO ~SetGlobal("NQ#WARAS","GLOBAL",3) AddJournalEntry(@70007,QUEST)~ EXIT
IF ~NumInPartyGT(1) OR(2) Global("NQ#WARAS","GLOBAL",2) Global("NQ#WARAS","GLOBAL",3)~ THEN REPLY @19 /* Ihr braucht offensichtlich Heilung. Haltet still und wir werden Euch heilen. */ DO ~SetGlobal("NQ#WARAS","GLOBAL",3)~ EXIT
IF ~NumInParty(1) OR(2) Global("NQ#WARAS","GLOBAL",2) Global("NQ#WARAS","GLOBAL",3)~ THEN REPLY @20 /* Ihr braucht offensichtlich Heilung. Haltet still und ich werde Euch heilen. */ DO ~SetGlobal("NQ#WARAS","GLOBAL",3)~ EXIT
IF ~PartyHasItem("POTN08") GlobalGT("NQ#WARAS","GLOBAL",1) GlobalLT("NQ#WARAS","GLOBAL",4)~ THEN REPLY @21 /* Hier trinkt diesen Heiltrank! */ DO ~DestroyItem("POTN08") AddJournalEntry(@70008,QUEST) SetGlobal("NQ#WARAS","GLOBAL",4)~ EXIT
IF ~PartyHasItem("POTN52") GlobalGT("NQ#WARAS","GLOBAL",1) GlobalLT("NQ#WARAS","GLOBAL",4)~ THEN REPLY @22 /* Hier trinkt diesen konzentrierten Heiltrank */ DO ~DestroyItem("POTN52") AddJournalEntry(@70008,QUEST) SetGlobal("NQ#WARAS","GLOBAL",4)~ EXIT
IF ~PartyHasItem("POTN55") GlobalGT("NQ#WARAS","GLOBAL",1) GlobalLT("NQ#WARAS","GLOBAL",4)~ THEN REPLY @23 /* Hier trinkt diesen extrastarken Heiltrank */ DO ~DestroyItem("POTN55") AddJournalEntry(@70008,QUEST) SetGlobal("NQ#WARAS","GLOBAL",4)~ EXIT
IF ~PartyHasItem("POTN08") Global("NQ#WARAS","GLOBAL",1)~ THEN REPLY @21 /* Hier trinkt diesen Heiltrank! */ DO ~DestroyItem("POTN08") AddJournalEntry(@70009,QUEST) SetGlobal("NQ#WARAS","GLOBAL",4)~ EXIT
IF ~PartyHasItem("POTN52") Global("NQ#WARAS","GLOBAL",1)~ THEN REPLY @22 /* Hier trinkt diesen konzentrierten Heiltrank */ DO ~DestroyItem("POTN52") AddJournalEntry(@70009,QUEST) SetGlobal("NQ#WARAS","GLOBAL",4)~ EXIT
IF ~PartyHasItem("POTN55") Global("NQ#WARAS","GLOBAL",1)~ THEN REPLY @23 /* Hier trinkt diesen extrastarken Heiltrank */ DO ~DestroyItem("POTN55") AddJournalEntry(@70009,QUEST) SetGlobal("NQ#WARAS","GLOBAL",4)~ EXIT
IF ~~ THEN REPLY @24 /* Kein Problem. Ich erlöse Euch gerne von Eurem Leiden, elender Worg! */ DO ~~ GOTO BAD1
IF ~!Global("NQ#WARAS","GLOBAL",2) !Global("NQ#WARAS","GLOBAL",3)~ THEN REPLY @25 /* Stimmt. Lebt wohl! */ DO ~SetGlobal("NQ#WARAS","GLOBAL",2) AddJournalEntry(@70006,QUEST)~ EXIT
IF ~OR(2) Global("NQ#WARAS","GLOBAL",2) Global("NQ#WARAS","GLOBAL",3)~ THEN REPLY @25 /* Stimmt. Lebt wohl! */ DO ~SetGlobal("NQ#WARAS","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN ASK1
SAY @26 /* Kein... Geplauder... <RACE>. Verschwindet! */
IF ~~ THEN REPLY @13 /* Kann ich Euch helfen, Worg? */ DO ~~ GOTO GOOD
IF ~~ THEN REPLY @27 /* Dann erschlage ich Euch eben direkt! */ DO ~~ GOTO BAD1
IF ~!Global("NQ#WARAS","GLOBAL",2) !Global("NQ#WARAS","GLOBAL",3)~ THEN REPLY @17 /* Ok, lebt wohl! */ DO ~SetGlobal("NQ#WARAS","GLOBAL",2) AddJournalEntry(@70006,QUEST)~ GOTO EGAL1
IF ~OR(2) Global("NQ#WARAS","GLOBAL",2) Global("NQ#WARAS","GLOBAL",3)~ THEN REPLY @17 /* Ok, lebt wohl! */ DO ~SetGlobal("NQ#WARAS","GLOBAL",2) AddJournalEntry(@70006,QUEST)~ GOTO EGAL1
END

IF ~~ THEN BEGIN BAD1
SAY @28 /* Grrrrr... kommt nur... Aasfresser! */
IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ THEN BEGIN BAD2
SAY @29 /* Ich werde Eure Rasse nie verstehen, <RACE>. Grrrrr! */
IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ THEN BEGIN EGAL1
SAY @30 /* Ich... danke Euch. */
IF ~~ THEN EXIT
END

// 2 Dialog (ohne Zusage)

IF ~Global("NQ#WARAS","GLOBAL",2)~ THEN BEGIN HIAGAIN
SAY @31 /* <RACE>... lasst mich in Ruhe. */
IF ~~ THEN REPLY @13 /* Kann ich Euch helfen, Worg? */ DO ~~ GOTO GOOD
IF ~~ THEN REPLY @14 /* Wer hat Euch so zugerichtet? */ DO ~~ GOTO ASK1
IF ~~ THEN REPLY @15 /* Warum könnt Ihr sprechen? */ DO ~~ GOTO ASK1
IF ~~ THEN REPLY @32 /* Ich werde diese Welt von Euch befreien! */ DO ~~ GOTO BAD1
IF ~~ THEN REPLY @17 /* Ok, lebt wohl! */ DO ~~ EXIT
END

// 2 Dialog (Zusage)

IF ~Global("NQ#WARAS","GLOBAL",3)~ THEN BEGIN HIAGAIN
SAY @33 /* <RACE>... heilt mich... oder lasst mich in Ruhe. */
IF ~PartyHasItem("POTN08") GlobalGT("NQ#WARAS","GLOBAL",1) GlobalLT("NQ#WARAS","GLOBAL",4)~ THEN REPLY @21 /* Hier trinkt diesen Heiltrank! */ DO ~DestroyItem("POTN08") AddJournalEntry(@70008,QUEST) SetGlobal("NQ#WARAS","GLOBAL",4)~ EXIT
IF ~PartyHasItem("POTN52") GlobalGT("NQ#WARAS","GLOBAL",1) GlobalLT("NQ#WARAS","GLOBAL",4)~ THEN REPLY @22 /* Hier trinkt diesen konzentrierten Heiltrank */ DO ~DestroyItem("POTN52") AddJournalEntry(@70008,QUEST) SetGlobal("NQ#WARAS","GLOBAL",4)~ EXIT
IF ~PartyHasItem("POTN55") GlobalGT("NQ#WARAS","GLOBAL",1) GlobalLT("NQ#WARAS","GLOBAL",4)~ THEN REPLY @23 /* Hier trinkt diesen extrastarken Heiltrank */ DO ~DestroyItem("POTN55") AddJournalEntry(@70008,QUEST) SetGlobal("NQ#WARAS","GLOBAL",4)~ EXIT
IF ~PartyHasItem("POTN08") Global("NQ#WARAS","GLOBAL",1)~ THEN REPLY @21 /* Hier trinkt diesen Heiltrank! */ DO ~DestroyItem("POTN08") AddJournalEntry(@70009,QUEST) SetGlobal("NQ#WARAS","GLOBAL",4)~ EXIT
IF ~PartyHasItem("POTN52") Global("NQ#WARAS","GLOBAL",1)~ THEN REPLY @22 /* Hier trinkt diesen konzentrierten Heiltrank */ DO ~DestroyItem("POTN52") AddJournalEntry(@70009,QUEST) SetGlobal("NQ#WARAS","GLOBAL",4)~ EXIT
IF ~PartyHasItem("POTN55") Global("NQ#WARAS","GLOBAL",1)~ THEN REPLY @23 /* Hier trinkt diesen extrastarken Heiltrank */ DO ~DestroyItem("POTN55") AddJournalEntry(@70009,QUEST) SetGlobal("NQ#WARAS","GLOBAL",4)~ EXIT
IF ~~ THEN REPLY @32 /* Ich werde diese Welt von Euch befreien! */ DO ~~ GOTO BAD1
IF ~~ THEN REPLY @34 /* Lebt wohl! */ DO ~~ EXIT
END

// Dialog nach Heilung

IF ~GlobalGT("NQ#WARAS","GLOBAL",4) GlobalLT("NQ#WARAS","GLOBAL",7)~ THEN BEGIN THANKS1
SAY @35 /* Ihr habt mir geholfen, <RACE>. Ich werde es nicht vergessen. */
IF ~See("NQ#NARTZ")~ THEN DO ~SetGlobal("NQ#WARAS","GLOBAL",7) AddexperienceParty(100)~ GOTO THANKS2
IF ~!See("NQ#NARTZ")~ THEN DO ~SetGlobal("NQ#WARAS","GLOBAL",7) AddexperienceParty(100)~ GOTO THANKS3
END

IF ~~ THEN BEGIN THANKS2
SAY @36 /* Mein Reiter ist tot. Ich werde hier um ihn trauern und ihn verspeisen. */
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @37 /* Ich wüsste vielleicht einen neuen Goblinreiter für Euch... */ DO ~SetGlobal("NQ#WARAS","GLOBAL",8)~ EXTERN ~NQ#SHUK~ 0
IF ~OR (2) Global("NQ#WARASSPAWN","GLOBAL",1) Global("NQ#WARASSPAWN","GLOBAL",2)~ THEN REPLY @38 /* Wer hat Euch eigentlich so zugerichtet? */ DO ~~ GOTO BANDIT
IF ~Global("NQ#WARASSPAWN","GLOBAL",3)~ THEN REPLY @38 /* Wer hat Euch eigentlich so zugerichtet? */ DO ~~ GOTO GNOLL
IF ~Global("NQ#WARASSPAWN","GLOBAL",4)~ THEN REPLY @38 /* Wer hat Euch eigentlich so zugerichtet? */ DO ~~ GOTO ORK
IF ~~ THEN REPLY @39 /* Warum könnt Ihr eigentlich sprechen? */ DO ~~ GOTO ASK3
IF ~~ THEN REPLY @40 /* Wer war Euer Reiter? */ DO ~~ GOTO ASK4
IF ~~ THEN REPLY @41 /* Bah! Eckelhaftes Monster! Ich werde diese Welt von Euch befreien! */ DO ~~ GOTO BAD2
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @34 /* Lebt wohl! */ DO ~SetGlobal("NQ#WARAS","GLOBAL",8)~ EXTERN ~NQ#SHUK~ 0
IF ~OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @34 /* Lebt wohl! */ DO ~~ EXIT
END

IF ~~ THEN BEGIN THANKS3
SAY @42 /* Mein Reiter ist tot. Ich werde hier um ihn trauern, während ich ihn verdaue. */
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @37 /* Ich wüsste vielleicht einen neuen Goblinreiter für Euch... */ DO ~SetGlobal("NQ#WARAS","GLOBAL",8)~ EXTERN ~NQ#SHUK~ 0
IF ~OR (2) Global("NQ#WARASSPAWN","GLOBAL",1) Global("NQ#WARASSPAWN","GLOBAL",2)~ THEN REPLY @38 /* Wer hat Euch eigentlich so zugerichtet? */ DO ~~ GOTO BANDIT
IF ~Global("NQ#WARASSPAWN","GLOBAL",3)~ THEN REPLY @38 /* Wer hat Euch eigentlich so zugerichtet? */ DO ~~ GOTO GNOLL
IF ~Global("NQ#WARASSPAWN","GLOBAL",4)~ THEN REPLY @38 /* Wer hat Euch eigentlich so zugerichtet? */ DO ~~ GOTO ORK
IF ~~ THEN REPLY @39 /* Warum könnt Ihr eigentlich sprechen? */ DO ~~ GOTO ASK3
IF ~~ THEN REPLY @40 /* Wer war Euer Reiter? */ DO ~~ GOTO ASK4
IF ~~ THEN REPLY @41 /* Bah! Eckelhaftes Monster! Ich werde diese Welt von Euch befreien! */ DO ~~ GOTO BAD2
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @34 /* Lebt wohl! */ DO ~SetGlobal("NQ#WARAS","GLOBAL",8)~ EXTERN ~NQ#SHUK~ 0
IF ~OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @34 /* Lebt wohl! */ DO ~~ EXIT
END

IF ~~ THEN BEGIN BANDIT
SAY @43 /* Eine Gruppe der Banditen... Ich konnte sie töten, aber sie haben meinen Reiter erwischt und ihr Anfüher hat mich schwer getroffen, bevor ich seine Kehle zerrissen habe. */
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @37 /* Ich wüsste vielleicht einen neuen Goblinreiter für Euch... */ DO ~SetGlobal("NQ#WARAS","GLOBAL",8)~ EXTERN ~NQ#SHUK~ 0
IF ~~ THEN REPLY @39 /* Warum könnt Ihr eigentlich sprechen? */ DO ~~ GOTO ASK3
IF ~~ THEN REPLY @40 /* Wer war Euer Reiter? */ DO ~~ GOTO ASK4
IF ~~ THEN REPLY @32 /* Ich werde diese Welt von Euch befreien! */ DO ~~ GOTO BAD2
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @34 /* Lebt wohl! */ DO ~SetGlobal("NQ#WARAS","GLOBAL",8)~ EXTERN ~NQ#SHUK~ 0
IF ~OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @34 /* Lebt wohl! */ DO ~~ EXIT
END

IF ~~ THEN BEGIN ORK
SAY @44 /* Eine Gruppe der Orks... Ich konnte sie töten, aber sie haben meinen Reiter erwischt und ihr Anfüher hat mich schwer getroffen, bevor ich seine Kehle zerrissen habe. */
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @37 /* Ich wüsste vielleicht einen neuen Goblinreiter für Euch... */ DO ~SetGlobal("NQ#WARAS","GLOBAL",8)~ EXTERN ~NQ#SHUK~ 0
IF ~~ THEN REPLY @39 /* Warum könnt Ihr eigentlich sprechen? */ DO ~~ GOTO ASK3
IF ~~ THEN REPLY @40 /* Wer war Euer Reiter? */ DO ~~ GOTO ASK4
IF ~~ THEN REPLY @32 /* Ich werde diese Welt von Euch befreien! */ DO ~~ GOTO BAD2
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @34 /* Lebt wohl! */ DO ~SetGlobal("NQ#WARAS","GLOBAL",8)~ EXTERN ~NQ#SHUK~ 0
IF ~OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @34 /* Lebt wohl! */ DO ~~ EXIT
END

IF ~~ THEN BEGIN GNOLL
SAY @45 /* Eine Rotte Gnolle... Ich konnte sie töten, aber mein Reiter ist tot und ihr Anfüher hat mich schwer getroffen, bevor ich seine Kehle zerrissen habe. */
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @37 /* Ich wüsste vielleicht einen neuen Goblinreiter für Euch... */ DO ~SetGlobal("NQ#WARAS","GLOBAL",8)~ EXTERN ~NQ#SHUK~ 0
IF ~~ THEN REPLY @39 /* Warum könnt Ihr eigentlich sprechen? */ DO ~~ GOTO ASK3
IF ~~ THEN REPLY @40 /* Wer war Euer Reiter? */ DO ~~ GOTO ASK4
IF ~~ THEN REPLY @32 /* Ich werde diese Welt von Euch befreien! */ DO ~~ GOTO BAD2
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @34 /* Lebt wohl! */ DO ~SetGlobal("NQ#WARAS","GLOBAL",8)~ EXTERN ~NQ#SHUK~ 0
IF ~OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @34 /* Lebt wohl! */ DO ~~ EXIT
END

IF ~~ THEN BEGIN ASK3
SAY @46 /* Ich bin ein Worg und kein dummer Wolf, <RACE>. */
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @37 /* Ich wüsste vielleicht einen neuen Goblinreiter für Euch... */ DO ~SetGlobal("NQ#WARAS","GLOBAL",8)~ EXTERN ~NQ#SHUK~ 0
IF ~OR (2) Global("NQ#WARASSPAWN","GLOBAL",1) Global("NQ#WARASSPAWN","GLOBAL",2)~ THEN REPLY @38 /* Wer hat Euch eigentlich so zugerichtet? */ DO ~~ GOTO BANDIT
IF ~Global("NQ#WARASSPAWN","GLOBAL",3)~ THEN REPLY @38 /* Wer hat Euch eigentlich so zugerichtet? */ DO ~~ GOTO GNOLL
IF ~Global("NQ#WARASSPAWN","GLOBAL",4)~ THEN REPLY @38 /* Wer hat Euch eigentlich so zugerichtet? */ DO ~~ GOTO ORK
IF ~~ THEN REPLY @40 /* Wer war Euer Reiter? */ DO ~~ GOTO ASK4
IF ~~ THEN REPLY @32 /* Ich werde diese Welt von Euch befreien! */ DO ~~ GOTO BAD2
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @34 /* Lebt wohl! */ DO ~SetGlobal("NQ#WARAS","GLOBAL",8)~ EXTERN ~NQ#SHUK~ 0
IF ~OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @34 /* Lebt wohl! */ DO ~~ EXIT
END

IF ~~ THEN BEGIN ASK4
SAY @47 /* Sein Name war Nartz. Er war ein Späher, schlau und stark für einen Goblin. Grrrr... nicht schlau und stark genug. */
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @37 /* Ich wüsste vielleicht einen neuen Goblinreiter für Euch... */ DO ~SetGlobal("NQ#WARAS","GLOBAL",8)~ EXTERN ~NQ#SHUK~ 0
IF ~OR (2) Global("NQ#WARASSPAWN","GLOBAL",1) Global("NQ#WARASSPAWN","GLOBAL",2)~ THEN REPLY @38 /* Wer hat Euch eigentlich so zugerichtet? */ DO ~~ GOTO BANDIT
IF ~Global("NQ#WARASSPAWN","GLOBAL",3)~ THEN REPLY @38 /* Wer hat Euch eigentlich so zugerichtet? */ DO ~~ GOTO GNOLL
IF ~Global("NQ#WARASSPAWN","GLOBAL",4)~ THEN REPLY @38 /* Wer hat Euch eigentlich so zugerichtet? */ DO ~~ GOTO ORK
IF ~~ THEN REPLY @39 /* Warum könnt Ihr eigentlich sprechen? */ DO ~~ GOTO ASK3
IF ~~ THEN REPLY @32 /* Ich werde diese Welt von Euch befreien! */ DO ~~ GOTO BAD2
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @34 /* Lebt wohl! */ DO ~SetGlobal("NQ#WARAS","GLOBAL",8)~ EXTERN ~NQ#SHUK~ 0
IF ~OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @34 /* Lebt wohl! */ DO ~~ EXIT
END

IF ~Global("NQ#WARAS","GLOBAL",7)~ THEN BEGIN HI2
SAY @48 /* <RACE>. Was wollt Ihr? */
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @37 /* Ich wüsste vielleicht einen neuen Goblinreiter für Euch... */ DO ~SetGlobal("NQ#WARAS","GLOBAL",8)~ EXTERN ~NQ#SHUK~ 0
IF ~OR (2) Global("NQ#WARASSPAWN","GLOBAL",1) Global("NQ#WARASSPAWN","GLOBAL",2)~ THEN REPLY @38 /* Wer hat Euch eigentlich so zugerichtet? */ DO ~~ GOTO BANDIT
IF ~Global("NQ#WARASSPAWN","GLOBAL",3)~ THEN REPLY @38 /* Wer hat Euch eigentlich so zugerichtet? */ DO ~~ GOTO GNOLL
IF ~Global("NQ#WARASSPAWN","GLOBAL",4)~ THEN REPLY @38 /* Wer hat Euch eigentlich so zugerichtet? */ DO ~~ GOTO ORK
IF ~~ THEN REPLY @39 /* Warum könnt Ihr eigentlich sprechen? */ DO ~~ GOTO ASK3
IF ~~ THEN REPLY @40 /* Wer war Euer Reiter? */ DO ~~ GOTO ASK4
IF ~~ THEN REPLY @32 /* Ich werde diese Welt von Euch befreien! */ DO ~~ GOTO BAD2
IF ~See("NQ#SHUK") !StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @34 /* Lebt wohl! */ DO ~SetGlobal("NQ#WARAS","GLOBAL",8)~ EXTERN ~NQ#SHUK~ 0
IF ~OR(2) !See("NQ#SHUK") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN REPLY @34 /* Lebt wohl! */ DO ~~ EXIT
END



