BEGIN NQ#GB10

// Ratte - Shuk

IF ~~ THEN BEGIN 0
SAY ~Wenn sonst was anliegt, schick' ich Schleicher. Er ist hier irgendwo und... schleicht. Jap.~
IF ~~ THEN DO ~SetGlobalTimer("NQ#SHUKSPALACEGOLD","GLOBAL",THREE_DAYS) AddJournalEntry(@70037,QUEST)~ EXIT
END

IF ~~ THEN BEGIN 1
SAY ~Es war ein magischer Angriff. Jap! Irgendeine Flüssigkeit! Hat Razk direkt auf den dummen Kopf getroff'n und ein bisschen ging auf Krucks Beine.~
IF ~~ THEN DO ~~ GOTO FIRSTEVENT03
END

// Shuk, Ness

IF ~~ THEN BEGIN 2
SAY ~Maul halten!~
IF ~~ THEN GOTO GOBJUDGE4
END

IF ~~ THEN BEGIN 3
SAY ~Was!?~
IF ~~ THEN EXTERN ~NQ#SHUK~ 33
END

// Shuk, SCHLUMPSA

IF ~~ THEN BEGIN 4
SAY ~So... soll ich Leute schicken? Jap?~
IF ~~ THEN EXTERN ~NQ#SHUK~ 39
END

IF ~~ THEN BEGIN 5
SAY ~Lang lebe der Shuk!~
IF ~~ THEN DO ~SetGlobal("WANTSCHLUMPSADEAD","LOCALS",3) AddexperienceParty(100)~ EXIT
END

//

IF ~OR(2) Global("NQ#SHUKSPALACEEVENT1","GLOBAL",17) Global("NQ#SHUKSPALACEEVENT1","GLOBAL",18)~ THEN BEGIN GOBJUDGE0
SAY ~Der fette Gnom findet es also lustig Säure auf Goblinköpfe zu werfen?~
IF ~Detect("NQ#NESS")~ THEN GOTO GOBJUDGE1
IF ~!Detect("NQ#NESS") Detect("NQ#SHUK")~ THEN GOTO GOBJUDGE2
IF ~!Detect("NQ#NESS") !Detect("NQ#SHUK")~ THEN GOTO GOBJUDGE3
END

IF ~~ THEN BEGIN GOBJUDGE1
SAY ~Jetzt bist du nicht mehr so mutig, kleiner Fettsack. Jap!~
IF ~Detect("NQ#SHUK")~ THEN GOTO GOBJUDGE2
IF ~!Detect("NQ#SHUK") Global("NQ#SHUKSPALACEEVENT1","GLOBAL",17)~ THEN EXTERN ~NQ#NESS~ 0
IF ~!Detect("NQ#SHUK") Global("NQ#SHUKSPALACEEVENT1","GLOBAL",18)~ THEN EXTERN ~NQ#NESS~ 1
END

IF ~~ THEN BEGIN GOBJUDGE2
SAY ~Was stell'n wir mit ihm an, Boss?~
IF ~~ THEN EXTERN ~NQ#SHUK~ 32
END

IF ~~ THEN BEGIN GOBJUDGE3
SAY ~Ich würde ihm ja den fetten Bauch aufschlitzen, aber das entscheidet der Boss. Bis dahin nehme ich sein hässliches, kleines Zauberbuch und er schrubbt den Boden!~
IF ~~ THEN DO ~SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",19)~ EXIT
END

IF ~~ THEN BEGIN GOBJUDGE4
SAY ~Wenn's nach mir ging hätte ich Dir schon längst den fetten Bauch aufgeschlitzt, aber das entscheidet der Boss. Bis dahin gibst Du mir Dein hässliches, kleines Zauberbuch schrubbst den Boden!~
IF ~~ THEN DO ~SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",19)~ EXIT
END

IF ~Global("NQ#SHUKSPALACEEVENT1","GLOBAL",19) See("NQ#SHUK")~ THEN BEGIN GOBJUDGE5
SAY ~Was stell'n wir mit dem Fettsack an, Boss?~
IF ~~ THEN EXTERN ~NQ#SHUK~ 32
END

//

