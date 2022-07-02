BEGIN NQ#GB28

//

IF ~Name("NQ#SHUK",LastTalkedToBy) Global("NQ#SHUKSPALACE","GLOBAL",0)~ THEN BEGIN SERVICE1A
SAY @0 /* Maglubiyet ist mit Dir! */
IF ~~ THEN DO ~~ EXIT
END

IF ~!Name("NQ#SHUK",LastTalkedToBy) Global("NQ#SHUKSPALACE","GLOBAL",0)~ THEN BEGIN SERVICE1A
SAY @1 /* Ihr solltet erst mit Narthag sprechen. Shuk hat ihm hier das Sagen gegeben. */
IF ~~ THEN DO ~~ EXIT
END

//

IF ~Name("NQ#SHUK",LastTalkedToBy) Global("NQ#QUEST","LOCALS",1)~ THEN BEGIN DEADOG1
SAY @2 /* Der fremde Wille ist fort! Sehr gut, Häuptling, jetzt müssen sich die Aaskriecher nur noch unserem Willen beugen... */
IF ~~ THEN DO ~SetGlobal("NQ#QUEST","LOCALS",2) AddJournalEntry(@70052,QUEST_DONE) EraseJournalEntry(@70051) AddexperienceParty(100)~ GOTO SERVICE1B
END


IF ~!Name("NQ#SHUK",LastTalkedToBy) Global("NQ#QUEST","LOCALS",1)~ THEN BEGIN DEADOG2
SAY @3 /* Der fremde Wille ist fort! Gut, <RACE>, jetzt müssen sich die Aaskriecher nur noch unserem Willen beugen... */
IF ~~ THEN DO ~SetGlobal("NQ#QUEST","LOCALS",2) AddJournalEntry(@70052,QUEST_DONE) EraseJournalEntry(@70051) AddexperienceParty(100)~ GOTO SERVICE2B
END

//

IF ~Name("NQ#SHUK",LastTalkedToBy) Global("NQ#CARRIO","GLOBAL",5)~ THEN BEGIN DEADCAR2
SAY @4 /* Die Bullen sind erledigt? Fein, dann wird der Rest bald mein... ähm Dein sein! */
IF ~~ THEN DO ~SetGlobal("NQ#CARRIO","GLOBAL",6) AddJournalEntry(@70050,QUEST_DONE) EraseJournalEntry(@70048) EraseJournalEntry(@70049) AddexperienceParty(500)~ EXIT
END


IF ~!Name("NQ#SHUK",LastTalkedToBy) Global("NQ#CARRIO","GLOBAL",5)~ THEN BEGIN DEADCAR2
SAY @5 /* Die Bullen sind erledigt? Fein, dann wird der Rest bald mein... ähm unser sein! */
IF ~~ THEN DO ~SetGlobal("NQ#CARRIO","GLOBAL",6) AddJournalEntry(@70050,QUEST_DONE) EraseJournalEntry(@70048) EraseJournalEntry(@70049) AddexperienceParty(500)~ EXIT
END

//

IF ~Name("NQ#SHUK",LastTalkedToBy) GlobalGT("NQ#SHUKSPALACE","GLOBAL",0) Global("SHAMAN","LOCALS",0)~  THEN BEGIN SHAMAN1
SAY @6 /* Auserwählter, wenn Du ein Lager oder Heilung brauchst, kümmere ich mich d'rum. */
IF ~~ THEN DO ~SetGlobal("SHAMAN","LOCALS",1)~ GOTO SERVICE1B
END 

IF ~!Name("NQ#SHUK",LastTalkedToBy) GlobalGT("NQ#SHUKSPALACE","GLOBAL",0) Global("SHAMAN","LOCALS",0)~  THEN BEGIN SHAMAN2
SAY @7 /* Ich bin Rastak, Diener des Hohen Häuptlings und Schüler von Vielauge. */
IF ~~ THEN DO ~SetGlobal("SHAMAN","LOCALS",1)~ GOTO SHAMAN3
END

IF ~~  THEN BEGIN SHAMAN3
SAY @8 /* Wenn Ihr ein Lager oder Heilung braucht, kümmere ich mich d'rum. Bis Shuk mir was anderes befiehlt... */
IF ~~ THEN DO ~SetGlobal("SHAMAN","LOCALS",1)~ GOTO SERVICE2B
END

//

IF ~Name("NQ#SHUK",LastTalkedToBy) GlobalGT("NQ#SHUKSPALACE","GLOBAL",0) GlobalGT("SHAMAN","LOCALS",0) RandomNum(2,1)~ THEN BEGIN SERVICE1A
SAY @9 /* Häuptling, was gibt es? */
IF ~GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",3) Global("NQ#QUEST","LOCALS",0)~ THEN REPLY @10 /* Wie kommst Du voran? */ DO ~~ GOTO QUEST1
IF ~GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",3) Global("NQ#QUEST","LOCALS",2)~ THEN REPLY @10 /* Wie kommst Du voran? */ DO ~~ GOTO QUEST3
IF ~HPPercentLT(LastTalkedToBy(Myself),100)~ THEN REPLY @11 /* Heil mich! */ DO ~~ GOTO STORE2B
IF ~~ THEN REPLY @12 /* Nichts! */ DO ~~ EXIT
END

