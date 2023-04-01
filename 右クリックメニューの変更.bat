@echo off
echo 制作：https://github.com/KAZUSANNN
echo ←
echo ←
echo このソフトではWindows11の右クリックメニューを標準のもの・Windows10のものへの変更を行います。
echo 標準のものに変更する場合は、win11。windows10のものに変更する場合は、win10を入力してください。
echo 入力後のダイアログで、OKを押すとサインアウトを実行し、処理を適応します。保存していないものがある場合は実行前に保存をしておいてください。
color 90
echo ←
echo ←
SET /P selected="右クリックメニューの方式を選択してください。(win10=windows10 / win11=windows11)"

if /i {%selected%}=={win10} (goto :windows10)

if /i {%selected%}=={windows10} (goto :windows10)



:windows11
reg.exe delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
@echo off
echo MsgBox "Windows11の方式に変更しました。 OKを押すとサインアウトします。",vbInformation,"情報" > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs 
del /Q %TEMP%\msgbox.vbs
C:\Windows\System32\shutdown.exe -l
goto exitlabel

:windows10
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
@echo off
echo MsgBox "Windows10の方式に変更しました。 OKを押すとサインアウトします。",vbInformation,"情報" > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs 
del /Q %TEMP%\msgbox.vbs
C:\Windows\System32\shutdown.exe -l
goto exitlabel
:exitlabel
