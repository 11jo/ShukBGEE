BEGIN NQ#SHUK

// Waras

IF ~~ THEN BEGIN 0
SAY ~Du brauchst ein Rudel, Worg. Also sitz hier nicht rum und heul den Mond an wie ein willenloser Welpe! Ich bin Shuk, der größte aller Goblinreiter.~
IF ~~ THEN GOTO 1
END

IF ~~ THEN BEGIN 1
SAY ~Schließt Dich mir an und ich verspreche Dir Fleisch und Stärke, statt Trauer und Schwäche!~
IF ~~ THEN EXTERN ~NQ#WARAS~ 0
END

IF ~~ THEN BEGIN 2
SAY ~Pah! Eine dreckige Sau ist keine Herausforderung für Shuk. Wo versteckt sich das Mistvieh?~
IF ~~ THEN EXTERN ~NQ#WARAS~ 1
END

IF ~~ THEN BEGIN 3
SAY ~Dann kriegt er eben meine Axt ins Gesicht! ~
IF ~Global("NQ#EBR01SPAWN","GLOBAL",1)~ THEN DO ~AddJournalEntry(@70011,QUEST)~ EXIT
IF ~Global("NQ#EBR01SPAWN","GLOBAL",2)~ THEN DO ~AddJournalEntry(@70012,QUEST)~ EXIT
IF ~Global("NQ#EBR01SPAWN","GLOBAL",3)~ THEN DO ~AddJournalEntry(@70013,QUEST)~ EXIT
END

IF ~~ THEN BEGIN 4
SAY ~Pah, nur Shuk entscheidet was mit seiner Beute passiert, Worg! Werdet Ihr mir folgen!?~
IF ~~ THEN EXTERN ~NQ#WARAS~ 5
END

IF ~~ THEN BEGIN 5
SAY ~Und genau so sollte es sein! Nehmt das Herz und folgt mir! Shuk der Worgreiter ist zurück!~
IF ~~ THEN DO ~SetGlobal("NQ#WARAS","GLOBAL",9) AddJournalEntry(@70010,QUEST_DONE) EraseJournalEntry(@70003) EraseJournalEntry(@70004) EraseJournalEntry(@70005) EraseJournalEntry(@70006) EraseJournalEntry(@70007) EraseJournalEntry(@70008) EraseJournalEntry(@70009) EraseJournalEntry(@70010) EraseJournalEntry(@70011) EraseJournalEntry(@70012) EraseJournalEntry(@70013) EraseJournalEntry(@70014)~ EXIT
END

// Vielauge 1

IF ~~ THEN BEGIN 6
SAY ~Was willst Du, blindes altes Stinktier? Ich habe keine Zeit für Dein schleimiges Geschwafel!~
IF ~~ THEN EXTERN ~NQ#GB06~ 0
END

IF ~~ THEN BEGIN 7
SAY ~Was? Ich wusste doch, dass er mich erwählt hat! Pah! Wen soll ich überzeugen? Was will Feuerauge von mir!?~
IF ~~ THEN EXTERN ~NQ#GB06~ 1
END

IF ~~ THEN BEGIN 8
SAY ~Kein Problem, wer kann mir schon widerstehen... oder meiner Axt!~
IF ~~ THEN DO ~SetGlobal("NQ#GOBLINCREW","GLOBAL",4) AddMapNoteColor([707.2012],@20003,PURPLE) AddMapNoteColor([3011.3080],@20004,GREEN) AddMapNoteColor([3536.3292],@20005,GREEN) AddMapNoteColor([4797.1833],@20006,GREEN)~ GOTO CREWQUEST1
END

// Paek

IF ~~ THEN BEGIN 9
SAY ~Ich bin der Beste! Also hab ich Deine Stimme, oder muss ich Dich erst 'nen Kopf kürzer machen!?~
IF ~~ THEN EXTERN ~NQ#GB07~ 0
END

IF ~~ THEN BEGIN 10
SAY ~Pah, vielleicht bist du keinen Axthieb wert. Was willst du, kleine Ratte?~
IF ~~ THEN EXTERN ~NQ#GB07~ 2
END

IF ~~ THEN BEGIN 11
SAY ~Gut, ich hack ihm den Kopf ab... außer ich finde ihn nicht, dann wird es doch Dein Kopf!~
IF ~~ THEN DO ~SetGlobal("NQ#PAEK","GLOBAL",1) AddJournalEntry(@70023,QUEST) AddMapNoteColor([3385.1336],@20001,RED)~ EXIT
END

IF ~~ THEN BEGIN 12
SAY ~Jaja, blablabla. Jetzt gib mir das Zeug, dass du ihm gestohlen hast, dann bist du nicht die Nächste. Idiotin!~
IF ~~ THEN EXTERN ~NQ#GB07~ 4
END

// Mulm

IF ~~ THEN BEGIN 13
SAY ~Schön, dass man mich hier kennt. Es dauert nicht lange, fette Kröte. Leg einfach den Kopf ein bisschen schräg, dann kannst Du Deinen Unterkiefer behalten!~
IF ~~ THEN EXTERN ~NQ#GB11~ 1
END

IF ~~ THEN BEGIN 14
SAY ~Ich bin nicht hier um mir Dein Geheul anzuhören, Schwabbelbacke. Du warst so dumm Dich beklauen zu lassen und hast den Dieb auch noch entwischen lassen? Pah! Deine Hohlbirne wirst Du kaum vermissen! ~
IF ~~ THEN DO ~SetGlobal("NQ#PAEK","GLOBAL",3)~ EXIT
END

// Raki

IF ~~ THEN BEGIN 15
SAY ~Versuch es doch, Trottel...~
IF ~~ THEN EXTERN ~NQ#GB08~ 0
END

IF ~~ THEN BEGIN 16
SAY ~Einfach genug! Aber glaub bloß nicht, dass ich nochmal Deinen Laufburschen spiele!~
IF ~~ THEN DO ~SetGlobal("NQ#RAKI","GLOBAL",1) AddJournalEntry(@70026,QUEST) AddMapNoteColor([2046.1861],@20002,TEAL)~ EXIT
END

IF ~~ THEN BEGIN 17
SAY ~Langsam verliere ich die Geduld, Dummschwätzer! Hab' ich jetzt Deine Stimme!?~
IF ~!Class(Player1,DRUID_ALL)~ THEN EXTERN ~NQ#GB08~ 2
IF ~Class(Player1,DRUID_ALL)~ THEN EXTERN ~NQ#GB08~ 3
END

// Izvo

IF ~~ THEN BEGIN 18
SAY ~Wer sagt denn, dass ich Deine dumme Aufgabe mache, Schwächling!? Gib mir Deine Stimme oder Du landest in Deinem eigenen Topf!~
IF ~~ THEN EXTERN ~NQ#GB09~ 0
END

IF ~~ THEN BEGIN 19
SAY ~Ich hab' Dich nicht nach Deiner Lebensgeschichte gefragt, dreckiger Penner. Also wo krieg' ich das Futter für die Meute?~
IF ~~ THEN EXTERN ~NQ#GB09~ 1
END

IF ~~ THEN BEGIN 20
SAY ~Gieriger Schwachkopf! Für Dich reichen die toten Spinnen in der Hölle, pah! Die fette Spinne fress' ich selber!~
IF ~~ THEN GOTO 21
END

IF ~~ THEN BEGIN 21
SAY ~Oder hast Du irgendein Problem damit? Hä!?~
IF ~~ THEN EXTERN ~NQ#GB09~ 2
END

// Vielauge 2

IF ~~ THEN BEGIN 22
SAY ~Ich bin nicht wegen Deiner erbärmlichen Glaubenskrise hier! Werdet Ihr mir folgen!?~
IF ~~ THEN EXTERN ~NQ#GB06~ 2
END

IF ~~ THEN BEGIN 23
SAY ~Das wollte ich hören, Schwachmat.~
IF ~~ THEN DO ~SetGlobal("NQ#GOBLINCREW","GLOBAL",5)~ EXIT
END

// Paek 2

IF ~~ THEN BEGIN 24
SAY ~Ich hasse Schleimer.~
IF ~~ THEN REPLY ~Sagt Ihr trotzdem, dass wir darüber nachdenken.~ GOTO 28
IF ~PartyGoldGT(49) !Global("NQ#RAKI","GLOBAL",9) !Global("NQ#RAKI","GLOBAL",50)~ THEN REPLY ~Egal, sagt ihr sie soll uns mit Raki helfen.~ GOTO 25
IF ~PartyGoldGT(49) !Global("NQ#IZVO","GLOBAL",12)~ THEN REPLY ~Na und? Sagt ihr sie soll uns mit Izvo helfen.~ GOTO 26
IF ~~ THEN REPLY ~Wir brauchen ihre Hilfe nicht.~ GOTO 27
END
IF ~~ THEN BEGIN 25
SAY ~Pah, Ihr habt gehört was er gesagt hat. Was kannst Du für mich tun?~
IF ~~ THEN EXTERN ~NQ#GB07~ 5
END

IF ~~ THEN BEGIN 26
SAY ~Pah, Ihr habt gehört was er gesagt hat. Was kannst Du für mich tun?~
IF ~~ THEN EXTERN ~NQ#GB07~ 6
END

IF ~~ THEN BEGIN 27
SAY ~Pah, Ihr habt gehört was er gesagt hat. Zieht ab, Schleimscheißerin!~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 28
SAY ~Ja, ja, wir denken darüber nach! Pah!~
IF ~~ THEN EXTERN ~NQ#GB07~ 8
END

// Narthag

IF ~~ THEN BEGIN 29
SAY ~Und dafür verzichte ich alle drei Tage d'rauf Dir den mageren Hals umzudrehen, Ratte!~
IF ~~ THEN EXTERN ~NQ#GB10~ 0
END

IF ~~ THEN BEGIN 30
SAY ~Was ist passiert, Ratte!?~
IF ~~ THEN EXTERN ~NQ#GB10~ 1
END

IF ~~ THEN BEGIN 31
SAY ~Pah, das hast Du gut gemacht, hässlicher kleiner Bastard. Ich rede mit ihm, dann sehen wir weiter.~
IF ~~ THEN DO ~AddJournalEntry(@70038,QUEST)~ EXIT
END

IF ~~ THEN BEGIN 32
SAY ~Er soll leben.~
IF ~Detect("NQ#GB10")~ THEN EXTERN ~NQ#GB10~ 3
IF ~!Detect("NQ#GB10")~ THEN GOTO 33
END

IF ~~ THEN BEGIN 33
SAY ~Guck nicht so dumm, Glubschauge, sonst zieh ich Deine gelben Nagerzähne einzeln!~
IF ~~ THEN DO ~~ GOTO 34
END

IF ~~ THEN BEGIN 34
SAY ~Paek weiß zwar wie man was in die Luft jagt, aber der hier kann es besser!~
IF ~Detect("NQ#NESS")~ THEN DO ~~ GOTO 35
IF ~!Detect("NQ#NESS")~ THEN DO ~~ GOTO 36
END

IF ~~ THEN BEGIN 35
SAY ~Willst Du für uns arbeiten, Gnom, oder soll Narthag sein Messer an Dir schärfen?~
IF ~~ THEN EXTERN ~NQ#NESS~ 2
END

IF ~~ THEN BEGIN 36
SAY ~Pah! Ich liebe Explosionen!~
IF ~~ THEN DO ~SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",20) EraseJournalEntry(@70038) EraseJournalEntry(@70039) EraseJournalEntry(@70040) EraseJournalEntry(@70041) EraseJournalEntry(@70047) AddJournalEntry(@70046,QUEST_DONE) AddexperienceParty(1000)~ EXIT
END

IF ~~ THEN BEGIN 37
SAY ~Das nennst Du keine Probleme, Trottel!? Ich sollte eine echte Ratte suchen und Ihr deinen Job geben, hässlicher Schwachmat.~
IF ~!Dead("SCHLUMPSA")~ THEN DO ~~ GOTO 38
IF ~Dead("SCHLUMPSA")~ THEN DO ~~ GOTO SCHLUMPA
END

IF ~~ THEN BEGIN 38
SAY ~Was auch immer da lauert, wir machen ihm besser schnell den Gar aus.~
IF ~~ THEN DO ~~ EXTERN ~NQ#GB10~ 4
END

IF ~~ THEN BEGIN 39
SAY ~Wenn die nicht noch dümmer wären als du, würde ich nicht mit dir sprechen. Pah!~
IF ~~ THEN DO ~~ GOTO 40
END

IF ~~ THEN BEGIN 40
SAY ~Ich werd' mich selbst darum kümmern.~
IF ~~ THEN DO ~~ EXIT
END

// Kruck

IF ~~ THEN BEGIN 41
SAY ~Fetter Gnom? Hat der uns angegriffen? Spuck's schon aus!~
IF ~~ THEN EXTERN ~NQ#GB26~ 0
END

IF ~~ THEN BEGIN 42
SAY ~Gut, Kleiner. Geh zu Feuerauge und sag ihm dass Shuk Dich schickt. Kein Goblin sollte durch einen Gnom fallen.~
IF ~~ THEN DO ~SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",5) FaceObject("NQ#GB26") SetSequence(SEQ_READY) SetSequence(SEQ_ATTACK)~ EXIT
END

IF ~~ THEN BEGIN 43
SAY ~Ja, ja. Weiß ich. Maul halten!~
IF ~~ THEN DO ~~ EXIT
END

// Schlumpsa

IF ~~ THEN BEGIN SCHLUMPA
SAY ~Sei froh, dass ich den Dreck längst erledigt habe. Der Kanalkönig ist Grütze. Es lebe König Shuk! Pah!~
IF ~~ THEN DO ~~ EXTERN ~NQ#GB10~ 5
END

// Vielauge: Shuk / Player

IF ~~ THEN BEGIN CREWQUEST1
SAY ~Okay, <CHARNAME>, erst dachte ich der Schamane ist komplett irre, aber offensichtlich ist er doch ein weiser Mann.~
IF ~~ THEN GOTO CREWQUEST2
END

IF ~~ THEN BEGIN CREWQUEST2
SAY ~Du wirst Dich hier doch nicht quer stellen, oder?~
IF ~~ THEN REPLY ~Was genau will der Irre denn von Euch?~ GOTO CREWQUEST4
IF ~~ THEN REPLY ~Ich helfe Euch gern, aber worum genau geht es?~ GOTO CREWQUEST4
IF ~~ THEN REPLY ~Was auch immer es ist. Wir haben keine Zeit für Euren Goblinmist!~ GOTO CREWQUEST3
END

IF ~~ THEN BEGIN CREWQUEST3
SAY ~Pah! Versteht Ihr nicht worum es hier geht!?~
IF ~~ THEN GOTO CREWQUEST5
END

IF ~~ THEN BEGIN CREWQUEST4
SAY ~Es geht um Führerschaft. Der Stamm braucht einen Anführer oder er wird sich selbst zerfleischen... und alles was ihm dabei in die Quere kommt.~
IF ~~ THEN GOTO CREWQUEST5
END

IF ~~ THEN BEGIN CREWQUEST5
SAY ~Der Schamane will, dass ich den Stamm führe. Damit habe ich die wichtigste Stimme schon in der Tasche. Es gibt scheinbar noch drei Trottel, die selbst nicht zum Anführer taugen, aber ein bisschen was zu sagen haben. Überzeuge ich die, wird mir der ganze Stamm folgen!~
IF ~~ THEN REPLY ~Ähm... in den Stein?~ GOTO CREWQUEST6
IF ~~ THEN REPLY ~Ok, ich helfe Euch.~ GOTO CREWQUEST7
IF ~~ THEN REPLY ~Auf keinen Fall mache ich da mit. Ich werde diese bösen Kreaturen zerschmettern!~ GOTO CREWQUEST8
END

IF ~~ THEN BEGIN CREWQUEST6
SAY ~Und wieder heraus, wenn ich sie rufe! Sie folgen mir. Ich folge Euch. Jeder gewinnt. Was sagst Du?~
IF ~~ THEN REPLY ~Ok, ich helfe Euch.~ GOTO CREWQUEST7
IF ~~ THEN REPLY ~Nein.~ GOTO CREWQUEST8
END

IF ~~ THEN BEGIN CREWQUEST7
SAY ~Manchmal bist Du gar nicht so dumm wie Du aussiehst.~
IF ~Alignment(Player1,MASK_GOOD)~ THEN DO ~IncrementGlobal("NQ#NICESHUK","GLOBAL",1) DisplayString(Myself,@8810) EraseJournalEntry(@70016) EraseJournalEntry(@70017) EraseJournalEntry(@70018) AddJournalEntry(@70021,QUEST)~ EXIT
IF ~!Alignment(Player1,MASK_GOOD) !Alignment(Player1,MASK_EVIL)~ THEN DO ~IncrementGlobal("NQ#NICESHUK","GLOBAL",1) DisplayString(Myself,@8810) EraseJournalEntry(@70016) EraseJournalEntry(@70017) EraseJournalEntry(@70018) AddJournalEntry(@70019,QUEST)~ EXIT
IF ~Alignment(Player1,MASK_EVIL)~ THEN DO ~IncrementGlobal("NQ#NICESHUK","GLOBAL",1) DisplayString(Myself,@8810) EraseJournalEntry(@70016) EraseJournalEntry(@70017) EraseJournalEntry(@70018) AddJournalEntry(@70020,QUEST)~ EXIT
END

IF ~~ THEN BEGIN CREWQUEST8
SAY ~Du bist wirklich der hirnloseste Affe an den ich geraten konnte, oder? Dämliches, triefendes Hühnerauge!~
IF ~~ THEN DO ~IncrementGlobal("NQ#NICESHUK","GLOBAL",-1) DisplayString(Myself,@8813) EraseJournalEntry(@70016) EraseJournalEntry(@70017) EraseJournalEntry(@70018) AddJournalEntry(@70022,QUEST)~ EXIT
END

// Ratchilds Kanäle

IF ~Global("NQ#SHUKRATCHILD","GLOBAL",2) See(Player1)~ THEN BEGIN RATCHILD1
SAY ~Die hässliche Koboldratte war nicht dumm. Das ist ein guter Ort. Mitten im Herzen der Menschenstadt, aber die Trottel verschließen ihre Augen.~
IF ~~ THEN DO ~~ GOTO RATCHILD3
END

IF ~Global("NQ#SHUKRATCHILD","GLOBAL",3) See(Player1)~ THEN BEGIN RATCHILD2
SAY ~Das ist ein guter Ort. Mitten im Herzen der Menschenstadt, aber die Trottel verschließen ihre Augen.~
IF ~~ THEN DO ~~ GOTO RATCHILD3
END

IF ~~ THEN BEGIN RATCHILD3
SAY ~Wenn Du mich ein paar meiner Leute rufen lässt, können sie hier unten schnell die Kontrolle übernehmen...~
IF ~~ THEN DO ~~ GOTO RATCHILD4
END

IF ~~ THEN BEGIN RATCHILD4
SAY ~Die Aaskriecher sind ein Problem, aber sie hören nur auf ihren Magen. Wenn sie lernen, dass es sich lohnt, werden wir sie beherrschen!~
IF ~GlobalLT("NQ#NICESHUK","GLOBAL",10)~ THEN DO ~~ GOTO RATCHILD5
IF ~GlobalGT("NQ#NICESHUK","GLOBAL",9)~ THEN DO ~~ GOTO RATCHILD6
END

IF ~~ THEN BEGIN RATCHILD5
SAY ~Was meinst Du, Affengesicht? Orte wie dieser stinken nach Gold und Macht! Das Gesocks, dass hier durchschleicht, wird zahlen. Es würde sich auch für Dich lohnen!~
IF ~~ THEN REPLY ~Ich bin dabei!~ DO ~~ GOTO RATCHILD7