IF ~Name("NQ#SHUK",LastTalkedToBy) GlobalGT("NQ#SHUKSPALACE","GLOBAL",0) GlobalGT("SHAMAN","LOCALS",0) RandomNum(2,2)~ THEN BEGIN SERVICE1B
SAY @13 /* Brauchst Du was? */
IF ~GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",3) Global("NQ#QUEST","LOCALS",0)~ THEN REPLY @10 /* Wie kommst Du voran? */ DO ~~ GOTO QUEST1
IF ~GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",3) Global("NQ#QUEST","LOCALS",2)~ THEN REPLY @10 /* Wie kommst Du voran? */ DO ~~ GOTO QUEST3
IF ~HPPercentLT(LastTalkedToBy(Myself),100)~ THEN REPLY @11 /* Heil mich! */ DO ~~ GOTO STORE2B
IF ~~ THEN REPLY @12 /* Nichts! */ DO ~~ EXIT
END

IF ~!Name("NQ#SHUK",LastTalkedToBy) GlobalGT("NQ#SHUKSPALACE","GLOBAL",0) GlobalGT("SHAMAN","LOCALS",0) RandomNum(2,1)~ THEN BEGIN SERVICE2A
SAY @14 /* Was wollt Ihr? */
IF ~GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",3) Global("NQ#QUEST","LOCALS",0)~ THEN REPLY @15 /* Was ist Eure Aufgabe hier? */ DO ~~ GOTO QUEST1
IF ~GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",3) Global("NQ#QUEST","LOCALS",2)~ THEN REPLY @16 /* Wie kommt Ihr voran? */ DO ~~ GOTO QUEST3
IF ~~ THEN REPLY @17 /* Wir wollen uns ausruhen. */ DO ~~ GOTO STORE1
IF ~~ THEN REPLY @18 /* Könnt Ihr uns heilen? */ DO ~~ GOTO STORE2
IF ~~ THEN REPLY @19 /* Nichts. Lebt wohl. */ DO ~~ EXIT
END

IF ~!Name("NQ#SHUK",LastTalkedToBy) GlobalGT("NQ#SHUKSPALACE","GLOBAL",0) GlobalGT("SHAMAN","LOCALS",0) RandomNum(2,2)~ THEN BEGIN SERVICE2B
SAY @20 /* Wollt Ihr was? */
IF ~GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",3) Global("NQ#QUEST","LOCALS",0)~ THEN REPLY @15 /* Was ist Eure Aufgabe hier? */ DO ~~ GOTO QUEST1
IF ~GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",3) Global("NQ#QUEST","LOCALS",2)~ THEN REPLY @16 /* Wie kommt Ihr voran? */ DO ~~ GOTO QUEST3
IF ~~ THEN REPLY @17 /* Wir wollen uns ausruhen. */ DO ~~ GOTO STORE1
IF ~~ THEN REPLY @18 /* Könnt Ihr uns heilen? */ DO ~~ GOTO STORE2
IF ~~ THEN REPLY @19 /* Nichts. Lebt wohl. */ DO ~~ EXIT
END

