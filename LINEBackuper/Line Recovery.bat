@Echo Off
Title LineBackup & Color 1A

Rem �T�{�O�_���޲z���v��
call :IsAdmin
::===========================================================
Echo ============================================
Echo �`�N
Echo ============================================
Echo   �нT�{�ؿ����u���@�� [*-Line*.rar]
Echo.
Echo   **�T�{������л\�{���ɮסA�нT�{�L�~**
Echo.
Echo   ���F�קK�N�~�����|�۰ʳƥ��A�ɦW��LiBK
Echo   �p�o�ͷN�~�A�Ф���٭�LiBK��Line���|
Echo ============================================
pause
::===========================================================
Echo �Э@�ߵ��ԥ��b�٭줤....

::�]�w�����ܼ�
path=%path%;C:\Program Files\WinRAR;
::cd "%ProgramFiles%\WinRAR"
::xcopy WinRAR.exe %SystemRoot% /Y

::��������{��
start "" "%ProgramFiles(x86)%\LINE\LINE.exe"
taskkill /f /im line.exe >> %Temp%\display.txt

::���b�ƥ��ɮ�
cd "%USERPROFILE%\AppData\Local"
rar A "%~dp0\LiBK.rar" LINE u �Vr -inul -m5 -agYYYYMMDD-nn

::�[�J���ѻP�״_����3%
cd "%~dp0"
Echo LinePatch = "%%USERPROFILE%%\AppData\Local\LINE" > LinePatch.txt
rar c -zLinePatch.txt LiBK.rar -agYYYYMMDD-nn
rar rr3p LiBK.rar -agYYYYMMDD-nn

::�����Y�ɮר���w��m
cd "%USERPROFILE%\AppData\Local"
rar x "%~dp0\*Line*.rar" -r -o+

::���s�Ұ�
start "" "%ProgramFiles(x86)%\LINE\LINE.exe"
Echo ============================================
Echo �٭즨�\�A�P�±z���ϥ�
Echo ���ϥΤW�����D�A�Ϋ�ĳ�w��^��
Echo �n��̷s���P�^���Ш����UGihub���}
Echo [https://github.com/hunandy14/Backuper]
Echo ============================================
pause
Exit
::===========================================================
:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & �v�������A�Шϥκ޲z�����u���s�}�ҡC
 Pause & Exit
)
Cls
goto:eof
