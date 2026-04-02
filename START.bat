@echo off
echo Spoustim MultiNet...
start "" "C:\MultiNet\multinet.exe" -cfg "C:\MultiNet\config.yaml"
timeout /t 2 >nul

echo Spoustim tun2socks...
start "" "C:\MultiNet\tun2socks.exe" -device wintun -proxy socks5://127.0.0.1:1080
timeout /t 5 >nul

echo Nastavuji sit...
netsh interface ipv4 set address name=wintun source=static address=10.10.10.1 mask=255.255.255.0
netsh interface ipv4 set dnsservers name=wintun static address=8.8.8.8 register=none validate=no
route add 0.0.0.0 mask 0.0.0.0 10.10.10.1 metric 1

echo HOTOVO! Obe linky jsou aktivni.
pause