@Echo Off
Title LineBackup & Color 1A

Rem �T�{�O�_���޲z���v��
call :IsAdmin
::===========================================================
Echo �{�Ǥw�g�}�l�ƥ��A�ƥ���m�|�b���{�ǥؿ���
Echo �@�p�G�d�Ӥ[�A���ի�[Tab��]�~��
Echo .
Echo �Э@�ߵ��ԥ��b�ƥ���....

::�]�w�����ܼ�
::path=%path%;C:\Program Files\WinRAR;
cd "%ProgramFiles%\WinRAR"
xcopy WinRAR.exe %SystemRoot% /Y

::��������{��
start "" "%ProgramFiles(x86)%\LINE\LINE.exe"
taskkill /f /im line.exe >> %Temp%\linelog.txt

::�ƥ��ɮ�
cd "%USERPROFILE%\AppData\Local"
WinRAR.exe A "%~dp0\%username%-Line.rar" LINE u �Vr -inul -m5 -agYYYYMMDD

::�[�J���ѻP�״_����3%
cd %~dp0
Echo LinePatch = "%%USERPROFILE%%\AppData\Local\LINE" > LinePatch.txt
WinRAR.exe c -zLinePatch.txt %username%-Line.rar -agYYYYMMDD
WinRAR.exe rr3p %username%-Line.rar -agYYYYMMDD

::���s�Ұ�
start "" "%ProgramFiles(x86)%\LINE\LINE.exe"
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
