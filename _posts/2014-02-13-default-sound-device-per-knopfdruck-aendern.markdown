---
author: goost
comments: true
date: 2014-02-13 03:49:29+00:00
layout: post
slug: default-sound-device-per-knopfdruck-aendern
title: 'Script: Default Sound Device per Knopfdruck ändern'
wordpress_id: 253
permalink: /2014/02/13/default-sound-device-per-knopfdruck-aendern/
categories:
- Development
- Scripts
tags:
- Ahk
- AutoHotKEy
- Development
- Programmierung
- Script
- Tipps
- Wissen
---

Ich muss oft zwischen zwei Sound Devices hin- und herswitchen. Das eine sind die internen Boxen meines Fernsehers (mein Fernseher ist einer meiner Monitore ^_^), das andere mein Headset. Beim Filme o.Ä. schauen werden die Boxen benutzt, beim zocken das Headset. Das Switchen geht nur mühselig per Hand, man muss das Sound Fenster per Rechtsklick auf den Lautsprecher im System-Tray öffnen und dann das Default Device einstellen. Windows bietet auch keine BuiltIn One-Click-Lösung an. Also musste eine eigene Lösung her.

Für das Schreiben von Makros benutze ich hin und wieder die Scriptsprache [AutoHotKey](http://www.autohotkey.com/). Mein letzter Einsatz dieser ist zwar schon wieder lange her, sie kam mir aber bei der Suche nach einer Lösung sofort in Sinn. Heraus gekommen ist das Script, was ich am Ende des Posts eingefügt habe. Durch Drücken der F6-Taste poppt für eine Sekunde das Sound Fenster auf, das Device, was gerade nicht Default ist, wird ausgewählt und das Fenster poppt zu.

Das Script ist aber leider nicht ganz portabel und muss für den eigenen Gebrauch angepasst werden. Die zu machenden Änderungen befinden sich ganz am Anfang und sind kommentiert. Auch lässt sich nur zwischen genau zwei Sound Devices switchen, ich brauche nicht mehr und habe deswegen die Logik auch nicht variabel gemacht. Man braucht natürlich noch ein installiertes AutoHotKey, damit das Script ausgeführt werden kann. Wer es auch immer nutzen und anpassen will, der möge das tun. Wenn ihr es verbessert, so würde ich mich über eine Rückmeldung freuen, so dass ich die verbesserte Version hier auch einfügen kann.

Hier aber nun das Script, viel Spaß damit:

``` autohotkey

;----------------------------------------------
; Sound Device Switcher
;Switches between two different devices
;Author: Gleb Ostrowski (http://www.pgunited.de)
;----------------------------------------------
firstDevice = 1 ;the position of your first device
secondDevice = 2 ;the position of your second device
;My first and second devices are coincidentally the first and second devices on the list
firstDeviceSelected = TV set as Default ;which message should appear when the first device is selected
secondDeviceSelected = Speaker set as Default ; which message should appear when the second device is selected
windowName = Sound ;in windows 8 it is "Sound", but maybe one has to change it for other windows versions (and languages)
;press WIN+R, type mmsys.cpl, press Enter and look at the window title. That is the name you need.

secondDevice:= %secondDevice% - %firstDevice% ; do not change
F6:: ;the hotkey, examples of special characters: # (Windows Key), ! (Alt), ^(Control), +(Shift), ...
;e.g. to change to Ctrl+Win+S write ^#s::
;now the actually scripts starts
IfWinExist %windowName%
{
 WinClose
 WinWaitClose
}
BlockInput On ;blocks all user input
Run mmsys.cpl
WinWait %windowName%
WinWaitActive, %windowName%
Send {Down %firstDevice%}
tooltipText = %firstDeviceSelected%
ControlGet, isActive, Enabled,, button2, %windowName%
if(!isActive) ;if the first device is not active- >if it is selected
{
 Send {Down %secondDevice%}
 tooltipText = %secondDeviceSelected%
}
ControlClick, button2, %windowName%
WinClose
BlockInput Off
ToolTip %tooltipText% ; delete this tooltip, the timer and setTimer, if you do not like having a tooltip
SetTimer, RemoveToolTip, 1000
SoundPlay, *-1 ;delete, if you do not wanna hear a sound
return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return

```

Und hier die AHK als Download, wer nicht kopieren will ;)

[SoundDeviceSwitcher](http://www.pgunited.de/wp-content/uploads/2014/02/SoundDeviceSwitcher.ahk)
