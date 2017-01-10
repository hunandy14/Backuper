@Echo Off
Title LineBackuper V1.0.1

Rem 確認是否為管理員權限
call :IsAdmin
::===========================================================
Echo 備份程序即將開始，備份時會關閉LINE
pause
Echo .
Echo 程序已經開始備份，備份位置會在此程序目錄內
Echo 　如果卡太久，嘗試按[Tab鍵]繼續
Echo .
Echo 請耐心等候正在備份中....

::設定環境變數
::cd %ProgramFiles%\WinRAR
::xcopy WinRAR.exe %SystemRoot% /Y
path=%path%;C:\Program Files\WinRAR;

::Lin主程式位置
set Line_bin=%USERPROFILE%\AppData\Local\LINE

::關閉執行程序
start "" "%Line_bin%\bin\LineLauncher.exe"
taskkill /f /im line.exe >> %Temp%\linelog.txt

::備份檔案
cd "%USERPROFILE%\AppData\Local"
rar A "%~dp0\%username%-Line.rar" LINE u –r -inul -m5 -agYYYYMMDD

::加入註解與修復紀錄3%
cd "%~dp0"
Echo LinePatch = "%%USERPROFILE%%\AppData\Local\LINE" > LinePatch.txt
rar c -zLinePatch.txt "%~dp0\%username%-Line.rar" -agYYYYMMDD
rar rr3p "%~dp0\%username%-Line.rar" -agYYYYMMDD

::重新啟動
start "" "%Line_bin%\bin\LineLauncher.exe"
Echo ============================================
Echo 備份成功，感謝您的使用
Echo 有使用上的問題，或建議歡迎回報
Echo 軟件最新版與回報請見底下Gihub網址
Echo [https://github.com/hunandy14/Backuper]
Echo ============================================
Pause
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
