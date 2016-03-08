@Echo Off
Title SkypeBackup & Color 1A


Rem 確認是否為管理員權限
call :IsAdmin


Rem===========================================================
cd %ProgramFiles%\WinRAR
xcopy WinRAR.exe %SystemRoot% /Y

taskkill /f /im Skype.exe >> %Temp%\display.txt

cd %USERPROFILE%\AppData\Roaming
WinRAR.exe A %~dp0\Skype.rar Skype u –r -inul -m5 -agYYYYMMDD

cd %~dp0
Echo SkypePatch="%USERPROFILE%\AppData\Roaming\Skype" > SkypePatch.txt
WinRAR.exe c -zSkypePatch.txt Skype.rar -agYYYYMMDD
WinRAR.exe rr3% Skype.rar -agYYYYMMDD
Rem===========================================================
Exit




:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & 權限不足，請使用管理員全線重新開啟。
 Pause & Exit
)
Cls
goto:eof