IF ~Global("NQ#SHUKSPALACE","GLOBAL",0) Name("NQ#SHUK",LastTalkedToBy)~ THEN BEGIN INIT0
SAY ~Boss, du hast gerufen und ich bin da. Jap!~
IF ~~ THEN DO ~SetGlobal("NQ#SHUKSPALACE","GLOBAL",1)~ GOTO INIT3
END

IF ~Global("NQ#SHUKSPALACE","GLOBAL",0) !Name("NQ#SHUK",LastTalkedToBy)~ THEN BEGIN INIT1
SAY ~Jap. Ich bin Narthag. Nennt mich ruhig Ratte.~
IF ~~ THEN DO ~SetGlobal("NQ#SHUKSPALACE","GLOBAL",1)~ GOTO INIT2
END

IF ~~ THEN BEGIN INIT2
SAY ~Das tun sie alle...~
IF ~~ THEN DO ~~ GOTO INIT4
END

IF ~~ THEN BEGIN INIT3
SAY ~Verlass Dich auf mich. Die Ratte ist für Dich da! Deine Beute wird hier alle drei Tage auf Dich warten.~
IF ~~ THEN EXTERN ~NQ#SHUK~ 29
END

IF ~~ THEN BEGIN INIT4
SAY ~Ihr sprecht für den Boss. Jap. Könnt bei mir alle drei Tage Beute abholen.~
IF ~~ THEN DO ~~ GOTO 0
END

IF ~GlobalGT("NQ#SHUKSPALACE","GLOBAL",0) !Name("NQ#SHUK",LastTalkedToBy) !Global("NQ#SHUKSPALACEEVENT1","GLOBAL",1) !Global("NQ#SHUKSPALACEEVENT1","GLOBAL",2) !Global("NQ#SHUKSPALACEEVENT1","GLOBAL",3)~ THEN BEGIN HI1
SAY ~Was gibt's, <RACE>?~
IF ~!Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",0) OR(2) Global("NQ#SHUKSPALACEEVENT1","GLOBAL",0) GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",13) GlobalLT("NQ#YOUKILLGOBS","GLOBAL",10)~ THEN REPLY ~Habt Ihr das Gold?~ DO ~~ GOTO GOLD1
IF ~!Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",0) OR(2) Global("NQ#SHUKSPALACEEVENT1","GLOBAL",0) GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",13) GlobalGT("NQ#YOUKILLGOBS","GLOBAL",9)~ THEN REPLY ~Habt Ihr das Gold?~ DO ~~ GOTO GOLD11

IF ~!Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",0) GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",0) GlobalLT("NQ#SHUKSPALACEEVENT1","GLOBAL",14) GlobalLT("NQ#YOUKILLGOBS","GLOBAL",10)~ THEN REPLY ~Habt Ihr das Gold?~ DO ~~ GOTO GOLD15
IF ~!Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",0) GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",0) GlobalLT("NQ#SHUKSPALACEEVENT1","GLOBAL",14) GlobalGT("NQ#YOUKILLGOBS","GLOBAL",9)~ THEN REPLY ~Habt Ihr das Gold?~ DO ~~ GOTO GOLD16
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ THEN REPLY ~Habt Ihr das Gold?~ DO ~~ GOTO GOLD2

IF ~GlobalLT("NQ#SHUKSPALACEEVENT1","GLOBAL",14)~ THEN REPLY ~Gibt es hier was zu erledigen?~ DO ~~ GOTO QUEST00
IF ~GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",13) Global("WANTSCHLUMPSADEAD","LOCALS",0)~ THEN REPLY ~Gibt es hier was zu erledigen?~ DO ~SetGlobal("WANTSCHLUMPSADEAD","LOCALS",1)~ GOTO QUEST01
IF ~GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",13) Global("WANTSCHLUMPSADEAD","LOCALS",1) Dead("SCHLUMPSA")~ THEN REPLY ~Die Tunnel im Westen sind wieder sicher.~ DO ~~ GOTO QUEST04
IF ~GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",13) Global("WANTSCHLUMPSADEAD","LOCALS",1) !Dead("SCHLUMPSA")~ THEN REPLY ~Gibt es hier was zu erledigen?~ DO ~~ GOTO QUEST05
IF ~~ THEN REPLY ~Nichts, lebt wohl.~ DO ~~ EXIT
END

