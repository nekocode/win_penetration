# win_penetration

powered by [nishang](https://github.com/samratashok/nishang), [PowerSploit](https://github.com/mattifestation/PowerSploit)

### main behaviour
- bypass UAC and extract payload to tmp directory
- run the payload script
    - add powershell root path to env path
	- copy self to temp path and powershell root path
    - turn of the LUA and firewall
	- add persistence
	- register self to auto-run
	- dump login user password
	- run PowerShellTcp listenning on 192.168.10.99:8099

### todo
- [ ] rewrite build script by using python lang
- [ ] rookit (DLL inject)
- [ ] auto-run with high authority