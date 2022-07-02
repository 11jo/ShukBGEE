// Global("NQ#SALVA","GLOBAL",0)	// Nicht gesprochen
// Global("NQ#SALVA","GLOBAL",1)	// Gespräch begonnen
// Global("NQ#SALVA","GLOBAL",2)	// No Help (Salva: 11)
// Global("NQ#SALVA","GLOBAL",3)	// Escape Angry (STH1: 12, 21)
// Global("NQ#SALVA","GLOBAL",4)	// Escape Happy (STH1: 15, 16)
// Global("NQ#SALVA","GLOBAL",5)	// Fight (STH1: 22)

// Leer: 11

BEGIN NQ#STH1

IF ~~ THEN BEGIN 0
SAY @0 /* Eure billigen Ausreden interessieren mich nicht, Halbelf! Ihr gebt mir jetzt mein Gold zurück oder Ihr könnt Euch von Euren Kniescheiben verabschieden! */
IF ~~ THEN EXTERN ~NQ#SALVA~ 0
END

IF ~~ THEN BEGIN 1
SAY @1 /* Hört Ihr mir eigentlich zu? Gold oder Kniescheiben habe ich gesagt! Ich habe bestimmt keine Mitleid mit einem affigen Betrüger wie Euch, der auch noch zugibt, dass er mein ganzes Gold verspielt hat! */
IF ~~ THEN EXTERN ~NQ#SALVA~ 1
END

IF ~~ THEN BEGIN 2
SAY @2 /* Warum mischt Ihr Euch jetzt hier ein? Das ist eine Angelegenheit zwischen mir und diesem Betrüger! */
IF ~~ THEN REPLY @3 /* Was schuldet er Euch? */ GOTO 6 // 9
IF ~~ THEN REPLY @4 /* Ich werde nicht zulassen, dass ihr diesem Mann ein Leid zufügt! */ GOTO 14 // 9
IF ~Global("JUDICIARY","LOCALS",0)~ THEN REPLY @5 /* Wenn er Euch betrogen hat, könnt Ihr ihn den Wachen übergeben. Selbstjustiz ist hier unangebracht. */ DO ~SetGlobal("JUDICIARY","LOCALS",1)~ GOTO 7 // 9
IF ~~ THEN REPLY @6 /* Ich kenne diesen Mann nicht. */ GOTO 4 // 9
IF ~Global("ANGRY","LOCALS",0)~ THEN REPLY @7 /* Ok, aber dann bringt ihn auch um! Los! */ DO ~SetGlobal("ANGRY","LOCALS",1)~ GOTO 8 // ANGRY1
END

IF ~~ THEN BEGIN 3
SAY @8 /* Aha! Selbst jetzt versucht Ihr Euch noch mit Euren miesen Betrügereien herauzuwinden, Schwindler! */
IF ~~ THEN GOTO 4
END

IF ~~ THEN BEGIN 4
SAY @9 /* Ich bitte Euch, <SIRMAAM>, lasst uns diese Angelegenheit mit diesem Betrüger klären. Er hat sich seine Strafe verdient und... */
IF ~~ THEN EXTERN ~NQ#SALVA~ 6
END

IF ~~ THEN BEGIN 5
SAY @10 /* Eure "Freunde" scheinen Euch nicht besonders zu schätzen, Händler. */
IF ~~ THEN GOTO 4
END

IF ~~ THEN BEGIN 6
SAY @11 /* Er hat mir diesen nutzlosen Tant hier für 350 Goldmünzen verkauft!!! Ein magischer Stein mit einer Verbindung zu Urogalans grünen Felder... Das ich nicht lache! Ich kann kaum glauben, dass ich so dumm war. Die seltsame Aura des Steins muss mich verwirrt haben und wahrscheinlich hat mich dieser Betrüger heimlich bezaubert. */
IF ~~ THEN EXTERN ~NQ#SALVA~ 6
END

