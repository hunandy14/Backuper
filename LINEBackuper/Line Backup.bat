@Echo Off
Title LineBackuper V1.0.1

Rem �T�{�O�_���޲z���v��
call :IsAdmin
::===========================================================
Echo �ƥ��{�ǧY�N�}�l�A�ƥ��ɷ|����LINE
pause
Echo .
Echo �{�Ǥw�g�}�l�ƥ��A�ƥ���m�|�b���{�ǥؿ���
Echo �@�p�G�d�Ӥ[�A���ի�[Tab��]�~��
Echo .
Echo �Э@�ߵ��ԥ��b�ƥ���....

::�]�w�����ܼ�
::cd %ProgramFiles%\WinRAR
::xcopy WinRAR.exe %SystemRoot% /Y
path=%path%;C:\Program Files\WinRAR;

::Lin�D�{����m
set Line_bin=%USERPROFILE%\AppData\Local\LINE

::��������{��
start "" "%Line_bin%\bin\LineLauncher.exe"
taskkill /f /im line.exe >> %Temp%\linelog.txt

::�ƥ��ɮ�
cd "%USERPROFILE%\AppData\Local"
rar A "%~dp0\%username%-Line.rar" LINE u �Vr -inul -m5 -agYYYYMMDD

::�[�J���ѻP�״_����3%
cd "%~dp0"
Echo LinePatch = "%%USERPROFILE%%\AppData\Local\LINE" > LinePatch.txt
rar c -zLinePatch.txt "%~dp0\%username%-Line.rar" -agYYYYMMDD
rar rr3p "%~dp0\%username%-Line.rar" -agYYYYMMDD

::���s�Ұ�
start "" "%Line_bin%\bin\LineLauncher.exe"
Echo ============================================
Echo �ƥ����\�A�P�±z���ϥ�
Echo ���ϥΤW�����D�A�Ϋ�ĳ�w��^��
Echo �n��̷s���P�^���Ш����UGihub���}
Echo [https://github.com/hunandy14/Backuper]
Echo ============================================
Pause
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