IF ~OR(3) Race(LastTalkedToBy,HUMAN) Race(LastTalkedToBy,ELF) Race(LastTalkedToBy,HALF_ELF)~ THEN REPLY ~Ich glaube nicht, dass das eine gute Idee ist.~ DO ~~ GOTO RATCHILD8
IF ~OR(2) Race(LastTalkedToBy,DWARF) Race(LastTalkedToBy,GNOME)~ THEN REPLY ~Ich glaube nicht, dass das eine gute Idee ist.~ DO ~~ GOTO RATCHILD9
IF ~Race(LastTalkedToBy,HALFORC)~ THEN REPLY ~Ich glaube nicht, dass das eine gute Idee ist.~ DO ~~ GOTO RATCHILD10
IF ~!Race(LastTalkedToBy,HUMAN) !Race(LastTalkedToBy,ELF) !Race(LastTalkedToBy,HALF_ELF) !Race(LastTalkedToBy,DWARF) !Race(LastTalkedToBy,GNOME) !Race(LastTalkedToBy,HALFORC)~ THEN REPLY ~Ich glaube nicht, dass das eine gute Idee ist.~ DO ~~ GOTO RATCHILD11

IF ~OR(3) Race(LastTalkedToBy,HUMAN) Race(LastTalkedToBy,ELF) Race(LastTalkedToBy,HALF_ELF)~ THEN REPLY ~Ich würde niemals eine Horde blutrünstiger Goblins unter einer Stadt einquartieren!~ DO ~~ GOTO RATCHILD8
IF ~OR(2) Race(LastTalkedToBy,DWARF) Race(LastTalkedToBy,GNOME)~ THEN REPLY ~Ich würde niemals eine Horde blutrünstiger Goblins unter einer Stadt einquartieren!~ DO ~~ GOTO RATCHILD9
IF ~Race(LastTalkedToBy,HALFORC)~ THEN REPLY ~Ich würde niemals eine Horde blutrünstiger Goblins unter einer Stadt einquartieren!~ DO ~~ GOTO RATCHILD10
IF ~!Race(LastTalkedToBy,HUMAN) !Race(LastTalkedToBy,ELF) !Race(LastTalkedToBy,HALF_ELF) !Race(LastTalkedToBy,DWARF) !Race(LastTalkedToBy,GNOME) !Race(LastTalkedToBy,HALFORC)~ THEN REPLY ~Ich würde niemals eine Horde blutrünstiger Goblins unter einer Stadt einquartieren!~ DO ~~ GOTO RATCHILD11

IF ~~ THEN REPLY ~Es stinkt hier zwar erbärmlich, aber ich bezweifle, dass das der Geruch von Gold ist.~ DO ~~ GOTO RATCHILD12
IF ~~ THEN REPLY ~Holt sie, aber wenn es sich nicht lohnt, werde ich jeden Einzelnen ertränken!~ DO ~~ GOTO RATCHILD13
IF ~~ THEN REPLY ~Macht was Ihr wollt. Ob es mir hilft oder nicht, Hauptsache es passiert was!~ DO ~~ GOTO RATCHILD7
END


IF ~~ THEN BEGIN RATCHILD6
SAY ~Was meinst Du, <CHARNAME>? Du bist nicht so dumm wie du aussiehst. Orte wie dieser stinken nach Gold und Macht! Das Gesocks, dass hier durchschleicht, wird an uns zahlen. Es würde sich auch für Dich lohnen!~
IF ~~ THEN REPLY ~Ich bin dabei!~ DO ~~ GOTO RATCHILD7

IF ~OR(3) Race(LastTalkedToBy,HUMAN) Race(LastTalkedToBy,ELF) Race(LastTalkedToBy,HALF_ELF)~ THEN REPLY ~Ich glaube nicht, dass das eine gute Idee ist.~ DO ~~ GOTO RATCHILD8
IF ~OR(2) Race(LastTalkedToBy,DWARF) Race(LastTalkedToBy,GNOME)~ THEN REPLY ~Ich glaube nicht, dass das eine gute Idee ist.~ DO ~~ GOTO RATCHILD9
IF ~Race(LastTalkedToBy,HALFORC)~ THEN REPLY ~Ich glaube nicht, dass das eine gute Idee ist.~ DO ~~ GOTO RATCHILD10
IF ~!Race(LastTalkedToBy,HUMAN) !Race(LastTalkedToBy,ELF) !Race(LastTalkedToBy,HALF_ELF) !Race(LastTalkedToBy,DWARF) !Race(LastTalkedToBy,GNOME) !Race(LastTalkedToBy,HALFORC)~ THEN REPLY ~Ich glaube nicht, dass das eine gute Idee ist.~ DO ~~ GOTO RATCHILD11

IF ~OR(3) Race(LastTalkedToBy,HUMAN) Race(LastTalkedToBy,ELF) Race(LastTalkedToBy,HALF_ELF)~ THEN REPLY ~Ich würde niemals eine Horde blutrünstiger Goblins unter einer Stadt einquartieren!~ DO ~~ GOTO RATCHILD8
IF ~OR(2) Race(LastTalkedToBy,DWARF) Race(LastTalkedToBy,GNOME)~ THEN REPLY ~Ich würde niemals eine Horde blutrünstiger Goblins unter einer Stadt einquartieren!~ DO ~~ GOTO RATCHILD9
IF ~Race(LastTalkedToBy,HALFORC)~ THEN REPLY ~Ich würde niemals eine Horde blutrünstiger Goblins unter einer Stadt einquartieren!~ DO ~~ GOTO RATCHILD10
IF ~!Race(LastTalkedToBy,HUMAN) !Race(LastTalkedToBy,ELF) !Race(LastTalkedToBy,HALF_ELF) !Race(LastTalkedToBy,DWARF) !Race(LastTalkedToBy,GNOME) !Race(LastTalkedToBy,HALFORC)~ THEN REPLY ~Ich würde niemals eine Horde blutrünstiger Goblins unter einer Stadt einquartieren!~ DO ~~ GOTO RATCHILD11

IF ~~ THEN REPLY ~Es stinkt hier zwar erbärmlich, aber ich bezweifle, dass das der Geruch von Gold ist.~ DO ~~ GOTO RATCHILD12
IF ~~ THEN REPLY ~Holt sie, aber wenn es sich nicht lohnt, werde ich jeden Einzelnen ertränken!~ DO ~~ GOTO RATCHILD13
IF ~~ THEN REPLY ~Macht was Ihr wollt. Ob es mir hilft oder nicht, Hauptsache es passiert was!~ DO ~~ GOTO RATCHILD7
END


IF ~~ THEN BEGIN RATCHILD7
SAY ~Sehr gut! Kommt her ihr Maden, hahaha!~
IF ~~ THEN DO ~SetGlobal("NQ#SHUKRATCHILD","GLOBAL",5) AddJournalEntry(@70036,QUEST)~ EXIT
END

IF ~~ THEN BEGIN RATCHILD8
SAY ~Pah! Wenn wir es nicht tun, wird ein anderer die Gänge übernehmen. Warum sind <RACE>en nur so schwer von Begriff!~
IF ~~ THEN REPLY ~Meine Antwort bleibt: Nein!~ DO ~~ GOTO RATCHILD14
IF ~~ THEN REPLY ~Holt sie, aber wenn es sich nicht lohnt, werde ich jeden Einzelnen ertränken!~ DO ~~ GOTO RATCHILD13
IF ~~ THEN REPLY ~Macht was Ihr wollt. Ob es mir hilft oder nicht, Hauptsache es passiert was!~ DO ~~ GOTO RATCHILD7
END

IF ~~ THEN BEGIN RATCHILD9
SAY ~Pah! Wenn wir es nicht tun, wird ein anderer die Gänge übernehmen. Warum sind <RACE>e nur so schwer von Begriff!~
IF ~~ THEN REPLY ~Meine Antwort bleibt: Nein!~ DO ~~ GOTO RATCHILD14
IF ~~ THEN REPLY ~Holt sie, aber wenn es sich nicht lohnt, werde ich jeden Einzelnen ertränken!~ DO ~~ GOTO RATCHILD13
IF ~~ THEN REPLY ~Macht was Ihr wollt. Ob es mir hilft oder nicht, Hauptsache es passiert was!~ DO ~~ GOTO RATCHILD7
END

IF ~~ THEN BEGIN RATCHILD10
SAY ~Pah! Wenn wir es nicht tun, wird ein anderer die Gänge übernehmen. Warum sind <RACE>s nur so schwer von Begriff!~
IF ~~ THEN REPLY ~Meine Antwort bleibt: Nein!~ DO ~~ GOTO RATCHILD14
IF ~~ THEN REPLY ~Holt sie, aber wenn es sich nicht lohnt, werde ich jeden Einzelnen ertränken!~ DO ~~ GOTO RATCHILD13
IF ~~ THEN REPLY ~Macht was Ihr wollt. Ob es mir hilft oder nicht, Hauptsache es passiert was!~ DO ~~ GOTO RATCHILD7
END

IF ~~ THEN BEGIN RATCHILD11
SAY ~Pah! Wenn wir es nicht tun, wird ein anderer die Gänge übernehmen. Warum bist Du nur so schwer von Begriff!~
IF ~~ THEN REPLY ~Meine Antwort bleibt: Nein!~ DO ~~ GOTO RATCHILD14
IF ~~ THEN REPLY ~Holt sie, aber wenn es sich nicht lohnt, werde ich jeden Einzelnen ertränken!~ DO ~~ GOTO RATCHILD13
IF ~~ THEN REPLY ~Macht was Ihr wollt. Ob es mir hilft oder nicht, Hauptsache es passiert was!~ DO ~~ GOTO RATCHILD7
END

IF ~~ THEN BEGIN RATCHILD12
SAY ~Du riechst nur Deinen eigenen Gestank, <RACE>.~
IF ~~ THEN REPLY ~Meine Antwort bleibt: Nein!~ DO ~~ GOTO RATCHILD14
IF ~~ THEN REPLY ~Holt sie, aber wenn es sich nicht lohnt, werde ich jeden Einzelnen ertränken!~ DO ~~ GOTO RATCHILD13
IF ~~ THEN REPLY ~Macht was Ihr wollt. Ob es mir hilft oder nicht, Hauptsache es passiert was!~ DO ~~ GOTO RATCHILD7
END

IF ~~ THEN BEGIN RATCHILD13
SAY ~Wenn die Schlappschwänze mich enttäuschen, werd' ich sie selbst ersäufen!~
IF ~~ THEN DO ~~ GOTO RATCHILD7
END

IF ~~ THEN BEGIN RATCHILD14
SAY ~Bah!~
IF ~~ THEN DO ~SetGlobal("NQ#SHUKRATCHILD","GLOBAL",4)~ EXIT
END

//

IF ~See(Player1) !StateCheck(Player1,CD_STATE_NOTVALID) Global("NQ#SHUKSPALACEEVENT1","GLOBAL",6)~ THEN BEGIN RATCHILD15
SAY ~Die Sau hat um Mitternacht zugeschlagen. Wie wär's mit einem kleinen Hinterhalt, falls er es diese Nacht wieder probiert?~
IF ~!NumInParty(1)~ THEN REPLY ~Wir sind dabei.~ DO ~~ GOTO RATCHILD16
IF ~NumInParty(1)~ THEN REPLY ~Ich bin dabei.~ DO ~~ GOTO RATCHILD16
IF ~~ THEN REPLY ~Und was habe ich davon?~ DO ~~ GOTO RATCHILD18
IF ~~ THEN REPLY ~Ein Goblin weniger. Wo ist das Problem?~ DO ~~ GOTO RATCHILD18
IF ~!Race(LastTalkedToBy,ELF) !Race(LastTalkedToBy,HALF_ELF)~ THEN REPLY ~Falls wir zufällig Zeit haben sollten, sehen wir es uns an.~ DO ~~ GOTO RATCHILD21A
IF ~OR (2) Race(LastTalkedToBy,ELF) Race(LastTalkedToBy,HALF_ELF)~ THEN REPLY ~Falls wir zufällig Zeit haben sollten, sehen wir es uns an.~ DO ~~ GOTO RATCHILD21B
END

IF ~~ THEN BEGIN RATCHILD16 // Yes
SAY ~Gut...~
IF ~~ THEN DO ~AddJournalEntry(@70039,QUEST) SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",7)~ GOTO RATCHILD17
END

IF ~~ THEN BEGIN RATCHILD17
SAY ~Idiot.~
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN RATCHILD18
SAY ~Wenn die Schwächlinge hier die ganze Zeit mit einem Angriff rechnen müssen, kommt auch weniger Gold in Deine Kasse.~
IF ~~ THEN DO ~~ GOTO RATCHILD19
END

IF ~~ THEN BEGIN RATCHILD19
SAY ~Sie werden den gefährlichen Bereich meiden, wenn ich nicht da bin um ihnen in den Arsch zu treten. Also schleicht hier noch mehr Pack durch ohne zu zahlen.~
IF ~~ THEN DO ~~ GOTO RATCHILD20
END

IF ~~ THEN BEGIN RATCHILD20
SAY ~Selbst die Feiglinge, die zahlen wollen, bekommen Probleme. Ein nervöser Goblin schlägt erst zu, dann stellt er Fragen.~
IF ~!NumInParty(1)~ THEN REPLY ~Ok, kapiert. Wir sind dabei.~ DO ~~ GOTO RATCHILD16
IF ~NumInParty(1)~ THEN REPLY ~Ok, kapiert. Ich bin dabei.~ DO ~~ GOTO RATCHILD16
IF ~!Race(LastTalkedToBy,GNOME)~ THEN REPLY ~Die paar Münzen sind mir egal. Wir haben wichtigere Aufgaben.~ DO ~~ GOTO RATCHILD22A
IF ~Race(LastTalkedToBy,GNOME)~ THEN REPLY ~Die paar Münzen sind mir egal. Wir haben wichtigere Aufgaben.~ DO ~~ GOTO RATCHILD22B
IF ~!Race(LastTalkedToBy,ELF) !Race(LastTalkedToBy,HALF_ELF)~ THEN REPLY ~Vielleicht sehen wir es uns an.~ DO ~~ GOTO RATCHILD21A
IF ~OR (2) Race(LastTalkedToBy,ELF) Race(LastTalkedToBy,HALF_ELF)~ THEN REPLY ~Vielleicht sehen wir es uns an.~ DO ~~ GOTO RATCHILD21B
END

IF ~~ THEN BEGIN RATCHILD21A // Maybe
SAY ~Wie es Deine Zeit erlaubt. Arrogantes Sackgesicht!~
IF ~~ THEN DO ~AddJournalEntry(@70040,QUEST) SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",7)~ EXIT
END

IF ~~ THEN BEGIN RATCHILD21B // Maybe
SAY ~Wie es Deine Zeit erlaubt. Dreckiges, arrogantes Spitzohr!~
IF ~~ THEN DO ~AddJournalEntry(@70040,QUEST) SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",7)~ EXIT
END

IF ~~ THEN BEGIN RATCHILD22A // No
SAY ~Dämlicher Lackaffe.~
IF ~~ THEN DO ~AddJournalEntry(@70041,QUEST) SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",7)~ EXIT
END

IF ~~ THEN BEGIN RATCHILD22B // No
SAY ~War klar, dass ihr wertlosen Gnome zusammensteht. Dämlicher, rassistischer Lackaffe.~
IF ~~ THEN DO ~AddJournalEntry(@70041,QUEST) SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",7)~ EXIT
END

// NESS

IF ~Global("HIDEFORNESS","LOCALS",0) GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",9) GlobalLT("NQ#SHUKSPALACEEVENT1","GLOBAL",13) !Global("NQ#NESS1","GLOBAL",2) AreaCheck("AR0200") Detect("NQ#TAR") !See("NQ#NESS") See(Player1) !StateCheck(Player1,CD_STATE_NOTVALID) !ActuallyInCombat()~ THEN BEGIN NESS1
SAY ~Hier sieht er uns, Sabberbacke. Wenn der Dunghaufen aus seinem Loch kommen soll, müssen wir Abstand halten!~
IF ~!Class(Player1,THIEF_ALL) !Class(Player1,RANGER_ALL) !Class(Player1,MAGE_ALL)~ THEN DO ~SetGlobal("HIDEFORNESS","LOCALS",1)~ EXIT
IF ~Class(Player1,MAGE_ALL)~ THEN DO ~SetGlobal("HIDEFORNESS","LOCALS",1)~ GOTO NESS2
IF ~OR (2) Class(Player1,THIEF_ALL) Class(Player1,RANGER_ALL) !Class(Player1,MAGE_ALL)~ THEN DO ~SetGlobal("HIDEFORNESS","LOCALS",1)~ GOTO NESS3
END

IF ~~ THEN BEGIN NESS2
SAY ~Du kannst uns auch unsichtbar machen, wenn Du dich nützlich fühlen willst.~
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN NESS3
SAY ~Du kannst hier ja rumschleichen, aber ich bin kein dreckiger Dieb. Pah!~
IF ~~ THEN DO ~~ EXIT
END

// Shuk will die Axt!

// Global("NQ#SHUKKRUNTAX","GLOBAL",1) - Axt dabei, Dialogtrigger
// Global("NQ#SHUKKRUNTAX","GLOBAL",2) - Dialog Axt geführt
// Global("NQ#SHUKKRUNTAX","GLOBAL",3) - Axt gegeben
// Global("NQ#SHUKKRUNTAX","GLOBAL",4) - Axt wieder abgegeben

// Global("NQ#SHUKAX","GLOBAL",4) - Krunt Axt ausgerüstet


IF ~!HasItem("NQ#SPR31",Myself) Global("NQ#SHUKKRUNTAX","GLOBAL",1) PartyHasItemIdentified("BDAX1H02")~ THEN BEGIN KRUNT1
SAY ~Ha, was für eine Axt! Die Waffe wurde für einen wahren Häuptling geschaffen... Gib sie mir, Dumpfbacke!~
IF ~!Global("bd_SDD221e","global",2)~ THEN DO ~SetGlobal("NQ#SHUKKRUNTAX","GLOBAL",2)~ GOTO KRUNT2
IF ~Global("bd_SDD221e","global",2)~ THEN DO ~SetGlobal("NQ#SHUKKRUNTAX","GLOBAL",2)~ GOTO KRUNT3
END

IF ~~ THEN BEGIN KRUNT2
SAY ~Der falsche Goblin hat schon kapiert, dass sie nicht würdig ist, bah!~
IF ~~ THEN REPLY ~Gut, nehmt die Axt.~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",4) ActionOverride(Player1,TakePartyItem("BDAX1H02")) ActionOverride(Player1,DestroyItem("BDAX1H02"))~ GOTO KRUNT4
IF ~~ THEN REPLY ~Ihr seid schon ohne die Axt eingebildet genug. Nein!~ DO ~~ GOTO KRUNT5
IF ~~ THEN REPLY ~Ich werde darüber nachdenken.~ DO ~~ GOTO KRUNT6
END

IF ~~ THEN BEGIN KRUNT3
SAY ~M'Khiin denkt, dass sie jetzt ein Krieger ist? Bah! Unwürdiges Pack wie sie wird nie verstehen, was es bedeutet ein echter Goblin zu sein!~
IF ~~ THEN REPLY ~Gut, nehmt die Axt.~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",4) ActionOverride(Player1,TakePartyItem("BDAX1H02")) ActionOverride(Player1,DestroyItem("BDAX1H02"))~ GOTO KRUNT4
IF ~~ THEN REPLY ~Ihr seid schon ohne die Axt eingebildet genug. Nein!~ DO ~~ GOTO KRUNT7
IF ~~ THEN REPLY ~Die Axt gehört jetzt M'Khiin, also vergesst es.~ DO ~~ GOTO KRUNT8
IF ~~ THEN REPLY ~Ich werde darüber nachdenken.~ DO ~~ GOTO KRUNT6
END

