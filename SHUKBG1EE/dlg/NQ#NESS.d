BEGIN NQ#NESS

// NQ#GB10

IF ~~ THEN BEGIN 0
SAY @0 /* Oh, nein... Das ist ja noch schlimmer als damals, wo ich mit der einäugigen Tochter dieses blinden Klerikers Rufo in... */
IF ~~ THEN EXTERN ~NQ#GB10~ 2
END

IF ~~ THEN BEGIN 1
SAY @1 /* Das... das sind Goblins! Das ist ja noch schlimmer als ich damals mit der Tochter des blinden Klerikers Rufo in... */
IF ~~ THEN EXTERN ~NQ#GB10~ 2
END

IF ~~ THEN BEGIN 2
SAY @2 /* So formuliert klingt das nach einem hervorragenden Angebot, werter... ähm, Goblin. */
IF ~~ THEN EXTERN ~NQ#SHUK~ 36
END

//

IF ~Global("NQ#SHUKSPALACEEVENT1","GLOBAL",19)~ THEN BEGIN WAIT1
SAY @3 /* Was für ein Alptraum... */
IF ~~ THEN DO ~~ EXIT
END

//

IF ~Global("NQ#SHUKSPALACEEVENT1","GLOBAL",11)~ THEN BEGIN BUSTED1
SAY @4 /* Ha, guten Abend, <LADYLORD>. Ich spaziere hier nur zufällig durch die Gegend und genieße das gleichmäßgige Rekombinationsleuchten... */
IF ~~ THEN REPLY @5 /* Und warum braucht Ihr dazu einen Eimer? */ DO ~SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",13)~ GOTO BUSTED2
IF ~~ THEN REPLY @6 /* Schluss mit den Lügen! Verteidigt Euch! */ DO ~SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",13)~ GOTO BUSTED3
IF ~~ THEN REPLY @7 /* Ich suche einen Gnom, der zu dieser Zeit ein magisches Gemisch in diesen Gulli schüttet. Habt Ihr zufällig einen gesehen? */ DO ~SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",13)~ GOTO BUSTED4
END

IF ~~ THEN BEGIN BUSTED2
SAY @8 /* Ach, der Eimer. Den hat mir mein geschätzter Kollege Binabus zur Aufbewahrung gegeben. Ich nehme diese Aufgabe sehr ernst, weil ich weiß, wie sehr er an diesem Eimer hängt. Er hat ihm mal das Leben gerettet, als er von einer Horde verhexter Krähenfrösche angegriffen wurde und... */
IF ~~ THEN DO ~~ GOTO BUSTED3
END

IF ~~ THEN BEGIN BUSTED3
SAY @9 /* Ihr kriegt mich nicht! */
IF ~~ THEN DO ~~ EXIT
END

IF ~~ THEN BEGIN BUSTED4
SAY @10 /* Äh, ja klar. Der war grade noch da! Den Eimer, den ich in der Hand halte, hat er hier verloren. Ich hatte den Eindruck, dass er hier gefährliche Substanzen entsorgt und habe ihn gleich angeschrien "Hey, Ihr da! Das könnt Ihr doch nicht machen!" Da hat er den Eimer fallen gelassen und... */
IF ~~ THEN DO ~~ GOTO BUSTED3
END

//

IF ~True()~ THEN BEGIN BEATEN1
SAY @11 /* Oh, au, schon gut! Ich gebe auf, nur bitte tut mir nicht mehr weh! */
IF ~~ THEN GOTO BEATEN2
END

IF ~~ THEN BEGIN BEATEN2
SAY @12 /* Was wollt Ihr denn überhaupt von mir? Ihr seid doch nicht von der Stadtwache! Ich weiß, ich hätte die Substanzen vor der Entsorgung erst neutralisieren sollen, aber wisst Ihr was Natriumhydrogencarbonat in dieser Stadt kostet!? */
IF ~~ THEN GOTO BEATEN3
END

