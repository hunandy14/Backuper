@Echo Off
Title SkypeBackup & Color 1A


Rem �T�{�O�_���޲z���v��
call :IsAdmin


Rem===========================================================
cd %ProgramFiles%\WinRAR
xcopy WinRAR.exe %SystemRoot% /Y

taskkill /f /im Skype.exe >> %Temp%\display.txt

cd %USERPROFILE%\AppData\Roaming
WinRAR.exe A %~dp0\Skype.rar Skype u �Vr -inul -m5 -agYYYYMMDD

cd %~dp0
Echo SkypePatch="%USERPROFILE%\AppData\Roaming\Skype" > SkypePatch.txt
WinRAR.exe c -zSkypePatch.txt Skype.rar -agYYYYMMDD
WinRAR.exe rr3% Skype.rar -agYYYYMMDD
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
