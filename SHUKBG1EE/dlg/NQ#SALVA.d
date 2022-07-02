// Global("NQ#SALVA","GLOBAL",0)	// Nicht gesprochen
// Global("NQ#SALVA","GLOBAL",1)	// Gespräch begonnen
// Global("NQ#SALVA","GLOBAL",2)	// No Help (Salva: 11)
// Global("NQ#SALVA","GLOBAL",3)	// Escape Angry (STH1: 2, 21)
// Global("NQ#SALVA","GLOBAL",4)	// Escape Happy (STH1: 15, 16)
// Global("NQ#SALVA","GLOBAL",5)	// Fight (STH1: 22)

// 4: Neu Escape Angry
// 9: Neu Escape Angry
// 12: Neu Escape Fight
// 15: Neu No Help

BEGIN NQ#SALVA

IF ~Global("NQ#SALVA","GLOBAL",0)~ THEN BEGIN 0
SAY ~Ich kann nur wiederholen, dass ich Euer Geld jetzt nicht habe, gnädige Frau! Gestern Abend hat mir Tymora leider kein Glück mit den Würfeln geschenkt und meine letzten acht Goldstücke musste ich für eine bescheidene Unterkunft in diesem Etablissement ausgeben!~
IF ~~ THEN DO ~SetGlobal("NQ#SALVA","GLOBAL",1)~ EXTERN ~NQ#STH1~ 1
END

IF ~~ THEN BEGIN 1
SAY ~Es gibt doch sicher eine andere... Oh, da sind ja meine guten Freunde!~
IF ~!Gender(Player1,FEMALE)~ THEN GOTO 2
IF ~Gender(Player1,FEMALE)~ THEN GOTO 3
END

IF ~~ THEN BEGIN 2
SAY ~Hey, mein Bester! Das ist ja rührend, dass Ihr Euch Sorgen um mich gemacht habt, aber lasst nur Eure Waffen stecken.~
IF ~~ THEN GOTO 5
END

IF ~~ THEN BEGIN 3
SAY ~Hey, mein Bester! Das ist ja rührend, dass Ihr Euch Sorgen um mich gemacht habt, aber lasst nur Eure Waffen stecken.~
IF ~~ THEN GOTO 5
END

IF ~Global("NQ#SALVA","GLOBAL",3)~ THEN BEGIN 4
SAY ~Sehr gut, <SIRMAAM>! Ihr habt diese ungehobelten Banausen fabulös in die Flucht geschlagen. Salvan Flavinius, tüchtiger Geschäftsmann und unerschrockener Überlebenskünstler, wenn ich mich vorstellen darf, erbietet Euch seinen herzlichsten Dank für Euer edelmütige Eingreifen.~
IF ~!PartyHasItem("NQ#SHUK")~ THEN GOTO 16
IF ~PartyHasItem("NQ#SHUK")~ THEN GOTO 17
END

IF ~~ THEN BEGIN 5
SAY ~Die Dame hier hat zwar eine brüske Ausdrucksweise, aber natürlich wollten Sie und ihre Kohorten mir nie wirklich etwas antun.~
IF ~~ THEN REPLY ~Da bin ich aber beruhigt.~ EXTERN ~NQ#STH1~ 2
IF ~~ THEN REPLY ~Seid Ihr sicher? Für mich klang ihre Drohung ziemlich ernst gemeint.~ EXTERN ~NQ#STH1~ 2
IF ~Global("DONTKNOW","LOCALS",0)~ THEN REPLY ~Ich kenne Euch nicht.~ DO ~SetGlobal("DONTKNOW","LOCALS",1)~ EXTERN ~NQ#STH1~ 3
IF ~!Gender(Player1,FEMALE)~ THEN REPLY ~Schade, ich hätte gerne gesehen, was sie mit Euren Kniescheiben vorhat.~ DO ~SetGlobal("DONTKNOW","LOCALS",1)~ GOTO 7
IF ~Gender(Player1,FEMALE)~ THEN REPLY ~Schade, ich hätte gerne gesehen, was sie mit Euren Kniescheiben vorhat.~ DO ~SetGlobal("DONTKNOW","LOCALS",1)~ GOTO 8
END

IF ~~ THEN BEGIN 6
SAY ~Ich versichere Euch, dass der Stein absolut authentisch ist! Nur weil Ihr nicht in der Lage seid...~
IF ~~ THEN EXTERN ~NQ#STH1~ 9
END

IF ~~ THEN BEGIN 7
SAY ~Ah... haha, immer zu einem Scherz aufgelegt, alter Freund!~
IF ~~ THEN EXTERN ~NQ#STH1~ 5
END