IF ~~ THEN BEGIN 7
SAY @12 /* Die Wachen!? Sehe ich so aus, als wollte ich hier wochenlang auf einen Richtspruch warten und in dieser Zeit mein hart verdientes Gold für die Übernachtungen in dieser besseren Kaschemme ausgeben? Denkt Ihr etwa, die Wache würde mir auch nur ein Goldstück erstatten, wenn sie diesen elenden Schwindler verurteilen!? */
IF ~~ THEN GOTO 6 // 9
END

IF ~~ THEN BEGIN 8 // ANGRY1
SAY @13 /* Was? Wer hat denn was von umbringen gesagt? Auch wenn es mir vielleicht in den Finger juckt...  Mein Gott, Urogalan, schätzt es nicht, wenn anderen einen verfühtes Ende zuteil wird. */
IF ~~ THEN REPLY @14 /* Aber er lehrt Euch, dass ihr anderen die Kniescheiben zertrümmern sollt? */ GOTO 10 // 9
IF ~Global("JUDICIARY","LOCALS",0)~ THEN REPLY @15 /* Dann bleibt Euch nicht viel anderes übrig, als die Angelegenheit von der Wache klären zu lassen, sonst seid ihr bald diejenige die von ihr gejagt wird. */ DO ~SetGlobal("JUDICIARY","LOCALS",1)~ GOTO 7 // 9
IF ~CheckStatGT(LastTalkedToBy,16,CHR)~ THEN REPLY @16 /* Habt euch doch nicht so! Gebt euch ein Ruck und schlagt ihm den Schädel ein! */ DO ~SetGlobal("ANGRY","LOCALS",2)~  GOTO 12 // END
IF ~CheckStatLT(LastTalkedToBy,17,CHR)~ THEN REPLY @16 /* Habt euch doch nicht so! Gebt euch ein Ruck und schlagt ihm den Schädel ein! */ DO ~SetGlobal("ANGRY","LOCALS",2)~ GOTO 13 // ANGRY2: 9 oder END
IF ~~ THEN REPLY @17 /* Ok, eigentlich geht es mich ja auch nichts an. */ EXTERN ~NQ#SALVA~ 10 // 9 oder END
END

IF ~~ THEN BEGIN 9 // (1.0)
SAY @18 /* Ihr bekommt gleich meine Keule auf Euer freches Mundwerk, heuchlerische Schlange! */
IF ~PartyGoldGT(349)~ THEN REPLY @19 /* Hier habt Ihr 350 Golstücke. Ich hoffe die Angelegenheit ist damit erledigt? */ DO ~TakePartyGold(350)~ GOTO 15	// END
IF ~PartyGoldGT(99) CheckStatGT(LastTalkedToBy,13,CHR) Global("NO100","LOCALS",0)~ THEN REPLY @20 /* Offenbar habt Ihr keine Möglichkeit Euer Gold von diesem Herren zu bekommen. Ich wäre bereit Euch 100 Golstücke zu geben, wenn Ihr dafür friedlich abzieht. */ DO ~TakePartyGold(100)~ GOTO 16 // END
IF ~PartyGoldGT(99) CheckStatLT(LastTalkedToBy,14,CHR) Global("NO100","LOCALS",0)~ THEN REPLY @20 /* Offenbar habt Ihr keine Möglichkeit Euer Gold von diesem Herren zu bekommen. Ich wäre bereit Euch 100 Golstücke zu geben, wenn Ihr dafür friedlich abzieht. */ DO ~SetGlobal("NO100","LOCALS",1)~ GOTO 17 // 9.3
IF ~Global("JUDICIARY","LOCALS",0)~ THEN REPLY @21 /* Gewalt ist doch keine Lösung. Meldet den Vorfall der Wache, wenn Ihr Gerechtigkeit wollt. */ DO ~SetGlobal("JUDICIARY","LOCALS",1)~ GOTO 19 // 19 - 26 Ende
IF ~~ THEN REPLY @22 /* Wenn Ihr ihn angreift, kämpft Ihr auch gegen mich. Überlegt es Euch besser. */ GOTO 20 // END
IF ~Global("ANGRY","LOCALS",0) CheckStatGT(LastTalkedToBy,16,CHR)~ THEN REPLY @23 /* Ich bin gespannt. Los, tötet ihn! Hahahaha! */ DO ~SetGlobal("ANGRY","LOCALS",1)~ GOTO 12 // END
IF ~Global("ANGRY","LOCALS",0) CheckStatLT(LastTalkedToBy,17,CHR)~ THEN REPLY @23 /* Ich bin gespannt. Los, tötet ihn! Hahahaha! */ DO ~SetGlobal("ANGRY","LOCALS",1)~  GOTO 23 // (9.4) ANGRY2
IF ~~ THEN REPLY @17 /* Ok, eigentlich geht es mich ja auch nichts an. */ EXTERN ~NQ#SALVA~ 13
END