IF ~~ THEN BEGIN KRUNT4
SAY ~Ja! Hahaha! Jetzt such ein paar Köpfe die ich damit abhacken kann!~
IF ~~ THEN DO ~SetGlobal("NQ#SHUKKRUNTAX","GLOBAL",3) IncrementGlobal("NQ#NICESHUK","GLOBAL",2) DisplayString(Myself,@8811)~ EXIT
END

IF ~~ THEN BEGIN KRUNT5
SAY ~Wer außer mir kann sie den führen, Volltrottel!?~
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN KRUNT6
SAY ~Das kann es ja nur Jahre dauern, stumpfsinniger Nichtskönner...~
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN KRUNT7
SAY ~Bah! Ich bin ein Kieger und ich bin ein Goblin und im Gegensatz zu dieser hässlichen Elfentochter bilde ich mir nichts davon nur ein.~
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN KRUNT8
SAY ~Bah! Diese hässliche Elfentochter tut doch alles was ihr Herrchen sagt. Ein Wort von Dir und die Axt ist mein.~
IF ~~ THEN REPLY ~Nehmt die Axt.~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",4) ActionOverride(Player1,TakePartyItem("BDAX1H02")) ActionOverride(Player1,DestroyItem("BDAX1H02"))~ GOTO KRUNT4
IF ~~ THEN REPLY ~Nein!~ DO ~~ GOTO KRUNT9
IF ~~ THEN REPLY ~Ich werde darüber nachdenken.~ DO ~~ GOTO KRUNT6
END

IF ~~ THEN BEGIN KRUNT9
SAY ~Volltrottel!~
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN KRUNT10
SAY ~Endlich... und es heißt jetzt Shuk's Axt!~
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN KRUNT11
SAY ~Was!? Mieser Abschaum... Pah!~
IF ~~ THEN DO ~~ EXIT
END

// Shuk und der Tod

IF ~Global("NQ#SHUK100LIVES","GLOBAL",1)~ THEN BEGIN DEAD1
SAY ~Dreckiger Sklaventreiber! Ich kann die Tode in die Ihr mich geschickt habt schon lange nicht mehr zählen!~
IF ~~ THEN DO ~SetGlobal("NQ#SHUK100LIVES","GLOBAL",2)~ GOTO DEAD2
END

IF ~~ THEN BEGIN DEAD2
SAY ~Ich spüre wie sich mein Körper verändert. Kalt... selbst, wenn es warm ist. Perverse Mistsau!~
IF ~~ THEN DO ~	IncrementGlobal("NQ#NICESHUK","GLOBAL",-3) DisplayString(Myself,@8815)~ EXIT
END

// Shuk und die dicke Spinne (Landrin)

IF ~Global("NQ#SHUKBIGSPIDER","GLOBAL",1)~ THEN BEGIN BIGSPIDER1
SAY ~Hey Matschbirne! Gib mir die fette Spinne! Das ist ein besonders saftiges Vieh!~
IF ~PartyHasItem("MISC60") !Global("HelpLandrin","GLOBAL",2)~ THEN REPLY ~Geht es auch etwas höflicher? Hier, bitte.~ DO ~~ GOTO BIGSPIDER2
IF ~PartyHasItem("MISC60") Global("HelpLandrin","GLOBAL",2)~ THEN REPLY ~Hier, nehmt die dicke Spinne.~ DO ~AddJournalEntry(@70001,QUEST_DONE) EraseJournalEntry(27231) EraseJournalEntry(27232) EraseJournalEntry(27233)~ GOTO BIGSPIDER2
IF ~!PartyHasItem("MISC60")~ THEN REPLY ~Geht es auch etwas höflicher? Hier, bitte.~ DO ~~ GOTO BIGSPIDER22
IF ~~ THEN REPLY ~Ihr kriegt von mir höchstens einen Schlag auf den Kopf, frecher Goblin!~ DO ~~ GOTO BIGSPIDER3
IF ~~ THEN REPLY ~Der Besitzer des Hauses wird mir sicher keine Belohnung geben, wenn ich ihm die Spinne nicht zeige...~ DO ~~ GOTO BIGSPIDER4
END

