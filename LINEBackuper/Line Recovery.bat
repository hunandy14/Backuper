@Echo Off
Title LineBackup & Color 1A


Rem �T�{�O�_���޲z���v��
call :IsAdmin


Echo ============================================
Echo �`�N
Echo ============================================
Echo   �нT�{�ؿ����u���@�� [Line********.rar]
Echo   ���קK�N�~�A�����Цۦ����л\
Echo ============================================

pause
Rem===========================================================
cd %ProgramFiles%\WinRAR
xcopy WinRAR.exe %SystemRoot% /Y

taskkill /f /im line.exe >> %Temp%\display.txt

cd %USERPROFILE%\AppData\Local
WinRAR.exe x %~dp0\Line********.rar -r

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