IF ~GlobalGT("NQ#SHUKSPALACE","GLOBAL",0) Name("NQ#SHUK",LastTalkedToBy) !Global("NQ#SHUKSPALACEEVENT1","GLOBAL",1) !Global("NQ#SHUKSPALACEEVENT1","GLOBAL",2) !Global("NQ#SHUKSPALACEEVENT1","GLOBAL",3)~ THEN BEGIN HI2
SAY ~Was ist los, Chef?~
IF ~!Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",0) OR(2) Global("NQ#SHUKSPALACEEVENT1","GLOBAL",0) GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",13) GlobalLT("NQ#YOUKILLGOBS","GLOBAL",10)~ THEN REPLY ~Hast Du mein Gold?~ DO ~~ GOTO GOLD1
IF ~!Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",0) OR(2) Global("NQ#SHUKSPALACEEVENT1","GLOBAL",0) GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",13) GlobalGT("NQ#YOUKILLGOBS","GLOBAL",9)~ THEN REPLY ~Hast Du mein Gold?~ DO ~~ GOTO GOLD11
IF ~!Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",0) GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",0) GlobalLT("NQ#SHUKSPALACEEVENT1","GLOBAL",14) GlobalLT("NQ#YOUKILLGOBS","GLOBAL",10)~ THEN REPLY ~Hast Du mein Gold?~ DO ~~ GOTO GOLD15
IF ~!Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",0) GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",0) GlobalLT("NQ#SHUKSPALACEEVENT1","GLOBAL",14) GlobalGT("NQ#YOUKILLGOBS","GLOBAL",9)~ THEN REPLY ~Hast Du mein Gold?~ DO ~~ GOTO GOLD16
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ THEN REPLY ~Habt Ihr das Gold?~ DO ~~ GOTO GOLD2

IF ~GlobalLT("NQ#SHUKSPALACEEVENT1","GLOBAL",14)~ THEN REPLY ~Gibt's Probleme?~ DO ~~ GOTO QUEST00
IF ~GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",13)  Global("WANTSCHLUMPSADEAD","LOCALS",0)~ THEN REPLY ~Gibt's Probleme?~ DO ~SetGlobal("WANTSCHLUMPSADEAD","LOCALS",1)~ GOTO QUEST01
IF ~GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",13) Global("WANTSCHLUMPSADEAD","LOCALS",1) Dead("SCHLUMPSA")~ THEN REPLY ~Der Kanalkönig ist Grütze und die Tunnel im Westen wieder sicher!~ DO ~~ GOTO QUEST06
IF ~GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",13) Global("WANTSCHLUMPSADEAD","LOCALS",1) !Dead("SCHLUMPSA")~ THEN REPLY ~Gibt's Probleme?~ DO ~~ GOTO QUEST07

IF ~~ THEN REPLY ~Nichts, Penner!~ DO ~~ EXIT
END

IF ~~ THEN BEGIN GOLD1
SAY ~Ihr wollt Beute? Jap. Hier! Ihr könnt Euch auf die Ratte verlassen...~
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",100)~ THEN DO ~GiveGoldForce(100) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",200)~ THEN DO ~GiveGoldForce(200) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",300)~ THEN DO ~GiveGoldForce(300) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",400)~ THEN DO ~GiveGoldForce(400) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",500)~ THEN DO ~GiveGoldForce(500) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",600)~ THEN DO ~GiveGoldForce(600) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",700)~ THEN DO ~GiveGoldForce(700) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",800)~ THEN DO ~GiveGoldForce(800) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",900)~ THEN DO ~GiveGoldForce(900) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",1000)~ THEN DO ~IncrementGlobal("NQ#SHUKSPALACEEVENT","GLOBAL",1) GiveGoldForce(1000) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
END

IF ~~ THEN BEGIN GOLD11
SAY ~Beute? Jap, aber nicht viel. Die meisten meiner Jungs sind tot, also konnte ich auch nicht viel kriegen.~
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",100)~ THEN DO ~GiveGoldForce(30) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",200)~ THEN DO ~GiveGoldForce(60) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",300)~ THEN DO ~GiveGoldForce(90) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",400)~ THEN DO ~GiveGoldForce(120) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",500)~ THEN DO ~GiveGoldForce(150) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",600)~ THEN DO ~GiveGoldForce(180) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",700)~ THEN DO ~GiveGoldForce(210) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",800)~ THEN DO ~GiveGoldForce(240) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",900)~ THEN DO ~GiveGoldForce(270) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",1000)~ THEN DO ~IncrementGlobal("NQ#SHUKSPALACEEVENT","GLOBAL",1) GiveGoldForce(1000) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
END

