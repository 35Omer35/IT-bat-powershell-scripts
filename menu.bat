@echo off
chcp 65001 >nul
:menu
cls
echo ============================================
echo             ÖMER ÖZEN Powershell 
echo ============================================
echo [1]  AD'de bilgisayarın bulunduğu OU'yu göster
echo [2]  Bilgisayarın masaüstü veya dizüstü olduğunu kontrol et
echo [3]  Bilgisayarın BitLocker durumunu kontrol et
echo [4]  Bilgisayarın LAPS şifresini al
echo [5]  Bilgisayarın disk modelini sorgula
echo [6]  Bilgisayarın WinSAT sistem puanlarını göster
echo [7]  Oturum açmış kullanıcıları ve giriş zamanını listele
echo [8]  Ping kontrol
echo [9] C:\Windows\Temp içerisindeki gereksiz dosyaları temizle
echo [10] C:\Windows\Prefetch içerisindeki gereksiz dosyaları temizle
echo [11] C:\Windows\ccmcache içerisindeki gereksiz dosyaları temizle
echo [12] Bilgisayarı yeniden başlat
echo [13] Bilgisayarın MAC adresini al
echo [14] Bilgisayarın Windows sürüm bilgilerini al (winver)
echo [15] SNP Çakışması kontrolü
echo [16] Bilgisayarda belirli bir programı kapat
echo [17] Çıkış
echo ============================================
set /p choice=Lütfen bir seçenek seçin (1-16): 

if %choice%==1 goto script1
if %choice%==2 goto script2
if %choice%==3 goto script3
if %choice%==4 goto script4
if %choice%==5 goto script5
if %choice%==6 goto script6
if %choice%==7 goto script7
if %choice%==8 goto script8
if %choice%==9 goto script9
if %choice%==10 goto script10
if %choice%==11 goto script11
if %choice%==12 goto script12
if %choice%==13 goto script13
if %choice%==14 goto script14
if %choice%==15 goto script15
if %choice%==16 goto script16
if %choice%==17 goto script17
if %choice%==18 goto script18
if %choice%==19 goto exit
goto menu

:script1
cls
echo "AD'de bilgisayarın bulunduğu OU'yu öğrenmek için bilgisayar adını girin."
set /p pcName=Bilgisayar Adı: 
powershell -NoProfile -ExecutionPolicy Bypass -File "D:\D_powershell_scripts\script1.ps1" -ComputerName %pcName%
pause
goto menu

:script2
cls
echo "Bilgisayarın masaüstü veya dizüstü olduğunu kontrol etmek için bilgisayar adını girin."
set /p pcName=Bilgisayar Adı: 
powershell -NoProfile -ExecutionPolicy Bypass -File "D:\D_powershell_scripts\script2.ps1" -ComputerName %pcName%
pause
goto menu

:script3
cls
echo "Bilgisayarın BitLocker durumunu kontrol etmek için bilgisayar adını girin."
set /p pcName=Bilgisayar Adı: 
powershell -NoProfile -ExecutionPolicy Bypass -File "D:\D_powershell_scripts\script3.ps1" -ComputerName %pcName%
pause
goto menu

:script4
cls
echo "Bilgisayarın LAPS şifresini almak için bilgisayar adını girin."
set /p pcName=Bilgisayar Adı: 
powershell -NoProfile -ExecutionPolicy Bypass -File "D:\D_powershell_scripts\script4.ps1" -ComputerName %pcName%
pause
goto menu

:script5
cls
echo "Bilgisayarın disk modelini sorgulamak için bilgisayar adını girin."
set /p pcName=Bilgisayar Adı: 
powershell -NoProfile -ExecutionPolicy Bypass -File "D:\D_powershell_scripts\script5.ps1" -ComputerName %pcName%
pause
goto menu

:script6
cls
echo "Bilgisayarın WinSAT sistem puanlarını görmek için bilgisayar adını girin."
set /p pcName=Bilgisayar Adı: 
powershell -NoProfile -ExecutionPolicy Bypass -File "D:\D_powershell_scripts\script6.ps1" -ComputerName %pcName%
pause
goto menu

:script7
cls
echo "Bilgisayarda oturum açmış kullanıcıları ve giriş zamanını görmek için bilgisayar adını girin."
set /p pcName=Bilgisayar Adı: 
powershell -NoProfile -ExecutionPolicy Bypass -File "D:\D_powershell_scripts\script7.ps1" -ComputerName %pcName%
pause
goto menu

:script8
cls
echo "Bilgisayara ping atmak için bilgisayar adını veya IP adresini girin."
set /p pcName=Bilgisayar Adı veya IP: 
powershell -NoProfile -ExecutionPolicy Bypass -File "D:\D_powershell_scripts\script8.ps1" -ComputerName %pcName%
pause
goto menu

:script9
cls
echo "C:\Windows\Temp dizinindeki gereksiz dosyaları temizlemek için bilgisayar adını girin."
set /p pcName=Bilgisayar Adı veya IP: 
powershell -NoProfile -ExecutionPolicy Bypass -File "D:\D_powershell_scripts\script9.ps1" -ComputerName %pcName%
pause
goto menu

:script10
cls
echo "C:\Windows\Prefetch dizinindeki gereksiz dosyaları temizlemek için bilgisayar adını girin."
set /p pcName=Bilgisayar Adı veya IP: 
powershell -NoProfile -ExecutionPolicy Bypass -File "D:\D_powershell_scripts\script10.ps1" -ComputerName %pcName%
pause
goto menu

:script11
cls
echo "C:\Windows\ccmcache dizinindeki gereksiz dosyaları temizlemek için bilgisayar adını girin."
set /p pcName=Bilgisayar Adı veya IP: 
powershell -NoProfile -ExecutionPolicy Bypass -File "D:\D_powershell_scripts\script11.ps1" -ComputerName %pcName%
pause
goto menu

:script12
cls
echo "Bilgisayarı yeniden başlatmak için bilgisayar adını veya IP adresini girin."
set /p pcName=Bilgisayar Adı veya IP: 
powershell -NoProfile -ExecutionPolicy Bypass -File "D:\D_powershell_scripts\script12.ps1" -ComputerName %pcName%
pause
goto menu

:script13
cls
echo "MAC adresini almak için bilgisayar adını girin."
set /p pcName=Bilgisayar Adı: 
powershell -NoProfile -ExecutionPolicy Bypass -File "D:\D_powershell_scripts\script13.ps1" -ComputerName %pcName%
pause
goto menu

:script14
cls
echo "Windows sürüm bilgilerini almak için bilgisayar adını girin."
set /p pcName=Bilgisayar Adı veya IP: 
powershell -NoProfile -ExecutionPolicy Bypass -File "D:\D_powershell_scripts\script14.ps1" -ComputerName %pcName%
pause
goto menu

:script15
cls
echo "SNP Çakışmasını kontrol etmek için bilgisayar numarasını girin."
set /p pcNo=Bilgisayar Numarası: 
powershell -NoProfile -ExecutionPolicy Bypass -File "D:\D_powershell_scripts\script15.ps1" -ComputerNumber %pcNo%
pause
goto menu

:script16
cls
echo "Programı kapatmak için bilgisayar adını ve program adını girin."
set /p pcName=Bilgisayar Adı: 
set /p programName=Program Adı: 
powershell -NoProfile -ExecutionPolicy Bypass -File "D:\D_powershell_scripts\script16.ps1" -ComputerName %pcName% -ProgramName %programName%
pause
goto menu

:exit
exit
