@Echo Off
Title LineBackuper & Color 1A

Rem 確認是否為管理員權限
call :IsAdmin
::===========================================================
Echo ============================================
Echo 注意
Echo ============================================
Echo   請確認目錄內只有一個 [*-Line*.rar]
Echo.
Echo   **確認執行後覆蓋現有檔案，請確認無誤**
Echo.
Echo   為了避免意外執行後會自動備份，檔名為LiBK
Echo   如發生意外，請手動還原LiBK到Line路徑
Echo ============================================
pause
::===========================================================
Echo 請耐心等候正在還原中....

::設定環境變數
path=%path%;C:\Program Files\WinRAR;
::cd "%ProgramFiles%\WinRAR"
::xcopy WinRAR.exe %SystemRoot% /Y

::Lin主程式位置
set Line_bin=%USERPROFILE%\AppData\Local\LINE

::關閉執行程序
start "" "%Line_bin%\bin\LineLauncher.exe"
taskkill /f /im line.exe >> %Temp%\display.txt

::防呆備份檔案
cd "%USERPROFILE%\AppData\Local"
rar A "%~dp0\LiBK.rar" LINE u –r -inul -m5 -agYYYYMMDD-nn

::加入註解與修復紀錄3%
cd "%~dp0"
Echo LinePatch = "%%USERPROFILE%%\AppData\Local\LINE" > LinePatch.txt
rar c -zLinePatch.txt LiBK.rar -agYYYYMMDD-nn
rar rr3p LiBK.rar -agYYYYMMDD-nn

::解壓縮檔案到指定位置
cd "%USERPROFILE%\AppData\Local"
rar x "%~dp0\*Line*.rar" -r -o+

::重新啟動
start "" "%Line_bin%\bin\LineLauncher.exe"
Echo ============================================
Echo 還原成功，感謝您的使用
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