IF ~~ THEN BEGIN BIGSPIDER2
SAY ~Danke. Idiot!~
IF ~~ THEN DO ~ActionOverride(Player1,TakePartyItem("MISC60")) ActionOverride(Player1,DestroyItem("MISC60")) IncrementGlobal("HelpLandrin","GLOBAL",1) SetGlobal("NQ#SHUKBIGSPIDER","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN BIGSPIDER22
SAY ~Wo hast Du die fette Spinne versteckt, hinterhältiger Mistsack!?~
IF ~~ THEN DO ~SetGlobal("NQ#SHUKBIGSPIDER","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN BIGSPIDER3
SAY ~Bah! Stinkiger, dummer Orkfurz!~
IF ~~ THEN DO ~SetGlobal("NQ#SHUKBIGSPIDER","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN BIGSPIDER4
SAY ~Jetzt ist die Spinne frisch. Was will das picklige Pferdegesicht schon damit, wenn sie verwest? Gib sie mir!~
IF ~PartyHasItem("MISC60") !Global("HelpLandrin","GLOBAL",2)~ THEN REPLY ~Geht es auch etwas höflicher? Hier, bitte.~ DO ~~ GOTO BIGSPIDER2
IF ~PartyHasItem("MISC60") Global("HelpLandrin","GLOBAL",2)~ THEN REPLY ~Hier, nehmt die dicke Spinne aus Beregost.~ DO ~AddJournalEntry(@70001,QUEST_DONE) EraseJournalEntry(27231) EraseJournalEntry(27232) EraseJournalEntry(27233)~ GOTO BIGSPIDER2
IF ~~ THEN REPLY ~Ihr kriegt von mir höchstens einen Schlag auf den Kopf, frecher Goblin!~ DO ~~ GOTO BIGSPIDER3
IF ~~ THEN REPLY ~Ich denke darüber nach.~ DO ~SetGlobal("NQ#SHUKBIGSPIDER","GLOBAL",2)~ GOTO BYE1
END

// Shuk und die Geisterspinne (BGQE)

IF ~PartyHasItem("NQ#MI46") Global("NQ#SHUKGHOSTSPIDER","GLOBAL",0)~ THEN BEGIN GHOSTSPIDER1
SAY ~Das Brüten hat sich gelohnt, Hohlschädel! Mir läuft schon das Wasser im Mund zusammen... Her mit der Geisterspinne! ~
IF ~~ THEN REPLY ~Guten Appetit!~ DO ~ActionOverride(Player1,TakePartyItem("NQ#MI46")) ActionOverride(Player1,DestroyItem("NQ#MI46")) SetGlobal("NQ#SHUKGHOSTSPIDER","GLOBAL",2)~ EXIT
IF ~~ THEN REPLY ~Bevor ich sie Euch gebe, esse ich sie selbst!~ DO ~SetGlobal("NQ#SHUKGHOSTSPIDER","GLOBAL",1)~ EXIT
IF ~~ THEN REPLY ~Denkt erstmal ein bisschen über Höflichkeit nach. Ich überlege es mir. ~ DO ~SetGlobal("NQ#SHUKGHOSTSPIDER","GLOBAL",1)~ EXIT
END

// Shuk will einen Schild

IF ~Global("NQ#SHUKSHLD","GLOBAL",1)~ THEN BEGIN SHLD1
SAY ~Wie oft soll ich eigentlich noch für Dich sterben, <RACE>!?~
IF ~~ THEN DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",2)~ GOTO SHLD2
END

IF ~~ THEN BEGIN SHLD2
SAY ~Gib mir gefälligst einen magischen Schild, wenn Du Dich schon nicht selbst ins Getümmel traut!~
IF ~~ THEN REPLY ~Ich habe keinen Schild für Euch.~ DO ~~ GOTO SHLD3
IF ~~ THEN REPLY ~Ich hau' Euch gleich einen Schild auf den Kopf. Haltet endlich den Mund, dummer Goblin!~ DO ~~ GOTO SHLD4
IF ~~ THEN REPLY ~Was für einen Schild wollt Ihr?~ DO ~~ GOTO SHLD5
END

IF ~~ THEN BEGIN SHLD3
SAY ~Dann besorg eben einen, nutzloser <RACE>!~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SHLD4
SAY ~Nutzloser Wicht! Versuch nur mich zu schlagen und ich hacke Dir die mickrigen, dürren Beine ab!~
IF ~~ THEN DO ~IncrementGlobal("NQ#NICESHUK","GLOBAL",-1) DisplayString(Myself,@8813)~ EXIT
END

IF ~~ THEN BEGIN SHLD5
SAY ~Ein kleiner oder mittlerer Schild +5 sollte reichen, wenn Du nichts Besseres hast.~
IF ~PartyHasItemIdentified("SHLD20")~ THEN REPLY ~Hier nehmt Kiels Tartsche.~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",101) ActionOverride(Player1,TakePartyItem("SHLD20")) ActionOverride(Player1,DestroyItem("SHLD20"))~ GOTO SHLD6
IF ~PartyHasItemIdentified("SHLD02A")~ THEN REPLY ~Hier nehmt einen modernen kleinen Schild +1~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",102) ActionOverride(Player1,TakePartyItem("SHLD02A")) ActionOverride(Player1,DestroyItem("SHLD02A"))~ GOTO SHLD6
IF ~PartyHasItemIdentified("SHLD02")~ THEN REPLY ~Hier nehmt einen kleinen Schild +1.~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",103) ActionOverride(Player1,TakePartyItem("SHLD02")) ActionOverride(Player1,DestroyItem("SHLD02"))~ GOTO SHLD6
IF ~PartyHasItemIdentified("SHLD28")~ THEN REPLY ~Hier nehmt einen kleinen Schild +2.~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",104) ActionOverride(Player1,TakePartyItem("SHLD28")) ActionOverride(Player1,DestroyItem("SHLD28"))~ GOTO SHLD6
IF ~PartyHasItemIdentified("SHLD04A")~ THEN REPLY ~Hier nehmt einen modernen mittlerer Schild +1~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",105) ActionOverride(Player1,TakePartyItem("SHLD04A")) ActionOverride(Player1,DestroyItem("SHLD04A"))~ GOTO SHLD6
IF ~PartyHasItemIdentified("SHLD04")~ THEN REPLY ~Hier nehmt einen mittlerer Schild +1~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",106) ActionOverride(Player1,TakePartyItem("SHLD04")) ActionOverride(Player1,DestroyItem("SHLD04"))~ GOTO SHLD6
IF ~PartyHasItemIdentified("SHLD29")~ THEN REPLY ~Hier nehmt einen mittlerer Schild +2~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",107) ActionOverride(Player1,TakePartyItem("SHLD29")) ActionOverride(Player1,DestroyItem("SHLD29"))~ GOTO SHLD6
IF ~~ THEN REPLY ~Wie wäre es mit einem Langschild?~ DO ~~ GOTO SHLD7
IF ~~ THEN REPLY ~Klar, träumt weiter.~ DO ~IncrementGlobal("NQ#NICESHUK","GLOBAL",-1) DisplayString(Myself,@8813)~ GOTO BYE1
IF ~~ THEN REPLY ~Ich denke darüber nach.~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN SHLD6
SAY ~Pah! Besser als nichts...~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SHLD7
SAY ~Glaubst Du, Du bist witzig, dreckige Eiterbeule?~
IF ~PartyHasItemIdentified("SHLD20")~ THEN REPLY ~Hier nehmt Kiels Tartsche.~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",101) ActionOverride(Player1,TakePartyItem("SHLD20")) ActionOverride(Player1,DestroyItem("SHLD20"))~ GOTO SHLD6
IF ~PartyHasItemIdentified("SHLD02A")~ THEN REPLY ~Hier nehmt einen modernen kleinen Schild +1~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",102) ActionOverride(Player1,TakePartyItem("SHLD02A")) ActionOverride(Player1,DestroyItem("SHLD02A"))~ GOTO SHLD6
IF ~PartyHasItemIdentified("SHLD02")~ THEN REPLY ~Hier nehmt einen kleinen Schild +1.~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",103) ActionOverride(Player1,TakePartyItem("SHLD02")) ActionOverride(Player1,DestroyItem("SHLD02"))~ GOTO SHLD6
IF ~PartyHasItemIdentified("SHLD28")~ THEN REPLY ~Hier nehmt einen kleinen Schild +2.~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",104) ActionOverride(Player1,TakePartyItem("SHLD28")) ActionOverride(Player1,DestroyItem("SHLD28"))~ GOTO SHLD6
IF ~PartyHasItemIdentified("SHLD04A")~ THEN REPLY ~Hier nehmt einen modernen mittlerer Schild +1~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",105) ActionOverride(Player1,TakePartyItem("SHLD04A")) ActionOverride(Player1,DestroyItem("SHLD04A"))~ GOTO SHLD6
IF ~PartyHasItemIdentified("SHLD04")~ THEN REPLY ~Hier nehmt einen mittlerer Schild +1~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",106) ActionOverride(Player1,TakePartyItem("SHLD04")) ActionOverride(Player1,DestroyItem("SHLD04"))~ GOTO SHLD6
IF ~PartyHasItemIdentified("SHLD29")~ THEN REPLY ~Hier nehmt einen mittlerer Schild +2~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",107) ActionOverride(Player1,TakePartyItem("SHLD29")) ActionOverride(Player1,DestroyItem("SHLD29"))~ GOTO SHLD6
IF ~~ THEN REPLY ~Ja und jetzt träumt weiter. Ihr bekommt keinen Schild!~ DO ~IncrementGlobal("NQ#NICESHUK","GLOBAL",-1) DisplayString(Myself,@8813)~ GOTO BYE1
IF ~~ THEN REPLY ~Vergesst es einfach. Wir gehen weiter!~ DO ~~ GOTO BYE1
END

// Ausrüstung

IF ~~ THEN BEGIN EQUIP1
SAY ~Was ist damit?~
IF ~!HasItem("NQ#SPR31",Myself) OR(4) PartyHasItemIdentified("AX1H03") PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKAX","GLOBAL",3) Global("NQ#SHUKAX","GLOBAL",4) GlobalLT("NQ#NICESHUK","GLOBAL",10)~ THEN REPLY ~Ich möchte über Eure Axt reden.~ GOTO WP1
IF ~!HasItem("NQ#SPR31",Myself) OR(4) PartyHasItemIdentified("AX1H03") PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKAX","GLOBAL",3) Global("NQ#SHUKAX","GLOBAL",4) GlobalGT("NQ#NICESHUK","GLOBAL",9)~ THEN REPLY ~Reden wir über Eure Axt.~ GOTO WP2
IF ~Global("NQ#SHUKARMOR","GLOBAL",101)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP201
IF ~Global("NQ#SHUKARMOR","GLOBAL",103)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP202
IF ~Global("NQ#SHUKARMOR","GLOBAL",102)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP203
IF ~Global("NQ#SHUKARMOR","GLOBAL",104)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP204 // Goblin Hide Armor +2
IF ~Global("NQ#SHUKARMOR","GLOBAL",105)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP205 // Raconteur's Regalia +2
IF ~Global("NQ#SHUKARMOR","GLOBAL",106)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP206 // Changeling's Vest
IF ~Global("NQ#SHUKARMOR","GLOBAL",107)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP207 // Dragonscale Armor
IF ~Global("NQ#SHUKARMOR","GLOBAL",108)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP208 // Goblin Leathers +1
IF ~Global("NQ#SHUKARMOR","GLOBAL",109)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP209 // The Night's Embrace +3
IF ~Global("NQ#SHUKARMOR","GLOBAL",110)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP210 // Hide Armor +1 (110) EQUIP210
IF ~Global("NQ#SHUKARMOR","GLOBAL",111)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP211 // Jegg's Leathers +2  (111) EQUIP211
IF ~Global("NQ#SHUKARMOR","GLOBAL",112)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP212 // Kruntur's Armor +3  (112) EQUIP212
IF ~GlobalGT("NQ#SHUKARMOR","GLOBAL",100) GlobalLT("NQ#SHUKARMOR","GLOBAL",113)~ THEN REPLY ~Gebt mir Eure Rüstung!~ DO ~SetGlobal("NQ#SHUKARMOREQ","LOCALS",0) SetGlobal("NQ#SHUKARMOR","GLOBAL",100)~ GOTO EQUIP6							// statt 2
IF ~GlobalGT("NQ#SHUKARMOR","GLOBAL",100) GlobalLT("NQ#SHUKARMOR","GLOBAL",113)~ THEN REPLY ~Ich habe eine andere Rüstung für Euch.~ DO ~SetGlobal("NQ#SHUKARMOREQ","LOCALS",0) SetGlobal("NQ#SHUKARMOR","GLOBAL",100)~ GOTO EQUIP8			// statt 4		
IF ~GlobalLT("NQ#SHUKARMOR","GLOBAL",101)~ THEN REPLY ~Ich habe eine Rüstung für Euch.~ DO ~~ GOTO EQUIP9																																		// statt 5
IF ~Global("NQ#SHUKSHLD","GLOBAL",101)~ THEN REPLY ~Welchen Schild habe ich Euch nochmal gegeben?~ GOTO EQUIP101
IF ~OR(2) Global("NQ#SHUKSHLD","GLOBAL",102) Global("NQ#SHUKSHLD","GLOBAL",103)~ THEN REPLY ~Welchen Schild habe ich Euch nochmal gegeben?~ GOTO EQUIP102
IF ~Global("NQ#SHUKSHLD","GLOBAL",104)~ THEN REPLY ~Welchen Schild habe ich Euch nochmal gegeben?~ GOTO EQUIP104
IF ~OR(2) Global("NQ#SHUKSHLD","GLOBAL",105) Global("NQ#SHUKSHLD","GLOBAL",106)~ THEN REPLY ~Welchen Schild habe ich Euch nochmal gegeben?~ GOTO EQUIP105
IF ~Global("NQ#SHUKSHLD","GLOBAL",107)~ THEN REPLY ~Welchen Schild habe ich Euch nochmal gegeben?~ GOTO EQUIP107
IF ~GlobalGT("NQ#SHUKSHLD","GLOBAL",100) GlobalLT("NQ#SHUKSHLD","GLOBAL",108)~ THEN REPLY ~Gebt mir Euren Schild!~ DO ~SetGlobal("NQ#SHUKSHLDEQ","LOCALS",0) SetGlobal("NQ#SHUKSHLD","GLOBAL",100)~ GOTO EQUIP2
IF ~GlobalGT("NQ#SHUKSHLD","GLOBAL",100) GlobalLT("NQ#SHUKSHLD","GLOBAL",108)~ THEN REPLY ~Ich habe einen anderen Schild für Euch.~ DO ~SetGlobal("NQ#SHUKSHLDEQ","LOCALS",0) SetGlobal("NQ#SHUKSHLD","GLOBAL",100)~ GOTO EQUIP4
IF ~GlobalLT("NQ#SHUKSHLD","GLOBAL",101)~ THEN REPLY ~Ich habe einen Schild für Euch.~ DO ~~ GOTO EQUIP5
IF ~~ THEN REPLY ~Nichts, es geht weiter!~ DO ~~ GOTO BYE1
END

// Waffe

// Global("NQ#SHUKAX","GLOBAL",0) - Keine Axt ausgerüstet -> Nimm 1 oder 2
// Global("NQ#SHUKAX","GLOBAL",1) - Streitaxt
// Global("NQ#SHUKAX","GLOBAL",2) - Streitaxt +1
// Global("NQ#SHUKAX","GLOBAL",3) - Streitaxt von Mauletar +2
// Global("NQ#SHUKAX","GLOBAL",4) - Krunt Axt

// Global("NQ#SHUKAXEQ","LOCALS",3) - Standartwaffen überprüfen

IF ~~ THEN BEGIN WP1
SAY ~Und ich möchte sie Dir auf den dummen Kopf hauen, <RACE>.~
IF ~!HasItem("NQ#SPR31",Myself) PartyHasItemIdentified("AX1H03") OR(2) Global("NQ#SHUKAX","GLOBAL",1) Global("NQ#SHUKAX","GLOBAL",2)~ THEN REPLY ~Nehmt die Streitaxt von Mauletar +2.~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",3) ActionOverride(Player1,TakePartyItem("AX1H03")) ActionOverride(Player1,DestroyItem("AX1H03")) SetGlobal("NQ#SHUKAXEQ","LOCALS",0)~ GOTO MAUL1
IF ~!HasItem("NQ#SPR31",Myself) PartyHasItemIdentified("AX1H03") Global("NQ#SHUKKRUNTAX","GLOBAL",3)~ THEN REPLY ~Nehmt die Streitaxt von Mauletar +2.~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",3) ActionOverride(Player1,TakePartyItem("AX1H03")) ActionOverride(Player1,DestroyItem("AX1H03")) SetGlobal("NQ#SHUKKRUNTAX","GLOBAL",4) GiveItemCreate("BDAX1H02",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDAX1H02",IDENTIFIED,TRUE)) SetGlobal("NQ#SHUKAXEQ","LOCALS",0)~ GOTO MAUL2
IF ~Global("NQ#SHUKAX","GLOBAL",3)~ THEN REPLY ~Gebt mir die Streitaxt von Mauletar +2.~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",0) GiveItemCreate("AX1H03",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("AX1H03",IDENTIFIED,TRUE)) SetGlobal("NQ#SHUKAXEQ","LOCALS",0)~ GOTO MAUL3
IF ~!HasItem("NQ#SPR31",Myself) Global("NQ#SHUKAX","GLOBAL",3) PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKKRUNTAX","GLOBAL",2)~ THEN REPLY ~Hier, nehmt Kruntur's Axt +2.~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",4) ActionOverride(Player1,TakePartyItem("BDAX1H02")) ActionOverride(Player1,DestroyItem("BDAX1H02")) GiveItemCreate("AX1H03",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("AX1H03",IDENTIFIED,TRUE)) SetGlobal("NQ#SHUKAXEQ","LOCALS",0)~ GOTO KRUNT4
IF ~!HasItem("NQ#SPR31",Myself) Global("NQ#SHUKAX","GLOBAL",3) PartyHasItemIdentified("BDAX1H02") GlobalGT("NQ#SHUKKRUNTAX","GLOBAL",2)~ THEN REPLY ~Hier, nehmt Kruntur's Axt +2.~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",4) ActionOverride(Player1,TakePartyItem("BDAX1H02")) ActionOverride(Player1,DestroyItem("BDAX1H02")) GiveItemCreate("AX1H03",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("AX1H03",IDENTIFIED,TRUE)) SetGlobal("NQ#SHUKAXEQ","LOCALS",0)~ GOTO KRUNT10
IF ~!HasItem("NQ#SPR31",Myself) !Global("NQ#SHUKAX","GLOBAL",3) PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKKRUNTAX","GLOBAL",2)~ THEN REPLY ~Hier, nehmt Kruntur's Axt +2.~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",4) ActionOverride(Player1,TakePartyItem("BDAX1H02")) ActionOverride(Player1,DestroyItem("BDAX1H02")) SetGlobal("NQ#SHUKAXEQ","LOCALS",0)~ GOTO KRUNT4
IF ~!HasItem("NQ#SPR31",Myself) !Global("NQ#SHUKAX","GLOBAL",3) PartyHasItemIdentified("BDAX1H02") GlobalGT("NQ#SHUKKRUNTAX","GLOBAL",2)~ THEN REPLY ~Hier, nehmt Kruntur's Axt +2.~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",4) ActionOverride(Player1,TakePartyItem("BDAX1H02")) ActionOverride(Player1,DestroyItem("BDAX1H02")) SetGlobal("NQ#SHUKAXEQ","LOCALS",0)~ GOTO KRUNT10
IF ~Global("NQ#SHUKAX","GLOBAL",4)~ THEN REPLY ~Gebt mir Kruntur's Axt +2 zurück!~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",0) GiveItemCreate("BDAX1H02",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDAX1H02",IDENTIFIED,TRUE)) SetGlobal("NQ#SHUKAXEQ","LOCALS",0)~ GOTO KRUNT11
IF ~~ THEN REPLY ~Egal, es geht weiter!~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN WP2
SAY ~Hast Du was Besseres?~
IF ~!HasItem("NQ#SPR31",Myself) PartyHasItemIdentified("AX1H03") OR(2) Global("NQ#SHUKAX","GLOBAL",1) Global("NQ#SHUKAX","GLOBAL",2)~ THEN REPLY ~Nehmt die Streitaxt von Mauletar +2.~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",3) ActionOverride(Player1,TakePartyItem("AX1H03")) ActionOverride(Player1,DestroyItem("AX1H03")) SetGlobal("NQ#SHUKAXEQ","LOCALS",0)~ GOTO MAUL1
IF ~!HasItem("NQ#SPR31",Myself) PartyHasItemIdentified("AX1H03") Global("NQ#SHUKKRUNTAX","GLOBAL",3)~ THEN REPLY ~Nehmt die Streitaxt von Mauletar +2.~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",3) ActionOverride(Player1,TakePartyItem("AX1H03")) ActionOverride(Player1,DestroyItem("AX1H03")) SetGlobal("NQ#SHUKKRUNTAX","GLOBAL",4) GiveItemCreate("BDAX1H02",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDAX1H02",IDENTIFIED,TRUE)) SetGlobal("NQ#SHUKAXEQ","LOCALS",0)~ GOTO MAUL2
IF ~Global("NQ#SHUKAX","GLOBAL",3)~ THEN REPLY ~Gebt mir die Streitaxt von Mauletar +2.~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",0) GiveItemCreate("AX1H03",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("AX1H03",IDENTIFIED,TRUE)) SetGlobal("NQ#SHUKAXEQ","LOCALS",0)~ GOTO MAUL3
IF ~!HasItem("NQ#SPR31",Myself) Global("NQ#SHUKAX","GLOBAL",3) PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKKRUNTAX","GLOBAL",2)~ THEN REPLY ~Hier, nehmt Kruntur's Axt +2.~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",4) ActionOverride(Player1,TakePartyItem("BDAX1H02")) ActionOverride(Player1,DestroyItem("BDAX1H02")) GiveItemCreate("AX1H03",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("AX1H03",IDENTIFIED,TRUE)) SetGlobal("NQ#SHUKAXEQ","LOCALS",0)~ GOTO KRUNT4
IF ~!HasItem("NQ#SPR31",Myself) Global("NQ#SHUKAX","GLOBAL",3) PartyHasItemIdentified("BDAX1H02") GlobalGT("NQ#SHUKKRUNTAX","GLOBAL",2)~ THEN REPLY ~Hier, nehmt Kruntur's Axt +2.~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",4) ActionOverride(Player1,TakePartyItem("BDAX1H02")) ActionOverride(Player1,DestroyItem("BDAX1H02")) GiveItemCreate("AX1H03",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("AX1H03",IDENTIFIED,TRUE)) SetGlobal("NQ#SHUKAXEQ","LOCALS",0)~ GOTO KRUNT10
IF ~!HasItem("NQ#SPR31",Myself) !Global("NQ#SHUKAX","GLOBAL",3) PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKKRUNTAX","GLOBAL",2)~ THEN REPLY ~Hier, nehmt Kruntur's Axt +2.~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",4) ActionOverride(Player1,TakePartyItem("BDAX1H02")) ActionOverride(Player1,DestroyItem("BDAX1H02")) SetGlobal("NQ#SHUKAXEQ","LOCALS",0)~ GOTO KRUNT4
IF ~!HasItem("NQ#SPR31",Myself) !Global("NQ#SHUKAX","GLOBAL",3) PartyHasItemIdentified("BDAX1H02") GlobalGT("NQ#SHUKKRUNTAX","GLOBAL",2)~ THEN REPLY ~Hier, nehmt Kruntur's Axt +2.~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",4) ActionOverride(Player1,TakePartyItem("BDAX1H02")) ActionOverride(Player1,DestroyItem("BDAX1H02")) SetGlobal("NQ#SHUKAXEQ","LOCALS",0)~ GOTO KRUNT10
IF ~Global("NQ#SHUKAX","GLOBAL",4)~ THEN REPLY ~Gebt mir Kruntur's Axt +2 zurück!~ DO ~SetGlobal("NQ#SHUKAX","GLOBAL",0) GiveItemCreate("BDAX1H02",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDAX1H02",IDENTIFIED,TRUE)) SetGlobal("NQ#SHUKAXEQ","LOCALS",0)~ GOTO KRUNT11
IF ~~ THEN REPLY ~Egal, es geht weiter!~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN MAUL1
SAY ~Warum nicht... Trottel.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN MAUL2
SAY ~Was soll ich mit dem Mist!? Kruntur's... ähm Shuk's Axt gehört zu mir!~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN MAUL3
SAY ~Dann nimm Deinen rostigen Dreck halt zurück!~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN EQUIP101
SAY ~Das ist Kiels Tartsche, Blindfisch.~
IF ~!HasItem("NQ#SPR31",Myself) OR(4) PartyHasItemIdentified("AX1H03") PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKAX","GLOBAL",3) Global("NQ#SHUKAX","GLOBAL",4) GlobalLT("NQ#NICESHUK","GLOBAL",10)~ THEN REPLY ~Ich möchte über Eure Axt reden.~ GOTO WP1
IF ~!HasItem("NQ#SPR31",Myself) OR(4) PartyHasItemIdentified("AX1H03") PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKAX","GLOBAL",3) Global("NQ#SHUKAX","GLOBAL",4) GlobalGT("NQ#NICESHUK","GLOBAL",9)~ THEN REPLY ~Reden wir über Eure Axt.~ GOTO WP2
IF ~Global("NQ#SHUKARMOR","GLOBAL",101)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP201
IF ~Global("NQ#SHUKARMOR","GLOBAL",103)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP202
IF ~Global("NQ#SHUKARMOR","GLOBAL",102)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP203
IF ~Global("NQ#SHUKARMOR","GLOBAL",104)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP204 // Goblin Hide Armor +2
IF ~Global("NQ#SHUKARMOR","GLOBAL",105)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP205 // Raconteur's Regalia +2
IF ~Global("NQ#SHUKARMOR","GLOBAL",106)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP206 // Changeling's Vest
IF ~Global("NQ#SHUKARMOR","GLOBAL",107)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP207 // Dragonscale Armor
IF ~Global("NQ#SHUKARMOR","GLOBAL",108)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP208 // Goblin Leathers +1
IF ~Global("NQ#SHUKARMOR","GLOBAL",109)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP209 // The Night's Embrace +3
IF ~Global("NQ#SHUKARMOR","GLOBAL",110)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP210 // Hide Armor +1 (110) EQUIP210
IF ~Global("NQ#SHUKARMOR","GLOBAL",111)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP211 // Jegg's Leathers +2  (111) EQUIP211
IF ~Global("NQ#SHUKARMOR","GLOBAL",112)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP212 // Kruntur's Armor +3  (112) EQUIP212
IF ~GlobalGT("NQ#SHUKARMOR","GLOBAL",100) GlobalLT("NQ#SHUKARMOR","GLOBAL",112)~ THEN REPLY ~Gebt mir Eure Rüstung!~ DO ~SetGlobal("NQ#SHUKARMOREQ","LOCALS",0) SetGlobal("NQ#SHUKARMOR","GLOBAL",100)~ GOTO EQUIP6							// statt 2
IF ~GlobalGT("NQ#SHUKARMOR","GLOBAL",100) GlobalLT("NQ#SHUKARMOR","GLOBAL",112)~ THEN REPLY ~Ich habe eine andere Rüstung für Euch.~ DO ~SetGlobal("NQ#SHUKARMOREQ","LOCALS",0) SetGlobal("NQ#SHUKARMOR","GLOBAL",100)~ GOTO EQUIP8			// statt 4		
IF ~GlobalLT("NQ#SHUKARMOR","GLOBAL",101)~ THEN REPLY ~Ich habe eine Rüstung für Euch.~ DO ~~ GOTO EQUIP9
IF ~GlobalGT("NQ#SHUKSHLD","GLOBAL",100) GlobalLT("NQ#SHUKSHLD","GLOBAL",108)~ THEN REPLY ~Gebt mir Euren Schild!~ DO ~SetGlobal("NQ#SHUKSHLDEQ","LOCALS",0) SetGlobal("NQ#SHUKSHLD","GLOBAL",100)~ GOTO EQUIP2
IF ~GlobalGT("NQ#SHUKSHLD","GLOBAL",100) GlobalLT("NQ#SHUKSHLD","GLOBAL",108)~ THEN REPLY ~Ich habe einen anderen Schild für Euch.~ DO ~SetGlobal("NQ#SHUKSHLDEQ","LOCALS",0) SetGlobal("NQ#SHUKSHLD","GLOBAL",100)~ GOTO EQUIP4
IF ~~ THEN REPLY ~Gut, es geht weiter!~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN EQUIP102
SAY ~Das ist ein kleiner Schild +1, Volleule.~
IF ~!HasItem("NQ#SPR31",Myself) OR(4) PartyHasItemIdentified("AX1H03") PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKAX","GLOBAL",3) Global("NQ#SHUKAX","GLOBAL",4) GlobalLT("NQ#NICESHUK","GLOBAL",10)~ THEN REPLY ~Ich möchte über Eure Axt reden.~ GOTO WP1
IF ~!HasItem("NQ#SPR31",Myself) OR(4) PartyHasItemIdentified("AX1H03") PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKAX","GLOBAL",3) Global("NQ#SHUKAX","GLOBAL",4) GlobalGT("NQ#NICESHUK","GLOBAL",9)~ THEN REPLY ~Reden wir über Eure Axt.~ GOTO WP2
IF ~Global("NQ#SHUKARMOR","GLOBAL",101)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP201
IF ~Global("NQ#SHUKARMOR","GLOBAL",103)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP202
IF ~Global("NQ#SHUKARMOR","GLOBAL",102)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP203
IF ~Global("NQ#SHUKARMOR","GLOBAL",104)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP204 // Goblin Hide Armor +2
IF ~Global("NQ#SHUKARMOR","GLOBAL",105)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP205 // Raconteur's Regalia +2
IF ~Global("NQ#SHUKARMOR","GLOBAL",106)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP206 // Changeling's Vest
IF ~Global("NQ#SHUKARMOR","GLOBAL",107)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP207 // Dragonscale Armor
IF ~Global("NQ#SHUKARMOR","GLOBAL",108)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP208 // Goblin Leathers +1
IF ~Global("NQ#SHUKARMOR","GLOBAL",109)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP209 // The Night's Embrace +3
IF ~Global("NQ#SHUKARMOR","GLOBAL",110)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP210 // Hide Armor +1 (110) EQUIP210
IF ~Global("NQ#SHUKARMOR","GLOBAL",111)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP211 // Jegg's Leathers +2  (111) EQUIP211
IF ~Global("NQ#SHUKARMOR","GLOBAL",112)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP212 // Kruntur's Armor +3  (112) EQUIP212
IF ~GlobalGT("NQ#SHUKARMOR","GLOBAL",100) GlobalLT("NQ#SHUKARMOR","GLOBAL",113)~ THEN REPLY ~Gebt mir Eure Rüstung!~ DO ~SetGlobal("NQ#SHUKARMOREQ","LOCALS",0) SetGlobal("NQ#SHUKARMOR","GLOBAL",100)~ GOTO EQUIP6							// statt 2
IF ~GlobalGT("NQ#SHUKARMOR","GLOBAL",100) GlobalLT("NQ#SHUKARMOR","GLOBAL",113)~ THEN REPLY ~Ich habe eine andere Rüstung für Euch.~ DO ~SetGlobal("NQ#SHUKARMOREQ","LOCALS",0) SetGlobal("NQ#SHUKARMOR","GLOBAL",100)~ GOTO EQUIP8			// statt 4		
IF ~GlobalLT("NQ#SHUKARMOR","GLOBAL",101)~ THEN REPLY ~Ich habe eine Rüstung für Euch.~ DO ~~ GOTO EQUIP9
IF ~GlobalGT("NQ#SHUKSHLD","GLOBAL",100) GlobalLT("NQ#SHUKSHLD","GLOBAL",108)~ THEN REPLY ~Gebt mir Euren Schild!~ DO ~SetGlobal("NQ#SHUKSHLDEQ","LOCALS",0) SetGlobal("NQ#SHUKSHLD","GLOBAL",100)~ GOTO EQUIP2
IF ~GlobalGT("NQ#SHUKSHLD","GLOBAL",100) GlobalLT("NQ#SHUKSHLD","GLOBAL",108)~ THEN REPLY ~Ich habe einen anderen Schild für Euch.~ DO ~SetGlobal("NQ#SHUKSHLDEQ","LOCALS",0) SetGlobal("NQ#SHUKSHLD","GLOBAL",100)~ GOTO EQUIP4
IF ~~ THEN REPLY ~Gut, es geht weiter!~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN EQUIP104
SAY ~Das ist ein kleiner Schild +2, Glubschauge.~
IF ~!HasItem("NQ#SPR31",Myself) OR(4) PartyHasItemIdentified("AX1H03") PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKAX","GLOBAL",3) Global("NQ#SHUKAX","GLOBAL",4) GlobalLT("NQ#NICESHUK","GLOBAL",10)~ THEN REPLY ~Ich möchte über Eure Axt reden.~ GOTO WP1
IF ~!HasItem("NQ#SPR31",Myself) OR(4) PartyHasItemIdentified("AX1H03") PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKAX","GLOBAL",3) Global("NQ#SHUKAX","GLOBAL",4) GlobalGT("NQ#NICESHUK","GLOBAL",9)~ THEN REPLY ~Reden wir über Eure Axt.~ GOTO WP2
IF ~Global("NQ#SHUKARMOR","GLOBAL",101)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP201
IF ~Global("NQ#SHUKARMOR","GLOBAL",103)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP202
IF ~Global("NQ#SHUKARMOR","GLOBAL",102)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP203
IF ~Global("NQ#SHUKARMOR","GLOBAL",104)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP204 // Goblin Hide Armor +2
IF ~Global("NQ#SHUKARMOR","GLOBAL",105)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP205 // Raconteur's Regalia +2
IF ~Global("NQ#SHUKARMOR","GLOBAL",106)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP206 // Changeling's Vest
IF ~Global("NQ#SHUKARMOR","GLOBAL",107)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP207 // Dragonscale Armor
IF ~Global("NQ#SHUKARMOR","GLOBAL",108)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP208 // Goblin Leathers +1
IF ~Global("NQ#SHUKARMOR","GLOBAL",109)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP209 // The Night's Embrace +3
IF ~Global("NQ#SHUKARMOR","GLOBAL",110)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP210 // Hide Armor +1 (110) EQUIP210
IF ~Global("NQ#SHUKARMOR","GLOBAL",111)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP211 // Jegg's Leathers +2  (111) EQUIP211
IF ~Global("NQ#SHUKARMOR","GLOBAL",112)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP212 // Kruntur's Armor +3  (112) EQUIP212
IF ~GlobalGT("NQ#SHUKARMOR","GLOBAL",100) GlobalLT("NQ#SHUKARMOR","GLOBAL",112)~ THEN REPLY ~Gebt mir Eure Rüstung!~ DO ~SetGlobal("NQ#SHUKARMOREQ","LOCALS",0) SetGlobal("NQ#SHUKARMOR","GLOBAL",100)~ GOTO EQUIP6							// statt 2
IF ~GlobalGT("NQ#SHUKARMOR","GLOBAL",100) GlobalLT("NQ#SHUKARMOR","GLOBAL",112)~ THEN REPLY ~Ich habe eine andere Rüstung für Euch.~ DO ~SetGlobal("NQ#SHUKARMOREQ","LOCALS",0) SetGlobal("NQ#SHUKARMOR","GLOBAL",100)~ GOTO EQUIP8			// statt 4		
IF ~GlobalLT("NQ#SHUKARMOR","GLOBAL",101)~ THEN REPLY ~Ich habe eine Rüstung für Euch.~ DO ~~ GOTO EQUIP9
IF ~GlobalGT("NQ#SHUKSHLD","GLOBAL",100) GlobalLT("NQ#SHUKSHLD","GLOBAL",108)~ THEN REPLY ~Gebt mir Euren Schild!~ DO ~SetGlobal("NQ#SHUKSHLDEQ","LOCALS",0) SetGlobal("NQ#SHUKSHLD","GLOBAL",100)~ GOTO EQUIP2
IF ~GlobalGT("NQ#SHUKSHLD","GLOBAL",100) GlobalLT("NQ#SHUKSHLD","GLOBAL",108)~ THEN REPLY ~Ich habe einen anderen Schild für Euch.~ DO ~SetGlobal("NQ#SHUKSHLDEQ","LOCALS",0) SetGlobal("NQ#SHUKSHLD","GLOBAL",100)~ GOTO EQUIP4
IF ~~ THEN REPLY ~Gut, es geht weiter!~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN EQUIP105
SAY ~Das ist ein mittlerer Schild +1, Hohlbirne.~
IF ~!HasItem("NQ#SPR31",Myself) OR(4) PartyHasItemIdentified("AX1H03") PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKAX","GLOBAL",3) Global("NQ#SHUKAX","GLOBAL",4) GlobalLT("NQ#NICESHUK","GLOBAL",10)~ THEN REPLY ~Ich möchte über Eure Axt reden.~ GOTO WP1
IF ~!HasItem("NQ#SPR31",Myself) OR(4) PartyHasItemIdentified("AX1H03") PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKAX","GLOBAL",3) Global("NQ#SHUKAX","GLOBAL",4) GlobalGT("NQ#NICESHUK","GLOBAL",9)~ THEN REPLY ~Reden wir über Eure Axt.~ GOTO WP2
IF ~Global("NQ#SHUKARMOR","GLOBAL",101)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP201
IF ~Global("NQ#SHUKARMOR","GLOBAL",103)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP202
IF ~Global("NQ#SHUKARMOR","GLOBAL",102)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP203
IF ~Global("NQ#SHUKARMOR","GLOBAL",104)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP204 // Goblin Hide Armor +2
IF ~Global("NQ#SHUKARMOR","GLOBAL",105)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP205 // Raconteur's Regalia +2
IF ~Global("NQ#SHUKARMOR","GLOBAL",106)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP206 // Changeling's Vest
IF ~Global("NQ#SHUKARMOR","GLOBAL",107)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP207 // Dragonscale Armor
IF ~Global("NQ#SHUKARMOR","GLOBAL",108)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP208 // Goblin Leathers +1
IF ~Global("NQ#SHUKARMOR","GLOBAL",109)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP209 // The Night's Embrace +3
IF ~Global("NQ#SHUKARMOR","GLOBAL",110)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP210 // Hide Armor +1 (110) EQUIP210
IF ~Global("NQ#SHUKARMOR","GLOBAL",111)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP211 // Jegg's Leathers +2  (111) EQUIP211
IF ~Global("NQ#SHUKARMOR","GLOBAL",112)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP212 // Kruntur's Armor +3  (112) EQUIP212
IF ~GlobalGT("NQ#SHUKARMOR","GLOBAL",100) GlobalLT("NQ#SHUKARMOR","GLOBAL",112)~ THEN REPLY ~Gebt mir Eure Rüstung!~ DO ~SetGlobal("NQ#SHUKARMOREQ","LOCALS",0) SetGlobal("NQ#SHUKARMOR","GLOBAL",100)~ GOTO EQUIP6							// statt 2
IF ~GlobalGT("NQ#SHUKARMOR","GLOBAL",100) GlobalLT("NQ#SHUKARMOR","GLOBAL",112)~ THEN REPLY ~Ich habe eine andere Rüstung für Euch.~ DO ~SetGlobal("NQ#SHUKARMOREQ","LOCALS",0) SetGlobal("NQ#SHUKARMOR","GLOBAL",100)~ GOTO EQUIP8			// statt 4		
IF ~GlobalLT("NQ#SHUKARMOR","GLOBAL",101)~ THEN REPLY ~Ich habe eine Rüstung für Euch.~ DO ~~ GOTO EQUIP9
IF ~GlobalGT("NQ#SHUKSHLD","GLOBAL",100) GlobalLT("NQ#SHUKSHLD","GLOBAL",108)~ THEN REPLY ~Gebt mir Euren Schild!~ DO ~SetGlobal("NQ#SHUKSHLDEQ","LOCALS",0) SetGlobal("NQ#SHUKSHLD","GLOBAL",100)~ GOTO EQUIP2
IF ~GlobalGT("NQ#SHUKSHLD","GLOBAL",100) GlobalLT("NQ#SHUKSHLD","GLOBAL",108)~ THEN REPLY ~Ich habe einen anderen Schild für Euch.~ DO ~SetGlobal("NQ#SHUKSHLDEQ","LOCALS",0) SetGlobal("NQ#SHUKSHLD","GLOBAL",100)~ GOTO EQUIP4
IF ~~ THEN REPLY ~Gut, es geht weiter!~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN EQUIP107
SAY ~Das ist ein mittlerer Schild +2, Eierkopf.~
IF ~!HasItem("NQ#SPR31",Myself) OR(4) PartyHasItemIdentified("AX1H03") PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKAX","GLOBAL",3) Global("NQ#SHUKAX","GLOBAL",4) GlobalLT("NQ#NICESHUK","GLOBAL",10)~ THEN REPLY ~Ich möchte über Eure Axt reden.~ GOTO WP1
IF ~!HasItem("NQ#SPR31",Myself) OR(4) PartyHasItemIdentified("AX1H03") PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKAX","GLOBAL",3) Global("NQ#SHUKAX","GLOBAL",4) GlobalGT("NQ#NICESHUK","GLOBAL",9)~ THEN REPLY ~Reden wir über Eure Axt.~ GOTO WP2
IF ~Global("NQ#SHUKARMOR","GLOBAL",101)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP201
IF ~Global("NQ#SHUKARMOR","GLOBAL",103)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP202
IF ~Global("NQ#SHUKARMOR","GLOBAL",102)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP203
IF ~Global("NQ#SHUKARMOR","GLOBAL",104)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP204 // Goblin Hide Armor +2
IF ~Global("NQ#SHUKARMOR","GLOBAL",105)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP205 // Raconteur's Regalia +2
IF ~Global("NQ#SHUKARMOR","GLOBAL",106)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP206 // Changeling's Vest
IF ~Global("NQ#SHUKARMOR","GLOBAL",107)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP207 // Dragonscale Armor
IF ~Global("NQ#SHUKARMOR","GLOBAL",108)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP208 // Goblin Leathers +1
IF ~Global("NQ#SHUKARMOR","GLOBAL",109)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP209 // The Night's Embrace +3
IF ~Global("NQ#SHUKARMOR","GLOBAL",110)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP210 // Hide Armor +1 (110) EQUIP210
IF ~Global("NQ#SHUKARMOR","GLOBAL",111)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP211 // Jegg's Leathers +2  (111) EQUIP211
IF ~Global("NQ#SHUKARMOR","GLOBAL",112)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP212 // Kruntur's Armor +3  (112) EQUIP212
IF ~GlobalGT("NQ#SHUKARMOR","GLOBAL",100) GlobalLT("NQ#SHUKARMOR","GLOBAL",112)~ THEN REPLY ~Gebt mir Eure Rüstung!~ DO ~SetGlobal("NQ#SHUKARMOREQ","LOCALS",0) SetGlobal("NQ#SHUKARMOR","GLOBAL",100)~ GOTO EQUIP6							// statt 2
IF ~GlobalGT("NQ#SHUKARMOR","GLOBAL",100) GlobalLT("NQ#SHUKARMOR","GLOBAL",112)~ THEN REPLY ~Ich habe eine andere Rüstung für Euch.~ DO ~SetGlobal("NQ#SHUKARMOREQ","LOCALS",0) SetGlobal("NQ#SHUKARMOR","GLOBAL",100)~ GOTO EQUIP8			// statt 4		
IF ~GlobalLT("NQ#SHUKARMOR","GLOBAL",101)~ THEN REPLY ~Ich habe eine Rüstung für Euch.~ DO ~~ GOTO EQUIP9
IF ~GlobalGT("NQ#SHUKSHLD","GLOBAL",100) GlobalLT("NQ#SHUKSHLD","GLOBAL",108)~ THEN REPLY ~Gebt mir Euren Schild!~ DO ~SetGlobal("NQ#SHUKSHLDEQ","LOCALS",0) SetGlobal("NQ#SHUKSHLD","GLOBAL",100)~ GOTO EQUIP2
IF ~GlobalGT("NQ#SHUKSHLD","GLOBAL",100) GlobalLT("NQ#SHUKSHLD","GLOBAL",108)~ THEN REPLY ~Ich habe einen anderen Schild für Euch.~ DO ~SetGlobal("NQ#SHUKSHLDEQ","LOCALS",0) SetGlobal("NQ#SHUKSHLD","GLOBAL",100)~ GOTO EQUIP4
IF ~~ THEN REPLY ~Gut, es geht weiter!~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN EQUIP201
SAY ~Einen beschlagenen Lederwams +1, Erbsenhirn.~
IF ~~ THEN GOTO EQUIP299
END

