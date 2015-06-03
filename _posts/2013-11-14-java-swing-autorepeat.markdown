---
author: goost
comments: true
date: 2013-11-14 21:19:06+00:00
layout: post
slug: java-swing-autorepeat
title: 'Java (Swing): Autorepeat von Tastendrücken abfangen'
wordpress_id: 136
permalink: /2013/11/14/java-swing-autorepeat/
categories:
- Development
- Java
tags:
- Development
- Java
- Programmierung
- Tipps
---

Heute mal ein etwas technischer Artikel. Wir haben als Semesterprojekt die Aufgabe, eine "Arcade Games Collection" zu erstellen. Wir sind mehrere Teams aus jeweils fünf Leuten die an einem Arcade Game arbeiten, diese werden dann unter einer Haube zusammengefasst und dadurch entsteht die Collection. Meine Gruppe widmet sich einem Bomberman-Klon (Arbeitstitel NotBomberMan). Zur einfacheren Handhabung der Steuerung wollten wir als Feature einbauen, dass jeder Schritt genau einen Tastendruck benötigt. Heißt also, ich drücke die Taste für nach links, meine Figur bewegt sich genau einen Schritt nach links, auch wenn ich die Taste gedrückt halte. Zur erneuten Bewegung muss ich also die Taste erneut drücken. Sollte wohl nicht allzu schwer zu implementieren sein, oder?




Javas KeyListener Interface bietet zwei Methoden an, die sich prächtig für so eine Aufgabe eignen: _keyPressed(KeyEvent e)_ und _keyReleased(KeyEvent e)_. Mittels _keyPressed_ wird, neben der Bewegung, auch ein Boolean auf _false_ gesetzt, die Bewegung findet aber nur statt, wenn dieser auf _true_ ist. Auf _true_ wird er aber erst durch einen Aufruf von _keyReleased_ gesetzt. Das wars, damit sollte die gewünschte Funktionalität erreicht sein. Leider stellte sich das als nicht ganz so einfach heraus.




#### Systemabhängiger Autorepeat




Jeder kennt das Verhalten, das auftritt, sobald man eine Taste drückt und sie gedrückt hält: die so beanspruchte Taste wird mehrmals hintereinander ins Textfeld eingegeben. Genau dieses Verhalten ist es, dass unsere Logik vernichtet. Je nach System sendet dieser Autorepeat andere Events aus. Auf dem Ubuntu in der Hochschule werden ständig im Wechsel _keyPressed_ und _keyReleased_ Events gesendet, womit unsere Logik denkt, die Taste wurde gedrückt, losgelassen, gedrückt, losgelassen usw. Und zack, die Figur bewegt sich trotz gedrückt halten der Taste mehrmals.




Kurze Google Suche ergab, dass es keine einfache Lösung für dieses Problem gibt. Viele Ansätze gehen über die Zeit, vom Autorepeater gesendete Events sind entweder zeitlich nur im Millisekunden Bereich auseinander (so schnell kann kein Mensch drücken) oder das zum _keyPressed_ zugehörige _keyReleased_ Event hat keinen messbaren Zeitunterschied. Man könnte also eine Lösung schreiben, die die Events abfängt und ihre zeitlichen Abstände prüft, bevor diese verarbeitet werden. Ist der Abstand zu gering, so wird das Event als Repeat verworfen. Aber wann ist zu gering zu gering? Die Lösung gefiel uns nicht wirklich, da sie auch nicht ganz plattformunabhängig war. Glücklicherweise fanden wir noch eine weitere Lösung, die vollkommen ohne eine Zeitmessung auskommt und damit (hoffentlich weitesgehend) plattformunabhängig ist. Die Lösung stammt von Elias Vasylenko und er hat sie auf [seinen Blog](http://elionline.co.uk/blog/2012/07/12/ignore-key-repeats-in-java-swing-independently-of-platform/) veröffentlicht (dort findet ihr auch den kompletten Quellcode). Ich möchte euch die Funktionsweise des Suppressors im Folgenden kurz erklären.




#### Robots, dein Freund und Helfer




Elias Suppressor baut darauf auf, dass der Autorepeater durch einen anderen Tastendruck gekillt wird. Das kann man leicht testen: man drücke '_a'_ und lasse nicht los, dabei drücke man dann auf  '_s'_. Was passiert? '_a'_ wird nicht mehr repeatet, sondern '_s'_. Diese Funktionsweise macht sich Elias zu nutze. Der Code wird entweder mittels der _install()_ global für alle Componenten eingefügt (als GlobalListener) oder mittels _ installTo(Component component)_ an eine bestimmte Komponente (z.B. an ein JFrame) angehängt, dann in Form eines zusätzlichen KeyListener und FocusListener. Mittels _remove() / removeFrom()_ kann der Suppressor dann wieder entfernt werden. Wird nun eine Taste gedrückt, so sendet der Suppressor mithilfe der Robots Klasse ein _keyPressed_ und _keyReleased_ einer anderen Taste und konsumiert diese Events. Dadurch wird der Autorepeat der eigentlich gedrückten Taste gekillt, der Benutzer hält die Taste weiter gedrückt, aber es werden keine Events mehr gefeuert. Das wars! Der Code hat noch einige weitere Abfragen, z. B. sollte möglichst nicht die Taste gesendet werden, die der Benutzer gerade gedrückt hat und ähnliches, das Kernkonzept ist aber wirklich lediglich das Killen des Repeats durch ein simuliertes Drücken einer anderen Taste und Konsumierung von diesem künstlichen Event. Theoretisch kann es zu einem Fehler kommen, wenn der Benutzer flinke Hände hat (oder mehrere Benutzer an der selben Tastatur gleichzeitig hantieren) und gleich nach dem Drücken einer Taste die nächste Taste drückt und diese genau die ist, die der Suppressor gesendet hat. Dadurch kann es vorkommen, dass die Taste nicht gedrückt wird, da das System den doppelten _keyPressed_ (einmal vom Benutzer, einmal vom Robot) ignoriert und das Event aber trotzdem vom Robot abgefangen wird. Praktisch wird aber wohl niemand so flinke Finger haben wie die CPU rechnet ;). Ansonsten kann man auch nur Tasten wählen, die der Robot drücken soll, von denen es sehr unwahrscheinlich ist, das der Benutzer sie im Kontext des Programms jemals drücken wird.




Eine weitere Einschränkung gibt es noch. Natürlich bekommen auch alle anderen KeyListener die falschen Events. Diese sollten dann auf die gedrückten Tasten nicht anspringen oder sie irgendwie verwerfen. Je nachdem wie viele das sind, kann es schnell unübersichtlich werden. In diesem Falle empfiehlt es sich, den Suppressor nur an bestimme Komponenten zu hängen oder die _keyReleased/keyPressed_ Methoden des Suppressor an seine eigenen Bedürfnisse noch zusätzlich anpassen. Alles in allem ist dies meiner Meinung nach eine sehr elegante und praktische Lösung, wie man das Autorepeat Problem umgehen kann und in unserem Spiel funktioniert es super.



