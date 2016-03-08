@Echo Off
Title SkypeBackup & Color 1A


Rem 確認是否為管理員權限
call :IsAdmin


Echo ============================================
Echo 注意
Echo ============================================
Echo   請確認目錄內只有一個 [Skype********.rar]
Echo   為避免意外，執行後請自行選擇覆蓋
Echo ============================================

pause
Rem===========================================================
cd %ProgramFiles%\WinRAR
xcopy WinRAR.exe %SystemRoot% /Y

taskkill /f /im line.exe >> %Temp%\display.txt

cd %USERPROFILE%\AppData\Roaming\
WinRAR.exe x %~dp0\Skype********.rar -r

start skype
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