IF ~~ THEN BEGIN BEATEN3
SAY @13 /* Früher hat sich mein guter alter Grünschleim, Mister Gubbels, noch um die Entsorgung gekümmert, aber seit der Sache mit dem Wuchtöl ist er nicht mehr derselbe. Misstrauisch, nachtragend und gehässig wie mein Schwager Farantel, der eingebildete Narr! */
IF ~~ THEN GOTO BEATEN4
END

IF ~~ THEN BEGIN BEATEN4
SAY @14 /* Ich... äh... neige zu Abschweifungen, wenn ich mich bedroht fühle... wie meine Großtante Buldi, bevor... Wollt Ihr nicht Eure Waffen wegstecken? Wir sind doch alle, äh, zivilisierte Leute, oder nicht? */
IF ~Global("KILLGOBS","LOCALS",0)~ THEN REPLY @15 /* Eure Abfälle haben zwei Goblins getötet. */ DO ~SetGlobal("KILLGOBS","LOCALS",1)~ GOTO TALK1
IF ~Global("KILLGOBS","LOCALS",0)~ THEN REPLY @16 /* Eure Abfälle haben zwei... Lebewesen getötet. */ DO ~SetGlobal("KILLGOBS","LOCALS",2)~ GOTO TALK4
IF ~~ THEN REPLY @17 /* Zivilisiert? Warum glaubt Ihr wohl, nennt man diese Region Schwertküste? */ GOTO TALK5
IF ~~ THEN REPLY @18 /* Ihr seid Euch Eurer Schuld offenbar bewusst, wie wollt Ihr sie begleichen? */ GOTO TALK7
END

IF ~~ THEN BEGIN TALK1
SAY @19 /* Zwei Goblins? Oh, das... */
IF ~~ THEN GOTO TALK2
END

IF ~~ THEN BEGIN TALK2
SAY @20 /* ...ist doch großartig! Ich hätte mir denken können, dass die Chemikalien zum Zweck der Ungezieferbekämpfung geeignet sind... warum kippe ich sie heimlich weg, statt sie zu verkaufen!? */
IF ~~ THEN GOTO TALK3
END

IF ~~ THEN BEGIN TALK3
SAY @21 /* Aber was wollt Ihr denn nun von mir? Wenn Ihr Euch bedanken wollt... Ich könnte ein paar neue Reagenzgläser mit magischer Verstärkung gebrauchen. */
IF ~~ THEN REPLY @22 /* Ihr seid ein herzloser kleiner Mann. */ GOTO TALK11
IF ~~ THEN REPLY @23 /* Sie waren Teil meiner Geschäfte, die Ihr gestört habt! */ GOTO TALK12
IF ~~ THEN REPLY @24 /* Ihr Tod wird nicht ungesühnt bleiben! */ GOTO TALK13
END

IF ~~ THEN BEGIN TALK4
SAY @25 /* Oh, verdammt! Da unten hat jemand gearbeitet? Und ich habe sie getötet? Das ist äußerst... unpraktisch. */
IF ~~ THEN REPLY @22 /* Ihr seid ein herzloser kleiner Mann. */ GOTO TALK16
IF ~~ THEN REPLY @23 /* Sie waren Teil meiner Geschäfte, die Ihr gestört habt! */ GOTO TALK12
IF ~~ THEN REPLY @24 /* Ihr Tod wird nicht ungesühnt bleiben! */ GOTO TALK17
END

IF ~~ THEN BEGIN TALK5
SAY @26 /* Oh... ich dachte immer es hätte etwas mit riesigen Meeresungeheuern mit schwertförmigen Hörnern zu tun, aber Odrics Bruder war immer der Meinung... */
IF ~~ THEN GOTO TALK6
END

