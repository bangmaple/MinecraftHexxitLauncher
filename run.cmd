@echo off
color f0
title [BangMaple] Minecraft Hexxit v1.10 (MC 1.5.2)
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%b-%%a-%%c)
for /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a_%%b)
java.exe -version 2>nul
if errorlevel 1 ( set exist_java=JavaJRE khong co trong may. Su dung Java 32-bit cua Hexxit..
				  set java_loc="%appdata%\.hexxit\.minecraft\lib\jar\bin\java.exe" ) else ( 
	set exist_java=JavaJRE da duoc tim thay san trong may.
	set java_loc=java.exe
)
if not exist "%appdata%\.hexxit\javamem.bangmaple" (echo 550>"%appdata%\.hexxit\javamem.bangmaple")
set /p javamem=<"%appdata%\.hexxit\javamem.bangmaple"
set /a javamemmin=javamem/4
:menu
mode con: cols=67 lines=19
cls
echo.   - Phien ban: v1.10/GUI (Jan 26th 2019)
echo.   - %exist_java%
echo.   - Bo nho toi thieu: %javamemmin% MB; Bo nho toi da: %javamem% MB
echo     ===========================================================
echo    [  [1] Play (Choi game).                                    ]
echo    [  [2] Sao luu/Khoi phuc the gioi (Bk/Rs game's worlds).    ]
echo    [  [3] Thay doi bo nho RAM (Change reallocated memory).     ]
echo    [  [4] About Minecraft Hexxit - BangMapleProject.           ]
echo    [  [5] See more at BangMapleProject Facebook Fanpage.       ]
echo    [===========================================================]
echo    [  [6] Fix loi "Internal Server Error".                     ]
echo    [===========================================================]
echo    [  [0] Thoat (Close this launcher).                         ]
echo     ===========================================================
echo.
echo  [BangMapleProject 2019]              [fb.com/BangMapleProject]
echo.
set /p chon= -Vui long chon (Please choose): 
if %chon%==1 goto :play
if %chon%==2 goto :bk_rs_world
if %chon%==3 goto :memory_size_change
if %chon%==4 start https://bangmapleproject.blogspot.com/2014/09/minecraft-hexxit.html
if %chon%==5 start http://fb.com/BangMapleProject
if %chon%==6 goto :fix_internal_server_error
if %chon%==0 ( exit /b )
if %chon%== goto :menu
goto :menu

:bk_rs_world
mode con: cols=64 lines=10
cls
if not exist "%appdata%\.hexxit\.minecraft\saves\" (
	echo. Ban chua choi Minecraft Hexxit.
	echo. Vui long thu lai sau.
	pause >nul
	goto :menu )
if not exist "%appdata%\7z.exe" goto :menu
if not exist "%appdata%\7z.dll" goto :menu
echo   ===========================================================
echo  [         Ban muon sao luu hay sao luu the gioi.            ]
echo  [     [1] Sao luu tat the gioi.                             ]
echo  [     [2] Khoi phuc the gioi.                               ]
echo  [     [0] Quay lai menu chinh.                              ]
echo   ===========================================================
echo.
set /p backup_world= *Vui long chon: 
if %backup_world%==1 goto :backup_world
if %backup_world%==2 goto :restore_world
if %backup_world%==0 goto :menu
if %backup_world%==  goto :menu
goto :bk_rs_world

:restore_world
mode con: cols=64 lines=10
cls
echo   ===========================================================
echo  [     [1] Khoi phuc 1 hoac nhieu the gioi.                  ]
echo  [     [0] Quay lai menu chinh.                              ]
echo   ===========================================================
echo.
set /p restore_world= *Vui long chon: 
if %restore_world%==1 goto :restore_world_1
if %restore_world%==0 goto :menu
if %restore_world%==  goto :menu
goto :restore_world
:restore_world_1
cls
set /p restore_loc= *Vui long tha tha tap tin vao day: 
cls
echo.
echo. Ban co chac da nhap dung chu.
echo. - Tap tin cua ban: %restore_loc%
echo.
echo       [1] OK
echo       [0] Quay lai
set /p restore_world_1= *Vui long chon: 
if %restore_world_1%==1 goto :restore_world_2
if %restore_world_1%==0 goto :restore_world
if %restore_world_1%== goto :restore_world_1
goto :restore_world_1
:restore_world_2
mode con: cols=64 lines=10
cls
echo Step 1: - Dang khoi phuc the gioi...
"%appdata%\7z.exe" x %restore_loc% -O"%appdata%\.hexxit\.minecraft\saves\" -y >nul
if errorlevel 1 ( 
	echo Step 2: - Da xay ra loi trong khi thuc hien tien trinh..
	echo.
	echo Nhan phim bat ky de quay lai menu chinh.
	pause >nul
	goto :menu ) else (
		echo Step 2: - Thanh cong.
		echo.
		echo Da khoi phuc the gioi thanh cong.
		echo Hay giu gin no nhe.
		echo.
		echo Nhan phim bat ky de quay lai menu chinh.
		pause >nul
		goto :menu )
		
:backup_world
mode con: cols=64 lines=10
cls
if not exist "%appdata%\.hexxit\.minecraft\saves\" (
	echo. Ban chua choi Minecraft Hexxit.
	echo. Vui long thu lai sau.
	pause >nul
	goto :menu )