IF ~~ THEN BEGIN STORE1
SAY @21 /* Dann sucht Euch eine Ecke. Solange Ihr Shuk dient, seid Ihr hier sicher... */
IF ~~ THEN DO ~StartStore("NQ#GB28A",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN BEGIN STORE1A
SAY @22 /* Ich werde über Dich wachen. */
IF ~~ THEN DO ~StartStore("NQ#GB28A",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN BEGIN STORE1B
SAY @23 /* Ich habe schon einen Platz vorbereitet, Unsterblicher. */
IF ~~ THEN DO ~ActionOverride(Player1,Rest()) ActionOverride(Player2,Rest()) ActionOverride(Player3,Rest()) ActionOverride(Player4,Rest()) ActionOverride(Player5,Rest()) ActionOverride(Player6,Rest()) ActionOverride("NQ#SHUK",Rest()) StartMovie("RESTDUNG") AdvanceTime(EIGHT_HOURS)~ EXIT
END

IF ~~ THEN BEGIN STORE2
SAY @24 /* Ich kenne ein paar Zauber, aber der Mächtige hat mich erst vor Kurzem erwählt. */
IF ~~ THEN DO ~StartStore("NQ#GB28B",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN BEGIN STORE2A
SAY @25 /* Auf Deinen Befehl, würde ich sogar die unwürdigsten Kreaturen heilen. */
IF ~~ THEN DO ~~ GOTO STORE2
END

IF ~~ THEN BEGIN STORE2B
SAY @26 /* Wie Du willst! */
IF ~~ THEN DO ~ReallyForceSpell("NQ#SHUK",CLERIC_CURE_LIGHT_WOUNDS) Wait(1) ReallyForceSpell("NQ#SHUK",CLERIC_CURE_LIGHT_WOUNDS) Wait(1) ReallyForceSpell("NQ#SHUK",CLERIC_CURE_LIGHT_WOUNDS)~ EXIT
END

IF ~~ THEN BEGIN QUEST1
SAY @27 /* Ich soll mich um die Unterwerfung der Aaskriecher kümmern. */
IF ~Dead("SEWEROGRE")~ THEN DO ~~ GOTO QUEST3A
IF ~!Dead("SEWEROGRE")~ THEN DO ~~ GOTO QUEST4A
END

IF ~~ THEN BEGIN QUEST3
SAY @28 /* Ihr Hunger ist der Schlüssel. Mit Futter kann man die Aaskreicher kontrollieren, aber sie müssen sie, dass wir nicht das Futter sind! */
IF ~~ THEN DO ~~ GOTO QUEST3B
END

IF ~~ THEN BEGIN QUEST3A
SAY @29 /* Sie sind dumm und immer hungrig. Mit Futter kann man sie kontrollieren, aber sie müssen lernen, dass wir nicht das Futter sind! */
IF ~~ THEN DO ~~ GOTO QUEST3B
END

IF ~~ THEN BEGIN QUEST3B
SAY @30 /* Wir konnten unsere Gänge bisher gut gegen sie halten und sie lernen sich fernzuhalten, aber natürlich sind ein paar der Jungs dabei draufgegangen. */
IF ~~ THEN DO ~~ GOTO QUEST3C
END

IF ~~ THEN BEGIN QUEST3C
SAY @31 /* Die drei zähsten Biester konnten entkommen. Sie haben unser Blut geschmeckt und müssen sterben, aber wenn ich wen hinterhergeschickt hätte, wären die Trottel auch nur gefressen worden. */
IF ~Name("NQ#SHUK",LastTalkedToBy)~ THEN DO ~SetGlobal("NQ#QUEST","LOCALS",3)~ GOTO QUEST5A
IF ~!Name("NQ#SHUK",LastTalkedToBy) NumInPartyGT(2)~ THEN DO ~SetGlobal("NQ#QUEST","LOCALS",3)~ GOTO QUEST5B
IF ~!Name("NQ#SHUK",LastTalkedToBy) NumInPartyLT(3)~ THEN DO ~SetGlobal("NQ#QUEST","LOCALS",3)~ GOTO QUEST5C
END

IF ~~ THEN BEGIN QUEST4A
SAY @32 /* Sie sind dumm und immer hungrig, aber hinter Ihnen steht ein stärkerer Wille. Ich weiß, dass sein Ursprung irgendwo in den östlichen Gängen liegt. */
IF ~~ THEN GOTO QUEST4B
END

IF ~~ THEN BEGIN QUEST4B
SAY @33 /* Dreckigerweise leben dort die meisten Mistviecher und ich darf sie nicht zu sehr an den Geschmack von Goblinfleisch gewöhnen. */
IF ~~ THEN DO ~AddJournalEntry(@70051,QUEST) SetGlobal("NQ#QUEST","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN QUEST5A
SAY @34 /* Wirst du sie töten, Unsterblicher? Ich konnte sie mit einem Zauber markieren, bevor sie zurück nach Osten geflohen sind und nur Ihr seid stark genug sie zu vernichten ohne das noch mehr der Veicher unser Blut schmecken. */
IF ~~ THEN DO ~AddJournalEntry(@70048,QUEST) SetGlobal("NQ#CARRIO","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN QUEST5B
SAY @35 /* Wirst du sie töten, <RACE>? Ich konnte sie mit einem Zauber markieren, bevor sie zurück nach Osten geflohen sind. Wenn sie ein paar von Euren Leuten fressen ist das nicht so schlimm, wie wenn sich noch mehr an unseren Geschmack gewöhnen... */
IF ~~ THEN DO ~AddJournalEntry(@70048,QUEST) SetGlobal("NQ#CARRIO","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN QUEST5C
SAY @36 /* Wirst du sie töten, <RACE>? Ich konnte sie mit einem Zauber markieren, bevor sie zurück nach Osten geflohen sind. Wenn sie ein Stück von Euch abbeißen ist das nicht so schlimm, wie wenn sich noch mehr an unseren Geschmack gewöhnen... */
IF ~~ THEN DO ~AddJournalEntry(@70048,QUEST) SetGlobal("NQ#CARRIO","GLOBAL",1)~ EXIT
END