IF ~~ THEN BEGIN TALK6
SAY @27 /* Hey! Nicht schlagen! Was wollt Ihr denn von mir!? */
IF ~Global("KILLGOBS","LOCALS",0)~ THEN REPLY @15 /* Eure Abfälle haben zwei Goblins getötet. */ DO ~SetGlobal("KILLGOBS","LOCALS",1)~ GOTO TALK1
IF ~Global("KILLGOBS","LOCALS",0)~ THEN REPLY @16 /* Eure Abfälle haben zwei... Lebewesen getötet. */ DO ~SetGlobal("KILLGOBS","LOCALS",2)~ GOTO TALK4
IF ~~ THEN REPLY @18 /* Ihr seid Euch Eurer Schuld offenbar bewusst, wie wollt Ihr sie begleichen? */ GOTO TALK7
IF ~~ THEN REPLY @28 /* Ich will, dass Ihr aufhört Eure Abfälle hier zu entsorgen und verschwindet! */ GOTO END1
END

IF ~~ THEN BEGIN TALK7
SAY @29 /* Ah! Ihr meint Bestechung? Ihr verpfeift mich nicht an die Stadtwache und ich zahle Euch zweihundert Goldstücke? */
IF ~~ THEN GOTO TALK8
END

IF ~~ THEN BEGIN TALK8
SAY @30 /* Damit wären alle zufrieden, oder? Der Onkel meines Bruders hat sogar mal einen wütenden Minotaurus bestochen! Sie wurden gute Freunde und haben sich noch Jahre danach zum Tee getroffen. Jedenfalls bis mein Onkel versehentlich das Service des Minotaurus zerbrochen hat... */
IF ~~ THEN DO ~SetGlobal("MINOSTORY","LOCALS",1)~ GOTO TALK9
END

IF ~~ THEN BEGIN TALK9
SAY @31 /* Seine Beerdigung war wirklich herzergreifend. Sie hatten ihn in viele kleine Särge gestopft... das war günstiger als ein großer. Meine Großtante kannte da einen Zimmerer... Sonst hätte man natürlich auch alle Stücke zusammenwerfen können. */
IF ~~ THEN GOTO TALK10
END

IF ~~ THEN BEGIN TALK10
SAY @32 /* Also was sagt Ihr? Ich werde es auch sicher nicht wieder tun! */
IF ~~ THEN REPLY @33 /* Ich bin nicht bestechlich. Ich habe eine bessere Idee... */ GOTO TALK19
IF ~Global("KILLGOBS","LOCALS",0)~ THEN REPLY @34 /* Das wird nicht ausreichen. Eure Abfälle haben zwei Goblins getötet! */ DO ~SetGlobal("KILLGOBS","LOCALS",1)~ GOTO TALK1
IF ~Global("KILLGOBS","LOCALS",0)~ THEN REPLY @35 /* Das wird nicht ausreichen. Eure Abfälle haben zwei... Lebewesen getötet! */ DO ~SetGlobal("KILLGOBS","LOCALS",2)~ GOTO TALK4
IF ~~ THEN REPLY @36 /* Ja, wenn Ihr nur endlich still seid! */ GOTO END2
IF ~~ THEN REPLY @37 /* Ich brauche kein Gold. Tut es einfach nicht wieder, dann gibt es keine Probleme. */ GOTO END1
END

IF ~~ THEN BEGIN TALK11
SAY @38 /* Ich bin Wissenschaftler! Macht Ihr Euch etwas Sorgen wegen zwei Goblins? Hallo? Das sind zwei Ungeheuer weniger, die sich an den unschuldigen Bürgerinnen dieser Stadt vergreifen können! */
IF ~~ THEN REPLY @39 /* Ihr beurteilt sie nur nach Ihrer Rasse, aber sie waren vernunftbegabte Lebewesen und hatten damit die Wahl zum Guten oder Bösen! */ GOTO TALK13
IF ~~ THEN REPLY @23 /* Sie waren Teil meiner Geschäfte, die Ihr gestört habt! */ GOTO TALK12
IF ~~ THEN REPLY @40 /* Ihr Tot wird nicht ungesühnt bleiben! */ GOTO TALK13
END