if not exist "%appdata%\7z.exe" goto :menu
if not exist "%appdata%\7z.dll" goto :menu
echo   ===========================================================
echo  [  Ban muon sao luu toan bo the gioi hay 1 the gioi cu the. ]
echo  [     [1] Sao luu tat ca cac the gioi.                      ]
echo  [     [2] Sao luu 1 the gioi nhat dinh.                     ]
echo  [     [0] Quay lai menu chinh.                              ]
echo   ===========================================================
echo.
set /p backup_world= *Vui long chon: 
if %backup_world%==1 goto :backup_all_world
if %backup_world%==2 goto :backup_spec_world
if %backup_world%==0 goto :menu
if %backup_world%==  goto :menu
:backup_all_world
mode con: cols=64 lines=10
cls
echo   ===========================================================
echo  [    Ban co chac la muon sao luu toan bo the gioi khong?    ]
echo  [     [1] Dong y.                                           ]
echo  [     [2] Khong, hay quay lai.                              ]
echo  [     [0] Quay lai menu chinh.                              ]
echo   ===========================================================
echo.
set /p backup_all_world= *Vui long chon: 
if %backup_all_world%==1 goto :backup_all_world_1
if %backup_all_world%==2 goto :backup_world
if %backup_all_world%==0 goto :menu
if %backup_world%==  goto :menu
:backup_all_world_1
mode con: cols=64 lines=10
cls
echo Step 1: - Dang sao luu the gioi...
"%appdata%\7z.exe" a "%userprofile%\desktop\MC_Hexxit_v1.10_SA_%mydate%__%mytime%.bangmaple" "%appdata%\.hexxit\.minecraft\saves\*" -y >nul
if errorlevel 1 ( 
	echo Step 2: - Da xay ra loi trong khi thuc hien tien trinh..
	echo.
	echo Nhan phim bat ky de quay lai menu chinh.
	pause >nul
	goto :menu ) else (
		echo Step 2: - Thanh cong.
		echo.
		echo Tap tin the gioi cua ban nam o Desktop.
		echo Hay giu gin no nhe.
		echo.
		echo Nhan phim bat ky de quay lai menu chinh.
		pause >nul
		goto :menu )

:backup_spec_world
mode con: cols=64 lines=10
cls
echo   ===========================================================
echo  [      Vui long nhap ten 1 the gioi ban muon sao luu.       ]
echo   ===========================================================
echo.
set /p backup_spec_world= *Vui long nhap: 
cls
echo. Ban da chac la ban da ghi dung ten chu.
echo.  - Ten the gioi: %backup_spec_world%
echo      [1] OK
echo      [0] Quay ve menu chinh.
set /p select_2= *Vui long chon: 
if %select_2%==1 goto :backup_spec_world_1
if %select_2%==0 goto :menu
if %select_2%== goto :backup_spec_world
goto :backup_spec_world

:backup_spec_world_1
mode con: cols=64 lines=10
cls
echo Step 1: - Dang sao luu the gioi...
"%appdata%\7z.exe" a "%userprofile%\desktop\MC_Hexxit_v1.10_S_%backup_spec_world%_%mydate%__%mytime%.bangmaple" "%appdata%\.hexxit\.minecraft\saves\%backup_spec_world%\" -y >nul
if errorlevel 1 ( 
	echo Step 2: - Da xay ra loi trong khi thuc hien tien trinh..
	echo.
	echo Nhan phim bat ky de quay lai menu chinh.
	pause >nul
	goto :menu ) else (
		echo Step 2: - Thanh cong.
		echo.
		echo Tap tin the gioi cua ban nam o Desktop.
		echo Hay giu gin no nhe.
		echo.
		echo Nhan phim bat ky de quay lai menu chinh.
		pause >nul
		goto :menu )

