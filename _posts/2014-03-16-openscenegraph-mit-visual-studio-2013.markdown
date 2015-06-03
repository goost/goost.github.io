---
author: goost
comments: true
date: 2014-03-16 19:57:40+00:00
layout: post
slug: openscenegraph-mit-visual-studio-2013
title: 'How-To: OpenSceneGraph mit Visual Studio 2013'
wordpress_id: 329
permalink: /2014/03/16/openscenegraph-mit-visual-studio-2013/
categories:
- Development
tags:
- Development
- How to
- Programmierung
- Tipps
- Tutorial
- Visual Studio
---

Dieses Semester habe ich eine Computergrafik Vorlesung. In dieser lernen wir [OpenSceneGraph](http://www.openscenegraph.com/) kennen. Da ich auch von zu Hause auf meinem Spielerechner damit arbeiten wollte, freundete ich mein Visual Studio 2013 mit OpenSceneGraph an. Das Ganze stellte sich als gar nicht so einfach heraus, deswegen hier nun ein How-To, für alle, die dasselbe vorhaben.



Zuerst muss die neueste OpenSceneGraph Version mit der Visual Studio Version, die man benutzen will, gebuildet werden. Für VS2013 gibt es keinen pre-Build, man muss also selbst ran. Dazu hab ein ein super How-To [hier](http://xinyustudio.wordpress.com/2014/02/25/building-openscenegraph-with-visual-studio-2013-2/#more-2905) gefunden. Folgt einfach genau seinen Anweisungen, achtet beim Builden am Ende, ob ihr als Release oder Debug bildet (der Debug-Output endet immer mit einem "d" am Ende). Die Versionen sind, soweit ich das verstanden habe, zu einander inkompatibel, zur Sicherheit habe ich beides gebuildet.  
EDIT: Tritt während dessen ein Fehler auf, dass die mfc120*.lib nicht gefunden wird, so installiert das [hier](http://www.microsoft.com/en-us/download/details.aspx?id=40770) und buildet nochmal, danach sollte es eigentlich gehen. Sonst googlen ! ;)  
EDIT 2015: Mittlerweile weiß ich, wofür man Release und Debug Builds hat. Tja, am Anfang ist einem selbst so etwas Grundlegendes nicht bekannt. Buildet also, je nach dem was ihr braucht. Wahrscheinlich wohl beides.  
Nach dem ihr fertig seid, solltet in der "cmake_install.cmake" (befindet sich in eurem "build"-Ordner, da wo die Solution ist) euren finalen Installationsordner einstellen.

[![](http://www.pgunited.de/wp-content/uploads/2014/03/cmake_install_folder.jpg)](http://www.pgunited.de/wp-content/uploads/2014/03/cmake_install_folder.jpg)
Dann einmal das INSTALL-Project (entweder Debug oder Release oder beides) builden, damit werden die vorher erstellten Programme und Libs in euren gewählten Installationsordner mit der richtigen Ordnerstruktur kopiert.
Ladet nun das [Datenpaket](http://www.openscenegraph.com/index.php/download-section/data) runter und kopiert es in den Installationsordner in einen Ordner namens "data". Dort kommen dann auch alle Objekte hin, die ihr benutzen wollt und OpenSceneGraph findet die da automatisch, sofern die Umgebungsvariablen richtig gesetzt sind.
Aus dem von euch heruntergeladenem 3rdParty Package kopiert ihr die zlib.dll (und eventuell die zlibd.dll) in Installationsordnerbin. Eventuell wird man noch andere 3rdParty-DLLs aus dem Ordner brauchen, bisher fehlte mir nur diese. Das ganze sollte nun so aussehen:

[![](http://www.pgunited.de/wp-content/uploads/2014/03/osg_folder_structure.jpg)](http://www.pgunited.de/wp-content/uploads/2014/03/osg_folder_structure.jpg)
Für eine schnelle Setzung der Umgebungsvariablen hat wieder xinyustudio [ein kleines Skript](http://xinyustudio.wordpress.com/2013/06/03/installing-openscenegraph-osg-on-windows/) zusammengestellt. Für mein System waren die Anführungszeichen aber falsch, deswegen hier eine Version mit korrigierten Füßchen. Vergesst nicht euren Installationsordner einzutragen! Mit Adminrechten ausführen.
{% highlight batch %}
@echo on
rem in der nächsten Zeile eigenen Installationsordner angeben!
setx OSG_ROOT G:\OpenSceneGraph
setx OSG_BIN_PATH %OSG_ROOT%\bin
setx OSG_INCLUDE_PATH %OSG_ROOT%\include
setx OSG_LIB_PATH %OSG_ROOT%\lib
setx OSG_SAMPLES_PATH %OSG_ROOT%\share\OpenSceneGraph\bin
setx OSG_FILE_PATH %OSG_ROOT%\data
setx Path "%OSG_BIN_PATH%;%OSG_SAMPLES_PATH%;%Path%"
pause
{% endhighlight %}

Prüft nach, ob eurer Path richtig ist (mit den beiden neuen Variablen), wenn nicht, ergänzt diese manuell (Ich musste das Script zweimal starten und den Path per Hand eingeben, bis alles korrekt war…).
Die Grundinstallation ist damit fertig.
Beim Anlegen eines neuen Projekts muss man immer die richtigen Dependencies setzen. Das will ich euch auch einmal zeigen.  
EDIT 2015: Oder ihr benutzt mein Template aus dem nächsten Post. Oder, wie ich mittlerweile am besten finde, einfach [CMake](http://www.cmake.org/).  
Erstellt zuerst in Visual Studio ein leeres C++ Projekt.
Habt ihr einen x64 System, so stellt die Konfiguration auch auf x64, ansonsten werden später die wildesten Fehler geworfen.

[![](http://www.pgunited.de/wp-content/uploads/2014/03/VS_x64.jpg)](http://www.pgunited.de/wp-content/uploads/2014/03/VS_x64.jpg)
Legt nun die Dependencies an, orientiert euch dabei an den Bildern. Folgende Werte müsst ihr eintragen: die richtigen Includes, die richtigen Libs und die richtigen Preprocessor-Definitions (WIN32,_WIN32 und _DEBUG bzw. _NDEBUG (Fehlerteufel im Bild!)). 

[![](http://www.pgunited.de/wp-content/uploads/2014/03/VS_Properties_where.jpg)](http://www.pgunited.de/wp-content/uploads/2014/03/VS_Properties_where.jpg)[![](http://www.pgunited.de/wp-content/uploads/2014/03/VS_Properties_preprocessor_release.jpg)](http://www.pgunited.de/wp-content/uploads/2014/03/VS_Properties_preprocessor_release.jpg)[![](http://www.pgunited.de/wp-content/uploads/2014/03/VS_Properties_include.jpg)](http://www.pgunited.de/wp-content/uploads/2014/03/VS_Properties_include.jpg)[![](http://www.pgunited.de/wp-content/uploads/2014/03/VS_Properties_additional_libs_d.jpg)](http://www.pgunited.de/wp-content/uploads/2014/03/VS_Properties_additional_libs_d.jpg)[![](http://www.pgunited.de/wp-content/uploads/2014/03/VS_Properties_preprocessor.jpg)](http://www.pgunited.de/wp-content/uploads/2014/03/VS_Properties_preprocessor.jpg)[![](http://www.pgunited.de/wp-content/uploads/2014/03/VS_Properties_libs.jpg)](http://www.pgunited.de/wp-content/uploads/2014/03/VS_Properties_libs.jpg)[![](http://www.pgunited.de/wp-content/uploads/2014/03/VS_Properties_additional_libs.jpg)](http://www.pgunited.de/wp-content/uploads/2014/03/VS_Properties_additional_libs.jpg)
Bei den "Additional Dependencies" tragt ihr entweder die ganzen *d.lib's ein, wenn ihr bei der Debug-Configuration seid oder die ohne "d" bei der Release-Configuration. Hier jeweils eine Liste zum Kopieren:

~~~~
OpenThreads.lib
osg.lib
osgAnimation.lib
osgDB.lib
osgFX.lib
osgGA.lib
osgManipulator.lib
osgParticle.lib
osgPresentation.lib
osgShadow.lib
osgSim.lib
osgTerrain.lib
osgText.lib
osgUtil.lib
osgViewer.lib
osgVolume.lib
osgWidget.lib
~~~~~~

~~~~
OpenThreadsd.lib
osgAnimationd.lib
osgd.lib
osgDBd.lib
osgFXd.lib
osgGAd.lib
osgManipulatord.lib
osgParticled.lib
osgPresentationd.lib
osgShadowd.lib
osgSimd.lib
osgTerraind.lib
osgTextd.lib
osgUtild.lib
osgViewerd.lib
osgVolumed.lib
osgWidgetd.lib
~~~~~~
Kopiert dann dieses Beispiel in den Source Folder (whatever.cpp). Sollte das problemlos starten habt ihr alles richtig gemacht. Gratuliere! Jedes mal, wenn ihr ein neues Projekt angelegt wird, müssen die Dependencies nochmal gesetzt werden, aber das geht mit Übung relativ flüssig ^^. EDIT: Im nächsten Post stelle ich ein Template zur Verfügung, was all die Arbeit für euch machen sollte.

{% highlight cpp %}
#include <osgDB/ReadFile>;
#include <osgViewer/Viewer>;

int main( int argc, char** argv )
{
osg::ref_ptr root = osgDB::readNodeFile( "cessna.osg" );
osgViewer::Viewer viewer;
viewer.setSceneData( root.get() );
return viewer.run();
}
{% endhighlight %}


Für die, die nicht selbst builden wollen, biete ich [hier](https://dl.dropboxusercontent.com/u/19662246/OpenSceneGraph.7z) einen gepackten, kompletten Installationsordner. Einfach entpacken wohin ihr wollt, die Batch anpassen und ausführen. Gebuild wurde mit Visual Studio 2013 Update 1, eine Gewähr für Funktionalität übernehme ich aber natürlich nicht ![;)](http://www.pgunited.de/wp-includes/images/smilies/icon_wink.gif)




Habt Spaß mit OpenSceneGraph und Visual Studio 2013!
