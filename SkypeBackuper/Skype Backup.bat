@Echo Off
Title SkypeBackup & Color 1A

Rem �T�{�O�_���޲z���v��
call :IsAdmin
::===========================================================
Echo �{�Ǥw�g�}�l�ƥ��A�ƥ���m�|�b���{�ǥؿ���
Echo �@�p�G�d�Ӥ[�A���ի�[Tab��]�~��
Echo .
Echo �Э@�ߵ��ԥ��b�ƥ���....

::�]�w�����ܼ�
::cd %ProgramFiles%\WinRAR
::xcopy WinRAR.exe %SystemRoot% /Y
path=%path%;C:\Program Files\WinRAR;

::��������{��
taskkill /f /im Skype.exe >> %Temp%\display.txt

::�ƥ��ɮ�
cd %USERPROFILE%\AppData\Roaming
rar A %~dp0\%username%-Skype.rar Skype u �Vr -inul -m5 -agYYYYMMDD

::�[�J���ѻP�״_����3%
cd %~dp0
Echo SkypePatch="%%USERPROFILE%%\AppData\Roaming\Skype" > SkypePatch.txt
rar c -zSkypePatch.txt %username%-Skype.rar -agYYYYMMDD
rar rr3p %username%-Skype.rar -agYYYYMMDD

::���s�Ұ�
start "" skype

Echo �ƥ�����
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