:memory_size_change
mode con: cols=64 lines=8
cls
echo   ===========================================================
echo  [   Vui long nhap bo nho RAM phu hop dua tren RAM cua ban.  ]
echo  [ Viec chon dung luong RAM khong hop le co the bi crash.    ]
echo  [    - Nho nhat: 400MB, Lon nhat duoc khuyen cao: 2000M -   ]
echo   ===========================================================
echo.
set /p setmem= *Vui long nhap: 
set javamem=%setmem%
set /a javamemmin=javamem/4
echo %javamem%>"%appdata%\.hexxit\javamem.bangmaple"
mode con: cols=64 lines=7
if %setmem% GTR 2000 (
	cls
	echo Canh bao. Ban dat lon hon dung luong RAM khuyen cao.
	echo - Dung luong RAM toi thieu duoc dat: %javamemmin% MB.
	echo - Dung luong RAM toi da duoc dat: %javamem% MB.
	echo.
	echo Nhan phim bat ky de quay ve menu chinh.
	pause >nul
	goto :menu )
if %setmem% LEQ 400 (
	cls
	echo Canh bao. Ban dat nho hon dung luong RAM khuyen cao.
	echo - Dung luong RAM toi thieu duoc dat: %javamemmin% MB.
	echo - Dung luong RAM toi da duoc dat: %javamem% MB.
	echo -- Dieu nay co the gay Crash!
	echo.
	echo Nhan phim bat ky de quay ve menu chinh.
	pause >nul
	goto :menu )
echo - Dung luong RAM toi thieu duoc dat: %javamemmin% MB.
echo - Dung luong RAM toi da duoc dat: %javamem% MB.
echo.
echo Nhan phim bat ky de quay ve menu chinh.
pause >nul
goto :menu

:fix_internal_server_error
mode con: cols=64 lines=8
cls
echo   ===========================================================
echo  [         Vui long nhap ten the gioi ban da tao.            ]
echo  [        - Fix loi khi choi LAN bi crash lien tuc -         ]
echo  [ Luu y: Chi thuc hien thao tac nay khi that su can thiet.  ]
echo   ===========================================================
echo.
set /p worldname= *Vui long nhap: 
echo %worldname%
rd "%appdata%\.hexxit\.minecraft\saves\%worldname%\DimensionalDoors\" /s /q
del "%appdata%\.hexxit\.minecraft\saves\%worldname%\DimensionalDoorsData" /s /q
del "%appdata%\.hexxit\.minecraft\saves\%worldname%\DimensionalDoorsDataOLD" /s /q
cls
if errorlevel 1 (
	mode con: cols=64 lines=4
	cls
	echo. - The gioi ban da nhap khong ton tai..
	echo Vui long thu lai sau.
	pause >nul
	goto :menu ) else (
		cls
		echo. - Da fix thanh cong..
		echo Nhan phim bat ky de quay lai menu chinh.
		pause >nul
		goto :menu )

:play
cls
mode con: cols=100 lines=30
set appdata=%cd%
%java_loc% -splash:"C:\Users\Administrator\Desktop\launcher.gif" -XX:+HeapDumpOnOutOfMemoryError -XX:NewRatio=3 -XX:SurvivorRatio=3 -XX:TargetSurvivorRatio=80 -XX:MaxTenuringThreshold=8 -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:MaxGCPauseMillis=10 -XX:GCPauseIntervalMillis=50 -XX:MaxGCMinorPauseMillis=7 -XX:+ExplicitGCInvokesConcurrent -XX:+UseCMSInitiatingOccupancyOnly -XX:CMSInitiatingOccupancyFraction=60 -XX:+BindGCTaskThreadsToCPUs -Xnoclassgc -Xincgc -Xms%javamemmin%M -Xmx%javamem%M -jar -Xincgc .minecraft\lib\hex.jar 2>nul
mode con: cols=50 lines=8
if errorlevel 1 (
	echo Ban da nhap sai dung luong RAM cho Java.
	echo Vui long nhap lai o muc so [3].
	pause >nul
	exit /b
	) else (
		echo BangMapleProject 2019.
		echo Cam on ban da choi Minecraft Hexxit.
		echo ===================================
		echo [ Neu nhu ban khong choi duoc..
		echo Ban da nhap sai dung luong RAM cho Java.
		echo Vui long nhap lai o muc so [3]. ]
		echo.
		pause >nul
		exit /b )
goto :menu