IF ~~ THEN BEGIN GOLD15
SAY ~Hier ist Eure Beute. Ist nicht soviel wie sonst. Jap. Verschmorte Köpfe sind schlecht für Geschäfte.~
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",100)~ THEN DO ~GiveGoldForce(75) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",200)~ THEN DO ~GiveGoldForce(150) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",300)~ THEN DO ~GiveGoldForce(225) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",400)~ THEN DO ~GiveGoldForce(300) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",500)~ THEN DO ~GiveGoldForce(375) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",600)~ THEN DO ~GiveGoldForce(450) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",700)~ THEN DO ~GiveGoldForce(525) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",800)~ THEN DO ~GiveGoldForce(600) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",900)~ THEN DO ~GiveGoldForce(675) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",1000)~ THEN DO ~GiveGoldForce(750) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
END

IF ~~ THEN BEGIN GOLD16
SAY ~Beute? Kaum etwas. Meine Jungs sind fast alle tot und die Sache mit den Angriffen macht es nicht besser...~
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",100)~ THEN DO ~GiveGoldForce(20) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",200)~ THEN DO ~GiveGoldForce(40) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",300)~ THEN DO ~GiveGoldForce(60) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",400)~ THEN DO ~GiveGoldForce(80) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",500)~ THEN DO ~GiveGoldForce(100) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",600)~ THEN DO ~GiveGoldForce(120) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",700)~ THEN DO ~GiveGoldForce(140) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",800)~ THEN DO ~GiveGoldForce(160) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",900)~ THEN DO ~GiveGoldForce(180) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
IF ~Global("NQ#SHUKSPALACEGOLDIS","GLOBAL",1000)~ THEN DO ~GiveGoldForce(200) SetGlobal("NQ#SHUKSPALACEGOLDIS","GLOBAL",0)~ EXIT
END

IF ~~ THEN BEGIN GOLD2
SAY ~Jetzt noch nicht, aber bald. Jap.~
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN GOLD3
SAY ~Nein, Boss. Tut mir Leid, Boss. Wenn die drei Tage rum sind, hab' ich Dein Gold hier!~
IF ~~ THEN REPLY ~Pah!~ DO ~~ EXIT
END

IF ~~ THEN BEGIN QUEST00
SAY ~Nein, nein. Die Ratte hat alles im Griff. Hehehe!~
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN QUEST01
SAY ~Probleme? Hier gibt's keine Probleme. Jap!~
IF ~~ THEN DO ~~ GOTO QUEST02
END

IF ~~ THEN BEGIN QUEST02
SAY ~Wir haben vielleicht ein paar Späher in den westlichen Tunneln verloren, aber ich lasse die Gänge bewachen, damit von da nichts bis nach hier kommt.~
IF ~Name("NQ#SHUK",LastTalkedToBy)~ THEN DO ~~ GOTO QUEST03A
IF ~!Name("NQ#SHUK",LastTalkedToBy)~ THEN DO ~~ GOTO QUEST03B
END

IF ~~ THEN BEGIN QUEST03A
SAY ~Falls doch, bin ich nah an genug an der Leiter um Dir Bescheid zu geben...~
IF ~~ THEN DO ~~ EXTERN ~NQ#SHUK~ 37
END

IF ~~ THEN BEGIN QUEST03B
SAY ~Falls doch, bin ich nah an genug an der Leiter um dem Boss Bescheid zu geben...~
IF ~Dead("SCHLUMPSA")~ THEN REPLY ~Wir haben uns schon um den Kanalköing gekümmert.~ DO ~~ GOTO QUEST04
IF ~Dead("SCHLUMPSA")~ THEN REPLY ~Lebt wohl!~ DO ~~ EXIT
IF ~!Dead("SCHLUMPSA")~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN QUEST04
SAY ~Was? Okay, nicht schlecht... <RACE>.~
IF ~~ THEN DO ~SetGlobal("WANTSCHLUMPSADEAD","LOCALS",3) AddexperienceParty(100)~ EXIT
END

