@Echo Off
Title LineBackup & Color 1A

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
taskkill /f /im line.exe >> %Temp%\linelog.txt

::備份檔案
cd %USERPROFILE%\AppData\Local
rar A %~dp0\%username%-Line.rar LINE u –r -inul -m5 -agYYYYMMDD

::加入註解與修復紀錄3%
cd %~dp0
Echo LinePatch="%%USERPROFILE%%\AppData\Local\LINE" > LinePatch.txt
rar c -zLinePatch.txt %username%-Line.rar -agYYYYMMDD
rar rr3p %username%-Line.rar -agYYYYMMDD

::重新啟動
start "" "%ProgramFiles(x86)%\LINE\LINE.exe"

Echo 備份完畢
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
