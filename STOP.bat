@echo off
echo Vypinam MultiNet...
taskkill /f /im multinet.exe
taskkill /f /im tun2socks.exe
route delete 0.0.0.0 mask 0.0.0.0 10.10.10.1
echo Hotovo, bezi jen normalni ethernet.
pause