IF ~~ THEN BEGIN TALK12
SAY @41 /* Also... ähm... tut mir Leid? Wie hätte ich das wissen sollen? Lasst mich doch einfach laufen. Nehmt doch diese zweinhundert Goldmünzen zur Entschädigung! */
IF ~Global("MINOSTORY","LOCALS",0)~ THEN GOTO TALK8
IF ~!Global("MINOSTORY","LOCALS",0)~ THEN GOTO TALK10
END

IF ~~ THEN BEGIN TALK13
SAY @42 /* Seid Ihr verrückt? Das waren Goblins! Oh nein, Ihr seid verrückt, nicht wahr!? */
IF ~~ THEN GOTO TALK14
END

IF ~~ THEN BEGIN TALK14
SAY @43 /* Ich hatte einen Neffen mit dem gleichen Problem... hat überall Ankhegs gesehen. Was eigentlich kein Problem war, bis er einem Echten begegnet ist und ihn mit aller Kraft ignoriert hat... */
IF ~~ THEN GOTO TALK15
END

IF ~~ THEN BEGIN TALK15
SAY @44 /* Was habt Ihr denn nur mit mir vor? Wollt Ihr nicht einfach diese zweihundert Goldmünzen nehmen und mich laufen lassen? */
IF ~~ THEN REPLY @45 /* Ihr habt gegen das Gesetz verstoßen. Wir übergeben Euch der Stadtwache. */ GOTO END3
IF ~Global("KILLGOBS","LOCALS",1)~ THEN REPLY @46 /* Ihr werdet Euch vor den Goblins verantworten. */ GOTO END4
IF ~Global("KILLGOBS","LOCALS",2)~ THEN REPLY @47 /* Ihr werdet Euch vor den... Verwandten der Getöteten verantworten. */ GOTO END45
IF ~~ THEN REPLY @48 /* Gebt uns das Gold und haut ab! */ GOTO END2
IF ~~ THEN REPLY @49 /* Denkt über Eure Verfehlung nach und haut ab! */ GOTO END1
END

IF ~~ THEN BEGIN TALK16
SAY @50 /* Ich bin Wissenschaftler! Meine Erkenntnisse in der Alchemie sind ein wichtiger Beitrag für den Fortschritt! Wenn jemand um Mitternacht durch die Kanalisation schleicht, dürfte sein Wert für die Allgemeinheit wohl ehr bescheidener Natur sein. Bedauerliche Opfer auf dem Weg in eine bessere Zukunft... */
IF ~~ THEN REPLY @51 /* Das ist widerlich und außerdem falsch. Sie waren kein Opfer des Fortschritts. Sie sind gestorben, weil Ihr Euren Abfall nicht fachgerecht entsorgt habt! */ GOTO TALK18
IF ~~ THEN REPLY @23 /* Sie waren Teil meiner Geschäfte, die Ihr gestört habt! */ GOTO TALK12
IF ~~ THEN REPLY @40 /* Ihr Tot wird nicht ungesühnt bleiben! */ GOTO TALK12
END

IF ~~ THEN BEGIN TALK17
SAY @52 /* Seid doch nicht dumm! Ich bin ja bereit zu sühnen und wie! Ich... ich zahle Euch zweihundert Goldstücke, okay? */
IF ~~ THEN GOTO TALK8
END