IF ~~ THEN BEGIN 10
SAY @24 /* Soll ich mich etwas von jedem Dieb und Betrüger ausnehmen lassen? Wie soll dieser Abschau es sonst lernen, wenn er einfach ungestraft davon kommt? */
IF ~~ THEN GOTO 6 // 9
END

IF ~~ THEN BEGIN 11
SAY @25 /* Blub. */
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 12
SAY @26 /* Ihr seid doch total Irre! Jungs, wir verschwinden von hier, aber wir werden weder Euch noch diesen Betrüger vergessen! */
IF ~~ THEN DO ~	ReputationInc(-1) SetGlobal("NQ#SALVA","GLOBAL",3) DropItem("NQ#SHUK",[-1.-1]) ActionOverride("NQ#STH2",EscapeArea()) ActionOverride("NQ#STH3",EscapeArea()) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 13 // ANGRY2
SAY @27 /* Ihr seid ja total Irre! Haut endlich ab, oder wie vertreiben Euch mit unseren Keulen! */
IF ~~ THEN REPLY @3 /* Was schuldet er Euch? */ GOTO 6 // 9
IF ~~ THEN REPLY @4 /* Ich werde nicht zulassen, dass ihr diesem Mann ein Leid zufügt! */ GOTO 14 // 9
IF ~Global("JUDICIARY","LOCALS",0)~ THEN REPLY @5 /* Wenn er Euch betrogen hat, könnt Ihr ihn den Wachen übergeben. Selbstjustiz ist hier unangebracht. */ DO ~SetGlobal("JUDICIARY","LOCALS",1)~ GOTO 7 // 9
IF ~~ THEN REPLY @6 /* Ich kenne diesen Mann nicht. */ GOTO 4 // 9
IF ~~ THEN REPLY @17 /* Ok, eigentlich geht es mich ja auch nichts an. */ EXTERN ~NQ#SALVA~ 10 // 9 oder END
END

IF ~~ THEN BEGIN 14
SAY @28 /* Ich bin hier nicht die Verbrecherin! Wir halten dieses Betrüger fest, weil er mich um meine Gold gebracht hat! */
IF ~~ THEN GOTO 6 // 9
END

