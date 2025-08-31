CLEAR
LOCAL lcOldPath, lcDefPath
m.lcOldPath = SET("Path")

*ON KEY LABEL ALT+D SET STEP ON

*!*	DECLARE LONG SetWindowTheme IN uxtheme.dll ;
*!*	           LONG hwnd,            ;
*!*	           STRING pszSubAppName, ;
*!*	           STRING pszSubIdList
*!*	SetWindowTheme(_vfp.Application.hWnd, "", "")

*!*	_Screen.Themes =  .F. 

*WAIT
*!*	LOCAL lni

*!*	_SCREEN.FontBold = .T.
*!*	_SCREEN.FontSize = 11


*%USERPROFILE%\appdata\roaming\microsoft\visual foxpro 9\foxuser.dbf

SET RESOURCE OFF
SELECT 0
USE SYS(2005) &&EXCLUSIVE
DELETE FOR ID="WINDBROW"
*PACK
USE
SET RESOURCE ON

*DO c:\dev\vfp\WorkDistr\WorkHelp.app 

IF 6 =MESSAGEBOX("Launch Thor?",4)
	DO ("c:\dev\vfp\VFPX\Thor-master\Installed Files\Thor\RunThor.PRG")
ENDIF

*SET COLOR OF SCHEME 1 TO ,,,,,,,,RGB(200,200,200, 31, 73, 125)
SET COLOR OF SCHEME 1 TO RGB(200,200,200, 31, 73, 125),RGB(200,200,200, 31, 73, 125),RGB(200,200,200, 31, 73, 125),RGB(200,200,200, 31, 73, 125),RGB(200,200,200, 31, 73, 125),RGB(200,200,200, 31, 73, 125),RGB(200,200,200, 31, 73, 125),RGB(200,200,200, 31, 73, 125),RGB(200,200,200, 31, 73, 125),RGB(200,200,200, 31, 73, 125)
*SET COLOR OF SCHEME 2 TO RGB(180, 153, 204, 45, 45, 45),RGB(100, 200, 100, 45, 45, 45),RGB(100, 200, 100, 45, 45, 45),RGB(100, 200, 100, 45, 45, 45),RGB(100, 200, 100, 45, 45, 45),RGB(100, 200, 100, 45, 45, 45),RGB(100, 200, 100, 45, 45, 45),RGB(100, 200, 100, 45, 45, 45),RGB(100, 200, 100, 45, 45, 45),RGB(100, 200, 100, 45, 45, 45)
SET COLOR OF SCHEME 2 TO RGB(100, 200, 100, 45, 45, 45),RGB(100, 200, 100, 45, 45, 45),RGB(100, 200, 100, 45, 45, 45),RGB(100, 200, 100, 45, 45, 45),RGB(100, 200, 100, 45, 45, 45),RGB(100, 200, 100, 45, 45, 45),RGB(100, 200, 100, 45, 45, 45),RGB(100, 200, 100, 45, 45, 45),RGB(100, 200, 100, 45, 45, 45),RGB(100, 200, 100, 45, 45, 45)
MODIFY WINDOW SCREEN FONT "Tahoma", 10 COLOR SCHEME 1 FLOAT

CLEAR

*!*	_SCREEN.BackColor = RGB(31, 73, 125) && #1f497d Похожий цвет Черного моря &&RGB(128,128,128)
*!*	_SCREEN.ForeColor = RGB(200,200,200) &&RGB(0,0,150)


*_Screen.ColorSource=5

?"Запуск my system.app"
*!*	?"Запуск foxcodeplus.app"
*!*	DO ("c:\program files (x86)\microsoft visual foxpro 9\foxcodeplus.app")

DEFINE WINDOW wBrowse FROM 10,330 TO 55,500 FONT "Tahoma", 10 NOCLOSE GROW MINIMIZE FLOAT IN DESKTOP NAME qwe1 &&FOOTER "tetst footer"
*qwe1.ShowWindow = 2 
ACTIVATE WINDOW wBrowse
*ZOOM WINDOW wBrowse MIN
*DOCK WINDOW wBrowse POSITION 3
*HIDE WINDOW wBrowse
*DEACTIVATE WINDOW wBrowse

*!*	form1 = CREATEOBJECT("MyForm")
*!*	form1.Show

*READ events

*DISPLAY STATUS TO FILE Status.txt
?SET("Library")

ACTIVATE SCREEN

*SET CONSOLE ON 

*!*	DEFINE CLASS MyForm AS Form 
*!*		ShowWindow = 2 
*!*		WindowType = 1
*!*	ENDDEFINE 

ON KEY LABEL ALT+D SET STEP ON

SET PATH TO (m.lcOldPath)

IF "work" $ SYS(0)

	m.lcDefPath = "c:\work\MainProject\" && SET("Default")
	
	IF 6 =MESSAGEBOX("Set default directory to MainProject?",4)
		m.lcDefPath = "c:\work\MainProject\"
	ENDIF

	?SYS(16)
	IF !DIRECTORY(m.lcDefPath)
		SET DEFAULT TO (SET("Default") + CURDIR())
	ELSE
		SET DEFAULT TO (m.lcDefPath)
		CD (m.lcDefPath)
	ENDIF

ENDIF
?SET("Default")+CURDIR()
