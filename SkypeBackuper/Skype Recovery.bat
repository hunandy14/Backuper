@Echo Off
Title SkypeBackuper & Color 1A

Rem �T�{�O�_���޲z���v��
call :IsAdmin
::===========================================================
Echo ============================================
Echo �`�N
Echo ============================================
Echo   �нT�{�ؿ����u���@�� [*-Skype*.rar]
Echo.
Echo   **�T�{������л\�{���ɮסA�нT�{�L�~**
Echo.
Echo   ���F�קK�N�~�����|�۰ʳƥ��A�ɦW��SkBK
Echo   �p�o�ͷN�~�A�Ф���٭�SkBK��Skype���|
Echo ============================================
pause
::===========================================================
Echo �Э@�ߵ��ԥ��b�٭줤....

::�]�w�����ܼ�
path=%path%;C:\Program Files\WinRAR;
::cd "%ProgramFiles%\WinRAR"
::xcopy WinRAR.exe %SystemRoot% /Y

::��������{��
start "" skype
taskkill /f /im Skype.exe >> %Temp%\display.txt

::���b�ƥ��ɮ�
cd "%USERPROFILE%\AppData\Roaming"
rar A "%~dp0\SkBK.rar" Skype u �Vr -inul -m5 -agYYYYMMDD-nn

::�[�J���ѻP�״_����3%
cd "%~dp0"
Echo SkypePatch = "%%USERPROFILE%%\AppData\Roaming\Skype" > SkypePatch.txt
rar c -zSkypePatch.txt SkBK.rar -agYYYYMMDD-nn
rar rr3p SkBK.rar -agYYYYMMDD-nn

::�����Y�ɮר���w��m
cd "%USERPROFILE%\AppData\Roaming\"
rar x "%~dp0\*Skype*.rar" -r -o+

::���s�Ұ�
start "" skype
Echo ============================================
Echo �٭즨�\�A�P�±z���ϥ�
Echo ���ϥΤW�����D�A�Ϋ�ĳ�w��^������
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