IF ~~ THEN BEGIN 15
SAY @29 /* Oh! Auf jeden Fall! Ich weiß nicht, warum Ihr Euch für diesen Abschaum einsetzt, aber seid Euch meines Dankes gewiss. Jungs, wir verschwinden von hier! */
IF ~~ THEN DO ~ReputationInc(1) SetGlobal("NQ#SALVA","GLOBAL",4) DropItem("NQ#SHUK",[-1.-1]) ActionOverride("NQ#STH2",EscapeArea()) ActionOverride("NQ#STH3",EscapeArea()) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 16
SAY @30 /* Das ist zumindest besser als nichts... und wesentlich mehr, als das Leben dieses Betrüger in meinen Augen wert ist. Ich weiß nicht, warum Ihr Euch für diesen Abschaum einsetzt, aber seid Euch meines Dankes gewiss. Jungs, wir verschwinden von hier! */
IF ~~ THEN DO ~ReputationInc(1) SetGlobal("NQ#SALVA","GLOBAL",4) DropItem("NQ#SHUK",[-1.-1]) ActionOverride("NQ#STH2",EscapeArea()) ActionOverride("NQ#STH3",EscapeArea()) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 17 // (9.2: 9 -17 / 9 -23 -17) Problem bekannt, 100 abgelehnt)
SAY @31 /* Dann habe ich immer noch zweihundertfünfzig Münzen verloren! So leicht lasse ich diesen Schuft nicht davonkommen! */
IF ~PartyGoldGT(349)~ THEN REPLY @32 /* Dann nehmt 350 Golstücke. Ich hoffe die Angelegenheit ist damit erledigt? */ DO ~TakePartyGold(350)~ GOTO 15	// END
IF ~Global("JUDICIARY","LOCALS",0)~ THEN REPLY @21 /* Gewalt ist doch keine Lösung. Meldet den Vorfall der Wache, wenn Ihr Gerechtigkeit wollt. */ DO ~SetGlobal("JUDICIARY","LOCALS",1)~ GOTO 19 // 26 - END
IF ~~ THEN REPLY @22 /* Wenn Ihr ihn angreift, kämpft Ihr auch gegen mich. Überlegt es Euch besser. */ GOTO 20 // END
IF ~Global("ANGRY","LOCALS",0) CheckStatGT(LastTalkedToBy,16,CHR)~ THEN REPLY @23 /* Ich bin gespannt. Los, tötet ihn! Hahahaha! */ DO ~SetGlobal("ANGRY","LOCALS",1)~ GOTO 21 // END
IF ~Global("ANGRY","LOCALS",0) CheckStatLT(LastTalkedToBy,17,CHR)~ THEN REPLY @23 /* Ich bin gespannt. Los, tötet ihn! Hahahaha! */ DO ~SetGlobal("ANGRY","LOCALS",1)~ GOTO 22 // END
IF ~Global("DONTCARE","LOCALS",0)~ THEN REPLY @33 /* Ok, dann macht doch was Ihr wollt! */ DO ~SetGlobal("DONTCARE","LOCALS",1)~ EXTERN ~NQ#SALVA~ 13 // END oder 26 - END
IF ~Global("DONTCARE","LOCALS",1)~ THEN REPLY @33 /* Ok, dann macht doch was Ihr wollt! */ DO ~SetGlobal("DONTCARE","LOCALS",2)~ EXTERN ~NQ#SALVA~ 27 // END
END

IF ~~ THEN BEGIN 18
SAY @34 /* Jetzt habt Ihr plötzlich Euer Gewissen entdeckt? Soll da Euer Ernt sein? */
IF ~~ THEN GOTO 14 // 9
END

IF ~~ THEN BEGIN 19 // 9.3
SAY @35 /* Die Wachen!? Sehe ich so aus, als wollte ich hier Wochen auf einen Richtspruch warten und in dieser Zeit mein hart verdientes Gold für die Übernachtungen in dieser besseren Kaschemme ausgeben? Denkt Ihr etwa, die Wache würde mir auch nur ein Goldstück erstatten, wenn sie diesen elenden Schwindler verurteilen!? */
IF ~~ THEN GOTO 26 // 12
END

IF ~~ THEN BEGIN 20
SAY @36 /* Ihr wollt Euch wirklich für diesen kriminellen Schwachkopf mit uns schlagen? */
IF ~NumInParty(1) CheckStatGT(LastTalkedToBy,16,CHR)~ THEN GOTO 21 // END
IF ~NumInParty(1) CheckStatLT(LastTalkedToBy,17,CHR)~ THEN GOTO 22 // END
IF ~NumInParty(2) CheckStatGT(LastTalkedToBy,15,CHR)~ THEN GOTO 21 // END
IF ~NumInParty(2) CheckStatLT(LastTalkedToBy,16,CHR)~ THEN GOTO 22 // END
IF ~NumInParty(3) CheckStatGT(LastTalkedToBy,14,CHR)~ THEN GOTO 21 // END
IF ~NumInParty(3) CheckStatLT(LastTalkedToBy,15,CHR)~ THEN GOTO 22 // END
IF ~NumInParty(4) CheckStatGT(LastTalkedToBy,13,CHR)~ THEN GOTO 21 // END
IF ~NumInParty(4) CheckStatLT(LastTalkedToBy,14,CHR)~ THEN GOTO 22 // END
IF ~NumInParty(5) CheckStatGT(LastTalkedToBy,12,CHR)~ THEN GOTO 21 // END
IF ~NumInParty(5) CheckStatLT(LastTalkedToBy,13,CHR)~ THEN GOTO 22 // END
IF ~NumInParty(6) CheckStatGT(LastTalkedToBy,11,CHR)~ THEN GOTO 21 // END
IF ~NumInParty(6) CheckStatLT(LastTalkedToBy,14,CHR)~ THEN GOTO 22 // END
END

