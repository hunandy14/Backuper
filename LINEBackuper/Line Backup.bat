@Echo Off
Title LineBackup & Color 1A


Rem �T�{�O�_���޲z���v��
call :IsAdmin


Rem===========================================================
cd %ProgramFiles%\WinRAR
xcopy WinRAR.exe %SystemRoot% /Y

taskkill /f /im line.exe >> %Temp%\linelog.txt

cd %USERPROFILE%\AppData\Local
WinRAR.exe A %~dp0\Line.rar LINE u �Vr -inul -m5 -agYYYYMMDD

cd %~dp0
Echo LinePatch="%%USERPROFILE%%\AppData\Local\LINE" > LinePatch.txt
WinRAR.exe c -zLinePatch.txt Line.rar -agYYYYMMDD
WinRAR.exe rr3% Line.rar -agYYYYMMDD

start "" "%ProgramFiles(x86)%\LINE\LINE.exe"
Rem===========================================================
Exit




:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & �v�������A�Шϥκ޲z�����u���s�}�ҡC
 Pause & Exit
)
Cls
goto:eof
