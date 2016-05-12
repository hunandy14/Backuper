@Echo Off
Title SkypeBackup & Color 1A

Rem 確認是否為管理員權限
call :IsAdmin
::===========================================================
Echo 程序已經開始備份，備份位置會在此程序目錄內
Echo 　如果卡太久，嘗試按[Tab鍵]繼續
Echo .
Echo 請耐心等候正在備份中....

::設定環境變數
::cd %ProgramFiles%\WinRAR
::xcopy WinRAR.exe %SystemRoot% /Y
path=%path%;C:\Program Files\WinRAR;

::關閉執行程序
start "" skype
taskkill /f /im Skype.exe >> %Temp%\display.txt

::備份檔案
cd %USERPROFILE%\AppData\Roaming
rar A %~dp0\%username%-Skype.rar Skype u –r -inul -m5 -agYYYYMMDD

::加入註解與修復紀錄3%
cd %~dp0
Echo SkypePatch="%%USERPROFILE%%\AppData\Roaming\Skype" > SkypePatch.txt
rar c -zSkypePatch.txt %username%-Skype.rar -agYYYYMMDD
rar rr3p %username%-Skype.rar -agYYYYMMDD

::重新啟動
start "" skype
Echo ============================================
Echo 備份成功，感謝您的使用
Echo 有使用上的問題，或建議歡迎回報
Echo 軟件最新版與回報請見底下Gihub網址
Echo [https://github.com/hunandy14/Backuper]
Echo ============================================
pause
Exit
::===========================================================
:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & 權限不足，請使用管理員全線重新開啟。
 Pause & Exit
)
Cls
goto:eof
