@Echo Off
Title LineBackup & Color 1A


Rem �T�{�O�_���޲z���v��
call :IsAdmin


Rem===========================================================
Echo �Э@�ߵ��ԥ��b�ƥ���....

::�]�w�����ܼ�
::cd %ProgramFiles%\WinRAR
::xcopy WinRAR.exe %SystemRoot% /Y
path=%path%;C:\Program Files\WinRAR;

::��������{��
taskkill /f /im line.exe >> %Temp%\linelog.txt

::�ƥ��ɮ�
cd %USERPROFILE%\AppData\Local
rar A %~dp0\%username%-Line.rar LINE u �Vr -inul -m5 -agYYYYMMDD

::�[�J���ѻP�״_����3%
cd %~dp0
Echo LinePatch="%%USERPROFILE%%\AppData\Local\LINE" > LinePatch.txt
rar c -zLinePatch.txt %username%-Line.rar -agYYYYMMDD
rar rr3p %username%-Line.rar -agYYYYMMDD

::���s�Ұ�
start "" "%ProgramFiles(x86)%\LINE\LINE.exe"

Echo �ƥ�����
Pause
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