IF ~~ THEN BEGIN TALK18
SAY @53 /* Ja ja, auch ich habe Fehler gemacht... wollt Ihr nicht diese zweihundert Goldstücke als Entschuldigung nehmen und die ganze Sache vergessen? */
IF ~~ THEN REPLY @45 /* Ihr habt gegen das Gesetz verstoßen. Wir übergeben Euch der Stadtwache. */ GOTO END3
IF ~Global("KILLGOBS","LOCALS",1) !Dead("NQ#GB10")~ THEN REPLY @46 /* Ihr werdet Euch vor den Goblins verantworten. */ GOTO END4
IF ~Global("KILLGOBS","LOCALS",2) !Dead("NQ#GB10")~ THEN REPLY @47 /* Ihr werdet Euch vor den... Verwandten der Getöteten verantworten. */ GOTO END45
IF ~~ THEN REPLY @48 /* Gebt uns das Gold und haut ab! */ GOTO END2
IF ~~ THEN REPLY @49 /* Denkt über Eure Verfehlung nach und haut ab! */ GOTO END1
END

IF ~~ THEN BEGIN TALK19
SAY @54 /* Och, nee! Was habt Ihr mit mir vor!? */
IF ~~ THEN REPLY @45 /* Ihr habt gegen das Gesetz verstoßen. Wir übergeben Euch der Stadtwache. */ GOTO END3
IF ~Global("KILLGOBS","LOCALS",1) !Dead("NQ#GB10")~ THEN REPLY @46 /* Ihr werdet Euch vor den Goblins verantworten. */ GOTO END4
IF ~Global("KILLGOBS","LOCALS",2) !Dead("NQ#GB10")~ THEN REPLY @47 /* Ihr werdet Euch vor den... Verwandten der Getöteten verantworten. */ GOTO END45
IF ~~ THEN REPLY @48 /* Gebt uns das Gold und haut ab! */ GOTO END2
IF ~~ THEN REPLY @49 /* Denkt über Eure Verfehlung nach und haut ab! */ GOTO END1
END

IF ~~ THEN BEGIN END1 // Nothing.
SAY @55 /* Ja, klar, natürlich! Ihr werdet mich nie wieder sehen, versprochen! */
IF ~~ THEN DO ~SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",14) EraseJournalEntry(@70038) EraseJournalEntry(@70039) EraseJournalEntry(@70040) EraseJournalEntry(@70041) EraseJournalEntry(@70047) AddJournalEntry(@70042,QUEST_DONE) AddexperienceParty(1000) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN END2 // Gold
SAY @55 /* Ja, klar, natürlich! Ihr werdet mich nie wieder sehen, versprochen! */
IF ~~ THEN DO ~GiveGoldForce(200) SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",15) SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",14) EraseJournalEntry(@70038) EraseJournalEntry(@70039) EraseJournalEntry(@70040) EraseJournalEntry(@70041) EraseJournalEntry(@70047) AddJournalEntry(@70043,QUEST_DONE) AddexperienceParty(1000) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN END3 // Guards
SAY @56 /* Ihr wollt mich den Bürokraten überlassen? Womit habe ich das verdient!? */
IF ~~ THEN DO ~~ GOTO END35
END

IF ~~ THEN BEGIN END35
SAY @57 /* Ich kannte mal einen Beamten, der seine Opfer nur durch das gleichmäßige rezitieren langweiliger Paragraphen petrifiziert hat! Natürlich, er war mütterlicherseits eine Medusa, aber... */
IF ~~ THEN DO ~SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",16) ClearAllActions() StartCutSceneMode() StartCutScene("NQ#SHC03")~ EXIT
END

IF ~~ THEN BEGIN END4 // Goblins
SAY @58 /* Was!? Diese Monster werden mich doch umbringen! Das darf doch alles nicht wahr sein! Ich bin Intellektueller!!! */
IF ~~ THEN DO ~SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",17) ClearAllActions() StartCutSceneMode() StartCutScene("NQ#SHC02")~ EXIT
END

IF ~~ THEN BEGIN END45 // Goblins
SAY @59 /* Was!? Die werden mich umbringen! Das darf doch alles nicht wahr sein! Ich bin Intellektueller!!! */
IF ~~ THEN DO ~SetGlobal("NQ#SHUKSPALACEEVENT1","GLOBAL",18) ClearAllActions() StartCutSceneMode() StartCutScene("NQ#SHC02")~ EXIT
END