IF ~~ THEN BEGIN 21
SAY @37 /* Das ist dieser Mistkerl nicht wert. Jungs, wir verschwinden von hier! */
IF ~~ THEN DO ~SetGlobal("NQ#SALVA","GLOBAL",3) DropItem("NQ#SHUK",[-1.-1]) ActionOverride("NQ#STH2",EscapeArea()) ActionOverride("NQ#STH3",EscapeArea()) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 22
SAY @38 /* An die Waffen, Jungs! Immer drauf auf das Gesindel! */
IF ~~ THEN DO ~SetGlobal("NQ#SALVA","GLOBAL",5) ActionOverride("NQ#STH2",Enemy()) ActionOverride("NQ#STH3",Enemy()) Enemy()~ EXIT
END

IF ~~ THEN BEGIN 23
SAY @27 /* Ihr seid ja total Irre! Haut endlich ab, oder wie vertreiben Euch mit unseren Keulen! */
IF ~PartyGoldGT(349)~ THEN REPLY @19 /* Hier habt Ihr 350 Golstücke. Ich hoffe die Angelegenheit ist damit erledigt? */ DO ~TakePartyGold(350) SetGlobal("PAY","LOCALS",3)~ GOTO 15 // END
IF ~PartyGoldGT(99) CheckStatGT(LastTalkedToBy,13,CHR) Global("NO100","LOCALS",0)~ THEN REPLY @39 /* Verhaut Ihr ihn, habt ihr am Ende nichts davon. Ich wäre bereit Euch 100 Golstücke zu geben, wenn Ihr ihn friedlich ziehen lasst. */ DO ~TakePartyGold(100)~ GOTO 16 // END
IF ~PartyGoldGT(99)CheckStatLT(LastTalkedToBy,14,CHR) Global("NO100","LOCALS",0)~ THEN REPLY @39 /* Verhaut Ihr ihn, habt ihr am Ende nichts davon. Ich wäre bereit Euch 100 Golstücke zu geben, wenn Ihr ihn friedlich ziehen lasst. */ DO ~SetGlobal("NO100","LOCALS",1) TakePartyGold(100)~ GOTO 17 // 9.3
IF ~Global("JUDICIARY","LOCALS",0)~ THEN REPLY @5 /* Wenn er Euch betrogen hat, könnt Ihr ihn den Wachen übergeben. Selbstjustiz ist hier unangebracht. */ DO ~SetGlobal("JUDICIARY","LOCALS",1)~ GOTO 19 // 26 END
IF ~~ THEN REPLY @22 /* Wenn Ihr ihn angreift, kämpft Ihr auch gegen mich. Überlegt es Euch besser. */ GOTO 20 // END
IF ~~ THEN REPLY @17 /* Ok, eigentlich geht es mich ja auch nichts an. */ GOTO 25 // 26 END oder END
END

IF ~~ THEN BEGIN 24
SAY @40 /* Ich will Eure Ausreden nicht hören! */
IF ~~ THEN GOTO 6
END