IF ~~ THEN BEGIN EQUIP202
SAY ~Einen beschlagenen Lederwams +2, Strohkopf.~
IF ~~ THEN GOTO EQUIP299
END

IF ~~ THEN BEGIN EQUIP203
SAY ~Telbars beschlagenen Lederwams +2, Strohkopf.~
IF ~~ THEN GOTO EQUIP299
END

// BD

IF ~~ THEN BEGIN EQUIP204
SAY ~Die Goblin Hide Armor +2, dampfender Kothaufen.~
IF ~~ THEN GOTO EQUIP299
END

IF ~~ THEN BEGIN EQUIP205
SAY ~Raconteur's Regalia +2, blubbernde Schwabbelbacke.~
IF ~~ THEN GOTO EQUIP299
END

IF ~~ THEN BEGIN EQUIP206
SAY ~Die Weste des Wechselbalgs, schielende Hackfresse.~
IF ~~ THEN GOTO EQUIP299
END

IF ~~ THEN BEGIN EQUIP207
SAY ~Die grüne Drachenschuppenrüstung, dreckiger Arschling.~
IF ~~ THEN GOTO EQUIP299
END

IF ~~ THEN BEGIN EQUIP208
SAY ~Das Goblinleder +1, Mistsack.~
IF ~~ THEN GOTO EQUIP299
END

IF ~~ THEN BEGIN EQUIP209
SAY ~Die Umarmung der Nacht +3, hohler Furzkopf.~
IF ~~ THEN GOTO EQUIP299
END

IF ~~ THEN BEGIN EQUIP210
SAY ~Die Hide Armor +1, gieriger Koboldfreund.~
IF ~~ THEN GOTO EQUIP299
END

IF ~~ THEN BEGIN EQUIP211
SAY ~Das ist Jegg's Leder +2, hirnloser Hirnfisch.~
IF ~~ THEN GOTO EQUIP299
END

IF ~~ THEN BEGIN EQUIP212
SAY ~Kruntur's Rüstung +3, pah! Jetzt ist es Shuk's Rüstung +3!~
IF ~~ THEN GOTO EQUIP299
END

IF ~~ THEN BEGIN EQUIP299
SAY ~Was ist damit?~
IF ~!HasItem("NQ#SPR31",Myself) OR(4) PartyHasItemIdentified("AX1H03") PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKAX","GLOBAL",3) Global("NQ#SHUKAX","GLOBAL",4) GlobalLT("NQ#NICESHUK","GLOBAL",10)~ THEN REPLY ~Ich möchte über Eure Axt reden.~ GOTO WP1
IF ~!HasItem("NQ#SPR31",Myself) OR(4) PartyHasItemIdentified("AX1H03") PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKAX","GLOBAL",3) Global("NQ#SHUKAX","GLOBAL",4) GlobalGT("NQ#NICESHUK","GLOBAL",9)~ THEN REPLY ~Reden wir über Eure Axt.~ GOTO WP2
IF ~GlobalGT("NQ#SHUKARMOR","GLOBAL",100) GlobalLT("NQ#SHUKARMOR","GLOBAL",113)~ THEN REPLY ~Gebt mir die Rüstung!~ DO ~SetGlobal("NQ#SHUKARMOREQ","LOCALS",0) SetGlobal("NQ#SHUKARMOR","GLOBAL",100)~ GOTO EQUIP6							// statt 2
IF ~GlobalGT("NQ#SHUKARMOR","GLOBAL",100) GlobalLT("NQ#SHUKARMOR","GLOBAL",113)~ THEN REPLY ~Ich habe eine andere Rüstung für Euch.~ DO ~SetGlobal("NQ#SHUKARMOREQ","LOCALS",0) SetGlobal("NQ#SHUKARMOR","GLOBAL",100)~ GOTO EQUIP8			// statt 4		
IF ~Global("NQ#SHUKSHLD","GLOBAL",101)~ THEN REPLY ~Welchen Schild habe ich Euch nochmal gegeben?~ GOTO EQUIP101
IF ~OR(2) Global("NQ#SHUKSHLD","GLOBAL",102) Global("NQ#SHUKSHLD","GLOBAL",103)~ THEN REPLY ~Welchen Schild habe ich Euch nochmal gegeben?~ GOTO EQUIP102
IF ~Global("NQ#SHUKSHLD","GLOBAL",104)~ THEN REPLY ~Welchen Schild habe ich Euch nochmal gegeben?~ GOTO EQUIP104
IF ~OR(2) Global("NQ#SHUKSHLD","GLOBAL",105) Global("NQ#SHUKSHLD","GLOBAL",106)~ THEN REPLY ~Welchen Schild habe ich Euch nochmal gegeben?~ GOTO EQUIP105
IF ~Global("NQ#SHUKSHLD","GLOBAL",107)~ THEN REPLY ~Welchen Schild habe ich Euch nochmal gegeben?~ GOTO EQUIP107
IF ~GlobalGT("NQ#SHUKSHLD","GLOBAL",100) GlobalLT("NQ#SHUKSHLD","GLOBAL",108)~ THEN REPLY ~Gebt mir Euren Schild!~ DO ~SetGlobal("NQ#SHUKSHLDEQ","LOCALS",0) SetGlobal("NQ#SHUKSHLD","GLOBAL",100)~ GOTO EQUIP2
IF ~GlobalGT("NQ#SHUKSHLD","GLOBAL",100) GlobalLT("NQ#SHUKSHLD","GLOBAL",108)~ THEN REPLY ~Ich habe einen anderen Schild für Euch.~ DO ~SetGlobal("NQ#SHUKSHLDEQ","LOCALS",0) SetGlobal("NQ#SHUKSHLD","GLOBAL",100)~ GOTO EQUIP4
IF ~GlobalLT("NQ#SHUKSHLD","GLOBAL",101)~ THEN REPLY ~Ich habe einen Schild für Euch.~ DO ~~ GOTO EQUIP5
IF ~~ THEN REPLY ~Nichts, es geht weiter!~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN EQUIP2  // Schild abgegeben
SAY ~Da, hier hast Du Deinen Schrott zurück.~
IF ~Global("NQ#SHUKSHLD","GLOBAL",101)~ THEN DO ~GiveItemCreate("SHLD20",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("SHLD20",IDENTIFIED,TRUE))~ GOTO EQUIP3
IF ~Global("NQ#SHUKSHLD","GLOBAL",102)~ THEN DO ~GiveItemCreate("SHLD02A",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("SHLD02A",IDENTIFIED,TRUE))~ GOTO EQUIP3
IF ~Global("NQ#SHUKSHLD","GLOBAL",103)~ THEN DO ~GiveItemCreate("SHLD02",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("SHLD02",IDENTIFIED,TRUE))~ GOTO EQUIP3
IF ~Global("NQ#SHUKSHLD","GLOBAL",104)~ THEN DO ~GiveItemCreate("SHLD28",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("SHLD28",IDENTIFIED,TRUE))~ GOTO EQUIP3
IF ~Global("NQ#SHUKSHLD","GLOBAL",105)~ THEN DO ~GiveItemCreate("SHLD04A",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("SHLD04A",IDENTIFIED,TRUE))~ GOTO EQUIP3
IF ~Global("NQ#SHUKSHLD","GLOBAL",106)~ THEN DO ~GiveItemCreate("SHLD04",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("SHLD04",IDENTIFIED,TRUE))~ GOTO EQUIP3
IF ~Global("NQ#SHUKSHLD","GLOBAL",107)~ THEN DO ~GiveItemCreate("SHLD29",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("SHLD29",IDENTIFIED,TRUE))~ GOTO EQUIP3
END