IF ~~ THEN BEGIN QUEST05
SAY ~Die Ratte hatt Euch alles erzählt was sie weiß! Guckt Euch die Tunnel im Westen an, wenn Ihr Euch traut. Jap!~
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN QUEST06
SAY ~Lang lebe der Shuk!~
IF ~~ THEN DO ~SetGlobal("WANTSCHLUMPSADEAD","LOCALS",3) AddexperienceParty(100)~ EXIT
END

IF ~~ THEN BEGIN QUEST07
SAY ~Die Tunnel im Westen, Boss? Die Ratte hat es Dir erzählt...~
IF ~~ THEN DO ~~ EXTERN ~NQ#SHUK~ 43
END

// Event 1

IF ~GlobalGT("NQ#SHUKSPALACE","GLOBAL",0) !Name("NQ#SHUK",LastTalkedToBy) GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",0) GlobalLT("NQ#SHUKSPALACEEVENT1","GLOBAL",4) Global("CALLEVENT1","LOCALS",0)~ THEN BEGIN FIRSTEVENT00
SAY ~<RACE>, ich muss sofort mit dem Boss sprechen!~
IF ~~ THEN DO ~SetGlobal("CALLEVENT1","LOCALS",1)~ EXIT
END

IF ~GlobalGT("NQ#SHUKSPALACE","GLOBAL",0) !Name("NQ#SHUK",LastTalkedToBy) GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",0) GlobalLT("NQ#SHUKSPALACEEVENT1","GLOBAL",4) Global("CALLEVENT1","LOCALS",1) RandomNum(3,1)~ THEN BEGIN FIRSTEVENT0A
SAY ~Holt den Boss, <RACE>! Ich muss ihn sprechen!~
IF ~~ THEN DO ~~ EXIT
END

IF ~GlobalGT("NQ#SHUKSPALACE","GLOBAL",0) !Name("NQ#SHUK",LastTalkedToBy) GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",0) GlobalLT("NQ#SHUKSPALACEEVENT1","GLOBAL",4) Global("CALLEVENT1","LOCALS",1) RandomNum(3,2)~ THEN BEGIN FIRSTEVENT0B
SAY ~Ihr seid nicht der Boss! Jap. Wo ist er?~
IF ~~ THEN DO ~~ EXIT
END

IF ~GlobalGT("NQ#SHUKSPALACE","GLOBAL",0) !Name("NQ#SHUK",LastTalkedToBy) GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",0) GlobalLT("NQ#SHUKSPALACEEVENT1","GLOBAL",4) Global("CALLEVENT1","LOCALS",1) RandomNum(3,3)~ THEN BEGIN FIRSTEVENT0C
SAY ~Seid Ihr blöde? Deeer Booooss. Jetzt! Kapiert?~
IF ~~ THEN DO ~~ EXIT
END

IF ~GlobalGT("NQ#SHUKSPALACE","GLOBAL",0) Name("NQ#SHUK",LastTalkedToBy) GlobalGT("NQ#SHUKSPALACEEVENT1","GLOBAL",0) GlobalLT("NQ#SHUKSPALACEEVENT1","GLOBAL",4)~ THEN BEGIN FIRSTEVENT01
SAY ~Boss! Wir sind angegriffen worden!~
IF ~~ THEN DO ~SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",4)~ GOTO FIRSTEVENT02
END

IF ~~ THEN BEGIN FIRSTEVENT02
SAY ~Heimtückisch! Jap! Razk ist nur noch ein Haufen Asche und Kruck wird es auch nicht mehr lange machen...~
IF ~~ THEN EXTERN ~NQ#SHUK~ 30
END

IF ~~ THEN BEGIN FIRSTEVENT03
SAY ~Ich habe ihn in die hinteren Gänge im Südosten bringen lassen, damit ich sein Gejammer nicht hören muss und ihm verseh'ntlich die Kehle durschschneide... bevor Du zurück bist!~
IF ~~ THEN EXTERN ~NQ#SHUK~ 31
END