IF ~~ THEN BEGIN 25
SAY @34 /* Jetzt habt Ihr plötzlich Euer Gewissen entdeckt? Soll da Euer Ernt sein? */
IF ~PartyGoldGT(349)~ THEN REPLY @19 /* Hier habt Ihr 350 Golstücke. Ich hoffe die Angelegenheit ist damit erledigt? */ DO ~TakePartyGold(350) SetGlobal("PAY","LOCALS",3)~ GOTO 15 // END
IF ~PartyGoldGT(99) CheckStatGT(LastTalkedToBy,13,CHR) Global("NO100","LOCALS",0)~ THEN REPLY @39 /* Verhaut Ihr ihn, habt ihr am Ende nichts davon. Ich wäre bereit Euch 100 Golstücke zu geben, wenn Ihr ihn friedlich ziehen lasst. */ DO ~TakePartyGold(100)~ GOTO 16 // END
IF ~PartyGoldGT(99)CheckStatLT(LastTalkedToBy,14,CHR) Global("NO100","LOCALS",0)~ THEN REPLY @39 /* Verhaut Ihr ihn, habt ihr am Ende nichts davon. Ich wäre bereit Euch 100 Golstücke zu geben, wenn Ihr ihn friedlich ziehen lasst. */ DO ~SetGlobal("NO100","LOCALS",1) TakePartyGold(100)~ GOTO 17 // 9.3
IF ~Global("JUDICIARY","LOCALS",0)~ THEN REPLY @5 /* Wenn er Euch betrogen hat, könnt Ihr ihn den Wachen übergeben. Selbstjustiz ist hier unangebracht. */ DO ~SetGlobal("JUDICIARY","LOCALS",1)~ GOTO 19 // 9
IF ~~ THEN REPLY @22 /* Wenn Ihr ihn angreift, kämpft Ihr auch gegen mich. Überlegt es Euch besser. */ GOTO 20 // END
IF ~~ THEN REPLY @41 /* Nein, ich wollte nur höflich sein. Lebt wohl! */ EXTERN ~NQ#SALVA~ 11 // END
END

IF ~~ THEN BEGIN 26
SAY @42 /* Ich weiß zu schätzen, dass Ihr Euch um eine Lösung bemüht, aber das hier ist nicht Euer Problem. Geht jetzt, bitte! */
IF ~PartyGoldGT(349)~ THEN REPLY @43 /* Wie wäre es mit diesen 350 Golstücken? Ist die Angelegenheit damit erledigt? */ DO ~TakePartyGold(350)~ GOTO 15	// END
IF ~PartyGoldGT(99) CheckStatGT(LastTalkedToBy,13,CHR) Global("NO100","LOCALS",0)~ THEN REPLY @44 /* Offenbar hat er Euer Gold auch nicht mehr. Ich wäre bereit Euch 100 Golstücke zu geben, wenn Ihr friedlich abzieht. */ DO ~TakePartyGold(100)~ GOTO 16 // END
IF ~PartyGoldGT(99) CheckStatLT(LastTalkedToBy,14,CHR) Global("NO100","LOCALS",0)~ THEN REPLY @45 /* Offenbar hat er Euer Gold auch nicht mehr.. Ich wäre bereit Euch 100 Golstücke zu geben, wenn Ihr friedlich abzieht. */ DO ~SetGlobal("NO100","LOCALS",1)~ GOTO 17 // 9.3
IF ~~ THEN REPLY @22 /* Wenn Ihr ihn angreift, kämpft Ihr auch gegen mich. Überlegt es Euch besser. */ GOTO 20 // END
IF ~Global("ANGRY","LOCALS",0) CheckStatGT(LastTalkedToBy,16,CHR)~ THEN REPLY @46 /* Nein, dann will ich wenigstens zusehen wie Ihr ihn tötet! */ DO ~SetGlobal("ANGRY","LOCALS",1)~ GOTO 12 // END
IF ~Global("ANGRY","LOCALS",0) CheckStatLT(LastTalkedToBy,17,CHR)~ THEN REPLY @46 /* Nein, dann will ich wenigstens zusehen wie Ihr ihn tötet! */ DO ~SetGlobal("ANGRY","LOCALS",1)~ GOTO 23 // END
IF ~Global("DONTCARE","LOCALS",0)~ THEN REPLY @33 /* Ok, dann macht doch was Ihr wollt! */ DO ~SetGlobal("DONTCARE","LOCALS",1)~ EXTERN ~NQ#SALVA~ 14 // END oder 27 bzw. 28
IF ~Global("DONTCARE","LOCALS",1)~ THEN REPLY @33 /* Ok, dann macht doch was Ihr wollt! */ DO ~SetGlobal("DONTCARE","LOCALS",2)~ EXTERN ~NQ#SALVA~ 11 // END
END