IF ~~ THEN BEGIN 8
SAY ~Ah... haha, immer zu einem Scherz aufgelegt, alte Freundin!~
IF ~~ THEN EXTERN ~NQ#STH1~ 5
END

IF ~Global("NQ#SALVA","GLOBAL",4)~ THEN BEGIN 9
SAY ~Ich danke Euch, <SIRMAAM>! Eure selbstlose Großzügigkeit gegenüber einen Fremden wird nicht vergessen werden! Salvan Flavinius, tüchtiger Geschäftsmann und unerschrockener Überlebenskünstler, wenn ich mich vorstellen darf, erbietet Euch seinen herzlichsten Dank für dieses edelmütige Eingreifen!~
IF ~!PartyHasItem("NQ#SHUK")~ THEN GOTO 16
IF ~PartyHasItem("NQ#SHUK")~ THEN GOTO 17
END

IF ~~ THEN BEGIN 10
SAY ~Was!? Ihr wollt mein Schicksal doch nicht wirklich diesen Leuten überlassen?~
IF ~~ THEN REPLY ~Nein, Ihr habt recht.~ EXTERN ~NQ#STH1~ 18 // 9
IF ~~ THEN REPLY ~Doch. Lebt wohl!~ GOTO 11 // END
END

IF ~~ THEN BEGIN 11
SAY ~Es gibt einfach keine Helden mehr auf dieser Welt!~
IF ~~ THEN DO ~StartCutSceneMode() StartCutScene("NQ#SHC01")~ EXIT
END

IF ~Global("NQ#SALVA","GLOBAL",5)~ THEN BEGIN 12
SAY ~Nun, das war unschön. Ich hatte wirklich gehofft, dass es eine friedliche Lösung geben könnte... Salvan Flavinius, tüchtiger Geschäftsmann und unerschrockener Überlebenskünstler, wenn ich mich vorstellen darf, erbietet Euch seinen herzlichsten Dank für Euer edelmütige Eingreifen!~
IF ~!PartyHasItem("NQ#SHUK")~ THEN GOTO 16
IF ~PartyHasItem("NQ#SHUK")~ THEN GOTO 17
END

IF ~~ THEN BEGIN 13
SAY ~Was!? Ihr wollt mein Schicksal doch nicht wirklich diesen Leuten überlassen?~
IF ~~ THEN REPLY ~Nein, Ihr habt recht.~ EXTERN ~NQ#STH1~ 26 // END
IF ~~ THEN REPLY ~Schon. Lebt wohl!~ GOTO 11 // END
END

IF ~~ THEN BEGIN 14
SAY ~Was!? Ihr wollt mein Schicksal doch nicht wirklich diesen Leuten überlassen?~
IF ~!Gender(Player1,FEMALE)~ THEN REPLY ~Nein, Ihr habt recht.~ EXTERN ~NQ#STH1~ 27
IF ~Gender(Player1,FEMALE)~ THEN REPLY ~Nein, Ihr habt recht.~ EXTERN ~NQ#STH1~ 28
IF ~~ THEN REPLY ~Schon. Lebt wohl!~ GOTO 11 // END
END

IF ~Global("NQ#SALVA","GLOBAL",2)~ THEN BEGIN 15
SAY ~Nun, das war unschön. Ich hatte wirklich gehofft, dass es eine friedliche Lösung geben könnte. Ihr hättet das verhindern können, aber das Schicksal anderer scheint Euch nicht besonders zu interessieren, oder?~
IF ~~ THEN GOTO 19
END

IF ~~ THEN BEGIN 16
SAY ~Unglücklicherweise habe ich tatsächlich nicht eine Münze mit der ich Euch angemessen entlohnen könnte. Behaltet doch einfach das Artefakt, dass diese Dame von mir erworben hat. Es liegt dort hinten auf dem Boden.~
IF ~~ THEN GOTO 18
END

IF ~~ THEN BEGIN 17
SAY ~Unglücklicherweise habe ich tatsächlich nicht eine Münze mit der ich Euch angemessen entlohnen könnte. Behaltet doch einfach das Artefakt, dass diese Dame von mir erworben hat.~
IF ~~ THEN GOTO 18
END

IF ~~ THEN BEGIN 18
SAY ~Ich muss mich nun verabschieden. Wenn Tymora es will, werden wir uns wiedersehen. Lebt wohl!~
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 19
SAY ~Nun, wer bin ich, dass ich in diesen unzivilisierten Länder mit ein wenig Zivilcourage gerechnet habe? Ich verabschiede mich. Lebt wohl!~
IF ~~ THEN DO ~EscapeArea()~ EXIT
END
