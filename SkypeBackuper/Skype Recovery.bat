@Echo Off
Title SkypeBackup & Color 1A


Rem �T�{�O�_���޲z���v��
call :IsAdmin


Echo ============================================
Echo �`�N
Echo ============================================
Echo   �нT�{�ؿ����u���@�� [Skype********.rar]
Echo   ���קK�N�~�A�����Цۦ����л\
Echo ============================================

pause
Rem===========================================================
cd %ProgramFiles%\WinRAR
xcopy WinRAR.exe %SystemRoot% /Y

taskkill /f /im Skype.exe >> %Temp%\display.txt

cd %USERPROFILE%\AppData\Roaming\
WinRAR.exe x %~dp0\Skype********.rar -r

start "" skype
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
