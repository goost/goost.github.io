---
author: FitzChivalrik
comments: true
date: 2014-07-23 13:21:26+00:00
layout: post
slug: braintrain-projekt-osg
title: BrainTrain - Projekt in OpenSceneGraph (OSG)
wordpress_id: 382
categories:
- C++
- Development
tags:
- C++
- Demo
- Grafik
- OSG
---

Im vierten Semester steht bei uns die Vorlesung "Computergrafik 1" auf dem Programm. In dieser geht es um generative Computergrafik (d.h. nicht um Bildbearbeitung oder dergleichen, das kommt später, sondern darum, wie man Grafik erzeugt). Dies wird vor allem am Beispiel von [OSG](http://www.openscenegraph.org/) dargestellt.




OSG ist ein Szenegraph, ein Toolkit zur Erzeugung grafischer Ausgaben auf Basis von OpenGL. Laut Website wird es in vielen Bereichen, vor allem zu Simulationen und ähnlichem eingesetzt. Ob's stimmt, kann ich nicht sagen, es existiert aber durchaus eine rege Mailing-Liste samt angeschlossenem Forum, für die etwas neuere Generation.




Abgesehen davon existiert noch ein [Beginner's Guide](http://www.amazon.de/OpenSceneGraph-3-0-Beginners-Rui-Wang/dp/1849512825) (für eine mittlerweile ältere Version mit doch einigen deprecated Sachen) und ein [Cookbook](http://www.amazon.de/OpenSceneGraph-3-Cookbook-Rui-Wang/dp/184951688X/) vom selben Autor und selben Schwächen (nein, die Amazon-Links sind keine Affiliate-Links und dienen nur zur Info).




Nichtsdestotrotz sind diese Bücher ein sehr guter Einstieg und im Forum wird bei Anfängerfragen auch immer wieder auf die Bücher verwiesen…mehr Ressourcen gibt es auch nicht wirklich.




Ich habe auch die Erfahrung gemacht (ist nur mein Eindruck!), dass bei "Einsteigerfragen", die noch nicht groß von Ahnung mit der Materie zeugen, das Forum leider auch keine Hilfe ist. Es wird wie erwähnt auf das Buch verwiesen und sonst gesagt, man habe ja den Source und könne sich da alles selbst rauslesen.




The source never lies.




Im Endeffekt stimmt das auch und durch das Lesen des Quellcodes (nach dem Durcharbeiten der Bücher) habe ich auch eine Menge gelernt, die Einstiegshürde ist dabei aber trotzdem sehr groß, da OSG so gut wie gar nicht (zum Teil) dokumentiert ist. Daran wird aber gearbeitet, es braucht einfach Zeit.




Das Forum bzw. die Mailing-Liste ist also eher was für die Professionals (mein Eindruck!), gerade die sind da auch unterwegs. Allein das Stöbern da hilft aber auch ungemein (nach einer Weile^^).




Im Rahmen der Vorlesung wird in Gruppen an einer Szene in OSG gearbeitet, man muss also im Endeffekt eine Grafikdemo in OSG erschaffen. Meine Gruppe hat eine verfallene U-Bahn Station als Szene genommen, Codename für das Projekt war "BrainTrain". [Hier](http://youtu.be/Kck9t5S-lnk) könnt ihr euch einen Walkthrough von mir durch unsere Szene anschauen. Die Musik ist nicht in der Demo enthalten, um das Video aufzupeppen habe ich sie aber mitlaufen lassen :D. Sie stammt ursprünglich von [hier](http://www.nosoapradio.us/). Schaut euch seine Tracks an, ich find die super als BGMs.




Win64-Binaries gibt es [hier](https://dl.dropboxusercontent.com/u/19662246/BrainTrainWin64.7z).




Weiter stellen wir [hier](https://dl.dropboxusercontent.com/u/19662246/BrainTrainSources.7z) den gesamten Quellcode zur Verfügung (build files können einfach mittels [CMake](http://www.cmake.org/) erstellt werden). Das meiste ist von uns selbst geschrieben, nur einige Funktionen sind z.B. aus dem Cookbook übernommen (natürlich gekennzeichnet). Besonders die Modelle wurden alle in Blender von einem Teammitglied erstellt. Auf die sind wir besonders stolz =).




Aus den oben genannten Gründen haben wir viel Wert darauf gelegt, das unser Code ausreichend (bzw. überhaupt ![;)](http://www.pgunited.de/wp-includes/images/smilies/icon_wink.gif)  ) dokumentiert ist. Das hat natürlich, vor allem zum Ende hin (die Einarbeitungszeit in OSG war halt verdammt lang), nicht immer geklappt, aber es sollte jeder wichtige Teil beschrieben sein. Ich beantworte selbstverständlich auch jede aufkommende Frage zum Quellcode gern. Schreibt mir einfach eine [eMail](mailto:askme@pgunited.de?subject=Frage%20zum%20BrainTrain%20Source).




Der Code ist sicherlich an manchen (einigen/vielen x) ) Stellen nicht perfekt, er ist mit unserem Wissen gewachsen und wir sind immer noch Anfänger. Deswegen, und generell natürlich, freue ich mich auch über Anregungen, Kommentare und Kritik zum Code. Schreibt mir auch dazu sehr gerne eine [eMail](mailto:askme@pgunited.de?subject=Kommentar%20zum%20BrainTrain%20Source).




Ich hoffe, dass unser Code einigen anderen beim Einstieg in OSG helfen wird =)