IF ~~ THEN BEGIN EQUIP3
SAY ~Noch was?~
IF ~OR(4) PartyHasItemIdentified("AX1H03") PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKAX","GLOBAL",3) Global("NQ#SHUKKRUNTAX","GLOBAL",3) GlobalLT("NQ#NICESHUK","GLOBAL",10)~ THEN REPLY ~Reden wir über Eure Axt.~ GOTO WP1
IF ~OR(4) PartyHasItemIdentified("AX1H03") PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKAX","GLOBAL",3) Global("NQ#SHUKKRUNTAX","GLOBAL",3) GlobalGT("NQ#NICESHUK","GLOBAL",9)~ THEN REPLY ~Reden wir über Eure Axt.~ GOTO WP2
IF ~~ THEN REPLY ~Ich habe einen anderen Schild für Euch.~ DO ~~ GOTO EQUIP5
IF ~Global("NQ#SHUKARMOR","GLOBAL",101)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP201
IF ~Global("NQ#SHUKARMOR","GLOBAL",103)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP202
IF ~Global("NQ#SHUKARMOR","GLOBAL",102)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP203
IF ~Global("NQ#SHUKARMOR","GLOBAL",104)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP204 // Goblin Hide Armor +2
IF ~Global("NQ#SHUKARMOR","GLOBAL",105)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP205 // Raconteur's Regalia +2
IF ~Global("NQ#SHUKARMOR","GLOBAL",106)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP206 // Changeling's Vest
IF ~Global("NQ#SHUKARMOR","GLOBAL",107)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP207 // Dragonscale Armor
IF ~Global("NQ#SHUKARMOR","GLOBAL",108)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP208 // Goblin Leathers +1
IF ~Global("NQ#SHUKARMOR","GLOBAL",109)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP209 // The Night's Embrace +3
IF ~Global("NQ#SHUKARMOR","GLOBAL",110)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP210 // Hide Armor +1 (110) EQUIP210
IF ~Global("NQ#SHUKARMOR","GLOBAL",111)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP211 // Jegg's Leathers +2  (111) EQUIP211
IF ~Global("NQ#SHUKARMOR","GLOBAL",112)~ THEN REPLY ~Welche Rüstung tragt Ihr?~ GOTO EQUIP212 // Kruntur's Armor +3  (112) EQUIP212
IF ~GlobalGT("NQ#SHUKARMOR","GLOBAL",100) GlobalLT("NQ#SHUKARMOR","GLOBAL",104)~ THEN REPLY ~Gebt mir Eure Rüstung!~ DO ~SetGlobal("NQ#SHUKARMOREQ","LOCALS",0) SetGlobal("NQ#SHUKARMOR","GLOBAL",100)~ GOTO EQUIP6							// statt 2
IF ~GlobalGT("NQ#SHUKARMOR","GLOBAL",100) GlobalLT("NQ#SHUKARMOR","GLOBAL",104)~ THEN REPLY ~Ich habe eine andere Rüstung für Euch.~ DO ~SetGlobal("NQ#SHUKARMOREQ","LOCALS",0) SetGlobal("NQ#SHUKARMOR","GLOBAL",100)~ GOTO EQUIP8			// statt 4		
IF ~GlobalLT("NQ#SHUKARMOR","GLOBAL",101)~ THEN REPLY ~Ich habe eine Rüstung für Euch.~ DO ~~ GOTO EQUIP9												
IF ~~ THEN REPLY ~Nein, es geht weiter!~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN EQUIP4
SAY ~Hmpf, dann nimm den Schild zurück, <RACE>. Ich hoffe jetzt kommt was Besseres!~
IF ~Global("NQ#SHUKSHLD","GLOBAL",101)~ THEN DO ~GiveItemCreate("SHLD20",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("SHLD20",IDENTIFIED,TRUE))~ GOTO EQUIP5
IF ~Global("NQ#SHUKSHLD","GLOBAL",102)~ THEN DO ~GiveItemCreate("SHLD02A",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("SHLD02A",IDENTIFIED,TRUE))~ GOTO EQUIP5
IF ~Global("NQ#SHUKSHLD","GLOBAL",103)~ THEN DO ~GiveItemCreate("SHLD02",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("SHLD02",IDENTIFIED,TRUE))~ GOTO EQUIP5
IF ~Global("NQ#SHUKSHLD","GLOBAL",104)~ THEN DO ~GiveItemCreate("SHLD28",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("SHLD28",IDENTIFIED,TRUE))~ GOTO EQUIP5
IF ~Global("NQ#SHUKSHLD","GLOBAL",105)~ THEN DO ~GiveItemCreate("SHLD04A",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("SHLD04A",IDENTIFIED,TRUE))~ GOTO EQUIP5
IF ~Global("NQ#SHUKSHLD","GLOBAL",106)~ THEN DO ~GiveItemCreate("SHLD04",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("SHLD04",IDENTIFIED,TRUE))~ GOTO EQUIP5
IF ~Global("NQ#SHUKSHLD","GLOBAL",107)~ THEN DO ~GiveItemCreate("SHLD29",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("SHLD29",IDENTIFIED,TRUE))~ GOTO EQUIP5
END

IF ~~ THEN BEGIN EQUIP5
SAY ~Also?~
IF ~PartyHasItemIdentified("SHLD20")~ THEN REPLY ~Hier nehmt Kiels Tartsche.~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",101) ActionOverride(Player1,TakePartyItem("SHLD20")) ActionOverride(Player1,DestroyItem("SHLD20"))~ GOTO SHLD6
IF ~PartyHasItemIdentified("SHLD02A")~ THEN REPLY ~Hier nehmt einen modernen kleinen Schild +1~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",102) ActionOverride(Player1,TakePartyItem("SHLD02A")) ActionOverride(Player1,DestroyItem("SHLD02A"))~ GOTO SHLD6
IF ~PartyHasItemIdentified("SHLD02")~ THEN REPLY ~Hier nehmt einen kleinen Schild +1.~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",103) ActionOverride(Player1,TakePartyItem("SHLD02")) ActionOverride(Player1,DestroyItem("SHLD02"))~ GOTO SHLD6
IF ~PartyHasItemIdentified("SHLD28")~ THEN REPLY ~Hier nehmt einen kleinen Schild +2.~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",104) ActionOverride(Player1,TakePartyItem("SHLD28")) ActionOverride(Player1,DestroyItem("SHLD28"))~ GOTO SHLD6
IF ~PartyHasItemIdentified("SHLD04A")~ THEN REPLY ~Hier nehmt einen modernen mittlerer Schild +1~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",105) ActionOverride(Player1,TakePartyItem("SHLD04A")) ActionOverride(Player1,DestroyItem("SHLD04A"))~ GOTO SHLD6
IF ~PartyHasItemIdentified("SHLD04")~ THEN REPLY ~Hier nehmt einen mittlerer Schild +1~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",106) ActionOverride(Player1,TakePartyItem("SHLD04")) ActionOverride(Player1,DestroyItem("SHLD04"))~ GOTO SHLD6
IF ~PartyHasItemIdentified("SHLD29")~ THEN REPLY ~Hier nehmt einen mittlerer Schild +2~ DO ~SetGlobal("NQ#SHUKSHLD","GLOBAL",107) ActionOverride(Player1,TakePartyItem("SHLD29")) ActionOverride(Player1,DestroyItem("SHLD29"))~ GOTO SHLD6
IF ~~ THEN REPLY ~Ich habe es mir anderes überlegt. Lebt wohl!~ DO ~~ GOTO BYE1
END



IF ~~ THEN BEGIN EQUIP6  // Rüstung abgegeben
SAY ~Da, hier hast Du Deinen Schrott zurück.~
IF ~Global("NQ#SHUKARMOR","GLOBAL",101)~ THEN DO ~GiveItemCreate("LEAT05",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("LEAT05",IDENTIFIED,TRUE))~ GOTO EQUIP7							// statt 3
IF ~Global("NQ#SHUKARMOR","GLOBAL",102)~ THEN DO ~GiveItemCreate("LEAT07",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("LEAT07",IDENTIFIED,TRUE))~ GOTO EQUIP7							// statt 3
IF ~Global("NQ#SHUKARMOR","GLOBAL",103)~ THEN DO ~GiveItemCreate("NQ#LT07",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("NQ#LT07",IDENTIFIED,TRUE))~ GOTO EQUIP7						// statt 3

