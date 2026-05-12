@echo off
echo ============================================
echo  AdNabuTestStore - Search and Add to Cart
echo ============================================
echo.

cd /d "%~dp0"
C:\Python314\python.exe tests\test_search_add_to_cart.py

echo.
if %ERRORLEVEL% == 0 (
    echo [RESULT] TEST PASSED
) else (
    echo [RESULT] TEST FAILED
)
echo ============================================
pause