IF ~~ THEN BEGIN 27
SAY @47 /* Ich warne Euch, Fremder! Stellt euch nicht auf die Seite dieses Ganoven! Verschwindet einfach! */
IF ~PartyGoldGT(349)~ THEN REPLY @43 /* Wie wäre es mit diesen 350 Golstücken? Ist die Angelegenheit damit erledigt? */ DO ~TakePartyGold(350)~ GOTO 15	// END
IF ~~ THEN REPLY @22 /* Wenn Ihr ihn angreift, kämpft Ihr auch gegen mich. Überlegt es Euch besser. */ GOTO 20 // END
IF ~Global("ANGRY","LOCALS",0) CheckStatGT(LastTalkedToBy,16,CHR)~ THEN REPLY @46 /* Nein, dann will ich wenigstens zusehen wie Ihr ihn tötet! */ DO ~SetGlobal("ANGRY","LOCALS",1)~ GOTO 12 // END
IF ~Global("ANGRY","LOCALS",0) CheckStatLT(LastTalkedToBy,17,CHR)~ THEN REPLY @46 /* Nein, dann will ich wenigstens zusehen wie Ihr ihn tötet! */ DO ~SetGlobal("ANGRY","LOCALS",1)~ GOTO 23 // END
IF ~NumInParty(1)~ THEN REPLY @48 /* Ich gehe. Lebt wohl! */ DO ~SetGlobal("DONTCARE","LOCALS",2)~ EXTERN ~NQ#SALVA~ 11 // END
IF ~!NumInParty(1)~ THEN REPLY @49 /* Wir gehen. Lebt wohl! */ DO ~SetGlobal("DONTCARE","LOCALS",2)~ EXTERN ~NQ#SALVA~ 11 // END
END

IF ~~ THEN BEGIN 28
SAY @50 /* Ich warne Euch, Fremde! Stellt euch nicht auf die Seite dieses Ganoven! Verschwindet einfach! */
IF ~PartyGoldGT(349)~ THEN REPLY @43 /* Wie wäre es mit diesen 350 Golstücken? Ist die Angelegenheit damit erledigt? */ DO ~TakePartyGold(350)~ GOTO 15	// END
IF ~~ THEN REPLY @22 /* Wenn Ihr ihn angreift, kämpft Ihr auch gegen mich. Überlegt es Euch besser. */ GOTO 20 // END
IF ~Global("ANGRY","LOCALS",0) CheckStatGT(LastTalkedToBy,16,CHR)~ THEN REPLY @46 /* Nein, dann will ich wenigstens zusehen wie Ihr ihn tötet! */ DO ~SetGlobal("ANGRY","LOCALS",1)~ GOTO 12 // END
IF ~Global("ANGRY","LOCALS",0) CheckStatLT(LastTalkedToBy,17,CHR)~ THEN REPLY @46 /* Nein, dann will ich wenigstens zusehen wie Ihr ihn tötet! */ DO ~SetGlobal("ANGRY","LOCALS",1)~ GOTO 23 // END
IF ~NumInParty(1)~ THEN REPLY @48 /* Ich gehe. Lebt wohl! */ DO ~SetGlobal("DONTCARE","LOCALS",2)~ EXTERN ~NQ#SALVA~ 11 // END
IF ~!NumInParty(1)~ THEN REPLY @49 /* Wir gehen. Lebt wohl! */ DO ~SetGlobal("DONTCARE","LOCALS",2)~ EXTERN ~NQ#SALVA~ 11 // END
END