IF ~Global("NQ#SHUKARMOR","GLOBAL",104)~ THEN DO ~GiveItemCreate("BDLEAT02",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDLEAT02",IDENTIFIED,TRUE))~ GOTO EQUIP7						// statt 3
IF ~Global("NQ#SHUKARMOR","GLOBAL",105)~ THEN DO ~GiveItemCreate("BDLEAT03",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDLEAT03",IDENTIFIED,TRUE))~ GOTO EQUIP7						// statt 3
IF ~Global("NQ#SHUKARMOR","GLOBAL",106)~ THEN DO ~GiveItemCreate("BDLEAT04",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDLEAT04",IDENTIFIED,TRUE))~ GOTO EQUIP7						// statt 3
IF ~Global("NQ#SHUKARMOR","GLOBAL",107)~ THEN DO ~GiveItemCreate("BDLEAT05",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDLEAT05",IDENTIFIED,TRUE))~ GOTO EQUIP7						// statt 3
IF ~Global("NQ#SHUKARMOR","GLOBAL",108)~ THEN DO ~GiveItemCreate("BDLEAT06",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDLEAT06",IDENTIFIED,TRUE))~ GOTO EQUIP7						// statt 3
IF ~Global("NQ#SHUKARMOR","GLOBAL",109)~ THEN DO ~GiveItemCreate("BDLEAT07",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDLEAT07",IDENTIFIED,TRUE))~ GOTO EQUIP7						// statt 3
IF ~Global("NQ#SHUKARMOR","GLOBAL",110)~ THEN DO ~GiveItemCreate("BDLEAT08",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDLEAT08",IDENTIFIED,TRUE))~ GOTO EQUIP7						// statt 3
IF ~Global("NQ#SHUKARMOR","GLOBAL",111)~ THEN DO ~GiveItemCreate("BDCHAN01",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDCHAN01",IDENTIFIED,TRUE))~ GOTO EQUIP7
IF ~Global("NQ#SHUKARMOR","GLOBAL",112)~ THEN DO ~GiveItemCreate("BDCHAN02",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDCHAN02",IDENTIFIED,TRUE))~ GOTO EQUIP7	
END

IF ~~ THEN BEGIN EQUIP7
SAY ~Noch was?~
IF ~!HasItem("NQ#SPR31",Myself) OR(4) PartyHasItemIdentified("AX1H03") PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKAX","GLOBAL",3) Global("NQ#SHUKAX","GLOBAL",4) GlobalLT("NQ#NICESHUK","GLOBAL",10)~ THEN REPLY ~Ich möchte über Eure Axt reden.~ GOTO WP1
IF ~!HasItem("NQ#SPR31",Myself) OR(4) PartyHasItemIdentified("AX1H03") PartyHasItemIdentified("BDAX1H02") Global("NQ#SHUKAX","GLOBAL",3) Global("NQ#SHUKAX","GLOBAL",4) GlobalGT("NQ#NICESHUK","GLOBAL",9)~ THEN REPLY ~Reden wir über Eure Axt.~ GOTO WP2
IF ~~ THEN REPLY ~Ich habe einen andere Rüstung für Euch.~ DO ~~ GOTO EQUIP9
IF ~Global("NQ#SHUKSHLD","GLOBAL",101)~ THEN REPLY ~Welchen Schild habe ich Euch nochmal gegeben?~ GOTO EQUIP101
IF ~OR(2) Global("NQ#SHUKSHLD","GLOBAL",102) Global("NQ#SHUKSHLD","GLOBAL",103)~ THEN REPLY ~Welchen Schild habe ich Euch nochmal gegeben?~ GOTO EQUIP102
IF ~Global("NQ#SHUKSHLD","GLOBAL",104)~ THEN REPLY ~Welchen Schild habe ich Euch nochmal gegeben?~ GOTO EQUIP104
IF ~OR(2) Global("NQ#SHUKSHLD","GLOBAL",105) Global("NQ#SHUKSHLD","GLOBAL",106)~ THEN REPLY ~Welchen Schild habe ich Euch nochmal gegeben?~ GOTO EQUIP105
IF ~Global("NQ#SHUKSHLD","GLOBAL",107)~ THEN REPLY ~Welchen Schild habe ich Euch nochmal gegeben?~ GOTO EQUIP107
IF ~GlobalGT("NQ#SHUKSHLD","GLOBAL",100) GlobalLT("NQ#SHUKSHLD","GLOBAL",108)~ THEN REPLY ~Gebt mir Euren Schild!~ DO ~SetGlobal("NQ#SHUKSHLDEQ","LOCALS",0) SetGlobal("NQ#SHUKSHLD","GLOBAL",100)~ GOTO EQUIP2
IF ~GlobalGT("NQ#SHUKSHLD","GLOBAL",100) GlobalLT("NQ#SHUKSHLD","GLOBAL",108)~ THEN REPLY ~Ich habe einen anderen Schild für Euch.~ DO ~SetGlobal("NQ#SHUKSHLDEQ","LOCALS",0) SetGlobal("NQ#SHUKSHLD","GLOBAL",100)~ GOTO EQUIP4
IF ~GlobalLT("NQ#SHUKSHLD","GLOBAL",101)~ THEN REPLY ~Ich habe einen Schild für Euch.~ DO ~~ GOTO EQUIP5
IF ~~ THEN REPLY ~Nein, es geht weiter!~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN EQUIP8
SAY ~Pah, dann nimm die Rüstung zurück, <RACE>. Ich hoffe jetzt kommt was Besseres!~
IF ~Global("NQ#SHUKARMOR","GLOBAL",101)~ THEN DO ~GiveItemCreate("LEAT05",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("LEAT05",IDENTIFIED,TRUE))~ GOTO EQUIP9							// statt 5
IF ~Global("NQ#SHUKARMOR","GLOBAL",102)~ THEN DO ~GiveItemCreate("LEAT07",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("LEAT07",IDENTIFIED,TRUE))~ GOTO EQUIP9							// statt 5
IF ~Global("NQ#SHUKARMOR","GLOBAL",103)~ THEN DO ~GiveItemCreate("NQ#LT07",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("NQ#LT07",IDENTIFIED,TRUE))~ GOTO EQUIP9						// statt 3

IF ~Global("NQ#SHUKARMOR","GLOBAL",104)~ THEN DO ~GiveItemCreate("BDLEAT02",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDLEAT02",IDENTIFIED,TRUE))~ GOTO EQUIP9
IF ~Global("NQ#SHUKARMOR","GLOBAL",105)~ THEN DO ~GiveItemCreate("BDLEAT03",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDLEAT03",IDENTIFIED,TRUE))~ GOTO EQUIP9
IF ~Global("NQ#SHUKARMOR","GLOBAL",106)~ THEN DO ~GiveItemCreate("BDLEAT04",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDLEAT04",IDENTIFIED,TRUE))~ GOTO EQUIP9
IF ~Global("NQ#SHUKARMOR","GLOBAL",107)~ THEN DO ~GiveItemCreate("BDLEAT05",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDLEAT05",IDENTIFIED,TRUE))~ GOTO EQUIP9
IF ~Global("NQ#SHUKARMOR","GLOBAL",108)~ THEN DO ~GiveItemCreate("BDLEAT06",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDLEAT06",IDENTIFIED,TRUE))~ GOTO EQUIP9
IF ~Global("NQ#SHUKARMOR","GLOBAL",109)~ THEN DO ~GiveItemCreate("BDLEAT07",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDLEAT07",IDENTIFIED,TRUE))~ GOTO EQUIP9
IF ~Global("NQ#SHUKARMOR","GLOBAL",110)~ THEN DO ~GiveItemCreate("BDLEAT08",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDLEAT08",IDENTIFIED,TRUE))~ GOTO EQUIP9
IF ~Global("NQ#SHUKARMOR","GLOBAL",111)~ THEN DO ~GiveItemCreate("BDCHAN01",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDCHAN01",IDENTIFIED,TRUE))~ GOTO EQUIP9
IF ~Global("NQ#SHUKARMOR","GLOBAL",112)~ THEN DO ~GiveItemCreate("BDCHAN02",LastTalkedToBy,1,1,1) ActionOverride(LastTalkedToBy,SetItemFlags("BDCHAN02",IDENTIFIED,TRUE))~ GOTO EQUIP7
END

IF ~~ THEN BEGIN EQUIP9
SAY ~Also?~
IF ~PartyHasItemIdentified("LEAT05")~ THEN REPLY ~Hier nehmt diese beschlagene Lederrüstung +1 (RK: 6).~ DO ~SetGlobal("NQ#SHUKARMOR","GLOBAL",101) ActionOverride(Player1,TakePartyItem("LEAT05")) ActionOverride(Player1,DestroyItem("LEAT05"))~ GOTO EQUIP10
IF ~PartyHasItemIdentified("NQ#LT07")~ THEN REPLY ~Hier nehmt diese beschlagene Lederrüstung +2. (RK: 5).~ DO ~SetGlobal("NQ#SHUKARMOR","GLOBAL",103) ActionOverride(Player1,TakePartyItem("NQ#LT007")) ActionOverride(Player1,DestroyItem("NQ#LT007"))~ GOTO EQUIP10
IF ~PartyHasItemIdentified("LEAT07")~ THEN REPLY ~Hier nehmt Telbars beschlagene Lederrüstung +2. (RK: 5).~ DO ~SetGlobal("NQ#SHUKARMOR","GLOBAL",102) ActionOverride(Player1,TakePartyItem("LEAT07")) ActionOverride(Player1,DestroyItem("LEAT07"))~ GOTO EQUIP10
IF ~PartyHasItemIdentified("BDLEAT02")~ THEN REPLY ~Hier nehmt die Goblin Hide Armor +2 (RK: 4).~ DO ~SetGlobal("NQ#SHUKARMOR","GLOBAL",104) ActionOverride(Player1,TakePartyItem("BDLEAT03")) ActionOverride(Player1,DestroyItem("BDLEAT02"))~ GOTO EQUIP10
IF ~PartyHasItemIdentified("BDLEAT03")~ THEN REPLY ~Hier nehmt die Raconteurs Regalia +2 (RK: 5).~ DO ~SetGlobal("NQ#SHUKARMOR","GLOBAL",105) ActionOverride(Player1,TakePartyItem("BDLEAT03")) ActionOverride(Player1,DestroyItem("BDLEAT03"))~ GOTO EQUIP10
IF ~PartyHasItemIdentified("BDLEAT04")~ THEN REPLY ~Hier nehmt die Weste des Wechselbalgs (RK: 5).~ DO ~SetGlobal("NQ#SHUKARMOR","GLOBAL",106) ActionOverride(Player1,TakePartyItem("BDLEAT04")) ActionOverride(Player1,DestroyItem("BDLEAT04"))~ GOTO EQUIP10
IF ~PartyHasItemIdentified("BDLEAT05")~ THEN REPLY ~Hier nehmt die grüne Drachenschuppenrüstung (RK: 4).~ DO ~SetGlobal("NQ#SHUKARMOR","GLOBAL",107) ActionOverride(Player1,TakePartyItem("BDLEAT05")) ActionOverride(Player1,DestroyItem("BDLEAT05"))~ GOTO EQUIP10
IF ~PartyHasItemIdentified("BDLEAT06")~ THEN REPLY ~Hier nehmt das Goblinleder +1 (RK: 6).~ DO ~SetGlobal("NQ#SHUKARMOR","GLOBAL",108) ActionOverride(Player1,TakePartyItem("BDLEAT06")) ActionOverride(Player1,DestroyItem("BDLEAT06"))~ GOTO EQUIP10
IF ~PartyHasItemIdentified("BDLEAT07")~ THEN REPLY ~Hier nehmt die Umarmung der Nacht +3 (RK: 5).~ DO ~SetGlobal("NQ#SHUKARMOR","GLOBAL",109) ActionOverride(Player1,TakePartyItem("BDLEAT07")) ActionOverride(Player1,DestroyItem("BDLEAT07"))~ GOTO EQUIP10
IF ~PartyHasItemIdentified("BDLEAT08")~ THEN REPLY ~Hier nehmt die Hide Armor +1 (RK: 5).~ DO ~SetGlobal("NQ#SHUKARMOR","GLOBAL",110) ActionOverride(Player1,DestroyItem("BDLEAT08")) ActionOverride(Player1,TakePartyItem("BDLEAT08")) ActionOverride(Player1,DestroyItem("BDLEAT08"))~ GOTO EQUIP10
IF ~PartyHasItemIdentified("BDCHAN01")~ THEN REPLY ~Hier nehmt Jeggs Leder +2 (RK: 5).~ DO ~SetGlobal("NQ#SHUKARMOR","GLOBAL",111) ActionOverride(Player1,TakePartyItem("BDCHAN01")) ActionOverride(Player1,DestroyItem("BDCHAN01"))~ GOTO EQUIP10
IF ~PartyHasItemIdentified("BDCHAN02")~ THEN REPLY ~Hier nehmt Kruntur's Rüstung +3 (RK: 3).~ DO ~SetGlobal("NQ#SHUKARMOR","GLOBAL",112) ActionOverride(Player1,TakePartyItem("BDCHAN02")) ActionOverride(Player1,DestroyItem("BDCHAN02"))~ GOTO EQUIP10
IF ~~ THEN REPLY ~Ich habe es mir anderes überlegt. Lebt wohl!~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN EQUIP10
SAY ~Wenn es sein muss...~
IF ~~ THEN EXIT
END

// Freundlichere Begrüßung

IF ~InPartySlot(LastTalkedToBy,0) GlobalGT("NQ#NICESHUK","GLOBAL",9)~ THEN BEGIN HI10
SAY ~Was willst Du, <CHARNAME>?~
IF ~Global("NQ#MYNAMEISSHUK","GLOBAL",0)~ THEN REPLY ~Wer seid Ihr?~ DO ~SetGlobal("NQ#MYNAMEISSHUK","GLOBAL",1)~ GOTO WHO1
IF ~GlobalGT("NQ#MYNAMEISSHUK","GLOBAL",0) !Global("NQ#SHUKSPAWNENEMY","GLOBAL",1)~ THEN REPLY ~Wir müssen über Eure Taktik sprechen.~ DO ~~ GOTO TACTICS
IF ~GlobalGT("NQ#MYNAMEISSHUK","GLOBAL",0) Global("NQ#SHUKSPAWNENEMY","GLOBAL",1)~ THEN REPLY ~Wir müssen über Eure Taktik sprechen.~ DO ~~ GOTO TACTICS2

IF ~OR(2) GlobalGT("NQ#MYNAMEISSHUK","GLOBAL",0) GlobalGT("NQ#SHUKSHLD","GLOBAL",0)~ THEN REPLY ~Ich möchte über Eure Ausrüstung sprechen.~ DO ~~ GOTO EQUIP1

IF ~Global("NQ#SHUKBIGSPIDER","GLOBAL",2) PartyHasItem("MISC60") !Global("HelpLandrin","GLOBAL",2)~ THEN REPLY ~Hier, nehmt die dicke Spinne.~ DO ~~ GOTO BIGSPIDER2
IF ~Global("NQ#SHUKBIGSPIDER","GLOBAL",2) PartyHasItem("MISC60") Global("HelpLandrin","GLOBAL",2)~ THEN REPLY ~Hier, nehmt die dicke Spinne.~ DO ~AddJournalEntry(@70001,QUEST_DONE) EraseJournalEntry(27231) EraseJournalEntry(27232) EraseJournalEntry(27233)~ GOTO BIGSPIDER2
IF ~GlobalLT("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum seid Ihr an diesen Stein gebunden?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",1)~ GOTO WHY1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",2)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",3)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",3)~ GOTO SLAVE1
IF ~Global("NQ#SHUKSTORY","GLOBAL",2)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SLAVE1
IF ~OR(2) Global("NQ#SHUKSTORY","GLOBAL",2) GlobalGT("NQ#SHUKSTORY","GLOBAL",3) GlobalLT("NQ#SHUKSTORY","GLOBAL",6)~ THEN REPLY ~Ihr hatte von anderen Drow gesprochen?~ GOTO DROW2
IF ~Global("NQ#SHUKCANJUMP","GLOBAL",0) GlobalLT("NQ#NICESHUK","GLOBAL",2)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~~ GOTO WHAT1
IF ~GlobalGT("NQ#SHUKCANJUMP","GLOBAL",0)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~~ GOTO WHAT1
IF ~Global("NQ#SHUKCANJUMP","GLOBAL",0) GlobalGT("NQ#NICESHUK","GLOBAL",1)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~SetGlobal("NQ#SHUKCANJUMP","GLOBAL",1)~ GOTO WHAT2
IF ~!GlobalTimerExpired("NQ#SHUKSPAWNTIME1","LOCALS")~ THEN REPLY ~Geht wieder in den Stein!~ DO ~~ GOTO STONE1
IF ~GlobalTimerExpired("NQ#SHUKSPAWNTIME1","LOCALS")~ THEN REPLY ~Geht wieder in den Stein!~ DO ~~ GOTO STONE2
IF ~~ THEN REPLY ~Vergesst es einfach.~ DO ~~ GOTO BYE1
END

// Begrüßung Edwin

IF ~!InPartySlot(LastTalkedToBy,0) Name("EDWIN",LastTalkedToBy) Global("NQ#EDWINSHUKDIRT","GLOBAL",0) !StateCheck(Player1,CD_STATE_NOTVALID)~ THEN BEGIN FU3
SAY ~Zieh ab, schleimige Made!~
IF ~~ THEN DO ~~ EXTERN EDWINJ DIRT
END

// Begrüßungen, wenn nicht Player1

IF ~!InPartySlot(LastTalkedToBy,0) RandomNum(6,1)~ THEN BEGIN FU1
SAY ~Mach ne Fliege, hirnloser Trottel.~
IF ~~ THEN EXIT
END

IF ~!InPartySlot(LastTalkedToBy,0) RandomNum(6,2)~ THEN BEGIN FU2
SAY ~Hat Dir schon mal wer mit ner Axt ins Gesicht gehauen? Zieh ab!~
IF ~~ THEN EXIT
END

IF ~!InPartySlot(LastTalkedToBy,0) RandomNum(6,3)~ THEN BEGIN FU3
SAY ~Ich rede nicht mit Dir, alte Mistkröte!~
IF ~~ THEN EXIT
END

IF ~!InPartySlot(LastTalkedToBy,0) RandomNum(6,4)~ THEN BEGIN FU4
SAY ~Mit Dir muss ich nicht reden, Drecksau!~
IF ~~ THEN EXIT
END

IF ~!InPartySlot(LastTalkedToBy,0) RandomNum(6,5)~ THEN BEGIN FU5
SAY ~Verzieh Dich! Penner...~
IF ~~ THEN EXIT
END

IF ~!InPartySlot(LastTalkedToBy,0) RandomNum(6,6)~ THEN BEGIN FU6
SAY ~Halt Dein dummes Gesicht nicht in meine Richtung!~
IF ~~ THEN EXIT
END

// Begrüßung PC

IF ~~ THEN BEGIN HI0
SAY ~Was?~
IF ~Global("NQ#MYNAMEISSHUK","GLOBAL",0)~ THEN REPLY ~Wer seid Ihr?~ DO ~SetGlobal("NQ#MYNAMEISSHUK","GLOBAL",1)~ GOTO WHO1

IF ~OR(2) GlobalGT("NQ#MYNAMEISSHUK","GLOBAL",0) GlobalGT("NQ#SHUKSHLD","GLOBAL",0)~ THEN REPLY ~Ich möchte über Eure Ausrüstung sprechen.~ DO ~~ GOTO EQUIP1

IF ~Global("NQ#SHUKBIGSPIDER","GLOBAL",2) PartyHasItem("MISC60") !Global("HelpLandrin","GLOBAL",2)~ THEN REPLY ~Hier, nehmt die dicke Spinne.~ DO ~~ GOTO BIGSPIDER2
IF ~Global("NQ#SHUKBIGSPIDER","GLOBAL",2) PartyHasItem("MISC60") Global("HelpLandrin","GLOBAL",2)~ THEN REPLY ~Hier, nehmt die dicke Spinne.~ DO ~AddJournalEntry(@70001,QUEST_DONE) EraseJournalEntry(27231) EraseJournalEntry(27232) EraseJournalEntry(27233)~ GOTO BIGSPIDER2
IF ~GlobalLT("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum seid Ihr an diesen Stein gebunden?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",1)~ GOTO WHY1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",2)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",3)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",3)~ GOTO SLAVE1
IF ~Global("NQ#SHUKSTORY","GLOBAL",2)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SLAVE1
IF ~OR(2) Global("NQ#SHUKSTORY","GLOBAL",2) GlobalGT("NQ#SHUKSTORY","GLOBAL",3) GlobalLT("NQ#SHUKSTORY","GLOBAL",6)~ THEN REPLY ~Ihr hatte von anderen Drow gesprochen?~ GOTO DROW2
IF ~Global("NQ#SHUKCANJUMP","GLOBAL",0) GlobalLT("NQ#NICESHUK","GLOBAL",2)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~~ GOTO WHAT1
IF ~GlobalGT("NQ#SHUKCANJUMP","GLOBAL",0)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~~ GOTO WHAT1
IF ~Global("NQ#SHUKCANJUMP","GLOBAL",0) GlobalGT("NQ#NICESHUK","GLOBAL",1)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~SetGlobal("NQ#SHUKCANJUMP","GLOBAL",1)~ GOTO WHAT2
IF ~!GlobalTimerExpired("NQ#SHUKSPAWNTIME1","LOCALS")~ THEN REPLY ~Geht wieder in den Stein!~ DO ~~ GOTO STONE1
IF ~GlobalTimerExpired("NQ#SHUKSPAWNTIME1","LOCALS")~ THEN REPLY ~Geht wieder in den Stein!~ DO ~~ GOTO STONE2
IF ~~ THEN REPLY ~Vergesst es einfach.~ DO ~~ GOTO BYE1
END

IF ~InPartySlot(LastTalkedToBy,0)~ THEN BEGIN HI1
SAY ~Was willst Du, Drecksack?~
IF ~Global("NQ#MYNAMEISSHUK","GLOBAL",0)~ THEN REPLY ~Wer seid Ihr?~ DO ~SetGlobal("NQ#MYNAMEISSHUK","GLOBAL",1)~ GOTO WHO1
IF ~GlobalGT("NQ#MYNAMEISSHUK","GLOBAL",0) !Global("NQ#SHUKSPAWNENEMY","GLOBAL",1)~ THEN REPLY ~Wir müssen über Eure Taktik sprechen.~ DO ~~ GOTO TACTICS
IF ~GlobalGT("NQ#MYNAMEISSHUK","GLOBAL",0) Global("NQ#SHUKSPAWNENEMY","GLOBAL",1)~ THEN REPLY ~Wir müssen über Eure Taktik sprechen.~ DO ~~ GOTO TACTICS2

IF ~OR(2) GlobalGT("NQ#MYNAMEISSHUK","GLOBAL",0) GlobalGT("NQ#SHUKSHLD","GLOBAL",0)~ THEN REPLY ~Ich möchte über Eure Ausrüstung sprechen.~ DO ~~ GOTO EQUIP1

IF ~Global("NQ#SHUKBIGSPIDER","GLOBAL",2) PartyHasItem("MISC60") !Global("HelpLandrin","GLOBAL",2)~ THEN REPLY ~Hier, nehmt die dicke Spinne.~ DO ~~ GOTO BIGSPIDER2
IF ~Global("NQ#SHUKBIGSPIDER","GLOBAL",2) PartyHasItem("MISC60") Global("HelpLandrin","GLOBAL",2)~ THEN REPLY ~Hier, nehmt die dicke Spinne.~ DO ~AddJournalEntry(@70001,QUEST_DONE) EraseJournalEntry(27231) EraseJournalEntry(27232) EraseJournalEntry(27233)~ GOTO BIGSPIDER2
IF ~GlobalLT("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum seid Ihr an diesen Stein gebunden?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",1)~ GOTO WHY1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",2)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",3)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",3)~ GOTO SLAVE1
IF ~Global("NQ#SHUKSTORY","GLOBAL",2)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SLAVE1
IF ~OR(2) Global("NQ#SHUKSTORY","GLOBAL",2) GlobalGT("NQ#SHUKSTORY","GLOBAL",3) GlobalLT("NQ#SHUKSTORY","GLOBAL",6)~ THEN REPLY ~Ihr hatte von anderen Drow gesprochen?~ GOTO DROW2
IF ~Global("NQ#SHUKCANJUMP","GLOBAL",0) GlobalLT("NQ#NICESHUK","GLOBAL",2)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~~ GOTO WHAT1
IF ~GlobalGT("NQ#SHUKCANJUMP","GLOBAL",0)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~~ GOTO WHAT1
IF ~Global("NQ#SHUKCANJUMP","GLOBAL",0) GlobalGT("NQ#NICESHUK","GLOBAL",1)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~SetGlobal("NQ#SHUKCANJUMP","GLOBAL",1)~ GOTO WHAT2
IF ~!GlobalTimerExpired("NQ#SHUKSPAWNTIME1","LOCALS")~ THEN REPLY ~Geht wieder in den Stein!~ DO ~~ GOTO STONE1
IF ~GlobalTimerExpired("NQ#SHUKSPAWNTIME1","LOCALS")~ THEN REPLY ~Geht wieder in den Stein!~ DO ~~ GOTO STONE2
IF ~~ THEN REPLY ~Vergesst es einfach.~ DO ~~ GOTO BYE1
END

// Allgemeine Gespräche

IF ~~ THEN BEGIN STONE1
SAY ~Pah! Mir doch egal!~
IF ~~ THEN DO ~SetGlobal("NQ#SHUKUNSPAWN","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN STONE2
SAY ~Endlich!~
IF ~~ THEN DO ~SetGlobal("NQ#SHUKUNSPAWN","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN WHO1
SAY ~Ich bin Häuptling Shuk, dummer <RACE>. Shuk der Worgreiter, Schlächter von Gruht, Schrecken der Halblinge, Auserwählter von Maglubiyets. Anführer von... Ich habe mehr Stämme geführt als ich Dir Finger abhacken kann!~
IF ~OR(5) Race(LastTalkedToBy,HUMAN) Race(LastTalkedToBy,ELF) Race(LastTalkedToBy,HALF_ELF) Race(LastTalkedToBy,DWARF) Race(LastTalkedToBy,GNOME)~ THEN DO ~~ GOTO WHO2A
IF ~!Race(LastTalkedToBy,HUMAN) !Race(LastTalkedToBy,ELF) !Race(LastTalkedToBy,HALF_ELF) !Race(LastTalkedToBy,DWARF) !Race(LastTalkedToBy,GNOME)~ THEN DO ~~ GOTO WHO2B
END

IF ~~ THEN BEGIN WHO2A
SAY ~Meine Krieger haben unzählige der Schweinegesichter getötet, wir haben die Gnolle unterworfen und ich saß auf einem Thron aus <RACE>enknochen!~
IF ~GlobalLT("NQ#WARAS","GLOBAL",9)~ THEN REPLY ~Das mit dem Worgreiter hat sich wohl erledigt...~ DO ~~ GOTO WORG1
IF ~GlobalLT("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum seid Ihr dann an diesen Stein gebunden?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",1)~ GOTO WHY1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",2)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",3)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",3)~ GOTO SLAVE1
IF ~Global("NQ#SHUKSTORY","GLOBAL",2)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SLAVE1
IF ~OR(2) Global("NQ#SHUKSTORY","GLOBAL",2) GlobalGT("NQ#SHUKSTORY","GLOBAL",3) GlobalLT("NQ#SHUKSTORY","GLOBAL",6)~ THEN REPLY ~Ihr hatte von anderen Drow gesprochen?~ GOTO DROW2
IF ~Global("NQ#SHUKCANJUMP","GLOBAL",0) GlobalLT("NQ#NICESHUK","GLOBAL",2)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~~ GOTO WHAT1
IF ~GlobalGT("NQ#SHUKCANJUMP","GLOBAL",0)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~~ GOTO WHAT1
IF ~Global("NQ#SHUKCANJUMP","GLOBAL",0) GlobalGT("NQ#NICESHUK","GLOBAL",1)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~SetGlobal("NQ#SHUKCANJUMP","GLOBAL",1)~ GOTO WHAT2
IF ~~ THEN REPLY ~Vergesst es einfach.~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN WHO2B
SAY ~Meine Krieger haben unzählige der Schweinegesichter getötet, wir haben die Gnolle unterworfen und ich saß auf einem Thron aus <RACE>knochen!~
IF ~GlobalLT("NQ#WARAS","GLOBAL",9)~ THEN REPLY ~Das mit dem Worgreiter hat sich wohl erledigt...~ DO ~~ GOTO WORG1
IF ~GlobalLT("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum seid Ihr dann an diesen Stein gebunden?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",1)~ GOTO WHY1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",2)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",3)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",3)~ GOTO SLAVE1
IF ~Global("NQ#SHUKSTORY","GLOBAL",2)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SLAVE1
IF ~OR(2) Global("NQ#SHUKSTORY","GLOBAL",2) GlobalGT("NQ#SHUKSTORY","GLOBAL",3) GlobalLT("NQ#SHUKSTORY","GLOBAL",6)~ THEN REPLY ~Ihr hatte von anderen Drow gesprochen?~ GOTO DROW2
IF ~Global("NQ#SHUKCANJUMP","GLOBAL",0) GlobalLT("NQ#NICESHUK","GLOBAL",2)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~~ GOTO WHAT1
IF ~GlobalGT("NQ#SHUKCANJUMP","GLOBAL",0)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~~ GOTO WHAT1
IF ~Global("NQ#SHUKCANJUMP","GLOBAL",0) GlobalGT("NQ#NICESHUK","GLOBAL",1)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~SetGlobal("NQ#SHUKCANJUMP","GLOBAL",1)~ GOTO WHAT2
IF ~~ THEN REPLY ~Vergesst es einfach.~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN WORG1
SAY ~Du...! Pah! Es ist Maglubiyets Wille. Faulige Matschbirne...~
IF ~GlobalLT("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum seid Ihr dann an diesen Stein gebunden?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",1)~ GOTO WHY1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",2)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",3)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",3)~ GOTO SLAVE1
IF ~Global("NQ#SHUKSTORY","GLOBAL",2)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SLAVE1
IF ~OR(2) Global("NQ#SHUKSTORY","GLOBAL",2) GlobalGT("NQ#SHUKSTORY","GLOBAL",3) GlobalLT("NQ#SHUKSTORY","GLOBAL",6)~ THEN REPLY ~Ihr hattet von anderen Drow gesprochen?~ GOTO DROW2
IF ~Global("NQ#SHUKCANJUMP","GLOBAL",0) GlobalLT("NQ#NICESHUK","GLOBAL",2)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~~ GOTO WHAT1
IF ~GlobalGT("NQ#SHUKCANJUMP","GLOBAL",0)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~~ GOTO WHAT1
IF ~Global("NQ#SHUKCANJUMP","GLOBAL",0) GlobalGT("NQ#NICESHUK","GLOBAL",1)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~SetGlobal("NQ#SHUKCANJUMP","GLOBAL",1)~ GOTO WHAT2
IF ~~ THEN REPLY ~Vergesst es einfach.~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN WHY1
SAY ~Was geht's Dich an? Der mächtige Eine hat mich für meine Treue belohnt! Er hat mir den Stein gesandt und mir Unsterblichkeit geschenkt!~
IF ~~ THEN DO ~~ GOTO WHY2
END

IF ~~ THEN BEGIN WHY2
SAY ~Nachdem ich die dicke Spinne gefressen habe, hat er mich für würdig befunden, mickriges Trollhirn!~
IF ~Global("NQ#MYNAMEISSHUK","GLOBAL",0)~ THEN REPLY ~Wer seid Ihr eigentlich?~ DO ~SetGlobal("NQ#MYNAMEISSHUK","GLOBAL",1)~ GOTO WHO1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",2)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",3)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",3)~ GOTO SLAVE1
IF ~Global("NQ#SHUKSTORY","GLOBAL",2)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SLAVE1
IF ~Global("NQ#SHUKCANJUMP","GLOBAL",0) GlobalLT("NQ#NICESHUK","GLOBAL",2)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~~ GOTO WHAT1
IF ~GlobalGT("NQ#SHUKCANJUMP","GLOBAL",0)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~~ GOTO WHAT1
IF ~Global("NQ#SHUKCANJUMP","GLOBAL",0) GlobalGT("NQ#NICESHUK","GLOBAL",1)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~SetGlobal("NQ#SHUKCANJUMP","GLOBAL",1)~ GOTO WHAT2
IF ~~ THEN REPLY ~Vergesst es einfach.~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN WHAT1
SAY ~Dumme Frage, dummer <RACE>. Ich kann Dich zerhacken, wenn Du es mir erlaubt...~
IF ~OR(2) GlobalGT("NQ#MYNAMEISSHUK","GLOBAL",0) GlobalGT("NQ#SHUKSHLD","GLOBAL",0)~ THEN REPLY ~Ich möchte über Eure Ausrüstung sprechen.~ DO ~~ GOTO EQUIP1
IF ~Global("NQ#SHUKPOISON","GLOBAL",1)~ THEN REPLY ~Wie habt Ihr Euch von der Vergiftung geheilt?~ DO ~SetGlobal("NQ#SHUKPOISON","GLOBAL",2)~ GOTO POISON1
IF ~Global("NQ#SHUKPOISON","GLOBAL",2)~ THEN REPLY ~Könnt Ihr mich auch von Vergiftungen heilen?~ DO ~SetGlobal("NQ#SHUKPOISON","GLOBAL",3)~ GOTO POISON2
IF ~Global("NQ#MYNAMEISSHUK","GLOBAL",0)~ THEN REPLY ~Wer seid Ihr?~ DO ~SetGlobal("NQ#MYNAMEISSHUK","GLOBAL",1)~ GOTO WHO1
IF ~GlobalLT("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum seid Ihr an diesen Stein gebunden?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",1)~ GOTO WHY1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",2)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",3)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",3)~ GOTO SLAVE1
IF ~Global("NQ#SHUKSTORY","GLOBAL",2)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SLAVE1
IF ~OR(2) Global("NQ#SHUKSTORY","GLOBAL",2) GlobalGT("NQ#SHUKSTORY","GLOBAL",3) GlobalLT("NQ#SHUKSTORY","GLOBAL",6)~ THEN REPLY ~Ihr hatte von anderen Drow gesprochen?~ GOTO DROW2
IF ~~ THEN REPLY ~Vergesst es einfach.~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN WHAT2
SAY ~Ich bin der größte Goblinkrieger, der je gelebt hat, Dumpfbacke! Außerdem zieht mich der Stein magisch an. Wenn ich will, kann ich jederzeit zu ihm springen.~
IF ~~ THEN REPLY ~Ihr könnt Euch teleportieren?~ DO ~~ GOTO WHAT3
IF ~OR(2) GlobalGT("NQ#MYNAMEISSHUK","GLOBAL",0) GlobalGT("NQ#SHUKSHLD","GLOBAL",0)~ THEN REPLY ~Ich möchte über Eure Ausrüstung sprechen.~ DO ~~ GOTO EQUIP1
IF ~Global("NQ#SHUKPOISON","GLOBAL",1)~ THEN REPLY ~Wie habt Ihr Euch von der Vergiftung geheilt?~ DO ~SetGlobal("NQ#SHUKPOISON","GLOBAL",2)~ GOTO POISON1
IF ~Global("NQ#SHUKPOISON","GLOBAL",2)~ THEN REPLY ~Könnt Ihr mich auch von Vergiftungen heilen?~ DO ~SetGlobal("NQ#SHUKPOISON","GLOBAL",3)~ GOTO POISON2
IF ~Global("NQ#MYNAMEISSHUK","GLOBAL",0)~ THEN REPLY ~Wer seid Ihr?~ DO ~SetGlobal("NQ#MYNAMEISSHUK","GLOBAL",1)~ GOTO WHO1
IF ~GlobalLT("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum seid Ihr an diesen Stein gebunden?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",1)~ GOTO WHY1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",2)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",3)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",3)~ GOTO SLAVE1
IF ~Global("NQ#SHUKSTORY","GLOBAL",2)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SLAVE1
IF ~OR(2) Global("NQ#SHUKSTORY","GLOBAL",2) GlobalGT("NQ#SHUKSTORY","GLOBAL",3) GlobalLT("NQ#SHUKSTORY","GLOBAL",6)~ THEN REPLY ~Ihr hatte von anderen Drow gesprochen?~ GOTO DROW2
IF ~~ THEN REPLY ~Vergesst es einfach.~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN WHAT3
SAY ~Nenn es wie Du willst, <RACE>. Ich bin kein stinkiger, alter Zauber.~
IF ~OR(2) GlobalGT("NQ#MYNAMEISSHUK","GLOBAL",0) GlobalGT("NQ#SHUKSHLD","GLOBAL",0)~ THEN REPLY ~Ich möchte über Eure Ausrüstung sprechen.~ DO ~~ GOTO EQUIP1
IF ~Global("NQ#SHUKPOISON","GLOBAL",1)~ THEN REPLY ~Wie habt Ihr Euch von der Vergiftung geheilt?~ DO ~SetGlobal("NQ#SHUKPOISON","GLOBAL",2)~ GOTO POISON1
IF ~Global("NQ#SHUKPOISON","GLOBAL",2)~ THEN REPLY ~Könnt Ihr mich auch von Vergiftungen heilen?~ DO ~SetGlobal("NQ#SHUKPOISON","GLOBAL",3)~ GOTO POISON2
IF ~Global("NQ#MYNAMEISSHUK","GLOBAL",0)~ THEN REPLY ~Wer seid Ihr?~ DO ~SetGlobal("NQ#MYNAMEISSHUK","GLOBAL",1)~ GOTO WHO1
IF ~GlobalLT("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum seid Ihr an diesen Stein gebunden?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",1)~ GOTO WHY1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",2)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",3)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SPIDER1
IF ~Global("NQ#SHUKSTORY","GLOBAL",1)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",3)~ GOTO SLAVE1
IF ~Global("NQ#SHUKSTORY","GLOBAL",2)~ THEN REPLY ~Warum solltet Ihr mir gehorchen müssen, wenn Euer Gott Euch an den Stein gebunden hat?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",4)~ GOTO SLAVE1
IF ~OR(2) Global("NQ#SHUKSTORY","GLOBAL",2) GlobalGT("NQ#SHUKSTORY","GLOBAL",3) GlobalLT("NQ#SHUKSTORY","GLOBAL",6)~ THEN REPLY ~Ihr hatte von anderen Drow gesprochen?~ GOTO DROW2
IF ~~ THEN REPLY ~Vergesst es einfach.~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN BYE1
SAY ~Pah!~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SPIDER1
SAY ~Die Spinne, die zuerst aus dem Stein kam. Hab ihn der dreckigen, dummen Drowfrau abgenommen. Es war Maglubiyets Wille, pah!~
IF ~~ THEN DO ~~ GOTO SPIDER2
END

IF ~~ THEN BEGIN SPIDER2
SAY ~Hab die Spinne gerufen und gefressen, dann gewartet... und wieder gerufen und gefressen! Hahaha! Gloreiche Tage... bis die anderen Drow kamen.~
IF ~Global("NQ#MYNAMEISSHUK","GLOBAL",0)~ THEN REPLY ~Wer seid Ihr?~ DO ~SetGlobal("NQ#MYNAMEISSHUK","GLOBAL",1)~ GOTO WHO1
IF ~OR(2) Global("NQ#SHUKSTORY","GLOBAL",2) Global("NQ#SHUKSTORY","GLOBAL",4)~ THEN REPLY ~Ihr habt eine spektrale Spinnen gefressen?~ DO ~~ GOTO DROW1
IF ~OR(3) Global("NQ#SHUKSTORY","GLOBAL",2) Global("NQ#SHUKSTORY","GLOBAL",4) Global("NQ#SHUKSTORY","GLOBAL",5)~ THEN REPLY ~Andere Drow?~ DO ~~ GOTO DROW2
IF ~~ THEN REPLY ~Vergesst es einfach.~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN SLAVE1
SAY ~Feuerauge ist ein Gott des Krieges, also lässt er mich kämpfen. So ist es richtig.~
IF ~OR(3) !InParty("MKHIIN") !See("MKHIIN") StateCheck("MKHIIN",CD_STATE_NOTVALID)~ THEN DO ~~ GOTO SLAVE2
IF ~InParty("MKHIIN") See("MKHIIN") !StateCheck("MKHIIN",CD_STATE_NOTVALID)~ THEN DO ~~ GOTO MKFIREEYE01
END

IF ~~ THEN BEGIN SLAVE2
SAY ~Warum ich ausgerechnet für Dich kämpfen muss... vielleicht hätte ich seinen Schamanen nicht zerhacken sollen...~
IF ~Global("NQ#MYNAMEISSHUK","GLOBAL",0)~ THEN REPLY ~Wer seid Ihr?~ DO ~SetGlobal("NQ#MYNAMEISSHUK","GLOBAL",1)~ GOTO WHO1
IF ~OR(2) Global("NQ#SHUKSTORY","GLOBAL",2) Global("NQ#SHUKSTORY","GLOBAL",4)~ THEN REPLY ~Ihr habt eine spektrale Spinnen gefressen?~ DO ~~ GOTO DROW1
IF ~OR(3) Global("NQ#SHUKSTORY","GLOBAL",2) Global("NQ#SHUKSTORY","GLOBAL",4) Global("NQ#SHUKSTORY","GLOBAL",5)~ THEN REPLY ~Andere Drow?~ DO ~~ GOTO DROW2
IF ~Global("NQ#SHUKSTORY","GLOBAL",3)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",2)~ GOTO SPIDER1
IF ~Global("NQ#SHUKCANJUMP","GLOBAL",0) GlobalLT("NQ#NICESHUK","GLOBAL",2)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~~ GOTO WHAT1
IF ~GlobalGT("NQ#SHUKCANJUMP","GLOBAL",0)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~~ GOTO WHAT1
IF ~Global("NQ#SHUKCANJUMP","GLOBAL",0) GlobalGT("NQ#NICESHUK","GLOBAL",1)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~SetGlobal("NQ#SHUKCANJUMP","GLOBAL",1)~ GOTO WHAT2
IF ~~ THEN REPLY ~Vergesst es einfach.~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN DROW1
SAY ~Ja, ja. Hörst Du nicht zu oder bist Du nur dumm?~
IF ~Global("NQ#MYNAMEISSHUK","GLOBAL",0)~ THEN REPLY ~Wer seid Ihr eigentlich?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",5)~ GOTO WHO1
IF ~OR(2) GlobalGT("NQ#MYNAMEISSHUK","GLOBAL",0) GlobalGT("NQ#SHUKSHLD","GLOBAL",0)~ THEN REPLY ~Ich möchte über Eure Ausrüstung sprechen.~ DO ~~ GOTO EQUIP1
IF ~OR(3) Global("NQ#SHUKSTORY","GLOBAL",2) Global("NQ#SHUKSTORY","GLOBAL",4) Global("NQ#SHUKSTORY","GLOBAL",5)~ THEN REPLY ~Was war mit den anderen Drow?~ GOTO DROW2
IF ~~ THEN REPLY ~Ich habe genug von Euch.~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",5)~ GOTO BYE1
END


IF ~~ THEN BEGIN DROW2
SAY ~Stinkige, feige Nachtaugen. Haben sich durch die Lager geschlichen und mich mit ihren dreckigen Armbrüsten durchlöchert. Aber der Hohe Häuptling hat Shuk sein eigenes Paradies geschenkt!~
IF ~~ THEN DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",6)~ GOTO BADLANDS
END

IF ~~ THEN BEGIN BADLANDS
SAY ~Warme Höhlen gefüllt mit tausenden von Leckerbissen! Jetzt lass mich endlich etwas töten oder dorthin zurückkehren. Ich kann Deinen widerlichen Gestank und Dein dummes Gesicht nicht mehr ertragen!~
IF ~OR(3) !InParty("VICONIA") !See("VICONIA") StateCheck("NQ#SHUK",CD_STATE_NOTVALID)~ THEN DO ~IncrementGlobal("NQ#NICESHUK","GLOBAL",1) DisplayString(Myself,@8810)~ EXIT
IF ~GlobalLT("EndOfBG1","GLOBAL",1) InParty("VICONIA") See("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN DO ~~ EXTERN VICONJ LOTHSWORLD
IF ~GlobalGT("EndOfBG1","GLOBAL",1) InParty("VICONIA") See("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN DO ~~ EXTERN BDVICONJ LOTHSWORLD
END

// Vergiften

IF ~~ THEN BEGIN POISON1
SAY ~Dummer <RACE>, wenn ich Deinen Gestank nicht ertragen muss, lebe ich in einem Paradies voller Spinnen! Der Fürst des Kampfes hat mich belohnt, aber es ist keine Belohnung für einen schwachen <RACE>.~
IF ~~ THEN REPLY ~Könnt Ihr mich auch von Vergiftungen heilen?~ DO ~SetGlobal("NQ#SHUKPOISON","GLOBAL",3)~ GOTO POISON2
IF ~~ THEN REPLY ~Ich habe andere Fragen.~ DO ~~ GOTO HI0
IF ~~ THEN REPLY ~Vergesst es einfach.~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN POISON2
SAY ~Pah! Sehe ich aus wie ein fetter Schamane? Ich kann meine Gegner vergiften! Jedenfalls wenn mich kein verzauberter Stein zwingt ihnen zu gehorchen...~
IF ~~ THEN REPLY ~Wieso habt Ihr das nicht gleich gesagt!?~ DO ~~ GOTO BYE1
IF ~~ THEN REPLY ~Ich habe andere Fragen.~ DO ~~ GOTO HI0
IF ~~ THEN REPLY ~Auch nicht schlecht. Es geht weiter!~ DO ~~ GOTO BYE1
END

// Tactics

IF ~~ THEN BEGIN TACTICS
SAY ~Du kannst Dir Deine Taktik sonst wohin stecken, Klugscheißer.~
IF ~~ THEN REPLY ~Greift meine Feinde, wenn Ihr sie seht.~ DO ~~ GOTO TAC0
IF ~~ THEN REPLY ~Ihr macht genau was ich sage und sonst nichts!~ DO ~~ GOTO TAC1
IF ~~ THEN REPLY ~Vergesst es einfach.~ DO ~~ GOTO BYE1
END

IF ~~ THEN BEGIN TACTICS2
SAY ~Pah! Du kannst damit anfangen, dass du mich nicht erst mitten im Kampf beschwörst, dämliche Hackfresse.~
IF ~~ THEN REPLY ~Greift meine Feinde an, wenn Ihr sie seht.~ DO ~SetGlobal("NQ#SHUKSPAWNENEMY","GLOBAL",2)~ GOTO TAC0
IF ~~ THEN REPLY ~Ihr macht genau was ich sage und sonst nichts!~ DO ~SetGlobal("NQ#SHUKSPAWNENEMY","GLOBAL",2)~ GOTO TAC1
IF ~~ THEN REPLY ~Vergesst es einfach.~ DO ~SetGlobal("NQ#SHUKSPAWNENEMY","GLOBAL",2)~ GOTO BYE1
END

IF ~~ THEN BEGIN TAC0
SAY ~Hörst Du Dich gern reden? Ich hatte nie etwas anderes vor. Was verschwendest du Zeit und Luft? ~
IF ~~ THEN DO ~SetGlobal("NQ#SHUKTACTICS","GLOBAL",0)~ EXIT
END

IF ~~ THEN BEGIN TAC1
SAY ~Das ist wahrscheinlich die dämlichste Idee, die Du heute hattest, kastrierter Lackaffe!~
IF ~~ THEN DO ~SetGlobal("NQ#SHUKTACTICS","GLOBAL",1)~ EXIT
END

// Gruppe

// Edwin

  CHAIN2 EDWINJ DIRT
    ~Hättet Ihr keine noch würdelosere Kreatur als Vertrauten wählen können, <CHARNAME>?~
    =	
	~Dieses verachtenswerte Biest ist dreckig, stinkt erbärmlich und gibt nichts als Unflätigkeiten von sich! (Ja, so gesehen passen sie wohl gut zusammen.)~	
  END NQ#SHUK EDWINDIRT

IF ~~ THEN BEGIN EDWINDIRT
SAY ~Lass mich nur ein ganz kleines Stück von diesem aufgeblasenen Haufen roten Gnolldreck abhacken. Vielleicht die Zunge?~
IF ~~ THEN DO ~SetGlobal("NQ#EDWINSHUKDIRT","GLOBAL",1)~ EXIT
END

// MKHIIN

IF ~~ THEN BEGIN MKFIREEYE01
SAY ~Warum ich ausgerechnet für Dich kämpfen muss... vielleicht hätte ich seinen Schamanen nicht zerhacken sollen...~
IF ~~ THEN DO ~~ EXTERN BDMKHIIJ FIREEYE
END

  CHAIN2 BDMKHIIJ FIREEYE
    ~Ihr tötet Maglubiyets Gefolge und glaubt, er hat Euch auserwählt?~
    =	
	~Das ist dumm. Selbst für einen Goblin.~	
    ==
    ~Was weißt Du schon davon, bekloppte Verräterin!?~  
  END NQ#SHUK MKFIREEYE02
  
IF ~~ THEN BEGIN MKFIREEYE02
SAY ~Wäre der Eine auf Ihrer Seite gewesen, hätten sie mich getötet. Pah! Ihre Knochen sind staub, aber ich bin noch hier!~
IF ~Global("NQ#MYNAMEISSHUK","GLOBAL",0)~ THEN REPLY ~Wer seid Ihr?~ DO ~SetGlobal("NQ#MYNAMEISSHUK","GLOBAL",1)~ GOTO WHO1
IF ~OR(2) Global("NQ#SHUKSTORY","GLOBAL",2) Global("NQ#SHUKSTORY","GLOBAL",4)~ THEN REPLY ~Ihr habt eine spektrale Spinnen gefressen?~ DO ~~ GOTO DROW1
IF ~OR(3) Global("NQ#SHUKSTORY","GLOBAL",2) Global("NQ#SHUKSTORY","GLOBAL",4) Global("NQ#SHUKSTORY","GLOBAL",5)~ THEN REPLY ~Andere Drow?~ DO ~~ GOTO DROW2
IF ~Global("NQ#SHUKSTORY","GLOBAL",3)~ THEN REPLY ~Von was für einer Spinne habt Ihr gesprochen?~ DO ~SetGlobal("NQ#SHUKSTORY","GLOBAL",2)~ GOTO SPIDER1
IF ~Global("NQ#SHUKCANJUMP","GLOBAL",0) GlobalLT("NQ#NICESHUK","GLOBAL",2)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~~ GOTO WHAT1
IF ~GlobalGT("NQ#SHUKCANJUMP","GLOBAL",0)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~~ GOTO WHAT1
IF ~Global("NQ#SHUKCANJUMP","GLOBAL",0) GlobalGT("NQ#NICESHUK","GLOBAL",1)~ THEN REPLY ~Könnt Ihr irgendwas Besonderes?~ DO ~SetGlobal("NQ#SHUKCANJUMP","GLOBAL",1)~ GOTO WHAT2
IF ~~ THEN REPLY ~Vergesst es einfach.~ DO ~~ GOTO BYE1
END

	
// Viconia

  CHAIN2 VICONJ LOTHSWORLD
    ~<CHARNAME>, dieser jämmerliche Rothe hat es scheinbar irgendwie geschafft sich mit einer Ebene von Lolth zu verbinden.~
    =	
    ~Was glaubt er wie lange die Spinnenkönigin es duldet, dass er auf ihren Fäden herumtrammpelt und ihr heiligen Tiere jagt?~	
	=
	~Werft den Stein davon! Er ist es kaum wert, dass Ihr dafür mein Leben riskiert!~
  END NQ#SHUK LOTHSWORLD2

IF ~~ THEN BEGIN LOTHSWORLD2
SAY ~Pah, ohne den Stein würden Deine dreckigen Ohren schon lange an meiner Kette baummeln, feiges Schlammgesicht!~
IF ~~ THEN DO ~IncrementGlobal("NQ#NICESHUK","GLOBAL",1) DisplayString(Myself,@8810)~ EXIT
END

  CHAIN2 BDVICONJ LOTHSWORLD
    ~<CHARNAME>, dieser jämmerliche Rothe hat es scheinbar irgendwie geschafft sich mit einer Ebene von Lolth zu verbinden.~
    =	
    ~Was glaubt er wie lange die Spinnenkönigin es duldet, dass er auf ihren Fäden herumtrammpelt und ihr heiligen Tiere jagt?~	
	=
	~Werft den Stein davon! Er ist es kaum wert, dass Ihr dafür mein Leben riskiert!~
  END NQ#SHUK LOTHSWORLD2