@echo off
rem Chay cabin_check cho Lab Day12, ma G05. Dat file export (.zip) o goc repo roi chay:
rem   lab12_check.cmd A      -> part_A.zip       -> check_cpA.txt
rem   lab12_check.cmd B      -> part_B.zip       -> check_cpB.txt
rem   lab12_check.cmd final  -> export_final.zip -> check_final.txt
rem   lab12_check.cmd diff   -> export_final.zip + peer_export_final.zip -> disagreement_log.csv
rem   lab12_check.cmd v2     -> export_final_v2.zip -> check_final_v2.txt
setlocal
chcp 65001 >nul
set "SUB=%~dp0"
set "CK=%~dp0scripts\cabin_check.py"
set "MAN=%~dp0G05\oms\manifest.csv"
set PY=python
where python >nul 2>nul || set PY=py
if /i "%1"=="A"     %PY% "%CK%" check "%SUB%part_A.zip" --only S01,S02 --expect 4 --manifest "%MAN%" --out "%SUB%check_cpA.txt" & goto end
if /i "%1"=="B"     %PY% "%CK%" check "%SUB%part_B.zip" --only D01,D02 --expect 2 --manifest "%MAN%" --out "%SUB%check_cpB.txt" & goto end
if /i "%1"=="final" %PY% "%CK%" check "%SUB%export_final.zip" --expect 22 --manifest "%MAN%" --out "%SUB%check_final.txt" & goto end
if /i "%1"=="v2"    %PY% "%CK%" check "%SUB%export_final_v2.zip" --expect 22 --manifest "%MAN%" --out "%SUB%check_final_v2.txt" & goto end
if /i "%1"=="diff"  %PY% "%CK%" diff "%SUB%export_final.zip" "%SUB%peer_export_final.zip" --csv "%SUB%disagreement_log.csv" & goto end
echo Dung: lab12_check.cmd A ^| B ^| final ^| diff ^| v2
:end
echo.
echo Exit code: %errorlevel%  (0 = khong loi, 1 = co loi, 2 = khong doc duoc file)
pause
