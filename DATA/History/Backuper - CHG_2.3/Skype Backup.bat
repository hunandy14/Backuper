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
::path=%path%;C:\Program Files\WinRAR;
cd "%ProgramFiles%\WinRAR"
xcopy WinRAR.exe %SystemRoot% /Y

::��������{��
start "" skype
taskkill /f /im Skype.exe >> %Temp%\display.txt

::�ƥ��ɮ�
cd "%USERPROFILE%\AppData\Roaming"
WinRAR.exe A "%~dp0\%username%-Skype.rar" Skype u �Vr -inul -m5 -agYYYYMMDD

::�[�J���ѻP�״_����3%
cd "%~dp0"
Echo SkypePatch = "%%USERPROFILE%%\AppData\Roaming\Skype" > SkypePatch.txt
WinRAR.exe c -zSkypePatch.txt %username%-Skype.rar -agYYYYMMDD
WinRAR.exe rr3p %username%-Skype.rar -agYYYYMMDD

::���s�Ұ�
start "" skype
Echo ============================================
Echo �ƥ����\�A�P�±z���ϥ�
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