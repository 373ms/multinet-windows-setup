# MultiNet Windows Setup — Combine Two Internet Connections for Faster Downloads

Speed up game downloads (Steam, Riot, etc.) by combining 
your home ethernet and a second internet connection simultaneously.

## My Results
- Normal speed: ~2.5 MB/s
- With MultiNet: ~4.8 MB/s (nearly 2x faster!)

## How It Works
- **MultiNet** splits parallel download connections across two network adapters
- **tun2socks** routes all system traffic through MultiNet transparently
- Works best with apps that use multiple parallel connections (Steam, Riot, etc.)

## Requirements
- Windows 10/11
- A second internet connection, for example:
  - Android or iPhone via USB tethering
  - Android or iPhone via mobile hotspot (connected via WiFi or USB)
  - A second WiFi network
  - Any other network adapter with internet access

## Credits
- [MultiNet](https://github.com/NadeenUdantha/multinet) by NadeenUdantha
- [tun2socks](https://github.com/xjasonlyu/tun2socks) by xjasonlyu
- [Wintun](https://wintun.net) driver

## Setup Guide

### Step 1 — Connect your second internet source
Connect your second internet source to your PC. For example:
- **USB tethering** (Android or iPhone): connect via USB cable and enable 
  USB tethering in phone settings
- **Mobile hotspot**: connect your PC to your phone's hotspot via WiFi
- **Second WiFi**: connect a USB WiFi adapter to a second network

### Step 2 — Find your IP addresses
Open cmd and run `ipconfig`. Note down:
- Your primary ethernet IPv4 address (e.g. `192.168.1.x`)
- Your second connection IPv4 address (e.g. `10.x.x.x`)

### Step 3 — Edit config.yaml
```yaml
algorithm: weighted-lru
listen: 127.0.0.1:1080
paths:
  - type: direct
    addr: YOUR_PRIMARY_IP       # e.g. 192.168.1.61
  - type: direct
    addr: YOUR_SECOND_IP        # e.g. 10.25.42.1
```

### Step 4 — Run
1. Right-click `START.bat` → **Run as administrator**
2. Start downloading in Steam, Riot, etc.
3. When done, right-click `STOP.bat` → **Run as administrator**

## Important Notes
- Always run START.bat and STOP.bat as **administrator**
- Your second connection IP may change — if speed doesn't improve, 
  run `ipconfig` and update config.yaml with the new IP
- Keep the two cmd windows (MultiNet + tun2socks) open while downloading
- No need to run this during gaming, only when downloading
- The more parallel connections the download client uses, the bigger 
  the speed improvement (Steam, Riot and most game launchers work great)
