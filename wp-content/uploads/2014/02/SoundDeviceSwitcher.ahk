;----------------------------------------------
;   Sound Device Switcher  
;Switches between two different devices
;Author: Gleb Ostrowski (http://www.pgunited.de)
;----------------------------------------------
firstDevice = 1 ;the position of your first device in the list
secondDevice = 2 ;the position of your second device in the list
;My first and second devices are coincidentally the first and second devices on the list
firstDeviceSelected = TV set as Default ;which message should appear when the first device is selected
secondDeviceSelected = Speaker set as Default ; which message should appear when the second device is selected
windowName = Sound ;in windows 8 it is "Sound", but maybe one has to change it for other windows versions (and language)
;press WIN+R, type mmsys.cpl, press Enter and look at the window title. That is the name you need.

secondDevice:= %secondDevice% - %firstDevice% ; do not change
F6:: ;the hotkey, examples of special characters:  # (Windows Key), ! (Alt), ^(Control), +(Shift), ...
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








