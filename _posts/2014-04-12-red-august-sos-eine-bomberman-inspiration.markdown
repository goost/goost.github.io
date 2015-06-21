---
author: goost
comments: true
featured: true
date: 2014-04-12 20:37:54+00:00
layout: post
slug: red-august-sos-eine-bomberman-inspiration
title: Red August SOS - Eine Bomberman Inspiration
wordpress_id: 351
permalink: /2014/04/12/red-august-sos-eine-bomberman-inspiration/
categories:
- Projects
---

Im dritten Semester steht bei uns ein so genanntes Drittsemesterprojekt auf dem Plan. Mein Semester erstellte eine Arcade Games Collection, eine Kollektion von selbstprogrammierten Spielen, die von den alten Arcade Spielen aus den 80ern und so inspiriert sind. Ursprünglich hatte ich vor, die gesamte Collection vorzustellen, aber leider habe ich diese bis heute nicht erhalten. Mein eigenes Projekt befindet sich natürlich in meinem Besitz.


Wir haben uns nämlich von Bomberman inspirieren lassen und ein Mehrspieler Bomberman Unterwasser erstellt, Red August SOS, kurz Rasos. 2-4 Spieler versuchen die Red August zu bergen und dabei ihre Gegner mit Kugelfischen zu sprengen. Wer als letztes steht, hat gewonnen!


Die Graphiken stammen komplett von meiner Freundin und den Code haben wir selbst geschrieben. Im Hintergrund arbeitet ein zweidimensionales Array, in diesem liegen alle GameObjects (Spieler, Quallen, Kugelfische etc.). Das Array wird zum Zeichnen einmal durchlaufen und jedes Objekt zeichnet sich selbst. Leider führte das zu Problemen bei den Animationen, die über mehrere Felder hinausgehen ( z.B. die Spielerbewegung), sie waren sprunghaft. Das war unserer Unerfahrenheit zuzurechnen, aber wir konnten das Projekt nicht mehr umändern, alles baute darauf auf. Im Endeffekt tricksten wir mit temporären Objekten, schön ist das nicht, aber es funktioniert (wenn der Sprung trotzdem nicht komplett weg ist). Deswegen ist der Player in seinem Spritesheet auch so zerstückelt ^^.




Aber genug der Geschichte, ihr wollt doch alle das Spiel haben! [Hier](https://dl.dropboxusercontent.com/u/19662246/Rasos_standalone.jar) könnt ihr euch es downloaden, [Java 7](https://www.java.com) muss mindestens auf euren Rechner installiert sein, bei Windows einfach Doppelklick auf die Rasos_standalone.jar, Linux Nutzer wissen selbst, wie sie es starten müssen ;). Habt viel Spaß!




Für alle, die mehr zur Mechanik wissen wollen, stelle ich [hier](https://dl.dropboxusercontent.com/u/19662246/Rasos_Source.7z) den Source zur Verfügung.

[![](http://www.pgunited.de/wp-content/uploads/2014/04/screenshot_2.jpg)](http://www.pgunited.de/wp-content/uploads/2014/04/screenshot_2.jpg)[![](http://www.pgunited.de/wp-content/uploads/2014/04/screenshot_3.jpg)](http://www.pgunited.de/wp-content/uploads/2014/04/screenshot_3.jpg)[![](http://www.pgunited.de/wp-content/uploads/2014/04/screenshot_1.jpg)](http://www.pgunited.de/wp-content/uploads/2014/04/screenshot_1.jpg)[![](http://www.pgunited.de/wp-content/uploads/2014/04/spritesheet_player_1_blasen.png)](http://www.pgunited.de/wp-content/uploads/2014/04/spritesheet_player_1_blasen.png)
